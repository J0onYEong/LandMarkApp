//
//  JumpButton.swift
//  LankMark
//
//  Created by 최준영 on 2022/10/11.
//

import SwiftUI

struct JumpButton: View {
    @Binding var currentPage: Int
    var pageCount: Int
    
    var body: some View {
        HStack {
            Button("👉🏻") {
                currentPage = (currentPage + 1) % pageCount
            }
        }
    }
}
