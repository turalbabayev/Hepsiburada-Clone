//
//  UIHelper.swift
//  Hepsiburada Clone
//
//  Created by Tural Babayev on 1.10.2024.
//

import Foundation
import UIKit


class UIHelper{
    
    func configureTextFieldIcons(textField: UITextField){
        // Sol tarafa arama ikonu eklemek
        let searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        searchIcon.contentMode = .scaleAspectFit
        searchIcon.tintColor = .black

        let searchView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        searchView.addSubview(searchIcon)
        searchIcon.frame = CGRect(x: 10, y: 8, width: 20, height: 20)

        textField.leftView = searchView
        textField.leftViewMode = .always

        // Sağ tarafa kamera ikonu eklemek
        let cameraIcon = UIButton(type: .system)
        cameraIcon.setImage(UIImage(systemName: "camera"), for: .normal)
        cameraIcon.tintColor = .black

        let cameraView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        cameraView.addSubview(cameraIcon)
        cameraIcon.frame = CGRect(x: 8, y: 8, width: 22, height: 20)

        textField.rightView = cameraView
        textField.rightViewMode = .always
    }
    
    func addBottomColoredLines(to textField: UITextField, withColors colors: [UIColor], andWidths widths: [CGFloat]) {
        // TextField'ın içine container UIView ekle
        let coloredLineContainer = UIView()
        coloredLineContainer.translatesAutoresizingMaskIntoConstraints = false
        coloredLineContainer.layer.cornerRadius = textField.layer.cornerRadius
        coloredLineContainer.clipsToBounds = true
        textField.addSubview(coloredLineContainer)

        // TextField'ın altına ekle ve konumlandır
        NSLayoutConstraint.activate([
            coloredLineContainer.leadingAnchor.constraint(equalTo: textField.leadingAnchor, constant: 0),
            coloredLineContainer.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 0),
            coloredLineContainer.bottomAnchor.constraint(equalTo: textField.bottomAnchor),
            coloredLineContainer.heightAnchor.constraint(equalToConstant: 3)
        ])

        // 5 Farklı Renk için UIView ekle
        var previousView: UIView?

        for (index, color) in colors.enumerated() {
            let colorView = UIView()
            colorView.backgroundColor = color
            colorView.translatesAutoresizingMaskIntoConstraints = false
            colorView.layer.cornerRadius = 1.5
            colorView.clipsToBounds = true
            coloredLineContainer.addSubview(colorView)

            if let previousView = previousView {
                NSLayoutConstraint.activate([
                    colorView.leadingAnchor.constraint(equalTo: previousView.trailingAnchor),
                    colorView.widthAnchor.constraint(equalToConstant: widths[index]),
                    colorView.topAnchor.constraint(equalTo: coloredLineContainer.topAnchor),
                    colorView.bottomAnchor.constraint(equalTo: coloredLineContainer.bottomAnchor)
                ])
            } else {
                NSLayoutConstraint.activate([
                    colorView.leadingAnchor.constraint(equalTo: coloredLineContainer.leadingAnchor),
                    colorView.widthAnchor.constraint(equalToConstant: widths[index]),
                    colorView.topAnchor.constraint(equalTo: coloredLineContainer.topAnchor),
                    colorView.bottomAnchor.constraint(equalTo: coloredLineContainer.bottomAnchor)
                ])
            }

            previousView = colorView
        }

        if let previousView = previousView {
            NSLayoutConstraint.activate([
                previousView.trailingAnchor.constraint(equalTo: coloredLineContainer.trailingAnchor)
            ])
        }
    }
    
    func changeTabBarColor(itemAppearance: UITabBarItemAppearance){
        //Seçili Durum
        itemAppearance.selected.iconColor = UIColor(named: "mainColor")
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(named: "mainColor")!]
        itemAppearance.selected.badgeBackgroundColor = UIColor.red
        //Seçili Olmayan Durum
        itemAppearance.normal.iconColor = UIColor.gray
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
    }
    
    func configureView(uiView: UIView){
    uiView.layer.cornerRadius = 12
    uiView.layer.masksToBounds = true
        uiView.layer.backgroundColor = UIColor.white.cgColor
    
}
    
    func configureAddressUIView(adressView: UIView) {
        adressView.layer.cornerRadius = 10
        adressView.layer.masksToBounds = true
        adressView.layer.borderWidth = 0.5
        adressView.layer.borderColor = UIColor.lightGray.cgColor
    }
}
