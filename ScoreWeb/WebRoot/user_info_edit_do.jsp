<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%
	//设置请求编码为utf-8
	request.setCharacterEncoding("utf-8");
	//接收参数
	String name=request.getParameter("name");
	System.out.println(name);
	String desc=request.getParameter("desc");
	System.out.println(desc);
	String intro=request.getParameter("intro");
	Integer uid = (Integer)session.getAttribute("uid");
	//判断参数是否为空
	if(name!=null&& desc!=null&&!"".equals(name)&&!"".equals(desc)){
		//JDBC连接并操作数据库
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/myblog","root","root");
			st=con.createStatement();
			//查询是否存在输入用户名和密码的数据，有则表示输入正确
			String sql="update mb_user set name='"+name+"',descc='"+desc+"',intro='"+intro+"' where user_id="+uid;
			
	System.out.println(sql);st.executeUpdate(sql);
	
			response.sendRedirect("index.jsp");
			
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
			}catch(Exception e){
				System.out.println(e);
			}
		}
	}else{
		//参数为空，跳转到index.jsp并带上参数1表示错误信息
		response.sendRedirect("index.jsp?rtn=1");
	}
%>	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	