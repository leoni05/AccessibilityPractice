//
//  Part2Page3ViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 1/28/25.
//

import Foundation
import UIKit
import PinLayout

class Part2Page3ViewController: PresentationViewController {
    
    // MARK: - Properties
    
    private var mainContentView = UIView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    
    private var innerContentView = UIView()
    
    private var scrollView = UIScrollView()
    private var scrollViewLabel = UILabel()
    private var updateLabels = Array<UILabel>()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainContentView)
        
        titleLabel.text = "2. Apple의 접근성"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .white
        mainContentView.addSubview(titleLabel)
        
        subtitleLabel.text = "Apple의 노력"
        subtitleLabel.font = .systemFont(ofSize: 15)
        subtitleLabel.textColor = .white
        mainContentView.addSubview(subtitleLabel)
        
        mainContentView.addSubview(innerContentView)
        
        scrollView.layer.cornerRadius = 5.0
        scrollView.layer.borderWidth = 1.0
        scrollView.layer.borderColor = UIColor.white.cgColor
        scrollView.layer.masksToBounds = true
        innerContentView.addSubview(scrollView)
        
        scrollViewLabel.text = "iOS Accessibility Updates"
        scrollViewLabel.textColor = .black
        scrollViewLabel.font = .systemFont(ofSize: 13)
        scrollViewLabel.backgroundColor = .white
        scrollViewLabel.textAlignment = .center
        scrollViewLabel.layer.cornerRadius = 3.0
        scrollViewLabel.layer.masksToBounds = true
        innerContentView.addSubview(scrollViewLabel)
        
        setUpdateLabels()
        for idx in updateLabels.indices {
            scrollView.addSubview(updateLabels[idx])
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainContentView.pin.left(20).right(self.view.pin.safeArea).vertically()
        titleLabel.pin.top(self.view.pin.safeArea).horizontally().marginTop(40).sizeToFit(.width)
        subtitleLabel.pin.below(of: titleLabel).horizontally().marginTop(2).sizeToFit(.width)
        
        innerContentView.pin.below(of: subtitleLabel, aligned: .left)
            .right().bottom(self.view.pin.safeArea).marginBottom(25)
        
        scrollView.pin.horizontally().top(30).bottom(20).maxWidth(500).justify(.center)
        scrollViewLabel.pin.left(to: scrollView.edge.left).top(to: scrollView.edge.top)
            .width(180).height(24).marginLeft(8).marginTop(-12)
        
        for idx in updateLabels.indices {
            if idx == 0 {
                updateLabels[idx].pin.horizontally(12).top(24).sizeToFit(.width)
            }
            else {
                updateLabels[idx].pin.below(of: updateLabels[idx-1]).horizontally(12).marginTop(4).sizeToFit(.width)
            }
        }
        if let lastLabel = updateLabels.last {
            scrollView.contentSize = CGSize(width: scrollView.bounds.width, height: lastLabel.frame.maxY + 12)
        }
    }
}

// MARK: - Private Extensions

