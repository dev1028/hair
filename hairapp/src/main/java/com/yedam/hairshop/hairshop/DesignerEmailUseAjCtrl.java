package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.model.DesignerVo;

public class DesignerEmailUseAjCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hsEmail = request.getParameter("hs_email");
		DesignerVo deseExVo = new DesignerVo();
		deseExVo.setDesigner_email(hsEmail);
		deseExVo = DesignerDAO.getInstance().selectOneEmail(deseExVo);
		int r = 0;
		if(deseExVo != null) {
			//디자이너에 있음
			String acc = deseExVo.getDesigner_access_status();
			if(Integer.parseInt(acc) == 1) {
				if(deseExVo.getHs_no() == null) {
					//해당 계정으로 원장만들어 버리기 // 있음
					r = 1;
				} else {
					//이미 다른미용실에서 일하고 있음 // 아무 처리하지않고 되돌아 가기
					r = -1;
				}
			} else {
				//아직 인증절차를 하지않은 회원
				r = -2;
			}
		}//not null end
		response.getWriter().print(r);
	}

}
