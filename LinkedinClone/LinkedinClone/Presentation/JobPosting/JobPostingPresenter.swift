//
//  JobPostingPresenter.swift
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

protocol JobPostingPresentationLogic {
    func presentSomething(response: JobPosting.Something.Response)
}

class JobPostingPresenter: JobPostingPresentationLogic {
    weak var viewController: JobPostingDisplayLogic?

    // MARK: Parse and calc respnse from JobPostingInteractor and send simple view model to JobPostingViewController to be displayed

    func presentSomething(response: JobPosting.Something.Response) {
        let viewModel = JobPosting.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
//
//    func presentSomethingElse(response: JobPosting.SomethingElse.Response) {
//        let viewModel = JobPosting.SomethingElse.ViewModel()
//        viewController?.displaySomethingElse(viewModel: viewModel)
//    }
}
