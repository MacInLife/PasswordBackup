//
//  AuthViewController.swift
//  PasswordBackup
//
//  Created by Marie-Ange Coco on 30/04/2020.
//  Copyright © 2020 Marie-Ange Coco. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
// Liaison avec la vue, élément Outlet (constante)
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var nicknameTF: UITextField!
    @IBOutlet weak var validateBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
 
// Gestion du clavier
    
// Liaison avec la vue, élément d'Action
    @IBAction func validateBtnDidPressed(_ sender: Any) {
    }
    @IBAction func segmentedChanged(_ sender: Any) {
        let isConnexionSegment = segmentedControl.selectedSegmentIndex == 0
        // Utilisation du Segment
        let title = isConnexionSegment ? "Se connecter" : "S'inscrire"
        validateBtn.setTitle(title, for: .normal)
        print("TITLE : ", title)
    }
    
    
    func setupUI() {
        if FireAuth().isAuth() {
            // Naviguer vers la suite
            print("Utilisateur authentifiée")
        } else {
            // L'utilisateur doit s'authentifier
            print("Utilisateur non authentifié")
        }
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
