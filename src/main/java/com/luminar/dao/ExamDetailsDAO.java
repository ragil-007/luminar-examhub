package com.luminar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.luminar.dto.ExamDetailDTO;
import com.luminar.model.CourseBean;
import com.luminar.model.ExamDetailsBean;

public class ExamDetailsDAO {

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

	public static List<ExamDetailDTO> listExams() throws SQLException, ClassNotFoundException {
		List<ExamDetailDTO> exams = new ArrayList<>();
		try {
			con = getConnection();

			pst = con.prepareStatement("select ed.exam_det_id,ed.exam_det_name,ed.exam_det_date,"
					+ "em.exam_mode_name,p.pass_criteria_score,s.staff_name from exam_details  as ed "
					+ "join exam_mode as em on ed.exam_mode_id=em.exam_mode_id "
					+ "join passing_criteria as p on ed.pass_id=p.pass_id "
					+ "join exam_evaluation_allotment as ee on ee.exam_det_id=ed.exam_det_id "
					+ "join staff_details as s on s.staff_id=ee.staff_id;");

			rs = pst.executeQuery();

			while (rs.next()) {
				ExamDetailDTO exam = new ExamDetailDTO();
				exam.setExamDetailId(rs.getInt(1));
				exam.setExamDetailName(rs.getString(2));
				exam.setExamDate(rs.getDate(3));
				exam.setExamModeName(rs.getString(4));
				exam.setPassScore(rs.getInt(5));
				exam.setStaffName(rs.getString(6));
				exams.add(exam);
			}

		} catch (ClassNotFoundException | SQLException ex) {
			ex.printStackTrace();
		} finally {
			DBDAO.closeDbCon();
			pst.close();
		}
		return exams;
	}
	
	// ---------------------------Start-----------------------------------------------

		public static List<ExamDetailDTO> listAllocatedExams(int userId) throws SQLException, ClassNotFoundException {
			List<ExamDetailDTO> exams = new ArrayList<>();
			try {
				con = getConnection();

				pst = con.prepareStatement("select ed.exam_det_name,ed.exam_det_date,em.exam_mode_name,"
						+ "p.pass_criteria_score from exam_details  as ed "
						+ "join exam_mode as em on ed.exam_mode_id=em.exam_mode_id "
						+ "join passing_criteria as p on ed.pass_id=p.pass_id "
						+ "join exam_evaluation_allotment as ee on ee.exam_det_id=ed.exam_det_id "
						+ "join staff_details as s on s.staff_id=ee.staff_id "
						+ "join login_details as l on s.staff_id=l.staff_id where login_id=?");
				pst.setInt(1, userId);

				rs = pst.executeQuery();

				while (rs.next()) {
					ExamDetailDTO exam = new ExamDetailDTO();
					exam.setExamDetailName(rs.getString(1));
					exam.setExamDate(rs.getDate(2));
					exam.setExamModeName(rs.getString(3));
					exam.setPassScore(rs.getInt(4));
					exams.add(exam);
				}

			} catch (ClassNotFoundException | SQLException ex) {
				ex.printStackTrace();
			} finally {
				DBDAO.closeDbCon();
				pst.close();
			}
			return exams;
		}

	// ---------------------------Start-----------------------------------------------

