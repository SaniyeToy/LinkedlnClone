//
//  FireBaseManager.swift
//  LinkedinClone
//
//  Created by MacOS on 21.02.2022.
//

import Foundation
import Firebase

protocol FireBaseManagerProtocol: AnyObject{
    func signIn(email: String, pass: String, completionBlock: @escaping (_ success: Bool) -> Void)
}

final class FireBaseManager:  FireBaseManagerProtocol{

func signIn(email: String, pass: String, completionBlock: @escaping (_ success: Bool) -> Void) {
    Auth.auth().signIn(withEmail: email, password: pass) {(result, error) in
        if let error = error, let _ = AuthErrorCode(rawValue: error._code) {
            completionBlock(false)
        } else {
            completionBlock(true)
        }
    }
}
}
