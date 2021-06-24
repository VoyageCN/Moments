//
//  MomentsListViewController.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import UIKit
import RxSwift
import RxDataSources
import DesignKit

final class MomentsListViewController: BaseViewController {
    private var viewModel: MomentsListViewModel!
    private var loadingDisposeBag = DisposeBag()

    private let tableView: UITableView = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.separatorStyle = .none
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 100
    }
    private let activityIndicatorView: UIActivityIndicatorView = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let errorLabel: UILabel = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isHidden = true
        $0.textColor = UIColor.designKit.primaryText
        $0.text = L10n.MomentsList.errorMessage
    }

    override init() {
        viewModel = MomentsListViewModel(userID: "1", momentsRepo: MomentsRepo.shared)
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setConstraints()
        setupBindings()
    }
}

private extension MomentsListViewController {
    func setupUI() {
        let cells = [UserProfileListItemViewModel.reuseIdentifer: BaseTableViewCell<UserProfileListItemView<UserProfileListItemViewModel>, UserProfileListItemViewModel>.self]

        cells.forEach {
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
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, ListItemViewModel>> { _, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: type(of: item)), for: indexPath)
//            (cell as? BaseTableViewCell)?.update(with: item)
            return cell
        }

        viewModel.listItems
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

        viewModel.load()
            .do(onDispose: { self.activityIndicatorView.rx.isAnimating.onNext(false) })
            .map { false }
            .startWith(true)
            .distinctUntilChanged()
            .bind(to: activityIndicatorView.rx.isAnimating)
            .disposed(by: loadingDisposeBag)
    }
}
