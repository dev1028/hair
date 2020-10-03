package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.HairshopVo;

import net.sf.json.JSONArray;

public class MonthlyReservationListCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String hs_no = (String) request.getSession().getAttribute("hsno");

		// 미용실 휴무일 가져오기
		HairshopVo hVo = new HairshopVo();
		hVo.setHs_no(hs_no);
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
		request.setAttribute("hairshop", hVo);
		request.setAttribute("dayonList", JSONArray.fromObject(list));
		request.setAttribute("start", hVo.getHs_starttime() + ":00");
		request.setAttribute("end", hVo.getHs_endtime() + ":00");

		request.getRequestDispatcher("/hairshop/monthlyReservation.jsp").forward(request, response);
	}

}
