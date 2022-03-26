//
//  Alert+Extension.swift
//  Fech
//
//  Created by MAC on 11/03/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import UIKit


extension UIViewController {
    
    func showAlert (title: String, message: String, completionHandler: (() -> ())? = nil) {
        let alertContoller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertContoller.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alertContoller, animated: true, completion: {
                completionHandler?()
            })

    }
}
