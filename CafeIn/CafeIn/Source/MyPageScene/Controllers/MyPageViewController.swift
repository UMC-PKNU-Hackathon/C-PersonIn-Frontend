//
//  HomeViewController.swift
//  CafeIn
//
//  Created by 성대훈 on 11/24/23.
//

import UIKit

class MyPageViewController: UIViewController {
    
    private let profileBackgroundView = ProfileBackgroundView()
    
    private let profileHeaderView = ProfileHeaderView()
        
    private let itemsPerRow: CGFloat = 2
    
    private let profileDailyPostArray: [UIImage?] = [UIImage(named: "cafe1"),
                                                     UIImage(named: "cafe1"), UIImage(named: "cafe1"),
                                                     UIImage(named: "cafe1"), UIImage(named: "cafe1"),
                                                     UIImage(named: "cafe1"), UIImage(named: "cafe1"),
                                                     UIImage(named: "cafe1"), UIImage(named: "cafe1"),
                                                     UIImage(named: "cafe1"), UIImage(named: "cafe1"),
                                                     UIImage(named: "cafe1"), UIImage(named: "cafe1")]
    
    private lazy var postCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: generateCollectionViewLayout()
    )
    
    override func loadView() {
        view = profileBackgroundView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        configureLayout()
        configureUserPostCollectionView()
        profileHeaderView.profileHashTagsView.configureContents(profileHeaderView.profileHashTags)

    }
}

// MARK: ProfileViewController DataSource Implementation
extension MyPageViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileDailyPostArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let post = profileDailyPostArray[indexPath.item]
        
        if post == nil {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProfilePostCollectionViewCell.reuseIdentifier,
                for: indexPath
            ) as? ProfilePostCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProfilePostCollectionViewCell.reuseIdentifier,
                for: indexPath
            ) as? ProfilePostCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.profilePostImage.image = profileDailyPostArray[indexPath.item]
            
            return cell
        }
    }
}

// MARK: Configure CollectionView
extension MyPageViewController {
    private func configureUserPostCollectionView() {
        postCollectionView.dataSource = self
        
        postCollectionView.register(
            ProfilePostCollectionViewCell.self,
            forCellWithReuseIdentifier: ProfilePostCollectionViewCell.reuseIdentifier
        )
        
        postCollectionView.backgroundColor = .clear
    }
        
    private func generateCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .fractionalWidth(1/3)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1/3)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

// MARK: Configure UI
extension MyPageViewController {
    private func configureSubViews() {
        [profileHeaderView, /*hashTagsView*/ postCollectionView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            
            profileHeaderView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.11),
            profileHeaderView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            profileHeaderView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            profileHeaderView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5),
                        
            postCollectionView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor, constant: 20),
            postCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            postCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            postCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
}
