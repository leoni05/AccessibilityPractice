//
//  ExDetailViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 1/31/25.
//

import Foundation
import UIKit
import PinLayout

class ExDetailViewController: UIViewController {
 
    // MARK: - Properties
    
    var label = UILabel()
    private var backButton = UIButton()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .white
        backButton.addTarget(self, action: #selector(backButtonPressed(_:)), for: .touchUpInside)
        self.view.addSubview(backButton)
        
        label.textAlignment = .center
        label.textColor = .white
        self.view.addSubview(label)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backButton.pin.top().left().size(40)
        label.pin.horizontally().vCenter().sizeToFit(.width)
    }
}

// MARK: - Private Extensions

private extension ExDetailViewController {
    @objc func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Extensions

extension ExDetailViewController {
    override func accessibilityPerformEscape() -> Bool {
        self.navigationController?.popViewController(animated: true)
        return true
    }
}
