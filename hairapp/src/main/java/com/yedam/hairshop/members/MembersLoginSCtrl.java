package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.MembersVo;

public class MembersLoginSCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("멤버로그인");

		// 파라미터 VO에 담기
		MembersVo membersVO = new MembersVo();
		membersVO.setMem_email(request.getParameter("loginid")); // 파라미터는 name값 넘기는거
		membersVO.setMem_pw(request.getParameter("loginpw"));

		// 2. 서비스 처리(DB)
		MembersVo resultVO = MembersDAO.getInstance().loginSelectOne(membersVO); // memberVO 집어넣고 결과를 MemberVO로 받기

		// 3. 결과 저장
		String page = ""; // 이동할 페이지 이름 변수 선언
		if (resultVO == null) { // id가 없는 경우
			response.getWriter().append("<script>")
								.append("alert('해당 ID나 패스워드가 맞지 않습니다');")
								.append("</script>");
			page = "/members/membersLogin.do";
			System.out.println("아디없음:"+page);
			
			// 로그인 후 인증확인
			} else if (resultVO.getMem_access_status().equals("0")) {
				response.getWriter().append("<script>")
									.append("alert('인증이 완료되지 않았습니다');")
									.append("</script>");
				page = "/members/membersLogin.do";
				System.out.println("인증불:"+page);
			//} 
			} else if(resultVO.getMem_access_status().equals("-1")) {
				response.getWriter().append("<script>")
				.append("alert('인증이 완료되지 않았습니다');")
				.append("</script>");
				page = "/members/membersLogin.do";
				System.out.println("인증불:"+page);
			
			} else if(resultVO.getMem_access_status().equals("9")) {
				response.getWriter().append("<script>")
				.append("alert('탈퇴된 회원입니다');")
				.append("</script>");
				page = "/members/membersLogin.do";
				System.out.println("탈퇴회원:"+page);
			
//			} else if (membersVO.getMem_pw() != resultVO.getMem_pw()) { // 패스워드 불일치
//				response.getWriter().append("<script>")
//									.append("alert('패스워드가 맞지 않습니다');")
//									.append("</script>");
//				page = "/members/membersLogin.do";
//				System.out.println("패스워드불:"+page);
//		}

		} else {
			// memberVO에 있는 pw와 resultVO의 pw를 비교해서 같으면 로그인성공 && 인증컬럼 1이어야지 로그인 성공
			// 2는 관리자
			if (membersVO.getMem_pw().equals(resultVO.getMem_pw()) || 
				(resultVO.getMem_access_status().equals("1") && resultVO.getMem_access_status().equals("2"))) {

				HttpSession sess = request.getSession();
				String latlng = resultVO.getMem_latitude_longitude();
				if(latlng != null) {
					String lat = latlng.split(",")[0].trim();
					String lng = latlng.split(",")[1].trim();
					sess.setAttribute("lat", lat);
					sess.setAttribute("lng", lng);
				}
				
				String addr = resultVO.getMem_addr();
				if(addr != null) {
					sess.setAttribute("township", addr.split(" ")[2]);
				}
				
				request.getSession().setAttribute("login", resultVO);
				request.getSession().setAttribute("udong","member");
				request.getSession().setAttribute("loginid", resultVO.getMem_email()); 	// 세션아이디
				request.getSession().setAttribute("admin", resultVO.getMem_access_status());	// 인증컬럼
				request.getSession().setAttribute("memNo", resultVO.getMem_no());		// 세션고객번호
				request.getSession().setAttribute("memName", resultVO.getMem_name());	// 세션고객이름
				request.getSession().setAttribute("memPw", resultVO.getMem_pw());	// 세션비밀번호

				System.out.println("인증컬럼: " + resultVO.getMem_access_status());
				page = "/members/membersMain.do";
				System.out.println("로그인완:"+page);
				
				// 로그인 후 인증확인
				
//				} else if (resultVO.getMem_access_status().equals("0")) {
//					response.getWriter().append("<script>")
//										.append("alert('인증이 완료되지 않았습니다');")
//										.append("</script>");
//					page = "/members/membersLogin.do";
//					System.out.println("인증불:"+page);
//				//} 
//				} else if(resultVO.getMem_access_status().equals("-1")) {
//					response.getWriter().append("<script>")
//					.append("alert('인증이 완료되지 않았습니다');")
//					.append("</script>");
//					page = "/members/membersLogin.do";
//					System.out.println("인증불:"+page);
//				
//				} else if(resultVO.getMem_access_status().equals("9")) {
//					response.getWriter().append("<script>")
//					.append("alert('탈퇴된 회원입니다');")
//					.append("</script>");
//					page = "/members/membersLogin.do";
//					System.out.println("탈퇴회원:"+page);
//				
//				} else if (membersVO.getMem_pw() != resultVO.getMem_pw()) { // 패스워드 불일치
//					response.getWriter().append("<script>")
//										.append("alert('패스워드가 맞지 않습니다');")
//										.append("</script>");
//					page = "/members/membersLogin.do";
//					System.out.println("패스워드불:"+page);
			}
		}

		System.out.println("이동: " + page);
		
		// 4. 뷰페이지 이동(redirect, forward) 또는 뷰페이지 출력
		request.getRequestDispatcher(page).forward(request, response);

	}

}
