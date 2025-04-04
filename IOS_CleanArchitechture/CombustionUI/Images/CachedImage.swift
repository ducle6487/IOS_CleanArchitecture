//
//  CachedImage.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

public enum ImagePhase: Equatable {
    case loading
    case loaded(Image)
}

class ImageContainer {
    var image: Image

    init(image: Image) {
        self.image = image
    }
}

public struct CachedImage<Content: View>: View {
    @Inject(\.urlSession) var urlSession
    @Inject(\.imageCache) var cache

    private var url: String
    private var content: (ImagePhase) -> Content
    @State var isLoading: Bool = false

    public init(url: String, @ViewBuilder content: @escaping (ImagePhase) -> Content) {
        self.url = url
        self.content = content
    }

    public var body: some View {
        Group {
            if let container = cache.object(forKey: url as NSString) {
                content(.loaded(container.image))
            } else {
                content(.loading)
                    .task {
                        do {
                            isLoading = true
                            try await fetchImage()
                        } catch {
                            // Handle the error, e.g., show an error message or fallback content
                            print("Error fetching image: \(error)")
                        }
                    }
            }
        }
        .shimmering(active: isLoading)
    }

    @MainActor
    private func fetchImage() async throws {
        guard let fetchUrl = URL(string: url) else { throw URLError(.badURL) }
        let (data, _) = try await urlSession.data(from: fetchUrl)
        guard let uiImage = UIImage(data: data) else { throw URLError(.cannotDecodeRawData) }
        let image = Image(uiImage: uiImage)
        cache.setObject(ImageContainer(image: image), forKey: url as NSString)
        isLoading = false
    }
}

extension DependencyMap {
    private struct ImageCacheKey: DependencyKey {
        static var dependency = NSCache<NSString, ImageContainer>()
    }

    var imageCache: NSCache<NSString, ImageContainer> {
        get { resolve(key: ImageCacheKey.self) }
        set { register(key: ImageCacheKey.self, dependency: newValue) }
    }
}
