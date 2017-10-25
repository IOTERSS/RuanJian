<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%
	//设置请求编码为UTF-8
	request.setCharacterEncoding("UTF-8");  
	//接收参数
	String pass1 = request.getParameter("pass1");     
	String pass2 = request.getParameter("pass2");
	String pass3 = request.getParameter("pass3");
	//判断参数是否为空
	Integer uid = (Integer)session.getAttribute("uid");
	if(pass1!=null && pass2!=null  && pass3!=null                     
	&& !"".equals(pass1) && !"".equals(pass2) && !"".equals(pass3)){
		//JDBC连接并操作数据库
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/myblog","root","root");
			st = con.createStatement();
			String sql = "select * from mb_user where user_id="+uid+" and password='"+pass1+"'";
			rs = st.executeQuery(sql);
			
			if(!rs.next()){
				
				response.sendRedirect("user_psw_edit.jsp?rtn=2");          
			}else if(!pass2.equals(pass3)){
				response.sendRedirect("user_psw_edit.jsp?rtn=3");  
			}else{
				
				Statement st1 = con.createStatement();;
				
				String sql2 = "update mb_user set password='"+pass3+"' where user_id="+uid;
				st1.execute(sql2);
				session.setAttribute("uid",rs.getInt("user_id"));    
				
				response.sendRedirect("index.jsp"); 				
				st1.close();
			}
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			try{
				if(rs!=null){
					rs.close();
				}
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
		//参数为空，跳转到index.jsp并带上参数1表示错误信息
		response.sendRedirect("user_psw_edit.jsp?rtn=1");
	}
%>