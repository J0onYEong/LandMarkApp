//
//  LandmarkList.swift
//  LankMark
//
//  Created by 최준영 on 2022/09/26.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoriteOnly: Bool = false
    
    @EnvironmentObject var modelData: ModelData
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter {
            (landmark) in
            (!self.showFavoriteOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                Toggle(isOn: $showFavoriteOnly) {
                    Text("Show Favorite Only")
                }
                //하나의 row로써 기능시키기 워해 Foreach로 각요소를 묶어준다.
                ForEach(filteredLandmarks) {
                    (landmark) in
                    NavigationLink(value: landmark) {
                        LandmarkRow(landmark: landmark)
                    }
                }
                .navigationTitle("Landmarks")
            }
            .navigationDestination(for: Landmark.self){
                landmarkDetail(landmark: $0)
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
