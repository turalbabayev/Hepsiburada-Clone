//
//  Tag.swift
//  Hepsiburada Clone
//
//  Created by Tural Babayev on 4.10.2024.
//

import Foundation

class Tag{
    var tagId: Int?
    var tagTitle: String?
    
    init(tagId: Int, tagTitle: String) {
        self.tagId = tagId
        self.tagTitle = tagTitle
    }
}
