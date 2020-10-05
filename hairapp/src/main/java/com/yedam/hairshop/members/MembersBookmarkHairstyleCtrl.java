package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairBookmarkDAO;
import com.yedam.hairshop.dao.HairshopHairInfoDAO;
import com.yedam.hairshop.model.HairshopHairInfoVo;

public class MembersBookmarkHairstyleCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersBookmarkHairstyleCtrl");
		
		
		//HairBookmarkDAO.getInstance().
		//HairshopHairInfoDAO.getInstance().
		request.getRequestDispatcher("/members/membersBookmarkHairstyle.jsp").forward(request, response);
	}

}
