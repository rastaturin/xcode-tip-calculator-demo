//
//  ViewController.swift
//  SImpleTipper
//
//  Created by Alexey Rastaturin on 9/25/16.
//  Copyright © 2016 Alexey Rastaturin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var precentageSelector: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dataChanged(_ sender: AnyObject) {
        
        updateData()
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    func updateData()
    {
        let tipPercentage = [0.18, 0.20, 0.25];
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentage[precentageSelector.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let defaults = UserDefaults.standard
        precentageSelector.selectedSegmentIndex = defaults.integer(forKey: "default_tip")
        
        updateData()
        
    }
    
}

