//
//  ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 11/13/24.
//

import UIKit

class MainViewController: UIViewController {
    
    private var presentationParts = Array<PresentationPart>()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        presentationParts.append(PresentationPart(tabIconImage: UIImage(named: "square.and.arrow.up"), pages: []))
        presentationParts.append(PresentationPart(tabIconImage: UIImage(named: "square.and.arrow.down"), pages: []))
        presentationParts.append(PresentationPart(tabIconImage: UIImage(named: "square.and.arrow.up.on.square"), pages: []))
        presentationParts.append(PresentationPart(tabIconImage: UIImage(named: "square.and.arrow.down.on.square"), pages: []))
        presentationParts.append(PresentationPart(tabIconImage: UIImage(named: "rectangle.portrait.and.arrow.right"), pages: []))
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func loadView() {
        self.view = MainView()
    }
}

