//
//  HeaderBanner.swift
//  Hepsiburada Clone
//
//  Created by Tural Babayev on 1.10.2024.
//

import Foundation

class HeaderBanner{
    var bannerId: Int?
    var bannerImage: String?
    
    init(bannerId: Int, bannerImage: String) {
        self.bannerId = bannerId
        self.bannerImage = bannerImage
    }
}
