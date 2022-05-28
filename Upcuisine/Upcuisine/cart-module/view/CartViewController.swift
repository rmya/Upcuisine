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
//        cartPresenterObject?.delete(sepet_yemek_id: (sepet_yemek_id)!, kullanici_adi: userName)
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
            (action,view,void) in
            
            let food = self.cartList[indexPath.row]
            
            let alert = UIAlertController(title: "Deletion process", message: "Do you want to delete \(food.yemek_adi!)", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){ action in }
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){ action in
                self.userName = "rumeysa_tan"
                
                self.cartPresenterObject?.delete(sepet_yemek_id: (food.sepet_yemek_id)!, kullanici_adi: (self.userName!))
                
//                if let food_id = Int(food.sepet_yemek_id!){
//                    self.cartPresenterObject?.delete(sepet_yemek_id: Int(food_id!)!, kullanici_adi: (food.kullanici_adi)!)
//                }
                
                DispatchQueue.main.async {
                    self.cartFoodTableView.reloadData()
                }
            }
            alert.addAction(yesAction)
            self.present(alert, animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }
    

}
