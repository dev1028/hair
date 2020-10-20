package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopQnaDAO;
import com.yedam.hairshop.model.QnaVo;

public class HairshopQnaWCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("qna 등록");

		//String memNo = request.getSession().getAttribute("memNo").toString();
		// String loginId = request.getSession().getAttribute("loginid").toString();
		//String mem_name = request.getSession().getAttribute("memName").toString();

		// 파라미터 VO에 담기
		QnaVo vo = new QnaVo();

		try {
			BeanUtils.copyProperties(vo, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}

		HairshopQnaDAO dao = new HairshopQnaDAO();

		vo.setQna_no(dao.getSeq());
	//	String hs_no = request.getSession().getAttribute("hsno").toString();
		//vo.setQna_shop_customer_no(hs_no);
		//vo.setQna_writer(mem_name);
		System.out.println("글vo : " + vo);

		int resultVo = dao.qnaInsert(vo);
		System.out.println("qna resultVo:" + resultVo);

		response.sendRedirect("hairshopQna.do");

	}

}
