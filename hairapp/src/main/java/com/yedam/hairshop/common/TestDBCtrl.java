package com.yedam.hairshop.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.MembersVo;

public class TestDBCtrl implements Controller{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<MembersVo> list = MembersDAO.getInstance().selectAll();
		if(list.size() == 0)
		{
			System.out.println("접속 불량");
		}else {
			System.out.println("접속 성공: " + list.size());
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
}
