DROP DATABASE IF EXISTS `myblog`;
CREATE DATABASE `myblog`;
USE `myblog`;

CREATE TABLE `mb_blog` (
  `b_id` int(11) NOT NULL auto_increment COMMENT '博客编号',
  `b_typeid` int(11) NOT NULL default '0' COMMENT '分类编号',
  `b_title` varchar(100) NOT NULL default '' COMMENT '博客标题',
  `b_intro` varchar(500) default '' COMMENT '博客摘要（显示在列表页面）',
  `b_content` text NOT NULL COMMENT '博客内容',
  `b_posttime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '发布时间',
  `b_viewnums` int(11) NOT NULL default '0' COMMENT '浏览数',
  PRIMARY KEY  (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博客表';
INSERT INTO `mb_blog` VALUES (1,3,'15个前卫的 HTML5 & CSS3 网页设计作品','今天，我们编译收集一组使用 HTML5 和 CSS3 制作的精美网站。在此集合中，你可以看到平面设计，网页设计，作品集和企业网站设计实例。响应式设计和基于 HTML5 & CSS3 编码的网站是为网站制作的理想解决方案。 HTML5 & CSS3 制作出来的网站结构良好，有很多惊人的效果，并能够在任...','今天，我们编译收集一组使用 HTML5 和 CSS3 制作的精美网站。在此集合中，你可以看到平面设计，网页设计，作品集和企业网站设计实例。响应式设计和基于 HTML5 & CSS3 编码的网站是为网站制作的理想解决方案。 HTML5 & CSS3 制作出来的网站结构良好，有很多惊人的效果，并能够在任...','2014-07-28 15:01:20',0);
INSERT INTO `mb_blog` VALUES (2,3,'HTML元素基础学习','HTML元素 HTML文档是由HTML元素定义的。HTML元素是指从start tag（opening tag）到end tag（closing tag）的所有代码，即start tag + content + end tag。HTML有start tag开始，由end tag结束。对于某些元素为....','HTML元素 HTML文档是由HTML元素定义的。HTML元素是指从start tag（opening tag）到end tag（closing tag）的所有代码，即start tag + content + end tag。HTML有start tag开始，由end tag结束。对于某些元素为....','2014-07-28 15:02:03',0);
INSERT INTO `mb_blog` VALUES (3,3,'Javascript基础——初识Javascript','每一门语言的学习都是从HelloWorld开始的，我今天也遵循这个原则吧！先上一段代码，认识一下javascript初识javascript这是一个很简单的程序，打开页面会调用alert方法，弹出一个提示框这个方法虽然很简单但在你学习javascript的路上会陪你走很长一段时间。因为这是javas...','每一门语言的学习都是从HelloWorld开始的，我今天也遵循这个原则吧！先上一段代码，认识一下javascript初识javascript这是一个很简单的程序，打开页面会调用alert方法，弹出一个提示框这个方法虽然很简单但在你学习javascript的路上会陪你走很长一段时间。因为这是javas...','2014-07-28 15:02:29',0);

CREATE TABLE `mb_blog_type` (
  `type_id` int(11) NOT NULL auto_increment COMMENT '分类编号',
  `type_name` varchar(30) NOT NULL default '' COMMENT '分类名称',
  PRIMARY KEY  (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博客分类表';
INSERT INTO `mb_blog_type` VALUES (1,'Java基础');
INSERT INTO `mb_blog_type` VALUES (2,'Java GUI');
INSERT INTO `mb_blog_type` VALUES (3,'Java Web基础');
INSERT INTO `mb_blog_type` VALUES (4,'Java Web进阶');
INSERT INTO `mb_blog_type` VALUES (5,'架构分层');

CREATE TABLE `mb_user` (
  `user_id` int(11) NOT NULL auto_increment COMMENT '用户编号',
  `username` varchar(100) NOT NULL COMMENT '登陆用户名',
  `password` varchar(100) NOT NULL COMMENT '登陆密码',
  `name` varchar(100) default '' COMMENT '姓名',
  `desc` varchar(100) default NULL COMMENT '简介',
  `intro` text COMMENT '博主个人介绍',
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表（暂时只有博主一个用户）';
INSERT INTO `mb_user` VALUES (1,'admin','admin123','李远念','广州海阁信息科技有限公司 海阁软件学院 首席讲师 CEO','李远念，广州海阁信息科技有限公司创始人、CEO，海阁软件学院首席讲师，多年的开发与IT教育经验，专注于培养IT精英人才……');