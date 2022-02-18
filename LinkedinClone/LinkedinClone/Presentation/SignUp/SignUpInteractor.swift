//
//  SignUpInteractor.swift
//  LinkedinClone
//
//  Created by MacOS on 18.02.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SignUpBusinessLogic {
    func alertAction(title: String, message: String, action: UIAlertAction)
    func alert(title: String, message: String)
    func createUser(firstName: String, lastName: String, email: String, password: String)
}

protocol SignUpDataStore {

}

class SignUpInteractor: SignUpBusinessLogic, SignUpDataStore {
    var presenter: SignUpPresentationLogic?
    var worker: SignUpWorkerProtocol

    init(worker: SignUpWorkerProtocol) {
        self.worker = worker
    }

    func createUser(firstName: String, lastName: String, email: String, password: String){
        worker.createUser(firstName: firstName, lastName: lastName, email: email, password: password)
       
    }
    
    func alertAction(title: String, message: String, action: UIAlertAction) {
        presenter?.alertAction(title: title, message: message, action: action)
    }
    
    func alert(title: String, message: String) {
        presenter?.alert(title: title, message: message)
    }
}
