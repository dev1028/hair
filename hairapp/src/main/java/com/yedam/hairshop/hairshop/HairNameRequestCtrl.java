package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.TtCategoryDAO;
import com.yedam.hairshop.model.TtCategoryVo;

public class HairNameRequestCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HairNameRequestCtrl");
		List<TtCategoryVo> list = TtCategoryDAO.getInstance().selectTmacAll();
		request.setAttribute("tmacList", list);
		
		String tmac_no = request.getParameter("tmac_no");
		String tmic_name = request.getParameter("tmic_name");
		String tmic_explication = request.getParameter("tmic_explication");
		
		if(tmac_no != null && tmic_name != null) {
			TtCategoryVo vo = new TtCategoryVo();
			vo.setTmac_no(tmac_no);
			vo.setTmic_name(tmic_name);
			vo.setTmic_explication(tmic_explication);
			
			//같은 이름이 없으면 요청. (이것 말고도 name에 유니크 제약조건 걸어도 됨)
			if(!TtCategoryDAO.getInstance().hasTmicWithName(vo))
				TtCategoryDAO.getInstance().requestTmic(vo);
		}
		
		request.getRequestDispatcher("/hairshop/hairNameRequest.jsp").forward(request, response);
	}

}
