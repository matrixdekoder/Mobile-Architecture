//
//  Injector.swift
//  ios_mvvm_swift
//
//  Created by Phạm Như Vũ on 10/23/18.
//  Copyright © 2018 Phạm Như Vũ. All rights reserved.
//

import Foundation

class Injector {
    
    private init() {}
    static let instance = Injector()
    
    private var _appViewModelProvider: AppViewModelProvider!
    private var _demoRepository: DemoRepository!
    
    var demoRepository: DemoRepository {
        get { return self._demoRepository }
        set(repository) { self._demoRepository = repository }
    }
    
    var appViewModelProvider: AppViewModelProvider {
        get { return self._appViewModelProvider }
        set(provider) { self._appViewModelProvider = provider}
    }
}
