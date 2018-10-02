

// Created on: Oct-2018
// Created by: Amin Zeina
// Created for: ICS3U
// This program will calculate how far an object is from the ground after a certain time has passed
// this will be commented out when code moved to Xcode
import PlaygroundSupport


import UIKit

class ViewController : UIViewController {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    let GRAVITY : Float = 9.81
    
    let instructionsLabel : UILabel = UILabel()
    let timeLabel : UILabel = UILabel()
    let heightLabel : UILabel = UILabel()
    let timeTextField : UITextField = UITextField()
    let calculateButton : UIButton = UIButton()
    
    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view = view
        
        instructionsLabel.text = "Enter time passed since object was dropped : "
        view.addSubview(instructionsLabel)
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        instructionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        timeLabel.text = "Enter Time: "
        view.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 20).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        timeTextField.borderStyle = UITextBorderStyle.roundedRect
        timeTextField.placeholder = "   seconds"
        view.addSubview(timeTextField)
        timeTextField.translatesAutoresizingMaskIntoConstraints = false
        timeTextField.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 20).isActive = true
        timeTextField.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 10).isActive = true
        
        calculateButton.setTitle("Calculate", for: UIControlState.normal)
        calculateButton.setTitleColor(.blue, for: .normal)
        calculateButton.addTarget(self, action: #selector(calculateHeight), for: .touchUpInside)
        view.addSubview(calculateButton)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calculateButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 25).isActive = true
        
        view.addSubview(heightLabel)
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20).isActive = true
        heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true

    }
    
    
    @objc func calculateHeight() {
        // calculate and show height of object
        let time : Float = Float(timeTextField.text!)!
        
        let height = 100 - (1/2) * GRAVITY * pow(time, 2)
        if height <= 0 {
            heightLabel.text = " The object has hit the ground"
        } else {
            heightLabel.text = "The height of the object above ground is \(String(format: "%.2f", height)) m"
        }
        
        
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// this will be commented out when code moved to Xcode
PlaygroundPage.current.liveView = ViewController()
