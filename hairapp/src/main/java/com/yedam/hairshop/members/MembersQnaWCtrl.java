package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.QnaDAO;
import com.yedam.hairshop.model.QnaVo;

public class MembersQnaWCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersQnaWCtrl");
		
		String memNo = request.getSession().getAttribute("memNo").toString();
		String loginId = request.getSession().getAttribute("loginid").toString();

		// 파라미터 VO에 담기
		QnaVo vo = new QnaVo();

		try {
			BeanUtils.copyProperties(vo, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
		
		QnaDAO dao = new QnaDAO();
		
		vo.setQna_no(dao.getSeq());
		vo.setQna_shop_customer_no(memNo);
		vo.setQna_writer(loginId);
		System.out.println("글vo : " + vo);
		
		int resultVo = dao.qnaInsert(vo);
		System.out.println("qna resultVo:" + resultVo);
		
		response.sendRedirect("membersQna.do");

	}

}
