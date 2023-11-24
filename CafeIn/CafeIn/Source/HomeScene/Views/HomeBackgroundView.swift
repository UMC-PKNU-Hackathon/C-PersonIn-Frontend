//
//  HomeBackgroundView.swift
//  CafeIn
//
//  Created by 성대훈 on 11/24/23.
//

import UIKit

final class HomeBackgroundView: UIView {
    
    private let cafeInImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(red: 1, green: 0.98, blue: 0.94, alpha: 1)
        configureSubviews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: Configure UI

extension HomeBackgroundView {
    
    private func configureSubviews() {
        addSubview(cafeInImageView)
        cafeInImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            cafeInImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            cafeInImageView.heightAnchor.constraint(equalToConstant: 20),
            cafeInImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 17)
        ])
    }
    
}
