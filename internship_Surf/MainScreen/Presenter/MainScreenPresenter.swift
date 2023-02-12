//
//  MainScreenPresenter.swift
//  internship_Surf
//
//  Created by Лаборатория on 12.02.2023.
//

import UIKit

protocol MainScreenViewProtocol {

    func setContent(contents: Contents, directions: [String])

}

protocol MainScreenViewPresenterProtocol {

    init(view: MainScreenViewProtocol, content: Content)

    func showContent()

}

class MainScreenPresenter: MainScreenViewPresenterProtocol {

    let view: MainScreenViewProtocol

    let content: Content

    required init(view: MainScreenViewProtocol, content: Content) {
        self.view = view
        self.content = content
    }

    func showContent() {
        view.setContent(contents: content.content, directions: content.directions)
    }

}
