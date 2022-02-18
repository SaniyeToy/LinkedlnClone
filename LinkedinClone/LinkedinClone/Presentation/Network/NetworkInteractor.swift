//
//  NetworkInteractor.swift
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

protocol NetworkBusinessLogic {
    func doSomething(request: Network.Something.Request)
//    func doSomethingElse(request: Network.SomethingElse.Request)
}

protocol NetworkDataStore {
    //var name: String { get set }
}

class NetworkInteractor: NetworkBusinessLogic, NetworkDataStore {
    var presenter: NetworkPresentationLogic?
    var worker: NetworkWorker?
    //var name: String = ""

    // MARK: Do something (and send response to NetworkPresenter)

    func doSomething(request: Network.Something.Request) {
        worker = NetworkWorker()
        worker?.doSomeWork()

        let response = Network.Something.Response()
        presenter?.presentSomething(response: response)
    }
//
//    func doSomethingElse(request: Network.SomethingElse.Request) {
//        worker = NetworkWorker()
//        worker?.doSomeOtherWork()
//
//        let response = Network.SomethingElse.Response()
//        presenter?.presentSomethingElse(response: response)
//    }
}
