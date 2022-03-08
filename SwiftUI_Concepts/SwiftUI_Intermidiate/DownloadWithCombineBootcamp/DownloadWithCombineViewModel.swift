//
//  DownloadWithCombineViewModel.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 08/03/22.
//

import Foundation
import Combine

struct PostModel2: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
    @Published var posts2: [PostModel2] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        /**** COMBINE STEPS :-
         1]. create the publisher
         2]. subscribe the publisher on background thread
         3]. receive on main thread
         4]. tryMap (to check data is good)
         5]. decode (decode data into PostModel2)
         6]. sink (put the item in our app)
         7]. store (cancel subscription if needed)
         ***/
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
        //            .tryMap { (data, response) -> Data in
        //                guard
        //                    let response = response as? HTTPURLResponse,
        //                    response.statusCode >= 200 && response.statusCode < 300 else {
        //                        throw URLError(.badServerResponse) //throw URLError(URLError.Code)
        //                    }
        //                return data
        //            }
            .decode(type: [PostModel2].self, decoder: JSONDecoder())
            .replaceError(with: []) // this is a little handy trick, so to use .sink() without completion
            .sink(receiveValue: { [weak self] returnedPosts in
                self?.posts2 = returnedPosts
            })
//            .sink { completion in
//                switch completion {
//                case .finished:
//                    print("FINISHED")
//                case .failure(let error):
//                    print("There was an error: \(error.localizedDescription)")
//                }
//                print("COMPLETION \(completion)")
//            } receiveValue: { [weak self] returnedPosts in
//                self?.posts2 = returnedPosts
//            }
            .store(in: &cancellables)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
                throw URLError(.badServerResponse) //throw URLError(URLError.Code)
            }
        return output.data
    }
}

// Combine is the way to handle asynchronous events by combining events processing operators.
/*** combine steps :-
 eg:- 1]. sign up for a monthly subscription for a package to be delivered
 2]. the company would make the package behind the scene
 3]. receive the package at your door step.
 4]. check the box & make sure it is not damaged.
 5]. open & make sure item is correct.
 6]. finally use the item !!!!
 7]. Cancellable at any time !!
 ***/
