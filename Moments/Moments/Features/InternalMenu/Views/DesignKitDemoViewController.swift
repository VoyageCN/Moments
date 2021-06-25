//
//  DesignKitDemoViewController.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/21.
//

import UIKit
import Kingfisher

final class DesignKitDemoViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

private extension DesignKitDemoViewController {
    func setupUI() {
        view.backgroundColor = .systemBackground

        let scrollView: UIScrollView = configure(.init()) {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottomMargin)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }

        let rootStackView: UIStackView = configure(.init(arrangedSubviews: [
            buildTypography(),
            buildColors(),
            buildAvatars(),
            buildFavoriteButtons()
        ])) {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.axis = .vertical
            $0.alignment = .leading
            $0.isLayoutMarginsRelativeArrangement = true
            $0.layoutMargins = UIEdgeInsets(top: 32, left: 16, bottom: 32, right: 16)
            $0.spacing = 16
        }
        scrollView.addSubview(rootStackView)

        rootStackView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top)
            $0.bottom.equalTo(scrollView.snp.bottom)
            $0.width.equalTo(scrollView.snp.width)
            $0.leading.equalTo(scrollView.snp.leading)
            $0.trailing.equalTo(scrollView.snp.trailing)
        }
    }

    func buildTypography() -> UIView {
        // swiftlint:disable no_hardcoded_strings
        let items = [
            ("display1", UIFont.designKit.display1),
            ("display2", UIFont.designKit.display2),
            ("title1", UIFont.designKit.title1),
            ("title2", UIFont.designKit.title2),
            ("title3", UIFont.designKit.title3),
            ("title4", UIFont.designKit.title4),
            ("title5", UIFont.designKit.title5),
            ("bodyBold", UIFont.designKit.bodyBold),
            ("body", UIFont.designKit.body),
            ("captionBold", UIFont.designKit.captionBold),
            ("caption", UIFont.designKit.caption),
            ("small", UIFont.designKit.small)
        ]
        // swiftlint:enable no_hardcoded_strings

        let title: UILabel = configure(.init()) {
            $0.text = L10n.InternalMenu.typography
            $0.font = UIFont.designKit.title1
        }

        let stackView: UIStackView = configure(.init(arrangedSubviews: [title])) {
            $0.axis = .vertical
            $0.spacing = 8
        }
        items.forEach {
            let item = $0
            let label: UILabel = configure(.init()) {
                $0.text = item.0
                $0.setDynamicFont(item.1)
            }

            stackView.addArrangedSubview(label)
        }

        return stackView
    }

    func buildColors() -> UIView {
        // swiftlint:disable no_hardcoded_strings
        let items = [
            ("primary", UIColor.designKit.primary),
            ("background", UIColor.designKit.background),
            ("secondaryBackground", UIColor.designKit.secondaryBackground),
            ("tertiaryBackground", UIColor.designKit.tertiaryBackground),
            ("line", UIColor.designKit.line),
            ("primaryText", UIColor.designKit.primaryText),
            ("secondaryText", UIColor.designKit.secondaryText),
            ("tertiaryText", UIColor.designKit.tertiaryText),
            ("quaternaryText", UIColor.designKit.quaternaryText)
        ]
        // swiftlint:enable no_hardcoded_strings

        let title: UILabel = configure(.init()) {
            $0.text = L10n.InternalMenu.colors
            $0.font = UIFont.designKit.title1
        }

        let stackView: UIStackView = configure(.init(arrangedSubviews: [title])) {
            $0.axis = .vertical
            $0.spacing = 0
        }

        items.forEach {
            let item = $0
            let label: UILabel = configure(.init()) {
                $0.text = item.0
                $0.textColor = UIColor.designKit.primaryText
                $0.backgroundColor = item.1
            }

            stackView.addArrangedSubview(label)
        }
        return stackView
    }

    func buildAvatars() -> UIView {
        // swiftlint:disable no_hardcoded_strings
        let items = [
            URL(string: "https://images.generated.photos/SZ43KV-Oo26-wpPUM7zDLo19CpGFH0eBnjegQFtvaUc/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA4/NTUzMzguanBn.jpg"),
            URL(string: "https://randomuser.me/api/portraits/women/68.jpg"),
            URL(string: "https://uifaces.co/our-content/donated/Si9Qv42B.jpg"),
            URL(string: "https://images-na.ssl-images-amazon.com/images/M/MV5BMjEzNjAzMTgzMV5BMl5BanBnXkFtZTcwNjU2NjA2NQ@@._V1_UY256_CR11,0,172,256_AL_.jpg"),
            URL(string: "https://uifaces.co/our-content/donated/fID5-1BV.jpg")
        ]
        // swiftlint:enable no_hardcoded_strings

        let title: UILabel = configure(.init()) {
            $0.text = L10n.InternalMenu.avatars
            $0.font = UIFont.designKit.title1
        }

        let stackView: UIStackView = configure(.init(arrangedSubviews: [title])) {
            $0.axis = .vertical
            $0.spacing = 8
        }

        items.forEach {
            let item = $0
            let imageView: UIImageView = configure(.init()) {
                $0.asAvatar(cornerRadius: 12)
                $0.contentMode = .scaleAspectFit
                $0.accessibilityIgnoresInvertColors = true
                $0.kf.setImage(with: item)
            }

            let length: CGFloat = 128
            imageView.snp.makeConstraints {
                $0.width.equalTo(length)
                $0.height.equalTo(length)
            }

            stackView.addArrangedSubview(imageView)
        }
        return stackView
    }

    func buildFavoriteButtons() -> UIView {
        return UIView()
    }
}
