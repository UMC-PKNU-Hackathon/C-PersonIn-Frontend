//
//  PagingImageCollectionViewCell.swift
//  CafeIn
//
//  Created by 제민우 on 11/24/23.
//

import UIKit

final class PagingImageCollectionViewCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
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
extension PagingImageCollectionViewCell {
    private func configureSubview() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        let safeArea = contentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            // MARK: imageView Constraint
            imageView.topAnchor.constraint(
                equalTo: safeArea.topAnchor
            ),
            imageView.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor
            ),
            imageView.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor
            ),
            imageView.bottomAnchor.constraint(
                equalTo: safeArea.bottomAnchor
            ),
        ])
    }
}
