//
//  Recipe.swift
//  QuickCook_APP
//
//  Created by Ingyu Woo on 1/17/19.
//  Copyright © 2019 Ingyu Woo. All rights reserved.
//

import Foundation
import Firebase

struct CookTime {
    var prep: String
    var cook: String
}

struct Recipe {
    var uploader: String
    var name: String
    var desc: String
    var ingredients: [String]
    var time: CookTime
    var yield: String
    var directions: [String]

    init(uploader: String, name: String, desc: String, ingredients: [String], time: CookTime, yield: String, directions: [String]) {
        self.uploader = uploader
        self.name = name
        self.desc = desc
        self.ingredients = ingredients
        self.time = time
        self.yield = yield
        self.directions = directions
    }

    init?(snapshot: DataSnapshot) {
        let dict = snapshot.value as? [String:Any]
        let uploader  = dict?["uploader"] as! String
        let name = dict?["name"]  as! String
        let desc = dict?["desc"]  as! String
        let ingredients = dict?["ingredients"]  as! [String]

        let timeSnap = snapshot.childSnapshot(forPath: "time")
        let timeDic = timeSnap.value as? [String:Any]
        let time = CookTime(prep: timeDic?["prep"] as! String, cook: timeDic?["cook"] as! String)

        let yield = dict?["yield"] as! String
        let directions = dict?["directions"] as! [String]

        self.uploader = uploader
        self.name = name
        self.desc = desc
        self.ingredients = ingredients
        self.time = time
        self.yield = yield
        self.directions = directions
    }
}
