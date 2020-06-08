//
//  Credentials.swift
//  PasswordBackup
//
//  Created by Marie-Ange Coco on 28/05/2020.
//  Copyright © 2020 Marie-Ange Coco. All rights reserved.
//

import Foundation
import Firebase

struct Credentials {
    var reference : DocumentReference
    var documentID : String
    var title: String
    var nickname: String
    var password: String
    var url: String
    
    init(document: DocumentSnapshot){
        reference = document.reference
        documentID = document.documentID
        let data = document.data() ?? [:]
        title = data["title"] as? String ?? ""
        nickname = data["nickname"] as? String ?? ""
        password = data["password"] as? String ?? ""
        url = data["url"] as? String ?? ""
    }
}

