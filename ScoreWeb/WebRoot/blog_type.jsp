<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%
	//设置请求编码为utf-8
	request.setCharacterEncoding("UTF-8");
	//接收参数
	String type_id=request.getParameter("type_id");
	
	//登录验证
	boolean isLogin=true;
	Integer uid=(Integer)session.getAttribute("uid");
	if(uid==null){
		isLogin=false;
	}
	
	//JDBC连接代码
	Connection con=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/myblog","root","root");
		Statement st5 = con.createStatement();
		String sql5 = "select * from mb_user where user_id="+uid;
		ResultSet rs5 = st5.executeQuery(sql5);
%>

<!DOCTYPE html>
<html>
	<head>
		<!--网站标题-->
		<%
			if(isLogin){
				if(rs5.next()){
		%>
					<title><%=rs5.getString("name")%>的个人博客</title>
		<%
				}
			}
		%>
		<!--导入css-->
		<link href="css/style.css" rel="stylesheet" type="text/css" />
	</head>
	
	<body>
		<!--top begin-->
		<div class="top">
			<div class="top-box">
				<!--menu begin-->
				<div class="menu">
					<a href="index.html">首页</a>
					<a href="blog.html" class="current">我的博文</a>
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
				<div class="title"><%=rs5.getString("name")%></div>
				<div class="subtitle"><%=rs5.getString("descc")%></div>
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
				
					<!--导航 begin-->
					<div class="nav">
					<%
							Statement st1=con.createStatement();
							String sql1="select * from mb_blog_type where type_id= "+type_id;
							ResultSet rs1=st1.executeQuery(sql1);
							rs1.next();
							String b_type=rs1.getString("type_name");

					%>
						<span>当前：<%=b_type%></span>
						<a href="blog_add.jsp">【新建博文】</a>
					<%
						rs1.close();
						st1.close();
					%>
					</div>
					<!--导航 end-->
					
					<!--文章列表 begin-->
					<%
							Statement st2=con.createStatement();
							String sql2="select * from mb_blog where b_typeid= "+type_id;
							ResultSet rs2=st2.executeQuery(sql2);
							while(rs2.next()){
					%>
					<div class="ar_list_item">
						<div class="ar_title"><a href="blog_view.jsp"><%=rs2.getString("b_title")%></a></div>
						<div class="ar_desc">
							<span>浏览数</span>
							<a href="#"><%=b_type%></a>
							<a href="blog_edit.jsp">【修改博文】</a>
							<a href="#">【删除博文】</a>
						</div>
						<div class="ar_content"><%=rs2.getString("b_content")%></div>	
					
				
						
					</div>
					<%
							}
							rs2.close();
							st2.close();
					%>
					<!--文章列表 end-->
			</div>
				<!--main-content end-->
				
			<div class="main-sidebar">
					<!--博文分类 begin-->
					<div class="side_box">
						<div class="side_title">
							博文分类
							<a href="#" style="text-decoration:none;
							color:#427A24">【新建分类】</a>
						</div>
						<div class="side_list">
							<ul>
								<%
								Statement st4=con.createStatement();
								String sql4="select * from mb_blog_type";
								ResultSet rs4=st4.executeQuery(sql4);
								while(rs4.next()){
								%>
								<li>
									<a href="blog_type.jsp?type_id=<%=rs4.getInt("type_id")%>"><%=rs4.getString("type_name")%></a> 
								<a href="type_edit.jsp?type_id=<%=rs4.getInt("type_id")%>" class="a2">【改】</a>
									<a href="type_del_do.jsp?type_id=<%=rs4.getInt("type_id")%>" class="a2">【删】</a>
								</li>
						<%
								}
								rs4.close();
								st4.close();
						%>	
							</ul>
						</div>
					</div>
					<!--博文分类 end-->
					
					<!--热门博文 begin-->
					<div class="side_box">
						<div class="side_title">
							热门博文
						</div>
						<div class="side_list">
							<ul>
								<%
								Statement st3=con.createStatement();
								String sql3="select * from mb_blog order by b_viewnums ASC";
								ResultSet rs3=st3.executeQuery(sql3);
								while(rs3.next()){
								%>
							
								<li><a href="#"><%=rs3.getString("b_title")%></a></li>
								
								
								<%
									}
									rs3.close();
									st3.close();
								%>
								
							</ul>
						</div>
					</div>
					<!--热门博文 end-->
				</div>
				<!--main-sidebar end-->
				
				<div class="clear"></div>
			</div>
			<!--main-box end-->
			
			<!--main-bottom begin-->
			<div class="main-bottom">
				Copyright &copy; 2016 <%=rs5.getString("name")%>个人博客网站 All rights reserved
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