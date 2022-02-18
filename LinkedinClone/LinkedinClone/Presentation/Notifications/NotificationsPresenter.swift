//
//  NotificationsPresenter.swift
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

protocol NotificationsPresentationLogic {
    func presentSomething(response: Notifications.Something.Response)
}

class NotificationsPresenter: NotificationsPresentationLogic {
    weak var viewController: NotificationsDisplayLogic?

    // MARK: Parse and calc respnse from NotificationsInteractor and send simple view model to NotificationsViewController to be displayed

    func presentSomething(response: Notifications.Something.Response) {
        let viewModel = Notifications.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
//
//    func presentSomethingElse(response: Notifications.SomethingElse.Response) {
//        let viewModel = Notifications.SomethingElse.ViewModel()
//        viewController?.displaySomethingElse(viewModel: viewModel)
//    }
}
