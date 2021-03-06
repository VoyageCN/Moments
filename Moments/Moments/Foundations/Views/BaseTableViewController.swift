//
//  BaseTableViewController.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import UIKit
import RxSwift
import RxDataSources

class BaseTableViewController: BaseViewController {
    var viewModel: ListViewModel!

    private let tableView: UITableView = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.separatorStyle = .none
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 100
        $0.contentInsetAdjustmentBehavior = .never
    }
    private let activityIndicatorView: UIActivityIndicatorView = configure(.init(style: .large)) {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let errorLabel: UILabel = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isHidden = true
        $0.textColor = UIColor.designKit.primaryText
        $0.text = L10n.MomentsList.errorMessage
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setConstraints()

        DispatchQueue.main.async {
            self.setupBindings()
        }

        loadItems()
    }
}

private extension BaseTableViewController {
    func setupUI() {
        view.backgroundColor = UIColor.designKit.background
        tableView.backgroundColor = UIColor.designKit.background

        [UserProfileListItemViewModel.reuseIdentifer: BaseTableViewCell<UserProfileListItemView>.self,
         MomentListItemViewModel.reuseIdentifier: BaseTableViewCell<MomentListItemView>.self].forEach {
            tableView.register($0.value, forCellReuseIdentifier: $0.key)
        }

        [tableView, activityIndicatorView, errorLabel].forEach {
            view.addSubview($0)
        }
    }

    func setConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        activityIndicatorView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        errorLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

    func setupBindings() {
        let refreshControl = UIRefreshControl()
        refreshControl.rx.controlEvent(.valueChanged)
            .map { refreshControl.isRefreshing }
            .filter { $0 }
            .bind { [weak self] _ in self?.loadItems() }
            .disposed(by: disposeBag)

        tableView.refreshControl = refreshControl

        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, ListItemViewModel>> { _, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: type(of: item)), for: indexPath)

            (cell as? ListItemCell)?.update(with: item)

            return cell
        }

        viewModel.listItems
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

        viewModel.hasError
            .map { !$0 }
            .bind(to: errorLabel.rx.isHidden)
            .disposed(by: disposeBag)
    }

    func loadItems() {
        self.viewModel.hasError.onNext(false)
        viewModel.loadItems()
            .do(onDispose: { [weak self] in
                self?.activityIndicatorView.rx.isAnimating.onNext(false)
                self?.tableView.refreshControl?.endRefreshing()
            })
            .map { false }
            .startWith(true)
            .distinctUntilChanged()
            .bind(to: activityIndicatorView.rx.isAnimating)
            .disposed(by: disposeBag)
    }
}
