<p>
    # Django<span style="font-family: 宋体">搭建的个人博客系统</span>
</p>
<p>
    &nbsp;
</p>
<p>
    <strong><span style="font-size:21px;font-family:宋体">服务器环境：</span></strong>
</p>
<p>
    ubuntu Linux version 3.13.0-74-generic (buildd@lcy01-07)
</p>
<p>
    &nbsp;
</p>
<p>
    <strong><span style="font-size:21px;font-family:宋体">软件环境：</span></strong>
</p>
<p>
    Python 2.7.9
</p>
<p>
    Django 1.8.3
</p>
<p>
    Mysql&nbsp; 5.6.0
</p>
<p>
    django-contrib-comments 1.7.3
</p>
<p>
    DjangoUeditor
</p>
<p>
    METRONIC <span style="font-family: 宋体">前端模板</span>
</p>
<p>
    &nbsp;
</p>
<p>
    <strong><span style="font-size:21px;font-family:宋体">部署方法：</span></strong>
</p>
<p>
    &nbsp;
</p>
<p>
    <span style="font-size:19px">1. </span><span style="font-size:19px;font-family:宋体">安装</span><span style="font-size:19px"> apache2 </span><span style="font-size: 19px;font-family:宋体">和</span><span style="font-size:19px"> mod_wsgi</span>
</p>
<p>
    sudo apt-get install apache2
</p>
<p>
    &nbsp;
</p>
<p>
    # Python 2
</p>
<p>
    sudo apt-get install libapache2-mod-wsgi
</p>
<p>
    &nbsp;
</p>
<p>
    # Python 3
</p>
<p>
    sudo apt-get install libapache2-mod-wsgi-py3
</p>
<p>
    &nbsp;
</p>
<p>
    <span style="font-size:19px">2.</span><span style="font-size:19px;font-family:宋体">确认安装的</span><span style="font-size:19px">apache2</span><span style="font-size:19px;font-family:宋体">版本号</span>
</p>
<p>
    apachectl -v
</p>
<p>
    &nbsp;
</p>
<p>
    Server version: Apache/2.4.7 (Ubuntu)
</p>
<p>
    Server built:&nbsp;&nbsp; Oct 14 2015 14:20:21
</p>
<p>
    &nbsp;
</p>
<p>
    <span style="font-size:19px">3. </span><span style="font-size:19px;font-family:宋体">准备一个新网站</span>
</p>
<p>
    ubuntu<span style="font-family:宋体">的</span>apache2<span style="font-family:宋体">配置文件在</span> /etc/apache2/ <span style="font-family:宋体">下</span>
</p>
<p>
    sudo vi /etc/apache2/sites-available/sitename.conf
</p>
<p>
    &nbsp;
</p>
<p>
    <span style="font-family:宋体">示例内容：</span>
</p>
<p>
    &lt;VirtualHost *:8889&gt;
</p>
<p>
    &nbsp;&nbsp;&nbsp; ServerAdmin lscuihu@126.com
</p>
<p>
    &nbsp;
</p>
<p>
    &nbsp;&nbsp;&nbsp; WSGIScriptAlias / /home/blog/cuihu/wsgi.py
</p>
<p>
    &nbsp;
</p>
<p>
    &nbsp;&nbsp;&nbsp; Alias /static/ /home/blog/static/
</p>
<p>
    &nbsp;
</p>
<p>
    &nbsp;&nbsp;&nbsp;&nbsp; &lt;Directory /home/blog/static&gt;
</p>
<p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Options Indexes FollowSymLinks
</p>
<p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AllowOverride All
</p>
<p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Require all granted
</p>
<p>
    &nbsp;&nbsp;&nbsp; &lt;/Directory&gt;
</p>
<p>
    &nbsp;
</p>
<p>
    &nbsp;&nbsp;&nbsp;&nbsp; &lt;Directory /home/MonkeyLogSite/clients&gt;
