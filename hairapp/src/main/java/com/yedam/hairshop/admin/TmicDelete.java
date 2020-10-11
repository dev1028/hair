package com.yedam.hairshop.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.TtCategoryDAO;
import com.yedam.hairshop.model.TtCategoryVo;

import net.sf.json.JSONObject;

public class TmicDelete implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tmic_no = request.getParameter("tmic_no");

		TtCategoryVo vo = new TtCategoryVo();
		vo.setTmic_no(tmic_no);
		int r = TtCategoryDAO.getInstance().deleteTmic(vo);
		response.getWriter().print(r);

	}

}
