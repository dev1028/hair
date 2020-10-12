package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.QnaDAO;
import com.yedam.hairshop.model.QnaVo;

public class membersQnaVCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersQnaVCtrl");

		String admin = request.getSession().getAttribute("admin").toString();
		String loginId = request.getSession().getAttribute("loginid").toString();
		String mem_name = request.getSession().getAttribute("memName").toString();
		String mem_no = request.getSession().getAttribute("memNo").toString();

		// 파라미터
		QnaVo vo = new QnaVo();
		int qnaNo = Integer.parseInt(request.getParameter("qna_no"));
		String qnaHit = request.getParameter("qna_hit");
		System.out.println();
		System.out.println("qnaNo: " + qnaNo);
		System.out.println("qnaHit: " + qnaHit);
		vo.setQna_no(qnaNo);
		vo.setQna_shop_customer_no(mem_no);
		// vo.setQna_no(qnaNo);

		// DB 조회
		QnaVo resultVo = QnaDAO.getInstance().qnaView(qnaNo);
		int hitup = QnaDAO.getInstance().upHit(vo);
		System.out.println("hitup: " + hitup);

		// 결과 저장
		request.getSession().setAttribute("view", resultVo);
		request.getSession().setAttribute("qnaNo", qnaNo);
		request.getSession().setAttribute("viewNo", resultVo.getQna_no());
		request.getSession().setAttribute("hit", hitup);
		request.getSession().setAttribute("admin", admin);
		request.getSession().setAttribute("loginId", loginId);
		request.getSession().setAttribute("memName", mem_name);
		// request.setAttribute("view", resultVo);
		
		// Qna_openstatus가 0일때 비공개 1은 공개. 0일때 접근 못하게 해놈
		System.out.println("mem_no: "+mem_no);
		System.out.println("getQna_shop_customer_no(): "+resultVo.getQna_shop_customer_no());
		System.out.println("getQna_openstatus: "+resultVo.getQna_openstatus());
		System.out.println("resultVo.getQna_writer(): "+resultVo.getQna_writer());
//		if (resultVo.getQna_openstatus().equals("1") || 
//			(resultVo.getQna_shop_customer_no().equals(mem_no) && resultVo.getQna_openstatus().equals("0") ||
//			(resultVo.getQna_writer().equals("관리자") && resultVo.getQna_openstatus().equals("0")))) {
		
		if( resultVo.getQna_openstatus().equals("1") ||
			resultVo.getQna_shop_customer_no().equals(mem_no) ||
			admin.equals("2")) {
			request.getRequestDispatcher("membersQnaView.jsp").forward(request, response);
		} else if(resultVo.getQna_openstatus().equals("0")) {
				response.getWriter().append("<script>")
									.append("alert('비공개 게시물 입니다');")
									.append("</script>");
				request.getRequestDispatcher("membersQna.do").forward(request, response);
		}
			
		//request.getRequestDispatcher(page).forward(request, response);
		//response.sendRedirect(page);
	}

}
