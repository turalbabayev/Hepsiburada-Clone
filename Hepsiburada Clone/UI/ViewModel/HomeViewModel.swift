//
//  HomeViewModel.swift
//  Hepsiburada Clone
//
//  Created by Tural Babayev on 2.10.2024.
//

import Foundation
import RxSwift

protocol HeaderSliderTimerDelegate: AnyObject {
    func scrollToItem(at index: Int)
    func bannerListCount() -> Int
    func scrollToItemMid(at index: Int)
    func midBannerListCount() -> Int
}

class HomeViewModel{
    var timer: Timer?
    var currentIndex = 0
    var currentIndexMid = 0
    var delegate: HeaderSliderTimerDelegate?
    var gRepo = GeneralRepository()
    var bannerList = BehaviorSubject<[HeaderBanner]>(value: [HeaderBanner]())
    var categoryList = BehaviorSubject<[Category]>(value: [Category]())
    var tagList = BehaviorSubject<[Tag]>(value: [Tag]())
    var midBannerList = BehaviorSubject<[MidBanner]>(value: [MidBanner]())
    var productList = BehaviorSubject<[Product]>(value: [Product]())

    init(){
        loadBannerList()
        loadCategoryList()
        loadTagList()
        loadMidBannerList()
        loadProductList()
        bannerList = gRepo.bannerList
        categoryList = gRepo.categoryList
        tagList = gRepo.tagList
        midBannerList = gRepo.midBannerList
        productList = gRepo.productList
    }

    func startTimer(){
        _ = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNextSlide), userInfo: nil, repeats: true)
    }
    
    func startTimerMid(){
        _ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(moveToNextSlideMid), userInfo: nil, repeats: true)
    }
    
    @objc func moveToNextSlide(){
    
        if currentIndex == delegate!.bannerListCount() - 1 {
            currentIndex = -1
        } else{
            currentIndex += 1
            delegate?.scrollToItem(at: currentIndex)
        }
    }
    
    @objc func moveToNextSlideMid(){
        if currentIndexMid == delegate!.midBannerListCount() - 1{
            currentIndexMid = -1
        }
        else{
            currentIndexMid += 1
            delegate?.scrollToItemMid(at: currentIndexMid)
        }
    }
    
    func loadBannerList(){
        gRepo.loadBannerList()
    }
    
    func loadCategoryList(){
        gRepo.loadCategoryList()
    }
    
    func loadTagList(){
        gRepo.loadTagList()
    }
    
    func loadMidBannerList(){
        gRepo.loadMidBannerList()
    }
    
    func loadProductList(){
        gRepo.loadProductList()
    }
}
