
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var squareView: UIView!
    @IBOutlet weak var changeAnimateLabel: UILabel!
    
    @IBOutlet weak var squareWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var centerXConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    var animateType = ["backgroundColor", "moving", "circle", "turn180", "disappearance", "increase", "endlessAnimation"]
    var item = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        squareView.alpha = 1
    }
    
//    1. Изменение цвета фона квадрата на жёлтый
    @IBAction func backgroundColorButton(_ sender: Any) {
        backgroundColor()
    }
    
//    2. Перемещение в правый верхний угол экрана
    @IBAction func movingButton(_ sender: Any) {
        moving()
    }
    
//    3. Закругление краёв, чтобы квадрат выглядел как круг
    @IBAction func circleButton(_ sender: Any) {
        circle()
    }
    
//    4. Поворот на 180 градусов
    @IBAction func turn180Button(_ sender: Any) {
        turn180()
    }
    
//    5. «Исчезание»
    @IBAction func disappearanceButton(_ sender: Any) {
        disappearance()
    }
    
//    6. Сначала увеличение в два раза, потом анимированное уменьшение обратно
    @IBAction func increaseButton(_ sender: Any) {
        increase()
    }
    
//    7. Бесконечную анимацию поворота
    @IBAction func endlessAnimationButton(_ sender: Any) {
        endlessAnimation()
    }
    
    @IBAction func previousButton(_ sender: Any) {
        if item == 1 {
            item = animateType.count + 1
        }
        item -= 1
        changeAnimateLabel.text = "\(item)"
        changeAnimationsType()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if item == animateType.count {
            item = 0
        }
        item += 1
        changeAnimateLabel.text = "\(item)"
        changeAnimationsType()
    }
    
    func backgroundColor(){
        item = 1
        self.changeAnimateLabel.text = "\(item)"
        UIView.animateKeyframes(withDuration: 0.95, delay: 0, options: UIView.KeyframeAnimationOptions()) {
            self.squareView.backgroundColor = UIColor.yellow
        } completion: { (isCompleted) in
            UIView.animate(withDuration: 0.95, delay: 0.1, options: UIView.AnimationOptions(), animations: {
                self.squareView.backgroundColor = UIColor.red
            }, completion: nil)
        }
    }
    
    func moving(){
        item = 2
        self.changeAnimateLabel.text = "\(item)"
        let squareWidth = self.squareView.bounds.width
        UIView.animate(withDuration: 1.0, delay: 0, options: UIView.AnimationOptions()) {
            self.topConstraint.constant = 0
            self.centerXConstraint.constant = self.view.frame.size.width / 2 - squareWidth / 2
            self.view.layoutIfNeeded()
        } completion: { (isComleted) in
            UIView.animate(withDuration: 1.0){
                self.topConstraint.constant = 100
                self.centerXConstraint.constant = 0
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func circle(){
        item = 3
        self.changeAnimateLabel.text = "\(item)"
        UIView.animate(withDuration: 0.9, delay: 0, options: UIView.AnimationOptions()) {
            self.squareView.layer.cornerRadius = self.squareView.bounds.size.width / 2
        } completion: { (isCompleted) in
            UIView.animate(withDuration: 0.9, delay: 0.2, options: UIView.AnimationOptions(), animations: {
                self.squareView.layer.cornerRadius = 0
            }, completion: nil)
        }
    }
    
    func turn180(){
        item = 4
        self.changeAnimateLabel.text = "\(item)"
        UIView.animate(withDuration: 0.95, delay: 0, options: UIView.AnimationOptions()) {
            self.squareView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        } completion: { (isCompleted) in
            UIView.animate(withDuration: 0.95, delay: 0.1, options: UIView.AnimationOptions(), animations: {
                self.squareView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi * 2)
            }, completion: nil)
        }
    }
    
    func disappearance(){
        item = 5
        self.changeAnimateLabel.text = "\(item)"
        UIView.animate(withDuration: 0.8, delay: 0, options: UIView.AnimationOptions()) {
            self.squareView.alpha = 0
        } completion: { (isCompleted) in
            UIView.animate(withDuration: 0.8, delay: 0.4, options: UIView.AnimationOptions(), animations: {
                self.squareView.alpha = 1
            }, completion: nil)
        }
    }
    
    func increase(){
        item = 6
        self.changeAnimateLabel.text = "\(item)"
        let squareWidth = self.squareView.bounds.size.width
        UIView.animate(withDuration: 0.9, delay: 0, options: UIView.AnimationOptions()) {
            self.topConstraint.constant = 100 - squareWidth / 2
            self.squareWidthConstraint.constant = self.squareWidthConstraint.constant * 2
            self.view.layoutIfNeeded()
        } completion: { (isCompleted) in
            UIView.animate(withDuration: 0.9, delay: 0.2, options: UIView.AnimationOptions(), animations: {
                self.topConstraint.constant = 100
                self.squareWidthConstraint.constant = self.squareWidthConstraint.constant / 2
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    func endlessAnimation(){
        item = 7
        self.changeAnimateLabel.text = "\(item)"
        UIView.animate(withDuration: 2.0, delay: 0, options: UIView.AnimationOptions.curveLinear) {
            self.squareView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            self.squareView.transform = CGAffineTransform.identity
        } completion: { (isCompleted) in
            UIView.animate(withDuration: 2.0, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
                self.squareView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                self.squareView.transform = CGAffineTransform.identity
            }, completion: nil)
        }
    }
    
    func changeAnimationsType(){
        switch item {
        case 1: backgroundColor()
        case 2: moving()
        case 3: circle()
        case 4: turn180()
        case 5: disappearance()
        case 6: increase()
        case 7: endlessAnimation()
        default:
            break
        }
    }
}

