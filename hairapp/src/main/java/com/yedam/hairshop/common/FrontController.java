package com.yedam.hairshop.common;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.admin.TestController;
import com.yedam.hairshop.admin.adminBoardManageCtrl;
import com.yedam.hairshop.admin.adminBoardManageFCtrl;
import com.yedam.hairshop.admin.adminLoginCtrl;
import com.yedam.hairshop.admin.adminMainCtrl;
import com.yedam.hairshop.admin.adminReturnToLoginCtrl;
import com.yedam.hairshop.admin.salesCtrl;
import com.yedam.hairshop.admin.salesStatisticsCtrl;
import com.yedam.hairshop.admin.salesStatisticsFCtrl;
import com.yedam.hairshop.designer.DesDailyReservationListAjCtrl;
import com.yedam.hairshop.designer.DesDailyReservationListCtrl;
import com.yedam.hairshop.designer.DesignerInfoCtrl;
import com.yedam.hairshop.designer.DesignerLoginCtrl;
import com.yedam.hairshop.designer.DesignerMainCtrl;
import com.yedam.hairshop.designer.DesignerUpdateCtrl;
import com.yedam.hairshop.designer.customerJoinCtrl;
import com.yedam.hairshop.hairshop.ChangeReservationStatusAjCtrl;
import com.yedam.hairshop.hairshop.DailyReservationListAjCtrl;
import com.yedam.hairshop.hairshop.DailyReservationListCtrl;
import com.yedam.hairshop.hairshop.EmployeeAuthFCtrl;
import com.yedam.hairshop.hairshop.EmployeeListCtrl;
import com.yedam.hairshop.hairshop.EmployeeSimpleJoinFCtrl;
import com.yedam.hairshop.hairshop.EmployeeUpdateFCtrl;
import com.yedam.hairshop.hairshop.FindEmployeesAjCtrl;
import com.yedam.hairshop.hairshop.FireEmployeeFCtrl;
import com.yedam.hairshop.hairshop.HairshopDesignerLoginCtrl;
import com.yedam.hairshop.hairshop.HairshopEmailUseAjCtrl;
import com.yedam.hairshop.hairshop.HairshopJoinFinFCtrl;
import com.yedam.hairshop.hairshop.HairshopJoinPreFCtrl;
import com.yedam.hairshop.hairshop.HairshopReturnToLoginCtrl;
import com.yedam.hairshop.hairshop.MemberReservationInfoCtrl;
import com.yedam.hairshop.hairshop.RetiredEmployeeListCtrl;
import com.yedam.hairshop.hairshop.hairshopJoinCtrl;
import com.yedam.hairshop.hairshop.hairshopMainCtrl;
import com.yedam.hairshop.hairshop.hairshopNoticeCtrl;
import com.yedam.hairshop.hairshop.hairshopNoticeWriteCtrl;
import com.yedam.hairshop.members.DesignerSelectCtrl;
import com.yedam.hairshop.members.DesignerSelectResultCtrl;
import com.yedam.hairshop.members.DetailedReservationCtrl;
import com.yedam.hairshop.members.GpsHairshopSearchCtrl;
import com.yedam.hairshop.members.HairRankCtrl;
import com.yedam.hairshop.members.HairSelectCtrl;
import com.yedam.hairshop.members.HairSelectResultCtrl;
import com.yedam.hairshop.members.HairShopReviewCtrl;
import com.yedam.hairshop.members.HairShopReviewInsertCtrl;
import com.yedam.hairshop.members.HairShopSelectCtrl;
import com.yedam.hairshop.members.HairshopBookmarkCtrl;
import com.yedam.hairshop.members.HairshopSelectResultCtrl;
import com.yedam.hairshop.members.MembersBookmarkHairshopCtrl;
import com.yedam.hairshop.members.MembersDeleteCtrl;
import com.yedam.hairshop.members.MembersDeleteSCtrl;
import com.yedam.hairshop.members.MembersHairShopInfoCtrl;
import com.yedam.hairshop.members.MembersHairShopIntroCtrl;
import com.yedam.hairshop.members.MembersHsDesignerIntroCtrl;
import com.yedam.hairshop.members.MembersIdSearchCtrl;
import com.yedam.hairshop.members.MembersIdSearchSCtrl;
import com.yedam.hairshop.members.MembersInfoModifyCtrl;
import com.yedam.hairshop.members.MembersInfoViewCtrl;
import com.yedam.hairshop.members.MembersJoinCtrl;
import com.yedam.hairshop.members.MembersJoinEmailCtrl;
import com.yedam.hairshop.members.MembersJoinEndCtrl;
import com.yedam.hairshop.members.MembersJoinIdCheckCtrl;
import com.yedam.hairshop.members.MembersJoinSCtrl;
import com.yedam.hairshop.members.MembersLoginCtrl;
import com.yedam.hairshop.members.MembersLoginSCtrl;
import com.yedam.hairshop.members.MembersLogoutCtrl;
import com.yedam.hairshop.members.MembersMainCtrl;
import com.yedam.hairshop.members.MembersMainResultCtrl;
import com.yedam.hairshop.members.MembersMyPageTopCtrl;
import com.yedam.hairshop.members.MembersNoticeCtrl;
import com.yedam.hairshop.members.MembersNoticeWCtrl;
import com.yedam.hairshop.members.MembersNoticeWGCtrl;
import com.yedam.hairshop.members.MembersPwEmailCtrl;
import com.yedam.hairshop.members.MembersPwEndCtrl;
import com.yedam.hairshop.members.MembersPwModifyCtrl;
import com.yedam.hairshop.members.MembersPwSearchCtrl;
import com.yedam.hairshop.members.MembersPwSearchSCtrl;
import com.yedam.hairshop.members.MembersReservationDetailsCtrl;
import com.yedam.hairshop.members.MembersSearchCtrl;
import com.yedam.hairshop.members.MyRegionSettingCtrl;
import com.yedam.hairshop.members.PaymentCtrl;
import com.yedam.hairshop.members.PaymentMemberCtrl;
import com.yedam.hairshop.members.RegionDesignerRankCtrl;
import com.yedam.hairshop.members.RegionHairshopRankCtrl;
import com.yedam.hairshop.members.SearchDetailCtrl;
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
		list.put("/members/membersMain.do", new MembersMainCtrl());
		list.put("/members/membersMainResult.do", new MembersMainResultCtrl());
		
		list.put("/members/hairshopSelect.do", new HairShopSelectCtrl());
		list.put("/members/hairshopSelectResult.do", new HairshopSelectResultCtrl());
		
		list.put("/members/hairSelect.do", new HairSelectCtrl());
		list.put("/members/hairSelectResult.do", new HairSelectResultCtrl());
		
		list.put("/members/designerSelect.do", new DesignerSelectCtrl());
		list.put("/members/designerSelectResult.do", new DesignerSelectResultCtrl());
		
		list.put("/members/regionHairshopRank.do", new RegionHairshopRankCtrl()); //우리동네 미용실 순위
		list.put("/members/regionDesignerRank.do", new RegionDesignerRankCtrl()); //우리동네 디자이너 순위
		list.put("/members/hairRank.do", new HairRankCtrl()); 					  //헤어 순위
		
		list.put("/members/payment.do", new PaymentCtrl());
		list.put("/members/paymentMember.do", new PaymentMemberCtrl());			//회원결제
		
		list.put("/popup/hairshopReview.do", new HairShopReviewCtrl());			//리뷰 이동용
		list.put("/members/hairshopReviewInsert.do", new HairShopReviewInsertCtrl());
		list.put("/members/membersInsert.do", new TestController());
		list.put("/members/myRegionSetting.do", new MyRegionSettingCtrl());
		
		list.put("/ajax/hairshopBookmark.do", new HairshopBookmarkCtrl());		//북마크
		list.put("/ajax/searchRealtime.do", new SearchRealtimCtrl());			//자동완성 검색
		list.put("/members/searchDetail.do", new SearchDetailCtrl());			//상세검색
		
		list.put("/members/gpsHairshopSearch.do", new GpsHairshopSearchCtrl());
		
		list.put("/members/membersBookmarkHairshop.do", new MembersBookmarkHairshopCtrl());
		
		//==================================================================================
		//송현
		list.put("/designer/designerUpdate.do", new DesignerUpdateCtrl());
		list.put("/designer/designerInfo.do", new DesignerInfoCtrl());
		list.put("/designer/designerLogin.do", new DesignerLoginCtrl());
		list.put("/designer/customerJoinCtrl.do", new customerJoinCtrl());
		
		list.put("/hairshop/hairshopNoticeCtrl.do", new hairshopNoticeCtrl());
		list.put("/hairshop/hairshopNoticeWriteCtrl.do", new hairshopNoticeWriteCtrl());
		
		//list.put("/hairshop/hairshopNoticeCtrl.do", new hairshopNoticeCtrl());
		
		
		//린아
		list.put("/members/membersLogin.do", new MembersLoginCtrl());			// 로그인 페이지 이동 컨트롤러
		list.put("/members/membersLogout.do", new MembersLogoutCtrl());			// 로그아웃 페이지 이동 컨트롤러
		list.put("/members/membersLoginS.do", new MembersLoginSCtrl());			// 로그인 넘어가는 컨트롤러
		
		list.put("/members/membersSearch.do", new MembersSearchCtrl());			// ID/PW 찾기 페이지 이동 컨트롤러
		list.put("/members/membersIdSearch.do", new MembersIdSearchCtrl());		// ID 찾기 페이지 이동 컨트롤러
		list.put("/members/membersIdSearchS.do", new MembersIdSearchSCtrl());	// ID 찾기 넘어가는 컨트롤러
		list.put("/members/membersPwSearch.do", new MembersPwSearchCtrl());		// PW 찾기 페이지 이동 컨트롤러
		list.put("/members/membersPwSearchS.do", new MembersPwSearchSCtrl());	// PW 찾기 넘어가는 컨트롤러
		list.put("/members/membersPwEnd.do", new MembersPwEndCtrl());			// PW 찾기 완료 페이지 이동하는 컨트롤러
		list.put("/members/membersPwEmail.do", new MembersPwEmailCtrl());		// PW EMAIL 인증 클릭 컨트롤러
		list.put("/members/membersPwModify.do", new MembersPwModifyCtrl());		// PW 수정 넘어가는 컨트롤러
							
		list.put("/members/membersJoin.do", new MembersJoinCtrl());				// 회원가입 페이지 이동 컨트롤러
		list.put("/members/membersJoinS.do", new MembersJoinSCtrl());			// 회원가입 넘어가는 컨트롤러
		list.put("/ajax/membersJoinIdCheck.do", new MembersJoinIdCheckCtrl());	// 회원가입 ID 중복확인 컨트롤러
		list.put("/members/membersJoinEmail.do", new MembersJoinEmailCtrl());	// 회원가입 이메일 인증하는 컨트롤러
		list.put("/members/membersJoinEnd.do", new MembersJoinEndCtrl());		// 회원가입 완료 페이지 이동하는 컨트롤러
		
		list.put("/members/membersInfoModify.do", new MembersInfoModifyCtrl());	// 회원수정 컨트롤러
		list.put("/members/membersInfoView.do", new MembersInfoViewCtrl());		// 회원수정 정보확인 컨트롤러
		list.put("/members/membersRD.do", new MembersReservationDetailsCtrl());	// 예약내역 컨트롤러
		list.put("/members/membersDR.do", new DetailedReservationCtrl());		// 예약 상세 확인 컨트롤러
		list.put("/members/membersMypageTop.do", new MembersMyPageTopCtrl());	// 마이페이지 톱 컨트롤러
		
		list.put("/members/membersDelete.do", new MembersDeleteCtrl());			// 회원 탈퇴로 이동하는 컨트롤러
		list.put("/members/membersDeleteS.do", new MembersDeleteSCtrl());		// 회원 탈퇴 처리하는 컨트롤러
		
		list.put("/members/hairshopInfo.do", new MembersHairShopInfoCtrl());	// 헤어샵소개로 이동하는 컨트롤러
		list.put("/members/hairshopIntro.do", new MembersHairShopIntroCtrl());	// 헤어샵 정보 뿌려주는 컨트롤러
		list.put("/members/hsDesignerIntro.do", new MembersHsDesignerIntroCtrl());  // 헤어샵안의 디자이너 소개 정보 뿌려주는 컨트롤러
		
		list.put("/members/membersNotice.do", new MembersNoticeCtrl());			// 공지사항으로 이동하는 컨트롤러
		list.put("/members/membersNoticeWG.do", new MembersNoticeWGCtrl());		// 공지사항 글쓰기로 이동하는 컨트롤러
		list.put("/members/membersNoticeW.do", new MembersNoticeWCtrl());		// 공지사항 글쓰기 컨트롤러
		
		//강산
		list.put("/admin/adminLogin.do", new adminLoginCtrl());
		list.put("/admin/adminMain.do", new adminMainCtrl());
		list.put("/admin/adminReturnToLogin.do", new adminReturnToLoginCtrl());
		list.put("/hairshop/salesStatistics.do", new salesStatisticsCtrl());
		list.put("/hairshop/salesStatisticsResult.do", new salesStatisticsFCtrl());	
		list.put("/hairshop/sales.do", new salesCtrl());	
		list.put("/admin/adminBoardManage.do", new adminBoardManageCtrl());	
		list.put("/admin/adminBoardManageFind.do", new adminBoardManageFCtrl());	
		
		
		//승연
		list.put("/hairshop/hairshopMain.do", new hairshopMainCtrl()); //헤어샵 로그인 후 메인페이지
		list.put("/hairshop/hairshopDesignerLogin.do", new HairshopDesignerLoginCtrl()); //헤어샵,디자이너 로그인페이지 -> 최종메인페이지 필요
		list.put("/hairshop/employeeList.do", new EmployeeListCtrl()); //디자이너 직원목록
		list.put("/hairshop/employeeSimpleJoin.do", new EmployeeSimpleJoinFCtrl()); //디자이너 간편등록
		list.put("/hairshop/retiredEmployeeList.do", new RetiredEmployeeListCtrl()); //디자이너 퇴사명단
		list.put("/hairshop/hairshopReturnToLogin.do", new HairshopReturnToLoginCtrl()); //로그인페이지 이동처리
		list.put("/hairshop/employeeUpdate.do", new EmployeeUpdateFCtrl()); // 직원정보수정
		list.put("/ajax/findEmployees.do", new FindEmployeesAjCtrl()); // 직원목록 들고오기
		list.put("/hairshop/fireEmployee.do", new FireEmployeeFCtrl()); // 직원퇴사처리
		list.put("/hairshop/employeeAuth.do", new EmployeeAuthFCtrl()); // 직원 인증 처리
		list.put("/ajax/hairshopJoin.do", new hairshopJoinCtrl()); //회원가입
		list.put("/ajax/hairshopJoinPre.do", new HairshopJoinPreFCtrl()); //회원가입
		list.put("/ajax/hairshopJoinFin.do", new HairshopJoinFinFCtrl()); //회원가입
		list.put("/ajax/hairshopEmailUse.do", new HairshopEmailUseAjCtrl()); //미용실 이메일 사용여부
		list.put("/ajax/dailyReservationListAj.do", new DailyReservationListAjCtrl());
		list.put("/hair/dailyReservationList.do", new DailyReservationListCtrl());
		list.put("/ajax/memberReservationInfo.do", new MemberReservationInfoCtrl());
		list.put("/hairshop/dailyReservationList.do", new DailyReservationListCtrl());
		list.put("/hairshop/weeklyReservationList.do", new DailyReservationListCtrl());
		list.put("/ajax/weeklyReservationListAj.do", new DailyReservationListAjCtrl());
		list.put("/ajax/memberReservationInfo.do", new MemberReservationInfoCtrl());
		
		list.put("/designer/designerMain.do", new DesignerMainCtrl());
		list.put("/designer/desDailyReservationList.do", new DesDailyReservationListCtrl());
		list.put("/ajax/desDailyReservationListAj.do", new DesDailyReservationListAjCtrl());
		list.put("/designer/desWeeklyReservationList.do", new DesDailyReservationListCtrl());
		list.put("/ajax/desWeeklyReservationListAj.do", new DesDailyReservationListAjCtrl());
		list.put("/ajax/changeReservationStatus.do", new ChangeReservationStatusAjCtrl());
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
