//
//  chosenCategoryViewController.swift
//  FlipYourBrain
//
//  Created by Neo on 2018/2/14.
//  Copyright © 2018年 Cinard Digital Media Institute. All rights reserved.
//

import UIKit
import GoogleMobileAds

class CategoryViewController: UIViewController, GADBannerViewDelegate {

    let _UserDefaults = UserDefaults.standard
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bannerView.delegate = self
        bannerView.adUnitID = AD_UUID
        bannerView.rootViewController = self
        let request = GADRequest()
        bannerView.load(request)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        // Do any additional setup after loading the view.
    }

    @IBAction func travel(_ sender: UIButton) {
//        _UserDefaults.set(1, forKey: "use")
        _UserDefaults.set("travel", forKey: "Type")
        _UserDefaults.synchronize()
    }
    
    @IBAction func life(_ sender: UIButton) {
        _UserDefaults.set("life", forKey: "Type")
        _UserDefaults.synchronize()
    }
    
    @IBAction func traffic(_ sender: UIButton) {
        _UserDefaults.set("traffic", forKey: "Type")
        _UserDefaults.synchronize()
    }
    
    @IBAction func animal(_ sender: UIButton) {
        _UserDefaults.set("animal", forKey: "Type")
        _UserDefaults.synchronize()
    }
    
    @IBAction func custom(_ sender: UIButton) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return  true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
