//
//  SignUpRouter.swift
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

protocol SignUpRoutingLogic {
    func routeToHome() 
}

protocol SignUpDataPassing {
    var dataStore: SignUpDataStore? { get }
}

class SignUpRouter: NSObject, SignUpRoutingLogic, SignUpDataPassing {
    weak var viewController: SignUpViewController?
    var dataStore: SignUpDataStore?

// MARK: Routing (navigating to other screens)

    func routeToHome() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let destVC: HomeViewController = storyBoard.instantiateViewController(identifier: "home")
        destVC.modalPresentationStyle = .fullScreen
        viewController?.navigationController?.pushViewController(destVC, animated: true)
    }
}
