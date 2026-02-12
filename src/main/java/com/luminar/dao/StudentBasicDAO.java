package com.luminar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.luminar.dto.StudentResultDTO;
import com.luminar.model.ExamDetailsBean;
import com.luminar.model.StudentBasicBean;
import java.sql.Statement;

public class StudentBasicDAO {
	
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
		
				public static List<StudentResultDTO> listStudents() throws SQLException, ClassNotFoundException {
					List<StudentResultDTO> students = new ArrayList<>();
					try {
						con=getConnection();
						
						pst=con.prepareStatement("select sb.student_id,sb.student_name,sb.student_contact,sb.student_qualification,sb.student_graduation_year,"
								+ "se.student_company,se.student_designation,se.student_total_exp,se.student_technology from student_basic_details as sb "
								+ "left join student_experience_details as se on sb.student_id=se.student_id;");
						
						rs=pst.executeQuery();
						
						while(rs.next()) {
							StudentResultDTO student=new StudentResultDTO();
							student.setStuId(rs.getInt(1));
							student.setStuName(rs.getString(2));
							student.setStuContact(rs.getString(3));
							student.setStuQualification(rs.getString(4));
							student.setStuGraduationDate(rs.getInt(5));
							student.setStuCompany(rs.getString(6));
							student.setStuDesignation(rs.getString(7));
							student.setStuTotalExp(rs.getInt(8));
							student.setStuTech(rs.getString(9));
							students.add(student);
						}
						
					}catch(ClassNotFoundException|SQLException ex) {
						ex.printStackTrace();
					}finally {
						DBDAO.closeDbCon();
						pst.close();
					}
					return students;
					}
				
				// ---------------------------Start----------------------------------------------

				public static List<StudentBasicBean> listAllStudents() throws SQLException, ClassNotFoundException {

					List<StudentBasicBean> students = new ArrayList<>();

					try {
						con = getConnection();
						pst = con.prepareStatement("select student_id, student_name from student_basic_details");
						rs = pst.executeQuery();

						while (rs.next()) {
							StudentBasicBean student = new StudentBasicBean();
							student.setStuId(rs.getInt(1));
							student.setStuName(rs.getString(2));
							students.add(student);
						}
					} finally {
						DBDAO.closeDbCon();
						pst.close();
					}
					return students;
				}
				
				// ---------------------------Start----------------------------------------------

				public static List<StudentBasicBean> getStudentsNotInExam(int examId) throws SQLException, ClassNotFoundException {

					List<StudentBasicBean> students = new ArrayList<>();

					try {
						con = getConnection();
						pst = con.prepareStatement("select s.student_id, s.student_name from student_basic_details as s "
								+ "left join exam_score as e on e.student_id=s.student_id and e.exam_det_id=? "
								+ "where e.student_id is null;");
						pst.setInt(1, examId);
						rs = pst.executeQuery();

						while (rs.next()) {
							StudentBasicBean student = new StudentBasicBean();
							student.setStuId(rs.getInt(1));
							student.setStuName(rs.getString(2));
							students.add(student);
						}
					} finally {
						DBDAO.closeDbCon();
						pst.close();
					}
					return students;
				}
				
				// ---------------------------Start-----------------------------------------------
				
