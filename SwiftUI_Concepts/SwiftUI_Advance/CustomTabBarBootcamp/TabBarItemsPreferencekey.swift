//
//  TabBarItemsPreferencekey.swift
//  SwiftUI_Concepts
//
//  Created by Kanishk Vijaywargiya on 01/06/22.
//

import Foundation
import SwiftUI

struct TabBarItemsPreferenceKey: PreferenceKey {
    static var defaultValue: [TabBarItem] = []
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
}

struct TabBarItemViewModifier: ViewModifier {
    let tab: TabBarItem
    func body(content: Content) -> some View {
        content.preference(key: TabBarItemsPreferenceKey.self, value: [tab])
    }
}

extension View {
    func tabBarItem(tab: TabBarItem) -> some View {
        self.modifier(TabBarItemViewModifier(tab: tab))
    }
}
