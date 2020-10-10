package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopHairInfoDAO;
import com.yedam.hairshop.model.HairshopHairInfoVo;

public class HairInfoListCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hsNo = (String) request.getSession().getAttribute("hsno");

		if (request.getParameter("inputSearch") != null) {
			HairshopHairInfoVo hsHIVo = new HairshopHairInfoVo();
			hsHIVo.setHs_no(hsNo);

			String divisionSearch = request.getParameter("divisionSearch");
			String inputSearch = request.getParameter("inputSearch");
			if (divisionSearch.equals("hhi_name")) {
				hsHIVo.setHhi_name(inputSearch);
			} else if (divisionSearch.equals("tmac_name")) {
				hsHIVo.setTmac_name(inputSearch);
			}
			List<HairshopHairInfoVo> list = HairshopHairInfoDAO.getInstance().selectHairInfoListForSer(divisionSearch,
					hsHIVo);
			if (list.size() == 0) {
				request.setAttribute("hairNotFound", 0);
			} else {
				request.setAttribute("hairList", list);
			}
			request.getRequestDispatcher("/hairshop/hairInfoList.jsp").forward(request, response);

		} else {
			response.sendRedirect(request.getContextPath() + "/hairshop/hairInfoFullList.do");
		}

	}

}
