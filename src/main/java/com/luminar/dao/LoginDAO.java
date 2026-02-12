package com.luminar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.luminar.model.BatchBean;
import com.luminar.model.LoginBean;
import com.luminar.dto.LoginResultDTO;


public class LoginDAO {

	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	
	// ---------------------------Start-----------getConnection()---------------------------

		public static Connection getConnection() throws ClassNotFoundException, SQLException {
			Connection conn = null;
			try {
				DBDAO.connect();
				conn = DBDAO.getDbCon();
			} catch (ClassNotFoundException | SQLException ex) {
				ex.printStackTrace();
			}
			return conn;
		}
		
		// ---------------------------Start-----------------------------------------------
		
		public static LoginResultDTO checkLogin(LoginBean loginBean) throws SQLException, ClassNotFoundException {
			LoginResultDTO user=null;
			try {
				con=getConnection();
				
				pst=con.prepareStatement("select l.login_id,l.login_user_name, r.role_name from login_details as l join staff_details as s on s.staff_id=l.staff_id join role as r on r.role_id=s.role_id where login_user_name=? AND login_password=?");
				
				pst.setString(1, loginBean.getUserName());
				pst.setString(2, loginBean.getPassWord());
				
				rs=pst.executeQuery();
				
				if(rs.next()) {
					user=new LoginResultDTO();
					user.setUserId(rs.getInt("login_id"));
					user.setUserName(rs.getString("login_user_name"));
					user.setRole(rs.getString("role_name"));
				}
				
			}catch(ClassNotFoundException|SQLException ex) {
				ex.printStackTrace();
			}finally {
				DBDAO.closeDbCon();
				pst.close();
			}
			return user;
			}
		
		// ---------------------------Start-----------------------------------------------
		
		public static boolean insertLogin(LoginBean loginBean) throws SQLException, ClassNotFoundException {
			boolean flag=false;
			try {
				con=getConnection();
				
				pst=con.prepareStatement("insert into login_details(staff_id,login_user_name,login_password) values(?,?,?)");
				pst.setInt(1, loginBean.getStaffId());
				pst.setString(2, loginBean.getUserName());
				pst.setString(3, loginBean.getPassWord());
				
				pst.executeUpdate();

				flag = true;
				
			}catch(ClassNotFoundException|SQLException ex) {
				ex.printStackTrace();
			}finally {
				DBDAO.closeDbCon();
				pst.close();
			}
			return flag;
			}
		
		// ---------------------------Start-----------------------------------------------
		
				public static LoginBean getLoginIdForDelete(int staffId) throws SQLException, ClassNotFoundException {
					LoginBean login=new LoginBean();
					try {
						con=getConnection();
						
						pst=con.prepareStatement("select login_id from login_details where staff_id=?");
						pst.setInt(1, staffId);
						rs=pst.executeQuery();
						
						if(rs.next()) {
							login.setLoginId(rs.getInt(1));
						}
						
					}catch(ClassNotFoundException|SQLException ex) {
						ex.printStackTrace();
					}finally {
						DBDAO.closeDbCon();
						pst.close();
					}
					return login;
					}
				
// ---------------------------Start-----------------------------------------------
				
				public static boolean deleteLogin(int loginId) throws SQLException, ClassNotFoundException {
					boolean flag = false;

					try {
						con = getConnection();

						pst = con.prepareStatement("delete from login_details where login_id=?");
					
						pst.setInt(1, loginId);
						pst.executeUpdate();

						flag = true;

					} catch (ClassNotFoundException | SQLException ex) {
						ex.printStackTrace();
					} finally {
						pst.close();
						DBDAO.closeDbCon();
					}

					return flag;

				}
		
		
}
