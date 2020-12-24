//
//  LibraryItemCell.swift
//  LibraryModule
//
//  Created by 18893335 on 23.12.2020.
//

import UIKit

final class LibraryItemCell: UICollectionViewCell {
    static let reuseId = "libraryItem"

    let title = UILabel()
    let size = ""

    private let sizeBackroundView = UIView()
    private let containerView  = UIView()
    private let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Cover")
        return imageView
    }()

    private let favouriteButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Icon button"), for: .normal)
        return button
    }()


    private let colors: [UIColor] = [
        #colorLiteral(red: 0.3450980392, green: 0.8784313725, blue: 0.5764705882, alpha: 1),
        #colorLiteral(red: 0.3254901961, green: 0.8588235294, blue: 0.7254901961, alpha: 1),
        #colorLiteral(red: 0.3607843137, green: 0.8980392157, blue: 0.8823529412, alpha: 1),
        #colorLiteral(red: 0.4509803922, green: 0.831372549, blue: 0.9803921569, alpha: 1),
        #colorLiteral(red: 0.9607843137, green: 0.4431372549, blue: 0.4549019608, alpha: 1),
        #colorLiteral(red: 1, green: 0.6196078431, blue: 0.4117647059, alpha: 1),
        #colorLiteral(red: 1, green: 0.8784313725, blue: 0.4, alpha: 1),
        #colorLiteral(red: 0.7529411765, green: 0.8980392157, blue: 0.4666666667, alpha: 1),
        #colorLiteral(red: 0.4901960784, green: 0.6117647059, blue: 0.9607843137, alpha: 1),
        #colorLiteral(red: 0.6392156863, green: 0.4, blue: 0.8784313725, alpha: 1),
        #colorLiteral(red: 0.8392156863, green: 0.4117647059, blue: 0.8392156863, alpha: 1),
        #colorLiteral(red: 0.8980392157, green: 0.5058823529, blue: 0.6392156863, alpha: 1),
        #colorLiteral(red: 0.8980392157, green: 0.5058823529, blue: 0.6392156863, alpha: 1),
        #colorLiteral(red: 0.9607843137, green: 0.4431372549, blue: 0.4549019608, alpha: 1),
        #colorLiteral(red: 1, green: 0.6196078431, blue: 0.4117647059, alpha: 1),
        #colorLiteral(red: 0.8392156863, green: 0.4117647059, blue: 0.8392156863, alpha: 1)
    ]

    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
