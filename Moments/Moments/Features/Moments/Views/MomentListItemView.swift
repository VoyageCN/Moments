//
//  MomentListItemView.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import UIKit
import RxSwift
import RxCocoa
import DesignKit

class MomentListItemView: BaseListItemView {
    private let userAvatarImageView: UIImageView = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.asAvatar(cornerRadius: 4)
        $0.contentMode = .scaleAspectFit
        $0.accessibilityIgnoresInvertColors = true
    }

    private let userNameLabel: UILabel = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor.designKit.background
        $0.setDynamicFont(UIFont.designKit.captionBold)
        $0.textColor = UIColor.designKit.primaryText
        $0.numberOfLines = 1
    }

    private let titleLabel: UILabel = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor.designKit.background
        $0.setDynamicFont(UIFont.designKit.body)
        $0.textColor = UIColor.designKit.secondaryText
        $0.numberOfLines = 1
    }

    private let momentImageView: UIImageView = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.accessibilityIgnoresInvertColors = true
        $0.clipsToBounds = true
    }

    private let postDateDescriptionLabel: UILabel = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor.designKit.background
        $0.setDynamicFont(UIFont.designKit.small)
        $0.textColor = UIColor.designKit.tertiaryText
        $0.numberOfLines = 1
    }

    private let favoriteButton: UIButton = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.asHeartFavoriteButton()
    }

    private let likesStackView: UIStackView = configure(.init(arrangedSubviews: [])) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor.designKit.secondaryBackground
        $0.layer.cornerRadius = 4
        $0.spacing = Spacing.twoExtraSmall
        $0.isLayoutMarginsRelativeArrangement = true
        $0.directionalLayoutMargins = NSDirectionalEdgeInsets(top: Spacing.twoExtraSmall, leading: Spacing.twoExtraSmall, bottom: Spacing.twoExtraSmall, trailing: Spacing.twoExtraSmall)
    }

    private let dividerView: UIView = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor.designKit.line
    }

    private let toggleDataStore: TogglesDataStoreType
    private let userDataStore: UserDataStoreType
    private var viewModel: MomentListItemViewModel?

    override convenience init(frame: CGRect = .zero) {
        self.init(frame: frame, toggleDataStore: TogglesDataSotre.shared)
    }

    init(frame: CGRect = .zero,
         userDataStore: UserDataStoreType = UserDataStore.current,
         toggleDataStore: TogglesDataStoreType = TogglesDataSotre.shared) {
        self.toggleDataStore = toggleDataStore
        self.userDataStore = userDataStore
        super.init(frame: frame)

        setupUI()
        setConstraints()
        setupBindings()
    }

    // swiftlint:disable unavailable_function
    required init?(coder: NSCoder) {
        fatalError(L10n.Development.fatalErrorSubclassToImplement)
    }

    override func update(with viewModel: ListItemViewModel) {
        guard let viewModel = viewModel as? MomentListItemViewModel else { return }

        self.viewModel = viewModel
        userAvatarImageView.kf.setImage(with: viewModel.userAvatarURL)
        userNameLabel.text = viewModel.userName
        titleLabel.text = viewModel.title
        momentImageView.kf.setImage(with: viewModel.photoURL)
        postDateDescriptionLabel.text = viewModel.postDateDescription

        if toggleDataStore.isToggleOn(.isLikeButtonForMomentsEnabled) {
            favoriteButton.isSelected = viewModel.isLiked
        }

        likesStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        likesStackView.isHidden = viewModel.likes.isEmpty

        if !viewModel.likes.isEmpty {
            likesStackView.addArrangedSubview(likeImageView)
        }

        viewModel.likes.forEach {
            let avatarURL = $0
            let avatar: UIImageView = configure(.init()) {
                $0.translatesAutoresizingMaskIntoConstraints = false
                $0.asAvatar(cornerRadius: 2)
                $0.kf.setImage(with: avatarURL)
            }

            avatar.snp.makeConstraints {
                $0.width.equalTo(20)
                $0.height.equalTo(20)
            }
            likesStackView.addArrangedSubview(avatar)
        }
    }
}

private extension MomentListItemView {
    func setupUI() {
        backgroundColor = UIColor.designKit.background

        let verticalStackView: UIStackView = configure(.init(arrangedSubviews: [
                                                                userNameLabel,
                                                                titleLabel,
                                                                momentImageView,
                                                                postDateDescriptionLabel])) {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.axis = .vertical
            $0.alignment = .leading
            $0.spacing = Spacing.extraSmall
        }

        if toggleDataStore.isToggleOn(.isLikeButtonForMomentsEnabled) {
            verticalStackView.addArrangedSubview(likesStackView)
        }

        let horizontalStackView: UIStackView = configure(.init(arrangedSubviews: [
                                                                userAvatarImageView,
                                                                verticalStackView])) {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.alignment = .top
            $0.spacing = Spacing.small
        }

        [horizontalStackView, dividerView].forEach {
            addSubview($0)
        }

        horizontalStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Spacing.medium)
            $0.bottom.equalToSuperview().offset(-Spacing.medium)
            $0.leading.equalToSuperview().offset(Spacing.medium)
            $0.trailing.equalToSuperview().offset(-Spacing.medium)
        }

        if toggleDataStore.isToggleOn(.isLikeButtonForMomentsEnabled) {
            addSubview(favoriteButton)
        }
    }

    func setConstraints() {
        userAvatarImageView.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(40)
        }

        momentImageView.snp.makeConstraints {
            $0.height.equalTo(120)
            $0.width.equalTo(240)
        }

        if toggleDataStore.isToggleOn(.isLikeButtonForMomentsEnabled) {
            favoriteButton.snp.makeConstraints {
                $0.bottom.equalToSuperview().offset(-Spacing.medium)
                $0.trailing.equalToSuperview().offset(-Spacing.medium)
            }
        }

        dividerView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }

    func setupBindings() {
        if toggleDataStore.isToggleOn(.isLikeButtonForMomentsEnabled) {
            favoriteButton.rx.tap
                .bind(onNext: { [weak self] in
                    guard let self = self else { return }
                    if self.favoriteButton.isSelected {
                        self.viewModel?.like(from: self.userDataStore.userID).subscribe(onNext: {}).disposed(by: self.disposeBag)
                    } else {
                        self.viewModel?.unlike(from: self.userDataStore.userID).subscribe(onNext: {}).disposed(by: self.disposeBag)
                    }
                })
                .disposed(by: disposeBag)
        }
    }
}

private extension MomentListItemView {
    var likeImageView: UIImageView {
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 16, weight: .light, scale: .default)
        // swiftlint:disable no_hardcoded_strings
        let heartImage = UIImage(systemName: "heart", withConfiguration: symbolConfiguration)
        return configure(.init(image: heartImage)) {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.tintColor = UIColor.designKit.secondaryText
        }
    }
}
