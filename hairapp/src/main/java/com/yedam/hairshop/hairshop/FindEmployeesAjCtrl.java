package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.model.DesignerVo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class FindEmployeesAjCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hs_no = request.getParameter("hs_no");
		DesignerVo dVo = new DesignerVo();
		dVo.setHs_no(hs_no);
		ArrayList<DesignerVo> list = DesignerDAO.getInstance().selectByHairShop(dVo);
		
//		System.out.println(list.get(0).getDesigner_name());
//		Gson gson = new Gson();
//		String dlist = gson.toJson(list);
//		response.getWriter().print(dlist);

		
		String dlist = JSONArray.fromObject(list).toString();
		response.getWriter().print(dlist);
		
//		JSONArray outAry = new JSONArray();
//		for (DesignerVo des : list) {
//			JSONArray inAry = new JSONArray();
//			inAry.add(des.getDesigner_no());
//			inAry.add(des.getDesigner_name());
//			inAry.add(des.getHire_date());
//			inAry.add(des.getPosition());
//			outAry.add(inAry);
//		}
//
//		JSONObject jObj = new JSONObject();
//		jObj.put("data", outAry);
//		
//		PrintWriter out = response.getWriter();
//		out.println(jObj.toString());


	}

}
