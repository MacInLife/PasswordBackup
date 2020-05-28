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
    
//  1. Créer une nouvelle collection avec le signUp()
//  2. Créer une troisième vue pour créer un nouveau Credential
//  3. Sauvegarder le Credential
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Observation de l’état d’authentification de l’utilisateur
        FireAuth().auth.addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.performSegue(withIdentifier: "segueToMain", sender: nil)
                self.emailTF.text = ""
                self.passwordTF.text = ""
                self.nicknameTF.text = ""
                self.segmentedControl.selectedSegmentIndex = 0
//      self.passwordTF.isSecureTextEntry = self.passwordTF.isSecureTextEntry ? false : true
            }
        }
    }
// Gestion du clavier
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Masquer le clavier
        view.endEditing(true)
    }

// Liaison avec la vue, élément d'Action
    @IBAction func validateBtnDidPressed(_ sender: Any) {
        // Inscrire l'utilisateur
        guard let email = emailTF.text, email != "" else {
             presentAlert(title: "Attention !", message: "Vous n’avez pas renseigné d’e-mail !")
             return
         }
         guard let password = passwordTF.text, password != "" else {
             presentAlert(title: "Attention !", message: "Vous n’avez pas renseigné de mot de passe !")
             return
         }
    
         if segmentedControl.selectedSegmentIndex == 0 {
             // Connexion
            FireAuth().signIn(email: email, password: password) { (error, uid) in
                if let error = error {
                    self.presentAlert(title: "Erreur", message: error)
                }
             }
            print("CONNEXION")
            print("Email :", email)
            print("Password :", password)
         } else {
            // Inscription
            // Affiche le message si Pseudo pas rempli
            guard let nickname = nicknameTF.text, nickname != "" else {
                  presentAlert(title: "Attention !", message: "Vous n’avez pas renseigné de pseudo !")
                  return
             }
            FireAuth().signUp(email: email, password: password, nickname: nickname) { (error, uid) in
                 if let error = error {
                   self.presentAlert(title: "Erreur !", message: error)
                 }
//              Tableau de crédential
//              {
//                  "uid": "123445",
//                  "nickname": "vincent",
//                  "credentials": [
//                      {"title": "Gmail", "id": "vincent", "password": "1234"},
//                      {"title": "Gmail", "id": "vincent", "password": "1234"},
//                      {"title": "Gmail", "id": "vincent", "password": "1234"}
//                  ]
//              }
                 if let uid = uid {
                     // Créer la collection Credentials(mdp + pseudo) de l'utilisateur dans la DB
                    let data : [String: Any] = ["uid": uid, "nickname": nickname]
                    FireDB().addUser(uid, data: data)
                 }
             }
            print("INSCRIPTION")
            print("Email :", email)
            print("Password :", password)
            print("Nickname :", nickname)
            
         }
       

    }
    
    @IBAction func segmentedChanged(_ sender: Any) {
        setupUI()
    }
    
    
    private func setupUI() {
        let isConnexionSegment = segmentedControl.selectedSegmentIndex == 0
       // Utilisation du Segment
       let title = isConnexionSegment ? "Se connecter" : "S'inscrire"
       validateBtn.setTitle(title, for: .normal)
        nicknameTF.isHidden = isConnexionSegment
       print("TITLE : ", title)
    }

    private func presentAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "J’ai compris", style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }


}
