//
//  FireBaseManager.swift
//  LinkedinClone
//
//  Created by MacOS on 21.02.2022.
//

import Foundation
import Firebase

protocol FireBaseManagerProtocol{
    func signIn(email: String, pass: String, completionBlock: @escaping (_ success: Bool) -> Void)
    func createUser(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void)
    
}

class FireBaseManager:  FireBaseManagerProtocol{
    
    func signIn(email: String, pass: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: pass) {(result, error) in
            if let error = error, let _ = AuthErrorCode(rawValue: error._code) {
                completionBlock(false)
            } else {
                completionBlock(true)
            }
        }
    }
    
    func createUser(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
            if (authResult?.user) != nil {
                // save user in fireBase Database
                performOn(.Background) {
                    var ref: DocumentReference? = nil
                    let db = Firestore.firestore()
                    ref = db.collection("users").addDocument(data: [
                        "firstName": "firstName" as String ,
                        "lastName": "lastName" as String,
                        "email": "email" as String
                    ]) { error in
                        if let error = error {
                            
                            print("Error adding document: \(error)")
                        } else {
                            
                            print("Document added with ID: \(ref!.documentID)")
                        }
                    }
                }
                completionBlock(true)
                
            } else {
                completionBlock(false)
            }
        }
    }
    
}
