### gem sources -l #(查看当前ruby的源)


### https://cocoapods.org/

### 创建cocoapods trunk账户

  * pod trunk register 153190953@qq.com '一个橙子' --description='描述内容' （邮箱参数是必须的，用户名和--description参数可省略） 
  * 查看你的注册信息（必须在确认cocoapods会话后，才执行）
  * pod trunk me 查看注册信息


### 创建.podspec文件

    .podspec文件的作用是为了让CocoaPods搜索引擎知道该代码的作者、版本号、概要、描述、源代码地址、部署版本、依赖的框架等描述信息。

    创建.podspec文件
    pod spec create OrangeEngineFramework


###  添加git tag

    git add --all
	git commit -m'update framework'
	git push
	git tag 1.0.0
	git push origin --tags

	查看tag
	git tag
	删除tag
	git tag -d “1.0.0”
	删除远程tag
	git push origin :refs/tags/"1.0.0"

### 上传CocoaPods
     
    pod spec lint OrangeEngineFramework.podspec --allow-warnings
    pod trunk push OrangeEngineFramework.podspec --allow-warnings


    https://cocoapods.org/pods/OrangeEngineFramework


### 上传问题
    
    * 'UIKit/UIKit .h' file not found
    解决方式
    s.platform = :ios
    s.framework = "UIKit"


### 使用模版创建
   
    pod lib create OrangeEngineFramework