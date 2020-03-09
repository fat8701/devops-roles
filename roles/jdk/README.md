# Ansible Role: jdk

安装Java JDK

## 要求

此角色仅在centos7、ubuntu18.04完成测试。

## 测试环境

ansible `2.8.8`
awx `5.0.0`
python `2.7.5`

## 角色变量

	software_files_path: "/opt/software"
	software_install_path: "/usr/local"

	java_home: "/usr/java/jdk1.8"

	java_file: "jdk-8u241-linux-x64.tar.gz"
	java_file_path: "{{ software_files_path }}/{{ java_file }}"
	java_install_path: "{{ software_install_path }}/jdk1.8.0_241"

## Example Playbook

默认安装1.8.0_241版本
```yaml
- hosts: node1
  roles:
   - { role: jdk }
```
指定安装版本（需要先拷贝jdk压缩包到files，然后指定变量）
```yaml
- hosts: node1
  roles:
   - { role: jdk, java_file: "jdk-8u???-linux-x64.tar.gz", java_install_path: "{{ software_install_path }}/jdk1.8.0_???" }
``` 
