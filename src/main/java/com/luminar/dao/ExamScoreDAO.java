package com.luminar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.luminar.dto.ExamResultDTO;
import com.luminar.dto.StudentResultDTO;
import com.luminar.model.ExamScoreBean;
import com.luminar.model.StudentBasicBean;

public class ExamScoreDAO {
	
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
		
				public static List<ExamResultDTO> listExamResults() throws SQLException, ClassNotFoundException {
					List<ExamResultDTO> examResults = new ArrayList<>();
					try {
						con=getConnection();
						
						pst=con.prepareStatement("select es.exam_score_id,ed.exam_det_name,ed.exam_det_date,"
								+ "s.student_name,es.exam_score,p.pass_criteria_score,"
								+ "es.exam_comments from exam_score as es "
								+ "join exam_details as ed on es.exam_det_id=ed.exam_det_id "
								+ "join passing_criteria as p on ed.pass_id=p.pass_id "
								+ "join student_basic_details as s on es.student_id=s.student_id;");
						
						rs=pst.executeQuery();
						
						while(rs.next()) {
							ExamResultDTO examResult=new ExamResultDTO();
							examResult.setExamScoreId(rs.getInt(1));
							examResult.setExamName(rs.getString(2));
							examResult.setExamDate(rs.getDate(3));
							examResult.setStudentName(rs.getString(4));
							examResult.setExamScore(rs.getInt(5));
							examResult.setPassScore(rs.getInt(6));
							examResult.setExamComments(rs.getString(7));
							examResults.add(examResult);
						}
						
					}catch(ClassNotFoundException|SQLException ex) {
						ex.printStackTrace();
					}finally {
						DBDAO.closeDbCon();
						pst.close();
					}
					return examResults;
					}
				
				// ---------------------------Start-----------------------------------------------
				
				public static List<ExamResultDTO> listExamResultsByExam(int examDetId)
				        throws SQLException, ClassNotFoundException {

				    List<ExamResultDTO> examResults = new ArrayList<>();

				    try {
				        con = getConnection();

				        pst = con.prepareStatement(
				            "SELECT es.exam_score_id, ed.exam_det_name, ed.exam_det_date, " +
				            "s.student_name, es.exam_score, es.exam_comments " +
				            "FROM exam_score es " +
				            "JOIN exam_details ed ON es.exam_det_id = ed.exam_det_id " +
				            "JOIN student_basic_details s ON es.student_id = s.student_id " +
				            "WHERE es.exam_det_id = ?"
				        );
				        pst.setInt(1, examDetId);

				        rs = pst.executeQuery();

				        while (rs.next()) {
				            ExamResultDTO examResult = new ExamResultDTO();
				            examResult.setExamScoreId(rs.getInt(1));
				            examResult.setExamName(rs.getString(2));
				            examResult.setExamDate(rs.getDate(3));
				            examResult.setStudentName(rs.getString(4));
				            examResult.setExamScore(rs.getInt(5));
				            examResult.setExamComments(rs.getString(6));
				            examResults.add(examResult);
				        }

				    } finally {
				        DBDAO.closeDbCon();
				        pst.close();
				    }

				    return examResults;
				}

				// ---------------------------Start-----------------------------------------------
				
				public static boolean insertExamScore(ExamScoreBean examScore) throws SQLException, ClassNotFoundException {
					boolean flag=false;
					try {
						con=getConnection();
						
						pst=con.prepareStatement("insert into exam_score(exam_det_id,student_id,exam_score,exam_comments) "
								+ "values(?,?,?,?)");
						pst.setInt(1, examScore.getExamDetailId());
						pst.setInt(2, examScore.getStudentId());
						pst.setInt(3, examScore.getExamScore());
						pst.setString(4, examScore.getComments());
						
						pst.executeUpdate();
						
						flag=true;
						
					}catch(ClassNotFoundException|SQLException ex) {
						ex.printStackTrace();
					}finally {
						DBDAO.closeDbCon();
						pst.close();
					}
					return flag;
					}
				
				//--------------------------start----------------------------------------------------------
				
				public static ExamScoreBean getExamScore(int resultId) throws SQLException, ClassNotFoundException {
					ExamScoreBean examScore = new ExamScoreBean();

					try {
						con = getConnection();

						pst = con.prepareStatement("select * from exam_score where exam_score_id=?;");
						pst.setInt(1, resultId);
						rs = pst.executeQuery();

						while (rs.next()) {
							examScore.setExamScoreId(rs.getInt(1));
							examScore.setExamDetailId(rs.getInt(2));
							examScore.setStudentId(rs.getInt(3));
							examScore.setExamScore(rs.getInt(4));
							examScore.setComments(rs.getString(5));
						}

					} catch (ClassNotFoundException | SQLException ex) {
						ex.printStackTrace();
					} finally {
						pst.close();
						DBDAO.closeDbCon();
					}

					return examScore;

				}
				

				
				// ---------------------------Start-----------------------------------------------
				
				public static boolean updateExamScore(ExamScoreBean examScore) throws SQLException, ClassNotFoundException {
					boolean flag = false;

					try {
						con = getConnection();

						pst = con.prepareStatement("update exam_score set exam_det_id=?,student_id=?,exam_score=?,exam_comments=? where exam_score_id=?");
						pst.setInt(1 , examScore.getExamDetailId());
						pst.setInt(2, examScore.getStudentId());
						pst.setInt(3 , examScore.getExamScore());
						pst.setString(4 , examScore.getComments());
						pst.setInt(5, examScore.getExamScoreId());
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
				
				public static boolean deleteExamScore(int resultId) throws SQLException, ClassNotFoundException {
					boolean flag = false;

					try {
						con = getConnection();

						pst = con.prepareStatement("delete from exam_score where exam_score_id=?");
					
						pst.setInt(1, resultId);
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
