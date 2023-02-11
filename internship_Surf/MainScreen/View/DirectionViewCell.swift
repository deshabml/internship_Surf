//
//  DirectionViewCell.swift
//  internship_Surf
//
//  Created by Лаборатория on 10.02.2023.
//

import UIKit

class DirectionViewCell: UICollectionViewCell {

    static let id = "DirectionViewCell"

    var isActive: Bool = false

    var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont(name: "medium", size: 14)
        label.textColor = UIColor(named: "ColorButton")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "ColorCell")
        layer.cornerRadius = 10
        contentView.addSubview(label)
        installingСonstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        installingСonstraints()
    }

}

extension DirectionViewCell {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }

    func setupCell(directionIndex: Int) {
        label.text = Content.shared.directions[directionIndex]
    }

    func setupSelect(isActive: Bool) {
        self.isActive = isActive
        if isActive {
            UIView.animate(withDuration: 0.5, delay: 0, animations: {
                self.backgroundColor = UIColor(named: "ColorInsertCell")
            }) {_ in
                self.label.textColor = .white
            }
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, animations: {
                self.backgroundColor = UIColor(named: "ColorCell")
            }) {_ in
                self.label.textColor = UIColor(named: "ColorButton")
            }
        }
    }

}
