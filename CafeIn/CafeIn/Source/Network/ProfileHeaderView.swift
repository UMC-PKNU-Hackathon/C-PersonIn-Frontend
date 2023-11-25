//
//  ProfileHeaderView.swift
//  CafeIn
//
//  Created by 제민우 on 11/25/23.
//

import UIKit

class ProfileHeaderView: UIView {
    
    let profileHashTags = ["# 분위기가 좋은", "# 커피가 맛있는", "# 조용한", "# 콘센트가 있는", "# 디저트가 맛있는", "# 산미있는", "# 카공하기 좋은", "# 사장님이 친절한"]
    
    let profileHashTagsView = HashTagsView()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "myProfileImage")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let profileNickNameLabel: UILabel = {
        let label = UILabel()
        label.text = "김카페"
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        return label
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
    }

    init() {
        super.init(frame: .zero)
//        configureInitialSetting()
        configureSubViews()
        configureLayout()
        profileHashTagsView.configureContents(profileHashTags)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileHeaderView {
    private func configureSubViews() {
        [profileImageView, profileNickNameLabel, profileHashTagsView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            
//            profileImageView.widthAnchor.constraint(equalTo: view, multiplier: <#T##CGFloat#>)
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor),
            profileImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            profileImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            
            profileNickNameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            profileNickNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            
            profileHashTagsView.heightAnchor.constraint(equalToConstant: 25),
            profileHashTagsView.topAnchor.constraint(equalTo: profileNickNameLabel.bottomAnchor, constant: 0),
            profileHashTagsView.leadingAnchor.constraint(equalTo: profileNickNameLabel.leadingAnchor),
            profileHashTagsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }
}
