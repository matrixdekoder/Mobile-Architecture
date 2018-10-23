//
//  ExtensionUINavigationController.swift
//  ios_mvvm_swift
//
//  Created by Phạm Như Vũ on 10/23/18.
//  Copyright © 2018 Phạm Như Vũ. All rights reserved.
//

import UIKit.UINavigationController

extension UINavigationController {
    func to(name: String) {
        var vc: UIViewController
        switch name {
        case Routes.demo:
            vc = DemoViewController()
            (vc as! DemoViewController).inject(
                appProvider: Injector.instance.appProvider,
                demoViewModel: DemoViewModel(demoRepository: Injector.instance.demoRepository)
            )
        default:
            return
        }
        self.pushViewController(vc, animated: false)
    }
    
    func back() {
        self.popViewController(animated: false)
    }
}
