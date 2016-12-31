//
//  MyOperation.swift
//  Swift3-OperationQueue
//
//  Created by dev_sinu on 2016. 12. 26..
//  Copyright © 2016년 dev_sinu. All rights reserved.
//  http://seorenn.blogspot.kr/2014/06/swift-nsoperationqueue.html
//
//  개발자 노트 :
//  기본 기능을 사용하면 아래와 같은 장점이 있다
//  각 상황별 대응이 좀 더 유기적으로 할 수 있다는점
//  특정 관리 로직을 추가해서 상황별로 대응할 수 있는 장점이 있다
//  하지만 단점으로는 간단한 작업이나 외부에서 이미 검증되어 바로 실행되어야 하는 테스크일 경우
//  여러가지 이유로 번거롭고 복잡해 보인다는 것이다
//


import Foundation

class MyOperation: Operation {
    var index: Int?
    init(index: Int) {
        super.init()
        self.index = index
    }
    
    override func start() {
        /*
         * start 메서드는 해당 operation이 호출되고 맨 처음 실행된다.
         * 여기서는 main 메서드가 실행되기 전에 유효성 검사를 한다든지,
         * 먼서 실행되어야 하는 작업을 선행한다.
         */
        
        
        
        
        /*
         * Cancel을 체크하는 이유
         * 앱이 갑자기 종료되거나 더이상 작업을 진행해야할 필요가 없는경우
         * CPU가 쓸대없는 작업을 하는 것을 방지해준다
         * 레퍼런스 권고사항
         */
        if self.isCancelled {
            
        } else {
            // super.start가 호출되면 다음으로 main()이 호출됨
            super.start()
        }
    }
    
    override func main() {
        // 이곳은 해당 큐가 true일 경우 실행되는 코드다
        Thread.sleep(forTimeInterval: 3.0)
        print("From My Operation = \(self.index)")
        
    }
    
    override func cancel() {
        // 만일 해당 작업이 cancel이면
        print("Cancel Task index = \(self.index)")
    }
}
