//
//  NavigatorDataViewController.swift
//  HackUCSC2015
//
//  Created by Arjun Gopisetty on 1/10/15.
//  Copyright (c) 2015 HackUCSC2015Team. All rights reserved.
//

import UIKit

let bearingNum2 = "bearingNum2"

class NavigatorDataViewController: UIViewController {

    @IBOutlet var Bearing2: UITextField!
    @IBAction func Bearing2(sender: UITextField) {
        sharedData().setObject(sender.text, forKey: bearingNum2)
        println(sharedData().objectForKey(bearingNum2))
        println(" hi \(sender.text)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
