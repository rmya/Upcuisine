//
//  FoodDetailInteractor.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 26.05.2022.
//

import Foundation
import Alamofire

//class FoodDetailInteractor : PresenterToInteractorFoodDetailProtocol {
//
//    func toCart(yemek_id: Int, yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String) {
//        let params:Parameters = ["yemek_id":yemek_id, "yemek_adi":yemek_adi, "yemek_resim_adi":yemek_resim_adi, "yemek_fiyat":yemek_fiyat]
//
//        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post, parameters: params).response { response.in
//            if let data = response.data{
//                do{
//                    let res = try JSONDecoder().decode(FoodsResponse.self, from: data)
//                    if let list = res.yemekler{
//                        self.foodsPresenter?.sendDataToPresenter(foodList: list)
//                    }
//                }catch{
//                    print(error.localizedDescription)
//                    print(String(describing: error))
//                }
//            }
//        }
//    }
//
//
//}
