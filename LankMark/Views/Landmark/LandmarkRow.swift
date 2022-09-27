//
//  LandmarkRow.swift
//  LankMark
//
//  Created by 최준영 on 2022/09/26.
//

import SwiftUI

struct LandmarkRow: View {
    //초기화 되지 않으면 preview에 표시되지 않는다.
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: ModelData().landmarks[1])
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
