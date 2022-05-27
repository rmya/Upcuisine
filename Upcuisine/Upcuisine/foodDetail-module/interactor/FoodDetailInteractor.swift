//
//  FoodDetailInteractor.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 26.05.2022.
//

import Foundation
import Alamofire

class FoodDetailInteractor : PresenterToInteractorFoodDetailProtocol {
    
    func toCart(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: String, kullanici_adi: String) {
        let params:Parameters = ["yemek_adi":yemek_adi, "yemek_resim_adi":yemek_resim_adi, "yemek_fiyat":yemek_fiyat, "yemek_siparis_adet": yemek_siparis_adet, "kullanici_adi": kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post, parameters: params).response { response in
            if let data = response.data{
                do{
                    let res = try JSONSerialization.jsonObject(with:data)
                    print(res)
                    print(params)
                }catch{
                    print(error.localizedDescription)
                    print(String(describing: error))
                }
            }
        }
    }
    
    
}
