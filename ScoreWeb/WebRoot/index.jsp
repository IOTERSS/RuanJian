<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%
	//登陆验证
	boolean isLogin = true;
	Integer uid = (Integer)session.getAttribute("uid");            
	if(uid==null){
		isLogin = false;
	}
	//JDBC连接代码
	Connection con = null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/myblog","root","root");
		Statement st1 = con.createStatement();
		String sql1 = "select * from mb_user where user_id="+uid;
		ResultSet rs1 = st1.executeQuery(sql1);
		
%>
<!DOCTYPE html>
<html>
	<head>
		<!--网站标题-->
		<%
			if(isLogin){
				if(rs1.next()){
		%>
					<title><%=rs1.getString("name")%>的个人博客</title>
		<%
				}
			}
		%>
		<title>个人博客</title>
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
		<%
			if(isLogin){
				rs1.beforeFirst();

				if(rs1.next()){
		%>
		<div class="head">
			<div class="head-top">
				<div class="title"><%=rs1.getString("name")%></div>
				<div class="subtitle"><%=rs1.getString("descc")%></div>
			</div>
			<div class="head-bottom">
			
			</div>
		</div>
		<%
				}
			}else{
		%>
		<div class="head">
			<div class="head-top">
				<div class="title">博主</div>
				<div class="subtitle">博主简介</div>
			</div>
			<div class="head-bottom">
			
			</div>
		</div>
			<%
				}
			%>
		<!--head end-->
		
		<!--main begin-->
		<div class="main">
			<!--main-box begin-->
			<div class="main-box">
				<!--main-content begin-->
				<%
			if(isLogin){
				rs1.beforeFirst();
				if(rs1.next()){
			%>
				<div class="main-content">
				<div class="ar_title">博主介绍</div>
				<div class="ar_content"><%=rs1.getString("intro")%></div>
				</div>
			<%
				}
			}else{
			%>
				<div class="main-content">
					<div class="ar_title">博主介绍</div>
					<div class="ar_content">
					博主就是博客的主人，就像论坛发帖的楼主一样。
					此词是从博客中衍生出来的，最开始是从人们对博客的误解中生硬的分化出来。
					博主是指写博客的人，而博客有两种含义：一种是指发布博文日志的地方，
					另一种是指博客的性质，即网络出版，也可以说是“非纸质性出版”。
					从与网站的区别来看，博客只能算得上是一种网页，即一种专门以此为专业或
					职业性性质的固定站点...
					</div>
				</div>
			<%
				}
			%>
				<!--main-content end-->
				
				<!--main-sidebar begin-->
				<div class="main-sidebar">
					<%
						//Integer uid = (Integer)session.getAttribute("uid");          //获取当前会话中的一个属性
						if(uid==null){
					%>
					<!--博主登录 begin-->
					<div class="side_box">
						<div class="side_title">博主登录</div>
						<div class="login_box">
							<form action="user_login_do.jsp" method="post">
								<label>用户名：</label>
								<input type="text" name="username" class="text"/>
								<br/>
								<label>密 &nbsp;码：</label>
								<input type="password" name="userpass" class="text"/>
								<br/>
								<input type="submit" value="登录" class="btn"/>
								<input type="reset" value="重置" class="btn"/>
								<%
									String rtn = request.getParameter("rtn");
									if("1".equals(rtn)){
								%>
								<p>
									<span style="color:red">用户名和密码不能为空！</span>
								</p>
								<%
									}else if("2".equals(rtn)){
								%>
								<p>
									<span style="color:red">用户名或密码错误！</span>
								</p>
								<%
									}
								%>
							</form>
						</div>
					</div>
					<!--博主登录 end-->
					<%
						}else{
					%>
					<!--用户中心 begin-->
					<%	
						rs1.beforeFirst();
						if(rs1.next()){
					%>
					<div class="side_box">
						<div class="side_title">用户中心</div>
						<div class="ucenter_box">
						<p>博主<%=rs1.getString("name")%>，欢迎您登录！</p>
						<p><a href="user_info_edit.jsp">个人资料修改</a></p>
						<p><a href="user_psw_edit.jsp?uid=<%=uid%>">登录密码修改</a></p>
						<p><a href="blog.jsp">博文管理</a></p>	
						<p><a href="user_logout_do.jsp">退出</a></p>
						</div>
					</div>
					<%
						}
					}
					%>
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
			
			
			<%
				if(isLogin){
					rs1.beforeFirst();
					if(rs1.next()){
			%>
				<div class="main-bottom">
				Copyright &copy; 2016 <%=rs1.getString("name")%>个人博客网站 All rights reserved
				</div>
			<%
					}
				}else{
			%>
				<div class="main-bottom">
				Copyright &copy; 2016 个人博客网站 All rights reserved
				</div>
				<%
				}
				%>
			<!--main-bottom end-->
		</div>
		<!--main end-->
	</body>
</html>
<%
	st1.close();
	rs1.close();
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