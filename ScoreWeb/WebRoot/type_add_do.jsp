<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%
	//登陆验证，未登陆不能进入
	Integer uid = (Integer)session.getAttribute("uid");
	if(uid==null){
		//response.sendRedirect("type_add.jsp");
		//return;
	}
	//设置请求编码为UTF-8
	request.setCharacterEncoding("UTF-8");
	//接收参数
	String b_title = request.getParameter("title");
	
	//判断参数是否为空
	if(b_title!=null && !"".equals(b_title)){
		//JDBC连接并操作数据库
		Connection con = null;
		Statement st = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/myblog","root","root");
			st = con.createStatement();
			String sql = "insert into mb_blog_type(type_name) value('"+b_title+"')";
			st.executeUpdate(sql);
			
			response.sendRedirect("type_add.jsp");
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			try{
				if(st!=null){
					st.close();
				}
				if(con!=null){
					con.close();
				}
			}catch(Exception ex){
				System.out.println(ex);
			}
		}
	}else{
		//参数为空，跳转到blog_edit.jsp并带上参数1表示错误信息
		response.sendRedirect("blog.jsp");
	}
%>