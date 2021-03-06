package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopHairMoreInfoDAO;
import com.yedam.hairshop.dao.MemDesigneRsvInfoDAO;
import com.yedam.hairshop.dao.MembersReservationDAO;
import com.yedam.hairshop.dao.SalesDAO;
import com.yedam.hairshop.model.HairshopHairMoreInfoVo;
import com.yedam.hairshop.model.MembersDetailPaylistVo;
import com.yedam.hairshop.model.MembersReservationVo;

public class HsFindMyCustomerDetailCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String mdrNo = request.getParameter("mdr_no");
		
		MembersReservationVo mRVo = MembersReservationDAO.getInstance().selectReservationDetailInfo(mdrNo);
		
		MembersDetailPaylistVo mDPVo = new MembersDetailPaylistVo();
		mDPVo.setMdr_no(mRVo.getMdr_no());
		List<MembersDetailPaylistVo> payList = SalesDAO.getInstance().selectListByMdrNo(mDPVo);
		
		List<Map<String,String>> hairList = MemDesigneRsvInfoDAO.getInstance().selectHairInfo(mRVo.getMdr_no());
		
		for(Map<String,String> map : hairList) {
			HairshopHairMoreInfoVo hhmiVo = new HairshopHairMoreInfoVo();
			hhmiVo.setHhi_no(map.get("hhi_no"));
			List<HairshopHairMoreInfoVo> list = HairshopHairMoreInfoDAO.getInstance().selectByHhiNo(hhmiVo);
			if(list.size() == 0 || list == null) {
				map.put("hhmi_file", null);
			} else {
				map.put("hhmi_file", list.get(0).getHhmi_file());
			}
		}	
		
		request.setAttribute("customerInfo", mRVo);
		request.setAttribute("payList", payList);
		request.setAttribute("hairList", hairList);
		
		request.getRequestDispatcher("/hairshop/hsFindMyCustomerDetail.jsp").forward(request, response);
	}

}
