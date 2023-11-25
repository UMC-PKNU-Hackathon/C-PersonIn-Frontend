//
//  SearchViewController.swift
//  CafeIn
//
//  Created by 성대훈 on 11/25/23.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let hashTags = ["# 분위기가 좋은", "# 커피가 맛있는", "# 조용한", "# 콘센트가 있는", "# 디저트가 맛있는", "# 산미있는", "# 카공하기 좋은", "# 사장님이 친절한"]

    
    private let searchBar = UISearchBar()
    
    private let hashTagsView = HashTagsView()
    
    override func viewWillAppear(_ animated: Bool) {
        configureSearchBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let cell = HashTagCollectionViewCell()
        cell.hashTagLabel.layer.cornerRadius = cell.hashTagLabel.frame.height / 2
        cell.hashTagLabel.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1, green: 0.98, blue: 0.94, alpha: 1)
        configureNaviBar()
        configureSubviews()
        configureLayout()
        hashTagsView.configureContents(self.hashTags)
//        hashTagsView.hashTagCollectionView.delegate = self
    }
}

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let postingViewController = PostingViewController()
        navigationController?.pushViewController(postingViewController, animated: true)
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    private func configureSearchBar() {
        searchBar.delegate = self
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.becomeFirstResponder()
        navigationItem.titleView = searchBar
    }
}

extension SearchViewController {
    private func configureNaviBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithTransparentBackground()
        
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.compactAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        
    }
}

extension SearchViewController {
    private func configureSubviews() {
        [hashTagsView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            hashTagsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.035),
            hashTagsView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 5),
            hashTagsView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5),
            hashTagsView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5)
        ])
    }
}
