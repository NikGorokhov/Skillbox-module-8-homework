

import UIKit

@IBDesignable
class CustomButtonView: UIView {
    
//    Ширина обводки
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet { layer.borderWidth = borderWidth }
    }
    
//    Цвет обводки
    @IBInspectable var borderColor: UIColor? {
        didSet { layer.borderColor = borderColor?.cgColor }
    }
    
//    Размер закругления
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
}
