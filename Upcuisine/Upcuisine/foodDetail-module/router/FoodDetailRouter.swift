//
//  FoodDetailRouter.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 26.05.2022.
//

import Foundation

class FoodDetailsRouter : PresenterToRouterFoodDetailProtocol {
    static func createModule(ref: FoodDetailViewController) {
        
        let presenter = FoodDetailPresenter()
        let cartPresenter = CartPresenter()
        
        ref.foodDetailPresenterObject = presenter
        ref.foodDetailPresenterObject?.foodDetayInteractor = FoodDetailInteractor()
        
        ref.cartPresenterObject = cartPresenter
        ref.cartPresenterObject?.cartInteractor = CartInteractor()
        ref.cartPresenterObject?.cartView = ref
        ref.cartPresenterObject?.cartInteractor?.cartPresenter = cartPresenter
    }
    
    
}
