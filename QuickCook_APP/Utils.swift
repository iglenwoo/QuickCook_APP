//
// Created by Ingyu Woo on 2019-03-05.
// Copyright (c) 2019 Ingyu Woo. All rights reserved.
//

import Foundation

class Utils {

    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        return formatter
    }()

    static func currentDateToString() -> String {
        return dateFormatter.string(from: Date())
    }

}