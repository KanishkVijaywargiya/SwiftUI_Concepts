//
//  UnitTestingBootcampView.swift
//  SwiftUI_Concepts
//
//  Created by Kanishk Vijaywargiya on 16/08/22.
//

/**
 1. Unit Tests :- test business logic in ur app
 2. UI Tests :- Tests the UI of ur app
 */

import SwiftUI

struct UnitTestingBootcampView: View {
    @StateObject private var vm: UnitTestingBootcampViewModel
    
    init(isPremium: Bool) {
        _vm = StateObject(wrappedValue: UnitTestingBootcampViewModel(isPremium: isPremium))
    }
    
    var body: some View {
        Text(vm.isPremium.description)
    }
}

struct UnitTestingBootcampView_Previews: PreviewProvider {
    static var previews: some View {
        UnitTestingBootcampView(isPremium: true)
    }
}


/*
there r 2 types of testing
Unit testing & UI Testing iOS development.

Unit testing is testing all of basically your code logic in the app.
UI testing is strictly a testing the ui components that a user would go through.
So if a user opens the app & they click the buttons then it is the UI Testing.
 
But if we r trying to do the ui test the underlying logic in the view model, the data services, utilities
all that actual code which we r creating & u want to make sure it's still working that's where the unit test comes in.

*/
