//
//  SettingsViewController.swift
//  tippy
//
//  Created by Xiu Chen on 6/20/17.
//  Copyright © 2017 Xiu Chen. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

   
    @IBOutlet weak var saveTip: UISegmentedControl!
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let defaults = UserDefaults.standard
        let selectedIndex = saveTip.selectedSegmentIndex
        print(selectedIndex)
        defaults.set(selectedIndex, forKey: "default_tip_percentage")
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        saveTip.selectedSegmentIndex = defaults.integer(forKey: "default_tip_percentage")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = UserDefaults.standard
        saveTip.selectedSegmentIndex = defaults.integer(forKey: "default_tip_percentage")
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
}
