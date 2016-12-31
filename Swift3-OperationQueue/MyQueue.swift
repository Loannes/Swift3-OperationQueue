//
//  MyWork.swift
//  Swift3-OperationQueue
//
//  Created by dev_sinu on 2016. 12. 26..
//  Copyright © 2016년 dev_sinu. All rights reserved.
//

import Foundation

class MyQueue {
    let queue = OperationQueue()
    
    init() {
        self.queue.maxConcurrentOperationCount = 1
    }
    
    func add(operation: MyOperation) {
        self.queue.addOperation(operation)
    }
}
