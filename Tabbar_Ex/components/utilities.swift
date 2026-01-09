//
//  utilities.swift
//  Tabbar_Ex
//
//  Created by ADMIN on 05/01/26.
//

import UIKit

extension UIImageView {
    func loadFromUrl(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }

        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}
