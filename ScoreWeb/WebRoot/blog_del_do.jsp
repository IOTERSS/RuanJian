<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%
	//��½��֤��δ��½���ܽ���
	Integer uid = (Integer)session.getAttribute("uid");
	if(uid==null){
		response.sendRedirect("index.jsp");
		return;
	}
	
	//�����������ΪUTF-8
	request.setCharacterEncoding("UTF-8");
	//���ղ���
	String b_id = request.getParameter("b_id");
	
	//�жϲ����Ƿ�Ϊ��
	if(b_id!=null && !"".equals(b_id)){
		//JDBC���Ӳ��������ݿ�
		Connection con = null;
		Statement st = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/myblog","root","root");
			st = con.createStatement();
			String sql = "delete from mb_blog where b_id="+b_id;
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
		response.sendRedirect("blog.jsp");
	}
%>