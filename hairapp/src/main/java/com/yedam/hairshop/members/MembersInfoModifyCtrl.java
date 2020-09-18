package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.MembersVo;

public class MembersInfoModifyCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("회원수정");
		
		// 인코딩
		request.setCharacterEncoding("utf-8");
		
		MembersDAO dao = MembersDAO.getInstance();
		
		// 세션이 가지고있는 로그인한 ID 정보를 가져온다
        HttpSession session = request.getSession();
        String mem_email = session.getAttribute("sessionID").toString();
        
        MembersVo memberVo = dao.getMembersInfo(mem_email);
        request.setAttribute("memberVo", memberVo);
        
		// 파라미터 VO에 담기
        MembersVo members = new MembersVo();
		String modifyemail = mem_email;
		String modifypw = request.getParameter("modifypw");
		String modifyname = request.getParameter("modifyname");
		String modifyphone = request.getParameter("modifyphone");
		String modifybirth = request.getParameter("modifybirth");
		String modifygender = request.getParameter("modifygender");
		String roadFullAddr = request.getParameter("roadFullAddr");
		String roadAddrPart1 = request.getParameter("roadAddrPart1");
		String addrDetail = request.getParameter("addrDetail");
		String roadAddrPart2 = request.getParameter("roadAddrPart2");
		String zipNo = request.getParameter("zipNo");
		String modifyhairlengths = request.getParameter("modifyhairlengths");
		String modifyhairstatus = request.getParameter("modifyhairstatus");
		
		members.setMem_email(modifyemail);
		members.setMem_pw(modifypw);
		members.setMem_name(modifyname);
		members.setMem_phone(modifyphone);
		members.setMem_birth(modifybirth);
		members.setMem_sex(modifygender);
		members.setMem_addr(roadFullAddr);
		members.setMem_city(roadAddrPart1);
		members.setMem_country(addrDetail);
		members.setMem_township(roadAddrPart2);
		members.setMem_zip(zipNo);
		members.setMem_hair_length(modifyhairlengths);
		members.setMem_hair_status(modifyhairstatus);
		
		
		dao.membersModify(members);

		request.setAttribute("modify", members);

		request.getRequestDispatcher("membersInfoSuccess.jsp").forward(request, response);
	}

}
