//
//  MainViewController.swift
//  MidtermProject
//
//  Created by Matheu DeWitt on 10/7/16.
//  Copyright © 2016 Matheu DeWitt. All rights reserved.
//

import UIKit
import Foundation

class MainViewController: UIViewController{

    @IBAction func submit(sender: UIButton) {
        performSegueWithIdentifier("showStories", sender: sender)
    }
    
    
    
    var states = [ "AK - Alaska",
                   "AL - Alabama",
                   "AR - Arkansas",
                   "AS - American Samoa",
                   "AZ - Arizona",
                   "CA - California",
                   "CO - Colorado",
                   "CT - Connecticut",
                   "DC - District of Columbia",
                   "DE - Delaware",
                   "FL - Florida",
                   "GA - Georgia",
                   "GU - Guam",
                   "HI - Hawaii",
                   "IA - Iowa",
                   "ID - Idaho",
                   "IL - Illinois",
                   "IN - Indiana",
                   "KS - Kansas",
                   "KY - Kentucky",
                   "LA - Louisiana",
                   "MA - Massachusetts",
                   "MD - Maryland",
                   "ME - Maine",
                   "MI - Michigan",
                   "MN - Minnesota",
                   "MO - Missouri",
                   "MS - Mississippi",
                   "MT - Montana",
                   "NC - North Carolina",
                   "ND - North Dakota",
                   "NE - Nebraska",
                   "NH - New Hampshire",
                   "NJ - New Jersey",
                   "NM - New Mexico",
                   "NV - Nevada",
                   "NY - New York",
                   "OH - Ohio",
                   "OK - Oklahoma",
                   "OR - Oregon",
                   "PA - Pennsylvania",
                   "PR - Puerto Rico",
                   "RI - Rhode Island",
                   "SC - South Carolina",
                   "SD - South Dakota",
                   "TN - Tennessee",
                   "TX - Texas",
                   "UT - Utah",
                   "VA - Virginia",
                   "VI - Virgin Islands",
                   "VT - Vermont",
                   "WA - Washington", 
                   "WI - Wisconsin", 
                   "WV - West Virginia", 
                   "WY - Wyoming"]
    var stateSelected: String = "AK - Alaska"
    var stateAbreviated: String = ""
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int)->Int
    {

            return states.count
    }
    func pickerView(pickerView:UIPickerView, titleForRow row: Int, forComponent component: Int)->String!
    {

            return states[row]

    }
    func pickerView(pickerView:UIPickerView, didSelectRow row:Int, inComponent component:Int)
    {
        stateSelected = states[row]
        print(stateSelected)
        
        

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        let destination = segue.destinationViewController as? ViewController
        var array = Array(stateSelected.characters)
        stateAbreviated = String(array[0]) + String(array[1])
        destination?.state = stateAbreviated.lowercaseString
        print(stateAbreviated.lowercaseString)

        
    }
    
    
}
