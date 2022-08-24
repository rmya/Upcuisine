//
//  FoodsViewController.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 26.05.2022.
//

import UIKit
import Kingfisher

class FoodsViewController: UIViewController {

    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    var foodList = [Foods]()
    var foodsPresenterObject : ViewToPresenterFoodsProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        
        FoodsRouter.createModule(ref: self)
            
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        foodCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        foodsPresenterObject?.loadAllFoods()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            if let food = sender as? Foods {
                let nextVC = segue.destination as! FoodDetailViewController
                nextVC.food = food
            }
        }
    }
    
}

extension FoodsViewController : PresenterToViewFoodsProtocol{
    
    func sendDataToView(foodList: Array<Foods>) {
        self.foodList = foodList
        DispatchQueue.main.async {
            self.foodCollectionView.reloadData()
        }
    }
}

extension FoodsViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let food = foodList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! FoodCollectionViewCell
        cell.foodNameLabel.text = "\(food.yemek_adi!)"
        cell.foodPriceLabel.text = "\(food.yemek_fiyat!) ₺"
        
        DispatchQueue.main.async {
            let url = URL(string: URLs.foodImageURL + "\(food.yemek_resim_adi!)")
            cell.foodImageView.kf.setImage(with: url)
        }
        cell.foodContentView.backgroundColor = UIColor.upColor(.background)
        cell.foodContentView.layer.borderColor = UIColor.lightGray.cgColor
        cell.foodContentView.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 8.0
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let food = foodList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: food)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
}

extension FoodsViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right:1.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.size.width / 2 - gridLayout.minimumInteritemSpacing
        return CGSize(width:widthPerItem, height:180)
    }

}
