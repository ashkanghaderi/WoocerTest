//
//  ProductCollectionViewCell.swift
//  WoocerTest
//
//  Created by Ashkan Ghaderi on 2021-12-11.
//

import UIKit
import Kingfisher
import Foundation

class ProductCollectionViewCell: UICollectionViewCell,NibLoadableView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var productDesc: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        productName.font = Fonts.Bold.Bold12()
        productName.textColor = AppColor.black
        
        productPrice.font = Fonts.Bold.Bold12()
        productPrice.textColor = AppColor.LightBlue
        
        productDesc.font = Fonts.Bold.Bold10()
        productDesc.textColor = AppColor.Light2Gray
        
        imageContainerView.layer.borderWidth = 1.0
        imageContainerView.layer.masksToBounds = false
        imageContainerView.layer.borderColor = AppColor.Steel.cgColor
        imageContainerView.layer.cornerRadius = imageContainerView.frame.size.width / 2
        imageContainerView.clipsToBounds = true
        
        containerView.layer.cornerRadius = 12

    }
    
    func bind(_ product: ProductModel) {
        if let images = product.images {
            if let url = Foundation.URL(string: images.first?.src ?? "") {
                mainImageView.kf.setImage(with: url)
            }
        }
        
        productName.text = product.name
        productPrice.text = (product.price ?? "0.0") + "$"
        productDesc.attributedText = product.description?.htmlToAttributedString
        
    }

}
