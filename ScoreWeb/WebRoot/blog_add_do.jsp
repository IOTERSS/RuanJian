<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%
	//登录验证，未登录不能进入
	Integer uid=(Integer)session.getAttribute("uid");
	if(uid==null){
		response.sendRedirect("index.jsp");
		return;
	}

	//设置请求编码为utf-8
	request.setCharacterEncoding("UTF-8");
	//接收参数
	String b_title=request.getParameter("title");
	String b_type=request.getParameter("type");
	String b_intro=request.getParameter("intro");
	String b_content=request.getParameter("content");
	//判断参数是否为空
	if(b_title!=null&& !"".equals(b_title)&& b_tag!=null && !"".equals(b_tag) && b_intro!=null && !"".equals(b_intro) && b_content!=null && !"".equals(b_content)){
		//JDBC连接并操作数据库
		Connection con=null;
		Statement st=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/enterprise","root","root");
			st=con.createStatement();
			//由于id是自增，时间、浏览数在数据库中设置了默认值。
			//因此只需要插入用户输入的字段即可
			String sql="insert into mb_blog(b_typeid,b_title,b_intro,b_content) value("+b_type+",'"+b_title+"','"+b_intro+"','"+b_content+"')";
			st.executeUpdate(sql);
			
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	