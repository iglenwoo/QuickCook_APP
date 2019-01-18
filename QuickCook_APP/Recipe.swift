//
//  Recipe.swift
//  QuickCook_APP
//
//  Created by Ingyu Woo on 1/17/19.
//  Copyright © 2019 Ingyu Woo. All rights reserved.
//

import Foundation

struct Time {
    var prep: String
    var cook: String
}

struct Recipe {
    var uploader: String
    var name: String
    var desc: String
    var ingredients: [String]
    var time: Time
    var yield: String
    var directions: [String]
}
