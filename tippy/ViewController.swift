//
//  ViewController.swift
//  tippy
//
//  Created by Xiu Chen on 6/20/17.
//  Copyright © 2017 Xiu Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        // Dismisses keyboard
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.18, 0.20, 0.25]
        
        // ?? 0 provides a default value of 0 if values cannot be casted
        let bill = Double(billField.text!) ?? 0
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "default_tip_percentage")
      
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = UserDefaults.standard
        let selectedIndex = tipControl.selectedSegmentIndex
        defaults.set(selectedIndex, forKey: "default_tip_percentage")
        defaults.synchronize()
    }
    
    
    
}

