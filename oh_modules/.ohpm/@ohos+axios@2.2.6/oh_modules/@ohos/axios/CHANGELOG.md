# Changelog
## [v2.2.6] 2025.04
- Fixed file defects caused by the dataend callback

## [v2.2.5] 2025.03
- Release the official version
- Add device types

## [v2.2.5-rc.1] 2025.01
- Log rectification

## [v2.2.5-rc.0] 2024.09
- toFormData传入number类型时转换为string

## [v2.2.4] 2024.09
- 发布正式版本

## [v2.2.4-rc.0] 2024.09
- 修复响应状态码为400时,丢失响应体的问题

## [v2.2.3] 2024.08
- 发布正式版本

## [v2.2.3-rc.1] 2024.08
- 删除调试日志

## [v2.2.3-rc.0] 2024.08
- axios上传文件支持put请求
- 删除多余文件，解决开启字节码har能力，构建失败问题

## [v2.2.2] 2024.07
- AxiosResponse类型的performanceTiming参数修改为可选，兼容axiosForHttpclient组件

## [v2.2.1] 2024.07
- 发布正式版本

## [v2.2.1-rc.2] 2024.05
- 用requestInstream重构上传功能，axios上传文件支持代理、证书验证功能
- 用requestInstream重构下载功能，axios下载文件支持代理、证书验证功能
- 新增maxContentLength字段，支持定义HTTP响应的最大字节数
- 新增maxBodyLength字段，支持定义网络请求内容的最大字节数
- 新增readTimeout，支持设置读取超时
- 新增connectTimeout，支持设置连接超时

## [v2.2.1-rc.1] 2024.05
- multipart提交时，支持设置多部分表单数据的数据名称和数据类型类型

## [v2.2.1-rc.0] 2024.04
- 新增PerformanceTiming网络性能监测数据

## [v2.2.0] 2024.02
发布正式版本

## [v2.2.0-rc.4] 2024.02
## 修复
- 文件上传发送后，先返回了响应空结果，然后开始了上传的进度

## [v2.2.0-rc.3] 2024.01
## 修复
- 上传文件必须添加onUploadProgress事件
- 上传文件为uri必须指定文件名
- 上传文件uri不存在无错误返回

## [v2.2.0-rc.2] 2023-12
## 修复
- 更正文档泛型参数解释
- 删除代码中敏感信息
- header中的headerName不支持带数字

## [v2.2.0-rc.1] 2023-12
- 支持证书锁定（API11）
## 修复
- 由于OH参数变更，修改双向校验密码参数

## [v2.2.0-rc.0] 2023-11
- 支持p12格式的CA证书（API11）
- 支持pem,p12格式的客户端证书，实现双向校验（API11）
- 支持设置代理

## [v2.1.1] 2023-11
发布正式版本

## [v2.1.1-rc.0] 2023-11
## 更新
- 放开系统侧5MB限制

## [v2.1.0] 2023-11
## 更新
- 指定返回数据的类型
- 指定自定义证书
- 设置请求优先级

## [v2.0.5] 2023-11
发布正式版本

## [v2.0.5-rc.0] 2023-10
## 修复
- 修复不兼容API9问题，版本升级小版本2.0.4-rc.0

## [v2.0.4] 2023-09
## 更新
- ArkTS语法适配整改
## 修复
- API 9使用axios报错问题

## [v2.0.3] 2023-08
### 修复
- 上传文件无法获取返回数据。

## [v2.0.2] 2023-06
### 修复
- 已知bug修复。

## [v2.0.1] 2023-06
## 更新
- 适配DevEco Studio: 4.0 Carry1(4.0.3.212)
- 适配SDK: API10(4.0.8.3)

## [v2.0.0] 2023-04
### 新增
基于[axios](https://github.com/axios/axios) 原库v1.3.4版本进行适配，已适配以下功能：
- 发送 http 请求 ，自动转换JSON data 数据
- 上传/下载文件功能，监听上传下载事件
- request 和 response 拦截器
- 默认设置功能
- Promise API
- 包管理工具切换为OHPM

### 移除
- 移除依赖的follow-redirects、form-data、proxy-from-env库
- 移除原库支持的node、浏览器环境
- 移除proxy代理功能

## [v1.0.5]  2023-02

### 新增
- 兼容新版本IDE

## [v1.0.4]  2022-09

### 新增
- 更新测试样例页面布局
### 修复
- 已知bug修复。

## [v1.0.2] 2022-08

### 修复
- 下载header头部设置问题修复。
- 更改axios导入方式。
- 新版本RON闪退修复。
- 参数错误无反馈问题修复。
- 说明文档新增权限说明。
- 更新说明文档。

## [v1.0.1] 2022-07

### 修复
- 更新错误的引用路径。

## [v1.0.0] 2022-07

基于[axios](https://github.com/axios/axios) 原库0.27.2版本进行适配，使其可以运行在 OpenHarmony，并沿用其现有用法和特性。已支持：
- http 请求。
- Promise API。
- request 和 response 拦截器。
- 默认设置。
- 自动转换 JSON data 数据。