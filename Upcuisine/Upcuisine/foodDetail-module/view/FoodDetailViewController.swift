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
    var cartFoods = [CartFoods]()
    var cartFoodsResponse = [AddFoodToCartResponse]()
    var cartPresenterObject : ViewToPresenterCartProtocol?
    var userName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let f = food {
            DispatchQueue.main.async {
                let url = URL(string: URLs.foodImageURL + "\(f.yemek_resim_adi!)")
                self.detailImageView.kf.setImage(with: url)
            }
            detailFoodName.text = f.yemek_adi
            detailFoodPrice.text = "\(f.yemek_fiyat!) ₺"
            userName = "rumeysa_tan"
        }
        
        FoodDetailsRouter.createModule(ref: self)
        CartRouter.createModule(ref: (self.navigationController?.tabBarController?.viewControllers?[1].children.first) as! CartViewController)
        cartPresenterObject?.loadCart(kullanici_adi: userName ?? "rumeysa_tan")

    }
    @IBAction func foodCount(_ sender: UIStepper) {
        let foodCount = Int(sender.value)
        foodCountLabel.text = String(foodCount)
        detailFoodPrice.text = String(Int(food!.yemek_fiyat!)! * foodCount) + "₺"
    }
    
    @IBAction func addToCartButton(_ sender: Any) {
                
        var sameFood = false
        for i in cartFoods {
            if (food?.yemek_adi == i.yemek_adi) {
                cartPresenterObject?.delete(sepet_yemek_id: i.sepet_yemek_id!, kullanici_adi: userName ?? "rumeysa_tan")
                let newFoodCount = Int(foodCountLabel.text!)! + Int(i.yemek_siparis_adet!)!
                if let fn = detailFoodName.text, let f = food{
                    foodDetailPresenterObject?.addToCart(yemek_adi: fn, yemek_resim_adi: (f.yemek_resim_adi!), yemek_fiyat:(f.yemek_fiyat!), yemek_siparis_adet: String(newFoodCount), kullanici_adi: userName ?? "rumeysa_tan")
                }
                sameFood = true
            }

        }
        if(sameFood == false){
            if let fn = detailFoodName.text, let fc = foodCountLabel.text, let f = food{
                foodDetailPresenterObject?.addToCart(yemek_adi: fn, yemek_resim_adi: (f.yemek_resim_adi!), yemek_fiyat:(f.yemek_fiyat!), yemek_siparis_adet: fc, kullanici_adi: userName ?? "rumeysa_tan")
            }
        }

        
        
        let message = "Your dish has been added to cart"
        let alert = UIAlertController(title:nil, message: message, preferredStyle: .alert)
        self.present(alert, animated: true)
        
        let duration : Double = 1
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
            alert.dismiss(animated: true)
        }
    }
}

extension FoodDetailViewController : PresenterToViewCartProtocol {
    func sendDataToView(cartList: Array<CartFoods>) {
        self.cartFoods =  cartList
    }
}
