//
//  menuViewController.swift
//  FlipYourBrain
//
//  Created by Neo on 2018/1/31.
//  Copyright © 2018年 Cinard Digital Media Institute. All rights reserved.
//

import UIKit
import GoogleMobileAds

class menuViewController: UIViewController,GADBannerViewDelegate {

    @IBOutlet weak var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bannerView.delegate = self
        bannerView.adUnitID = AD_UUID
        bannerView.rootViewController = self
        let request = GADRequest()
        bannerView.load(request)
        
//        navigationController?.isToolbarHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override var prefersStatusBarHidden: Bool {
        return  true
    }
    
}
