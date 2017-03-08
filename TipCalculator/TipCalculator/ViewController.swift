//
//  ViewController.swift
//  TipCalculator
//
//  Created by Gowda, Karthik on 3/8/17.
//  Copyright © 2017 Intuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipController: UISegmentedControl!
    
    let tipSegmentRange = [0.18, 0.20, 0.25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "DefaulTipValue")
        tipController.selectedSegmentIndex = intValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tipCalculator(_ sender: Any) {
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipSegmentRange[tipController.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String.init(format: "$%0.2f", tip)
        totalLabel.text = String.init(format: "$%0.2f", total)
    }

    @IBAction func tipValueChanged(_ sender: Any) {
        self.tipCalculator(sender)
    }
    
    @IBAction func onTap(_ sender: Any) {
        
        view.endEditing(true)
    }
}

