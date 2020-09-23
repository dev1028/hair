package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.MembersVo;

public class MembersJoinCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩
		request.setCharacterEncoding("utf-8");
		
		// 파라미터 VO에 담기
		/*
		 * MembersVo members = new MembersVo();
		 * 
		 * String joinemail = request.getParameter("joinemail"); String joinpw =
		 * request.getParameter("joinpw"); String joinname =
		 * request.getParameter("joinname"); String joinphone =
		 * request.getParameter("joinphone"); String joinbirth =
		 * request.getParameter("joinbirth"); String joingender =
		 * request.getParameter("joingender"); String roadFullAddr =
		 * request.getParameter("roadFullAddr"); String roadAddrPart1 =
		 * request.getParameter("roadAddrPart1"); String addrDetail =
		 * request.getParameter("addrDetail"); String roadAddrPart2 =
		 * request.getParameter("roadAddrPart2"); String zipNo =
		 * request.getParameter("zipNo"); String joinhairlengths =
		 * request.getParameter("joinhairlengths"); String joinhairstatus =
		 * request.getParameter("joinhairstatus");
		 * 
		 * members.setMem_email(joinemail); members.setMem_pw(joinpw);
		 * members.setMem_name(joinname); members.setMem_phone(joinphone);
		 * members.setMem_birth(joinbirth); members.setMem_sex(joingender);
		 * members.setMem_addr(roadFullAddr); members.setMem_city(roadAddrPart1);
		 * members.setMem_country(addrDetail); members.setMem_township(roadAddrPart2);
		 * members.setMem_zip(zipNo); members.setMem_hair_length(joinhairlengths);
		 * members.setMem_hair_status(joinhairstatus);
		 */
		

		/*
		 * try { // 위의 파라미터 한꺼번에 담아주는거 BeanUtils.copyProperties(members,
		 * request.getParameterMap()); } catch (Exception e) { e.printStackTrace(); }
		 * System.out.println("1"+members);
		 * 
		 * System.out.println("============map============"); Map<String, String[]> map
		 * = request.getParameterMap(); System.out.println(map);
		 * System.out.println("joinemail=" + map.get("joinemail"));
		 * 
		 * System.out.println("============names============"); Enumeration<String>
		 * pnames = request.getParameterNames(); // 파라미터 이름만 읽어오기 가능 while
		 * (pnames.hasMoreElements()) { System.out.println(pnames.nextElement()); }
		 */

		// DB 등록 처리
		//MembersVo resultVO = MembersDAO.getInstance().membersJoin(members);
		
		//request.getSession().setAttribute("members", resultVO);
		//request.getSession().setAttribute("joinemail", resultVO.getMem_email());

		// 목록으로 이동
		request.getRequestDispatcher("membersJoin.jsp").forward(request, response);
		// response.sendRedirect("membersJoinSuccess.jsp");	// 가입완료되면 여기로넘어감
	
	}

}
