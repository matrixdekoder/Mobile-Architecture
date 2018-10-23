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
    var appProvider: AppProvider!
    var demoViewModel: DemoViewModel!
    
    @IBOutlet weak var lbGLobalCountNumber: UILabel!
    @IBOutlet weak var btnGlobalIncrease: UIButton!
    @IBOutlet weak var lbCountNumber: UILabel!
    @IBOutlet weak var btnIncrease: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    func inject(appProvider: AppProvider, demoViewModel: DemoViewModel) {
        self.appProvider = appProvider
        self.demoViewModel = demoViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appProvider.count.subscribe(onNext: {
            (newNumber) in
            self.lbGLobalCountNumber.text = String(newNumber)
        }, onError: {
            (error) in
            print(error)
        }).disposed(by: disposeBag)
        
        demoViewModel.count.subscribe(
            onNext: {
                (newNumber) in
                self.lbCountNumber.text = String(newNumber)
        },
            onError: {
                (error) in
                print(error)
        }).disposed(by: disposeBag)
        btnGlobalIncrease.addTarget(self, action: #selector(globalIncrease), for: .touchUpInside)
        btnIncrease.addTarget(self, action: #selector(increase), for: .touchUpInside)
        btnNext.addTarget(self, action: #selector(goToDemo), for: .touchUpInside)
        btnBack.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
    
    @objc func goToDemo() {
        navigationController?.to(name: Routes.demo)
    }
    
    @objc func globalIncrease() {
        do {
            let count = try appProvider.count.value()
            appProvider.count.onNext(count+1)
        } catch {
            
        }
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
