//
// Created by Ingyu Woo on 2019-03-05.
// Copyright (c) 2019 Ingyu Woo. All rights reserved.
//

import Foundation
import Firebase

class User {
    var uid: String
    var email: String

    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
}