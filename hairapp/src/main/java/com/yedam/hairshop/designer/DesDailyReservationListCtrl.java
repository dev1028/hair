package com.yedam.hairshop.designer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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

public class DesDailyReservationListCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String  designerNo = (String) request.getSession().getAttribute("designerNo");
		DesignerVo designerVo = new DesignerVo();
		designerVo.setDesigner_no(designerNo);
		
		//디자이너 정보 넘기기
		designerVo = DesignerDAO.getInstance().selectOne(designerVo);
		request.setAttribute("designer", designerVo);
		
		// 미용실 휴무일 가져오기
		HairshopVo hVo = new HairshopVo();
		hVo.setHs_no(designerVo.getHs_no());
		hVo = HairshopDAO.getInstance().selectOne(hVo);
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
		
		//디자이너 휴무일
		JSONObject dseDayoff = new JSONObject();
		String[] desArray;
		String[] desDayonList = { "0", "1", "2", "3", "4", "5", "6" };
		List<String> desList = new ArrayList<>(Arrays.asList(desDayonList));
		if (designerVo.getDesigner_dayoff() != null) {

			String desDayoffListString = designerVo.getDesigner_dayoff();
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
		dseDayoff.put("startTime", designerVo.getWork_start_time()+":00");
		dseDayoff.put("endTime", designerVo.getWork_end_time()+":00");
		request.setAttribute("desDayoff", dseDayoff);
		
		String uri = request.getRequestURI();					
		String contextPath = request.getContextPath();			
		String path = uri.substring(contextPath.length());
		
		if(path.equals("/designer/desDailyReservationList.do")) {
			request.getRequestDispatcher("/designer/desDailyReservation.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/designer/desWeeklyReservation.jsp").forward(request, response);
		}
	}

}
