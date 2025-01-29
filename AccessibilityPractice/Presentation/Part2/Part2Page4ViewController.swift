//
//  Part2Page4ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 1/29/25.
//

import Foundation
import UIKit
import PinLayout
import WebKit

class Part2Page4ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var wkWebview: WKWebView?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        wkWebview = WKWebView(frame: .zero, configuration: webConfiguration)
        
        if let wkWebview = wkWebview {
            wkWebview.backgroundColor = .black
            wkWebview.scrollView.isScrollEnabled = false
            if let url = URL(string: "https://www.youtube.com/embed/BPqir3EZolw?playsinline=1") {
                let request = URLRequest(url: url)
                wkWebview.load(request)
            }
            self.view.addSubview(wkWebview)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        wkWebview?.pin.vertically().left().right(self.view.pin.safeArea)
    }
}