private extension Part2Page3ViewController {
    func setUpdateLabels() {
        let strings: Array<String> = [
            "[ iOS 18 ]",
            "‘눈 추적’ 기능은 사용자가 눈만으로 iPhone을 다룰 수 있게 해줌(iPhone 12 및 이후 모델, iPhone SE(3세대))",
            "‘음악 햅틱’은 iPhone의 Taptic Engine과 곡의 리듬을 동기화하여 청각 장애 또는 난청이 있는 사용자도 Apple Music 카탈로그를 즐길 수 있도록 해줌(iPhone 14 및 이후 모델)",
            "‘음성 단축어’는 심각한 비전형적 말하기 패턴을 보이는 사람들이 사용자 설정 발화를 녹음하여 그 소리로 특정 동작을 실행할 수 있게 도와줌",
            "차량 모션큐는 콘텐츠에 지장을 주지 않고 차량을 따라 이동하는 점을 화면에 표시하여 이동하는 차량에서 동승자의 멀미를 줄이는 데 도움을 줄 수 있음",
            " ",
            "[ iOS 17 ]",
            "보조 접근 기능이 전화 및 FaceTime, 메시지, 카메라, 사진 및 음악 앱에서 큰 텍스트, 시각적 대체 요소 및 초점이 맞춰진 항목 등 사용자 경험의 핵심적인 기능만 남겨 인지 부하를 덜어줌",
            "실시간 말하기를 통해 말하고 싶은 내용을 입력하여 전화 통화, FaceTime 통화 및 대면 대화 시 그 내용을 말로 전달할 수 있음",
            "확대기 감지 모드의 ‘가리키면 읽어주기’ 기능이 문에 달린 키패드, 가전 제품의 버튼과 같이 작은 텍스트 레이블이 부착된 물리적 대상의 텍스트를 iPhone을 사용하여 소리 내어 읽어줌",
            " ",
            "[ iOS 16 ]",
            "확대기의 문 감지 기능이 문의 위치를 파악하고 문 주변에 있는 표시나 기호를 읽어서 사용자에게 문을 여는 방법을 알려 줌(iPhone 12 Pro 및 iPhone 13 Pro)",
            "Apple Watch 미러링을 통해 iPhone에서 Apple Watch를 완전히 제어할 수 있으며, 스위치 제어, 음성 명령 또는 iPhone상의 기타 보조 기능을 사용하여 Apple Watch의 기능을 최대한으로 활용할 수 있음",
            "공동 플레이어 기능은 여러 개의 게임 컨트롤러에서 전달하는 입력을 하나로 통합하여 인지 장애가 있는 사용자가 게임을 플레이하는 동안 간병인 또는 친구로부터 도움을 받을 수 있도록 지원함",
            "VoiceOver 지원 대상에 벵골어(인도), 불가리아어, 카탈루냐어, 우크라이나어, 베트남어 등을 포함한 20개 이상의 언어 및 지역이 새롭게 추가됨",
            " ",
            "[ iOS 15 ]",
            "VoiceOver를 사용한 이미지 탐색을 통해 사람과 사물에 대한 훨씬 더 자세한 정보를 얻을 수 있으며, 사진 속 텍스트 및 표 데이터에 대해 알 수 있음",
            "마크업으로 VoiceOver 이미지 설명을 추가하면 VoiceOver가 읽을 수 있는 자신만의 이미지 설명을 추가 가능",
            "앱별 설정을 사용하면 원하는 앱에 대해서만 디스플레이 및 텍스트 크기 설정을 사용자 지정",
            "배경 사운드는 원치 않는 환경 또는 외부 소음을 차단하기 위해 균형 있는 소음, 밝은 또는 어두운 소음, 바다, 비 및 시냇물 소리를 배경 사운드로 지속적으로 재생",
            "스위치 제어를 위한 사운드 조치를 사용하면 간단한 음성으로 iPhone을 제어 가능",
            "청력도를 설정에서 가져올 수 있으므로 청각 테스트 결과에 따라 오디오 조정을 맞춤화",
            "새로운 음성 명령 언어에 중국어(중국 본토), 광둥어(홍콩), 프랑스어(프랑스), 독일어(독일) 포함",
            "인공와우, 산소 튜브 또는 소프트 헬멧을 포함한 미모티콘 옵션 포함",
            " ",
            "[ iOS 14 ]",
            "음성 명령 사용자는 iPhone을 재시동한 후 음성만으로 첫 잠금 해제를 할 수 있음",
            " ",
            "[ iOS 12 ]",
            "이제 ‘실시간 듣기’를 AirPods에서 지원하여 더 선명하게 들을 수 있음",
            "AT&T의 경우 RTT 전화 통화 가능",
            "선택 항목 말하기에서 이제 Siri 음성을 사용하여 선택한 텍스트 말하기 지원",
            " ",
            "[ iOS 11 ]",
            "App Store의 화면을 볼드체 및 큰 텍스트로 사용자화 할 수 있는 손쉬운 기능 지원을 추가함",
            "웹 및 Mail 메시지의 이미지에 대한 스마트 반전 지원을 추가함",
            "RTT 경험을 향상하고 T-Mobile에 대한 RTT 지원을 추가함",
            "VoiceOver 및 스위치 제어 사용자를 위해 iPad의 앱 전환 기능을 향상함",
            "VoiceOver가 Bluetooth 상태 및 배지 아이콘을 잘못 설명하는 문제를 해결함",
            "VoiceOver를 사용할 때 전화 앱에 통화 종료 버튼이 표시되지 않는 오류를 수정함",
            "VoiceOver로 앱 내 앱 평가를 사용할 수 없는 문제를 수정함",
            "‘실시간 듣기’를 사용할 때 오디오 재생음이 왜곡되는 문제를 해결함",
            " ",
            "[ iOS 10 ]",
            "VoiceOver 기능에 BraillePen14를 추가함",
            "VoiceOver에서 점자표가 임의로 전환되는 문제를 고침",
            "VoiceOver에서 가끔 Siri 고품질 음성을 사용할 수 없는 오류를 수정함",
            "VoiceOver 사용자가 목록의 항목을 재정렬할 수 없는 문제를 수정함",
            "종종 Switch Control로 음성 메시지를 지울 수 없는 오류를 수정함",
            " ",
            "[ iOS 9 ]",
            "스위치 제어 손쉬운 사용 옵션의 3D Touch 안정성 향상",
            "받아쓰기를 한 다음 VoiceOver의 말하기에 문제가 생기던 오류 수정",
            "VoiceOver 사용자가 App Store에 리뷰를 작성할 수 없던 문제 해결",
            "Bluetooth 헤드셋으로 전화를 받으면 VoiceOver가 반응하지 않던 문제 해결",
            "미리 알림에서 큰 텍스트가 읽히지 않던 오류 수정",
            "카메라 얼굴 인식을 사용할 때 발생하던 VoiceOver 관련 문제 수정",
            "화면을 깨우는 데 VoiceOver 지원 추가",
            "3D Touch 동작으로 App 전환기를 실행하는 데 VoiceOver 지원 추가",
            "통화를 종료하려고 할 때 발생하던 사용법 유도 관련 문제 해결",
            "3D Touch를 사용할 때 스위치 제어 사용자를 위한 기능 향상",
            "화면 말하기의 말하기 속도와 관련된 문제 수정",
            "신체 운동이 제한적인 사용자를 위해 터치 동작에 터치 제어 옵션 추가 제공",
            "기능을 사용자화하거나 새로 생성할 수 있는 스위치 제어 기법",
            "VoiceOver 사용자를 위한 Siri 음성 지원",
            "AssistiveTouch 사용자화 옵션 추가",
            "키 반복, 느린 키 및 고정 키에 대한 하드웨어 키보드 지원",
            "오디오가 재생되는 곳을 선택할 수 있도록 MFi 보청기 오디오 전송 향상",
            " ",
            "[ iOS 8 ]",
            "Safari에서 뒤로 버튼을 사용할 때 VoiceOver 제스처가 응답하지 않던 문제 수정",
            "임시 저장 Mail 메시지에서 VoiceOver 초점의 신뢰성이 떨어지던 문제 수정",
            "점자 화면 입력을 사용하여 웹 페이지 양식에 텍스트를 입력할 수 없던 문제 수정",
            "점자 디스플레이에서 빠른 탐색을 토글할 때 빠른 탐색이 꺼져있다고 나오던 문제 수정",
            "VoiceOver가 활성화되어 있을 때 App 아이콘이 홈 화면에서 움직이지 않던 문제 수정",
            "일시 정지 후 화면 말하기가 다시 시작되지 않던 화면 말하기 문제 수정",
            "사용법 유도가 제대로 동작되지 않던 문제 수정",
            "VoiceOver가 타사 키보드와 동작하지 않을 수 있는 오류 수정",
            "iPhone 6 및 iPhone 6 Plus에서 MFi 보청기를 사용할 때 안정성 및 오디오 음질 향상",
            "다른 번호로 전화를 걸 때까지 발신음이 멈추는 VoiceOver 문제 수정",
            "필기, Bluetooth 키보드 및 점자 디스플레이를 VoiceOver와 사용할 때 안정성 향상",
            "..."
        ]
        for idx in strings.indices {
            let label = UILabel()
            label.text = strings[idx]
            label.numberOfLines = 0
            label.textColor = .white
            label.font = .systemFont(ofSize: 15)
            updateLabels.append(label)
        }
    }
}
