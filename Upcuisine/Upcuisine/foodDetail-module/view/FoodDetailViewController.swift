//
//  FoodDetailViewController.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 26.05.2022.
//

import UIKit
import Kingfisher

class FoodDetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailFoodName: UILabel!
    @IBOutlet weak var detailFoodPrice: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var foodCountLabel: UILabel!
    
    var food : Foods?
    var foodDetailPresenterObject : ViewToPresenterFoodDetailProtocol?
    var userName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let f = food {
            DispatchQueue.main.async {
                let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(f.yemek_resim_adi!)")
                self.detailImageView.kf.setImage(with: url)
            }
            detailFoodName.text = f.yemek_adi
            detailFoodPrice.text = "\(f.yemek_fiyat!) ₺"
            userName = "rumeysa_tan"
        }
        
        FoodDetailsRouter.createModule(ref: self)

    }
    @IBAction func foodCount(_ sender: UIStepper) {
        let foodCount = Int(sender.value)
        foodCountLabel.text = String(foodCount)
    }
    
    @IBAction func addToCartButton(_ sender: Any) {
        if let fn = detailFoodName.text, let fc = foodCountLabel.text, let un = userName, let f = food{
            foodDetailPresenterObject?.addToCart(yemek_adi: fn, yemek_resim_adi: (f.yemek_resim_adi!), yemek_fiyat:(f.yemek_fiyat!), yemek_siparis_adet: fc, kullanici_adi: un)
        }
    }
    
    
}
