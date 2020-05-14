//
//  FireDB.swift
//  PasswordBackup
//
//  Created by Marie-Ange Coco on 14/05/2020.
//  Copyright © 2020 Marie-Ange Coco. All rights reserved.
//

import Foundation
import Firebase
//import FirebaseFirestore

class FireDB {
    let store = Firestore.firestore()
    //A l'inscription crée une collection des Utilisateurs (
    var users : CollectionReference {
        return store.collection("users")
    }
    //A l'ajout, crée une collection des Password (
      var credentials : CollectionReference {
          return store.collection("credentials")
      }
    func addUser(_ uid: String, data: [String: Any]) {
        users.document(uid).setData(data)
    }
    func addCredentials(_ uid: String, data: [String: Any]){
        credentials.document(uid).setData(data)
        credentials.document(uid).updateData([
            "title": "Gmail",
            "nickname": "vincent",
            "password": "1234",
            "url": "http://www.google.fr"
        ]){ err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
}
