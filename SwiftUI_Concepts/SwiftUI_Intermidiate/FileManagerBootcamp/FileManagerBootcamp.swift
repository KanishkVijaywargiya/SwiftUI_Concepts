//
//  FileManagerBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 10/03/22.
//

import SwiftUI

struct FileManagerBootcamp: View {
    @StateObject var vm = FileManagerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                
                HStack {
                    Button(action: {vm.saveImage()}) {
                        Text("Save to FM").font(.headline)
                    }
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.green)
                    .cornerRadius(10)
                    
                    Button(action: {vm.deleteImage()}) {
                        Text("Delete from FM").font(.headline)
                    }
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.red)
                    .cornerRadius(10)
                }
                
                Text(vm.infoMessage)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.purple)
                
                Button(action: {vm.deleteFolder()}) {
                    Text("Delete Folder from FM").font(.headline)
                }
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(Color.blue)
                .cornerRadius(10)
                
                
                Spacer()
            }
            .navigationTitle("File Manager")
        }
    }
}

struct FileManagerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FileManagerBootcamp()
    }
}
