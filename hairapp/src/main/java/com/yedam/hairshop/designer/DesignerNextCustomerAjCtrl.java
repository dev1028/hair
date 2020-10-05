package com.yedam.hairshop.designer;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.MapUtils;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MemDesigneRsvInfoDAO;
import com.yedam.hairshop.dao.MembersReservationDAO;

import net.sf.json.JSONObject;

public class DesignerNextCustomerAjCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String desNo = (String) request.getSession().getAttribute("designerNo");
		String startTime = request.getParameter("startTime");
		
		Map<String, String> resultCustomer = new HashMap<String, String>();
		resultCustomer = MembersReservationDAO.getInstance().selectReservationNext(desNo, startTime);
		
		if( MapUtils.isEmpty(resultCustomer)) {
			response.getWriter().print(0);
		} else {
			List<Map<String,String>> listMDRI = MemDesigneRsvInfoDAO.getInstance().rsvInfoHairName(resultCustomer.get("mdr_no"));
			String hairName = "";
			for(Map<String,String> mdri : listMDRI) {
				hairName += mdri.get("hhi_name").trim() + " ";
			}
			resultCustomer.put("hair_name", hairName);
			
			response.getWriter().print(JSONObject.fromObject(resultCustomer));			
		}
	}

}
