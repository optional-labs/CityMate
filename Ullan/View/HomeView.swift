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
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    private var allServicesVC: UIViewController!
    private var instantServicesVC: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupChildViewControllers()
        updateDisplayedView()
    }
    
    private func setupUI() {
        // Header
        cartHeaderImageView.layer.cornerRadius = cartHeaderImageView.frame.size.width / 2
        cartHeaderImageView.clipsToBounds = true
        cartHeaderImageView.layer.borderWidth = 2
        cartHeaderImageView.layer.borderColor = UIColor.lightGray.cgColor
        
        // Search bar
        searchBarView.layer.cornerRadius = searchBarView.frame.size.height / 2
        searchBarView.layer.borderWidth = 1
        searchBarView.layer.borderColor = UIColor.lightGray.cgColor
        searchBarView.clipsToBounds = true
        
    }
    
    private func setupChildViewControllers() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        allServicesVC = storyboard.instantiateViewController(withIdentifier: "AllServices")
        instantServicesVC = storyboard.instantiateViewController(withIdentifier: "InstantServices")
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        updateDisplayedView()
    }
    
    private func updateDisplayedView() {
        children.forEach { child in
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
        
        let selectedVC = segmentControl.selectedSegmentIndex == 0 ? allServicesVC! : instantServicesVC!
        
        addChild(selectedVC)
        selectedVC.view.frame = containerView.bounds
        containerView.addSubview(selectedVC.view)
        selectedVC.didMove(toParent: self)
    }
}
