//
//  ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 11/13/24.
//

import UIKit
import PinLayout

class MainViewController: UIViewController {
    
    private var presentationParts = Array<PresentationPart>()
    private var btnContainerView = UIView()
    private var sideButtons = Array<SideButtonView>()
    
    private var selectedPart: Int = 0
    private var currentPage: Int = 0
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        presentationParts.append(PresentationPart(tabIconImage: UIImage(systemName: "square.and.arrow.up"), pages: []))
        presentationParts.append(PresentationPart(tabIconImage: UIImage(systemName: "square.and.arrow.down"), pages: []))
        presentationParts.append(PresentationPart(tabIconImage: UIImage(systemName: "square.and.arrow.up.on.square"), pages: []))
        presentationParts.append(PresentationPart(tabIconImage: UIImage(systemName: "square.and.arrow.down.on.square"), pages: []))
        presentationParts.append(PresentationPart(tabIconImage: UIImage(systemName: "rectangle.portrait.and.arrow.right"), pages: []))
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        self.view.addSubview(btnContainerView)
        
        for idx in presentationParts.indices {
            let button = SideButtonView(image: presentationParts[idx].tabIconImage, tag: idx)
            button.addTarget(self, action: #selector(sideButtonPressed(_:)), for: .touchUpInside)
            btnContainerView.addSubview(button)
            sideButtons.append(button)
        }
        sideButtons[0].setBottomBorderAlpha(value: 1.0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for idx in sideButtons.indices {
            if idx == 0 { sideButtons[idx].pin.top().left().size(60) }
            else { sideButtons[idx].pin.below(of: sideButtons[idx-1], aligned: .center).size(60) }
        }
        btnContainerView.pin.left(self.view.pin.safeArea).vCenter().wrapContent()
    }
    
    @objc func sideButtonPressed(_ sender: SideButtonView) {
        if selectedPart == sender.tag {
            return
        }
        sideButtons[selectedPart].setBottomBorderAlpha(value: 0.0)
        selectedPart = sender.tag
        currentPage = 0
        sender.setBottomBorderAlpha(value: 1.0)
    }
    
}

