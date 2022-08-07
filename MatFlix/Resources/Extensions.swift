//
//  Extensions.swift
//  MatFlix
//
//  Created by Mathias Nonohay on 07/08/22.
//

import Foundation

extension String {
    static let emptyString = ""
    
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
