//
//  ViewController.swift
//  DarionThompsonPreworkIOS
//
//  Created by Darion Thompson on 1/25/23.
//

import UIKit

class ViewController: UIViewController{
    var darkMode = false
    @IBOutlet weak var firstNameTextInput: UITextField!
    @IBOutlet weak var lastNameTextInput: UITextField!
    @IBOutlet weak var schoolNameTextInput: UITextField!
    @IBOutlet weak var majorTextInput: UITextField!
    @IBOutlet weak var yearSegment: UISegmentedControl!
    @IBOutlet weak var numPetsCounter: UILabel!
    @IBOutlet weak var numPetsStepper: UIStepper!
    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var themeButton: UIButton!
    
    @IBAction func updateTheme(_ sender: UIButton) {
        if darkMode == false{
            greyTheme()
        } else{
            lightTheme()
        }
    }
    
    @IBAction func updateStepperCount(_ sender: UIStepper) {
        numPetsCounter.text = "\(Int(sender.value))"
    }
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        // saves the segmented option as a string for the year
        let year = yearSegment.titleForSegment(at: yearSegment.selectedSegmentIndex)
        // introduction message and used .lowercased() for the message to have proper grammar
        let introduction = "Hello! My name is \(firstNameTextInput.text!) \(lastNameTextInput.text!) and I am a \(year!.lowercased()) year student at \(schoolNameTextInput.text!) studying \(majorTextInput.text!). I currently have \(numPetsCounter.text!) pets and it is \(morePetsSwitch.isOn) that I want more pets!"
        
        // Checks the input fields and returns an alert if the inputs are empty
        if (firstNameTextInput.text == "" ||
            lastNameTextInput.text == "" ||
            schoolNameTextInput.text == "" ||
            majorTextInput.text == ""){
            let invalidAlert = UIAlertController(title: "Invalid Entry", message: "Please enter the missing fields", preferredStyle: .alert)
            let invalidAction = UIAlertAction(title: "Try Again", style: .default, handler: nil)
            invalidAlert.addAction(invalidAction)
            present(invalidAlert, animated: true, completion: nil)
        }else{ //send alert with introduction message
            let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
            let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
            defaultFields()
        }
    }
    
    func defaultFields(){ //reset fields to default
        firstNameTextInput.text = ""
        lastNameTextInput.text = ""
        schoolNameTextInput.text = ""
        majorTextInput.text = ""
        numPetsCounter.text = "0"
        yearSegment.selectedSegmentIndex = 0
        morePetsSwitch.isOn = false
    }
    func greyTheme(){
        darkMode = true
        view.backgroundColor = UIColor.gray
        firstNameTextInput.textColor = UIColor.white
        firstNameTextInput.backgroundColor = UIColor.gray
        
        lastNameTextInput.textColor = UIColor.white
        lastNameTextInput.backgroundColor = UIColor.gray
        
        schoolNameTextInput.textColor = UIColor.white
        schoolNameTextInput.backgroundColor = UIColor.gray
        
        majorTextInput.textColor = UIColor.white
        majorTextInput.backgroundColor = UIColor.gray
        
        yearSegment.selectedSegmentTintColor = UIColor.systemOrange
        themeButton.tintColor = UIColor.systemOrange
        submitButton.tintColor = UIColor.systemOrange
        morePetsSwitch.onTintColor = UIColor.systemOrange
        
    }
    func lightTheme(){
        darkMode = false
        view.backgroundColor = UIColor.white
        firstNameTextInput.textColor = UIColor.black
        firstNameTextInput.backgroundColor = UIColor.white
        
        lastNameTextInput.textColor = UIColor.black
        lastNameTextInput.backgroundColor = UIColor.white
        
        schoolNameTextInput.textColor = UIColor.black
        schoolNameTextInput.backgroundColor = UIColor.white
        
        majorTextInput.textColor = UIColor.black
        majorTextInput.backgroundColor = UIColor.white
        
        yearSegment.selectedSegmentTintColor = UIColor.systemBlue
        themeButton.tintColor = UIColor.systemBlue
        submitButton.tintColor = UIColor.systemBlue
        morePetsSwitch.onTintColor = UIColor.systemBlue

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adds clear button to text fields
        firstNameTextInput.clearButtonMode = .always
        lastNameTextInput.clearButtonMode = .always
        schoolNameTextInput.clearButtonMode = .always
        majorTextInput.clearButtonMode = .always
        
        //updates background color based on user input
}

}

