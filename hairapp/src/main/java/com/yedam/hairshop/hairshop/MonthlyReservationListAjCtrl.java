package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.HashMap;
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

public class MonthlyReservationListAjCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String HsNo = (String) request.getSession().getAttribute("hsno");
		String startDate = request.getParameter("startDate");
		
		String endDate = request.getParameter("endDate");
		//System.out.println(startDate.substring(0, 10));
		//System.out.println(endDate.substring(0, 10));
		List<Map<String,String>> list = MembersReservationDAO.getInstance().selectReservationList(HsNo, startDate.substring(0, 10), endDate.substring(0, 10) );	
		Map<Integer,String> mappingDesColor = new HashMap<Integer,String>(); // 디자이너별 컬러색상 매치
		int cntColorRe = 0; // 색상 추가용 인덱스 숫자
		int lenCol = ColorList.Color.length; //색상배열 길이
		
		JSONArray st = new JSONArray();
		for(Map<String,String> des : list) {
			List<Map<String,String>> listMDRI = MemDesigneRsvInfoDAO.getInstance().rsvInfoHairName(des.get("mdr_no"));
			String hairName = "";
			for(Map<String,String> mdri : listMDRI) {
				hairName += mdri.get("hhi_name") + " ";
			}
			JSONObject dseJson = new JSONObject();
			dseJson.put("id",des.get("mdr_no"));
			dseJson.put("title",des.get("designer_name")+": "+des.get("mem_name")+"- "+hairName);
			dseJson.put("start",des.get("mdr_date").replace(" ", "T")+":00");
			dseJson.put("end",des.get("sum_time").replace(" ", "T")+":00");
			
			
			//디자이너별 이벤트 색상추가
			Integer checkDesNo = Integer.parseInt(des.get("designer_no"));
			
			String colorResult = "";
			if(mappingDesColor.get(checkDesNo) != null) {
				colorResult = mappingDesColor.get(checkDesNo);
			} else {
				mappingDesColor.put(checkDesNo, ColorList.Color[cntColorRe++]);
				colorResult = mappingDesColor.get(checkDesNo);
			}
			dseJson.put("backgroundColor", colorResult);
			st.add(dseJson);
			if (cntColorRe == lenCol) {
				cntColorRe = 0;
			}
			
		}	
		
		String str = JSONArray.fromObject(st).toString();
		response.getWriter().print(str);
		
		
		
//		
//		JSONArray st = new JSONArray();
//		for(Map<String,String> des : list) {
//			List<Map<String,String>> listMDRI = MemDesigneRsvInfoDAO.getInstance().rsvInfoHairName(des.get("mdr_no"));
//			String hairName = "";
//			for(Map<String,String> mdri : listMDRI) {
//				hairName += mdri.get("hhi_name") + " ";
//			}
//			JSONObject dseJson = new JSONObject();
//			dseJson.put("resourceId",des.get("designer_no"));
//			dseJson.put("id",des.get("mdr_no"));
//			dseJson.put("title",des.get("mem_name")+": "+hairName);
//			dseJson.put("start",des.get("mdr_date").replace(" ", "T")+":00");
//			dseJson.put("end",des.get("sum_time").replace(" ", "T")+":00");
//			if(des.get("mdr_status").equals("i1")) {
//				dseJson.put("backgroundColor","#d9534f");
//			} else if(des.get("mdr_status").equals("i2")) {
//				dseJson.put("backgroundColor","#5cb85c");
//			} else if(des.get("mdr_status").equals("i3")) {
//				dseJson.put("backgroundColor","#5bc0de");
//			} else if(des.get("mdr_status").equals("i4")) {
//				dseJson.put("backgroundColor","#6c757d");
//			}
//			st.add(dseJson);
//		}	
//		
//		String str = JSONArray.fromObject(st).toString();
//		//System.out.println(str);
//		response.getWriter().print(str);

	}

}
