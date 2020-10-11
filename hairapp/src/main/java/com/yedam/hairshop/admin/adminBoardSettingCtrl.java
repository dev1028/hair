package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.BoardSettingDAO;
import com.yedam.hairshop.model.BoardSettingVo;

public class adminBoardSettingCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<BoardSettingVo> list = new ArrayList<>();
		list = BoardSettingDAO.getInstance().selectAll();

		for (int i = 0; i < list.size(); i++) {
			list.get(i).setNevv(BoardSettingDAO.getInstance().countNew(list.get(i)));
			list.get(i).setTotal(BoardSettingDAO.getInstance().countNew(list.get(i)));
		}

		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/adminBoardSetting.jsp").forward(request, response);
	}

}
