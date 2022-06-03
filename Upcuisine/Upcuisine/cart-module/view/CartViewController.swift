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
        
        userName = "rumeysa_tan"
        cartPresenterObject?.loadCart(kullanici_adi: userName!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userName = "rumeysa_tan"
        cartPresenterObject?.loadCart(kullanici_adi: userName!)
        
//        if(cartList.isEmpty){
//            self.cartFoodTableView.isHidden = true
//            self.totolPriceLabel.isHidden = true
//            self.sumPriceLabel.isHidden = true
//            self.quickOrderButton.isHidden = true
//            self.emptyInfoView.isHidden = false
//        }else{
//            self.cartFoodTableView.isHidden = false
//            self.totolPriceLabel.isHidden = false
//            self.sumPriceLabel.isHidden = false
//            self.quickOrderButton.isHidden = false
//            self.emptyInfoView.isHidden = true
//        }

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
        
        if let tabItems = tabBarController?.tabBar.items {
            let item = tabItems[1]
            item.badgeValue = String(cartList.count)
        }
        if(cartList.isEmpty){
            self.cartFoodTableView.isHidden = true
            self.totolPriceLabel.isHidden = true
            self.sumPriceLabel.isHidden = true
            self.quickOrderButton.isHidden = true
            self.emptyInfoView.isHidden = false
        }else{
            self.cartFoodTableView.isHidden = false
            self.totolPriceLabel.isHidden = false
            self.sumPriceLabel.isHidden = false
            self.quickOrderButton.isHidden = false
            self.emptyInfoView.isHidden = true
        }
        
        var sumPrice = 0
        for i in cartList {
            sumPrice += Int(i.yemek_fiyat!)! * Int(i.yemek_siparis_adet!)!
        }
        self.sumPriceLabel.text = "\(String(describing: sumPrice)) ₺"
        
        return cartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = cartList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartFood", for: indexPath) as! CartFoodTableViewCell
        
        cell.cartFoodName.text = "\(food.yemek_adi!)"
        
        if let piece = Int(food.yemek_siparis_adet!), let price = Int(food.yemek_fiyat!) {
            let cellTotalPrice = piece * price
            cell.cartFoodPrice.text = "\(cellTotalPrice) ₺ "
        }
        cell.cartFoodPiece.text = "\(food.yemek_siparis_adet!)"
        DispatchQueue.main.async {
            let url = URL(string: URLs.foodImageURL + "\(food.yemek_resim_adi!)")
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
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){ [self] action in
                self.userName = "rumeysa_tan"
                
                self.cartPresenterObject?.delete(sepet_yemek_id: (food.sepet_yemek_id)!, kullanici_adi: (self.userName!))
                self.cartPresenterObject?.loadCart(kullanici_adi: (self.userName!))
                
                if let tabItems = self.tabBarController?.tabBar.items {
                    let item = tabItems[1]
                    item.badgeValue = String(self.cartList.count)
                }
            }
            
            if let tabItems = self.tabBarController?.tabBar.items {
                let item = tabItems[1]
                item.badgeValue = String(self.cartList.count)
            }
            
            alert.addAction(yesAction)
            self.present(alert, animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }
    

}
