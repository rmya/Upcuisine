//
//  CartProtocol.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 26.05.2022.
//

import Foundation

protocol ViewToPresenterCartProtocol {
    var cartInteractor : PresenterToInteractorCartProtocol? {get set}
    var cartView : PresenterToViewCartProtocol? {get set}
    
    func loadCart(kullanici_adi:String)
    func delete(sepet_yemek_id:String, kullanici_adi:String)
}

protocol PresenterToInteractorCartProtocol {
    var cartPresenter : InteractorToPresenterCartProtocol? {get set}
    
    func loadCartData(kullanici_adi:String)
    func deleteFood(sepet_yemek_id:String, kullanici_adi:String)
}

protocol InteractorToPresenterCartProtocol {
    func sendDataToPresenter(cartList:Array<CartFoods>)
}

protocol PresenterToViewCartProtocol {
    func sendDataToView(cartList:Array<CartFoods>)
}

protocol PresenterToRouterCartProtocol {
    static func createModule(ref:CartViewController)
}
