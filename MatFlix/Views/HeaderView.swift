//
//  HeaderView.swift
//  MatFlix
//
//  Created by Mathias Nonohay on 02/08/22.
//

import UIKit

class HeaderView: UIView {
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.borderColor = UIColor.white.cgColor
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let headerView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemRed
        return imageView
    }()
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.clear.cgColor,
            UIColor.black.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstraints()
    }
    
    private func applyConstraints() {
        let playButtonConstraints = [
            playButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let downloadButtonContraints = [
            downloadButton.trailingAnchor.constraint(equalTo: playButton.leadingAnchor, constant: -50),
            downloadButton.bottomAnchor.constraint(equalTo: playButton.bottomAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(downloadButtonContraints)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerView.frame = bounds
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
