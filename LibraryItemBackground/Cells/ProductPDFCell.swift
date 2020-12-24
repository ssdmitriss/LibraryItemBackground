//
//  NewMaterialCell.swift
//  Test
//
//  Created by 18893335 on 07.12.2020.
//

import UIKit

class ProductPDFCell: UICollectionViewCell {

    static let reuseId = "productPDF"
    let containerView = UIView()
    var imageView = UIImageView()
    var label = UILabel()

   

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}

extension ProductPDFCell {

    private func configure() {

        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        self.addSubview(label)

        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        
        label.font = label.font.withSize(20)
        label.textColor = .white

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),

            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])

    }
}
