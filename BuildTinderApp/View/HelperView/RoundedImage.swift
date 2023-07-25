//
//  RoundedImage.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/19/23.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?

    private static let cache = NSCache<NSURL, UIImage>()

    init(url: URL?) {
        if let image = Self.cache.object(forKey: url! as NSURL) {
            self.image = image
            return
        }

        cancellable = URLSession.shared.dataTaskPublisher(for: url!)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                if let image = $0 {
                    Self.cache.setObject(image, forKey: url! as NSURL)
                }
                self?.image = $0
            }
    }

    deinit {
        cancellable?.cancel()
    }
}

struct AsyncImageView: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Image

    init(url: URL?, placeholder: Image = Image(systemName: "photo")) {
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
        self.placeholder = placeholder
    }

    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
    }

    private var image: Image {
        if let image = loader.image {
            return Image(uiImage: image)
        } else {
            return placeholder
        }
    }
}

struct RoundedImage: View {
    var url: URL?
    var body: some View {
       
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())

        } placeholder: {
            Circle().foregroundColor(.gray)
        }
        
//        WebImage(url: url)
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .clipShape(Circle())
    }
}

struct RoundedImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImage(url: URL(string: "https://picsum.photos/400"))
    }
}


