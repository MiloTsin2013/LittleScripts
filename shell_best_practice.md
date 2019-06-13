检查端口
1. 使用telnet命令
```bash
# 检查本机到其他机器指定端口的连通性
echo '' | telnet 10.26.196.47 80
# 登录到指定机器并检查该机器到其他机器指定端口的连通性
ssh test@10.12.4.26 "echo '' | telnet 10.26.196.47 80"
```
2. 使用nc命令
```bash
# 检查本机到其他机器指定端口的连通性
nc -w 5 10.26.196.47 80
# 登录到指定机器并检查该机器到其他机器指定端口的连通性
ssh test@10.12.4.26 "nc -w 5 10.26.196.47 80"
```
对比Telnet和NC命令，nc命令功能强大，可指定超时时间等；Telnet命令的缺点是不能主动处理超时，只能被动等待。

获取文件、文件夹的绝对路径
使用`readlink`命令来获取绝对路径
```bash
[root@dev test]# readlink -f dwz/index.html
/media/sf_wwwroot/test/dwz/index.html
[root@dev test]# dirname `readlink -f dwz/index.html`
/media/sf_wwwroot/test/dwz
[root@dev test]# dirname $(readlink -f dwz/index.html)
/media/sf_wwwroot/test/dwz
[root@dev test]# dirname $(readlink -f dwz/../../yii/index.php)
/media/sf_wwwroot/yii
```
