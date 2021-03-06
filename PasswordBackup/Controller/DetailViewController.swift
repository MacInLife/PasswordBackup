//
//  DetailViewController.swift
//  PasswordBackup
//
//  Created by Marie-Ange Coco on 08/06/2020.
//  Copyright © 2020 Marie-Ange Coco. All rights reserved.
//


import UIKit

class DetailViewController: UIViewController {
    var credentialsCollection: Credentials!
     
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var nicknameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var urlTF: UITextField!
    
    @IBOutlet weak var eyeClosed: UIButton!
    @IBOutlet weak var eye: UIButton!
    
    
     override func viewDidLoad() {
         super.viewDidLoad()
        print(credentialsCollection.title)
        print(credentialsCollection.nickname)
          print(credentialsCollection.password)
          print(credentialsCollection.url)
        
        titleTF.text = credentialsCollection.title
        nicknameTF.text = credentialsCollection.nickname
          passwordTF.text = credentialsCollection.password
          urlTF.text = credentialsCollection.url
        
        
        navigationController?.setNavigationBarHidden(false, animated: true)
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
  
}

