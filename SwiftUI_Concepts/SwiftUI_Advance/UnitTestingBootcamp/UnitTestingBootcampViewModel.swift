//
//  UnitTestingBootcampViewModel.swift
//  SwiftUI_Concepts
//
//  Created by Kanishk Vijaywargiya on 16/08/22.
//

import SwiftUI

class UnitTestingBootcampViewModel: ObservableObject {
    @Published var isPremium: Bool
    
    init(isPremium: Bool) {
        self.isPremium = isPremium
    }
}
