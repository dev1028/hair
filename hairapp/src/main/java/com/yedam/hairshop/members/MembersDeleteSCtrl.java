package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.MembersVo;

public class MembersDeleteSCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("회원탈퇴");
		
		// 세션이 가지고있는 로그인한 ID 정보를 가져온다
        HttpSession session = request.getSession();
        System.out.println("탈퇴session1-1: "+session);
        String mem_email = session.getAttribute("loginid").toString();
        System.out.println("탈퇴session1-2: "+mem_email);
        String mem_pw = session.getAttribute("memPw").toString();
        System.out.println("탈퇴session1-3: "+mem_pw);
        
		// 파라미터 VO에 담기
        MembersVo members = new MembersVo();
		String mememail = mem_email;
		String mempw = request.getParameter("mempw");
		System.out.println("memdelete: "+mempw);
		
		members.setMem_email(mememail);
		members.setMem_pw(mempw);
		
		System.out.println("파라미터Vo에 담고나서 : "+members);
		MembersVo resultVo = MembersDAO.getInstance().membersDelete(members);
		
		// 저장
		request.setAttribute("delete", resultVo);
		
		
		// 3. 결과 저장
		String page = ""; // 이동할 페이지 이름 변수 선언
		if (mem_pw.equals(resultVo.getMem_pw())) {		// 비번 비교
			
			// 세션에서 제거(로그아웃)
			request.getSession().invalidate();
			
			// 탈퇴 시 alert 뜨는거
			response.getWriter().append("<script>")
								.append("alert('회원탈퇴가 완료되었습니다.');")
								.append("</script>");
			page = "/members/membersMain.do";
			System.out.println("탈퇴 완료:" + page);
			System.out.println("뭐나올까1: "+members.getMem_pw().equals(resultVo.getMem_pw()));
			System.out.println("뭐나올까2: "+members.getMem_pw());
			System.out.println("뭐나올까3: "+resultVo.getMem_pw());

			// 로그인 후 인증확인
		} else {
			response.getWriter().append("<script>")
								.append("alert('비밀번호가 틀렸습니다.');")
								.append("</script>");
			page = "/members/membersDelete.do";
			System.out.println("탈퇴 안됨:" + page);
		}
		
		
		
		// 이동
		request.getRequestDispatcher(page).forward(request, response);
	}

}
