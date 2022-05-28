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
        
        let params = ["kullanici_adi": kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post,  parameters: params).response { response in
            if let data = response.data {
                do{
                    let res = try JSONDecoder().decode(CartFoodsResponse.self, from: data)
                    if let list = res.sepet_yemekler{
                        self.cartPresenter?.sendDataToPresenter(cartList: list)
                    }
                }catch{
                    print(error.localizedDescription)
                    print(String(describing: error))
                }
            }
        }
    }
    
    func deleteFood(sepet_yemek_id: String, kullanici_adi: String) {
        let params : Parameters = ["sepet_yemek_id":sepet_yemek_id,"kullanici_adi":kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post,  parameters: params).response { response in
            if let data = response.data {
                do{
                    let res = try JSONDecoder().decode(CartFoodsResponse.self, from: data)
                    print(res)
                    if let list = res.sepet_yemekler{
                        self.cartPresenter?.sendDataToPresenter(cartList: list)
                    }
                }catch{
                    print(error.localizedDescription)
                    print(String(describing: error))
                }
            }
        }
    }
    
    
}