				public static int insertStudentBasic(StudentBasicBean stuBasic) throws SQLException, ClassNotFoundException {
					int stuId=0;
					try {
						con=getConnection();
						
						pst=con.prepareStatement("insert into student_basic_details(student_name,student_contact,student_qualification,student_graduation_year) "
								+ "values(?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
						pst.setString(1, stuBasic.getStuName());
						pst.setString(2, stuBasic.getStuContact());
						pst.setString(3, stuBasic.getStuQualification());
						pst.setInt(4, stuBasic.getStuGraduationDate());
						
						pst.executeUpdate();
						
						ResultSet rs = pst.getGeneratedKeys();
				        if (rs.next()) {
				        	stuId=rs.getInt(1);
				        }
						
					}catch(ClassNotFoundException|SQLException ex) {
						ex.printStackTrace();
					}finally {
						DBDAO.closeDbCon();
						pst.close();
					}
					return stuId;
					}
				
// ---------------------------Start-----------------------------------------------
				
				public static StudentBasicBean getStudentId(String contactNo) throws SQLException, ClassNotFoundException {
					StudentBasicBean stuBasic = new StudentBasicBean();

					try {
						con = getConnection();

						pst = con.prepareStatement("select student_id from student_basic_details where student_contact=?");
						pst.setString(1, contactNo);
						rs = pst.executeQuery();

						while (rs.next()) {
							stuBasic.setStuId(1);
						}

					} catch (ClassNotFoundException | SQLException ex) {
						ex.printStackTrace();
					} finally {
						pst.close();
						DBDAO.closeDbCon();
					}

					return stuBasic;

				}
				
				// ---------------------------Start-----------------------------------------------
				
				public static StudentResultDTO getStudent(int stuId) throws SQLException, ClassNotFoundException {
					StudentResultDTO student = new StudentResultDTO();

					try {
						con = getConnection();

						pst = con.prepareStatement("select sb.student_id,sb.student_name,sb.student_contact,sb.student_qualification,sb.student_graduation_year,"
								+ "se.student_company,se.student_designation,se.student_total_exp,se.student_technology from student_basic_details as sb "
								+ "left join student_experience_details as se on sb.student_id=se.student_id where sb.student_id=?;");
						pst.setInt(1, stuId);
						rs = pst.executeQuery();

						while (rs.next()) {
							student.setStuId(rs.getInt(1));
							student.setStuName(rs.getString(2));
							student.setStuContact(rs.getString(3));
							student.setStuQualification(rs.getString(4));
							student.setStuGraduationDate(rs.getInt(5));
							student.setStuCompany(rs.getString(6));
							student.setStuDesignation(rs.getString(7));
							student.setStuTotalExp(rs.getInt(8));
							student.setStuTech(rs.getString(9));
						}

					} catch (ClassNotFoundException | SQLException ex) {
						ex.printStackTrace();
					} finally {
						pst.close();
						DBDAO.closeDbCon();
					}

					return student;

				}
				
// ---------------------------Start-----------------------------------------------
				
				public static List<StudentBasicBean> getStudentsforEditExamResult(int examId,int stuId) throws SQLException, ClassNotFoundException {
					List<StudentBasicBean> students = new ArrayList<>();

					try {
						con = getConnection();

						pst = con.prepareStatement(
					            "select s.student_id, s.student_name " +
					            "from student_basic_details s " +
					            "left join exam_score es " +
					            "on s.student_id = es.student_id " +
					            "and es.exam_det_id = ? " +
					            "where es.student_id is null " +
					            "   or s.student_id = ?"
					        );
						pst.setInt(1, examId);
						pst.setInt(2, stuId);
						rs = pst.executeQuery();

						while (rs.next()) {
							StudentBasicBean student=new StudentBasicBean();
							student.setStuId(rs.getInt(1));
							student.setStuName(rs.getString(2));
							students.add(student);
						}

					} catch (ClassNotFoundException | SQLException ex) {
						ex.printStackTrace();
					} finally {
						pst.close();
						DBDAO.closeDbCon();
					}

					return students;

				}
				

				
				// ---------------------------Start-----------------------------------------------
				
				public static boolean updateStudentBasic(StudentBasicBean stuBasic) throws SQLException, ClassNotFoundException {
					boolean flag = false;

					try {
						con = getConnection();

						pst = con.prepareStatement("update student_basic_details set student_name=?,student_contact=?,student_qualification=?,student_graduation_year=? where student_id=?");
						pst.setString(1 , stuBasic.getStuName());
						pst.setString(2, stuBasic.getStuContact());
						pst.setString(3 , stuBasic.getStuQualification());
						pst.setInt(4 , stuBasic.getStuGraduationDate());
						pst.setInt(5, stuBasic.getStuId());
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
				
				public static boolean deleteStudentBasic(int stuId) throws SQLException, ClassNotFoundException {
					boolean flag = false;

					try {
						con = getConnection();

						pst = con.prepareStatement("delete from student_basic_details where student_id=?");
					
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
