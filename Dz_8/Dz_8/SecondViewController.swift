//
//  SecondViewController.swift
//  Dz_8
//
//  Created by Nick on 28.05.2020.
//  Copyright © 2020 Nick. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let personSP = ["StanMarsh", "EricCartman", "KyleBroflovski", "KennyMcCormick"]
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...personSP.count-1{
            if i % 2 == 0 && i > 0 {
                y += view.bounds.height / 2.2
            }
            if i % 2 == 0 {
                x = 0
            }
            let newView = UIImageView(frame: CGRect(x: 10 + x, y: 20 + y, width: 120, height: 200))
            self.view.addSubview(newView)
            newView.image = UIImage(named:"\(personSP[i])")
            newView.contentMode = .scaleAspectFit
                
            let newLabel = UILabel(frame: CGRect(x: 10 + x, y: 210 + y, width: 140, height: 35))
            self.view.addSubview(newLabel)
            newLabel.text = "\(personSP[i])"
            newLabel.textColor = UIColor.black
            newLabel.textAlignment = .center
                
            x = view.bounds.width / 2
        }
    }
}


