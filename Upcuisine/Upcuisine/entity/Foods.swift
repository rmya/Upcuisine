//
//  Foods.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 25.05.2022.
//

import Foundation

class Foods : Codable {
    var yemek_id : Int?
    var yemek_adi : String?
    var yemek_resim_adi : String?
    var yemek_fiyat : String?
    
    init(yemek_id:Int, yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:String){
        self.yemek_id = yemek_id
        self.yemek_adi = yemek_adi
        self.yemek_resim_adi = yemek_resim_adi
        self.yemek_fiyat = yemek_fiyat
    }
}
