//
//  NavigatorDataViewController.swift
//  HackUCSC2015
//
//  Created by Arjun Gopisetty on 1/10/15.
//  Copyright (c) 2015 HackUCSC2015Team. All rights reserved.
//

import UIKit

let bearing_1 = "bearing_1"//loc2
let bearing_2 = "bearing_2"//loc3
let bearing_3 = "bearing_3"//loc4
let bearing1_degrees = "bearing1_degrees"//bearing#2
let bearing2_degrees = "bearing2_degrees"//bearing#3
let bearing3_degrees = "bearing3_degrees"//bearing#4
let gps_latitude_degrees = "gps_latitude_degrees"
let gps_latitude_min = "gps_latitude_min"
let gps_latitude_sec = "gps_latitude_sec"
let gps_longitude_degrees = "gps_longitude_degrees"
let gps_longitude_min = "gps_longitude_min"
let gps_longitude_sec = "gps_longitude_sec"
let nwind_speed = "nwind_speed"
let ndepth = "ndepth"

class NavigatorDataViewController: UIViewController,UIPickerViewDelegate {

    @IBOutlet var pickLoc: UIPickerView! = UIPickerView()
    @IBOutlet var Location2: UITextField!
    @IBOutlet var Location3: UITextField!
    @IBOutlet var Location4: UITextField!
    @IBOutlet var Bearing2: UITextField!
    @IBOutlet var Bearing3: UITextField!
    @IBOutlet var Bearing4: UITextField!
    //gps
    
    @IBOutlet var LATDEG: UITextField!
    @IBOutlet var LONGDEG: UITextField!
    @IBOutlet var LATMIN: UITextField!
    @IBOutlet var LONGMIN: UITextField!
    @IBOutlet var LATSEC: UITextField!
    @IBOutlet var LONGSEC: UITextField!
    
    //wind
    @IBOutlet var WINDSPEED: UITextField!
    
    @IBOutlet var DEPTH: UITextField!
    
    var weatherObs = ["sunny","light fog","heavy fog","partly cloudy","overcast","light rain","heavy rain"]
    
    var selectedLoc: UITextField!
    
    var locs = ["Cocoanut grove","Mile buoy","Radio towers","Soquel point","Santa Cruz Wharf","Harbor lighthouse","Steamer's lighthouse","Gov. buoy","Dream Inn","Seal rock","Giant dipper","Wharf elbow","Black's point"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickLoc.hidden = true

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
        if(textField.tag != -1) {
            pickLoc.hidden = false
            selectedLoc = textField
            return false
        }
        return true
    }
    
    func gatherAllData() {
        
        var aDictionary = [String : String]()
        var bDictionary = [String : String]()

        aDictionary[bearing_1] = Location2.text
        aDictionary[bearing_2] = Location3.text
        aDictionary[bearing_3] = Location4.text
        aDictionary[bearing1_degrees] = Bearing2.text
        aDictionary[bearing2_degrees] = Bearing3.text
        aDictionary[bearing3_degrees] = Bearing4.text
        aDictionary[gps_latitude_degrees] = LATDEG.text
        aDictionary[gps_longitude_degrees] = LONGDEG.text
        aDictionary[gps_latitude_min] = LATMIN.text
        aDictionary[gps_longitude_min] = LONGMIN.text
        aDictionary[gps_latitude_sec] = LATSEC.text
        aDictionary[gps_longitude_sec] = LONGSEC.text
        aDictionary[nwind_speed] = WINDSPEED.text
        aDictionary[ndepth] = DEPTH.text
        


/*
        sharedData().setObject(Location2.text, forKey:bearing_1)
        sharedData().setObject(Location3.text, forKey:bearing_2)
        sharedData().setObject(Location4.text, forKey:bearing_3)
        sharedData().setObject(Bearing2.text, forKey:bearing1_degrees)
        sharedData().setObject(Bearing3.text, forKey:bearing2_degrees)
        sharedData().setObject(Bearing4.text, forKey:bearing3_degrees)
        sharedData().setObject(LATDEG.text, forKey:gps_latitude_degrees)
        sharedData().setObject(LONGDEG.text, forKey:gps_longitude_degrees
        sharedData().setObject(LATMIN.text, forKey:gps_latitude_min)
        sharedData().setObject(LONGMIN.text, forKey:gps_longitude_min)
        sharedData().setObject(LATSEC.text, forKey:gps_latitude_sec)
        sharedData().setObject(LONGSEC.text, forKey:gps_longitude_sec)
        
        sharedData().setObject(WINDSPEED.text, forKey:nwind_speed)
        sharedData().setObject(DEPTH.text, forKey:ndepth)
 */
        
 //       aDictionary.setObject(Location2.text, forKey:bearing_1)
        
        
        sharedData().setObject(aDictionary, forKey: "navigation_data")
        sharedData().setObject(bDictionary, forKey: "array")

        //NEST ON THIRD!!!
        
        //sharedData()
        
        println(sharedData())
    }
    
    @IBAction func nextButtonHit(sender: UIButton) {
        gatherAllData()
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
