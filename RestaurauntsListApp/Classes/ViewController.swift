//
//  ViewController.swift
//  RestaurauntsListApp
//
//  Created by Андрей Колесников on 08.08.2022.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tw = UITableView()
        tw.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        return tw
    }()
    
    private let viewModel: RestaurantListViewModel!
    private let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        
        
        viewModel.fetchRestaurantModels().bind(to: tableView.rx.items(cellIdentifier: TableViewCell.identifier)) { index, viewModel, cell in
            cell.textLabel?.text = viewModel.displayText
        }.disposed(by: bag)
        view.addSubview(tableView)
    }
    init(viewModel: RestaurantListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }


}

