//
//  PublishInteractor.swift
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

protocol PublishBusinessLogic {
    func publishPost(image: UIImage, postTitle: String, collection: String)
    func alertAction(title: String, message: String, action: UIAlertAction)
    func alert(title: String, message: String)
    
}

protocol PublishDataStore {
}

class PublishInteractor: PublishBusinessLogic, PublishDataStore {
    var presenter: PublishPresentationLogic?
    var worker: PublishWorkerProtocol
    
    init(worker: PublishWorkerProtocol) {
        self.worker = worker
    }
    
    func publishPost(image: UIImage, postTitle: String, collection: String){
        worker.uploadPost(image: image, postTitle: postTitle, collection: collection)
    }
    
    func alertAction(title: String, message: String, action: UIAlertAction) {
        presenter?.alertAction(title: title, message: message, action: action)
    }
    
    func alert(title: String, message: String) {
        presenter?.alert(title: title, message: message)
    }
    
}
