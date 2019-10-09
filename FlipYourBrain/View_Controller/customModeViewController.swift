//
//  customModeViewController.swift
//  FlipYourBrain
//
//  Created by Neo on 2018/2/14.
//  Copyright © 2018年 Cinard Digital Media Institute. All rights reserved.
//

import UIKit

class customModeViewController: UIViewController {

    @IBOutlet weak var beforeText: UITextField!
    
    @IBOutlet weak var afterText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
