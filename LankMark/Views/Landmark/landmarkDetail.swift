//
//  landmarkDetail.swift
//  LankMark
//
//  Created by 최준영 on 2022/09/26.
//

import SwiftUI

struct landmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    var body: some View {
        ScrollView {
            MapView(coordinates: landmark.locationCoordinate).frame(height: 300).ignoresSafeArea(edges: .top)

            CircleImage(image: landmark.image).offset(y: -130).padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    //@StateObject로 선언된 변수도 바인딩으로 사용이 가능한 것같다.
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }.font(.subheadline)
                    .foregroundColor(.secondary)
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
                    .font(.subheadline)
            }.padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct landmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        landmarkDetail(landmark: ModelData().landmarks[2])
            .environmentObject(ModelData())
    }
}
