# Ansible Role: OS INIT

针对 linux 系统进行一些初始化操作。

## 要求

此角色仅在centos7、ubuntu18.04完成测试。

## 测试环境

ansible `2.8.8`
awx `5.0.0`
python `2.7.5`

## 角色变量

无

## 初始化项目

- 关闭服务
  - 关闭防火墙
  - 关闭selinux

- 系统优化
  - 系统参数调整
  - 修改系统限制
  - 修改系统仓库国内镜像(科大源)
  
- 系统环境设置
  - 优化history格式
  - 优化终端PS1配置
  
- 功能启用
  - 安装基础软件(包括net-tools、chronyd对时等)
  - 开启systemd journald服务
  - 开启rc.local开机自启动

- 系统环境设置
  - vim 环境设置
  - ssh console设置
  - ssh banner设置
  
- 系统升级
  - 升级系统包
  
## 依赖

无

## Example Playbook
```yaml
- hosts: all
  roles:
    - os-init
```