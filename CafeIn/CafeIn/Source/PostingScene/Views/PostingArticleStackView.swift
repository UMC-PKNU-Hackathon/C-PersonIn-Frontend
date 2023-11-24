//
//  PostView.swift
//  CafeIn
//
//  Created by 제민우 on 11/24/23.
//

import UIKit

final class PostingArticleStackView: UIStackView {
    
    private let postingCellHeaderView = PostingStackHeaderView()
    
    let postingStackPagingImageView = PostingStackPagingImageView()
    
    let hashTagsView = HashTagsView()
    
    let hashTagLabel1: PaddedLabel = {
        let label = PaddedLabel()
        label.text = "분위기 좋은"
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        
        label.layer.borderColor = UIColor(red: 0.459, green: 0.376, blue: 0.302, alpha: 1).cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    let hashTagLabel2: PaddedLabel = {
        let label = PaddedLabel()
        label.text = "커피가 맛있는"
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        
        label.layer.borderColor = UIColor(red: 0.459, green: 0.376, blue: 0.302, alpha: 1).cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    let hashTagLabel3: PaddedLabel = {
        let label = PaddedLabel()
        label.text = "콘센트 있는"
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        
        label.layer.borderColor = UIColor(red: 0.459, green: 0.376, blue: 0.302, alpha: 1).cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    private lazy var hashTagStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [hashTagLabel1, hashTagLabel2, hashTagLabel3])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    private let postingStackBottomButtonView = PostingStackBottomButtonView()
    
    private let postLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.text = "부산 전포동에 있는 카페입니다. 커피가 친절하고 사장님이 맛있어요."
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        configureInitialSetting()
        configureSubViews()
        configureLayout()
        postingStackPagingImageView.configureContents([UIImage(named: "imageData"), UIImage(named: "imageData"), UIImage(named: "imageData")])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PostingArticleStackView {
    
    private func configureInitialSetting() {
        axis = .vertical
        spacing = 15
        alignment = .leading
        distribution = .fill
    }
    
    private func configureSubViews() {
        [postingCellHeaderView, postingStackPagingImageView, hashTagStackView, postingStackBottomButtonView, postLabel].forEach {
            addArrangedSubview($0)
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            postingStackPagingImageView.heightAnchor.constraint(equalTo: postingStackPagingImageView.widthAnchor),
            
        ])
    }
}

class PaddedLabel: UILabel {
    var topInset: CGFloat = 5.0
    var bottomInset: CGFloat = 5.0
    var leftInset: CGFloat = 10.0
    var rightInset: CGFloat = 10.0

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset, height: size.height + topInset + bottomInset)
    }
}
