//
//  MarineBioViewController.swift
//  HackUCSC2015
//
//  Created by Arjun Gopisetty on 1/10/15.
//  Copyright (c) 2015 HackUCSC2015Team. All rights reserved.
//

import UIKit

class MarineBioViewController: UIViewController {

    @IBOutlet var TEMP: UITextField!
    @IBOutlet var VISIB: UITextField!
    @IBOutlet var DEPTH: UITextField!
    @IBOutlet var SALIN: UITextField!
    @IBOutlet var PLANKNUM: UITextField!
    @IBOutlet var PANLSPEC: UITextField!
    
    // water color options
    @IBOutlet var BROWN: UIButton!
    @IBOutlet var BLUE: UIButton!
    @IBOutlet var RED: UIButton!
    @IBOutlet var GREEN: UIButton!
    @IBOutlet var YELLGREEN: UIButton!
    @IBOutlet var BLUGREEN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading 
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
