package com.luminar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.luminar.dto.BatchResultDTO;
import com.luminar.dto.StudentResultDTO;
import com.luminar.model.BatchBean;
import com.luminar.model.StudentExperienceBean;

public class StudentExperienceDAO {

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

	public static boolean insertStudentExperience(StudentExperienceBean stuExpBean) throws SQLException, ClassNotFoundException {
		boolean flag = false;
		try {
			con = getConnection();

			pst = con.prepareStatement("insert into student_experience_details(student_id,student_company,student_designation,student_total_exp,student_technology) values(?,?,?,?,?)");
			pst.setInt(1, stuExpBean.getStuId());
			pst.setString(2, stuExpBean.getStuCompany());
			pst.setString(3, stuExpBean.getStuDesignation());
			pst.setInt(4, stuExpBean.getStuTotalExp());
			pst.setString(5, stuExpBean.getStuTech());

			pst.executeUpdate();

			flag = true;

		} catch (ClassNotFoundException | SQLException ex) {
			ex.printStackTrace();
		} finally {
			DBDAO.closeDbCon();
			pst.close();
		}
		return flag;
	}
	
	// ---------------------------Start-----------------------------------------------

		public static boolean checkExperience(int stuId) throws SQLException, ClassNotFoundException {
			boolean flag = false;

			try {
				con = getConnection();

				pst = con.prepareStatement("SELECT COUNT(*) FROM student_experience_details WHERE student_id = ?;");
				pst.setInt(1, stuId);
				rs=pst.executeQuery();

				while (rs.next()) {
					flag = rs.getInt(1) > 0;
				}

			} catch (ClassNotFoundException | SQLException ex) {
				ex.printStackTrace();
			} finally {
				pst.close();
				DBDAO.closeDbCon();
			}

			return flag;

		}

	
	// ---------------------------Start-----------------------------------------------

	public static boolean updateStudentExperience(StudentExperienceBean StuExperience) throws SQLException, ClassNotFoundException {
		boolean flag = false;

		try {
			con = getConnection();

			pst = con.prepareStatement("update student_experience_details set student_company=?,student_designation=?,student_total_exp=?,student_technology=? where student_id=?");
			pst.setString(1, StuExperience.getStuCompany());
			pst.setString(2, StuExperience.getStuDesignation());
			pst.setInt(3, StuExperience.getStuTotalExp());
			pst.setString(4, StuExperience.getStuTech());
			pst.setInt(5, StuExperience.getStuId());
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

	public static boolean deleteStudentExperience(int stuId) throws SQLException, ClassNotFoundException {
		boolean flag = false;

		try {
			con = getConnection();

			pst = con.prepareStatement("delete from student_experience_details where student_id=?");

			pst.setInt(1, stuId);
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
