//
//  SignUpPresenter.swift
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

protocol SignUpPresentationLogic {
    func alert(title: String , message: String)
    func alertAction(title: String , message: String , action: UIAlertAction)
}

class SignUpPresenter: SignUpPresentationLogic {
    weak var viewController: SignUpDisplayLogic?
    
    
    
    
    func alertAction(title: String , message: String , action: UIAlertAction) {
        Alert.alertAction(title: title, message: message, action: action)
    }
    
    func alert(title: String , message: String){
        Alert.alert(title: title, message: message)
    }
}
