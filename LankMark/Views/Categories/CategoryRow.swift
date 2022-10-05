//
//  CategoryRow.swift
//  LankMark
//
//  Created by 최준영 on 2022/10/05.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(items) { item in
                        NavigationLink {
                            landmarkDetail(landmark: item)
                        } label: {
                            CategoryItem(landmark: item)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        CategoryRow(categoryName: landmarks[0].category.rawValue, items: Array(landmarks.prefix(3)))
    }
}
