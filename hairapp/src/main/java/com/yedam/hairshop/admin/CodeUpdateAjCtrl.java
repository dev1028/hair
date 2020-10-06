package com.yedam.hairshop.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.CodeDAO;
import com.yedam.hairshop.model.CodeVo;

import net.sf.json.JSONObject;

public class CodeUpdateAjCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CodeVo cVo = new CodeVo();
		cVo.setCode_no(request.getParameter("code_no"));
		cVo.setPrimary_code(request.getParameter("primary_code"));
		cVo.setCode_name(request.getParameter("code_name"));
		cVo.setSecondary_code(request.getParameter("secondary_code"));
		cVo.setCode_info(request.getParameter("code_info"));
		
		CodeVo beforeCVo = new CodeVo();
		beforeCVo = CodeDAO.getInstance().selectOne(cVo);
		int r = 0;
		if(beforeCVo.getPrimary_code().equals(cVo.getPrimary_code())) {
			r = CodeDAO.getInstance().updateAllCol(cVo);
		} else {
			String secCode = CodeDAO.getInstance().selectMaxSecondaryCode(cVo).getSecondary_code();
			int secCod = 0;
			if (secCode == null) {
				secCod = 1;
			} else {
				secCod = Integer.parseInt(secCode) + 1;
			}
			cVo.setSecondary_code(cVo.getPrimary_code().substring(1).toLowerCase() + new Integer(secCod).toString());
			r = CodeDAO.getInstance().updateAllCol(cVo);
		}
		
		String result;
		if (r==0) {
			cVo.setCode_no("");
			result = JSONObject.fromObject(cVo).toString();
		} else {			
			result = JSONObject.fromObject(cVo).toString();
		}
		response.getWriter().print(result);
		
	}

}
