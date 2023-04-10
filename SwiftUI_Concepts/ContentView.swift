//
//  ContentView.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 07/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //ViewModifierBootcamp()
//        DownloadImageAsync()
        DonutChart(slices: data)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
