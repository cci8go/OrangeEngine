//
//  OrangeHomeView.swift
//  OrangeEngineFramework
//
//  Created by 王成诚 on 2020/6/23.
//  Copyright © 2020 王成诚. All rights reserved.
//

import Foundation


// MARK: 自定义的一个首页视图
public class OrangeHomeView: UIView {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        layout()
        
        HWNetworkManager.shared.request(requestType: HWHTTPMethod.GET, url: "www.baidu.com", parameters: [:]) { ([String : Any]?, Error) in
            
        }
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: 配置页面
    func setupUI() {
        addSubview(iconImgV)
    }
    // 布局页面
    func layout() {
        iconImgV.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
    }
    lazy var iconImgV: UIImageView = {
        let view = UIImageView.init()
        view.backgroundColor = UIColor.red
        return view
    }()
}
