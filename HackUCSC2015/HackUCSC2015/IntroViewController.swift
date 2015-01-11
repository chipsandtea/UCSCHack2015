//
//  IntroViewController.swift
//  HackUCSC2015
//
//  Created by Arjun Gopisetty on 1/11/15.
//  Copyright (c) 2015 HackUCSC2015Team. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet var ProceedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProceedButton.layer.cornerRadius = 5
        ProceedButton.layer.borderWidth = 1
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
