//
//  ProfileBackgroudnView.swift
//  CafeIn
//
//  Created by 제민우 on 11/25/23.
//

import UIKit

class ProfileBackgroundView: UIView {
    
    private let backGroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profileBackground")
        return imageView
    }()

    init() {
        super.init(frame: .zero)
//        configureInitialSetting()
        configureSubViews()
        configureLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ProfileBackgroundView {
    
    private func configureSubViews() {
        addSubview(backGroundImageView)
        backGroundImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            backGroundImageView.topAnchor.constraint(equalTo: topAnchor, constant: -10),
            backGroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            backGroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -10),
            backGroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
        ])
    }
}
