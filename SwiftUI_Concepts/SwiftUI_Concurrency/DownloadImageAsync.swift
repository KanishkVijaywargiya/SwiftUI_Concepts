//
//  DownloadImageAsync.swift
//  SwiftUI_Concepts
//
//  Created by Kanishk Vijaywargiya on 02/03/23.
//

import SwiftUI
import Combine

class DownloadImageAsyncImageLoader {
    let url = URL(string: "https://picsum.photos/200")!
    
    func handleResponse(data: Data?, response: URLResponse?) -> UIImage? {
        guard
            let data,
            let image = UIImage(data: data),
            let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300
        else {
            return nil
        }
        return image
    }
    
    func downloadWithEscaping(completionHandler: @escaping (_ image: UIImage?, _ error: Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            let image = self?.handleResponse(data: data, response: response)
            
            completionHandler(image, nil)
        }.resume()
    }
    
    func downloadWithCombine() -> AnyPublisher<UIImage?, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(handleResponse)
            .mapError({ $0 })
            .eraseToAnyPublisher()
    }
    
    func downloadWithAsync() async throws -> UIImage? {
        do {
            let (data, response) = try await URLSession.shared.data(from: url, delegate: nil)
            return handleResponse(data: data, response: response)
        } catch {
            throw error
        }
    }
}

class DownloadImageAsyncViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    let loader = DownloadImageAsyncImageLoader()
    var cancellables = Set<AnyCancellable>()
    
    func fetchImage() async {
        let image = try? await loader.downloadWithAsync()
        await MainActor.run {
            self.image = image
        }
        
        //        loader.downloadWithCombine()
        //            .receive(on: DispatchQueue.main)
        //            .sink { _ in
        //
        //            } receiveValue: { [weak self] image in
        //                self?.image = image
        //            }
        //            .store(in: &cancellables)
        
        //        loader.downloadWithEscaping { [weak self] image, error in
        //            DispatchQueue.main.async {
        //                self?.image = image
        //            }
        //        }
    }
}

struct DownloadImageAsync: View {
    @StateObject private var vm = DownloadImageAsyncViewModel()
    @State private var changeShape: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                if #available(iOS 16.0, *) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                        .clipShape(changeShape ? AnyShape(Circle()) : AnyShape(RoundedRectangle(cornerRadius: 22, style: .continuous)))
                        .shadow(color: colorScheme == .dark ? .white.opacity(0.8) : .black.opacity(0.8), radius: 10)
                        .onTapGesture {
                            changeShape.toggle()
                        }
                } else {
                    // Fallback on earlier versions
                }
            }
        }
        .onAppear {
            Task { await vm.fetchImage() }
            //            //vm.fetchImage()
        }
    }
}

struct DownloadImageAsync_Previews: PreviewProvider {
    static var previews: some View {
        DownloadImageAsync()
    }
}
