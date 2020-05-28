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
    func addCredentials(data: [String: Any], completion: @escaping (_ error: String?) -> Void) {
        guard let uid = FireAuth().currentId else {
        completion("Erreur, vous n'etes pas connecté !")
        return
        }
        users.document(uid).collection("credentialsCollection").document().setData(data) { (error) in
            if let error = error {
                completion(error.localizedDescription)
                return
            }
            completion(nil)
        }
    }
    func getCredentialsCollection(completion: @escaping ([Credentials]?, String?) -> Void){
        //Récupération uid
        guard let uid = FireAuth().currentId else {
            completion(nil, "Erreur, vous n'etes pas connecté !")
            return
       }
        users.document(uid).collection("credentialsCollection").addSnapshotListener { (snapshot, error) in
            <#code#>
        }
    }

}
