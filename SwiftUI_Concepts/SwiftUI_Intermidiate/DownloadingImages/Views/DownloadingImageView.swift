//
//  DownloadingImageView.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 11/03/22.
//

import SwiftUI

struct DownloadingImageView: View {
    @StateObject var loader: ImageLoadingViewModel
    
    init(url: String, key: String) {
        _loader = StateObject(wrappedValue: ImageLoadingViewModel(url: url, key: key))
    }
    
    var body: some View {
        imageSection
    }
}

struct DownloadingImageView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImageView(url: "https://via.placeholder.com/600/92c952", key: "1")
            .frame(width: 75, height: 75)
            .previewLayout(.sizeThatFits)
    }
}

extension DownloadingImageView {
    private var imageSection: some View {
        ZStack {
            if loader.isLoading {
                ProgressView()
            } else if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
            }
        }
    }
}

/*
 note: we cannot pass in the url from this init into the ViewModel
 as both init(){} & @StateObject var vm = ImageLoadingViewModel()
 getting initialized at the same time.
 */
