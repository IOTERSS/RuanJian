<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%
	//登陆验证，未登陆不能进入
	Integer uid = (Integer)session.getAttribute("uid");
	if(uid==null){
		response.sendRedirect("index.jsp");
		return;
	}
	
	//设置请求编码为UTF-8
	request.setCharacterEncoding("UTF-8");
	//接收参数
	String b_id = request.getParameter("b_id");
	String b_title = request.getParameter("title");
	String b_type = request.getParameter("type");
	String b_intro = request.getParameter("intro");
	String b_content = request.getParameter("content");
	
	//判断参数是否为空
	if(b_title!=null && !"".equals(b_title) && b_type!=null && !"".equals(b_type)
		&& b_intro!=null && !"".equals(b_intro) && b_content!=null 
		&& !"".equals(b_content) && b_id!=null && !"".equals(b_id)){
		//JDBC连接并操作数据库
		Connection con = null;
		Statement st = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/myblog","root","root");
			st = con.createStatement();
			String sql = "update mb_blog set b_title='"+b_title+"', b_typeid="+b_type+", b_intro='"+b_intro+"', b_content='"+b_content+"' where b_id="+b_id;
			st.executeUpdate(sql);
			
			response.sendRedirect("blog.jsp");
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
		response.sendRedirect("blog_edit.jsp?rtn=1&b_id="+b_id);
	}
%>