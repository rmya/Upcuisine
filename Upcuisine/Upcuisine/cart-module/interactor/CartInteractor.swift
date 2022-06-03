//
//  CartInteractor.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 26.05.2022.
//

import Foundation
import Alamofire

class CartInteractor : PresenterToInteractorCartProtocol {
    var cartPresenter: InteractorToPresenterCartProtocol?
    
    func loadCartData(kullanici_adi: String) {
        
        let url = URL(string: URLs.loadCartDataURL)
        let params = ["kullanici_adi": kullanici_adi]
        
        AF.request(url!, method: .post,  parameters: params).response { response in
            if let data = response.data {
                do{
                    let res = try JSONDecoder().decode(CartFoodsResponse.self, from: data)
                    print(res.sepet_yemekler!)
                    print(res.success!)
                    if let list = res.sepet_yemekler{
                        self.cartPresenter?.sendDataToPresenter(cartList: list)
                    }
                }catch let error as DecodingError
                {
                    switch error {
                        case .typeMismatch(let key, let value):
                          print("error typeMismatch \(key), value \(value) and ERROR: \(error.localizedDescription)")
                        case .valueNotFound(let key, let value):
                          print("error valueNotFound \(key), value \(value) and ERROR: \(error.localizedDescription)")
                        case .keyNotFound(let key, let value):
                          print("error keyNotFound \(key), value \(value) and ERROR: \(error.localizedDescription)")
                        case .dataCorrupted(let key):
                          print("error dataCorrupted \(key), and ERROR: \(error.localizedDescription)")
                        default:
                          print("ERROR: \(error.localizedDescription)")
                        }
                    self.cartPresenter?.sendDataToPresenter(cartList: [])
                    
                }
                catch{
                    print(error.localizedDescription)
                    print(String(describing: error))
                }
            }
        }
    }
    
    func deleteFood(sepet_yemek_id: String, kullanici_adi: String) {
        
        let url = URL(string: URLs.deleteFoodURL)
        let params : Parameters = ["sepet_yemek_id":sepet_yemek_id,"kullanici_adi":kullanici_adi]
        
        AF.request(url!, method: .post,  parameters: params).response { response in
            
            if let data = response.data{
                do{
                    let res = try JSONDecoder().decode(DeleteFoodFromCartResponse.self, from: data)
                    print(res)
                    print(params)
                    self.loadCartData(kullanici_adi: kullanici_adi)
                }catch{
                    print(error.localizedDescription)
                    print(String(describing: error))
                }
            }
        }
    }
}
