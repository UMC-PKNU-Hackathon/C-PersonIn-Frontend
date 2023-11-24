//
//  PostCellBottomButtonView.swift
//  CafeIn
//
//  Created by 제민우 on 11/24/23.
//

import UIKit

final class PostingStackBottomButtonView: UIView {
    
    let heartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "PostEmptyHeart"), for: .normal)
        button.setImage(UIImage(named: "PostFilledHeart"), for: .selected)
        return button
    }()
    
    let heartCountLabel: UILabel = {
        let label = UILabel()
        label.text = "57"
        label.textColor = .black
        return label
    }()
    
    private lazy var heartButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [heartButton, heartCountLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "PostComment"), for: .normal)
        return button
    }()
    
    let commentCountLabel: UILabel = {
        let label = UILabel()
        label.text = "3"
        label.textColor = .black
        return label
    }()
    
    private lazy var commentButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [commentButton, commentCountLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        configureSubview()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Configure UI
extension PostingStackBottomButtonView {
    
    private func configureSubview() {
        [heartButtonStackView, commentButtonStackView].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        
        [buttonStackView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            // MARK: buttonStackView Constraint
            buttonStackView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor
            ),
            buttonStackView.widthAnchor.constraint(
                greaterThanOrEqualTo: safeAreaLayoutGuide.widthAnchor,
                multiplier: 0.28
            ),
            buttonStackView.centerYAnchor.constraint(
                equalTo: safeAreaLayoutGuide.centerYAnchor
            ),
            buttonStackView.heightAnchor.constraint(
                equalTo: safeAreaLayoutGuide.heightAnchor,
                multiplier: 1
            )
        ])
    }
}
