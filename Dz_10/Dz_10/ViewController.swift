//
//  ViewController.swift
//  Dz_10
//
//  Created by Nick on 05.07.2020.
//  Copyright © 2020 Nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var price = [6999, 5999, 6999, 3999, 5999, 3990]
    var discount = [3499, 2999, 4999, 2999, 4499, 2999]
    var tShirt = ["Manchester United", "Real Madrid", "Juventus", "Russia", "Lester City", "Bayern Munchen"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = UIScreen.main.bounds.size.width / 2
        let h = UIScreen.main.bounds.size.height / 2.25
        return CGSize(width: w, height: h)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tShirt.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WearCell", for: indexPath) as! WearCollectionViewCell
        cell.imageView.image = UIImage(named: tShirt[indexPath.row])
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "\(price[indexPath.row]) руб.")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        cell.priceLabel.attributedText = attributeString
        cell.discountLabel.text = "\(discount[indexPath.row]) руб."
        cell.wearLabel.text = tShirt[indexPath.row]
        var percent = 100 - Int(round((Double(discount[indexPath.row] * 100)) / Double(price[indexPath.row])))
        cell.percentLabel.text = "\(percent)%  "
        return cell
    }
    
    
    
}
