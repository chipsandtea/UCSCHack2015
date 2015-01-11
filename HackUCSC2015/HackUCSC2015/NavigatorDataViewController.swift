//
//  NavigatorDataViewController.swift
//  HackUCSC2015
//
//  Created by Arjun Gopisetty on 1/10/15.
//  Copyright (c) 2015 HackUCSC2015Team. All rights reserved.
//

import UIKit

let bearingNum2 = "bearingNum2"

class NavigatorDataViewController: UIViewController,UIPickerViewDelegate {

    @IBOutlet var pickLoc: UIPickerView! = UIPickerView()
    @IBOutlet var Location2: UITextField!
    @IBOutlet var Location3: UITextField!
    @IBOutlet var Location4: UITextField!
    @IBOutlet var Bearing2: UITextField!
    @IBOutlet var Bearing3: UITextField!
    @IBOutlet var Bearing4: UITextField!
    
    @IBAction func Bearing2(sender: UITextField) {
        sharedData().setObject(sender.text, forKey: bearingNum2)
        println(sharedData().objectForKey(bearingNum2))
        println(" hi \(sender.text)")
    }
    
    var selectedLoc: UITextField!
    
    var locs = ["Cocoanut grove","Mile buoy","Radio towers","Soquel point","Santa Cruz Wharf","Harbor lighthouse","Steamer's lighthouse","Gov. buoy","Dream Inn","Seal rock","Giant dipper","Wharf elbow","Black's point"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickLoc.hidden = true
        Location2.text = locs[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
        return locs.count
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String!{
        return locs[row]
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int)
    {
        selectedLoc.text = locs[row]
        pickLoc.hidden = true;
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        pickLoc.hidden = false
        selectedLoc = textField
        return false
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
