
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clockView: ClockView!
    @IBOutlet weak var customButton: CustomButtonView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Нажатие view
        let customButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap(tap:)))
        customButton.addGestureRecognizer(customButtonTapGesture)
        
//        Связываем 
        let analogSegmentControll = AnalogSegmentControll.loadFromNIB()
        analogSegmentControll.delegate = self
        view.addSubview(analogSegmentControll)
    }
}

extension ViewController: AnalogSegmentControllDelegate {
    
//    При выборе 1ого сегмента
    func analogSegmentControllPressedOne(_ analogSegmentControll: AnalogSegmentControll) {
        clockView.isHidden = true
        customButton.isHidden = false
    }
    
//    При выборе 2ого сегмента
    func analogSegmentControllPressedTwo(_ analogSegmentControll: AnalogSegmentControll) {
        clockView.isHidden = false
        customButton.isHidden = true
    }
  
//    Действие при нажатии
    @objc func handleTap(tap: UITapGestureRecognizer) {
        label.text = "Tap!"
    }
}
