//
//  LandmarkList.swift
//  LankMark
//
//  Created by 최준영 on 2022/09/26.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            //리스트는 식별가능한 데이터를 다룬다.
            //1. Identifiable protocol 준수하는 타입을 사용한다.
            //2. id매개변수에 고유id를 전달한다.
            //collection을 첫번째 인자로 받아 순회시킨다.
            List(landmarks) {
                (landmark) in
                NavigationLink {
                    landmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 14" , "iPhone SE (3rd generation)"], id: \.self) {
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: $0))
                .previewDisplayName($0)
        }
    }
}
