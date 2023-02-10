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
        headLabel.text = "Стажировка в Surf"
        headLabel.font = UIFont.boldSystemFont(ofSize: 24)
        headLabel.textColor = .black
        return headLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .white
        addSubviews([
            headLabel
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
            headLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }

}
