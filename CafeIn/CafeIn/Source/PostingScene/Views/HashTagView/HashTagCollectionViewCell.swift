//
//  HashTagCollectionViewCell.swift
//  CafeIn
//
//  Created by 제민우 on 11/25/23.
//

import UIKit

final class HashTagCollectionViewCell: UICollectionViewCell {
    
    let hashTagLabel: UILabel = {
        let label = UILabel()
        label.text = "분위기 좋은"
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        
        label.layer.borderColor = UIColor(red: 0.459, green: 0.376, blue: 0.302, alpha: 1).cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubview()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Configure UI

extension HashTagCollectionViewCell {
    private func configureSubview() {
        addSubview(hashTagLabel)
        hashTagLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            hashTagLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            hashTagLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5),
            hashTagLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            hashTagLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
