//
//  Date+Ext.swift
//  GHBFollowers
//
//  Created by Asyl Yerzhanuly on 17.08.2022.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
