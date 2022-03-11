//
//  DownloadingImagesViewModel.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 11/03/22.
//

import Foundation
import Combine

class DownloadingImagesViewModel: ObservableObject {
    @Published var dataArray: [PhotoModel] = []
    let dataService = PhotoModelDataService.instance
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$photoModels  // it is publisher
            .sink { [weak self] returnedPhotoModels in
                guard let self = self else { return }
                self.dataArray = returnedPhotoModels
            }
            .store(in: &cancellables)
    }
}
