//
//  PostingHeaderProfileView.swift
//  CafeIn
//
//  Created by 제민우 on 11/24/23.
//

import UIKit

final class PostingHeaderProfileView: UIStackView {

    let profileImageView: UIImageView = {
        let imageView = CafeInProfileImageView()
        imageView.image = UIImage(named: "ProfileImage")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let postingCafeName: UILabel = {
        let label = UILabel()
        label.text = "스타벅스"
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let postingUserName: UILabel = {
        let label = UILabel()
        label.text = "김카페"
        label.font = .systemFont(ofSize: 15)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        return label
    }()
    
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        configureInitialSetting()
        configureSubViews()
        configureLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Public Interface

extension PostingHeaderProfileView {
    
    func configureContetns(_ cafeName: String, _ userName: String, _ profileImage: UIImage) {
        postingCafeName.text = cafeName
        postingUserName.text = userName
        profileImageView.image = profileImage
    }
}

// MARK: Configure UI

extension PostingHeaderProfileView {
    
    private func configureInitialSetting() {
        spacing = 15
        axis = .horizontal
        distribution = .fill
        alignment = .center
    }
    
    private func configureSubViews() {
        [postingCafeName, postingUserName].forEach {
            labelStackView.addArrangedSubview($0)
            $0.setContentHuggingPriority(.required, for: .horizontal)
        }
        
        [profileImageView, labelStackView].forEach {
            addArrangedSubview($0)
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor),
            profileImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor)
        ])
    }
}
