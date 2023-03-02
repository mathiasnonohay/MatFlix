//
//  ShowTableViewCell.swift
//  MatFlix
//
//  Created by Mathias Nonohay on 09/08/22.
//

import UIKit

class ShowTableViewCell: UITableViewCell {
    
    static let identifier = "ShowTableViewCell"
    
    private let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titlePoster: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(title)
        contentView.addSubview(titlePoster)
        contentView.addSubview(playButton)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
         let constraints = [
            titlePoster.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlePoster.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titlePoster.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            titlePoster.widthAnchor.constraint(equalToConstant: 100),
            
            title.leadingAnchor.constraint(equalTo: titlePoster.trailingAnchor, constant: 15),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
         ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    public func configure(with model: ShowViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model.posterURL)") else { return }
        titlePoster.sd_setImage(with: url)
        title.text = model.title
    }
    
    
    
    
}
