//
//  PostingCellHeaderView.swift
//  CafeIn
//
//  Created by 제민우 on 11/24/23.
//

import UIKit

final class PostingCellHeaderView: UIView {

    private let postingHeaderProfileView = PostingHeaderProfileView()
    
    private let cafeAddressLabel: UILabel = {
        let label = UILabel()
        label.text = "부산광역시 부산진구 전포동 ▼"
        label.font = .systemFont(ofSize: 10)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        return label
    }()

    init() {
        super.init(frame: .zero)
        configureSubViews()
        configureLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Public Interface

extension PostingCellHeaderView {
    
    func configureContents(_ data: (cafeName: String, userName: String, profileImage: UIImage)) {
        postingHeaderProfileView.postingCafeName.text = data.cafeName
        postingHeaderProfileView.postingUserName.text = data.cafeName
        postingHeaderProfileView.profileImageView.image = data.profileImage
    }
}

// MARK: Configure UI

extension PostingCellHeaderView {
    
    private func configureSubViews() {
        [postingHeaderProfileView, /*cafeAddressLabel*/].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            postingHeaderProfileView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            postingHeaderProfileView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            postingHeaderProfileView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
//            cafeAddressLabel.bottomAnchor.constraint(equalTo: postingHeaderProfileView.bottomAnchor),
//            cafeAddressLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
