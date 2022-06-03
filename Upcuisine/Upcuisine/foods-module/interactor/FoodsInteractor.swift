//
//  FoodsInteractor.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 26.05.2022.
//

import Foundation
import Alamofire

class FoodsInteractor : PresenterToInteractorFoodsProtocol {
    
    var foodsPresenter: InteractorToPresenterFoodsProtocol?
    
    func allFoods() {
        
        let url = URL(string: URLs.getAllFoodsURL)
        
        AF.request(url!, method: .get).response { response in
            if let data = response.data{
                do{
                    let res = try JSONDecoder().decode(FoodsResponse.self, from: data)
                    if let list = res.yemekler{
                        self.foodsPresenter?.sendDataToPresenter(foodList: list)
                    }
                }catch{
                    print(error.localizedDescription)
                    print(String(describing: error))
                }
            }
        }
    }
    
    
}
