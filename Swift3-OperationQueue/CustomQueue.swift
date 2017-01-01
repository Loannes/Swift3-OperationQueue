//
//  SomeWork.swift
//  Swift3-OperationQueue
//
//  Created by loannes on 2016. 12. 31..
//  Copyright © 2016년 dev_sinu. All rights reserved.
//

import Foundation
import UIKit

class CustomQueue {
    let queue = OperationQueue()
    let container: UIView = UIView()
    let notiCenter = NotificationCenter.default
    
    init() {
        self.queue.maxConcurrentOperationCount = 1
        self.notiCenter.addObserver(self,
                               selector: #selector(startIndicator),
                               name: NSNotification.Name(rawValue: "startIndicator"),
                               object: nil)
        
        self.notiCenter.addObserver(self,
                               selector: #selector(stopIndicator),
                               name: NSNotification.Name(rawValue: "stopIndicator"),
                               object: nil)
    }
    
    func addTask(task: @escaping () -> Void) {

        let operation = BlockOperation(block: {
            DispatchQueue.main.async(execute: {
                self.notiCenter.post(name: NSNotification.Name(rawValue: "startIndicator"), object: nil)
            })

            task()

            DispatchQueue.main.async(execute: {
                self.notiCenter.post(name: NSNotification.Name(rawValue: "stopIndicator"), object: nil)
            })

            Thread.sleep(forTimeInterval: 1.0)
        })
        self.queue.addOperation(operation)
    }
      
    @objc func startIndicator() {
        
        if let rootView = UIApplication.shared.keyWindow?.rootViewController?.view! {
            container.frame = rootView.frame
            container.center = rootView.center
            container.backgroundColor = UIColor(netHex:0x000000)
            container.alpha = 0.2
            
            let loadingView: UIView = UIView()
            loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
            loadingView.center = rootView.center
            loadingView.backgroundColor = UIColor(netHex:0x444444)
            loadingView.alpha = 0.7
            loadingView.clipsToBounds = true
            loadingView.layer.cornerRadius = 10
            
            let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
            actInd.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            actInd.activityIndicatorViewStyle =
                UIActivityIndicatorViewStyle.whiteLarge
            actInd.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
            loadingView.addSubview(actInd)
            container.addSubview(loadingView)
            rootView.addSubview(container)
            actInd.startAnimating()
        }
    }
    
    @objc func stopIndicator() {
        if let rootView = UIApplication.shared.keyWindow?.rootViewController?.view! {
            for view in rootView.subviews {
                if (view == container) {
                    view.removeFromSuperview()
                }
            }
        }
    }
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
