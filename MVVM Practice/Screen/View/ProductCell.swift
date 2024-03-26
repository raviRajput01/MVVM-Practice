//
//  ProductCell.swift
//  MVVM Practice
//
//  Created by Ravi Kumar Singh on 24/03/24.
//

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productBackgroundView: UIView!
    @IBOutlet weak var productTiltleLabel: UILabel!
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var product: ProductModel? {
        didSet { //Property Observer
            productDetailConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        productBackgroundView.clipsToBounds =  false
        productBackgroundView.layer.cornerRadius = 15
        productImage.layer.cornerRadius = 10
        self.productBackgroundView.backgroundColor = .systemGray6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productDetailConfiguration() {
        
        guard let product else {return}
        
        productTiltleLabel.text = product.title
        productCategoryLabel.text = product.category
        descriptionLable.text = product.description
        priceLabel.text = "$\(product.price)"
        rateButton.setTitle("\(product.rating.rate)", for: .normal)
        productImage.setImage(with: product.image)
        
    }
    
}
