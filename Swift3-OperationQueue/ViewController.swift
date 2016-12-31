//
//  ViewController.swift
//  Swift3-OperationQueue
//
//  Created by dev_sinu on 2016. 12. 26..
//  Copyright © 2016년 dev_sinu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    
    let queue = MyQueue()
    var num = 0
    
    @IBAction func startOP(_ sender: Any) {
        num += 1
        queue.add(operation: MyOperation(index: num))
    }

    
    
    
    
    // MARK: 블럭 사용 operationQueue 함수
    @IBAction func startOP2(_ sender: Any) {
        _ = SomeWork(task: someWork, num: num)
    }
    
    func someWork() -> Void {
        num += 1
        
        if num == 1 {
            self.label1.text = "작업 완료"
        }else if num == 2 {
            self.label2.text = "작업 완료"
        }else if num == 3 {
            self.label3.text = "작업 완료"
        }else if num == 4 {
            self.label4.text = "작업 완료"
        }else if num == 5 {
            self.label5.text = "작업 완료"
        }
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

