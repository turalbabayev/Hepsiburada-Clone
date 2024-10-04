//
//  TagCollectionViewCell.swift
//  Hepsiburada Clone
//
//  Created by Tural Babayev on 4.10.2024.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    //@IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var backgroundViewForCell: UIView!
    
    
    
    @IBOutlet weak var nameTag: UILabel!
    
        
    override func layoutSubviews() {
        super.layoutSubviews()
        // Arka planın yuvarlanmasını sağlamak
        backgroundViewForCell.layer.cornerRadius = 15
    }
}
