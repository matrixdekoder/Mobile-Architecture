//
//  Injector.swift
//  ios_mvvm_swift
//
//  Created by Phạm Như Vũ on 10/23/18.
//  Copyright © 2018 Phạm Như Vũ. All rights reserved.
//

import Foundation

class Injector {
    private var _appProvider: AppProvider!
    private var _demoRepository: DemoRepository!
    
    static let instance = Injector()
    
    private init() {}
    
    var demoRepository: DemoRepository {
        get { return self._demoRepository }
        set(repository) { self._demoRepository = repository }
    }
    
    var appProvider: AppProvider {
        get { return self._appProvider }
        set(provider) { self._appProvider = provider}
    }
}
