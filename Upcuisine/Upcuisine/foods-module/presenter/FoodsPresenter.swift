//
//  FoodsPresenter.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 26.05.2022.
//

import Foundation

class FoodsPresenter : ViewToPresenterFoodsProtocol {
    
    var foodsInteractor: PresenterToInteractorFoodsProtocol?
    
    var foodsView: PresenterToViewFoodsProtocol?
    
    func loadAllFoods() {
        foodsInteractor?.allFoods()
    }
    
}

extension FoodsPresenter : InteractorToPresenterFoodsProtocol {
    
    func sendDataToPresenter(foodList: Array<Foods>) {
        foodsView?.sendDataToView(foodList: foodList)
    }
    
    
}
