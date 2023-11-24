//
//  SearchViewController.swift
//  CafeIn
//
//  Created by 성대훈 on 11/25/23.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let searchBar = UISearchBar()
    
    override func viewWillAppear(_ animated: Bool) {
        configureSearchBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1, green: 0.98, blue: 0.94, alpha: 1)
        configureNaviBar()
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
