//
//  MainScreenContentView.swift
//  internship_Surf
//
//  Created by Лаборатория on 10.02.2023.
//

import UIKit

class MainScreenContentView: UIView {

    private lazy var headLabel: UILabel = {
        let headLabel = UILabel()
        headLabel.text = Content.shared.content.header
        headLabel.font = UIFont.boldSystemFont(ofSize: 24)
        headLabel.textColor = .black
        return headLabel
    }()

    private lazy var oneLabel: UILabel = {
        let oneLabel = UILabel()
        oneLabel.text = Content.shared.content.textOne
        oneLabel.font = UIFont(name: "regular", size: 14)
        oneLabel.textColor = UIColor(named: "ColorLabel")
        oneLabel.numberOfLines = 0
        return oneLabel
    }()

    private lazy var oneCollectionView: UICollectionView = {
        let collectionViewOne = OneCollectionView()
        return collectionViewOne
    }()

    private lazy var twoCollectionView: UICollectionView = {
        let collectionViewOne = TwoCollectionView()
        return collectionViewOne
    }()

    private lazy var twoLabel: UILabel = {
        let oneLabel = UILabel()
        oneLabel.text = Content.shared.content.textTwo
        oneLabel.font = UIFont(name: "regular", size: 14)
        oneLabel.textColor = UIColor(named: "ColorLabel")
        oneLabel.numberOfLines = 0
        return oneLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .white
        addSubviews([
            headLabel,
            oneLabel,
            oneCollectionView,
            twoLabel,
            twoCollectionView
              ])
              installingСonstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension MainScreenContentView {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            headLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            headLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            oneLabel.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: 12),
            oneLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            oneLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            oneCollectionView.topAnchor.constraint(equalTo: oneLabel.bottomAnchor),
            oneCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            oneCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            oneCollectionView.heightAnchor.constraint(equalToConstant: 68),
            twoLabel.topAnchor.constraint(equalTo: oneCollectionView.bottomAnchor, constant: 12),
            twoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            twoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            twoCollectionView.topAnchor.constraint(equalTo: twoLabel.bottomAnchor),
            twoCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            twoCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            twoCollectionView.heightAnchor.constraint(equalToConstant: 136)
        ])
    }

}
