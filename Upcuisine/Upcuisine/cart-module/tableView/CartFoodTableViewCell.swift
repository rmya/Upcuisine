//
//  CartFoodTableViewCell.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 27.05.2022.
//

import UIKit

class CartFoodTableViewCell: UITableViewCell {

    @IBOutlet weak var cartFoodImage: UIImageView!
    @IBOutlet weak var cartFoodName: UILabel!
    @IBOutlet weak var cartFoodPiece: UILabel!
    @IBOutlet weak var cartFoodPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
