//
//  ProfilePostCollectionViewCell.swift
//  CafeIn
//
//  Created by 제민우 on 11/25/23.
//

import UIKit

class ProfilePostCollectionViewCell: UICollectionViewCell {
    
    var profilePostImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureImageView() {
        self.contentView.addSubview(profilePostImage)
    }
    
    private func configureConstraints() {
        profilePostImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profilePostImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            profilePostImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            profilePostImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            profilePostImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        ])
    }
}

extension ProfilePostCollectionViewCell {
    func configureAddTarget() {
        
    }
    
}
