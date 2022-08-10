//
//  ShowTableViewCell.swift
//  MatFlix
//
//  Created by Mathias Nonohay on 09/08/22.
//

import UIKit

class ShowTableViewCell: UITableViewCell {
    
    static let identifier = "ShowTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
