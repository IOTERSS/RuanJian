<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%
	//��½��֤��δ��½���ܽ���
	Integer uid = (Integer)session.getAttribute("uid");
	if(uid==null){
		response.sendRedirect("type_edit.jsp");
		return;
	}
	//�����������ΪUTF-8
	request.setCharacterEncoding("UTF-8");
	//���ղ���
	
	String type_id = request.getParameter("type_id");
	//�жϲ����Ƿ�Ϊ��
	if(type_id!=null && !"".equals(type_id)){
		//JDBC���Ӳ��������ݿ�
		Connection con = null;
		Statement st = null;
		Statement st2 = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myblog","root","root");
			st = con.createStatement();
			String sql = "delete from mb_blog_type where type_id='"+type_id+"'";
			st.executeUpdate(sql);
			
				 st2 = con.createStatement();
				String sql2= "delete from mb_blog where b_typeid="+type_id;
				st2.executeUpdate(sql2);
				
		
			response.sendRedirect("blog.jsp");
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			try{
				if(st2!=null){
					st2.close();
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
		//����Ϊ�գ���ת��blog_edit.jsp�����ϲ���1��ʾ������Ϣ
		response.sendRedirect("blog.jsp");
	}
%>