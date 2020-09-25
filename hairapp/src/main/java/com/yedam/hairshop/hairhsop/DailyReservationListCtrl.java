package com.yedam.hairshop.hairhsop;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersReservationDAO;

public class DailyReservationListCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Map<String,String>> list = MembersReservationDAO.getInstance().selectReservationList();
		
		for(Map<String,String> des : list) {
			des.get(key)
		}
		
		JSONObject ds1_1 = new JSONObject();
		for (int i = 0; i < ds1.size(); i++) {
			ds1_1 = new JSONObject();
			ds1_1.put("resourceId", ds1.get(i).getDs_no());
			ds1_1.put("id", ds1.get(i).getRsv_no());
			ds1_1.put("title", ds1.get(i).getMbr_nm());
			ds1_1.put("start", ds1.get(i).getRsv_dt());
			st.add(ds1_1);
		}

		 System.out.println(st);

		String str = JSONArray.fromObject(st).toString();

		System.out.println(str);
		response.getWriter().print(str);
	}

}
