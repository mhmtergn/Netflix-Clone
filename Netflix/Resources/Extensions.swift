//
//  Extensions.swift
//  Netflix
//
//  Created by Mehmet Ergün on 2022-09-17.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
