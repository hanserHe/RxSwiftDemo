//
//  BehaviorSubjectVC.swift
//  RXSwiftDemo
//
//  Created by Hanser on 2023-05-04.
//

import UIKit
import RxSwift

class BehaviorSubjectVC: UIViewController {
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "BehaviorSubject"
        self.view.backgroundColor = .white
        
    
        let subject = BehaviorSubject(value: "🔴")

        subject
          .subscribe { print("Subscription: 1 Event:", $0) }
          .disposed(by: disposeBag)

        subject.onNext("🐶")
        subject.onNext("🐱")

        subject
          .subscribe { print("Subscription: 2 Event:", $0) }
          .disposed(by: disposeBag)

        subject.onNext("🅰️")
        subject.onNext("🅱️")
//        subject.onCompleted()

        subject
          .subscribe { print("Subscription: 3 Event:", $0) }
          .disposed(by: disposeBag)

        subject.onNext("🍐")
        subject.onNext("🍊")
        
    }
    
    
}
