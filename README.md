# iOSProjectDemo
![项目框架图](https://github.com/hbbdsqd/iOSProjectDemo/blob/master/Objective-C%E9%A1%B9%E7%9B%AE%E6%A1%86%E6%9E%B6.jpg)
# 创建项目
## 添加CocoaPods
1：cd 项目路径  2：vim Profile  3：pod install
注意：在xgithub上的版本 我忽略了Pods文件夹，如果使用，请自行pod install安装
## 创建项目结构
### Main
主要的业务逻辑存放代码位置
#### Base
##### Controller
   ###### QDBaseViewController
控制器基类，便于控制操纵项目中的所有控制器。强制要求所有新创建的控制器必须继承于此控制器。
   ###### QDBaseNavViewController
导航控制器，用于导航样式的统一管理。
   ###### QDTabBarViewController
tabbar控制器，处理消息样式和业务逻辑分类。
   ###### QDBaseWebViewViewController
webView控制器，加载内部链接网页，动态获取网页title展示
#### Login
#### Push
#### Business
##### Mine
##### Message
##### Home
### Expand
主要的基础服务框架和支持层
### Module
主要是模块存放位置，区别于业务层内容，作为基础模块服务业务，方便调用，封装解耦
### Resource
资源文件存放处：info.plist、image、appdelegate等等



