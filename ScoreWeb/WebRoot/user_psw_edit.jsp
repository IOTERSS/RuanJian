<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%
	//登陆验证，未登陆不能进入
	Integer uid = (Integer)session.getAttribute("uid");
	if(uid==null){
		response.sendRedirect("index.jsp");
		return;
	}
	String type_id = request.getParameter("type_id");
	//JDBC连接代码
	Connection con = null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/myblog","root","root");
%>
<!DOCTYPE html>
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
					<a href="index.jsp" class="current">首页</a>
					<a href="blog.jsp">我的博文</a>
				</div>
				<!--menu end-->
				
				<!--search begin-->
				<div class="search">
					<form action="blog_search.jsp" method="post">
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
					<div class="ar_title">修改登录密码</div>
					
					
					<div class="mainform_box">
						<form action="user_psw_edit_do.jsp" method="post">
							<label>输入旧密码：</label>
							<p><input type="password" name="pass1" class="text" /></p>
							
							<label>输入新密码：</label>
							<p><input type="password" name="pass2" class="text" /></p>
							
							<label>确认新密码：</label>
							<p><input type="password" name="pass3" class="text" /></p>
							
							<p><input type="submit" value="提交" class="btn"/></p>
							<%
								String rtn = request.getParameter("rtn");
								if("1".equals(rtn)){
							%>
							<p>
								<span style="color:red">密码不能为空！</span>
							</p>
							<%
								}else if("2".equals(rtn)){
							%>
							<p>
								<span style="color:red">密码错误！</span>
							</p>
							<%
							}else if("3".equals(rtn)){
							%>
							<p>
								<span style="color:red">输入新密码不一致！</span>
							</p>
							<%
								}
							%>
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
							<form action="user_login_do.jsp" method="post">
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
<%
	}catch(Exception ex){
		System.out.println(ex);
	}finally{
		try{
			if(con!=null){
				con.close();
			}
		}catch(Exception ex){
			System.out.println(ex);
		}
	}
%>