//
//  OneCollectionView.swift
//  internship_Surf
//
//  Created by Лаборатория on 11.02.2023.
//

import UIKit

class OneCollectionView: UICollectionView {

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        layout.minimumInteritemSpacing = 12
        layout.minimumLineSpacing = 12
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        super.init(frame: .zero, collectionViewLayout: layout)
        register(DirectionViewCell.self, forCellWithReuseIdentifier: DirectionViewCell.id)
        dataSource = self
        delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension OneCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

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

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width,height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = Content.shared.directions.remove(at: sourceIndexPath.item)
        Content.shared.directions.insert(item, at: destinationIndexPath.item)
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

