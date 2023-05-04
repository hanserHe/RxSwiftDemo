//
//  viewModel.swift
//  RXSwiftDemo
//
//  Created by Hanser on 2023-05-04.
//

import UIKit
import RxSwift
import RxDataSources

class ViewModel: NSObject {
    public func requestData() -> Single<[SectionModel<String, String>]> {
        return Single.create { single in
            
            let items = [
                SectionModel(model: "First section", items: [
                        "AsyncSubject",
                        "PublishSubject",
                        "ReplaySubject",
                        "BehaviorSubject",
                    ])
                ]
            
            
            single(.success(items))
            
            return Disposables.create {}
        }
    }
}
