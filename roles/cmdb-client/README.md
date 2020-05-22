# Ansible Role: cmdb-client

安装cmdb agent客户端

## 介绍
adminset的客户端脚本，完成agent作用。

官方地址： http://docs.adminset.cn/

## 要求

此角色仅在centos7、ubuntu18.04完成测试。

## 测试环境
ansible `2.8.8`
awx `5.0.0`
python `2.7.5`

## 角色变量

	install_adminsetd: yes
	client_file_path: /usr/local/adminset-client
	token: 
	server_ip: 

## 依赖

无

## Example Playbook
	Linux主机：
	---
	  host: all
	  roles:
	     - cmdb-client
	
## 使用

``` 
systemctl status adminsetd 或 service adminsetd status
```
