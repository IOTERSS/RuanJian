<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%
	//��½��֤��δ��½���ܽ���
	Integer uid = (Integer)session.getAttribute("uid");
	if(uid==null){
		//response.sendRedirect("type_edit.jsp");
		//return;
	}
	//�����������ΪUTF-8
	request.setCharacterEncoding("UTF-8");
	//���ղ���
	String type_name = request.getParameter("title");
	String type_id = request.getParameter("type_id");
	//�жϲ����Ƿ�Ϊ��
	if(type_name!=null && !"".equals(type_name)){
		//JDBC���Ӳ��������ݿ�
		Connection con = null;
		Statement st = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/myblog","root","root");
			st = con.createStatement();
			String sql = "update mb_blog_type set type_name='"+type_name+"' where type_id='"+type_id+"'";
			st.executeUpdate(sql);
			
			response.sendRedirect("type_edit.jsp");
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