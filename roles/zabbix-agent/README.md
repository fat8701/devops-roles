# Ansible Role: zabbix-agent

安装zabbix客户端

## 介绍
zabbix 是一个基于WEB界面的提供分布式系统监视以及网络监视功能的企业级的开源解决方案。

官方地址： https://www.zabbix.com
官方文档地址：https://www.zabbix.com/documentation/4.2/manual

## 要求

此角色仅在centos7、ubuntu18.04、windows2016-server完成测试。

## 测试环境

ansible `2.8.8`
awx `5.0.0`
python `2.7.5`

## 角色变量
	software_files_path: "/opt/software"
	software_install_path: "/usr/local"

	zabbix_agent_repo_version: 4.4
	zabbix_agent_repo_package: "{{ zabbix_agent_repo_url[zabbix_agent_repo_version|string].split('/')[-1] }}"

	zabbix_agent_file_version: 4.0
	zabbix_agent_file: "{{ zabbix_agent_file_url[zabbix_agent_file_version|string].split('/')[-1] }}"
	zabbix_agent_file_path: "{{ zabbix_agent_file_url[zabbix_agent_file_version|string].split('/')[-1]|regex_replace('.tar.gz')|regex_replace('centos-','centos')|regex_replace('ubuntu-','ubuntu') }}"

	#zabbix_source_file_url: "https://phoenixnap.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/{{ zabbix_agent_version }}/{{ zabbix_agent_file }}"
	zabbix_agent_install_mode: repo  

	zabbix_agent_user: zabbix
	zabbix_agent_group: zabbix

	zabbix_agent_conf_path: "/etc/zabbix" 
	zabbix_agent_logs_path: "/var/log/zabbix"
	zabbix_agent_pid_path: "/tmp"
	zabbix_server_host: "zabbix.cmdrawin.com"

	zabbix_agent_docker_image_name: "zabbix/zabbix-agent"
	zabbix_agent_docker_tag: "ubuntu-latest"
	zabbix_agent_docker_image: "{{ zabbix_agent_docker_image_name }}:{{ zabbix_agent_docker_tag }}"
	zabbix_agent_docker_port: "10050:10050"
	zabbix_agent_docker_name: zabbix-agent
	zabbix_agent_docker_conf: "/etc/zabbix/zabbix_agentd.d"

## 依赖

无

## Example Playbook
	Linux主机：
    ---
    # 官方源安装
    - hosts: node2
      roles:
       - { role: zabbix-agent }
	或者
    - hosts: node2
      roles:
       - { role: zabbix-agent, zabbix_agent_install_mode: repo  }	
       
    # 官方编译过的包安装
    - hosts: node3
      roles:
       - { role: zabbix-agent, zabbix_agent_install_mode: file }

    # docker安装
    - hosts: node3
      roles:
       - { role: zabbix-agent, zabbix_agent_install_mode: docker }
	 
	windows主机：
    - hosts: node3
      roles:
       - { role: zabbix-agent }
	windows inventory需要配置：
	[windows]
	192.168.x.x  ansible_user="administrator" ansible_password="xxxxxxx" ansible_port=5985 ansible_connection="winrm" ansible_winrm_transport=ntlm  ansible_winrm_server_cert_validation=ignore
## 使用

``` 
systemctl status zabbix-agent
```
