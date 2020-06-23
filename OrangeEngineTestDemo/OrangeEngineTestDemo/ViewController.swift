//
//  ViewController.swift
//  OrangeEngineTestDemo
//
//  Created by 王成诚 on 2020/6/23.
//  Copyright © 2020 王成诚. All rights reserved.
//

import UIKit
import OrangeEngineFramework

class ViewController: UIViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: 配置页面
    func setupUI() {
        view.addSubview(homeV)
    }
    
    // MARK: 懒加载
    lazy var homeV: OrangeHomeView  = {
        let view = OrangeHomeView.init(frame: CGRect.init(x: 20, y: 200, width: 200, height: 50))
        return view
    }()

}

