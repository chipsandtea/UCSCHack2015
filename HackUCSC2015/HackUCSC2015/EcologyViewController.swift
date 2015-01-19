//
//  EcologyViewController.swift
//  HackUCSC2015
//
//  Created by Arjun Gopisetty on 1/11/15.
//  Copyright (c) 2015 HackUCSC2015Team. All rights reserved.
//

import UIKit

class EcologyViewController: ResponsiveTextFieldViewController {
    
    @IBOutlet var phSlider: UISlider!
    @IBOutlet var otterCount: UITextField!
    @IBOutlet var phValue: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderSlid(sender: UISlider) {
        let temp = NSString(format: "%.2f", sender.value)
        phValue.text = temp
    }
    
    @IBAction func nextButtonHit3(sender: UIButton) {
        gatherAllData3()
    }
    
    func gatherAllData3(){
        var dDictionary = [String : String]()
        dDictionary["seawater_ph"] = phValue.text
        dDictionary["otter_count"] = otterCount.text
        dDictionary["emeasurement_time"] = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .NoStyle, timeStyle: .ShortStyle)

        dDictionary["emeasurement_date"] = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .ShortStyle, timeStyle: .NoStyle)

        var myNewDictArray: [[String:String]] = []
        myNewDictArray.append(dDictionary)
        sharedData().setObject(myNewDictArray, forKey: "ecology")
        //println(sharedData())
        
        bData().setObject(sharedData(), forKey: "group_data")
        cData().setObject(bData(), forKey: "data")
        println(cData())
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
