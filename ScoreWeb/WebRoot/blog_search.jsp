<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%
	//登录验证
	boolean isLogin=true;
	Integer uid=(Integer)session.getAttribute("uid");
	if(uid==null){
		isLogin=false;
	}
	
	//接收前面传输过来的参数
	String search_content=request.getParameter("search_content");
	
	//JDBC连接代码
	Connection con=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/myblog","root","root");
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
					<a href="index.jsp">首页</a>
					<a href="blog.jsp" class="current">我的博文</a>
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
					<!--导航 begin-->
					<div class="nav">
						<span>搜索关键字：<%=search_content%></span>
					</div>
					<!--导航 end-->
					
					<!--文章列表 begin-->
					<div class="ar_list_item">
						<%
						Statement st1=con.createStatement();
						String sql1="select * from mb_blog where b_title like '%java%'";
						ResultSet rs1=st1.executeQuery(sql1);
						while(rs1.next()){
							Statement st2=con.createStatement();
							String sql2="select * from mb_blog_type where type_id= "+rs1.getInt("b_typeid");
							ResultSet rs2=st2.executeQuery(sql2);
							rs2.next();
							String b_type=rs2.getString("type_name");
							rs2.close();
							st2.close();
						
						%>
						<div class="ar_title"><a href="blog_view.jsp"><%=rs1.getString("b_title")%></a></div>
						<div class="ar_desc">
							<span>浏览数【<%=rs1.getInt("b_viewnums")%>】 <%=rs1.getString("b_posttime")%></span>
							<a href="#"><%=b_type%></a>
						</div>
						<div class="ar_content">
						<%=rs1.getString("b_intro")%>
						</div>
						<%
							}
							rs1.close();
							st1.close();
						%>
					</div>
					
					
					<!--文章列表 end-->
				</div>
				<!--main-content end-->
				
				<!--main-sidebar begin-->
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
									<a href="#" class="a2">【改】</a>
									<a href="#" class="a2">【删】</a>
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