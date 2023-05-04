//
//  ReplaySubjectVC.swift
//  RXSwiftDemo
//
//  Created by Hanser on 2023-05-04.
//

import UIKit
import RxSwift

class ReplaySubjectVC: UIViewController {

    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ReplaySubject"
        self.view.backgroundColor = .white
      
        
        let subject = ReplaySubject<String>.create(bufferSize: 1)

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
        
        subject
            .subscribe { print("Subscription: 3 Event:", $0) }
            .disposed(by: disposeBag)
        
        subject.onNext("🐷")
        subject.onCompleted()
        subject.onNext("🐍")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
