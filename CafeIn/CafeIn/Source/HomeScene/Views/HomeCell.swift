//
//  HomeCell.swift
//  CafeIn
//
//  Created by 성대훈 on 11/24/23.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    static let cellID = "cell"
    
    private lazy var cafeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cafe1")
        contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellUI() {
        contentView.addSubview(cafeImageView)
        contentView.clipsToBounds = true
        
        cafeImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cafeImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cafeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cafeImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cafeImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cafeImageView.heightAnchor.constraint(equalTo: cafeImageView.widthAnchor)
        ])
    }
    
    func configure(_ cellData: Home) {
        cafeImageView.image = UIImage(named: cellData.imageName)
        
    }
    
}
