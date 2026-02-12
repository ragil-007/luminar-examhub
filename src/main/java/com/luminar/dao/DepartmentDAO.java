package com.luminar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.luminar.model.DepartmentBean;

public class DepartmentDAO {

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
		
				public static List<DepartmentBean> listDepartments() throws SQLException, ClassNotFoundException {
					List<DepartmentBean> departments = new ArrayList<>();
					try {
						con=getConnection();
						
						pst=con.prepareStatement("select * from department");
						
						rs=pst.executeQuery();
						
						while(rs.next()) {
							DepartmentBean dept=new DepartmentBean();
							dept.setDeptId(rs.getInt(1));
							dept.setDeptName(rs.getString(2));
							departments.add(dept);
						}
						
					}catch(ClassNotFoundException|SQLException ex) {
						ex.printStackTrace();
					}finally {
						DBDAO.closeDbCon();
						pst.close();
					}
					return departments;
					}
				
				// ---------------------------Start-----------------------------------------------
				
				public static List<DepartmentBean> listDepartmentsforExam() throws SQLException, ClassNotFoundException {
					List<DepartmentBean> departments = new ArrayList<>();
					try {
						con=getConnection();
						
						pst=con.prepareStatement("select * from department WHERE dept_name IN ('trainer', 'hr', 'academic')");
						
						rs=pst.executeQuery();
						
						while(rs.next()) {
							DepartmentBean dept=new DepartmentBean();
							dept.setDeptId(rs.getInt(1));
							dept.setDeptName(rs.getString(2));
							departments.add(dept);
						}
						
					}catch(ClassNotFoundException|SQLException ex) {
						ex.printStackTrace();
					}finally {
						DBDAO.closeDbCon();
						pst.close();
					}
					return departments;
					}
				
				// ---------------------------Start-----------------------------------------------
				
				public static boolean insertDepartment(DepartmentBean deptBean) throws SQLException, ClassNotFoundException {
					boolean flag=false;
					try {
						con=getConnection();
						
						pst=con.prepareStatement("insert into department(dept_name) values(?)");
						pst.setString(1, deptBean.getDeptName());
						
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
				
				public static DepartmentBean getDepartment(int deptId) throws SQLException, ClassNotFoundException {
					DepartmentBean department = new DepartmentBean();

					try {
						con = getConnection();

						pst = con.prepareStatement("select dept_name from department where dept_id=?");
						pst.setInt(1, deptId);
						rs = pst.executeQuery();

						while (rs.next()) {
							department.setDeptId(deptId);
							department.setDeptName(rs.getString(1));
						}

					} catch (ClassNotFoundException | SQLException ex) {
						ex.printStackTrace();
					} finally {
						pst.close();
						DBDAO.closeDbCon();
					}

					return department;

				}
				// ---------------------------Start-----------------------------------------------
				
				public static boolean updateDepartment(DepartmentBean deptBean) throws SQLException, ClassNotFoundException {
					boolean flag = false;

					try {
						con = getConnection();

						pst = con.prepareStatement("update department set dept_name=? where dept_id=?");
						pst.setString(1, deptBean.getDeptName());
						pst.setInt(2 , deptBean.getDeptId());
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
				// ---------------------------Start-----------------------------------------------
				
				public static boolean deleteDepartment(int deptId) throws SQLException, ClassNotFoundException {
					boolean flag = false;

					try {
						con = getConnection();

						pst = con.prepareStatement("delete from department where dept_id=?");
					
						pst.setInt(1, deptId);
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
