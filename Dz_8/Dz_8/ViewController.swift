//
//  ViewController.swift
//  Dz_8
//
//  Created by Nick on 27.05.2020.
//  Copyright © 2020 Nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var galleryImageView: UIImageView!
    
    let personSP = ["StanMarsh", "EricCartman", "KyleBroflovski", "KennyMcCormick", "ButtersStotch", "RendiMarsh", "Wendyy", "JimmyValmer", "CraigTucker", "Towelie"]
    var item = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        galleryImageView.image = UIImage(named: "\(personSP[item])")
    }
    
    @IBAction func back(_ sender: Any) {
        if item == 0 {
            item = personSP.count
        }
        item -= 1
        galleryImageView.image = UIImage(named: "\(personSP[item])")
    }
    
    @IBAction func forward(_ sender: Any) {
        if item == personSP.count - 1 {
            item = -1
        }
        item += 1
        galleryImageView.image = UIImage(named: "\(personSP[item])")
    }
}

