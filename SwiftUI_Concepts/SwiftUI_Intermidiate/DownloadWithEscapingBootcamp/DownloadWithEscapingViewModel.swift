//
//  DownloadWithEscapingViewModel.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 07/03/22.
//

import Foundation

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithEscapingViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    
    init() {
        getPost()
    }
    
    func getPost() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        downloadData(fromURL: url) { returnedData in
            if let data = returnedData {
                // decoding
                //guard let newPosts = try? JSONDecoder().decode(PostModel.self, from: data) else { return }
                guard let newPosts = try? JSONDecoder().decode([PostModel].self, from: data) else { return }
                
                // main thread & make it as a weak self
                DispatchQueue.main.async { [weak self] in
                    self?.posts = newPosts
                    //self?.posts.append(newPost)
                }
            } else {
                print("no data returned")
            }
        }
    }
    
    func downloadData(fromURL url: URL, completionHandler: @escaping (_ data: Data?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                    print("Error downloading data!")
                    completionHandler(nil)
                    return
                }
            
            completionHandler(data)
            
            /***
            print("Successfully downloaded data!")
            print(data)
            let jsonString = String(data: data, encoding: .utf8)
            print(jsonString)
            **/
        }.resume()
    }
}

//https://jsonplaceholder.typicode.com/posts/1
//https://jsonplaceholder.typicode.com/posts
