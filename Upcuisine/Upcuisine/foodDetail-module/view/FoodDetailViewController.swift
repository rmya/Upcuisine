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
    
    var food : Foods?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let f = food {
            DispatchQueue.main.async {
                let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(f.yemek_resim_adi!)")
                self.detailImageView.kf.setImage(with: url)
            }
            detailFoodName.text = f.yemek_adi
            detailFoodPrice.text = "\(f.yemek_fiyat!) ₺"
            
        }

    }
    @IBAction func foodCount(_ sender: UIStepper) {
        var foodCount = Int(sender.value)
        
    }
    

}
