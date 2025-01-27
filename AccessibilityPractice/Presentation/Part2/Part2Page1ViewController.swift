//
//  Part2Page1ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 11/21/24.
//

import Foundation
import UIKit
import PinLayout

class Part2Page1ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var backgroundImageView = UIImageView()
    private var backgroundGradientLayerH = CAGradientLayer()
    private var backgroundGradientLayerV = CAGradientLayer()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = UIImage(named: "BackgroundImage1")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.layer.masksToBounds = true
        self.view.addSubview(backgroundImageView)
        
        let colors: [CGColor] = [
           .init(red: 0, green: 0, blue: 0, alpha: 1),
           .init(red: 0, green: 0, blue: 0, alpha: 0.01),
        ]
        backgroundGradientLayerH.colors = colors
        backgroundGradientLayerH.startPoint = CGPoint(x: 0.0, y: 0.5)
        backgroundGradientLayerH.endPoint = CGPoint(x: 1.0, y: 0.5)
        backgroundImageView.layer.addSublayer(backgroundGradientLayerH)
        
        backgroundGradientLayerV.colors = colors
        backgroundGradientLayerV.startPoint = CGPoint(x: 0.5, y: 1.0)
        backgroundGradientLayerV.endPoint = CGPoint(x: 0.5, y: 0.0)
        backgroundImageView.layer.addSublayer(backgroundGradientLayerV)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        backgroundImageView.pin.left(30%).bottom(20%).top().right()
        backgroundGradientLayerH.pin.all()
        backgroundGradientLayerV.pin.all()
    }
}
