package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.HairshopNoticeVo;

public class hairshopNoticeCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("공지사항 목록");
		
		List<HairshopNoticeVo> list = HairshopDAO.getInstance().selectList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/hairshop/hairshopNotice.jsp").forward(request, response);
	}
}
