//
//  FoodDetailProtocols.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 26.05.2022.
//

import Foundation

protocol ViewToPresenterFoodDetailProtocol {
    
    var foodDetayInteractor : PresenterToInteractorFoodDetailProtocol? {get set}
    
    func addToCart(yemek_id:Int,yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:String)
}

protocol PresenterToInteractorFoodDetailProtocol{
    func toCart(yemek_id:Int,yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:String)
}

protocol PresenterToRouterFoodDetailProtocol {
    static func createModule(ref:FoodDetailViewController)
}

