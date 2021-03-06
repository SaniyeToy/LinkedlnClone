//
//  HomePresenter.swift
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

protocol HomePresentationLogic: AnyObject {
    func presentPostList(response: Home.Fetch.Response)
    func alertAction(title: String , message: String , action: UIAlertAction)
    func alert(title: String , message: String)
}

final class HomePresenter: HomePresentationLogic {
    weak var viewController: HomeDisplayLogic?
    
    func presentPostList(response: Home.Fetch.Response) {
        var postList: [Home.Fetch.ViewModel.Post] = []
        response.postList.forEach {
            postList.append(Home.Fetch.ViewModel.Post(postedBy: $0.postedBy , postComment: $0.postComment, imageUrl: $0.imageUrl))
        }

        viewController?.displayPosts(viewModel: Home.Fetch.ViewModel(postList: postList))
    }
    func alertAction(title: String , message: String , action: UIAlertAction) {
        Alert.alertAction(title: title, message: message, action: action)
    }
    
    func alert(title: String , message: String){
        Alert.alert(title: title, message: message)
    }
}
