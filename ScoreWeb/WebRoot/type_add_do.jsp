<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%
	//��½��֤��δ��½���ܽ���
	Integer uid = (Integer)session.getAttribute("uid");
	if(uid==null){
		//response.sendRedirect("type_add.jsp");
		//return;
	}
	//�����������ΪUTF-8
	request.setCharacterEncoding("UTF-8");
	//���ղ���
	String b_title = request.getParameter("title");
	
	//�жϲ����Ƿ�Ϊ��
	if(b_title!=null && !"".equals(b_title)){
		//JDBC���Ӳ��������ݿ�
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
		//����Ϊ�գ���ת��blog_edit.jsp�����ϲ���1��ʾ������Ϣ
		response.sendRedirect("blog.jsp");
	}
%>