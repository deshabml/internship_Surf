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

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1000)
        return scrollView
    }()

    private lazy var screenContentView: UIView = {
        let contentView = MainScreenContentView()
        contentView.layer.cornerRadius = 32
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    private lazy var sendRequestButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = UIColor(named: "ColorButton")
        configuration.title = "Отправить заявку"
        configuration.baseForegroundColor = .white
        configuration.cornerStyle = .capsule
        var sendRequestButton = UIButton(configuration: configuration)
        sendRequestButton.configurationUpdateHandler = { button in
            switch button.state {
                case .selected, .highlighted, .disabled:
                    button.alpha = 0.8
                default:
                    button.alpha = 1
            }
        }
        sendRequestButton.addTarget(self, action: #selector(buttonActionSendRequest), for: .touchUpInside)
        return sendRequestButton
    }()

    private lazy var doWantButton: UIButton = {
        var doWantButton = UIButton(frame: .zero)
        doWantButton.setTitle("Хочешь к нам?", for: .normal)
        doWantButton.setTitleColor(UIColor(named: "ColordoWantButton"), for: .normal)
        doWantButton.addTarget(self,
                         action: #selector(buttonActionDoWant),
                                  for: .touchDown)
        doWantButton.addTarget(self,
                         action: #selector(buttonActionDoWantTwo),
                               for: .touchUpInside)
        return doWantButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews([
            backgroundImageView,
            scrollView,
            sendRequestButton,
            doWantButton
        ])
        scrollView.addSubview(screenContentView)
        installingСonstraints()
    }

}

extension MainScreenViewController {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            screenContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            screenContentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            screenContentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            sendRequestButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -58),
            sendRequestButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            sendRequestButton.heightAnchor.constraint(equalToConstant: 60),
            sendRequestButton.widthAnchor.constraint(equalToConstant: 200),
            doWantButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            doWantButton.centerYAnchor.constraint(equalTo: sendRequestButton.centerYAnchor),
        ])
    }

    @objc func buttonActionSendRequest() {
        let alert = UIAlertController(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .cancel ))
        present(alert, animated: true, completion: nil)
    }

    @objc func buttonActionDoWant() {
        doWantButton.alpha = 0.5
    }

    @objc func buttonActionDoWantTwo() {
        doWantButton.alpha = 1
    }

}
