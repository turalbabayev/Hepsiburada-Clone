//
//  ViewController.swift
//  Hepsiburada Clone
//
//  Created by Tural Babayev on 30.09.2024.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    
    
    var bannerList = [HeaderBanner]()
    var categoryList = [Category]()
    var midBannerList = [MidBanner]()
    var tagList = [Tag]()
    var productList = [Product]()
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var adressUIView: UIView!
    let uiHelper = UIHelper()
    let viewModel = HomeViewModel()
    @IBOutlet weak var premiumCardView: UIView!
    @IBOutlet weak var hepsiPayCardView: UIView!
    @IBOutlet weak var headerSliderCollectionView: UICollectionView!
    @IBOutlet weak var headerCategoryCollectionView: UICollectionView!
    @IBOutlet weak var middleSliderCollectionView: UICollectionView!
    @IBOutlet weak var tagCollectionView: UICollectionView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    var timer = Timer()
    var currentIndex = 0
    var selectedIndex =  0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        headerSliderCollectionView.delegate = self
        headerSliderCollectionView.dataSource = self
        viewModel.delegate = self
        viewModel.startTimer()
        viewModel.startTimerMid()
        headerCategoryCollectionView.delegate = self
        headerCategoryCollectionView.dataSource = self
        middleSliderCollectionView.delegate = self
        middleSliderCollectionView.dataSource = self
        tagCollectionView.dataSource = self
        tagCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        
        
        _ = viewModel.bannerList.subscribe(onNext: { bannerList in
            self.bannerList = bannerList
            self.headerSliderCollectionView.reloadData()
        })
        
        _ = viewModel.categoryList.subscribe(onNext: { categoryList in
            self.categoryList = categoryList
            self.headerCategoryCollectionView.reloadData()
        })
        
        _ = viewModel.tagList.subscribe(onNext: { tagList in
            self.tagList = tagList
            self.tagCollectionView.reloadData()
        })
        
        _ = viewModel.midBannerList.subscribe(onNext: { midBannerList in
            self.midBannerList = midBannerList
            self.middleSliderCollectionView.reloadData()
        })
        
        
        _ = viewModel.productList.subscribe(onNext: { productList in
            self.productList = productList
            self.productCollectionView.reloadData()
        })
        
        
        // AdressUIView yapılandırması
        uiHelper.configureAddressUIView(adressView: adressUIView)

        // TextField için ikonları ekle
        uiHelper.configureTextFieldIcons(textField: textField)
        
        // TextField için altına renkli çizgiler ekle
        let colors: [UIColor] = [.orange, UIColor(named: "skyBlue")!, .purple, .green, UIColor(named: "middlePurple")!]
        let widths: [CGFloat] = [120, 50, 50, 50, 50]
        uiHelper.addBottomColoredLines(to: textField, withColors: colors, andWidths: widths)

        // Tab bar ayarları
        configureTabBarAppearance()
        
        //UIView Ayarlari
        uiHelper.configureView(uiView: premiumCardView)
        uiHelper.configureView(uiView: hepsiPayCardView)
        
        // Auto Layout için manuel ayarları etkinleştir
        premiumCardView.translatesAutoresizingMaskIntoConstraints = false
        hepsiPayCardView.translatesAutoresizingMaskIntoConstraints = false
        
        hepsiPayCardView.layer.borderWidth = 0.2
        hepsiPayCardView.layer.borderColor = UIColor.lightGray.cgColor

        // HepsiPayCardView için genişlik constraint'i ekle
        hepsiPayCardView.widthAnchor.constraint(equalToConstant: 150).isActive = true

        // PremiumCardView'ın genişliğini HepsiPayCardView'ın genişliğinin %80'i yap
        premiumCardView.widthAnchor.constraint(equalTo: hepsiPayCardView.widthAnchor, multiplier: 0.7).isActive = true
        
        headerSliderCollectionView.tag = 1
        headerCategoryCollectionView.tag = 2
        middleSliderCollectionView.tag = 3
        tagCollectionView.tag = 4
        productCollectionView.tag = 5
        
        
        
        headerCategoryCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
    }
    
    
        
    func configureTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.white
        
        uiHelper.changeTabBarColor(itemAppearance: appearance.stackedLayoutAppearance)
        uiHelper.changeTabBarColor(itemAppearance: appearance.inlineLayoutAppearance)
        uiHelper.changeTabBarColor(itemAppearance: appearance.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
        
        
    }

    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1{
            return bannerList.count
        }
        else if collectionView.tag == 2{
            return categoryList.count
        } else if collectionView.tag == 3{
            return midBannerList.count
        }
        else if collectionView.tag == 4{
            return tagList.count
        }
        else{
            return productList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1{
            let headerSliderCell = collectionView.dequeueReusableCell(withReuseIdentifier: "headerSlider", for: indexPath) as! headerSliderCollectionViewCell
            headerSliderCell.sliderImage.image = UIImage(named: bannerList[indexPath.row].bannerImage!)
            headerSliderCell.sliderImage.layer.cornerRadius = 12
            
            return headerSliderCell
        }
        else if collectionView.tag == 2{
            let headerCategoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryHeaderCellView
            headerCategoryCell.headerCategoryTitle.text = categoryList[indexPath.row].categoryHeaderTitle!
            headerCategoryCell.layer.cornerRadius = 3
            headerCategoryCell.categoryButton.layer.cornerRadius = 3
            headerCategoryCell.categoryButton.clipsToBounds = true
            headerCategoryCell.categoryTitle.text = categoryList[indexPath.row].categoryTitle!
            headerCategoryCell.imageView.image = UIImage(named: categoryList[indexPath.row].categoryImage!)
            headerCategoryCell.imageView.layer.cornerRadius = 3
            headerCategoryCell.imageView.clipsToBounds = true
            
            return headerCategoryCell
        }
        else if collectionView.tag == 3{
            let middleSliderCell = collectionView.dequeueReusableCell(withReuseIdentifier: "middleCell", for: indexPath) as! MiddleSliderCollectionViewCell
            
            middleSliderCell.imageView.layer.cornerRadius = 12
            middleSliderCell.imageView.image = UIImage(named: midBannerList[indexPath.row].bannerImage!)
            return middleSliderCell
        }
        else if collectionView.tag == 4{
            let tagCell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCell", for: indexPath) as! TagCollectionViewCell
            
            if indexPath.row == selectedIndex { // Seçili eleman örneği
                tagCell.backgroundViewForCell.backgroundColor = UIColor(named: "mainColor")?.withAlphaComponent(0.2)
                tagCell.nameTag.textColor = UIColor(named: "mainColor")
                tagCell.backgroundViewForCell.layer.borderWidth = 0
            } else {
                tagCell.backgroundViewForCell.backgroundColor = UIColor.white
                tagCell.nameTag.textColor = .black
                tagCell.backgroundViewForCell.layer.borderWidth = 0.2
                tagCell.backgroundViewForCell.layer.borderColor = UIColor.lightGray.cgColor

            }
            
            tagCell.nameTag.text = tagList[indexPath.row].tagTitle
            
            return tagCell
        }
        else{
            let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCollectionViewCell
            productCell.productImage.image = UIImage(named: productList[indexPath.row].productImage!)
            productCell.productSaleTitle.text = productList[indexPath.row].productSaleTitle!
            productCell.productTitle.text = productList[indexPath.row].productTitle!
            productCell.productRate.image = UIImage(named: productList[indexPath.row].productRate!)
            productCell.productPrice.text = productList[indexPath.row].productPrice!
            productCell.layer.cornerRadius = 12
            productCell.layer.borderWidth = 0.2
            productCell.layer.borderColor = UIColor.lightGray.cgColor
            productCell.productSaleTitle.layer.cornerRadius = 4
            productCell.productSaleTitle.backgroundColor = UIColor(named: "categoryHeaderColor")?.withAlphaComponent(0.3)
            productCell.productSaleTitle.textColor = UIColor(named: "categoryHeaderColor")
            productCell.productSaleTitle.textAlignment = .center
            productCell.productSaleTitle.layer.masksToBounds = true
            
            return productCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 1{
            return CGSize(width: headerSliderCollectionView.frame.width, height: headerSliderCollectionView.frame.height)
        }
        else if collectionView.tag == 2{
            let screenWidth = UIScreen.main.bounds.width
            let itemWidth = (screenWidth - 50)/4
            
            return CGSize(width: itemWidth, height: itemWidth)
        }
        else if collectionView.tag == 3{
            return CGSize(width: middleSliderCollectionView.frame.width, height: middleSliderCollectionView.frame.height)
        }
        else if collectionView.tag == 4{
            let label = UILabel()
            
            label.text = tagList[indexPath.row].tagTitle
            label.font = UIFont.systemFont(ofSize: 10) // Fontun aynı olduğundan emin olun

            let labelSize = label.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: 30))

            return CGSize(width: labelSize.width + 30, height: 30) // Ekstra 30px padding
        }
        else{
            return CGSize(width: productCollectionView.frame.width/2.8, height: productCollectionView.frame.height)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 1{
            return 0
        }
        else if collectionView.tag == 2{
            return 5
        }
        else if collectionView.tag == 3{
            return 0
        }
        else{
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView.tag == 1{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        else if collectionView.tag == 2{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        else{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView.tag == 1{
            return 0
        }
        else if collectionView.tag == 2{
            return 10
        }
        else if collectionView.tag == 3{
            return 0
        }
        else{
            return 10
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        collectionView.reloadData() // Tüm collection view'i yeniden yükleyerek görünümü güncelle
    }
    
}

extension HomeViewController: HeaderSliderTimerDelegate{
    func scrollToItem(at index: Int) {
        return headerSliderCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    func bannerListCount() -> Int {
        return bannerList.count
    }
    
    func scrollToItemMid(at index: Int) {
        return middleSliderCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    func midBannerListCount()->Int{
        return midBannerList.count
    }
    
    
}




