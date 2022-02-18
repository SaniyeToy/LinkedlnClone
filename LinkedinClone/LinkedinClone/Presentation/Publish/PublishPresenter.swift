//
//  PublishPresenter.swift
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

protocol PublishPresentationLogic {
    func presentSomething(response: Publish.Something.Response)
}

class PublishPresenter: PublishPresentationLogic {
    weak var viewController: PublishDisplayLogic?

    // MARK: Parse and calc respnse from PublishInteractor and send simple view model to PublishViewController to be displayed

    func presentSomething(response: Publish.Something.Response) {
        let viewModel = Publish.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
//
//    func presentSomethingElse(response: Publish.SomethingElse.Response) {
//        let viewModel = Publish.SomethingElse.ViewModel()
//        viewController?.displaySomethingElse(viewModel: viewModel)
//    }
}
