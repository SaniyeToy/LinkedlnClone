//
//  JobPostingInteractor.swift
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

protocol JobPostingBusinessLogic {
    func doSomething(request: JobPosting.Something.Request)
//    func doSomethingElse(request: JobPosting.SomethingElse.Request)
}

protocol JobPostingDataStore {
    //var name: String { get set }
}

class JobPostingInteractor: JobPostingBusinessLogic, JobPostingDataStore {
    var presenter: JobPostingPresentationLogic?
    var worker: JobPostingWorker?
    //var name: String = ""

    // MARK: Do something (and send response to JobPostingPresenter)

    func doSomething(request: JobPosting.Something.Request) {
        worker = JobPostingWorker()
        worker?.doSomeWork()

        let response = JobPosting.Something.Response()
        presenter?.presentSomething(response: response)
    }
//
//    func doSomethingElse(request: JobPosting.SomethingElse.Request) {
//        worker = JobPostingWorker()
//        worker?.doSomeOtherWork()
//
//        let response = JobPosting.SomethingElse.Response()
//        presenter?.presentSomethingElse(response: response)
//    }
}
