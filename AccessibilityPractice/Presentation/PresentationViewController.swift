//
//  PresentationViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 11/20/24.
//

import Foundation
import UIKit

protocol PresentationViewControllerDelegate: AnyObject {
    func changePage(diff: Int)
}

class PresentationViewController: UIViewController {
    
    weak var delegate: PresentationViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler(_:)))
        rightSwipeRecognizer.direction = .right
        self.view.addGestureRecognizer(rightSwipeRecognizer)
        
        let leftSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler(_:)))
        leftSwipeRecognizer.direction = .left
        self.view.addGestureRecognizer(leftSwipeRecognizer)
    }
    
    @objc func swipeHandler(_ gestureRecognizer : UISwipeGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            if gestureRecognizer.direction == .right {
                rightSwiped()
            }
            if gestureRecognizer.direction == .left {
                leftSwiped()
            }
        }
    }
    
    func leftSwiped() {
        
    }
    
    func rightSwiped() {
        
    }
}
