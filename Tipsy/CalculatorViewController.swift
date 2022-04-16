//
//  ViewController.swift
//  Tipsy
//

import UIKit

class CalculatorViewController: UIViewController {

    
    @IBOutlet weak var txtBillTotal: UITextField!
    @IBOutlet weak var btnCero: UIButton!
    @IBOutlet weak var btnTen: UIButton!
    @IBOutlet weak var btnTwenty: UIButton!
    @IBOutlet weak var txtSplit: UILabel!
    var tip : Float? = 0.1
    var totalPerPerson: Int = 0
    var numPersons: Int = 0
    
    var billTotal: Float?
    var valueTip : Float?
    var totalAndTip : Float?
    var valuePerPerson : Float?
    var tipLabel: String = "10"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        btnCero.isSelected=false
        btnTen.isSelected=false
        btnTwenty.isSelected=false
        sender.isSelected=true
        tipLabel = sender.titleLabel!.text!.replacingOccurrences(of: "%", with: "")
        tip = Float(tipLabel)!/100
   
        
        txtBillTotal.endEditing(true)
            
    }
    
   
    
    @IBAction func splitChanged(_ sender: UIStepper) {
        
        
        txtSplit.text = String(format: "%.0f", sender.value)
        
    }
    
    @IBAction func calculateTap(_ sender: UIButton) {
        
        numPersons =  Int(txtSplit.text!) ?? 0
        billTotal = Float(txtBillTotal.text!) ?? 0
        valueTip  = billTotal! * tip!
        totalAndTip = billTotal! + valueTip!
        valuePerPerson = totalAndTip!/Float(numPersons)
        

//        print("numPersons: \(numPersons)")
//        print("valueTip: \(valueTip!)")
//        print("totalAndTip: \(totalAndTip!)")
//        print("valuePerPerson: \(valuePerPerson!)")
//
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.calculatedResult = valuePerPerson
            destinationVC.numberOfPeople = numPersons
            destinationVC.tipPercentage = tipLabel
          
            
        }
        
    }

}

