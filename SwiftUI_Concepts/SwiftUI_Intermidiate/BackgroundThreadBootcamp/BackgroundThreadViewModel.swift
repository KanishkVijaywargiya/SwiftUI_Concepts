//
//  BackgroundThreadViewModel.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 05/03/22.
//

import Foundation

class BackgroundThreadViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    init() {
        
    }
    
    func fetchData() {
        // .utility, .userInteractive, .userIntiated, .unspecified, .default, .background
        DispatchQueue.global(qos: .background).async {
            let newData = self.downloadData()
            
            print("Main Thread 1: \(Thread.isMainThread)")
            print("Current Thread 1: \(Thread.current)")
            
            DispatchQueue.main.async {
                self.dataArray = newData
                print("Main Thread 2: \(Thread.isMainThread)")
                print("Current Thread 2: \(Thread.current)")
            }
        }
//        DispatchQueue.global().async {
//            let newData = self.downloadData()
//
//            DispatchQueue.main.async {
//                self.dataArray = newData
//            }
//        }
    }
    
    private func downloadData() -> [String] {
        var data: [String] = []
        for x in 0..<100 {
            data.append("\(x)")
            print(data)
        }
        return data
    }
}
