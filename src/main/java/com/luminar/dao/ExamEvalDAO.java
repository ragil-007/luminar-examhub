package com.luminar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.luminar.model.BatchBean;
import com.luminar.model.ExamEvalBean;

public class ExamEvalDAO {
	
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
		
		public static boolean insertExamEval(ExamEvalBean examEval) throws SQLException, ClassNotFoundException {
			boolean flag=false;
			try {
				con=getConnection();
				
				pst=con.prepareStatement("insert into exam_evaluation_allotment(exam_det_id,staff_id) values(?,?)");
				pst.setInt(1, examEval.getExamDetailsId());
				pst.setInt(2, examEval.getStaffId());
				
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
		
		public static BatchBean getbatch(int batchId) throws SQLException, ClassNotFoundException {
			BatchBean batch = new BatchBean();

			try {
				con = getConnection();

				pst = con.prepareStatement("select course_id,batch_name from batches where batch_id=?");
				pst.setInt(1, batchId);
				rs = pst.executeQuery();

				while (rs.next()) {
					batch.setBatchId(batchId);
					batch.setCourseId(rs.getInt(1));
					batch.setBatchName(rs.getString(2));
				}

			} catch (ClassNotFoundException | SQLException ex) {
				ex.printStackTrace();
			} finally {
				pst.close();
				DBDAO.closeDbCon();
			}

			return batch;

		}
		// ---------------------------Start-----------------------------------------------
		
		public static boolean updateExamEval(ExamEvalBean examEval) throws SQLException, ClassNotFoundException {
			boolean flag = false;

			try {
				con = getConnection();

				pst = con.prepareStatement("update exam_evaluation_allotment set staff_id=? where exam_det_id=?");
				pst.setInt(1 , examEval.getStaffId());
				pst.setInt(2 , examEval.getExamDetailsId());
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
		
		public static boolean deleteExamEval(int examDetailId) throws SQLException, ClassNotFoundException {
			boolean flag = false;

			try {
				con = getConnection();

				pst = con.prepareStatement("delete from exam_evaluation_allotment where exam_det_id=?");
			
				pst.setInt(1, examDetailId);
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
