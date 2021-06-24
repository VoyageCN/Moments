//
//  UserProfileListItemView.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/24.
//

import UIKit
import DesignKit

final class UserProfileListItemView<T: ListItemViewModel>: UIView {
    private let backgroundImageView: UIImageView = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.accessibilityIgnoresInvertColors = true
    }

    private let avatarImageView: UIImageView = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.accessibilityIgnoresInvertColors = true
        $0.clipsToBounds = true
    }

    private let nameLabel: UILabel = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setDynamicFont(UIFont.designKit.title3)
        $0.textColor = .white
        $0.numberOfLines = 1
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(backgroundImageView)
        addSubview(avatarImageView)
        addSubview(nameLabel)

        backgroundImageView.snp.makeConstraints {
            $0.top.equalTo(self.snp.top)
            $0.leading.equalTo(self.snp.leading)
            $0.trailing.equalTo(self.snp.trailing)
            $0.bottom.equalTo(self.snp.bottom).offset(-Spacing.twoExtraLarge)
            $0.height.equalTo(backgroundImageView.snp.width).multipliedBy(0.8).priority(999)
        }

        avatarImageView.snp.makeConstraints {
            $0.right.equalTo(self.snp.right).offset(-Spacing.large)
            $0.bottom.equalTo(self.snp.bottom)
        }

        nameLabel.snp.makeConstraints {
            $0.right.equalTo(self.avatarImageView.snp.left)
            $0.centerY.equalTo(self.avatarImageView.snp.centerY)
        }
    }

    // swiftlint:disable unavailable_function
    required init?(coder: NSCoder) {
        fatalError(L10n.Development.fatalErrorInitCoderNotImplemented)
    }

    func update(_ viewModel: T) {
        guard let viewModel = viewModel as? UserProfileListItemViewModel else { return }

        backgroundImageView.kf.setImage(with: viewModel.backgroundImageURL)
        avatarImageView.kf.setImage(with: viewModel.avatarURL)
        nameLabel.text = viewModel.name
    }
}
