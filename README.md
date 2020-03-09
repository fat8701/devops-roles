# Devops自动化部署

## Ansible

Roles文件夹下是所有的ansible角色

## 版本

ansible `2.8.8`
awx `5.0.0`
python `2.7.5`

## 使用
具体的使用方法见各角色的Readme说明文件

### 执行单个角色

执行角色名.yml文件即可;
如安装docker：
```shell
ansible-playbook -i inventory_file docker.yml
```

### 执行多个角色
执行site.yml文件，同时指定roles_name变量；
如需要安装docker和jdk：
```shell
ansible-playbook -i inventory_file site.yml -e "@xxx.yml"或"@xxx.json"
```
```yaml
xxx.yml
roles_name:
   - jdk
   - docker
```
```json
xxx.json
roles_name: ["jdk","docker"]
```

### 进阶用法
```yaml
xxx.yml
roles_name:
   - role: jdk
   - role: docker
     docker_ce_version: "18.09.2"
---
roles_name:
   - { role: jdk }
   - { role: docker, docker_ce_version: "18.09.2" }
```
        
