//
//  SettingsViewController.swift
//  SImpleTipper
//
//  Created by Alexey Rastaturin on 9/26/16.
//  Copyright © 2016 Alexey Rastaturin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var defaultTip: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onChange(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(defaultTip.selectedSegmentIndex, forKey: "default_tip")
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let defaults = UserDefaults.standard
        defaultTip.selectedSegmentIndex = defaults.integer(forKey: "default_tip")
        
    }

    
}
