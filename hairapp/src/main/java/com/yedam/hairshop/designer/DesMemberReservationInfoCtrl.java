package com.yedam.hairshop.designer;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MemDesigneRsvInfoDAO;
import com.yedam.hairshop.dao.MembersReservationDAO;
import com.yedam.hairshop.model.MembersReservationVo;

public class DesMemberReservationInfoCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mdrNo = request.getParameter("mdrNo");
		MembersReservationVo result = MembersReservationDAO.getInstance().selectReservationDetailInfo(mdrNo);
		
		List<Map<String, String>> list = MemDesigneRsvInfoDAO.getInstance().selectHairInfo(mdrNo);
		
		request.setAttribute("mdrResult", result);
		request.setAttribute("detailInfo", list);
		request.getRequestDispatcher("/designer/desMemberReservationInfo.jsp").forward(request, response);

	}

}
