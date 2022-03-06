//
//  WeakSelfViewModel.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 06/03/22.
//

import Foundation

class WeakSelfViewModel: ObservableObject {
    @Published var data: String? = nil
    
    init() {
        print("Initialize now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        getData()
    }
    
    deinit {
        print("De-Initialize now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    
    func getData() {
//        DispatchQueue.global().async {
//            self.data = "New Data!!!"
//        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
            self?.data = "New Data!!!"
        }
    }
}
