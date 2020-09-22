package com.yedam.hairshop.common;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.admin.TestController;
import com.yedam.hairshop.admin.adminLoginCtrl;
import com.yedam.hairshop.admin.adminMainCtrl;
import com.yedam.hairshop.admin.adminReturnToLoginCtrl;
import com.yedam.hairshop.designer.DesignerInfoCtrl;
import com.yedam.hairshop.designer.DesignerLoginCtrl;
import com.yedam.hairshop.designer.DesignerUpdateCtrl;
import com.yedam.hairshop.hairshop.EmployeeListCtrl;
import com.yedam.hairshop.hairshop.EmployeeSimpleJoinFCtrl;
import com.yedam.hairshop.hairshop.EmployeeUpdateFCtrl;
import com.yedam.hairshop.hairshop.HairshopDesignerLoginCtrl;
import com.yedam.hairshop.hairshop.HairshopReturnToLoginCtrl;
import com.yedam.hairshop.hairshop.RetiredEmployeeListCtrl;
import com.yedam.hairshop.hairshop.hairshopMainCtrl;
import com.yedam.hairshop.members.DesignerSelectCtrl;
import com.yedam.hairshop.members.HairSelectCtrl;
import com.yedam.hairshop.members.HairShopSelectCtrl;
import com.yedam.hairshop.members.DetailedReservationCtrl;
import com.yedam.hairshop.members.MembersMainCtrl;
import com.yedam.hairshop.members.MembersMyPageTopCtrl;
import com.yedam.hairshop.members.MembersReservationDetailsCtrl;
import com.yedam.hairshop.members.PaymentCtrl;
import com.yedam.hairshop.members.MembersInfoModifyCtrl;
import com.yedam.hairshop.members.MembersInfoViewCtrl;
import com.yedam.hairshop.members.MembersJoinCtrl;
import com.yedam.hairshop.members.MembersJoinSCtrl;
import com.yedam.hairshop.members.MembersJoinIdCheckCtrl;
import com.yedam.hairshop.members.MembersLoginCtrl;
import com.yedam.hairshop.members.MembersLoginSCtrl;
import com.yedam.hairshop.members.MembersLogoutCtrl;
import com.yedam.hairshop.hairshop.EmployeeSimpleJoinFCtrl;
import com.yedam.hairshop.hairshop.EmployeeUpdateFCtrl;
import com.yedam.hairshop.hairshop.FindEmployeesAjCtrl;
import com.yedam.hairshop.hairshop.FireEmployeeFCtrl;
import com.yedam.hairshop.members.MembersMainCtrl;
import com.yedam.hairshop.members.MembersReservationDetailsCtrl;
import com.yedam.hairshop.members.SearchRealtimCtrl;

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
		list.put("/members/membersMain.do", new MembersMainCtrl());
		list.put("/members/hairshopSelect.do", new HairShopSelectCtrl());
		list.put("/members/hairSelect.do", new HairSelectCtrl());
		list.put("/members/designerSelect.do", new DesignerSelectCtrl());
		list.put("/members/payment.do", new PaymentCtrl());
		list.put("/members/payment2.do", new Payment2Ctrl());
		
		list.put("/members/hairshopReview.do", new HairShopReviewCtrl());
		list.put("/members/membersInsert.do", new TestController());
		list.put("/members/myRegionSetting.do", new MyRegionSettingCtrl());
		list.put("/ajax/searchRealtime.do", new SearchRealtimCtrl());
		
		
		//송현
		list.put("/designer/designerUpdate.do", new DesignerUpdateCtrl());
		list.put("/designer/designerInfoCtrl.do", new DesignerInfoCtrl());
		list.put("/designer/designerLogin.do", new DesignerLoginCtrl());
		
		//린아
		list.put("/members/membersLogin.do", new MembersLoginCtrl());			// 로그인 컨트롤러
		list.put("/members/membersLogout.do", new MembersLogoutCtrl());			// 로그아웃 컨트롤러
		list.put("/members/membersLoginS.do", new MembersLoginSCtrl());				// 로그인 넘어가는 컨트롤러
		list.put("/members/membersJoin.do", new MembersJoinCtrl());				// 회원가입 컨트롤러
		list.put("/members/membersJoinS.do", new MembersJoinSCtrl());			// 회원가입 넘어가는 컨트롤러
		list.put("/ajax/membersJoinIdCheck.do", new MembersJoinIdCheckCtrl());	// 회원가입 ID 중복확인 컨트롤러
		list.put("/members/membersInfoModify.do", new MembersInfoModifyCtrl());	// 회원수정 컨트롤러
		list.put("/members/membersInfoView.do", new MembersInfoViewCtrl());		// 회원수정 정보확인 컨트롤러
		list.put("/members/membersRD.do", new MembersReservationDetailsCtrl());	// 예약내역 컨트롤러
		list.put("/members/membersDR.do", new DetailedReservationCtrl());		// 예약 상세 확인 컨트롤러
		list.put("/members/membersMypageTop.do", new MembersMyPageTopCtrl());	// 마이페이지 톱 컨트롤러
		
		
		//강산
		list.put("/admin/adminLogin.do", new adminLoginCtrl());
		list.put("/admin/adminMain.do", new adminMainCtrl());
		list.put("/admin/adminReturnToLogin.do", new adminReturnToLoginCtrl());
		
		//승연
		list.put("/hairshop/hairshopMain.do", new hairshopMainCtrl());
		list.put("/hairshop/hairshopDesignerLogin.do", new HairshopDesignerLoginCtrl());
		list.put("/hairshop/employeeList.do", new EmployeeListCtrl());
		list.put("/hairshop/employeeSimpleJoin.do", new EmployeeSimpleJoinFCtrl());
		list.put("/hairshop/retiredEmployeeList.do", new RetiredEmployeeListCtrl());
		list.put("/hairshop/hairshopReturnToLogin.do", new HairshopReturnToLoginCtrl());
		list.put("/hairshop/employeeUpdate.do", new EmployeeUpdateFCtrl());
		list.put("/ajax/findEmployees.do", new FindEmployeesAjCtrl());
		list.put("/hairshop/fireEmployee.do", new FireEmployeeFCtrl());
	}


	protected void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding(charset);
		res.setContentType("text/html; charset=UTF-8");
		String uri = req.getRequestURI();					// frontWeb/memberInsert.do
		String contextPath = req.getContextPath();			// frontWeb
		String path = uri.substring(contextPath.length());	// memberInsert.do
		Controller subController = list.get(path);
//		System.out.println(path);
		if(subController == null) {
			System.out.println("잘못된 URL: " + path);
		}else {
			subController.execute(req, res);
		}
	}

}
