<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%
	//设置请求编码为utf-8
	request.setCharacterEncoding("utf-8");
	//接收参数
	String username=request.getParameter("username");
	System.out.println(username);
	String userpass=request.getParameter("userpass");
	System.out.println(userpass);
	
	//判断参数是否为空
	if(username!=null&& userpass!=null&&!"".equals(username)&&!"".equals(userpass)){
		//JDBC连接并操作数据库
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/myblog","root","root");
			st=con.createStatement();
			//查询是否存在输入用户名和密码的数据，有则表示输入正确
			String sql="Select * from mb_user where username='"+username+"' and password='"+userpass+"'";
			rs=st.executeQuery(sql);
			
			if(!rs.next()){
				//不存在该数据表示用户名或密码错误，跳转到
				//index.jsp并带上参数2表示错误信息
				response.sendRedirect("index.jsp?rtn=2");
			}else{
				//存在该数据表示输入正确，记录登录状态到session中
				//并跳转到index.jsp
				session.setAttribute("uid",rs.getInt("user_id"));
				response.sendRedirect("index.jsp");
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
			}catch(Exception e){
				System.out.println(e);
			}
		}
	}else{
		//参数为空，跳转到index.jsp并带上参数1表示错误信息
		response.sendRedirect("index.jsp?rtn=1");
	}
%>	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	