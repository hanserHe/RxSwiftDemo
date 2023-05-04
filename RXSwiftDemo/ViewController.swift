//
//  ViewController.swift
//  RXSwiftDemo
//
//  Created by Hanser on 2023-04-28.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

//public struct SectionModel<Section, ItemType> {
//    public var model: Section
//    public var items: [Item]
//
//    public init(model: Section, items: [Item]) {
//        self.model = model
//        self.items = items
//    }
//}
//
//extension SectionModel
//    : SectionModelType {
//    public typealias Identity = Section
//    public typealias Item = ItemType
//
//    public var identity: Section {
//        model
//    }
//}

class ViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    
    let viewModel = ViewModel()
    var bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupUI()
    }
    
    // MARK: - Data
    private func generateItems() -> [String] {
        return ["代码简洁性"]
    }
    // MARK: - UI
    private func setupUI() {
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        var items = Observable.just(generateItems())
//        items.asObservable().bind(to: tableview.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)) { row, text, cell in
//            cell.selectionStyle = .none
//            cell.textLabel?.text = text
//        }.disposed(by: bag)
        
//        items.asObservable().values = ["bb"]
//        print(items.values)
        
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, String>> { cell, tv, indexPath, element in
            let cell = tv.dequeueReusableCell(withIdentifier: "cell")!
            cell.textLabel?.text = "\(element) @ row \(indexPath.row)"
            return cell
        }
        
        viewModel
            .requestData()
            .asObservable()
            .bind(to: tableview.rx.items(dataSource: dataSource))
            .disposed(by: bag)
        
        tableview.rx.itemSelected.map({ indexPath in
            return (indexPath, dataSource[indexPath])
        }).subscribe { _, title in
            self.handleTap(title)
        }.disposed(by: bag)
        
    }
    
    // MARK: - Event
    private func handleTap(_ title: String) {
        switch title {
        case "AsyncSubject":
            self.navigationController?.pushViewController(AsyncSubjectVC(), animated: true)
        case "PublishSubject":
            self.navigationController?.pushViewController(PublishSubjectVC(), animated: true)
        case "ReplaySubject":
            self.navigationController?.pushViewController(ReplaySubjectVC(), animated: true)
        case "BehaviorSubject":
            self.navigationController?.pushViewController(BehaviorSubjectVC(), animated: true)
        default: break
        }
    }

}

