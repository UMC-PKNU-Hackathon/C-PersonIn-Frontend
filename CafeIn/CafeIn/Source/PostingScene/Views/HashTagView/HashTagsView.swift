//
//  HashTagsView.swift
//  CafeIn
//
//  Created by 제민우 on 11/25/23.
//

import UIKit

class HashTagsView: UIView {

    private var hashTags: [String?] = [] {
        didSet {
            hashTagCollectionView.reloadData()
        }
    }
    
    private let hashTagCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        return collectionView
    }()
    
    convenience init() {
        self.init(frame: .zero)
        configurePagingImageCollectionView()
        configureSubview()
        configureLayout()
    }
}

// MARK: Public Interface
extension HashTagsView {
    func configureContents(_ text: [String?]) {
        self.hashTags = text
    }
}

// MARK: UIScrollView Delegate Implementation
//extension HashTagsView {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        
//        let width = scrollView.frame.width
//
//        if width != 0 {
//            let currentPosition = scrollView.contentOffset.x / width
//            imagePageControl.currentPage = Int(currentPosition)
//        }
//    }
//}

// MARK: UICollectionView Delegate FlowLayout Implementation
extension HashTagsView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        
        let text = hashTags[indexPath.row] ?? ""
        let cellWidth = text.size(withAttributes:[.font: UIFont.systemFont(ofSize:14)]).width + 10 // 여백을 위해 20 추가
        let height: CGFloat = collectionView.bounds.height + 5
        
        return CGSize(width: cellWidth, height: height)
    }
}

// MARK: UICollectionView DataSource Implementation
extension HashTagsView: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return hashTags.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HashTagCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? HashTagCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        cell.hashTagLabel.text = hashTags[indexPath.row]
        return cell
    }
}

// MARK: Configure UI
extension HashTagsView {
    
    private func configurePagingImageCollectionView() {
        hashTagCollectionView.dataSource = self
        hashTagCollectionView.delegate = self
        hashTagCollectionView.register(
            HashTagCollectionViewCell.self,
            forCellWithReuseIdentifier: HashTagCollectionViewCell.reuseIdentifier
        )
        
        hashTagCollectionView.isPagingEnabled = true
        hashTagCollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func configureSubview() {
        [hashTagCollectionView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            // MARK: pagingImageCollectionView Constraint
            hashTagCollectionView.topAnchor.constraint(
                equalTo: safeArea.topAnchor
            ),
            hashTagCollectionView.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor
            ),
            hashTagCollectionView.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor
            ),
            hashTagCollectionView.heightAnchor.constraint(
                equalTo: safeArea.heightAnchor
            )
        ])
    }
}
