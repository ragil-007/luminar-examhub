package com.luminar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.luminar.dto.StaffDetailsDTO;
import com.luminar.model.StaffBean;

public class StaffDAO {

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
		
		public static List<StaffDetailsDTO> listStaffDetails() throws SQLException, ClassNotFoundException {
			List<StaffDetailsDTO> staffs = new ArrayList<>();
			try {
				con=getConnection();
				
				pst=con.prepareStatement("select s.staff_id, s.staff_name, s.staff_roll_no, s.staff_contact_no, "
						+ "d.dept_name, s.role_id from staff_details as s join department as d on s.dept_id=d.dept_id");
				
				rs=pst.executeQuery();
				
				while(rs.next()) {
					StaffDetailsDTO staff=new StaffDetailsDTO();
					staff.setStaffId(rs.getInt(1));
					staff.setStaffName(rs.getString(2));
					staff.setStaffRollNo(rs.getString(3));
					staff.setStaffContactNo(rs.getString(4));
					staff.setDeptName(rs.getString(5));
					staff.setRoleId(rs.getInt(6));
					staffs.add(staff);
				}
				
			}catch(ClassNotFoundException|SQLException ex) {
				ex.printStackTrace();
			}finally {
				DBDAO.closeDbCon();
				pst.close();
			}
			return staffs;
			}
		
		// ---------------------------Start-----------------------------------------------
		
				public static List<StaffDetailsDTO> listRoleAllocatedStaffDetails() throws SQLException, ClassNotFoundException {
					List<StaffDetailsDTO> staffs = new ArrayList<>();
					try {
						con=getConnection();
						
						pst=con.prepareStatement("select s.staff_id, s.staff_name, s.staff_roll_no, s.staff_contact_no, "
								+ "d.dept_name, s.role_id from staff_details as s join department as d on s.dept_id=d.dept_id WHERE s.role_id <> 5");
						
						rs=pst.executeQuery();
						
						while(rs.next()) {
							StaffDetailsDTO staff=new StaffDetailsDTO();
							staff.setStaffId(rs.getInt(1));
							staff.setStaffName(rs.getString(2));
							staff.setStaffRollNo(rs.getString(3));
							staff.setStaffContactNo(rs.getString(4));
							staff.setDeptName(rs.getString(5));
							staff.setRoleId(rs.getInt(6));
							staffs.add(staff);
						}
						
					}catch(ClassNotFoundException|SQLException ex) {
						ex.printStackTrace();
					}finally {
						DBDAO.closeDbCon();
						pst.close();
					}
					return staffs;
					}
		
		// ---------------------------Start-----------------------------------------------
		
