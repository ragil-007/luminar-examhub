package com.luminar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.luminar.model.CourseBean;

public class CourseDAO {
	
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
		
				public static List<CourseBean> listCourses() throws SQLException, ClassNotFoundException {
					List<CourseBean> courses = new ArrayList<>();
					try {
						con=getConnection();
						
						pst=con.prepareStatement("select * from course");
						
						rs=pst.executeQuery();
						
						while(rs.next()) {
							CourseBean course=new CourseBean();
							course.setCourseId(rs.getInt(1));
							course.setCourseName(rs.getString(2));
							courses.add(course);
						}
						
					}catch(ClassNotFoundException|SQLException ex) {
						ex.printStackTrace();
					}finally {
						DBDAO.closeDbCon();
						pst.close();
					}
					return courses;
					}
				
				// ---------------------------Start-----------------------------------------------
				
				public static boolean insertCourse(CourseBean courseBean) throws SQLException, ClassNotFoundException {
					boolean flag=false;
					try {
						con=getConnection();
						
						pst=con.prepareStatement("insert into course(course_name) values(?)");
						pst.setString(1, courseBean.getCourseName());
						
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
				
				public static CourseBean getCourse(int courseId) throws SQLException, ClassNotFoundException {
					CourseBean course = new CourseBean();

					try {
						con = getConnection();

						pst = con.prepareStatement("select course_name from course where course_id=?");
						pst.setInt(1, courseId);
						rs = pst.executeQuery();

						while (rs.next()) {
							course.setCourseId(courseId);
							course.setCourseName(rs.getString(1));
						}

					} catch (ClassNotFoundException | SQLException ex) {
						ex.printStackTrace();
					} finally {
						pst.close();
						DBDAO.closeDbCon();
					}

					return course;

				}
				// ---------------------------Start-----------------------------------------------
				
				public static boolean updateCourse(CourseBean courseBean) throws SQLException, ClassNotFoundException {
					boolean flag = false;

					try {
						con = getConnection();

						pst = con.prepareStatement("update course set course_name=? where course_id=?");
						pst.setString(1, courseBean.getCourseName());
						pst.setInt(2 , courseBean.getCourseId());
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
				
				public static boolean deleteCourse(int courseId) throws SQLException, ClassNotFoundException {
					boolean flag = false;

					try {
						con = getConnection();

						pst = con.prepareStatement("delete from course where course_id=?");
					
						pst.setInt(1, courseId);
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
