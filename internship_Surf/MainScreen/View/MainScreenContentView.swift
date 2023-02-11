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

    private lazy var collectionViewOne: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        layout.minimumInteritemSpacing = 12
        layout.minimumLineSpacing = 12
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionViewOne = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionViewOne.register(DirectionViewCell.self, forCellWithReuseIdentifier: DirectionViewCell.id)
        collectionViewOne.dataSource = self
        collectionViewOne.delegate = self
        collectionViewOne.translatesAutoresizingMaskIntoConstraints = false
        return collectionViewOne

    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .white
        addSubviews([
            headLabel,
            oneLabel,
            collectionViewOne
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
            collectionViewOne.topAnchor.constraint(equalTo: oneLabel.bottomAnchor),
            collectionViewOne.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionViewOne.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionViewOne.heightAnchor.constraint(equalToConstant: 68)
        ])
    }

}

extension MainScreenContentView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Content.shared.directions.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DirectionViewCell.id, for: indexPath) as! DirectionViewCell
        cell.setupCell(directionIndex: indexPath.item)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DirectionViewCell.id, for: indexPath) as! DirectionViewCell
        return cell.label.intrinsicContentSize

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell =
        (
            collectionView.cellForItem(at: indexPath) as! DirectionViewCell
        )
        cell.label.textColor = .white
        cell.backgroundColor = UIColor(named: "ColorInsertCell")
    }

}
