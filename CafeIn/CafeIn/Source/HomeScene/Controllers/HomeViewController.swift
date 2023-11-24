//
//  HomeViewController.swift
//  CafeIn
//
//  Created by 성대훈 on 11/24/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeBackGroundView = HomeBackgroundView()
    
    private let sectionInsets = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 20.0, right: 10.0)
    
    private let itemsPerRow: CGFloat = 2
    
    let items: [Home] = Home.item
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: generateCollectionViewLayout()
    )
    
    override func loadView() {
        view = homeBackGroundView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        configureLayout()
        configureInitialSetting()
    }
}

// MARK: Configure Initial Setting

extension HomeViewController {
    private func configureInitialSetting() {
        collectionView.backgroundColor = .clear
        
        navigationController?.isNavigationBarHidden = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.cellID)
        collectionView.showsVerticalScrollIndicator = false
    }
    
    private func generateCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/2),
            heightDimension: .fractionalWidth(1/2)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: -20, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1/3)
            
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: -20, trailing: 5)
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let postingViewController = PostingViewController()
        navigationController?.pushViewController(postingViewController, animated: true)
    }
}

// MARK: Implement CollectionView Datasource

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellData = items[indexPath.item]

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomeCell.cellID,
            for: indexPath
        ) as? HomeCell else {
            return UICollectionViewCell()
            }
        
        cell.configure(cellData)
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 10
        return cell
    }
}

// MARK: Configure UI

extension HomeViewController {
    
    private func configureSubViews() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
