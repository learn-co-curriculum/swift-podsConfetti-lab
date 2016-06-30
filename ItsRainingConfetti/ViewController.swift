//
//  ViewController.swift
//  ItsRainingConfetti
//


import UIKit
import SAConfettiView

class ViewController: UIViewController {

    var confettiView: SAConfettiView!

    @IBOutlet weak var confettiButton: UIButton!
    @IBOutlet weak var confettiIntensitySlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appleBlueColor = UIColor.init(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
        self.confettiButton.backgroundColor = appleBlueColor.colorWithAlphaComponent(0.1)
        self.confettiButton.layer.cornerRadius = self.confettiButton.frame.size.width / 2
        self.confettiButton.layer.borderWidth = 1
        self.confettiButton.layer.borderColor = appleBlueColor.CGColor
        
        self.confettiView = SAConfettiView(frame: self.view.bounds)
        view.insertSubview(self.confettiView, atIndex: 0)
        
    }

    @IBAction func confettiButtonTouched(sender: UIButton) {
        if self.confettiView.isActive() {
            self.confettiView.stopConfetti()
        } else {
            self.confettiView.startConfetti()
        }
    }
    
    @IBAction func confettiIntensityChanged(sender: UISlider) {
        
        self.confettiView.intensity = sender.value
        if self.confettiView.isActive() {
            self.confettiView.stopConfetti()
            self.confettiView.startConfetti()
        }
        
    }
    
    @IBAction func confettiTypeChanged(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.confettiView.type = .Confetti
        case 1:
            self.confettiView.type = .Triangle
        case 2:
            self.confettiView.type = .Star
        case 3:
            self.confettiView.type = .Diamond
        default:
            break
        }
        if self.confettiView.isActive() {
            self.confettiView.stopConfetti()
            self.confettiView.startConfetti()
        }
    
    }

}

