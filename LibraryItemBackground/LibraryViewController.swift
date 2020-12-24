//
//  ViewController.swift
//  Playground
//
//  Created by 18893335 on 07.12.2020.
//

import UIKit
import SwiftUI

class LibraryViewController: UIViewController {

    enum Section: Int, CaseIterable {
        case gradientGenetator
    }
//    var allBooks = Bundle.main.decode([Book].self, from: "all_books_data.json")
    var dataSource: UICollectionViewDiffableDataSource<Section, GradientModel>! = nil
    var collectionView: UICollectionView! = nil

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
    
    var colorInd = 0
    var hashTitleForGradient = [Int:CAGradientLayer]()
    var allBooks = Bundle.main.decode(Welcome.self, from: "all_books_data.json")
    var allBooksItem: [GradientModel] = []

    private func generateGradient(for view: UIView) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [colors[colorInd].cgColor, colors[colorInd + 1].cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        colorInd += 1
        if colorInd == colors.count - 1 {
            colorInd = 0
        }
        return gradientLayer

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        for (key, book) in allBooks.folders.mainFolder.books.enumerated() {
            allBooksItem.append(GradientModel(title: book.title, id: key))
        }

        allBooksItem.sort {
            $0.title < $1.title
        }

        view.backgroundColor = .white
        title = "Продукты и технологии продаж"
        navigationController?.tabBarItem.title = "Библиотека"
        setupSearchBar()
        configureHierarchy()
        configureDataSource()
        reloadData(with: nil)
    }

    private func setupSearchBar() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()

        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск по названию, ИНН, номеру договора"
        searchController.searchBar.delegate = self
    }

    private func configureHierarchy() {

        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .white

        view.addSubview(collectionView)

        collectionView.register(GradientCell.self, forCellWithReuseIdentifier: GradientCell.reuseId)



    }
}

//MARK: - Setup Layout
extension LibraryViewController {
    
    private func createLayout() -> UICollectionViewLayout {

        // Как лучше снести строку?
        let layout = UICollectionViewCompositionalLayout(section: createGradientSection())
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config

        return layout
    }
    
    private func createGradientSection() -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(158),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(210))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .flexible(10)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 20, bottom: 80, trailing: 20)
//        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }

}

//MARK:- Data source
extension LibraryViewController {

    private func configureDataSource() {

        // Как снести здесь?
        dataSource = UICollectionViewDiffableDataSource<Section, GradientModel>(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, gradient) -> UICollectionViewCell? in

                guard let section = Section(rawValue: indexPath.section) else {
                    fatalError("Unknown section kind")
                }

                switch section {

                case .gradientGenetator:
                    guard let cell = collectionView.dequeueReusableCell(
                            withReuseIdentifier: GradientCell.reuseId,
                            for: indexPath) as? GradientCell else {
                        fatalError("Unable to dequeue cellType")
                    }
                    cell.title.text = gradient.title
//                    cell.imageView = gradient.backgroundView!
                    print(gradient.title , gradient.title.utf8)
                    cell.configureColors(with: gradient.title)
                    
                    return cell


                }
            })
        

    }

    private func reloadData(with searchText: String?) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, GradientModel>()
        snapshot.appendSections([.gradientGenetator])
        snapshot.appendItems(allBooksItem, toSection: .gradientGenetator)

        dataSource.apply(snapshot, animatingDifferences: false)
    }

}

//MARK: - UISearchBarDelegate
extension LibraryViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        reloadData(with: searchText)
    }
}

//MARK: - SwiftUI

struct LibraryViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = MainTabBarController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

        }
    }
}
