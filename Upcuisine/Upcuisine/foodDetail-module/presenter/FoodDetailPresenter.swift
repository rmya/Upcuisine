//
//  FoodDetailPresenter.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 26.05.2022.
//

import Foundation

class FoodDetailPresenter : ViewToPresenterFoodDetailProtocol {
    
    var foodDetayInteractor: PresenterToInteractorFoodDetailProtocol?
    
    func addToCart(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: String, kullanici_adi: String) {
        foodDetayInteractor?.toCart(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
    }
    
    
}
