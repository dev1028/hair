package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.HairshopNoticeVo;

public class hairshopNoticeMGCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("공지수정");

		HairshopNoticeVo vo = (HairshopNoticeVo) request.getSession().getAttribute("view");

		HairshopNoticeVo resultVo = HairshopDAO.getInstance().noticeView(vo);
		request.getSession().setAttribute("modify", resultVo);
		System.out.println("modify: " + resultVo);

		request.getRequestDispatcher("/hairshop/hairshopNoticeModify.jsp").forward(request, response);

	}

}
