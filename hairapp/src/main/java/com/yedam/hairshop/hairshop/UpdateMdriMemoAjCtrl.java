package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MemDesigneRsvInfoDAO;
import com.yedam.hairshop.model.MemDesignerRsvInfoVo;

public class UpdateMdriMemoAjCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemDesignerRsvInfoVo mDRIVo = new MemDesignerRsvInfoVo();
		try {
			BeanUtils.copyProperties(mDRIVo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		int r = MemDesigneRsvInfoDAO.getInstance().updateMdriMemo(mDRIVo);
		response.getWriter().print(r);

	}

}
