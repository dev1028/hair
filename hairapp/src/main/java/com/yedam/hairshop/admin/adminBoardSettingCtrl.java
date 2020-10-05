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
for(int i=1;i<4;i++) {
BoardSettingVo vo = new BoardSettingVo();
vo.setId("n"+i);
vo.setType("공지사항");
vo.setWho("j"+i);
vo.setReadable("j"+i);
vo.setWrittable("admin");
vo.setTotal(BoardSettingDAO.getInstance().countTotal(vo));
vo.setNevv(BoardSettingDAO.getInstance().countNew(vo));
list.add(vo);
}
for(int i=1;i<4;i++) {
BoardSettingVo vo = new BoardSettingVo();
vo.setId("q"+i);
vo.setType("QnA");
vo.setWho("j"+i);
vo.setReadable("j"+i);
vo.setWrittable("j"+i);
vo.setTotal(BoardSettingDAO.getInstance().countTotal(vo));
vo.setNevv(BoardSettingDAO.getInstance().countNew(vo));
list.add(vo);
}
request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/adminBoardSetting.jsp").forward(request, response);	}

}
