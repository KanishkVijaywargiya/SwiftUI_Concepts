//
//  DownloadingImagesRow.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 11/03/22.
//

import SwiftUI

struct DownloadingImagesRow: View {
    let item: PhotoModel
    
    var body: some View {
        rowSection
    }
}

struct DownloadingImagesRow_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImagesRow(item: PhotoModel(albumId: 1, id: 1, title: "Title", url: "https://via.placeholder.com/600/51aa97", thumbnailUrl: "https://via.placeholder.com/600/51aa97"))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

extension DownloadingImagesRow {
    private var rowSection: some View {
        HStack {
            DownloadingImageView(url: item.url, key: "\(item.id)")
                .frame(width: 75, height: 75)
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                Text(item.url)
                    .foregroundColor(.gray)
                    .italic()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
