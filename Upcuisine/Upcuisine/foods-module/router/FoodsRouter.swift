//
//  FoodsRouter.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 26.05.2022.
//

import Foundation

class FoodsRouter : PresenterToRouterFoodsProtocol {
    static func createModule(ref: FoodsViewController) {
        
        let presenter = FoodsPresenter()
        
        ref.foodsPresenterObject = presenter
        
        ref.foodsPresenterObject?.foodsInteractor = FoodsInteractor()
        ref.foodsPresenterObject?.foodsView = ref
        
        ref.foodsPresenterObject?.foodsInteractor?.foodsPresenter = presenter
    }
}
