//
//  Badge.swift
//  LankMark
//
//  Created by 최준영 on 2022/09/30.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols: some View {
        ForEach(0..<8) {
            index in
            RotatedBadgeSymbol(angle: Angle(degrees: Double(index) / 8 * 360))
                .opacity(0.5)
        }
    }
    var body: some View {
        ZStack {
            BadgeBackGround()
            GeometryReader {
                geometry in
                self.badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
            .aspectRatio(contentMode: .fit)
        }
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
