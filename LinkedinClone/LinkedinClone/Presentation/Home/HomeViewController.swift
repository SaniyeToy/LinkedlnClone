//
//  HomeViewController.swift
//  LinkedinClone
//
//  Created by MacOS on 17.02.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Firebase

protocol HomeDisplayLogic: AnyObject{
    func displayPosts(viewModel: Home.Fetch.ViewModel)
}

class HomeViewController: UIViewController{
    var interactor: HomeBusinessLogic?
    var router: (HomeRoutingLogic & HomeDataPassing)?
    
    
    @IBOutlet weak var homeSearchBar: UISearchBar!
    @IBOutlet weak var homeTableView: UITableView!
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
        let interactor = HomeInteractor(worker: HomeWorker())
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - View lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.navigationBar.backgroundColor = .clear
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchPost()
        homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "Home")
    }

    @IBAction func goToProfile(_ sender: Any) {
    }
    
}

extension HomeViewController : HomeDisplayLogic {
    func displayPosts(viewModel: Home.Fetch.ViewModel) {
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Home", for: indexPath) as! HomeTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
