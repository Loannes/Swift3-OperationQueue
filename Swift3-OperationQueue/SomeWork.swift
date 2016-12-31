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

    init(task: @escaping () -> Void, num: Int) {
        self.queue.maxConcurrentOperationCount = 1

        let operation1 = BlockOperation(block: {

            // 3번째 라벨이면 3초를 지연시킨다
            if num == 2 {
                Thread.sleep(forTimeInterval: 3.0)
            }else{
//                Thread.sleep(forTimeInterval: 1.0)
            }

            DispatchQueue.main.async(execute: {
                task()
            })
        })
        self.queue.addOperation(operation1)
    }
}
