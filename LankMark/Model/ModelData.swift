//
//  ModelData.swift
//  LankMark
//
//  Created by 최준영 on 2022/09/26.
//

import SwiftUI
import Combine

//SwiftUI는 ObservableObject를 구독하고 변경사항이 생기면 View를 업데이트 한다.
final class ModelData: ObservableObject {
    //@Published속성을 부여해야지 SwiftUI가 감지할 수 있다.
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    //hikes변수는 한번로드하면 변경하지 않기 때문에 @Published를 사용하지 않아도 된다.
    let hikes: [Hike] = load("hikeData.json")
    
    var categories: [String : [Landmark]] {
        Dictionary (grouping: landmarks) {
            $0.category.rawValue
        }
    }
    
    var featuredLandmarks: [Landmark] {
        landmarks.filter {
            $0.isFeatured
        }
    }
    
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
