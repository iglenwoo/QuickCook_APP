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
    var prep: Int
    var cook: Int

    init(prep: Int, cook: Int) {
        self.prep = prep
        self.cook = cook
    }

    init?(snapshot: DataSnapshot) {
        let dict = snapshot.value as? [String:Any]
        let prep = dict?["prep"] as? Int ?? 0
        let cook = dict?["cook"] as? Int ?? 0

        self.prep = prep
        self.cook = cook
    }

    func toDictionary() -> Dictionary<String, Int> {
        var dict = Dictionary<String, Int>()
        dict["prep"] = self.prep
        dict["cook"] = self.cook

        return dict
    }
}

struct Recipe {
    var uploader: String
    var name: String
    var desc: String
    var ingredients: [String]
    var time: Time
    var yield: Int
    var directions: [String]

    init(uploader: String, name: String, desc: String, ingredients: [String], time: Time, yield: Int, directions: [String]) {
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
        let yield = dict?["yield"] as! Int
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
