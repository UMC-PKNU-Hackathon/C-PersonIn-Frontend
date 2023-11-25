//
//  PostingViewController.swift
//  CafeIn
//
//  Created by 제민우 on 11/24/23.
//

import UIKit

final class PostingViewController: UIViewController {
    
    private let postImages = [UIImage(named: "cafe1"), UIImage(named: "imageData"), UIImage(named: "imageData")]
    private let hashTags = ["분위기가 좋은", "커피가 맛있는", "조용한"]
    
    
    let postingArticleStackView = PostingArticleStackView()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        [postingArticleStackView.hashTagLabel1, postingArticleStackView.hashTagLabel2, postingArticleStackView.hashTagLabel3].forEach {
            $0.layer.cornerRadius = $0.frame.height / 2
            $0.clipsToBounds = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        configureInitialSetting()
        configureSubViews()
        configureLayout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

// MARK: Configure Initial Setting

extension PostingViewController {
    private func configureInitialSetting() {
        postingArticleStackView.postingStackPagingImageView.configureContents(self.postImages)
        postingArticleStackView.hashTagsView.configureContents(self.hashTags)
        view.backgroundColor = UIColor(red: 1, green: 0.98, blue: 0.943, alpha: 1)

    }
}

// MARK: Configure UI

extension PostingViewController {

    private func configureSubViews() {
        [postingArticleStackView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            postingArticleStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 5),
            postingArticleStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            postingArticleStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
        ])
    }
}
