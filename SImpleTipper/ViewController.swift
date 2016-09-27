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
    @IBOutlet weak var bottomPanel: UIView!
    
    var empty = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let locale = Locale.current
        self.billField.placeholder = locale.currencySymbol
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        billField.becomeFirstResponder()
        
        let defaults = UserDefaults.standard
        precentageSelector.selectedSegmentIndex = defaults.integer(forKey: "default_tip")
        
        updateData()
    }

    func updateData() {
        
        
        let tipPercentage = [0.18, 0.20, 0.25];
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentage[precentageSelector.selectedSegmentIndex]
        let total = bill + tip
        
        if (empty && bill > 0) {
            empty = false
            
            UIView.animate(withDuration: 0.4, animations: {
                self.tipLabel.alpha = 1
                self.precentageSelector.alpha = 1
                self.bottomPanel.frame = self.bottomPanel.frame.offsetBy( dx: 0, dy: -200 );
            })
        }
        
        if (!empty && bill == 0) {
            empty = true
            
            UIView.animate(withDuration: 0.4, animations: {
                self.tipLabel.alpha = 0
                self.precentageSelector.alpha = 0
                self.bottomPanel.frame = self.bottomPanel.frame.offsetBy( dx: 0, dy: 200 );
            })
        }
        let locale = Locale.current
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = locale.currencySymbol
        
        tipLabel.text = formatter.string(from: NSNumber(value: tip))!
        totalLabel.text = formatter.string(from: NSNumber(value: total))!
    }
    
}

