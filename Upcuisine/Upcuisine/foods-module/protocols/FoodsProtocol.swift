//
//  FoodsProtocol.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 26.05.2022.
//

import Foundation

protocol ViewToPresenterFoodsProtocol {
    
    var foodsInteractor : PresenterToInteractorFoodsProtocol?{get set}
    var foodsView : PresenterToViewFoodsProtocol?{get set}
    
    func loadAllFoods()
}

protocol PresenterToInteractorFoodsProtocol {
    
    var foodsPresenter : InteractorToPresenterFoodsProtocol?{get set}
    
    func allFoods()
}

protocol InteractorToPresenterFoodsProtocol{
    func sendDataToPresenter(foodList : Array<Foods>)
}

protocol PresenterToViewFoodsProtocol {
    func sendDataToView(foodList : Array<Foods>)
}

protocol PresenterToRouterFoodsProtocol {
    static func createModule(ref:FoodsViewController)
}
