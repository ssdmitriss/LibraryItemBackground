//
//  ViewBackround.swift
//  Test
//
//  Created by 18893335 on 08.12.2020.
//

import UIKit

class ViewBackround: UICollectionReusableView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}

extension ViewBackround {
    func configure() {
        backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        layer.borderColor = UIColor.black.cgColor

    }
}
