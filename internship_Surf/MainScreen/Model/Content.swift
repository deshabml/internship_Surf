//
//  Content.swift
//  internship_Surf
//
//  Created by Лаборатория on 10.02.2023.
//

import Foundation

struct Contents {
    var header: String
    var textOne: String
    var textTwo: String
}

final class Content {

    static let shared: Content = .init()

    var content: Contents = Contents(
        header: "Стажировка в Surf",
        textOne: "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты. ",
        textTwo: "Получай стипендию, выстраивай удобный график, работай на современном железе."
    )

    var directions: [String] = [
        "IOS",
        "Android",
        "Design",
        "Flutter",
        "QA",
        "PM",
        "XCode",
        "Swift",
        "Kotlin",
        "AppStore"
    ]


}
