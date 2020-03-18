# Ansible Role: zookeeper

安装zookeeper

## 介绍
ZooKeeper是一个分布式的，开放源码的分布式应用程序协调服务，是Google的Chubby一个开源的实现，是Hadoop和Hbase的重要组件。它是一个为分布式应用提供一致性服务的软件，提供的功能包括：配置维护、域名服务、分布式同步、组服务等。

官方地址： https://zookeeper.apache.org/
官方文档地址：https://zookeeper.apache.org/doc/trunk/index.html

## 要求

此角色仅在centos7、ubuntu18.04完成测试。

## 测试环境

ansible `2.8.8`
awx `5.0.0`
python `2.7.5`

## 角色变量
		software_files_path: "/opt/software"
		software_install_path: "/usr/local"

		zookeeper_version: "3.5.7"

		zookeeper_file_path: "{{ software_files_path }}/{{ zookeeper_file }}"
		zookeeper_file_url: "https://archive.apache.org/dist/zookeeper/zookeeper-{{ zookeeper_version }}/apache-zookeeper-{{ zookeeper_version }}-bin.tar.gz"
		#zookeeper_file: "apache-zookeeper-{{ zookeeper_version }}.tar.gz"
		zookeeper_file: "{{ zookeeper_file_url.split('/')[-1] }}"
		#zookeeper_file_url: "http://mirror.bit.edu.cn/apache/zookeeper/zookeeper-{{ zookeeper_version }}/apache-zookeeper-{{ zookeeper_version }}.tar.gz"

		zookeeper_user: "zookeeper"
		zookeeper_port: 2181
		leader_port: "2888:3888"
		zookeeper_name: "zookeeper{{ zookeeper_port if zookeeper_port != 2181 else '' }}" 
		zookeeper_home: "/zookeeper_data"
		zookeeper_dir: |- 
				{%- if single_mode -%}
				{{ zookeeper_home }}/{{ zookeeper_port }}
				{%- else -%}
				{{ software_install_path }}/{{ zookeeper_file | regex_replace('.tar.gz') }}/conf
				{%- endif -%}
		zookeeper_datadir: "{{ zookeeper_home }}/{{ zookeeper_port }}/data"
		zookeeper_datalogdir: "{{ zookeeper_home }}/{{ zookeeper_port }}/logs"
		zookeeper_hosts: "{{ ansible_play_hosts}}"
		single_mode: false
		java_home: "{{ ansible_env.JAVA_HOME | default('/usr/java/jdk1.8') }}"
        

## 依赖

java

## Example Playbook

    安装zookeeper，默认端口2181,2888,3888：
    - hosts: 192.168.77.129
      roles:
       - { role: zookeeper }

    单机伪集群安装：
    - hosts: 192.168.77.129
      vars:
	    single_mode: true
        zookeeper_hosts:
          - {host: 192.168.77.129, port: 2181, leader_port: "2888:3888"}
          - {host: 192.168.77.129, port: 2182, leader_port: "2889:3889"}
          - {host: 192.168.77.129, port: 2183, leader_port: "2890:3890"}
		  ###注意port和zookeeper_port一致,且leader_port必须设置在zookeeper_hosts内。
      roles:
       - { role: zookeeper, zookeeper_port: 2181 }
       - { role: zookeeper, zookeeper_port: 2182 }
       - { role: zookeeper, zookeeper_port: 2183 }

    分布式安装：
    全部默认
    - hosts: 192.168.77.129 192.168.77.130 192.168.77.131
      roles:
         - { role: zookeeper }
    指定id
    - hosts: 192.168.77.129 192.168.77.130 192.168.77.131
      vars:
       - zookeeper_hosts:
          - {host: 192.168.77.129, id: 1}
          - {host: 192.168.77.130, id: 2}
          - {host: 192.168.77.131, id: 3}
      roles:
       - { role: zookeeper}
    统一指定端口
    - hosts: 192.168.77.129 192.168.77.130 192.168.77.131
      roles:
       - { role: zookeeper, zookeeper_port: 2182, leader_port: "2889:3889"}

## 使用

	启动命令：systemctl start zookeeper
 	关闭命令：systemctl stop zookeeper
	查看集群状态命令：/etc/init.d/zookeeper sstatus 或 zkServer.sh status 
	客户端命令：zkCli.sh -server localhost:2181 

