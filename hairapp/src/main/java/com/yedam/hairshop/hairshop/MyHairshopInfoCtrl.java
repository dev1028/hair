package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.ChangeUtil;
import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HsPhotoDAO;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.HsPhotoVo;

public class MyHairshopInfoCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HairshopVo loginVo = null;
		try {
			loginVo = (HairshopVo) ((HairshopVo) request.getSession().getAttribute("login")).clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		
		loginVo.setHs_regdate(loginVo.getHs_regdate().split(" ")[0]);
		String changeDayOff = ChangeUtil.changeDayOffNumToStr(loginVo.getHs_dayoff());
		loginVo.setHs_dayoff(changeDayOff);
		HsPhotoVo hPVo = new HsPhotoVo();
		hPVo.setHs_no(loginVo.getHs_no());
		List<HsPhotoVo> list = HsPhotoDAO.getInstance().selectByHairshop(hPVo);

		request.setAttribute("hsPhoto", list);
		request.setAttribute("hs1", loginVo);
		request.getRequestDispatcher("/hairshop/myHairshopInfo.jsp").forward(request, response);
		
		
	}

}
