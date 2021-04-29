//
//  ThirdViewController.swift
//  Dz_8
//
//  Created by Nick on 30.05.2020.
//  Copyright © 2020 Nick. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var segmentedControl = UISegmentedControl(items: ["First", "Second", "Third"])
    
    var firstTextField = UITextField()
    var secondTextField = UITextField()
    
    var firstButton = UIButton(type: .system)
    var secondButton = UIButton(type: .system)
    
    var firstImage = UIImageView()
    var secondImage = UIImageView()
    let personSP = ["StanMarsh", "EricCartman", "KyleBroflovski", "KennyMcCormick"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//      create a SegmentedControl
        segmentedControl.frame = CGRect(x: 25, y: 80, width: 270, height: 30)
        self.view.addSubview(segmentedControl)
        segmentedControl.backgroundColor = UIColor.white
        segmentedControl.tintColor = UIColor.orange
        segmentedControl.selectedSegmentIndex = 0

//      create the first TextField for the first Segnment
        self.view.addSubview(firstTextField)
        firstTextField.frame = CGRect(x: 25, y: 250, width: 270, height: 25)
        firstTextField.borderStyle = .roundedRect
        firstTextField.placeholder = "Введите имя"

//      create the second TextField for the first Segnment
        self.view.addSubview(secondTextField)
        secondTextField.frame = CGRect(x: 25, y: 280, width: 270, height: 25)
        secondTextField.borderStyle = .roundedRect
        secondTextField.placeholder = "Введите фамилию"

//      create the first Button for the second segnment
        self.view.addSubview(firstButton)
        firstButton.frame = CGRect(x: 25, y: 250, width: 130, height: 40)
        firstButton.setTitle("First Button", for: .normal)
        firstButton.setTitleColor(UIColor.black, for: .normal)
        firstButton.backgroundColor = UIColor.green
        firstButton.clipsToBounds = true
        firstButton.isHidden = true
        
//      create the second Button for the second segnment
        self.view.addSubview(secondButton)
        secondButton.frame = CGRect(x: 170, y: 250, width: 130, height: 40)
        secondButton.backgroundColor = UIColor.white
        secondButton.setTitle("Second Button", for: .normal)
        secondButton.setTitleColor(UIColor.black, for: .normal)
        secondButton.backgroundColor = UIColor.yellow
        secondTextField.clipsToBounds = true
        secondButton.isHidden = true

//      create the first Image for the third segnment
        self.view.addSubview(firstImage)
        firstImage.frame = CGRect(x: 30, y: 150, width: 120, height: 180)
        firstImage.image = UIImage(named:"\(personSP[0])")
        firstImage.contentMode = .scaleAspectFit
        firstImage.isHidden = true
        
//      create the second Image for the third segnment
        self.view.addSubview(secondImage)
        secondImage.frame = CGRect(x: 160, y: 157, width: 120, height: 180)
        secondImage.image = UIImage(named:"\(personSP[3])")
        secondImage.contentMode = .scaleAspectFit
        secondImage.isHidden = true
        
        view.backgroundColor = UIColor.green

        segmentedControl.addTarget(self, action: #selector(segmentedValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func segmentedValueChanged(_ sender: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            firstTextField.isHidden = false
            secondTextField.isHidden = false
            
            firstButton.isHidden = true
            secondButton.isHidden = true
            
            firstImage.isHidden = true
            secondImage.isHidden = true
            
            view.backgroundColor = UIColor.green
        } else if segmentedControl.selectedSegmentIndex == 1 {
            firstTextField.isHidden = true
            secondTextField.isHidden = true
            
            firstButton.isHidden = false
            secondButton.isHidden = false
            
            firstImage.isHidden = true
            secondImage.isHidden = true
            
            view.backgroundColor = UIColor.blue
        } else {
            firstTextField.isHidden = true
            secondTextField.isHidden = true
            
            firstButton.isHidden = true
            secondButton.isHidden = true
            
            firstImage.isHidden = false
            secondImage.isHidden = false
            
            view.backgroundColor = UIColor.purple
        }
    }
}

