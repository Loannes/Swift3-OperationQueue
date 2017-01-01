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
    
    var num = 0
    let someWork = SomeWork()
    
    // MARK: 블럭 사용 operationQueue 함수
    @IBAction func startOP(_ sender: Any) {
        for _ in 1...5 {
            someWork.addTask(task: task)
        }
    }
    
    @IBAction func resetLable(_ sender: Any) {
        self.label1.text = "작업 대기중..."
        self.label2.text = "작업 대기중..."
        self.label3.text = "작업 대기중..."
        self.label4.text = "작업 대기중..."
        self.label5.text = "작업 대기중..."
        num = 0
    }
    
    func task() {
        num += 1
        
        if num == 1 {
            Thread.sleep(forTimeInterval: 1.0)
            DispatchQueue.main.async(execute: {
                self.label1.text = "작업 완료"
            })
        }else if num == 2 {
            Thread.sleep(forTimeInterval: 1.0)
            DispatchQueue.main.async(execute: {
                self.label2.text = "작업 완료"
            })
        }else if num == 3 {
            Thread.sleep(forTimeInterval: 3.0)
            DispatchQueue.main.async(execute: {
                self.label3.text = "작업 완료"
            })
        }else if num == 4 {
            Thread.sleep(forTimeInterval: 1.0)
            DispatchQueue.main.async(execute: {
                self.label4.text = "작업 완료"
            })
        }else if num == 5 {
            Thread.sleep(forTimeInterval: 1.0)
            DispatchQueue.main.async(execute: {
                self.label5.text = "작업 완료"
            })
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

