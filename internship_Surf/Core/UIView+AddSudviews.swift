//
//  UIView+AddSudviews.swift
//  internship_Surf
//
//  Created by Лаборатория on 10.02.2023.
//

import UIKit

extension UIView {

    func addSubviews(_ arrayView: [UIView]) {
        arrayView.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }

}
