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
        var accessibilityLabelString: String?
        var pages: [PresentationViewController.Type]
    }
    private var presentationParts = Array<PresentationPart>()
    private var btnContainerView = UIView()
    private var sideButtons = Array<SideButtonView>()
    
    private var selectedPart: Int = 0
    private var currentPage: Int = 0
    private var currentViewController: PresentationViewController? = nil
    
    // MARK: - Life Cycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        presentationParts.append(PresentationPart(tabIconImage: UIImage(systemName: "person.fill"),
                                                  accessibilityLabelString: "Intro", pages: [
                                                    TitleViewController.self
                                                  ]))
        presentationParts.append(PresentationPart(tabIconImage: UIImage(systemName: "accessibility.fill"),
                                                  accessibilityLabelString: "Part 1", pages: [
                                                    AccessibilityTitleViewController.self,
                                                    AccessibilityDefinitionViewController.self,
                                                    RelevantLawsViewController.self,
                                                    JudgmentCaseViewController.self
                                                  ]))
        presentationParts.append(PresentationPart(tabIconImage: UIImage(systemName: "apple.logo"),
                                                  accessibilityLabelString: "Part 2", pages: [
                                                    VoiceOverTitleViewController.self,
                                                    VoiceOverDefinitionViewController.self,
                                                    VoiceOverUsageViewController.self,
                                                    AccessibilityPropertiesViewController.self,
                                                    AccessibilityElementViewController.self,
                                                    AccessibilityLabelViewController.self,
                                                    AccessibilityTraitsViewController.self,
                                                    AccessibilityValueViewController.self,
                                                    AccessibilityHintViewController.self,
                                                    UIKitControlsViewController.self,
                                                    CustomToggleViewController.self,
                                                    NavOrderViewController.self,
                                                    LayoutChangedViewController.self,
                                                    PerformEscapeViewController.self
                                                  ]))
        presentationParts.append(PresentationPart(tabIconImage: UIImage(systemName: "swift"),
                                                  accessibilityLabelString: "Part 3", pages: [
                                                    WrapUpTitleViewController.self,
                                                    Impression1ViewController.self,
                                                    Impression2ViewController.self,
                                                    Impression3ViewController.self,
                                                    EndOfPresentationViewController.self
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
            button.accessibilityLabel = presentationParts[idx].accessibilityLabelString
            sideButtons.append(button)
        }
        sideButtons[0].setBottomBorderAlpha(value: 1.0)
        
        currentViewController = initCurrentPresentationVC()
        if let vc = currentViewController {
            self.addChild(vc)
            self.view.addSubview(vc.view)
            vc.view.didMoveToSuperview()
            accessibilityPageChanged()
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
            changePage(diff: 1)
            return
        }
        
        if let vc = currentViewController {
            vc.willMove(toParent: nil)
            vc.view.removeFromSuperview()
            vc.removeFromParent()
        }
        sideButtons[selectedPart].setBottomBorderAlpha(value: 0.0)
        selectedPart = sender.tag
        currentPage = 0
        currentViewController = initCurrentPresentationVC()
        sender.setBottomBorderAlpha(value: 1.0)
        
        if let vc = currentViewController {
            self.addChild(vc)
            self.view.addSubview(vc.view)
            vc.view.didMoveToSuperview()
            accessibilityPageChanged()
        }
    }
    
    func accessibilityPageChanged() {
        if let currentVC = currentViewController,
           let currentView = currentVC.view {
            self.view.accessibilityElements = [btnContainerView, currentView]
            UIAccessibility.post(notification: .screenChanged, argument: currentView)
        }
    }
    
    func initCurrentPresentationVC() -> PresentationViewController? {
        if selectedPart < presentationParts.count {
            if currentPage < presentationParts[selectedPart].pages.count {
                let pageClass = presentationParts[selectedPart].pages[currentPage]
                let page = pageClass.init()
                page.delegate = self
                return page
            }
        }
        return nil
    }
}

// MARK: - PresentationViewControllerDelegate

extension MainViewController: PresentationViewControllerDelegate {
    func changePage(diff: Int) {
        if 0 <= currentPage + diff &&
            currentPage + diff < presentationParts[selectedPart].pages.count {
            if let vc = currentViewController {
                vc.willMove(toParent: nil)
                vc.view.removeFromSuperview()
                vc.removeFromParent()
            }
            currentPage += diff
            currentViewController = initCurrentPresentationVC()
            if let vc = currentViewController {
                self.addChild(vc)
                self.view.addSubview(vc.view)
                vc.view.didMoveToSuperview()
                accessibilityPageChanged()
            }
        }
    }
}
