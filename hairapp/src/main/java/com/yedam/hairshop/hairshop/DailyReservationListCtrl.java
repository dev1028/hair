package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.model.DesignerVo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class DailyReservationListCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hs_no = (String) request.getSession().getAttribute("hsno");
		DesignerVo dVo = new DesignerVo();
		dVo.setHs_no(hs_no);
		ArrayList<DesignerVo> emplist = DesignerDAO.getInstance().selectByHairShop(dVo);
		
		JSONArray st = new JSONArray();
		for(DesignerVo des : emplist) {
			JSONObject dseJson = new JSONObject();
			dseJson.put("id",des.getDesigner_no());
			dseJson.put("title",des.getDesigner_name());
			st.add(dseJson);
		}	

		request.setAttribute("emplistjson", JSONArray.fromObject(st));
		request.setAttribute("emplist", emplist);
		request.getRequestDispatcher("/hairshop/dailyReservaition.jsp").forward(request, response);
	}

}
