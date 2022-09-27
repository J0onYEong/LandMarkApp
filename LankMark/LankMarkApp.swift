//
//  LankMarkApp.swift
//  LankMark
//
//  Created by 최준영 on 2022/09/25.
//

import SwiftUI

@main
struct LankMarkApp: App {
    //@StateObject속성은 app의 생명주기동안 해당 프로퍼티를 한번만 초기화한다는 선언이다.
    @StateObject var modelData: ModelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            //실제 코드에서 전달하는 modelData
            ContentView()
                .environmentObject(modelData)
        }
    }
}
