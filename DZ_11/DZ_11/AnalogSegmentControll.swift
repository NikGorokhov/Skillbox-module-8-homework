
import UIKit

protocol AnalogSegmentControllDelegate: NSObjectProtocol{
    func analogSegmentControllPressedOne(_ analogSegmentControll: AnalogSegmentControll)
    func analogSegmentControllPressedTwo(_ analogSegmentControll: AnalogSegmentControll)
}

@IBDesignable
class AnalogSegmentControll: UIView {
    
    weak var delegate: AnalogSegmentControllDelegate?
    var isSetuped = false
    
    @IBInspectable var fonViewBorderColor: UIColor = UIColor.black
    @IBInspectable var blockViewColor: UIColor = UIColor.yellow
    @IBInspectable var textButtonOne: String = "seg1"
    @IBInspectable var textButtonTwo: String = "seg2"
    
    @IBOutlet weak var fonView: UIView!{
        didSet{ fonView.layer.cornerRadius = 10
                fonView.layer.borderWidth = 1
                fonView.layer.borderColor = fonViewBorderColor.cgColor
        }
    }
    @IBOutlet weak var blockView: UIView!{
        didSet{ blockView.layer.cornerRadius = 9
                blockView.backgroundColor = blockViewColor }
    }
    
    @IBOutlet weak var checkButtonOne: NSLayoutConstraint!{
        didSet{ checkButtonOne.priority = UILayoutPriority(rawValue: 950) }
    }
    @IBOutlet weak var checkButtonTwo: NSLayoutConstraint!
    
    @IBOutlet weak var textButtonOneLabel: UILabel!{
        didSet{ textButtonOneLabel.text = textButtonOne }
    }
    @IBOutlet weak var textButtonTwoLabel: UILabel!{
        didSet{ textButtonTwoLabel.text = textButtonTwo }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if isSetuped { return }
        isSetuped = true
    }
    
    @IBAction func buttonOne(_ sender: UIButton) {
        delegate?.analogSegmentControllPressedOne(self)
        
        checkButtonOne.priority = UILayoutPriority(rawValue: 950)
        checkButtonTwo.priority = UILayoutPriority(rawValue: 750)
        UIView.animate(withDuration: 0.3) {
           self.layoutIfNeeded()
        }
    }
    
    @IBAction func buttonTwo(_ sender: UIButton) {
        delegate?.analogSegmentControllPressedTwo(self)
        
        checkButtonOne.priority = UILayoutPriority(rawValue: 750)
        checkButtonTwo.priority = UILayoutPriority(rawValue: 950)
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    static func loadFromNIB() -> AnalogSegmentControll{
        let nib = UINib(nibName: "AnalogSegmentControll", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! AnalogSegmentControll
    }
}
