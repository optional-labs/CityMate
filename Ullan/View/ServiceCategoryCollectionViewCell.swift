//
//  ServiceCategoryCollectionViewCell.swift
//  Ullan
//
//  Created by Asha on 07/11/25.
//

import UIKit

class ServiceCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
    }
}
