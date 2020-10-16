package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.List;

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
		String tmic_status = request.getParameter("tmic_status");

		TtCategoryVo vo = new TtCategoryVo();

		vo.setTmac_name(tmac_name);
		vo.setTmic_explication(tmic_explication);
		vo.setTmic_no(tmic_no);
		vo.setTmic_status(tmic_status);
		if (tmac_name == null) {
			TtCategoryDAO.getInstance().updateTmicStatus(vo);
			List<TtCategoryVo> list = TtCategoryDAO.getInstance().selectListRequstTmic();
			request.setAttribute("list", list);
			request.getRequestDispatcher("/admin/ttCategoryRequest.jsp").forward(request, response);

		} else {
			TtCategoryDAO.getInstance().updateTmic(vo);

			vo = TtCategoryDAO.getInstance().selectTmicOne(vo);
			System.out.println(vo.getTmic_no());
			response.getWriter().print(JSONObject.fromObject(vo).toString());

		}

	}

}
