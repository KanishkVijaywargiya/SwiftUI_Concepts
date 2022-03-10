//
//  CacheBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 10/03/22.
//

import SwiftUI

struct CacheBootcamp: View {
    @StateObject var vm = CacheViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = vm.startingImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                
                Text(vm.infoMessage)
                    .font(.headline)
                    .foregroundColor(.purple)
                
                HStack {
                    Button(action: {vm.saveToCache()}) {
                        Text("Save to cache")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {vm.removeFromCache()}) {
                        Text("Delete from cache")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                }
                
                Button(action: {vm.getFromCache()}) {
                    Text("Get from cache")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                
                if let image2 = vm.cachedImage {
                    Image(uiImage: image2)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .navigationTitle("Cache Bootcamp")
        }
    }
}

struct CacheBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CacheBootcamp()
    }
}
