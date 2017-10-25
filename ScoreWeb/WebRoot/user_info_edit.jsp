﻿<!DOCTYPE html>
<html>
	<head>
		<!--网站标题-->
		<title>李远念的个人博客</title>
		<!--导入css-->
		<link href="css/style.css" rel="stylesheet" type="text/css" />
	</head>
	
	<body>
		<!--top begin-->
		<div class="top">
			<div class="top-box">
				<!--menu begin-->
				<div class="menu">
					<a href="index.html" class="current">首页</a>
					<a href="blog.html">我的博文</a>
				</div>
				<!--menu end-->
				
				<!--search begin-->
				<div class="search">
					<form action="#" method="post">
						<input type="text" name="search_content" class="text"/>
						<input type="submit" value="搜索" class="btn"/>
					</form>
				</div>
				<!--search end-->
			</div>
		</div>
		<!--top end-->
		
		<!--head begin-->
		<div class="head">
			<div class="head-top">
				<div class="title">李远念</div>
				<div class="subtitle">广州海阁信息科技有限公司 海阁软件学院 首席讲师 CEO</div>
			</div>
			<div class="head-bottom">
			
			</div>
		</div>
		<!--head end-->
		
		<!--main begin-->
		<div class="main">
			<!--main-box begin-->
			<div class="main-box">
				<!--main-content begin-->
				<div class="main-content">
					<!--mainform begin-->
					<div class="ar_title">修改个人资料</div>
					
					<div class="mainform_box">
						<form action="user_info_edit_do.jsp" method="post">
							<label>姓名：</label>
							<p><input type="text" name="name" class="text" 
							value="李远念"/></p>
							
							<label>简介：</label>
							<p><input type="text" name="desc" class="text"
							value="广州海阁信息科技有限公司 海阁软件学院 首席讲师 CEO"/></p>
							
							<label>博主介绍：</label>
							<p><textarea name="intro" class="textarea2">博主就是博客的主人，就像论坛发帖的楼主一样。 此词是从博客中衍生出来的，最开始是从人们对博客的误解中生硬的分化出来。 博主是指写博客的人，而博客有两种含义：一种是指发布博文日志的地方， 另一种是指博客的性质，即网络出版，也可以说是“非纸质性出版”。 从与网站的区别来看，博客只能算得上是一种网页，即一种专门以此为专业或 职业性性质的固定站点...</textarea></p>
							
							<p><input type="submit" value="提交" class="btn"/></p>
						</form>
					</div>
					<!--mainform end-->
				</div>
				<!--main-content end-->
				
				<!--main-sidebar begin-->
				<div class="main-sidebar">
					<!--博主登录 begin-->
					<div class="side_box">
						<div class="side_title">博主登录</div>
						<div class="login_box">
							<form action="#" method="post">
								<label>用户名：</label>
								<input type="text" name="username" class="text"/>
								<br/>
								<label>密&nbsp;码：</label>
								<input type="password" name="userpass" class="text"/>
								<br/>
								<input type="submit" value="登录" class="btn"/>
								<input type="reset" value="重置" class="btn"/>
							</form>
						</div>
					</div>
					<!--博主登录 end-->
					
					<!--用户中心 begin-->
					<div class="side_box">
						<div class="side_title">用户中心</div>
						<div class="ucenter_box">
							<p>博主李远念，欢迎您登录！</p>
							<p><a href="user_info_edit.html">个人资料修改</a></p>
							<p><a href="user_psw_edit.html">登录密码修改</a></p>
							<p><a href="blog.html">博文管理</a></p>				
						</div>
					</div>
					<!--用户中心 end-->
					
					<!--形象墙 begin-->
					<div class="side_box">
						<div class="side_title">形象墙</div>
						<div class="imagewall_box">
							<img src="images/img05.png" />
						</div>
					</div>
					<!--形象墙 end-->
				</div>
				<!--main-sidebar end-->
				
				<div class="clear"></div>
			</div>
			<!--main-box end-->
			
			<!--main-bottom begin-->
			<div class="main-bottom">
				Copyright &copy; 2015 李远念个人博客网站 All rights reserved
			</div>
			<!--main-bottom end-->
		</div>
		<!--main end-->
	</body>
</html>