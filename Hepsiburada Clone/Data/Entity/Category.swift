//
//  Category.swift
//  Hepsiburada Clone
//
//  Created by Tural Babayev on 3.10.2024.
//

import Foundation

class Category{
    var categoryHeaderId: Int?
    var categoryHeaderTitle: String?
    var categoryImage: String?
    var categoryTitle: String?
    
    init(categoryHeaderId: Int, categoryHeaderTitle: String, categoryImage: String, categoryTitle: String) {
        self.categoryHeaderId = categoryHeaderId
        self.categoryHeaderTitle = categoryHeaderTitle
        self.categoryImage = categoryImage
        self.categoryTitle = categoryTitle
    }
}
