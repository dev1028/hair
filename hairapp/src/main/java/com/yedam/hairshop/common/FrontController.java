package com.yedam.hairshop.common;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.admin.TestController;
import com.yedam.hairshop.members.HairSelectCtrl;
import com.yedam.hairshop.members.MemberMainCtrl;
import com.yedam.hairshop.members.MembersJoinCtrl;
import com.yedam.hairshop.members.MembersJoinIdCheckCtrl;
import com.yedam.hairshop.members.MembersLoginCtrl;
import com.yedam.hairshop.hairshop.EmployeeListCtrl;
import com.yedam.hairshop.members.SearchRealtimCtrl;
import com.yedam.hairshop.hairshop.HairshopDesignerLoginCtrl;
import com.yedam.hairshop.hairshop.hairshopMainCtrl;

/*
@WebServlet(name = "front", 
			urlPatterns = "*.do", 
			initParams = {
					@WebInitParam(name = "charset", value="UTF-8")
			})
*/
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String charset = null;
	HashMap<String, Controller> list = null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		charset = config.getInitParameter("charset");
		list = new HashMap<String, Controller>();
		
		//상민
		list.put("/testDB.do", new TestDBCtrl());
		list.put("/memberMain.do", new MemberMainCtrl());
		list.put("/membersInsert.do", new TestController());
		list.put("/searchRealtime.do", new SearchRealtimCtrl());
		list.put("/hairSelect.do", new HairSelectCtrl());
		
		//송현
		
		//린아
		list.put("/membersLogin.do", new MembersLoginCtrl());
		list.put("/membersJoin.do", new MembersJoinCtrl());
		list.put("/ajax/membersJoinIdCheck.do", new MembersJoinIdCheckCtrl());
		
		//강산
		
		//승연
		list.put("/hairshop/hairshopMain.do", new hairshopMainCtrl());
		list.put("/hairshop/hairshopDesignerLogin.do", new HairshopDesignerLoginCtrl());
		list.put("/hairshop/employeeList.do", new EmployeeListCtrl());
	}


	protected void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("service");
		req.setCharacterEncoding(charset);
		res.setContentType("text/html; charset=UTF-8");
		String uri = req.getRequestURI();					// frontWeb/memberInsert.do
		String contextPath = req.getContextPath();			// frontWeb
		String path = uri.substring(contextPath.length());	// memberInsert.do
		Controller subController = list.get(path);
		
		if(subController == null) {
			System.out.println("잘못된 URL: " + path);
		}else {
			subController.execute(req, res);
		}
	}

}
