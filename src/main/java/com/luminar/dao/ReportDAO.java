package com.luminar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReportDAO {
		
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
		// ---------------------------Start-------------------------------------

	    public static int getTotalStudents() throws Exception {
	        return getCount("student_basic_details");
	    }
	    // ---------------------------Start-------------------------------------

	    public static int getTotalDepartments() throws Exception {
	        return getCount("department");
	    }
	    // ---------------------------Start-------------------------------------

	    public static int getTotalStaff() throws Exception {
	        return getCount("staff_details");
	    }
	    // ---------------------------Start-------------------------------------

	    public static int getTotalExams() throws Exception {
	        return getCount("exam_details");
	    }
	    // ---------------------------Start-------------------------------------

	    private static int getCount(String table) throws Exception {
	        int count = 0;
	        try {
	        	con=getConnection();
	            PreparedStatement pst =
	                con.prepareStatement("SELECT COUNT(*) FROM " + table);
	            ResultSet rs = pst.executeQuery();
	            if(rs.next()){
	            	count = rs.getInt(1);
	            }
	        } finally {
	            DBDAO.closeDbCon();
	        }
	        return count;
	    }

}