	public static int insertExamDetails(ExamDetailsBean examDetails) throws SQLException, ClassNotFoundException {
		int examDetailId = 0;
		try {
			con = getConnection();

			pst = con.prepareStatement(
					"insert into exam_details(exam_mode_id,pass_id,exam_det_name,exam_det_date) values(?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);
			pst.setInt(1, examDetails.getExamModeId());
			pst.setInt(2, examDetails.getPassId());
			pst.setString(3, examDetails.getExamDetailName());
			pst.setDate(4, examDetails.getExamDetailDate());

			pst.executeUpdate();

			ResultSet rs = pst.getGeneratedKeys();
			if (rs.next()) {
				examDetailId = rs.getInt(1);
			}

		} catch (ClassNotFoundException | SQLException ex) {
			ex.printStackTrace();
		} finally {
			DBDAO.closeDbCon();
			pst.close();
		}
		return examDetailId;
	}

	// ---------------------------Start-----------------------------------------------

	public static ExamDetailDTO getExamDetails(int examDetailId) throws SQLException, ClassNotFoundException {
		ExamDetailDTO examDetails = new ExamDetailDTO();

		try {
			con = getConnection();

			pst = con.prepareStatement("select ed.exam_det_id,ed.exam_det_name,ed.exam_det_date,"
					+ "em.exam_mode_name,p.pass_criteria_score,ee.staff_id,s.dept_id,em.exam_mode_id from exam_details as ed "
					+ "join exam_mode as em on ed.exam_mode_id=em.exam_mode_id "
					+ "join passing_criteria as p on ed.pass_id=p.pass_id "
					+ "join exam_evaluation_allotment as ee on ee.exam_det_id=ed.exam_det_id "
					+ "join staff_details as s on ee.staff_id=s.staff_id where ed.exam_det_id=?;");
			pst.setInt(1, examDetailId);
			rs = pst.executeQuery();

			while (rs.next()) {
				examDetails.setExamDetailId(examDetailId);
				examDetails.setExamDetailName(rs.getString(2));
				examDetails.setExamDate(rs.getDate(3));
				examDetails.setExamModeName(rs.getString(4));
				examDetails.setPassScore(rs.getInt(5));
				examDetails.setStaffId(rs.getInt(6));
				examDetails.setDeptId(rs.getInt(7));
				examDetails.setExamModeId(rs.getInt(8));
			}

		} catch (ClassNotFoundException | SQLException ex) {
			ex.printStackTrace();
		} finally {
			pst.close();
			DBDAO.closeDbCon();
		}

		return examDetails;

	}

	// ---------------------------Start-----------------------------------------------

	public static List<ExamDetailsBean> listAllExams() throws SQLException, ClassNotFoundException {

		List<ExamDetailsBean> exams = new ArrayList<>();

		try {
			con = getConnection();
			pst = con.prepareStatement("SELECT exam_det_id, exam_det_name FROM exam_details");
			rs = pst.executeQuery();

			while (rs.next()) {
				ExamDetailsBean exam = new ExamDetailsBean();
				exam.setExamDetailId(rs.getInt(1));
				exam.setExamDetailName(rs.getString(2));
				exams.add(exam);
			}
		} finally {
			DBDAO.closeDbCon();
			pst.close();
		}
		return exams;
	}

// ---------------------------Start-----------------------------------------------

	public static ExamDetailsBean getPassIdForUpdate(int examDetailId) throws SQLException, ClassNotFoundException {
		ExamDetailsBean examDetails = new ExamDetailsBean();

		try {
			con = getConnection();

			pst = con.prepareStatement("select pass_id from exam_details where exam_det_id=?");
			pst.setInt(1, examDetailId);
			rs = pst.executeQuery();

			while (rs.next()) {
				examDetails.setPassId(rs.getInt(1));
			}

		} catch (ClassNotFoundException | SQLException ex) {
			ex.printStackTrace();
		} finally {
			pst.close();
			DBDAO.closeDbCon();
		}

		return examDetails;

	}

	// ---------------------------Start-----------------------------------------------

	public static boolean updateExamDetails(ExamDetailsBean examDetails) throws SQLException, ClassNotFoundException {
		boolean flag = false;

		try {
			con = getConnection();

			pst = con.prepareStatement(
					"update exam_details set exam_mode_id=?,exam_det_name=?,exam_det_date=? where exam_det_id=?");
			pst.setInt(1, examDetails.getExamModeId());
			pst.setString(2, examDetails.getExamDetailName());
			pst.setDate(3, examDetails.getExamDetailDate());
			pst.setInt(4, examDetails.getExamDetailId());
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

	public static boolean deleteExamDetails(int examDetailId) throws SQLException, ClassNotFoundException {
		boolean flag = false;

		try {
			con = getConnection();

			pst = con.prepareStatement("delete from exam_details where exam_det_id=?");

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
	
	// ---------------------------Start-----------------------------------------------

		public static ExamDetailsBean fetchUpcomingExam() throws SQLException, ClassNotFoundException {
			ExamDetailsBean examDetails = new ExamDetailsBean();

			try {
				con = getConnection();

				pst = con.prepareStatement("SELECT exam_det_date FROM exam_details "
						+ "WHERE exam_det_date >= CURDATE() ORDER BY exam_det_date ASC LIMIT 1;");
				rs = pst.executeQuery();

				if (rs.next()) {
					examDetails.setExamDetailDate(rs.getDate(1));
				}

			} catch (ClassNotFoundException | SQLException ex) {
				ex.printStackTrace();
			} finally {
				pst.close();
				DBDAO.closeDbCon();
			}

			return examDetails;

		}

}
