package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MemDesigneRsvInfoDAO;
import com.yedam.hairshop.dao.MembersReservationDAO;

import net.sf.json.JSONArray;

public class HairshopNextCustomerAjCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hsNo = (String) request.getSession().getAttribute("hsno");
		String startTime = request.getParameter("startTime");

		List<Map<String, String>> resultCustomer = new ArrayList<Map<String, String>>();
		resultCustomer = MembersReservationDAO.getInstance().selectResNextForHS(hsNo, startTime);

		if (resultCustomer.size() == 0) {
			response.getWriter().print(0);
		} else {
			for (Map<String, String> map : resultCustomer) {
				List<Map<String, String>> listMDRI = MemDesigneRsvInfoDAO.getInstance()
						.rsvInfoHairName(map.get("mdr_no"));
				String hairName = "";
				for (Map<String, String> mdri : listMDRI) {
					hairName += mdri.get("hhi_name").trim() + " ";
				}
				map.put("hair_name", hairName);
			}
			response.getWriter().print(JSONArray.fromObject(resultCustomer));
		}

	}

}
