//
//  ImageLoadingViewModel.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 11/03/22.
//

import Foundation
import SwiftUI
import Combine

class ImageLoadingViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    var cancellables = Set<AnyCancellable>()
    
    let manager = PhotoModelCacheManager.instance
    let fileManager = PhotoModelFileManager.instance
    
    let urlString: String
    let imageKey: String
    
    init(url: String, key: String) {
        urlString = url
        imageKey = key
        //getImage()
        saveImage()
    }
    
    // file manager
    func saveImage() {
        if let savedImage = fileManager.getImage(name: imageKey) {
            image = savedImage
            print("Images is getting stored in File manager")
        } else {
            downloadImage()
            print("Downloading image now!")
        }
    }
    
    // cache manager
    func getImage() {
        if let savedImage = manager.get(name: imageKey) {
            image = savedImage
            print("Getting saved images!")
        } else {
            downloadImage()
            print("Downloading image now!")
        }
    }
    
    func downloadImage() {
        print("Downloading image now!")
        isLoading = true
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        
        URLSession.shared
            .dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                guard
                    let self = self,
                    let image = returnedImage else { return }
                self.image = image
                //self.manager.add(image: image, name: self.imageKey)
                self.fileManager.saveImage(image: image, name: self.imageKey)
            }
            .store(in: &cancellables)
    }
}
