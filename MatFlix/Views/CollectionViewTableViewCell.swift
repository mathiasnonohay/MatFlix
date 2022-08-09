//
//  CollectionViewTableViewCell.swift
//  MatFlix
//
//  Created by Mathias Nonohay on 02/08/22.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    
    static let identifier =  "CollectionViewTableViewCell"
    
    private var shows: [Show] = [Show]()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ShowCollectionViewCell.self, forCellWithReuseIdentifier: ShowCollectionViewCell.identifier)
        collectionView.backgroundColor = .black
        return collectionView
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    public func configure(with shows: [Show]) {
        self.shows = shows
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
            
        }
    }
}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowCollectionViewCell.identifier, for: indexPath) as? ShowCollectionViewCell else { return UICollectionViewCell() }
        guard let poster = self.shows[indexPath.row].posterPath else { return cell }
        cell.configure(with: poster)
        cell.layer.cornerRadius = 4
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.shows.count
    }
    
}
