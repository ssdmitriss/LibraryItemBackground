//
//  Materil.swift
//  Test
//
//  Created by 18893335 on 08.12.2020.
//

import UIKit

struct Material: Hashable {
    var text: String
    var image: UIImage
    var id: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

//    static func == (lhs: Material, rhs: Material) -> Bool {
//        return lhs.id == rhs.id
//    }

    func contains(filter: String?) -> Bool {
        guard let filter = filter else { return true }
        if filter.isEmpty { return true }
        let lowercasedFilter = filter.lowercased()
        return text.lowercased().contains(lowercasedFilter)
    }
}
