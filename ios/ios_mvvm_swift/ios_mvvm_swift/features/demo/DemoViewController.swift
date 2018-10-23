//
//  DemoViewController.swift
//  ios_mvvm_swift
//
//  Created by Phạm Như Vũ on 10/22/18.
//  Copyright © 2018 Phạm Như Vũ. All rights reserved.
//

import UIKit
import RxSwift

class DemoViewController: UIViewController {
    
    var disposeBag: DisposeBag = DisposeBag()
    var demoViewModel: DemoViewModel!
    
    @IBOutlet weak var lbGLobalCountNumber: UILabel!
    @IBOutlet weak var btnGlobalIncrease: UIButton!
    @IBOutlet weak var lbCountNumber: UILabel!
    @IBOutlet weak var btnIncrease: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        demoViewModel = DemoViewModel()
        let d = demoViewModel.count.subscribe(
            onNext: {
                (newNumber) in
                self.lbCountNumber.text = String(newNumber)
        },
            onError: {
                (error) in
                print(error)
        })
        d.disposed(by: disposeBag)
        
        btnIncrease.addTarget(self, action: #selector(increase), for: .touchUpInside)
        btnNext.addTarget(self, action: #selector(goToDemo), for: .touchUpInside)
        btnBack.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
    
    @objc func goToDemo() {
        navigationController?.to(name: Routes.demo)
    }
    
    @objc func increase() {
        do {
            let count = try demoViewModel.count.value()
            demoViewModel.count.onNext(count+1)
        } catch {
            
        }
    }
    
    @objc func back() {
        navigationController?.back()
    }
}
