//
//  GeneralRepository.swift
//  Hepsiburada Clone
//
//  Created by Tural Babayev on 30.09.2024.
//

import Foundation
import RxSwift

class GeneralRepository{
    var bannerList = BehaviorSubject<[HeaderBanner]>(value: [HeaderBanner]())
    var categoryList = BehaviorSubject<[Category]>(value: [Category]())
    var tagList = BehaviorSubject<[Tag]>(value: [Tag]())
    var midBannerList = BehaviorSubject<[MidBanner]>(value: [MidBanner]())
    var productList = BehaviorSubject<[Product]>(value: [Product]())

    func loadBannerList(){
        var list = [HeaderBanner]()
        let b1 = HeaderBanner(bannerId: 1, bannerImage: "header2")
        let b2 = HeaderBanner(bannerId: 2, bannerImage: "header3")
        let b3 = HeaderBanner(bannerId: 3, bannerImage: "header4")
        let b4 = HeaderBanner(bannerId: 4, bannerImage: "header1")
        list.append(b1)
        list.append(b2)
        list.append(b3)
        list.append(b4)
        
        bannerList.onNext(list)
    }
    
    func loadCategoryList(){
        var cList = [Category]()
        let c1 = Category(categoryHeaderId: 1, categoryHeaderTitle: "1-6 Ekim", categoryImage: "category1", categoryTitle: "Alışverişe Başla")
        let c2 = Category(categoryHeaderId: 2, categoryHeaderTitle: "%15 Net İndirim", categoryImage: "category2", categoryTitle: "Süpermarket")
        let c3 = Category(categoryHeaderId: 3, categoryHeaderTitle: "Fırsatları Kaçırma", categoryImage: "category3", categoryTitle: "Elektronik Ürünler")
        let c4 = Category(categoryHeaderId: 4, categoryHeaderTitle: "%0 Faiz", categoryImage: "category4", categoryTitle: "Hepsipay")
        let c5 = Category(categoryHeaderId: 5, categoryHeaderTitle: "Sepette %10 İndirim", categoryImage: "category5", categoryTitle: "Küçük Ev Aletleri")
        let c6 = Category(categoryHeaderId: 6, categoryHeaderTitle: "%5 Net İndirim", categoryImage: "category6", categoryTitle: "Laptop")
        let c7 = Category(categoryHeaderId: 7, categoryHeaderTitle: "%5 Net İndirim", categoryImage: "category7", categoryTitle: "Samsung")
        let c8 = Category(categoryHeaderId: 8, categoryHeaderTitle: "Şimdi Satışta", categoryImage: "category8", categoryTitle: "iPhone 16")
        cList.append(c1)
        cList.append(c2)
        cList.append(c3)
        cList.append(c4)
        cList.append(c5)
        cList.append(c6)
        cList.append(c7)
        cList.append(c8)
        
        categoryList.onNext(cList)
    }
    
    func loadTagList(){
        var tList = [Tag]()
        let t1 = Tag(tagId: 1, tagTitle: "Elektrikli Ev Aletleri")
        let t2 = Tag(tagId: 2, tagTitle: "Cep Telefonu")
        let t3 = Tag(tagId: 3, tagTitle: "Tablet")
        let t4 = Tag(tagId: 4, tagTitle: "Elektrikli Mutfak Aletleri")
        let t5 = Tag(tagId: 5, tagTitle: "Sağlık / Kişisel Bakım")
        let t6 = Tag(tagId: 6, tagTitle: "Isıtma ve Soğutma")
        let t7 = Tag(tagId: 7, tagTitle: "Cep Telefonu Aksesuaları")
        let t8 = Tag(tagId: 8, tagTitle: "Ses ve Görüntü Sistemleri")
        let t9 = Tag(tagId: 9, tagTitle: "Aksesuarlar")
        let t10 = Tag(tagId: 10, tagTitle: "Beyaz Eşya & Ankastre")
        tList.append(t1)
        tList.append(t2)
        tList.append(t3)
        tList.append(t4)
        tList.append(t5)
        tList.append(t6)
        tList.append(t7)
        tList.append(t8)
        tList.append(t9)
        tList.append(t10)
        
        tagList.onNext(tList)
    }
    
    func loadMidBannerList(){
        var mList = [MidBanner]()
        let md1 = MidBanner(bannerId: 1, bannerImage: "1")
        let md2 = MidBanner(bannerId: 2, bannerImage: "2")
        let md3 = MidBanner(bannerId: 3, bannerImage: "3")
        let md4 = MidBanner(bannerId: 4, bannerImage: "4")
        let md5 = MidBanner(bannerId: 5, bannerImage: "5")
        let md6 = MidBanner(bannerId: 6, bannerImage: "6")
        let md7 = MidBanner(bannerId: 7, bannerImage: "7")
        let md8 = MidBanner(bannerId: 8, bannerImage: "8")
        let md9 = MidBanner(bannerId: 9, bannerImage: "9")
        let md10 = MidBanner(bannerId: 10, bannerImage: "10")
        let md11 = MidBanner(bannerId: 11, bannerImage: "11")
        mList.append(md1)
        mList.append(md2)
        mList.append(md3)
        mList.append(md4)
        mList.append(md5)
        mList.append(md6)
        mList.append(md7)
        mList.append(md8)
        mList.append(md9)
        mList.append(md10)
        mList.append(md11)
        
        midBannerList.onNext(mList)
    }
    
    func loadProductList(){
        var pList = [Product]()
        let p1 = Product(productId: 1, productImage: "p1", productSaleTitle: "3 ay sonra taksitle ode", productTitle: "Kiwi KSC4211 Buharlı Temizleyici", productRate: "pr1", productPrice: "879,00 TL")
        let p2 = Product(productId: 2, productImage: "p2", productSaleTitle: "3 ay sonra taksitle ode", productTitle: "Kiwi KCC-4325W Koltuk ve Halı Yıkama Makinesi", productRate: "pr1", productPrice: "5.299,00 TL")
        let p3 = Product(productId: 3, productImage: "p3", productSaleTitle: "3 ay sonra taksitle ode", productTitle: "Kiwi KSC-4255 Buharlı Temizleyici", productRate: "pr1", productPrice: "2.799,00 TL")
        let p4 = Product(productId: 4, productImage: "p4", productSaleTitle: "3 ay sonra taksitle ode", productTitle: "Dyson Cinetic Big Ball Absolute 2 Elektrikli Süpürge", productRate: "pr1", productPrice: "13.999,00 TL")
        let p5 = Product(productId: 5, productImage: "p5", productSaleTitle: "3 ay sonra taksitle ode", productTitle: "Samsung VS20C8524TB/TR Jet 85 Şarjlı Dikey Süpürge, 210W Emiş Gücü, Dijital", productRate: "pr1", productPrice: "12.449,00 TL")
        let p6 = Product(productId: 6, productImage: "p6", productSaleTitle: "3 ay sonra taksitle ode", productTitle: "Kiwi KVC-4108 Dikey Elektrikli Süpürge Siyah", productRate: "pr1", productPrice: "699,00 TL")
        pList.append(p1)
        pList.append(p2)
        pList.append(p3)
        pList.append(p4)
        pList.append(p5)
        pList.append(p6)
        
        productList.onNext(pList)
    }
}
