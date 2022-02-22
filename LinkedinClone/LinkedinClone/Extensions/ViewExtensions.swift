//
//  ViewExtensions.swift
//  LinkedinClone
//
//  Created by MacOS on 19.02.2022.
//

import Foundation
import UIKit
extension UIView {
    
    func addTapGesture(action : @escaping ()->Void ){
        let tap = MyTapGestureRecognizer(target: self , action: #selector(self.handleTap(_:)))
        tap.action = action
        tap.numberOfTapsRequired = 1
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
    }
    
    @objc func handleTap(_ sender: MyTapGestureRecognizer) {
        sender.action!()
    }
}
class MyTapGestureRecognizer: UITapGestureRecognizer {
    var action : (()->Void)? = nil
}


public enum QueueType {
    case Main
    case Background
    case LowPriority
    case HighPriority

    var queue: DispatchQueue {
        switch self {
        case .Main:
            return DispatchQueue.main
        case .Background:
            return DispatchQueue(label: "com.app.queue",
                                 qos: .background,
                                 target: nil)
        case .LowPriority:
            return DispatchQueue.global(qos: .userInitiated)
        case .HighPriority:
            return DispatchQueue.global(qos: .userInitiated)
        }
    }
}

func performOn(_ queueType: QueueType, closure: @escaping () -> Void) {
    queueType.queue.async(execute: closure)
}
