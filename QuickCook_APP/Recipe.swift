//
//  Recipe.swift
//  QuickCook_APP
//
//  Created by Ingyu Woo on 1/17/19.
//  Copyright © 2019 Ingyu Woo. All rights reserved.
//

import Foundation
import Firebase

struct Time {
    var prep: String
    var cook: String

    init(prep: String, cook: String) {
        self.prep = prep
        self.cook = cook
    }

    init?(snapshot: DataSnapshot) {
        let dict = snapshot.value as? [String:Any]
        let prep = dict?["prep"] as! String
        let cook = dict?["cook"] as! String

        self.prep = prep
        self.cook = cook
    }
}

struct Recipe {
    var uploader: String
    var name: String
    var desc: String
    var ingredients: [String]
    var time: Time
    var yield: String
    var directions: [String]

    init(uploader: String, name: String, desc: String, ingredients: [String], time: Time, yield: String, directions: [String]) {
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
        let time = Time(snapshot: snapshot.childSnapshot(forPath: "time"))
        let yield = dict?["yield"] as! String
        let directions = dict?["directions"] as! [String]

        self.uploader = uploader
        self.name = name
        self.desc = desc
        self.ingredients = ingredients
        self.time = time!
        self.yield = yield
        self.directions = directions
    }
}
