//
//  PostView.swift
//  CafeIn
//
//  Created by 제민우 on 11/24/23.
//

import UIKit

final class PostArticleStackView: UIStackView {
    
    private let postingCellHeaderView = PostingCellHeaderView()
    
    let profileCellPagingImageView = ProfileCellPagingImageView()
    
    private let postCellBottomButtonView = PostCellBottomButtonView()
    
    private let postLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "부산 전포동에 있는 카페입니다. 커피가 친절하고 사장님이 맛있어요."
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        configureInitialSetting()
        configureSubViews()
        configureLayout()
        profileCellPagingImageView.configureContents([UIImage(named: "imageData"), UIImage(named: "imageData"), UIImage(named: "imageData")])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PostArticleStackView {
    
    private func configureInitialSetting() {
        axis = .vertical
        spacing = 15
        alignment = .leading
        distribution = .fill
    }
    
    private func configureSubViews() {
        [postingCellHeaderView, profileCellPagingImageView, postCellBottomButtonView, postLabel].forEach {
            addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            profileCellPagingImageView.heightAnchor.constraint(equalTo: profileCellPagingImageView.widthAnchor)
        ])
    }
}
