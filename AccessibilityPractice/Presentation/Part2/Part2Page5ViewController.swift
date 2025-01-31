//
//  Part2Page5ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 1/30/25.
//

import Foundation
import UIKit
import PinLayout

class Part2Page5ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var mainContentView = UIView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    
    private var innerContentView = UIView()
    
    private var featuresContainer = UIView()
    private struct Feature {
        let title: String
        let description: String
    }
    private struct FeatureCategory {
        let title: String
        let button: UIButton
        let triangleView: UIView
        var featureLabels: Array<UILabel>
        let features: Array<Feature>
    }
    private var featureCategories = Array<FeatureCategory>()
    private var featureLabelsContainer = UIView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainContentView)
        
        titleLabel.text = "2. Apple의 접근성"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .white
        mainContentView.addSubview(titleLabel)
        
        subtitleLabel.text = "Apple이 지원하는 접근성 기능"
        subtitleLabel.font = .systemFont(ofSize: 15)
        subtitleLabel.textColor = .white
        mainContentView.addSubview(subtitleLabel)
        
        mainContentView.addSubview(innerContentView)
        
        setFeatureCategories()
        
        innerContentView.addSubview(featuresContainer)
        
        for idx in featureCategories.indices {
            let button = featureCategories[idx].button
            button.alpha = 0.3
            button.backgroundColor = .white
            button.setTitle(featureCategories[idx].title, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 14)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = 3
            featuresContainer.addSubview(button)
        }
        
        featureLabelsContainer.layer.cornerRadius = 5.0
        featureLabelsContainer.layer.borderWidth = 1.0
        featureLabelsContainer.layer.borderColor = UIColor.white.cgColor
        featureLabelsContainer.layer.masksToBounds = true
        featuresContainer.addSubview(featureLabelsContainer)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(2).sizeToFit(.width)
        
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right(20).bottom(self.view.pin.safeArea).marginBottom(25)
        
        for idx in featureCategories.indices {
            let button = featureCategories[idx].button
            if idx == 0 {
                button.pin.top().left().width(80).height(35)
            }
            else {
                button.pin.below(of: featureCategories[idx-1].button, aligned: .left)
                    .width(80).height(35).marginTop(5)
            }
        }
        if let firstButton = featureCategories.first?.button,
           let lastButton = featureCategories.last?.button {
            featureLabelsContainer.pin.after(of: firstButton, aligned: .top).bottom(to: lastButton.edge.bottom)
                .width(400).marginLeft(10)
        }
        featuresContainer.pin.wrapContent().center()
    }
}

// MARK: - Private Extensions

private extension Part2Page5ViewController {
    func setFeatureCategories() {
        featureCategories = [
            FeatureCategory(title: "말하기", button: UIButton(), triangleView: UIView(), featureLabels: [],
                            features: [
                                Feature(title: "실시간 말하기", description: "타이핑한 말, 소리 내어 읽어주기."),
                                Feature(title: "개인 음성", description: "당신을 꼭 닮은 목소리 만들기."),
                                Feature(title: "콘텐츠 말하기", description: "타이핑 중인 글자 및 단어는 물론, 화면의 어떤 텍스트든 큰 소리로 또박또박.")
                            ]),
            FeatureCategory(title: "시각", button: UIButton(), triangleView: UIView(), featureLabels: [],
                            features: [
                                Feature(title: "VoiceOver", description: "화면 속 일들을 음성뿐 아니라 점자로도 설명해 주는 화면 읽기 기능."),
                                Feature(title: "확대기", description: "주변 사물을 확대해서 보여주거나, 감지하거나, 설명까지 해줄 수 있는 디지털 돋보기."),
                                Feature(title: "디스플레이 설정 및 텍스트 크기", description: "색상, 텍스트 크기, 투명도, 대비 등을 당신에게 꼭 맞게.")
                            ]),
            FeatureCategory(title: "시각", button: UIButton(), triangleView: UIView(), featureLabels: [],
                            features: [
                                Feature(title: "음악 햅틱", description: "노래의 리듬에 맞춘 진동과 함께, iPhone으로 음악 경험하기."),
                                Feature(title: "소리 인식", description: "특정 소리를 감지하면 당신이 알 수 있도록 알림으로.")
                            ]),
            FeatureCategory(title: "운동능력", button: UIButton(), triangleView: UIView(), featureLabels: [],
                            features: [
                                Feature(title: "스위치 제어", description: "보조 스위치 장치, 게임 컨트롤러 또는 소리로 기기 제어하기."),
                                Feature(title: "눈 추적", description: "기기 제어를 당신의 시선만으로.")
                            ]),
            FeatureCategory(title: "인지능력", button: UIButton(), triangleView: UIView(), featureLabels: [],
                            features: [
                                Feature(title: "보조 접근", description: "인지 부담을 덜도록, 기기 및 앱 내 경험 맞춤 설정하기."),
                                Feature(title: "실시간 말하기", description: "타이핑한 말, 소리 내어 읽어주기.")
                            ])
        ]
    }
}
