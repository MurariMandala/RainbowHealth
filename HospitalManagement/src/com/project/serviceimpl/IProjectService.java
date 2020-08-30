package com.project.serviceimpl;

import javax.servlet.http.HttpServletRequest;

import com.project.been.objs.MedicalReportDtls;
import com.project.been.objs.PharmacyDtls;

public interface IProjectService {

	void saveReport(MedicalReportDtls medReportDtls);
	MedicalReportDtls getTodaysAllReports(String todayDate, int parentId, String selectedId);
	PharmacyDtls getPharmacyDetails();
	MedicalReportDtls getMedicineListForPopup(HttpServletRequest request);
	void saveMedicines(MedicalReportDtls dtls);

}
