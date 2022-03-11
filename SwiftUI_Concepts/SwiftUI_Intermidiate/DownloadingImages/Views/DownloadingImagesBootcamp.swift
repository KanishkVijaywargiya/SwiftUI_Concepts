//
//  DownloadingImagesBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 11/03/22.
//

import SwiftUI

struct DownloadingImagesBootcamp: View {
    @StateObject var vm = DownloadingImagesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.dataArray) { item in
                    DownloadingImagesRow(item: item)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Downloading Inages!")
        }
    }
}

struct DownloadingImagesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImagesBootcamp()
    }
}

/**** Topics to be covered in this mini prj.
 1]. background threads .
 2]. weak self .
 3]. Combine .
 4]. Publishers & Subscribers .
 5]. FileManager
 6]. NSCache
 7]. Codable .
 ***/
// for emoji keyboard shortcut is :- cmd + ctrl + space_bar
