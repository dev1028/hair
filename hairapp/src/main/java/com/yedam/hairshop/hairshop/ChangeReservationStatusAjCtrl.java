package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersReservationDAO;
import com.yedam.hairshop.model.MembersDesignerRsvVo;

public class ChangeReservationStatusAjCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mdrStatus = request.getParameter("mdr_status");
		String mdrNo = request.getParameter("mdr_no");
		String checkChange = request.getParameter("check");
		MembersDesignerRsvVo mDRVo = new MembersDesignerRsvVo();
		mDRVo.setMdr_status(mdrStatus);
		mDRVo.setMdr_no(mdrNo);

		LocalDateTime currDT = LocalDateTime.now();
		Map<String,String> mr = MembersReservationDAO.getInstance().selectReservationOne(mdrNo);
		System.out.println(mr);
		int r = -1;
		if(checkChange.equals("Y")) {
			r = MembersReservationDAO.getInstance().updateMdrStatus(mDRVo);
		}
		if (!mr.isEmpty() || r == -1) {
			String targetDateTime = mr.get("mdr_date");
			String endDateTime = mr.get("sum_time");
			
			LocalDateTime targetDT = LocalDateTime.parse(targetDateTime.replace(" ", "T"));
			LocalDateTime endDT = LocalDateTime.parse(endDateTime.replace(" ", "T"));
			
			if(currDT.isBefore(targetDT)) {
				//예약시간보다 전임
				if(currDT.isBefore(targetDT.minusHours(1))) {
					//예약시간-1시간 보다 전임
					r = -3;
				}else {
					//예약시간과 현재시간이 1시간사이임
					r = -2;
				}
				
			} else if(currDT.isBefore(endDT)) {
				//예약시간 안에 있음
				r = MembersReservationDAO.getInstance().updateMdrStatus(mDRVo);
			} else {
				//종료시간 보다 뒤임
				if(currDT.isAfter(endDT.plusHours(1))) {
					//종료시간 보다 한시간 뒤 보다 뒤
					r = 3;
				} else {
					//종료시간과 종료시간한시간뒤 그 사이
					r = 2;
					
				}
			}
		}
	//	System.out.println("sout--> " + r );
		response.getWriter().print(r);
	}

}
