//
//  ExtensionViewController.swift
//  PasswordBackup
//
//  Created by Marie-Ange Coco on 04/06/2020.
//  Copyright © 2020 Marie-Ange Coco. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentAlert(title: String, message: String) {
           let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
           alertVC.addAction(UIAlertAction(title: "J’ai compris", style: .default, handler: nil))
           present(alertVC, animated: true, completion: nil)
       }
}
