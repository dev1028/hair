package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MemDesigneRsvInfoDAO;
import com.yedam.hairshop.dao.MembersReservationDAO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class DailyReservationListAjCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String HsNo = (String) request.getSession().getAttribute("hsno");
		String startDate = request.getParameter("startDate");
		
		String endDate = request.getParameter("endDate");
		System.out.println(startDate.substring(0, 10));
		System.out.println(endDate.substring(0, 10));
		List<Map<String,String>> list = MembersReservationDAO.getInstance().selectReservationList(HsNo, startDate.substring(0, 10), endDate.substring(0, 10) );
		
		JSONArray st = new JSONArray();
		for(Map<String,String> des : list) {
			List<Map<String,String>> listMDRI = MemDesigneRsvInfoDAO.getInstance().rsvInfoHairName(des.get("mdr_no"));
			String hairName = "";
			for(Map<String,String> mdri : listMDRI) {
				hairName += mdri.get("hhi_name") + " ";
			}
			JSONObject dseJson = new JSONObject();
			dseJson.put("resourceId",des.get("designer_no"));
			dseJson.put("id",des.get("mdr_no"));
			dseJson.put("title",des.get("mem_name")+": "+hairName);
			dseJson.put("start",des.get("mdr_date").replace(" ", "T")+":00");
			dseJson.put("end",des.get("sum_time").replace(" ", "T")+":00");
			st.add(dseJson);
		}	
		
		String str = JSONArray.fromObject(st).toString();
		//System.out.println(str);
		response.getWriter().print(str);
	}

}
