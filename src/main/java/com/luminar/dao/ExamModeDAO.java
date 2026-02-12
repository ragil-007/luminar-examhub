package com.luminar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.luminar.dto.ExamDetailDTO;
import com.luminar.model.DepartmentBean;
import com.luminar.model.ExamModeBean;

public class ExamModeDAO {
	
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
				
				public static List<ExamModeBean> listExamModes() throws SQLException, ClassNotFoundException {
					List<ExamModeBean> examModes = new ArrayList<>();
					try {
						con=getConnection();
						
						pst=con.prepareStatement("select * from exam_mode");
						
						rs=pst.executeQuery();
						
						while(rs.next()) {
							ExamModeBean examMode=new ExamModeBean();
							examMode.setExamModeId(rs.getInt(1));
							examMode.setExamModeName(rs.getString(2));
							examModes.add(examMode);
						}
						
					}catch(ClassNotFoundException|SQLException ex) {
						ex.printStackTrace();
					}finally {
						DBDAO.closeDbCon();
						pst.close();
					}
					return examModes;
					}
				
				// ---------------------------Start-----------------------------------------------
				
				public static boolean insertExamMode(ExamModeBean examMode) throws SQLException, ClassNotFoundException {
					boolean flag=false;
					try {
						con=getConnection();
						
						pst=con.prepareStatement("insert into exam_mode(exam_mode_name) values(?)");
						pst.setString(1, examMode.getExamModeName());
						
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
				
				public static ExamModeBean getExamMode(int examModeId) throws SQLException, ClassNotFoundException {
					ExamModeBean examMode = new ExamModeBean();

					try {
						con = getConnection();

						pst = con.prepareStatement("select exam_mode_name from exam_mode where exam_mode_id=?");
						pst.setInt(1, examModeId);
						rs = pst.executeQuery();

						while (rs.next()) {
							examMode.setExamModeId(examModeId);
							examMode.setExamModeName(rs.getString(1));
						}

					} catch (ClassNotFoundException | SQLException ex) {
						ex.printStackTrace();
					} finally {
						pst.close();
						DBDAO.closeDbCon();
					}

					return examMode;

				}
				// ---------------------------Start-----------------------------------------------
				
				public static boolean updateExamMode(ExamModeBean examMode) throws SQLException, ClassNotFoundException {
					boolean flag = false;

					try {
						con = getConnection();

						pst = con.prepareStatement("update exam_mode set exam_mode_name=? where exam_mode_id=?");
						pst.setString(1, examMode.getExamModeName());
						pst.setInt(2 , examMode.getExamModeId());
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
				
				public static boolean deleteExamMode(int examModeId) throws SQLException, ClassNotFoundException {
					boolean flag = false;

					try {
						con = getConnection();

						pst = con.prepareStatement("delete from exam_mode where exam_mode_id=?");
					
						pst.setInt(1, examModeId);
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
