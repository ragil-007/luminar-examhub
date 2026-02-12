package com.luminar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.luminar.dto.BatchResultDTO;
import com.luminar.model.RoleBean;

public class RoleDAO {
	
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
		
		// ---------------------------Start-----------------------------------------------
		
				public static List<RoleBean> listRoles() throws SQLException, ClassNotFoundException {
					List<RoleBean> roles = new ArrayList<>();
					try {
						con=getConnection();
						
						pst=con.prepareStatement("select * from role");
						
						rs=pst.executeQuery();
						
						while(rs.next()) {
							RoleBean role=new RoleBean();
							role.setRoleId(rs.getInt(1));
							role.setRoleName(rs.getString(2));
							roles.add(role);
						}
						
					}catch(ClassNotFoundException|SQLException ex) {
						ex.printStackTrace();
					}finally {
						DBDAO.closeDbCon();
						pst.close();
					}
					return roles;
					}
				
				public static List<RoleBean> listRolesExceptAdmin() throws SQLException, ClassNotFoundException {
					List<RoleBean> roles = new ArrayList<>();
					try {
						con=getConnection();
						
						pst=con.prepareStatement("select * from role where role_id <> 1");
						
						rs=pst.executeQuery();
						
						while(rs.next()) {
							RoleBean role=new RoleBean();
							role.setRoleId(rs.getInt(1));
							role.setRoleName(rs.getString(2));
							roles.add(role);
						}
						
					}catch(ClassNotFoundException|SQLException ex) {
						ex.printStackTrace();
					}finally {
						DBDAO.closeDbCon();
						pst.close();
					}
					return roles;
					}
				
				// ---------------------------Start-----------------------------------------------
				
				public static List<RoleBean> listRolesExceptPending() throws SQLException, ClassNotFoundException {
					List<RoleBean> roles = new ArrayList<>();
					try {
						con=getConnection();
						
						pst=con.prepareStatement("select * from role where role_id <> 5");
						
						rs=pst.executeQuery();
						
						while(rs.next()) {
							RoleBean role=new RoleBean();
							role.setRoleId(rs.getInt(1));
							role.setRoleName(rs.getString(2));
							roles.add(role);
						}
						
					}catch(ClassNotFoundException|SQLException ex) {
						ex.printStackTrace();
					}finally {
						DBDAO.closeDbCon();
						pst.close();
					}
					return roles;
					}
}
