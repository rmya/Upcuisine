//
//  CartViewController.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 26.05.2022.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var emptyInfoView: UIStackView!
    @IBOutlet weak var cartFoodTableView: UITableView!
    @IBOutlet weak var totolPriceLabel: UILabel!
    @IBOutlet weak var sumPriceLabel: UILabel!
    @IBOutlet weak var quickOrderButton: UIButton!
    
    var cartList = [CartFoods]()
    var cartPresenterObject : ViewToPresenterCartProtocol?
    var userName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cartFoodTableView.delegate = self
        cartFoodTableView.dataSource = self
        
        CartRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userName = "rumeysa_tan"
        cartPresenterObject?.loadCart(kullanici_adi: userName!)
    }

}

extension CartViewController : PresenterToViewCartProtocol {
    func sendDataToView(cartList: Array<CartFoods>) {
        self.cartList = cartList
        DispatchQueue.main.async {
            self.cartFoodTableView.reloadData()
        }
    }
}

extension CartViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = cartList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartFood", for: indexPath) as! CartFoodTableViewCell
        
        cell.cartFoodName.text = "\(food.yemek_adi!)"
        cell.cartFoodPiece.text = "\(food.yemek_siparis_adet!)"
        cell.cartFoodPrice.text = "\(food.yemek_fiyat!)"
        DispatchQueue.main.async {
            let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi!)")
            cell.cartFoodImage.kf.setImage(with: url)
        }
        return cell
    }
    

}
