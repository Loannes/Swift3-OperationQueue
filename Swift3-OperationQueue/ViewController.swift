//
//  ViewController.swift
//  Swift3-OperationQueue
//
//  Created by dev_sinu on 2016. 12. 26..
//  Copyright © 2016년 dev_sinu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let queue = MyQueue()
    var num = 1
    
    @IBAction func startOP(_ sender: Any) {
        num += 1
        queue.add(operation: MyOperation(index: num))
    }
    
    @IBAction func startOP2(_ sender: Any) {
        _ = SomeWork(task: someWork)
    }
    
    func someWork() -> Void {
        Thread.sleep(forTimeInterval: 1.0)
        num += 1
        print("hi=\(num)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

