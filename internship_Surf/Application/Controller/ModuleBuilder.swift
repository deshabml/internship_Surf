//
//  ModuleBuilder.swift
//  internship_Surf
//
//  Created by Лаборатория on 12.02.2023.
//

import UIKit

protocol Builder {

    static func createMainScreen() -> UIViewController

}

class ModelBuilder: Builder {

    static func createMainScreen() -> UIViewController {
        let content = Content.shared
        let view = MainScreenViewController()
        let presenter = MainScreenPresenter(view: view, content: content)
        view.presenter = presenter
        return view
    }

}
