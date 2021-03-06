//
//  CreateViewController.swift
//  PasswordBackup
//
//  Created by Marie-Ange Coco on 14/05/2020.
//  Copyright © 2020 Marie-Ange Coco. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var nicknameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var urlTF: UITextField!
    
    @IBOutlet weak var eyeClosed: UIButton!
    @IBOutlet weak var eye: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func eyeClosedBtnDidPressed(_ sender: Any) {
          self.passwordTF.isSecureTextEntry =  true
        self.eyeClosed.alpha = 0
          self.eye.alpha = 1
         
     }
     @IBAction func eyeBtnDidPressed(_ sender: Any) {
           self.passwordTF.isSecureTextEntry =  false
         self.eye.alpha = 0
          self.eyeClosed.alpha = 1
     }
    
    @IBAction func copyBtnDidPressed(_ sender: Any) {
        UIPasteboard.general.string = passwordTF.text
        // Informer l'utilisateur (flash/toast message)
    }
    @IBAction func shareBtnDidPressed(_ sender: Any) {
    }
    
    @IBAction func cancelBtnDidPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        }
    
    @IBAction func saveBtnDidPressed(_ sender: Any) {
        guard let title = titleTF.text, title != "" else {
            presentAlert(title: "Attention !", message: "Vous n’avez pas renseigné de titre !")
                  return
              }
              guard let nickname = nicknameTF.text, nickname != "" else {
                presentAlert(title: "Attention !", message: "Vous n’avez pas renseigné de pseudo !")
                  return
              }
              guard let password = passwordTF.text, password != "" else {
                  presentAlert(title: "Attention !", message: "Vous n’avez pas renseigné de mot de passe !")
                  return
              }
              guard let url = urlTF.text, url != "" else {
                 presentAlert(title: "Attention !", message: "Vous n’avez pas renseigné d'URL !")
                 return
              }
              //Vérifier que l'url soit valide
              
              // Ajouter un credentials
              let data : [String: Any] = [
                  "title" : title,
                  "nickname" : nickname,
                  "password" : password,
                  "url" : url
              ]
              FireDB().addCredentials(data: data) { (error) in
                  if let error = error {
                    self.presentAlert(title: "error", message: error)
                    return
                  }
                  //Naviguer vers la page précédentes
                self.dismiss(animated: true, completion: nil)
              }
    }
    

//    private func presentAlert(title: String, message: String) {
//           let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
//           alertVC.addAction(UIAlertAction(title: "J’ai compris", style: .default, handler: nil))
//           present(alertVC, animated: true, completion: nil)
//       }
}
