//
//  ShowCollectionViewCell.swift
//  MatFlix
//
//  Created by Mathias Nonohay on 07/08/22.
//

import UIKit
import SDWebImage

class ShowCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ShowCollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
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
    
    public func configure(with model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model)") else { return }
        posterImageView.sd_setImage(with: url, completed: nil)
    }
}
