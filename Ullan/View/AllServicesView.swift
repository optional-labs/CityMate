//
//  AllServicesView.swift
//  Ullan
//
//  Created by Asha on 07/11/25.
//

import UIKit

class AllServicesViewController: UIViewController {
    
    @IBOutlet weak var servicesCollectionView: UICollectionView!
    
    struct AllServices {
        let title: String
        let image: String
    }
    
    let allServices: [AllServices] = [
        AllServices(title: "Salon for Women", image: "bmw"),
        AllServices(title: "Spa for Women", image: "bmw"),
        AllServices(title: "Hair Studio for Women", image: "bmw"),
        AllServices(title: "Makeup & Styling Studio", image: "bmw"),
        AllServices(title: "Salon for Men", image: "bmw"),
        AllServices(title: "Massage for Men", image: "bmw"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        servicesCollectionView.delegate = self
        servicesCollectionView.dataSource = self
        
        if let layout = servicesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 12
            layout.minimumInteritemSpacing = 12
            layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        }
        
    }
}

extension AllServicesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allServices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = servicesCollectionView.dequeueReusableCell(withReuseIdentifier: "serviceCell", for: indexPath) as! ServiceCategoryCollectionViewCell
        let item = allServices[indexPath.row]
        cell.imageView.image = UIImage(named: item.image)
        cell.titleLabel.text = item.title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 3
        let spacing: CGFloat = 12
        
        // Account for section insets or safe area insets
        let sectionInsets = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero
        let safeAreaInsets = collectionView.safeAreaInsets
        
        let totalHorizontalInsets = sectionInsets.left + sectionInsets.right + safeAreaInsets.left + safeAreaInsets.right
        let totalSpacing = (itemsPerRow - 1) * spacing + totalHorizontalInsets
        let width = (collectionView.bounds.width - totalSpacing) / itemsPerRow
        return CGSize(width: floor(width), height: 140)
        
    }
    
}
