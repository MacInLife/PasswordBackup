//
//  MainViewController.swift
//  PasswordBackup
//
//  Created by Marie-Ange Coco on 07/05/2020.
//  Copyright © 2020 Marie-Ange Coco. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutBtnDidPressed(_ sender: Any) {
        if let error = FireAuth().signOut() {
           let alertVC = UIAlertController(title: "Erreur !", message: error, preferredStyle: .alert)
           alertVC.addAction(UIAlertAction(title: "J’ai compris", style: .default, handler: nil))
           present(alertVC, animated: true, completion: nil)
           return
       }
       navigationController?.popViewController(animated: true)
        print("DECONNEXION")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
