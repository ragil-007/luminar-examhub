package com.luminar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.luminar.model.CourseBean;
import com.luminar.model.PassingCriteriaBean;

public class PassCriteriaDAO {
	
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
		
		public static int insertPassingCriteria(PassingCriteriaBean passCriteria) throws SQLException, ClassNotFoundException {
			int passId=0;
			try {
				con=getConnection();
				
				pst=con.prepareStatement("insert into passing_criteria(pass_criteria_score) values(?)",Statement.RETURN_GENERATED_KEYS);
				pst.setInt(1, passCriteria.getPassScore());
				
				pst.executeUpdate();
				
				ResultSet rs = pst.getGeneratedKeys();
		        if (rs.next()) {
		        	passId=rs.getInt(1);
		        }
				
			}catch(ClassNotFoundException|SQLException ex) {
				ex.printStackTrace();
			}finally {
				DBDAO.closeDbCon();
				pst.close();
			}
			return passId;
			}
		
		// ---------------------------Start-----------------------------------------------
		
		public static boolean updatePassCriteria(PassingCriteriaBean passCriteria) throws SQLException, ClassNotFoundException {
			boolean flag = false;

			try {
				con = getConnection();

				pst = con.prepareStatement("update passing_criteria set pass_criteria_score=? where pass_id=?");
				pst.setInt(1, passCriteria.getPassScore());
				pst.setInt(2 , passCriteria.getPassId());
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
		
		public static boolean deletePassCriteria(int passId) throws SQLException, ClassNotFoundException {
			boolean flag = false;

			try {
				con = getConnection();

				pst = con.prepareStatement("delete from passing_criteria where pass_id=?");
			
				pst.setInt(1, passId);
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
