//
//  SignUpViewController.swift
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
import Firebase

protocol SignUpDisplayLogic: AnyObject
{
    func displaySignUpView(viewModel: SignUp.SignUp.ViewModel)

}

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var joinNowButton: UIButton!
    @IBOutlet weak var faceBookButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    var interactor: SignUpBusinessLogic?
    var router: (NSObjectProtocol & SignUpRoutingLogic & SignUpDataPassing)?
    
    var firstName: String?
    var lastName: String?
    var email: String?
    var password: String?
    
    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - Setup Clean Code Design Pattern 

    private func setup() {
        let viewController = self
        let interactor = SignUpInteractor(worker: SignUpWorker())
        let presenter = SignUpPresenter()
        let router = SignUpRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func facebookTapped(_ sender: Any) {
    }
    @IBAction func joinNowTapped(_ sender: Any) {
         createUser()
        
    }
    @IBAction func signInButtonTapped(_ sender: Any) {
   
    }
    
    func createUser(){
        guard let firstName = firstNameTextField.text,
              !firstName.isEmpty else {
                  interactor?.alert(title: "Please enter a first name", message: "Invalid First Name")
                  return
              }
        guard let lastName = lastNameTextField.text,
              !lastName.isEmpty else {
                  interactor?.alert(title: "Please enter a last name", message: "Invalid Last Name")
                  return
              }
        
        guard let email = emailTextField.text,
              !email.isEmpty else {
                  interactor?.alert(title: "Please enter email", message: "Invalid email")
                  return
              }
        
        guard let password = passwordTextField.text,
              !password.isEmpty else {
                  interactor?.alert(title: "Please enter password", message: "Invalid password")
                  return
              }
        
        interactor?.createUser(firstName: firstName , lastName: lastName , email: email , password: password)
        router?.routeToHome()
    }
    
}
extension SignUpViewController: SignUpDisplayLogic {
    func displaySignUpView(viewModel: SignUp.SignUp.ViewModel) {
        
      
    }
}