//
//  GradientCell.swift
//  LibraryModule
//
//  Created by 18893335 on 18.12.2020.
//

import UIKit

final class GradientCell: UICollectionViewCell {

    static let reuseId = "gradient"

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
    var title = UILabel()

    private var imageView = UIImageView()

    private let ourBackground = UIImageView()
    private let favouriteButton = UIButton()

    private var startColor: CGColor!
    private var endColor: CGColor!

    private let sizeLabel = UILabel()
    private let viewForSizeLabel = UIView()



    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
//        configureColors()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}

extension GradientCell {

    func configureColors(with title: String) {
        var colorIndex = abs(Int(strHash(title))) % (colors.count - 1)
        if [3, 7, 11, 15].contains(colorIndex) {
            colorIndex -= 3
        }
        startColor = colors[colorIndex].cgColor
        endColor = colors[colorIndex + 1].cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [startColor, endColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        imageView.layer.addSublayer(gradientLayer)

    }

    private func strHash(_ str: String) -> UInt64 {
        var result = UInt64(5381)
        let buf = [UInt8](str.utf8)
        for b in buf {
            result = 127 * (result & 0x00ffffffffffffff) + UInt64(b)
        }
        return result
     }

    private func configure() {

        title.numberOfLines = 0
        ourBackground.image = #imageLiteral(resourceName: "Cover")
        sizeLabel.text = "6,9 Мб"
        favouriteButton.setImage(#imageLiteral(resourceName: "Icon button"), for: .normal)

        sizeLabel.translatesAutoresizingMaskIntoConstraints = false
        favouriteButton.translatesAutoresizingMaskIntoConstraints = false
        ourBackground.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        viewForSizeLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = CGFloat(0.85)
        self.addSubview(imageView)
        self.addSubview(ourBackground)
        self.addSubview(title)
        self.addSubview(favouriteButton)
        viewForSizeLabel.addSubview(sizeLabel)
        self.addSubview(viewForSizeLabel)

//        imageView.layer.borderColor = UIColor.black.cgColor
//        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true

        title.font = title.font.withSize(24)
        title.textColor = .black

        sizeLabel.font.withSize(20)

        viewForSizeLabel.layer.cornerRadius = 4
        viewForSizeLabel.clipsToBounds = true
        viewForSizeLabel.backgroundColor = UIColor.black.withAlphaComponent(CGFloat(0.08))
        viewForSizeLabel.layer.opacity = 30

        ourBackground.alpha = CGFloat(0.88)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            ourBackground.topAnchor.constraint(equalTo: self.topAnchor),
            ourBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ourBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ourBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),

            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 72),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),

            favouriteButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            favouriteButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),

            sizeLabel.topAnchor.constraint(equalTo: viewForSizeLabel.topAnchor, constant: 2),
            sizeLabel.bottomAnchor.constraint(equalTo: viewForSizeLabel.bottomAnchor, constant: -2),
            sizeLabel.leadingAnchor.constraint(equalTo: viewForSizeLabel.leadingAnchor, constant: 6),
            sizeLabel.trailingAnchor.constraint(equalTo: viewForSizeLabel.trailingAnchor, constant: -6),

            viewForSizeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            viewForSizeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            viewForSizeLabel.heightAnchor.constraint(equalToConstant: 24)




        ])

    }
}

