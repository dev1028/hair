package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.HairshopVo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class DailyReservationListCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hs_no = (String) request.getSession().getAttribute("hsno");
		// 미용실정보
		HairshopVo hVo = new HairshopVo();
		//System.out.println(hs_no);
		hVo.setHs_no(hs_no);
		hVo = HairshopDAO.getInstance().selectOne(hVo);
		// 미용실 휴무일 가져오기
		String dayoffListString = hVo.getHs_dayoff();
		String[] dayoffList = dayoffListString.split(",");
		String[] dayonList = { "0", "1", "2", "3", "4", "5", "6" };
		List<String> list = new ArrayList<>(Arrays.asList(dayonList));

		for (int j = 0; j < dayoffList.length; j++) {

			for (int i = 0; i < list.size(); i++) {
				if (dayoffList[j].equals(list.get(i))) {
					list.remove(i);
					break;
				}
			}
		}
		request.setAttribute("dayonList", JSONArray.fromObject(list));
		request.setAttribute("start", hVo.getHs_starttime() + ":00");
		request.setAttribute("end", hVo.getHs_endtime() + ":00");
		// 디자이너 휴무일 가져오기

		// 미용실디자이너 목록
		DesignerVo dVo = new DesignerVo();
		dVo.setHs_no(hs_no);
		ArrayList<DesignerVo> emplist = DesignerDAO.getInstance().selectByHairShop(dVo);

		JSONArray st = new JSONArray();
		int lenCol = ColorList.Color.length;
		int cnt = 0;
		for (DesignerVo des : emplist) {
			JSONObject dseDayoff = new JSONObject();
			String[] desArray;
			String[] desDayonList = { "0", "1", "2", "3", "4", "5", "6" };
			List<String> desList = new ArrayList<>(Arrays.asList(desDayonList));
			if (des.getDesigner_dayoff() != null) {

				String desDayoffListString = des.getDesigner_dayoff();
				String[] desDayoffList = desDayoffListString.split(",");

				for (int j = 0; j < desDayoffList.length; j++) {

					for (int i = 0; i < desList.size(); i++) {
						if (desDayoffList[j].equals(desList.get(i))) {
							desList.remove(i);
							break;
						}
					}
				}
				desArray = desList.toArray(new String[desList.size()]);
				dseDayoff.put("daysOfWeek", desArray);
			} else {
				desArray = desList.toArray(new String[desList.size()]);
				dseDayoff.put("daysOfWeek", desArray);
			}
			//System.out.println(des.getWork_start_time() + " : " +des.getWork_end_time());
			dseDayoff.put("startTime", des.getWork_start_time()+":00");
			dseDayoff.put("endTime", des.getWork_end_time()+":00");

			JSONObject dseJson = new JSONObject();
			dseJson.put("id", des.getDesigner_no());
			dseJson.put("title", ((des.getPosition() == null) ? "" : des.getPosition() +" ")+ des.getDesigner_name());
			String color = ColorList.Color[cnt++];
			dseJson.put("eventColor", color);
			dseJson.put("businessHours", dseDayoff);
			st.add(dseJson);
			if (cnt == lenCol) {
				cnt = 0;
			}
		}

		request.setAttribute("hairshop", hVo);
		request.setAttribute("hairshopjson", JSONObject.fromObject(hVo));
		request.setAttribute("emplistjson", JSONArray.fromObject(st));
		request.setAttribute("emplist", emplist);
		
		String uri = request.getRequestURI();					
		String contextPath = request.getContextPath();			
		String path = uri.substring(contextPath.length());
		if(path.equals("/hairshop/dailyReservationList.do")) {
			request.getRequestDispatcher("/hairshop/dailyReservation.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/hairshop/weeklyReservation.jsp").forward(request, response);
		}
	}

}
