//
//  MomentListItemView.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import UIKit
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

    private let dividerView: UIView = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor.designKit.line
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
        setConstraints()
    }

    // swiftlint:disable unavailable_function
    required init?(coder: NSCoder) {
        fatalError(L10n.Development.fatalErrorSubclassToImplement)
    }

    override func update(with viewModel: ListItemViewModel) {
        guard let viewModel = viewModel as? MomentListItemViewModel else { return }

        userAvatarImageView.kf.setImage(with: viewModel.userAvatarURL)
        userNameLabel.text = viewModel.userName
        titleLabel.text = viewModel.title
        momentImageView.kf.setImage(with: viewModel.photoURL)
        postDateDescriptionLabel.text = viewModel.postDateDescription
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

        dividerView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}