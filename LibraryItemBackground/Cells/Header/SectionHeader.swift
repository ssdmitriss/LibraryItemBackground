//
//  SectionHeader.swift
//  Test
//
//  Created by Дмитрий Селезнев on 07.12.2020.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
    static let reuseId = "SectionHeader"
    
    let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            title.topAnchor.constraint(equalTo: self.topAnchor),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func configure(text: String, font: UIFont?, textColor: UIColor) {
        title.textColor = textColor
        title.text = text
        title.font = font
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
