package com.luminar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.luminar.dto.BatchResultDTO;
import com.luminar.model.BatchBean;

public class BatchDAO {
	
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
		
				public static List<BatchResultDTO> listBatches() throws SQLException, ClassNotFoundException {
					List<BatchResultDTO> batches = new ArrayList<>();
					try {
						con=getConnection();
						
						pst=con.prepareStatement("select b.batch_id,c.course_name,b.batch_name from batches as b join course as c on b.course_id=c.course_id;");
						
						rs=pst.executeQuery();
						
						while(rs.next()) {
							BatchResultDTO batch=new BatchResultDTO();
							batch.setBatchId(rs.getInt(1));
							batch.setCourseName(rs.getString(2));
							batch.setBatchName(rs.getString(3));
							batches.add(batch);
						}
						
					}catch(ClassNotFoundException|SQLException ex) {
						ex.printStackTrace();
					}finally {
						DBDAO.closeDbCon();
						pst.close();
					}
					return batches;
					}
				
				// ---------------------------Start-----------------------------------------------
				
				public static boolean insertBatch(BatchBean batchBean) throws SQLException, ClassNotFoundException {
					boolean flag=false;
					try {
						con=getConnection();
						
						pst=con.prepareStatement("insert into batches(course_id,batch_name) values(?,?)");
						pst.setInt(1, batchBean.getCourseId());
						pst.setString(2, batchBean.getBatchName());
						
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
				
				public static boolean updateBatch(BatchBean batchBean) throws SQLException, ClassNotFoundException {
					boolean flag = false;

					try {
						con = getConnection();

						pst = con.prepareStatement("update batches set course_id=?,batch_name=? where batch_id=?");
						pst.setInt(1 , batchBean.getCourseId());
						pst.setString(2, batchBean.getBatchName());
						pst.setInt(3 , batchBean.getBatchId());
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
				
				public static boolean deleteBatch(int batchId) throws SQLException, ClassNotFoundException {
					boolean flag = false;

					try {
						con = getConnection();

						pst = con.prepareStatement("delete from batches where batch_id=?");
					
						pst.setInt(1, batchId);
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
