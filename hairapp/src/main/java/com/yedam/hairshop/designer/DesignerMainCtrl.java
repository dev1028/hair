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

public class DesignerMainCtrl implements Controller {

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
		List<String> list;
		String[] dayonList = { "0", "1", "2", "3", "4", "5", "6" };
		if(dayoffListString != null) {
			String[] dayoffList;
			if(dayoffListString.length() == 1) {
				System.out.println("하루만 쉰다");
				dayoffList = new String[1];
				dayoffList[0] = dayoffListString;
			} else {
				dayoffList = dayoffListString.split(",");
			}
			list = new ArrayList<>(Arrays.asList(dayonList));
			
			for (int j = 0; j < dayoffList.length; j++) {
				
				for (int i = 0; i < list.size(); i++) {
					if (dayoffList[j].equals(list.get(i))) {
						list.remove(i);
						break;
					}
				}
			}
		} else {
			list = new ArrayList<>(Arrays.asList(dayonList));
		}
		System.out.println("우리는 이만큼 출근함 "+list);
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

		request.getRequestDispatcher("/designer/designerMain.jsp").forward(request, response);	
	}

}
