//
//  CartPresenter.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 26.05.2022.
//

import Foundation

class CartPresenter : ViewToPresenterCartProtocol {
    var cartInteractor: PresenterToInteractorCartProtocol?
    var cartView: PresenterToViewCartProtocol?
    
    func loadCart(kullanici_adi: String) {
        cartInteractor?.loadCartData(kullanici_adi: kullanici_adi)
    }
    
    func delete(sepet_yemek_id: String, kullanici_adi: String) {
        cartInteractor?.deleteFood(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
}

extension CartPresenter : InteractorToPresenterCartProtocol {
    func sendDataToPresenter(cartList: Array<CartFoods>) {
        cartView?.sendDataToView(cartList: cartList)
    }
    
    
}
