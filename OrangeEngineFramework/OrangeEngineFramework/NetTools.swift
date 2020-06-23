//
//  NetTools.swift
//  OrangeEngineFramework
//
//  Created by 王成诚 on 2020/6/23.
//  Copyright © 2020 王成诚. All rights reserved.
//
import UIKit
import AFNetworking

/// Swift 的枚举支持任意数据类型
/// switch / enum 在 OC 中都只是支持整数
/**
 - 如果日常开发中，发现网络请求返回的状态码是 405，不支持的网络请求方法
 - 首先应该查找网路请求方法是否正确
 */
enum HWHTTPMethod {
    case GET
    case POST
}

/// 网络管理工具
class HWNetworkManager: AFHTTPSessionManager {
    
    /// 静态区／常量／闭包
    /// 在第一次访问时，执行闭包，并且将结果保存在 shared 常量中
    static let shared:HWNetworkManager = {
        // 实例化对象
        let instance = HWNetworkManager()
        
        // 设置响应反序列化支持的数据类型
        instance.responseSerializer.acceptableContentTypes?.insert("text/plain")
        
        // 返回对象
        return instance
        
    }()
    
    // 将成功和失败的回调写在一个逃逸闭包中(请求)
    /// 封装 AFN 的 GET / POST 请求
    ///
    /// - parameter method:     GET / POST
    /// - parameter URLString:  URLString
    /// - parameter parameters: 参数字典
    /// - parameter completion: 完成回调[json(字典／数组), 是否成功]
    
func request(requestType :HWHTTPMethod, url : String, parameters : [String : Any], resultBlock : @escaping([String : Any]?, Error?) -> ()) {
        
        // 成功闭包
        let successBlock = { (task: URLSessionDataTask, responseObj: Any?) in
            resultBlock(responseObj as? [String : Any], nil)
        }
        
        // 失败的闭包
        let failureBlock = { (task: URLSessionDataTask?, error: Error) in
            resultBlock(nil, error)
        }
        
        // Get 请求
        if requestType == .GET {
            get(url, parameters: parameters, headers: nil, progress: nil, success: successBlock, failure: failureBlock)
            print("get ",url)
        }
        
        // Post 请求
        if requestType == .POST {
            post(url, parameters: parameters, headers: nil, progress: nil, success: successBlock, failure: failureBlock)
        }
    }
  

    
}
