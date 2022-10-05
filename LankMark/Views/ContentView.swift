//
//  ContentView.swift
//  LankMark
//
//  Created by 최준영 on 2022/09/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var selection: Tab = .featured
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome().tag(Tab.featured)
            .tabItem {
                Label("Featured", systemImage: "star")
            }
            LandmarkList().tag(Tab.list)
            .tabItem {
                Label("List", systemImage: "list.bullet")
            }
        }
    }
    
    enum Tab {
        case featured
        case list
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
