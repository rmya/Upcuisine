//
//  FoodDetailPresenter.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 26.05.2022.
//

import Foundation

class FoodDetailPresenter : ViewToPresenterFoodDetailProtocol, ViewToPresenterCartProtocol{
    
    var foodDetayInteractor: PresenterToInteractorFoodDetailProtocol?
    
    func addToCart(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: String, kullanici_adi: String) {
        foodDetayInteractor?.toCart(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
    }
    
    var cartInteractor: PresenterToInteractorCartProtocol?
    
    var cartView: PresenterToViewCartProtocol?
    
    func loadCart(kullanici_adi: String) {
        cartInteractor?.loadCartData(kullanici_adi: kullanici_adi)
    }
    
    func delete(sepet_yemek_id: String, kullanici_adi: String) {
        cartInteractor?.deleteFood(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    
}

extension FoodDetailPresenter : InteractorToPresenterCartProtocol{
    func sendDataToPresenter(cartList: Array<CartFoods>) {
        cartView?.sendDataToView(cartList: cartList)
    }
}
