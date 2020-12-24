//
//  GradientModel.swift
//  LibraryModule
//
//  Created by 18893335 on 18.12.2020.
//

import UIKit

struct GradientModel: Hashable {
    let title: String
    var gradientLayer: CAGradientLayer?
    var backgroundView: UIImageView?
    let id: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct Welcome: Codable {
    let folders: Folders
}

// MARK: - Folders
struct Folders: Codable {
    let mainFolder: MainFolder

    enum CodingKeys: String, CodingKey {
        case mainFolder = "main_folder"
    }
}

// MARK: - MainFolder
struct MainFolder: Codable {
    let categories: [Category]
    let books: [Book]
}

// MARK: - Book
struct Book: Codable {
    let title, catID, file: String
    let shellImg: String?
    let horizontalPreview, isVideo: Bool?
    let leanLabs: [Int]?
    let roleList, tbList: [String]?

    enum CodingKeys: String, CodingKey {
        case title
        case catID = "cat_id"
        case file
        case shellImg = "shell_img"
        case horizontalPreview = "horizontal_preview"
        case isVideo, leanLabs, roleList
        case tbList = "TBList"
    }
}

// MARK: - Category
struct Category: Codable {
    let id, title: String
}

