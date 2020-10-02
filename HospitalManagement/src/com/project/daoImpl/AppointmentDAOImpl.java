package com.project.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.util.StringUtils;
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
	public List<AppointmentDtls> SearchAppointMent(String searchOption, String input) {
		List<AppointmentDtls> list=new ArrayList<>();
		StringBuffer bf=new StringBuffer();
		String searchQuery="select BOOKKING_ID \"apntmntId\",NAME \"name\",PHONE_NO \"phone\", DATE ,TYPE_OF_SERVICE \"tos\" FROM appointment_dtls where ";
		bf.append(searchQuery);
		try {
			conn=MyConnectionProvider.getConn();
			if(!StringUtils.isNullOrEmpty(searchOption)&&searchOption.equalsIgnoreCase("appointMentId")) {
				String Where="BOOKKING_ID like'%"+input+"%'";
				bf.append(Where);
			}
			if(!StringUtils.isNullOrEmpty(searchOption)&&searchOption.equalsIgnoreCase("phoneNo")) {
				String Where="PHONE_NO like'%"+input+"%'";
				bf.append(Where);
			}
			
			PreparedStatement ps=conn.prepareStatement(bf.toString());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				AppointmentDtls dtls=new AppointmentDtls();
				dtls.setBookkingId(rs.getString("apntmntId"));
				dtls.setName(rs.getString("name"));
				dtls.setPhoneNo(rs.getString("phone"));
				dtls.setDate(rs.getString("DATE"));
				dtls.setTypeOfService(rs.getString("tos"));
				list.add(dtls);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
