# Ansible Role: mvn3

添加maven编译环境

## 要求

此角色仅在centos7、ubuntu18.04完成测试。

## 测试环境

ansible `2.8.8`
awx `5.0.0`
python `2.7.5`

## 角色变量
    software_files_path: "/opt/software"
    software_install_path: "/usr/local"

    mvn_version: "3.5.4"
    mvn_file: "apache-maven-{{ mvn_version }}-bin.tar.gz"
    mvn_file_path: "{{ software_files_path }}/{{ mvn_file }}"
    mvn_install_path: "{{ software_install_path }}/apache-maven-{{ mvn_version }}"
    mvn_file_url: "https://archive.apache.org/dist/maven/maven-3/{{ mvn_version }}/binaries/apache-maven-{{ mvn_version }}-bin.tar.gz"

    link_force: false


## 依赖

java

## Example Playbook

默认安装3.5.4
```yaml
- hosts: all
  roles:
	- mvn3
```
指定安装版本  
```yaml
- hosts: all
  roles:
	- { role: mvn3, mvn_version: "3.6.0" }
```