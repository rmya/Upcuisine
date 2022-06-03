//
//  FoodDetailProtocols.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 26.05.2022.
//

import Foundation

protocol ViewToPresenterFoodDetailProtocol {
    
    var foodDetayInteractor : PresenterToInteractorFoodDetailProtocol? {get set}
    
    func addToCart(yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:String, yemek_siparis_adet:String, kullanici_adi:String)
}

protocol PresenterToInteractorFoodDetailProtocol{
    func toCart(yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:String, yemek_siparis_adet:String, kullanici_adi:String)
}

protocol InteractorToPresenterFoodDetailProtocol {
    func sendDataToPresenter(cartList: Array<CartFoods>)
}

protocol PresenterToViewFoodDetailProtocol {
    func sendDataToView(cartList: Array<CartFoods>)
}

protocol PresenterToRouterFoodDetailProtocol {
    static func createModule(ref:FoodDetailViewController)
}

