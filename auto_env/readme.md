# 环境离线安装脚本

> Author: CloudS3n  
> 切勿随意修改，否则后果自负。  
> 为了系统安全，务必用完即删。

此脚本用于一键安装各种开发环境，你需要的仅仅是修改 `config.sh` 配置文件，然后将安装包放入 `deploy` 目录中，最后运行 `run.sh` 或 `uninstall.sh` 即可安装/卸载。 

目前已测试的系统：
- 中标麒麟 aarch64
- CentOS7 x64
- RedHat7 x64

> 注意

离线安装方式分为两种：  
- 编译安装
- 软件包安装

> 需要的依赖
- psmisc: for killall
- gcc