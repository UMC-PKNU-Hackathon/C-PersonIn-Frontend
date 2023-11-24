//
//  PostingViewController.swift
//  CafeIn
//
//  Created by 제민우 on 11/24/23.
//

import UIKit

final class PostingViewController: UIViewController {
    
    let postImages = [UIImage(named: "imageData"), UIImage(named: "imageData"), UIImage(named: "imageData")]
    
//    let postScrollView = UIScrollView()
//    let postingContentView = PostingContentView()
    
    let postingArticleStackView = PostingArticleStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialSetting()
//        configureSubViews()
//        configureLayout()
    }
}

// MARK: Configure Initial Setting

extension PostingViewController {
    private func configureInitialSetting() {
        postingArticleStackView.postingStackPagingImageView.configureContents(self.postImages)
        view.backgroundColor = UIColor(red: 1, green: 0.98, blue: 0.943, alpha: 1)

    }
}

//// MARK: Configure UI
//
//extension PostingViewController {
//    
//    private func configureSubViews() {
//        
//        view.addSubview(postScrollView)
//        postScrollView.addSubview(postingContentView)
//        [postingContentView].forEach {
//            view.addSubview($0)
//            $0.translatesAutoresizingMaskIntoConstraints = false
//        }
//    }
//    
//    private func configureLayout() {
//        let safeArea = view.safeAreaLayoutGuide
//        
//        NSLayoutConstraint.activate([
//            
//            
//            
//            postScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            postScrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
//            postScrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
//            postScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            
//            postingContentView.topAnchor.constraint(equalTo: postScrollView.topAnchor),
//            postingContentView.bottomAnchor.constraint(equalTo: postScrollView.bottomAnchor),
//            postingContentView.leadingAnchor.constraint(equalTo: postScrollView.leadingAnchor),
//            postingContentView.trailingAnchor.constraint(equalTo: postScrollView.trailingAnchor),
//        ])
//    }
//}
