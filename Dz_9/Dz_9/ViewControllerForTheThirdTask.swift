//
//  ViewControllerForTheThirdTask.swift
//  Dz_9
//
//  Created by Nick on 11.06.2020.
//  Copyright © 2020 Nick. All rights reserved.
//

import UIKit

class ViewControllerForTheThirdTask: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func constraintButton(_ sender: Any) {
        if myLabel.numberOfLines == 1 {
            myLabel.numberOfLines = 0
        } else { myLabel.numberOfLines += 1 }
    }
}
