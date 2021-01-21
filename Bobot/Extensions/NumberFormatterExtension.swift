//
//  NumberFormatterExtension.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 15/01/21.
//

import Foundation

extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
