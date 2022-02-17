//
//  AsyncImgBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 16/02/22.
//

import SwiftUI

struct AsyncImgBootcamp: View {
    let url = URL(string: "https://picsum.photos/400")
    
    var body: some View {
        //        AsyncImage(url: url)
        //        AsyncImage(url: url) { returneedImage in
        //            returneedImage
        //                .cornerRadius(20)
        //        } placeholder: {
        //            ProgressView()
        //        }
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .cornerRadius(20)
            case .failure:
                Image(systemName: "questionmark")
                    .font(.headline)
            default:
                Image(systemName: "questionmark")
                    .font(.headline)
            }
        }
        
    }
}

struct AsyncImgBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImgBootcamp()
    }
}
