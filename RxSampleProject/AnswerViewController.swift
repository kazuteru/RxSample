//
//  AnswerViewController.swift
//  RxSampleProject
//
//  Created by Kazuki Kobashi on 2018/05/31.
//  Copyright © 2018年 Kazuki Kobashi. All rights reserved.
//


import UIKit
import RxSwift
import RxCocoa

class AnswerViewController: UIViewController {
    
    @IBOutlet weak var rightTextField: UITextField!
    @IBOutlet weak var leftTextField: UITextField!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    
    fileprivate let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        leftTextField.rx.text.asObservable()
            .observeOn(MainScheduler.instance)
            .bind(to: leftLabel.rx.text)
            .disposed(by: disposeBag)
        
        rightTextField.rx.text.asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                self?.rightLabel.text = $0
            })
            .disposed(by: disposeBag)
        
        Observable.combineLatest(leftTextField.rx.text.asObservable(),
                                 rightTextField.rx.text.asObservable())
        { "\($0!) and \($1!)" }
            .bind(to: centerLabel.rx.text)
            .disposed(by: disposeBag)
        
//        Observable.of(leftTextField.rx.text.asObservable(),
//                                 rightTextField.rx.text.asObservable())
//            .merge()
//            .bind(to: centerLabel.rx.text)
//            .disposed(by: disposeBag)
        
        clearButton.rx.controlEvent(.touchUpInside).asDriver()
            .drive(onNext: { [weak self] in
                self?.leftLabel.text = ""
                self?.rightLabel.text = ""
            })
            .disposed(by: disposeBag)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


