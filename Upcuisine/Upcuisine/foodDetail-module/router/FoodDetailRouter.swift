//
//  FoodDetailRouter.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 26.05.2022.
//

import Foundation

class FoodDetailsRouter : PresenterToRouterFoodDetailProtocol {
    static func createModule(ref: FoodDetailViewController) {
        ref.foodDetailPresenterObject = FoodDetailPresenter()
        ref.foodDetailPresenterObject?.foodDetayInteractor = FoodDetailInteractor()
    }
    
    
}
