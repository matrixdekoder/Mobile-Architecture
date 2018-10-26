//
//  DemoViewModel.swift
//  ios_mvvm_swift
//
//  Created by Phạm Như Vũ on 10/23/18.
//  Copyright © 2018 Phạm Như Vũ. All rights reserved.
//

import Foundation
import RxSwift

class DemoViewModel {
    
    init(demoRepository: DemoRepository) {
        self._demoRepository = demoRepository
    }
    
    private let _demoRepository: DemoRepository
    
    private let _count = BehaviorSubject<Int>(value: 0);
    var count: BehaviorSubject<Int> {
        get { return _count }
    }
    
    func increase(number: Int) {
        do {
            let count = try _count.value()
            _count.onNext(count+number)
        } catch {}
    }
}
