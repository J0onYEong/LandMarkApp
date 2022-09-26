//
//  landmarkDetail.swift
//  LankMark
//
//  Created by 최준영 on 2022/09/26.
//

import SwiftUI

struct landmarkDetail: View {
    var landmark: Landmark
    var body: some View {
        ScrollView {
            MapView(coordinates: landmark.locationCoordinate).frame(height: 300).ignoresSafeArea(edges: .top)

            CircleImage(image: landmark.image).offset(y: -130).padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
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
        landmarkDetail(landmark: landmarks[1])
    }
}
