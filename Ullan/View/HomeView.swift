//
//  HomeView.swift
//  Ullan
//
//  Created by Asha on 07/11/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var shortLocation: UILabel!
    @IBOutlet weak var detailedLocation: UILabel!
    @IBOutlet weak var cartHeaderImageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartHeaderImageView.layer.cornerRadius = cartHeaderImageView.frame.size.width / 2
        cartHeaderImageView.clipsToBounds = true
        cartHeaderImageView.layer.borderWidth = 2
        cartHeaderImageView.layer.borderColor = UIColor.lightGray.cgColor
    }
}
