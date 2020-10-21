package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.common.SandEmail;
import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.EmailVo;
import com.yedam.hairshop.model.MembersVo;

public class MembersJoinSCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("멤버가입");
		
		// 인코딩
		request.setCharacterEncoding("utf-8");
		
		// 파라미터 VO에 담기
		MembersVo members = new MembersVo();
		
		String joinemail = request.getParameter("joinemail");
		String joinpw = request.getParameter("joinpw");
		String joinname = request.getParameter("joinname");
		String joinphone = request.getParameter("joinphone");
		String joinbirth = request.getParameter("joinbirth");
		String joingender = request.getParameter("joingender");
		String roadFullAddr = request.getParameter("roadFullAddr");
		String roadAddrPart1 = request.getParameter("roadAddrPart1");
		String addrDetail = request.getParameter("addrDetail");
		String roadAddrPart2 = request.getParameter("roadAddrPart2");
		String zipNo = request.getParameter("zipNo");
		String joinhairlengths = request.getParameter("joinhairlengths");
		String joinhairstatus = request.getParameter("joinhairstatus");
		
		members.setMem_email(joinemail);
		members.setMem_pw(joinpw);
		members.setMem_name(joinname);
		members.setMem_phone(joinphone);
		members.setMem_birth(joinbirth);
		members.setMem_sex(joingender);
		members.setMem_addr(roadFullAddr);
		members.setMem_city(roadAddrPart1);
		members.setMem_country(addrDetail);
		members.setMem_township(roadAddrPart2);
		members.setMem_zip(zipNo);
		members.setMem_hair_length(joinhairlengths);
		members.setMem_hair_status(joinhairstatus);
		

		// DB 등록 처리
		//MembersVo resultVO = MembersDAO.getInstance().membersJoin(members);
		//request.getSession().setAttribute("members", resultVO);
		//request.getSession().setAttribute("joinemail", resultVO.getMem_email());
		
		
		// 이메일 등록 처리
		int r = MembersDAO.getInstance().membersJoinEmail(members);
		System.out.println(r);
		if (r == 0) {
			response.getWriter().append("<script>")
								.append("alert('회원 인증이 완료되지 않았습니다');")
								.append("location.href='membersJoin.do';")
								.append("</script>");
		} else {
			
			SandEmail se = new SandEmail();
			EmailVo em = new EmailVo();
			System.out.println();
			em.setReceiverMail(members.getMem_email());
			em.setReceiverName(members.getMem_name());
			em.setTitle("우리동네 미용실 우동 회원가입 인증요청 메일");
			em.setContentType("text/html; charset=UTF-8");
			String contents = "<h3>우리동네 미용실 우동 회원가입 인증을 해주세요.</h3>"
					+ "<a href='http://192.168.0.83/hairapp/members/membersJoinEmail.do?mem_email="+members.getMem_email()+"'>누르시면 인증이 완료됩니다</a>";
				
			em.setContents(contents);
			se.sand(em);
			// 목록으로 이동
			//request.getRequestDispatcher("membersJoinSuccess.jsp").forward(request, response);
			response.sendRedirect("membersJoinEnd.do");
		}
		
		// response.sendRedirect("membersJoinSuccess.jsp");	// 가입완료되면 여기로넘어감
	}

}
