//
//  Product.swift
//  Hepsiburada Clone
//
//  Created by Tural Babayev on 4.10.2024.
//

import Foundation

class Product{
    var productId: Int?
    var productImage: String?
    var productSaleTitle: String?
    var productTitle: String?
    var productRate: String?
    var productPrice: String?
    
    init(productId: Int?, productImage: String, productSaleTitle: String, productTitle: String, productRate: String, productPrice: String) {
        self.productId = productId
        self.productImage = productImage
        self.productSaleTitle = productSaleTitle
        self.productTitle = productTitle
        self.productRate = productRate
        self.productPrice = productPrice
    }
}
