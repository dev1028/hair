package com.yedam.hairshop.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.TtCategoryDAO;
import com.yedam.hairshop.model.TtCategoryVo;

import net.sf.json.JSONObject;

public class TmicInsert implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tmac_no = request.getParameter("tmac_no");
		String tmic_explication = request.getParameter("tmic_explication");

		TtCategoryVo vo = new TtCategoryVo();
		vo.setTmic_explication(tmic_explication);
		vo.setTmac_no(tmac_no);
		TtCategoryDAO.getInstance().insertTmic(vo);
		vo.setTmic_no(TtCategoryDAO.getInstance().selectMaxTmic_no());
		vo = TtCategoryDAO.getInstance().selectTmicOne(vo);
		response.getWriter().print(JSONObject.fromObject(vo).toString());

	}

}
