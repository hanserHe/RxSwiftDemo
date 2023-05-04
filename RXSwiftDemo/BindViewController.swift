//
//  BindViewController.swift
//  RXSwiftDemo
//
//  Created by Hanser on 2023-05-01.
//

import UIKit
import SnapKit
import RxSwift

class BindViewController: UIViewController {
    let bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bind"
        setupUI()
    }
    
    deinit {
        print("\([NSStringFromClass(self.classForCoder)]) - \(#function)")
    }
    
    // MARK: - UI
    private func setupUI() {
        
        let testView = UIView()
        testView.backgroundColor = .yellow
        self.view.addSubview(testView)
        testView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.width.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
        
        let minimalPasswordLength = 10
        let textView = UITextView()
        textView.backgroundColor = .white
        self.view.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.width.centerX.equalToSuperview()
            make.height.equalTo(200)
        }
        
        textView.rx.text.subscribe { evet in
            print(evet.event)
        }.disposed(by: bag)
        
        
        textView.rx.text.orEmpty
            .map { $0.count >= minimalPasswordLength }
            .bind(to: testView.rx.isHidden)
            .disposed(by: bag)
        
        let label = UILabel()
        label.textColor = .white
        self.view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(testView.snp.bottom).offset(2)
        }
        
        textView.rx.text
            .asObservable()
            .bind(to: label.rx.text)
            .disposed(by: bag)
    }

}
