//
//  HomeWorker.swift
//  LinkedinClone
//
//  Created by MacOS on 17.02.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Firebase
import UIKit

protocol HomeWorkerProtocol: AnyObject{
    func getData(completion: @escaping ((Result<[Home.Fetch.ViewModel.Post], Error>) -> Void))
}

final class HomeWorker : HomeWorkerProtocol {
    let db = Firestore.firestore()
    
    func getData(completion: @escaping ((Result<[Home.Fetch.ViewModel.Post], Error>) -> Void)){
        
        db.collection("post").order(by: "date", descending: true).addSnapshotListener { (snapshot, error) in
            guard let result = snapshot else {
                print("Error fetching document: \(error!)")
                return
            }
        }
    }
}