</p>
<p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Options Indexes FollowSymLinks
</p>
<p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AllowOverride All
</p>
<p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Require all granted
</p>
<p>
    &nbsp;&nbsp;&nbsp; &lt;/Directory&gt;
</p>
<p>
    &nbsp;
</p>
<p>
    &nbsp;&nbsp;&nbsp; &lt;Directory /home/blog/cuihu&gt;
</p>
<p>
    &nbsp;&nbsp;&nbsp; &lt;Files wsgi.py&gt;
</p>
<p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Require all granted
</p>
<p>
    &nbsp;&nbsp;&nbsp; &lt;/Files&gt;
</p>
<p>
    &nbsp;&nbsp;&nbsp; &lt;/Directory&gt;
</p>
<p>
    &lt;/VirtualHost&gt;
</p>
<p>
    &nbsp;
</p>
<p>
    <span style="font-family:宋体;color:red">如果你的</span><span style="color:red">apache</span><span style="font-family:宋体;color:red">版本号是</span><span style="color:red"> 2.2.x </span><span style="font-family:宋体;color:red">用下面的代替</span><span style="color:red">&nbsp; Require all granted</span>
</p>
<p>
    &nbsp;
</p>
<p>
    1.Order deny,allow
</p>
<p>
    2.Allow from all
</p>
<p>
    &nbsp;
</p>
<p>
    &nbsp;
</p>
<p>
    <span style="font-family:宋体;color:red">请注意：</span><span style="color:red">&lt;VirtualHost *:8889&gt;</span><span style="font-family:宋体;color:red">监听</span><span style="color:red">8889</span><span style="font-family:宋体;color:red">端口，所以在</span><span style="color:red">apache</span><span style="font-family:宋体;color:red">的端口配置文件中开启监听该端口</span>
</p>
<p>
    sudo vi /etc/apache2/ports.conf
</p>
<p>
    Listen 80
</p>
<p>
    Listen 8889<span style="font-family: 宋体">（添加这行）</span>
</p>
<p>
    &nbsp;
</p>
<p>
    <span style="font-size:19px">4. </span><span style="font-size:19px;font-family:宋体">修改</span><span style="font-size:19px">wsgi.py</span><span style="font-size:19px;font-family:宋体">文件</span>
</p>
<p>
    <span style="font-family:宋体">上面的配置中写的</span> WSGIScriptAlias / /home/blog/cuihu/wsgi.py
</p>
<p>
    <span style="font-family:宋体">就是把</span>apache2<span style="font-family:宋体">和你的网站</span>project<span style="font-family:宋体">联系起来了</span>
</p>
<p>
    import os
</p>
<p>
    import sys
</p>
<p>
    &nbsp;
</p>
<p>
    from os.path import &nbsp;dirname, abspath
</p>
<p>
    from django.core.wsgi import get_wsgi_application
</p>
<p>
    &nbsp;
</p>
<p>
    <span style="font-family:宋体;color:red">同一台服务上部署多个</span><span style="color:red">django</span><span style="font-family:宋体;color:red">程序，需要指定</span><span style="color:red">settings</span><span style="font-family:宋体;color:red">文件</span>
</p>
<p>
    PROJECT_DIR = dirname(dirname(abspath(__file__)))
</p>
<p>
    sys.path.insert(0, PROJECT_DIR)
</p>
<p>
    #os.environ.setdefault(&quot;DJANGO_SETTINGS_MODULE&quot;, &quot;cuihu.settings&quot;)
</p>
<p>
    &nbsp;
</p>
<p>
    os.environ[&quot;DJANGO_SETTINGS_MODULE&quot;] = &quot;cuihu.settings&quot;
</p>
<p>
    application = get_wsgi_application()
</p>
<p>
    <span style="font-family:宋体">同一台服务器部署了多个</span>django<span style="font-family:宋体">程序，一定要指定对应的</span>settings<span style="font-family:宋体">文件，作用是让脚本找到</span>django<span style="font-family:宋体">项目的位置，也可以在</span>sitename.conf<span style="font-family:宋体">中做，用</span>WSGIPythonPath,<span style="font-family:宋体">想了解的自行搜索。</span>
