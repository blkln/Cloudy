//
//  MasterViewController.swift
//  Cloudy
//
//  Created by Serhii Kovtunenko on 14.06.2020.
//  Copyright © 2020 Serhii Kovtunenko. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    @IBOutlet weak var placesVCView: UIView!
    @IBOutlet weak var forecastLabel: UILabel!
    @IBOutlet weak var forecastVCView: UIView!
    
    private lazy var placesVC: PlacesViewController = {
        let storyboard = UIStoryboard(name: Constants.Storyboard.main.rawValue, bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: Constants.StoryboardIDs.placesVC.rawValue) as! PlacesViewController
        add(asChildViewController: vc, to: placesVCView)
        return vc
    }()
    
    private lazy var forecastVC: ForecastViewController = {
        let storyboard = UIStoryboard(name: Constants.Storyboard.main.rawValue, bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: Constants.StoryboardIDs.forecastVC.rawValue) as! ForecastViewController
        add(asChildViewController: vc, to: forecastVCView)
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension UIViewController {
    func add(asChildViewController viewController: UIViewController,to parentView:UIView) {
        addChild(viewController)
        // Add Child View as Subview
        parentView.addSubview(viewController.view)
        // Configure Child View
        viewController.view.frame = parentView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }
    
    func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}
