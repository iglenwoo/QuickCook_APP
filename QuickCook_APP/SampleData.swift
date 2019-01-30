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
            Recipe(uploader: "tester", name: "Test Recipe 1", desc: "This is a test recipe 2", ingredients: ["t 1", "t 2"], time: CookTime(prep: "1m", cook: "2m"), yield: "1 servings", directions: ["order 1","order 2"]),
            Recipe(uploader: "tester", name: "Test Recipe 2", desc: "This is a test recipe 2", ingredients: ["t 3", "t 4"], time: CookTime(prep: "3m", cook: "4m"), yield: "2 servings", directions: ["order 1","order 2","order 3", "order 4"])
        ]
    }
}
