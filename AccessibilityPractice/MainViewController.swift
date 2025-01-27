//
//  ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 11/13/24.
//

import UIKit
import PinLayout

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    struct PresentationPart {
        var tabIconImage: UIImage?
        var pages: [PresentationViewController]
    }
    private var presentationParts = Array<PresentationPart>()
    private var btnContainerView = UIView()
    private var sideButtons = Array<SideButtonView>()
    
    private var selectedPart: Int = 0
    private var currentPage: Int = 0
    private var currentViewController: PresentationViewController? {
        get {
            if selectedPart < presentationParts.count {
                if currentPage < presentationParts[selectedPart].pages.count {
                    return presentationParts[selectedPart].pages[currentPage]
                }
            }
            return nil
        }
    }
    
    // MARK: - Life Cycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        presentationParts.append(PresentationPart(tabIconImage: UIImage(systemName: "person"), pages: [
            Part1Page1ViewController(delegate: self),
            Part1Page2ViewController(delegate: self)
        ]))
        presentationParts.append(PresentationPart(tabIconImage: UIImage(systemName: "accessibility"), pages: [
            Part2Page1ViewController(delegate: self),
            Part2Page2ViewController(delegate: self),
            Part2Page3ViewController(delegate: self)
        ]))
        presentationParts.append(PresentationPart(tabIconImage: UIImage(systemName: "apple.logo"), pages: [
            Part3Page1ViewController(delegate: self)
        ]))
        presentationParts.append(PresentationPart(tabIconImage: UIImage(systemName: "voiceover"), pages: [
            Part4Page1ViewController(delegate: self)
        ]))
        presentationParts.append(PresentationPart(tabIconImage: UIImage(systemName: "swift"), pages: [
            Part5Page1ViewController(delegate: self)
        ]))
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
        if let vc = currentViewController {
            self.addChild(vc)
            self.view.addSubview(vc.view)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let btnSize = 60.0
        for idx in sideButtons.indices {
            if idx == 0 { sideButtons[idx].pin.top().left().size(btnSize) }
            else { sideButtons[idx].pin.below(of: sideButtons[idx-1], aligned: .center).size(btnSize) }
        }
        btnContainerView.pin.left(self.view.pin.safeArea).vCenter().wrapContent()
        
        if let vc = currentViewController {
            vc.view.pin.after(of:btnContainerView).top().right().bottom()
        }
    }
}

// MARK: - Private Extensions

private extension MainViewController {
    @objc func sideButtonPressed(_ sender: SideButtonView) {
        if selectedPart == sender.tag {
            return
        }
        
        if let vc = currentViewController {
            vc.removeFromParent()
            vc.view.removeFromSuperview()
        }
        sideButtons[selectedPart].setBottomBorderAlpha(value: 0.0)
        selectedPart = sender.tag
        currentPage = 0
        sender.setBottomBorderAlpha(value: 1.0)
        
        if let vc = currentViewController {
            self.addChild(vc)
            self.view.addSubview(vc.view)
        }
    }
}

// MARK: - PresentationViewControllerDelegate

extension MainViewController: PresentationViewControllerDelegate {
    func changePage(diff: Int) {
        if 0 <= currentPage + diff &&
            currentPage + diff < presentationParts[selectedPart].pages.count {
            if let vc = currentViewController {
                vc.removeFromParent()
                vc.view.removeFromSuperview()
            }
            currentPage += diff
            if let vc = currentViewController {
                self.addChild(vc)
                self.view.addSubview(vc.view)
            }
        }
    }
}