</p>
<p>
    &nbsp;
</p>
<p>
    <span style="font-size:19px">5. </span><span style="font-size:19px;font-family:宋体">设置目录和文件权限</span>
</p>
<p>
    media <span style="font-family:宋体">文件夹一般用来存放用户上传文件，</span>static <span style="font-family:宋体">一般用来放自己网站的</span>js<span style="font-family:宋体">，</span>css<span style="font-family:宋体">，图片等，在</span>settings.py<span style="font-family:宋体">中的相关设置</span>
</p>
<p>
    STATIC_URL <span style="font-family: 宋体">为静态文件的网址</span> STATIC_ROOT <span style="font-family:宋体">为静态文件的根目录，</span>
</p>
<p>
    MEDIA_URL <span style="font-family: 宋体">为用户上传文件夹的根目录，</span>MEDIA_URL<span style="font-family:宋体">为对应的访问网址</span>
</p>
<p>
    &nbsp;
</p>
<p>
    <span style="font-family:宋体">在</span>settings<span style="font-family:宋体">中的设置</span>
</p>
<p>
    # Static files (CSS, JavaScript, Images)
</p>
<p>
    # https://docs.djangoproject.com/en/1.8/howto/static-files/
</p>
<p>
    STATIC_URL = &#39;/static/&#39;
