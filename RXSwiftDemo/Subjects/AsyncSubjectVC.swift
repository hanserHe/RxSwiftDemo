//
//  AsyncSubjectVC.swift
//  RXSwiftDemo
//
//  Created by Hanser on 2023-05-04.
//

import UIKit
import RxSwift

class AsyncSubjectVC: UIViewController {
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "AsyncSubject"
        self.view.backgroundColor = .white
        
        let subject = AsyncSubject<String>()
        subject
            .subscribe{ element in
                print("Subscription: 1 Event: \(element)")
            }
            .disposed(by: disposeBag)
        
        subject.onNext("🐱")
        subject.onNext("🐶")
        subject.onCompleted()
        
        subject
            .subscribe{ element in print("Subscription: 2 Event: \(element)") }
            .disposed(by: disposeBag)
        
        subject.onNext("🐭")
        subject.onCompleted()
        
    }

}
