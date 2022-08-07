//
//  ShowCollectionViewCell.swift
//  MatFlix
//
//  Created by Mathias Nonohay on 07/08/22.
//

import UIKit

class ShowCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ShowCollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(posterImageView )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
}
