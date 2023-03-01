//
//  AppTabBarView.swift
//  SwiftUI_Concepts
//
//  Created by Kanishk Vijaywargiya on 01/06/22.
//

import SwiftUI

/**
 /// MARK: For building custom tab bar we require following concepts.
 1]. Generics
 2]. ViewBuilder
 3]. PreferenceKey
 4]. MatchedGeometryEffect - Animation
 */

struct AppTabBarView: View {
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = TabBarItem(iconName: "house", title: "Home", color: Color.red)
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.red
                .tabBarItem(tab: TabBarItem(iconName: "house", title: "Home", color: Color.red))
            Color.orange
                .tabBarItem(tab: TabBarItem(iconName: "heart", title: "Favorites", color: Color.blue))
            Color.green
                .tabBarItem(tab: TabBarItem(iconName: "person", title: "Profile", color: Color.green))
        }
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [
        TabBarItem(iconName: "house", title: "Home", color: Color.red),
        TabBarItem(iconName: "heart", title: "Favorites", color: Color.blue),
        TabBarItem(iconName: "person", title: "Profile", color: Color.green)
    ]
    static var previews: some View {
        AppTabBarView()
    }
}

extension AppTabBarView {
    private var defaultTabView: some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            Color.orange
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}
