# Django搭建的个人博客系统

服务器环境：
ubuntu Linux version 3.13.0-74-generic (buildd@lcy01-07)

软件环境：
Python 2.7.9
Django 1.8.3
Mysql  5.6.0
django-contrib-comments 1.7.3
DjangoUeditor
METRONIC 前端模板

部署方法：

1. 安装 apache2 和 mod_wsgi
sudo apt-get install apache2

Python 2:
sudo apt-get install libapache2-mod-wsgi

Python 3:
sudo apt-get install libapache2-mod-wsgi-py3

2.确认安装的apache2版本号
apachectl -v

Server version: Apache/2.4.7 (Ubuntu)
Server built:   Oct 14 2015 14:20:21

3. 准备一个新网站
ubuntu的apache2配置文件在 /etc/apache2/ 下
sudo vi /etc/apache2/sites-available/sitename.conf

示例内容：
<VirtualHost *:8889>
    ServerAdmin lscuihu@126.com

    WSGIScriptAlias / /home/blog/cuihu/wsgi.py

    Alias /static/ /home/blog/static/

     <Directory /home/blog/static>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

     <Directory /home/MonkeyLogSite/clients>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    <Directory /home/blog/cuihu>
    <Files wsgi.py>
	Require all granted
    </Files>
    </Directory>
</VirtualHost>

如果你的apache版本号是 2.2.x 用下面的代替  Require all granted

1.Order deny,allow
2.Allow from all


请注意：<VirtualHost *:8889>监听8889端口，所以在apache的端口配置文件中开启监听该端口
sudo vi /etc/apache2/ports.conf
Listen 80
Listen 8889（添加这行）

4. 修改wsgi.py文件
上面的配置中写的 WSGIScriptAlias / /home/blog/cuihu/wsgi.py
就是把apache2和你的网站project联系起来了
import os
import sys

from os.path import  dirname, abspath
from django.core.wsgi import get_wsgi_application
同一台服务上部署多个django程序，需要指定settings文件
PROJECT_DIR = dirname(dirname(abspath(__file__)))
sys.path.insert(0, PROJECT_DIR)
注释掉这行os.environ.setdefault("DJANGO_SETTINGS_MODULE", "cuihu.settings")

os.environ["DJANGO_SETTINGS_MODULE"] = "cuihu.settings"
application = get_wsgi_application()
同一台服务器部署了多个django程序，一定要指定对应的settings文件，作用是让脚本找到django项目的位置，也可以在sitename.conf中做，用WSGIPythonPath,想了解的自行搜索。

5. 设置目录和文件权限
media 文件夹一般用来存放用户上传文件，static 一般用来放自己网站的js，css，图片等，在settings.py中的相关设置
STATIC_URL 为静态文件的网址 STATIC_ROOT 为静态文件的根目录，
MEDIA_URL 为用户上传文件夹的根目录，MEDIA_URL为对应的访问网址

在settings中的设置
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')

STATICFILES_DIRS = (
    os.path.join(BASE_DIR, "common_static"),
)

MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

chmod 777 /需要写权限的文件夹路径/

6. 激活新网站
sudo a2ensite sitename 或 sudo a2ensite sitename.conf
重启apache服务 service apache2 reload 或者 service apache2 restart

7.收集静态文件
python manage.py collectstatic

8.创建数据库
登录mysql控制台
root@ubuntu:~# mysql -uroot -p
Enter password: 输入数据库密码（123312123）
创建数据库
create database `cuihu` character set utf8;

同步数据表，期间会询问是否需要创建超级管理员，请自便
python manage.py syncdb

9.重启apache服务 service apache2 reload 或者 service apache2 restart


常见的部署问题:
1.	数据库版本问题
Warning: Specified key was too long; max key length is 767 byte
Mysql5.5版本上mysql varchar(255)长度限制为255,超过了会报错

解决办法：升级mysql数据库到5.6
mysql数据库从5.5升级到5.6
apt-get remove mysql-server 卸载数据库
apt-get autoremove 自动清理配置文件
apt-get upgrade 更新软件源
apt-get install mysql-server-5.6 安装新的数据库
升级前注意导出好数据，升级后导入
2.	Wsgi设置问题
mod_wsgi (pid=29373): Target WSGI script '/home/MonkeyLogSite/MonkeyLogSite/wsgi.py' cannot be loaded as Python module., referer: http://10.210.140.47:8989/
mod_wsgi (pid=29373): Exception occurred processing WSGI script '/home/MonkeyLogSite/MonkeyLogSite/wsgi.py'., referer: http://10.210.140.47:8989/

解决办法：参照步骤4修改wsgi文件
Apache错误日志查看：
cat /var/log/apache2/error.log

总结:部署时文件对应关系:
sitename.conf --> wsgi.py --> settings.py --> urls.py --> views.py
