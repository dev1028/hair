package com.yedam.hairshop.hairshop;

import java.io.IOException;

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
		MembersDesignerRsvVo mDRVo = new MembersDesignerRsvVo();
		mDRVo.setMdr_status(mdrStatus);
		mDRVo.setMdr_no(mdrNo);
		
		int r = MembersReservationDAO.getInstance().updateMdrStatus(mDRVo);
		response.getWriter().print(r);
	}

}
