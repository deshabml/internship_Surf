//
//  MainScreenViewController.swift
//  internship_Surf
//
//  Created by Лаборатория on 10.02.2023.
//

import UIKit

class MainScreenViewController: UIViewController {

    lazy var backgroundImageView: UIImageView = {
        let backgroundImageView = UIImageView(image: UIImage(named: "bacgraundImage"))
        backgroundImageView.frame = view.frame
        backgroundImageView.contentMode = .scaleAspectFill
        return backgroundImageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews([
            backgroundImageView
        ])
    }

}

extension MainScreenViewController {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}
