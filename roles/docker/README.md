# Ansible Role: docker

安装docker

## 要求

此角色仅在centos7、ubuntu18.04完成测试。

## 测试环境

ansible `2.8.8`
awx `5.0.0`
python `2.7.5`

## 角色变量
	docker_repo_redhat: "http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo"
	docker_gpg_debian: "http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg"
	docker_repo_debian: "http://mirrors.aliyun.com/docker-ce/linux/ubuntu"
	docker_old:
	  - docker-ce
	  - docker-ce-cli

	docker_packages_redhat:
	  - lvm2
	  - yum-utils
	  - device-mapper-persistent-data
	  - bash-completion
	  
	docker_packages_debian:
	   - apt-transport-https 
	   - ca-certificates 
	   - curl 
	   - software-properties-common

	firewalld_stop: true

	docker_registry_mirrors: ["http://dockerhub.azk8s.cn"]
	docker_insecure_registries: ["harbor.pub.pdm.cmdrawin.com"]
	docker_data_root: /var/lib/docker
	##docker_ce_version 指定安装版本，如果未定义，则安装最新版本。
	
## 依赖

无

## Example Playbook

默认安装最新版本
```yaml
- hosts: all
  roles:
   - { role: docker }
```
指定安装版本
```yaml
- hosts: all
  roles:
   - { role: docker, docker_ce_version: "18.09.2"}
```

        
