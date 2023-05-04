//
//  PublishSubjectVC.swift
//  RXSwiftDemo
//
//  Created by Hanser on 2023-05-04.
//

import UIKit
import RxSwift

class PublishSubjectVC: UIViewController {

    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "PublishSubject"
        self.view.backgroundColor = .white
        
        let disposeBag = DisposeBag()
        let subject = PublishSubject<String>()

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
        subject.onCompleted()
        
        subject.onNext("🐷")
        
    }
    

}
