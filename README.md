## 基于WHO PEN干预的慢性病管理信息系统
 本项目为本人2015年帮医学院学生做的毕业设计，只有普通的增删改查功能，功能简单莫怪，有需要的同学尽管拿去，别忘了star就行，嘿嘿~~

 
## 开发说明
本项目为简单的javaWeb项目，需要二次开发的同学自行修改即可。

技术栈：sevlet+jsp+mysql

我当时用的开发工具是myEclipse。开发时，别忘了修改数据库配置src/database.properties

## 预览说明
>webRoot->WEB-INF文件夹下有编译后的class文件，可以直接拿来webRoot运行看效果

## 预览步骤

1、在mysql数据库中运行文件下的 "sql.text" 建表（已提供测试数据）

2、更改数据库配置: cdc\WEB-INF\classes\database.properties

3、在tomcat的webapps中，新建一个cdc文件夹（最终访问路径的名称）

4、将cdc\WebRoot下的所有文件，复制到webapps\cdc下

5、开启tomcat，点击 tomcat\bin\startup.bat

## 论文查看

知网地址

http://cdmd.cnki.com.cn/Article/CDMD-10752-1015964205.htm

>注：论文作者不是本人