		public static boolean insertStaff(StaffBean staffBean) throws SQLException, ClassNotFoundException {
			boolean flag=false;
			try {
				con=getConnection();
				
				pst=con.prepareStatement("insert into staff_details(dept_id,role_id,staff_roll_no,staff_name,staff_contact_no) values(?,?,?,?,?)");
				pst.setInt(1, staffBean.getDepartmentId());
				pst.setInt(2, staffBean.getRoleId());
				pst.setString(3, staffBean.getStaffRollNo());
				pst.setString(4, staffBean.getStaffName());
				pst.setString(5, staffBean.getContactNo());
				
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
		
		public static StaffBean getStaffId(String rollno) throws SQLException, ClassNotFoundException {
			StaffBean staff = new StaffBean();

			try {
				con = getConnection();

				pst = con.prepareStatement("select staff_id from staff_details where staff_roll_no=?");
				pst.setString(1, rollno);
				rs = pst.executeQuery();

				while (rs.next()) {
					staff.setStaffId(rs.getInt(1));
				}

			} catch (ClassNotFoundException | SQLException ex) {
				ex.printStackTrace();
			} finally {
				pst.close();
				DBDAO.closeDbCon();
			}

			return staff;

		}
		
		public static StaffBean getStaffDetailsforRoleChange(int staffId) throws SQLException, ClassNotFoundException {
			StaffBean staff = new StaffBean();

			try {
				con = getConnection();

				pst = con.prepareStatement("select staff_id, staff_name, role_id from staff_details where staff_id=?");
				pst.setInt(1, staffId);
				rs = pst.executeQuery();

				while (rs.next()) {
					staff.setStaffId(rs.getInt(1));
					staff.setStaffName(rs.getString(2));
					staff.setRoleId(rs.getInt(3));
				}

			} catch (ClassNotFoundException | SQLException ex) {
				ex.printStackTrace();
			} finally {
				pst.close();
				DBDAO.closeDbCon();
			}

			return staff;

		}
		
		// ---------------------------Start-----------------------------------------------
		
				public static List<StaffBean> getStaffByDepartment(int deptId) throws SQLException, ClassNotFoundException {
					List<StaffBean> staffs = new ArrayList<>();

					try {
						con = getConnection();

						pst = con.prepareStatement("SELECT staff_id, staff_name FROM staff_details WHERE dept_id = ?");
						pst.setInt(1, deptId);
						rs = pst.executeQuery();

						while (rs.next()) {
							StaffBean staff = new StaffBean();
							staff.setStaffId(rs.getInt(1));
							staff.setStaffName(rs.getString(2));
							staffs.add(staff);
						}

					} catch (ClassNotFoundException | SQLException ex) {
						ex.printStackTrace();
					} finally {
						pst.close();
						DBDAO.closeDbCon();
					}

					return staffs;

				}
				
				// ---------------------------Start-----------------------------------------------
				
				public static List<StaffDetailsDTO> listStaffsByRole(int roleId) throws SQLException, ClassNotFoundException {
					List<StaffDetailsDTO> staffs = new ArrayList<>();

					try {
						con = getConnection();

						pst = con.prepareStatement("select s.staff_id, s.staff_name, s.staff_roll_no, s.staff_contact_no, "
								+ "d.dept_name, s.role_id from staff_details as s join department as d on s.dept_id=d.dept_id where s.role_id=?");
						pst.setInt(1, roleId);
						rs = pst.executeQuery();

						while (rs.next()) {
							StaffDetailsDTO staff=new StaffDetailsDTO();
							staff.setStaffId(rs.getInt(1));
							staff.setStaffName(rs.getString(2));
							staff.setStaffRollNo(rs.getString(3));
							staff.setStaffContactNo(rs.getString(4));
							staff.setDeptName(rs.getString(5));
							staff.setRoleId(rs.getInt(6));
							staffs.add(staff);
						}

					} catch (ClassNotFoundException | SQLException ex) {
						ex.printStackTrace();
					} finally {
						pst.close();
						DBDAO.closeDbCon();
					}

					return staffs;

				}
				
// ---------------------------Start-----------------------------------------------
				
				public static List<StaffDetailsDTO> listStaffByPendingRole() throws SQLException, ClassNotFoundException {
					List<StaffDetailsDTO> staffs = new ArrayList<>();

					try {
						con = getConnection();

						pst = con.prepareStatement("select s.staff_id,s.staff_name,s.staff_roll_no,"
								+ "d.dept_name from staff_details as s "
								+ "join department as d on s.dept_id=d.dept_id where role_id=5;");
						rs = pst.executeQuery();

						while (rs.next()) {
							StaffDetailsDTO staff=new StaffDetailsDTO();
							staff.setStaffId(rs.getInt(1));
							staff.setStaffName(rs.getString(2));
							staff.setStaffRollNo(rs.getString(3));
							staff.setDeptName(rs.getString(4));
							staffs.add(staff);
						}

					} catch (ClassNotFoundException | SQLException ex) {
						ex.printStackTrace();
					} finally {
						pst.close();
						DBDAO.closeDbCon();
					}

					return staffs;

				}
				
				// ---------------------------Start-----------------------------------------------
				
				public static boolean AssignStaffRole(StaffBean staffBean) throws SQLException, ClassNotFoundException {
					boolean flag=false;
					try {
						con=getConnection();
						
						pst=con.prepareStatement("update staff_details set role_id=? where staff_id=?");
						pst.setInt(1, staffBean.getRoleId());
						pst.setInt(2, staffBean.getStaffId());
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
				
				public static boolean deleteStaff(int staffId) throws SQLException, ClassNotFoundException {
					boolean flag = false;

					try {
						con = getConnection();

						pst = con.prepareStatement("delete from staff_details where staff_id=?");
					
						pst.setInt(1, staffId);
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
