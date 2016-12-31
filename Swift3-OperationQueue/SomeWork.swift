//
//  SomeWork.swift
//  Swift3-OperationQueue
//
//  Created by loannes on 2016. 12. 31..
//  Copyright © 2016년 dev_sinu. All rights reserved.
//

import Foundation

class SomeWork {
    let queue = OperationQueue()

    init(task: @escaping () -> Void) {
        self.queue.maxConcurrentOperationCount = 1

        let operation1 = BlockOperation(block: {
            task()
        })
        self.queue.addOperation(operation1)
    }
}
