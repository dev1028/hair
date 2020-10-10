package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.TtCategoryDAO;
import com.yedam.hairshop.model.TtCategoryVo;

import net.sf.json.JSONArray;

public class GetTmicListAjCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tmacNo = request.getParameter("tmac_no");
		TtCategoryVo tCVo = new TtCategoryVo();
		tCVo.setTmac_no(tmacNo);
		List<TtCategoryVo>list = TtCategoryDAO.getInstance().selectTmicListByTmacNo(tCVo);
		String tmiclist = JSONArray.fromObject(list).toString();
		response.getWriter().print(tmiclist);
	}

}
