//
//  Date+Conversion.swift
//  Coronavirus Tracker
//
//  Created by Vinoth Vino on 05/07/20.
//  Copyright © 2020 Vinoth Vino. All rights reserved.
//

import Foundation

extension Date {
    static func convertStringToDate(date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+5:30")
        
        guard let date = dateFormatter.date(from: date) else {
            fatalError("Failed to convert the date to string")
        }
        return date
    }
    
    func convertDateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+5:30")
        return dateFormatter.string(from: self)
    }
}
