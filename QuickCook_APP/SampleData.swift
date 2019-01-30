//
//  SampleData.swift
//  QuickCook_APP
//
//  Created by Ingyu Woo on 1/23/19.
//  Copyright © 2019 Ingyu Woo. All rights reserved.
//

import Foundation

final class SampleData {
    
    static func generateSampleData() -> [Recipe] {
        return [
            Recipe(uploader: "tester", name: "Mock Recipe 1", desc: "This is a test recipe 2", ingredients: ["t 1", "t 2"], time: Time(prep: 1, cook: 2), yield: 1, directions: ["order 1","order 2"]),
            Recipe(uploader: "tester", name: "Mock Recipe 2", desc: "This is a test recipe 2", ingredients: ["t 3", "t 4"], time: Time(prep: 3, cook: 4), yield: 2, directions: ["order 1","order 2","order 3", "order 4"])
        ]
    }
}
