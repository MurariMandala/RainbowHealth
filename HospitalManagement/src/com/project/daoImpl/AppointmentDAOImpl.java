package com.project.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.project.been.objs.AppointmentDtls;
import com.project.dbconnection.MyConnectionProvider;

public class AppointmentDAOImpl {
Connection conn=null;
	public void bookAppointment(AppointmentDtls dtls) {
    
		String bookingQuery="insert into appointment_dtls (BOOKKING_ID,NAME,PHONE_NO,DATE,TYPE_OF_SERVICE,LATEST)values(?,?,?,?,?,?)";
		
		
		try {
			conn=MyConnectionProvider.getConn();
			PreparedStatement ps=conn.prepareStatement(bookingQuery);
			ps.setString(1, dtls.getBookkingId());
			ps.setString(2, dtls.getName());
			ps.setString(3, dtls.getPhoneNo());
			ps.setString(4, dtls.getDate());
			ps.setString(5, dtls.getTypeOfService());
			ps.setInt(6, 1);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		
		}
	}
	public List<AppointmentDtls> viewAppointments(int latest) {
		
		List<AppointmentDtls> dtlsList=new ArrayList<>();
	String viewAppointmentsQuery="select BOOKKING_ID \"BOOKKING_ID\",NAME\"NAME\",PHONE_NO \"PHONE_NO\" ,DATE,TYPE_OF_SERVICE \"TYPE_OF_SERVICE\" from appointment_dtls where LATEST=?";
 
	try {
		conn=MyConnectionProvider.getConn();
		PreparedStatement ps=conn.prepareStatement(viewAppointmentsQuery);
		ps.setInt(1,latest );
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			AppointmentDtls dtls=new AppointmentDtls();
			dtls.setBookkingId(rs.getString("BOOKKING_ID"));
			dtls.setName(rs.getString("NAME"));
			dtls.setPhoneNo(rs.getString("PHONE_NO"));
			dtls.setDate(rs.getString("DATE"));
			dtls.setTypeOfService(rs.getString("TYPE_OF_SERVICE"));
			dtlsList.add(dtls);
		}
	} catch (Exception e) {
   e.printStackTrace();
	}
	
	
	return dtlsList;
	}

}
