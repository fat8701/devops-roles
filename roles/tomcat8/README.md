# Ansible Role: Tomcat8

安装tomcat8应用
官方包下载地址: https://archive.apache.org/dist/tomcat/tomcat-8

## 要求

此角色仅在centos7、ubuntu18.04完成测试。

## 测试环境

ansible `2.8.8`
awx `5.0.0`
python `2.7.5`

## 角色变量
    
		software_files_path: "/opt/software"
		software_install_path: "/usr/local"

		java_home: "{{ ansible_env.JAVA_HOME | default('/usr/java/jdk1.8') }}"
		tomcat_version: "8.5.51"
		tomcat_file: "apache-tomcat-{{ tomcat_version }}.tar.gz"
		tomcat_path: "{{ software_install_path }}/apache-tomcat-{{ tomcat_version }}"
		tomcat_file_path: "{{ software_files_path }}/{{ tomcat_file }}"
		tomcat_file_url: "https://archive.apache.org/dist/tomcat/tomcat-8/v{{ tomcat_version }}/bin/apache-tomcat-{{ tomcat_version }}.tar.gz"
		tomcat_heap_mx: "1G"
		tomcat_heap_newsize: "256m"
		tomcat_heap_premsize: "256m"
		tomcat_catalina_opts: "-server -Xms1G -Xmx1G -Xmn256m -Dfile.encoding=UTF-8 -Dsun.jnu.encoding=UTF-8 -Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom -XX:MetaspaceSize=256M -XX:MaxMetaspaceSize=256M -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:+HeapDumpOnOutOfMemoryError -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCDateStamps -Xloggc:{{ tomcat_work_path }}/logs/heap_trace.txt -XX:CMSInitiatingOccupancyFraction=75 -XX:+UseCMSInitiatingOccupancyOnly -XX:-HeapDumpOnOutOfMemoryError -XX:HeapDumpPath={{ tomcat_work_path }}/logs/HeapDumpOnOutOfMemoryError"

		gcc_install_redhat:
				- gcc
				- gcc-c++
				- libtool
				- make
				- libcap-devel
				- expat-devel

		gcc_install_debian:
				- gcc
				- libtool
				- make
				- libcap-dev
				- libexpat1-dev

		tomcat_enabled: true
		tomcat_server_active: false
		tomcat_ajp_active: false
		tomcat_hostname: localhost
		tomcat_user: tomcat
		tomcat_server_port: 8005
		tomcat_catalina_port: 8080
		tomcat_catalina_ajp_port: 8009
		tomcat_catalina_redirect_port: 8443
		tomcat_unpackWARs: true
		tomcat_autoDeploy: true

		tomcat_services_name: "tomcat{% if tomcat_catalina_port != 8080 %}{{ tomcat_catalina_port }}{% endif %}"

		tomcat_work_path: "{{ software_install_path }}/{{ tomcat_services_name }}"
		commons_daemon_native_packages: "commons-daemon-native.tar.gz"
		tomcat_native_packages: "tomcat-native.tar.gz"

		tomcat_apr: false
		tomcat_clear_webapps: true

    
## 依赖

java


## Example Playbook
   
默认安装v8.5.51
```yaml
- hosts: all
  roles: 
   - { role: tomcat8 }
```   
指定安装版本
```yaml
- hosts: all
  roles: 
   - { role: tomcat8, tomcat_version: "8.5.53" }
```
	
## 使用

```
systemctl start tomcat
systemctl status tomcat
systemctl stop tomcat
```
