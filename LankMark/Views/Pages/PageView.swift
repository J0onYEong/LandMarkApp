//
//  PageView.swift
//  LankMark
//
//  Created by 최준영 on 2022/10/11.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State var currentPage: Int = 0
    @State var pageCount: Int = 3

    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pageCount, currentPage: $currentPage)
                .frame(width: CGFloat(pageCount * 18))
                .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().featuredLandmarks.map {
            FeatureCard(landmark: $0)
        })
        .aspectRatio(3 / 2, contentMode: .fit)
    }
}
