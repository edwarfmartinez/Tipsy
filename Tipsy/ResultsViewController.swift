//
//  ResultsViewController.swift
//  Tipsy
//


import UIKit

class ResultsViewController: UIViewController {

    
    @IBOutlet weak var txtTotalPerPerson: UILabel!
    
    @IBOutlet weak var txtLabel: UILabel!
    var calculatedResult : Float? = 0
    var numberOfPeople : Int = 0
    var tipPercentage : String = ""


    override func viewDidLoad() {
        txtTotalPerPerson.text = String(calculatedResult!)
        txtLabel.text = "Split between \(numberOfPeople) people, with \(tipPercentage)% tip."
        
    }
    @IBAction func recalculateTap(_ sender: Any) {
    
        self.dismiss(animated: true, completion: nil)
    
    }
}
