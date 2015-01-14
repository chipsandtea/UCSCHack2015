//
//  ViewController.swift
//  HackUCSC2015
//
//  Created by Arjun Gopisetty on 1/9/15.
//  Copyright (c) 2015 HackUCSC2015Team. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate{
    
    @IBOutlet weak var schoolPicker: UIPickerView!
    @IBOutlet weak var groupNameTextView: UITextField!
    @IBOutlet weak var firstContinueButton: UIButton!
    
    var contents = [String]()
    var dict = [String : String]()
    
    @IBOutlet weak var sendData: UIButton!
    
    override func viewDidLoad() {
        
        var newClass = MyRequestController()
        var schools = []
        
        newClass.get() { (json: JSON) -> () in
            
            for (key: String, subJson: JSON) in json {
                
                self.contents.append(subJson["school"].stringValue)
                self.dict[subJson["school"].stringValue] = subJson["id"].stringValue
                
            }
            
            if(self.schoolPicker != nil) {
                self.schoolPicker.reloadAllComponents() }
        }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    @IBAction func onSendDataPress(sender: AnyObject) {
        
        var webClass = MyRequestController();
        //sharedData(
        let json = JSON(cData())
        //println(jsooon)
        webClass.sendRequest(json)
        
    }
    
    @IBAction func firstContinueOnPress(sender: AnyObject) {
        
        sharedData().setObject(groupNameTextView.text, forKey:"group_name")
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
        return contents.count
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cData().setObject(self.dict[contents[row]]!, forKey: "id")
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String!{
        return contents[row]
    }
}
