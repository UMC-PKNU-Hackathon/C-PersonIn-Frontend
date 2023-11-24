//
//  CafeInProfileImageView.swift
//  CafeIn
//
//  Created by 제민우 on 11/24/23.
//

import UIKit

final class CafeInProfileImageView: UIImageView {
    init() {
        super.init(frame: .zero)
        contentMode = .scaleToFill
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
}
