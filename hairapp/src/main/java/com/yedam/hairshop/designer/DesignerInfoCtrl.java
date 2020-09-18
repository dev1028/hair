	package com.yedam.hairshop.designer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.MembersVo;

public class DesignerInfoCtrl implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MembersVo vo = new MembersVo();
		vo.setMem_no("10");
		vo.setMem_name("lee");
		vo.setMem_email("abc@naver.com");
		
		MembersVo mem = MembersDAO.getInstance().selectOne(vo);
		request.setAttribute("mem", mem);
		
		request.getRequestDispatcher("/designer/designerUpdate.jsp").forward(request, response);
	}
}
