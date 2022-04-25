//
//  HomeModels.swift
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

enum Home
{
    // MARK: Use cases

    enum Fetch
    {
        struct Request
        {

        }

        struct Response
        {
            var postList: [QueryDocumentSnapshot]
        }

        struct ViewModel {
            var postList: [Home.Fetch.ViewModel.Post?]
            
            struct Post {
                
                var postedBy: String?
                var date: Date?
                var postComment: String?
                var imageUrl: String?
               
            }
        }
    }
}
