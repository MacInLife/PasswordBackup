//
//  FireAuth.swift
//  PasswordBackup
//
//  Created by Marie-Ange Coco on 30/04/2020.
//  Copyright © 2020 Marie-Ange Coco. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class FireAuth {
    func isAuth() -> Bool {
        return Auth.auth().currentUser?.uid != nil
    }
    func signIn() {
        
    }
    
    func signUp() {
           
    }
    func signOut() {
           
    }
}
