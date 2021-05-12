//
//  ViewController.swift
//  Animated Speedometer
//
//  Created by Max on 05/05/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    let speedometer = SpeedometerView(frame: CGRect(x: 0, y: 0, width: CGFloat(UIScreen.main.bounds.width*0.8), height: CGFloat(UIScreen.main.bounds.width*0.8)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speedometer.center = view.center
        view.addSubview(speedometer)
    }
    @IBAction func buttonAction(_ sender: Any) {
        showCheckMark(text: "HORAAAAY", closure: nil)
    }
    @IBAction func rotateButton(_ sender: Any) {
        speedometer.setValue(percents: Int(slider.value))
    }
    
    func showCheckMark(text: String, closure: (() -> Void)?){
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = true
        let whiteBackground = UIView()
        whiteBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(whiteBackground)
        NSLayoutConstraint.activate([
            whiteBackground.topAnchor.constraint(equalTo: view.topAnchor),
            whiteBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            whiteBackground.leftAnchor.constraint(equalTo: view.leftAnchor),
            whiteBackground.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
        
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        let checkmark = CheckmarkView(frame: CGRect(x: 0, y: 0, width: CGFloat(view.frame.width*0.5), height: CGFloat(view.frame.width*0.5)))
        
        label.translatesAutoresizingMaskIntoConstraints = false
        checkmark.translatesAutoresizingMaskIntoConstraints = false
        
        whiteBackground.backgroundColor = .white
        whiteBackground.addSubview(label)
        whiteBackground.addSubview(checkmark)
        
        NSLayoutConstraint.activate([
            checkmark.centerXAnchor.constraint(equalTo: whiteBackground.centerXAnchor),
            checkmark.widthAnchor.constraint(equalTo: whiteBackground.widthAnchor, multiplier: 0.5),
            checkmark.centerYAnchor.constraint(equalTo: whiteBackground.centerYAnchor, constant: -checkmark.frame.height/2),
            checkmark.heightAnchor.constraint(equalTo: checkmark.widthAnchor),
        
            label.topAnchor.constraint(equalTo: checkmark.bottomAnchor, constant: 50),
            label.centerXAnchor.constraint(equalTo: whiteBackground.centerXAnchor),
            label.widthAnchor.constraint(equalTo: whiteBackground.widthAnchor, multiplier: 0.85)
        ])
        
        checkmark.animateCircle(duration: 2)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            whiteBackground.removeFromSuperview()
            self.navigationController?.isNavigationBarHidden = false
            self.tabBarController?.tabBar.isHidden = false
            closure?()
        }
    }

}

