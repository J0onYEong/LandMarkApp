//
//  CircleImage.swift
//  LankMark
//
//  Created by 최준영 on 2022/09/25.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image.clipShape(Circle()).overlay {
            Circle().stroke(.white, lineWidth: 4.0)
        }.shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