</p>
<p>
    STATIC_ROOT = os.path.join(BASE_DIR, &#39;static&#39;)
</p>
<p>
    &nbsp;
</p>
<p>
    # <span style="font-family:宋体">公共的</span> static <span style="font-family:宋体">文件，比如</span> jquery.js <span style="font-family:宋体">可以放这里，这里面的文件夹不能包含</span> STATIC_ROOT
</p>
<p>
    STATICFILES_DIRS = (
</p>
<p>
    &nbsp;&nbsp;&nbsp; os.path.join(BASE_DIR, &quot;common_static&quot;),
</p>
<p>
    )
</p>
<p>
    &nbsp;
</p>
<p>
    # upload folder
</p>
<p>
    MEDIA_URL = &#39;/media/&#39;
</p>
<p>
    MEDIA_ROOT = os.path.join(BASE_DIR, &#39;media&#39;)
</p>
<p>
    &nbsp;
</p>
<p>
    &nbsp;
</p>
<p>
    chmod 777 /<span style="font-family: 宋体">需要写权限的文件夹路径</span>/
</p>
<p>
    &nbsp;
</p>
<p>
    <span style="font-size:19px">6. </span><span style="font-size:19px;font-family:宋体">激活新网站</span>
</p>
<p>
    sudo a2ensite sitename <span style="font-family:宋体">或</span> sudo a2ensite sitename.conf
</p>
<p>
    <span style="font-family:宋体">重启</span>apache<span style="font-family:宋体">服务</span> service apache2 reload <span style="font-family:宋体">或者</span> service apache2 restart
</p>
<p>
    &nbsp;
</p>
<p>
    <span style="font-size:19px">7.</span><span style="font-size:19px;font-family:宋体">收集静态文件</span>
</p>
<p>
    python manage.py collectstatic
</p>
<p>
    &nbsp;
</p>
<p>
    <span style="font-size:19px">8.</span><span style="font-size:19px;font-family:宋体">创建数据库</span>
</p>
<p>
    <span style="font-family:宋体">登录</span>mysql<span style="font-family:宋体">控制台</span>
</p>
<p>
    root@ubuntu:~# mysql -uroot -p
</p>
<p>
    Enter password: <span style="font-family:宋体">输入数据库密码（</span>123312123<span style="font-family:宋体">）</span>
</p>
<p>
    <span style="font-family:宋体">创建数据库</span>
</p>
<p>
    create database `cuihu` character set utf8;
</p>
<p>
    &nbsp;
</p>
<p>
    <span style="font-family:宋体">同步数据表，期间会询问是否需要创建超级管理员，请自便</span>
</p>
<p>
    python manage.py syncdb
</p>
<p>
    &nbsp;
</p>
<p>
    <span style="font-size:19px">9.</span><span style="font-size:19px;font-family:宋体">重启</span><span style="font-size:19px">apache</span><span style="font-size:19px;font-family:宋体">服务</span><span style="font-size:19px"> service apache2 reload </span><span style="font-size: 19px;font-family:宋体">或者</span><span style="font-size:19px"> service apache2 restart</span>
</p>
<p>
    <span style="font-size:19px">&nbsp;</span>
</p>
<p>
    <span style="font-size:19px;font-family:宋体">常见的部署问题</span><span style="font-size:19px">:</span>
</p>
<p class="MsoListParagraph" style="margin-left:28px">
    <span style="font-size:19px">1.<span style="font-variant-numeric: normal;font-stretch: normal;font-size: 9px;line-height: normal;font-family: &#39;Times New Roman&#39;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="font-size:19px;font-family:宋体">数据库版本问题</span>
</p>
<p>
    Warning: Specified key was too long; max key length is 767 byte
</p>
<p>
    Mysql5.5<span style="font-family: 宋体">版本上</span>mysql varchar(255)<span style="font-family:宋体">长度限制为</span>255,<span style="font-family:宋体">超过了会报错</span>
</p>
<p>
    &nbsp;
</p>
<p>
    <span style="font-family:宋体">解决办法：升级</span>mysql<span style="font-family:宋体">数据库到</span>5.6
</p>
<p>
    mysql<span style="font-family:宋体">数据库从</span>5.5<span style="font-family:宋体">升级到</span>5.6
</p>
<p>
    apt-get remove mysql-server <span style="font-family:宋体">卸载数据库</span>
</p>
<p>
    apt-get autoremove <span style="font-family:宋体">自动清理配置文件</span>
</p>
<p>
    apt-get upgrade <span style="font-family:宋体">更新软件源</span>
</p>
<p>
    apt-get install mysql-server-5.6 <span style="font-family:宋体">安装新的数据库</span>
</p>
<p>
    <span style="font-family:宋体">升级前注意导出好数据，升级后导入</span>
</p>
<p class="MsoListParagraph" style="margin-left:28px">
    <span style="font-size:19px">2.<span style="font-variant-numeric: normal;font-stretch: normal;font-size: 9px;line-height: normal;font-family: &#39;Times New Roman&#39;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="font-size:19px">Wsgi</span><span style="font-size:19px;font-family:宋体">设置问题</span>
</p>
<p>
    mod_wsgi (pid=29373): Target WSGI script &#39;/home/MonkeyLogSite/MonkeyLogSite/wsgi.py&#39; cannot be loaded as Python module., referer: http://10.210.140.47:8989/
</p>
<p>
    mod_wsgi (pid=29373): Exception occurred processing WSGI script &#39;/home/MonkeyLogSite/MonkeyLogSite/wsgi.py&#39;., referer: <a href="http://10.210.140.47:8989/">http://10.210.140.47:8989/</a>
</p>
<p>
    &nbsp;
</p>
<p>
    <span style="font-family:宋体">解决办法：参照步骤</span>4<span style="font-family:宋体">修改</span>wsgi<span style="font-family:宋体">文件</span>
</p>
<p class="MsoListParagraph" style="margin-left:28px">
    <span style="font-size:19px">3.<span style="font-variant-numeric: normal;font-stretch: normal;font-size: 9px;line-height: normal;font-family: &#39;Times New Roman&#39;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="font-size:19px">Apache</span><span style="font-size:19px;font-family:宋体">错误日志查看：</span>
</p>
<p>
    cat /var/log/apache2/error.log
</p>
<p>
    <br/>
</p>