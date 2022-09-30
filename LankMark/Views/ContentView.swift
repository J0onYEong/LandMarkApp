//
//  ContentView.swift
//  LankMark
//
//  Created by 최준영 on 2022/09/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        VStack {
            LandmarkList()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
