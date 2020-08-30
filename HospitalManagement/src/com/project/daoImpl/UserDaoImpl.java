package com.project.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.project.been.objs.PharmacyDtls;
import com.project.dbconnection.MyConnectionProvider;

public class UserDaoImpl {
Connection conn=null;

	public PharmacyDtls getUserLoginDetails(String userName, String passWord) {
		PharmacyDtls dtls=new PharmacyDtls();
		String userQuery="select * from create_pharmacy where USER_NAME=? and PASSWORD=?";	
    
    try {
		conn=MyConnectionProvider.getConn();
		PreparedStatement ps=conn.prepareStatement(userQuery);
		ps.setString(1, userName);
		ps.setString(2, passWord);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			dtls.setPharmacyId(rs.getString(1));
			dtls.setGstInTaxId(rs.getString(2));
			dtls.setPharmacyName(rs.getString(3));
			dtls.setAddress(rs.getString(4));
			dtls.setPhoneNo(rs.getString(5));
			dtls.setGstInTaxNo(rs.getString(6));
			dtls.setDlNo(rs.getString(7));
			dtls.setDoctorName(rs.getString(8));
			dtls.setUserName(rs.getString(9));
			
			String totalsQuery="select sum(PAID_AMOUNT) \"paidamount\",sum(CGST_AMOUNT) \"cgstTot\",sum(SGST_AMOUNT) \"sgstTot\" ,sum(CGST_PER)\"csgtPer\",sum(SGST_PER)\"sgstPer\",count(*) \"totSaleMedicines\"from medical_report_dtls";
            PreparedStatement ps1=conn.prepareStatement(totalsQuery);
            ResultSet rs1=ps1.executeQuery();
            while(rs1.next()) {
            	dtls.setTotalIncome(rs1.getString("paidamount"));
            	dtls.setTotCgstAmount(rs1.getString("cgstTot"));
            	dtls.setTotSgstAmount(rs1.getString("sgstTot"));
            	dtls.setTotSaleMedicines(rs1.getString("totSaleMedicines"));
            	dtls.setTotCgstPer(rs1.getString("csgtPer"));
            	dtls.setTotSgstPer(rs1.getString("sgstPer"));
            }
		}
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
		return dtls;
	}

}
