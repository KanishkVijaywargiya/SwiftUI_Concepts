//
//  DownloadWithCombineBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 08/03/22.
//

import SwiftUI

struct DownloadWithCombineBootcamp: View {
    @StateObject var vm = DownloadWithCombineViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts2) { post in
                LazyVStack(alignment: .leading) {
                    Text(post.title).font(.headline)
                    Text(post.body).foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct DownloadWithCombineBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DownloadWithCombineBootcamp()
    }
}
