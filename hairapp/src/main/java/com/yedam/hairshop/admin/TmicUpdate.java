package com.yedam.hairshop.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.TtCategoryDAO;
import com.yedam.hairshop.model.TtCategoryVo;

import net.sf.json.JSONObject;

public class TmicUpdate implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tmac_name = request.getParameter("tmac_name");
		String tmic_no = request.getParameter("tmic_no");
		String tmic_explication = request.getParameter("tmic_explication");
		String tmic_approval = request.getParameter("tmic_approval");

		TtCategoryVo vo = new TtCategoryVo();

		vo.setTmac_name(tmac_name);
		vo.setTmic_explication(tmic_explication);
		vo.setTmic_no(tmic_no);
		vo.setTmic_status(tmic_approval);
		if (tmac_name == null) {
			TtCategoryDAO.getInstance().approveTmic(vo);
		} else {
			TtCategoryDAO.getInstance().updateTmic(vo);

		}
		vo = TtCategoryDAO.getInstance().selectTmicOne(vo);
		System.out.println(vo.getTmic_no());
		response.getWriter().print(JSONObject.fromObject(vo).toString());

	}

}
