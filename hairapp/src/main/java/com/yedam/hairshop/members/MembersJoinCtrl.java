package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.MembersVo;

public class MembersJoinCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("멤버가입");

		request.setCharacterEncoding("utf-8");
		// 파라미터 VO에 담기
		MembersVo members = new MembersVo();

		try { // 위의 파라미터 한꺼번에 담아주는거
			BeanUtils.copyProperties(members, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("============map============");
		Map<String, String[]> map = request.getParameterMap();
		System.out.println(map);
		System.out.println("joinemail=" + map.get("joinemail"));

		System.out.println("============names============");
		Enumeration<String> pnames = request.getParameterNames(); // 파라미터 이름만 읽어오기 가능
		while (pnames.hasMoreElements()) {
			System.out.println(pnames.nextElement());
		}

		// DB 등록 처리
		MembersDAO dao = new MembersDAO();
		dao.membersJoin(members);

		// 목록으로 이동
		response.sendRedirect("MembersJoinCtrl.do");

	}

}
