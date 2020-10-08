package com.yedam.filter;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.admin.AdminCouponInsertCtrl;
import com.yedam.hairshop.admin.AdminCouponInsertFCtrl;
import com.yedam.hairshop.admin.AdminCouponManageCtrl;
import com.yedam.hairshop.admin.AdminCustomerManageCtrl;
import com.yedam.hairshop.admin.AdminCustomerManageFCtrl;
import com.yedam.hairshop.admin.AdminDesignerManageCFtrl;
import com.yedam.hairshop.admin.AdminDesignerManageCtrl;
import com.yedam.hairshop.admin.AdminHairshopManageCtrl;
import com.yedam.hairshop.admin.AdminHairshopManageFCtrl;
import com.yedam.hairshop.admin.AdminNoticeInsertCtrl;
import com.yedam.hairshop.admin.AdminNoticeInsertFCtrl;
import com.yedam.hairshop.admin.AdminNoticeManageCtrl;
import com.yedam.hairshop.admin.AdminNoticeManageFCtrl;
import com.yedam.hairshop.admin.AdminNoticeViewCtrl;
import com.yedam.hairshop.admin.AdminQnaAnswerCtrl;
import com.yedam.hairshop.admin.AdminQnaManageCtrl;
import com.yedam.hairshop.admin.AdminQnaManageFCtrl;
import com.yedam.hairshop.admin.AdminQnaViewCtrl;
import com.yedam.hairshop.admin.AdminSalesStatisticsCtrl;
import com.yedam.hairshop.admin.CategoryMajorDeleteAjCtrl;
import com.yedam.hairshop.admin.ChartCtrl;
import com.yedam.hairshop.admin.CodeListCtrl;
import com.yedam.hairshop.admin.PrimaryCodeInsertAjCtrl;
import com.yedam.hairshop.admin.SecondaryCodeInsertAjCtrl;
import com.yedam.hairshop.admin.TestController;
import com.yedam.hairshop.admin.adminBoardManageCtrl;
import com.yedam.hairshop.admin.adminBoardManageFCtrl;
import com.yedam.hairshop.admin.adminBoardSettingCtrl;
import com.yedam.hairshop.admin.adminBoardSettingFCtrl;
import com.yedam.hairshop.admin.adminLoginCtrl;
import com.yedam.hairshop.admin.adminMainCtrl;
import com.yedam.hairshop.admin.adminReturnToLoginCtrl;
import com.yedam.hairshop.admin.designerAnalysisCtrl;
import com.yedam.hairshop.admin.designerAnalysisFCtrl;
import com.yedam.hairshop.admin.hairAnalysisCtrl;
import com.yedam.hairshop.admin.hairAnalysisFCtrl;
import com.yedam.hairshop.admin.hairshopAnalysisCtrl;
import com.yedam.hairshop.admin.hairshopAnalysisFCtrl;
import com.yedam.hairshop.admin.salesCtrl;
import com.yedam.hairshop.admin.salesStatisticsCtrl;
import com.yedam.hairshop.admin.salesStatisticsFCtrl;
import com.yedam.hairshop.designer.DesDailyReservationListAjCtrl;
import com.yedam.hairshop.designer.DesDailyReservationListCtrl;
import com.yedam.hairshop.designer.DesWeeklyReservationListAjCtrl;
import com.yedam.hairshop.designer.DesignerInfoCtrl;
import com.yedam.hairshop.designer.DesignerLoginCtrl;
import com.yedam.hairshop.designer.DesignerMainCtrl;
import com.yedam.hairshop.designer.DesignerMyPageCtrl;
import com.yedam.hairshop.designer.DesignerMyPageUpdateCtrl;
import com.yedam.hairshop.designer.DesignerNextCustomerAjCtrl;
import com.yedam.hairshop.designer.DesignerUpdateCtrl;
import com.yedam.hairshop.designer.FindMyCustomerCtrl;
import com.yedam.hairshop.designer.FindMyCustomerDetailCtrl;
import com.yedam.hairshop.designer.FindMyCustomerReCtrl;
import com.yedam.hairshop.hairshop.ChangeReservationStatusAjCtrl;
import com.yedam.hairshop.hairshop.DailyReservationListAjCtrl;
import com.yedam.hairshop.hairshop.DailyReservationListCtrl;
import com.yedam.hairshop.hairshop.EmployeeAuthFCtrl;
import com.yedam.hairshop.hairshop.EmployeeListCtrl;
import com.yedam.hairshop.hairshop.EmployeeSimpleJoinFCtrl;
import com.yedam.hairshop.hairshop.EmployeeUpdateFCtrl;
import com.yedam.hairshop.hairshop.FindEmployeesAjCtrl;
import com.yedam.hairshop.hairshop.FireEmployeeFCtrl;
import com.yedam.hairshop.hairshop.HairshopCouponInsertCtrl;
import com.yedam.hairshop.hairshop.HairshopCouponListCtrl;
import com.yedam.hairshop.hairshop.HairshopDesignerLoginCtrl;
import com.yedam.hairshop.hairshop.HairshopEmailUseAjCtrl;
import com.yedam.hairshop.hairshop.HairshopJoinFinFCtrl;
import com.yedam.hairshop.hairshop.HairshopJoinPreFCtrl;
import com.yedam.hairshop.hairshop.HairshopNextCustomerAjCtrl;
import com.yedam.hairshop.hairshop.HairshopReturnToLoginCtrl;
import com.yedam.hairshop.hairshop.HsFindMyCustomerCtrl;
import com.yedam.hairshop.hairshop.HsFindMyCustomerDetailCtrl;
import com.yedam.hairshop.hairshop.HsFindMyCustomerReCtrl;
import com.yedam.hairshop.hairshop.MemberReservationInfoCtrl;
import com.yedam.hairshop.hairshop.MonthlyReservationListAjCtrl;
import com.yedam.hairshop.hairshop.MonthlyReservationListCtrl;
import com.yedam.hairshop.hairshop.RetiredEmployeeListCtrl;
import com.yedam.hairshop.hairshop.UpdateMdriMemoAjCtrl;
import com.yedam.hairshop.hairshop.hairshopJoinCtrl;
import com.yedam.hairshop.hairshop.hairshopMainCtrl;
import com.yedam.hairshop.hairshop.hairshopNoticeCtrl;
import com.yedam.hairshop.hairshop.hairshopNoticeViewCtrl;
import com.yedam.hairshop.hairshop.hairshopNoticeWriteCtrl;
import com.yedam.hairshop.members.ChangeDesignerCtrl;
import com.yedam.hairshop.members.DesignerBookmarkCtrl;
import com.yedam.hairshop.members.DesignerSelectCtrl;
import com.yedam.hairshop.members.DesignerSelectResultCtrl;
import com.yedam.hairshop.members.DetailedReservationCtrl;
import com.yedam.hairshop.members.GpsHairshopSearchCtrl;
import com.yedam.hairshop.members.HairBookmarkCtrl;
import com.yedam.hairshop.members.HairRankCtrl;
import com.yedam.hairshop.members.HairSelectCtrl;
import com.yedam.hairshop.members.HairSelectResultCtrl;
import com.yedam.hairshop.members.HairShopReviewCtrl;
import com.yedam.hairshop.members.HairShopReviewInsertCtrl;
import com.yedam.hairshop.members.HairShopSelectCtrl;
import com.yedam.hairshop.members.HairshopBookmarkCtrl;
import com.yedam.hairshop.members.HairshopSelectResultCtrl;
import com.yedam.hairshop.members.MembersBookmarkDesignerCtrl;
import com.yedam.hairshop.members.MembersBookmarkHairshopCtrl;
import com.yedam.hairshop.members.MembersBookmarkHairstyleCtrl;
import com.yedam.hairshop.members.MembersCouponCtrl;
import com.yedam.hairshop.members.MembersDeleteCtrl;
import com.yedam.hairshop.members.MembersDeleteSCtrl;
import com.yedam.hairshop.members.MembersHairShopInfoCtrl;
import com.yedam.hairshop.members.MembersHairShopIntroCtrl;
import com.yedam.hairshop.members.MembersHsCouponICtrl;
import com.yedam.hairshop.members.MembersHsDesignerIntroCtrl;
import com.yedam.hairshop.members.MembersHsEventIntroCtrl;
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
import com.yedam.hairshop.members.MembersNoticeDCtrl;
import com.yedam.hairshop.members.MembersNoticeMCtrl;
import com.yedam.hairshop.members.MembersNoticeMGCtrl;
import com.yedam.hairshop.members.MembersNoticeVCtrl;
import com.yedam.hairshop.members.MembersNoticeWCtrl;
import com.yedam.hairshop.members.MembersNoticeWGCtrl;
import com.yedam.hairshop.members.MembersPwEmailCtrl;
import com.yedam.hairshop.members.MembersPwEndCtrl;
import com.yedam.hairshop.members.MembersPwModifyCtrl;
import com.yedam.hairshop.members.MembersPwSearchCtrl;
import com.yedam.hairshop.members.MembersPwSearchSCtrl;
import com.yedam.hairshop.members.MembersQnaCtrl;
import com.yedam.hairshop.members.MembersQnaDCtrl;
import com.yedam.hairshop.members.MembersQnaMCtrl;
import com.yedam.hairshop.members.MembersQnaMGCtrl;
import com.yedam.hairshop.members.MembersQnaReCtrl;
import com.yedam.hairshop.members.MembersQnaWCtrl;
import com.yedam.hairshop.members.MembersQnaWGCtrl;
import com.yedam.hairshop.members.MembersReservationDetailsCtrl;
import com.yedam.hairshop.members.MyRegionSettingCtrl;
import com.yedam.hairshop.members.PaymentCtrl;
import com.yedam.hairshop.members.PaymentImportCtrl;
import com.yedam.hairshop.members.PaymentMemberCtrl;
import com.yedam.hairshop.members.RegionDesignerRankCtrl;
import com.yedam.hairshop.members.RegionHairshopRankCtrl;
import com.yedam.hairshop.members.SearchDetailCtrl;
import com.yedam.hairshop.members.SearchRealtimCtrl;
import com.yedam.hairshop.members.membersQnaReGCtrl;
import com.yedam.hairshop.members.membersQnaVCtrl;

public class Login implements Filter {
	HashMap<String, String> list = null;
	final String memberLoginPage = "/members/membersLogin.do";
	final String hairLoginPage = "/ajax/hairshopReturnToLogin.do";
	final String designerLoginPage = "/ajax/hairshopReturnToLogin.do";
	final String adminLoginPage = "/admin/adminReturnToLogin.do";

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		HttpSession sess = req.getSession();
		Object login = sess.getAttribute("login");
		String udong = (String) sess.getAttribute("udong");

		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath(); // frontWeb//
		String path = requestURI.substring(contextPath.length()); // memberInsert.do
		System.out.println(path);
		// String isIn = list.get(path);

		if (list.get(path) != null) {
			System.out.println("로그인필요");
			if (udong == null || udong.trim().length() <= 0) {
				res.sendRedirect(req.getContextPath() + list.get(path));
				return;
			} else {
				System.out.println("있기는함");
				if (path.equals(memberLoginPage)) {
					if (!udong.equals("member")) {
						res.sendRedirect(req.getContextPath() + list.get(path));
						return;
					}
				} else if (path.equals(hairLoginPage)) {
					if (!udong.equals("hairshop")) {
						res.sendRedirect(req.getContextPath() + list.get(path));
						return;
					}
				} else if (path.equals(designerLoginPage)) {
					if (!udong.equals("designer")) {
						res.sendRedirect(req.getContextPath() + list.get(path));
						return;
					}
				} else if (path.equals(adminLoginPage)) {
					if (!udong.equals("admin")) {
						res.sendRedirect(req.getContextPath() + list.get(path));
						return;
					}
				}
			}
		} else {
			System.out.println("로그인 불필요");
		}
		chain.doFilter(req, res);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		list = new HashMap<String, String>();

		// 상민
		list.put("/members/membersMain.do", memberLoginPage);
		list.put("/members/membersMainResult.do", memberLoginPage);

		list.put("/members/hairshopSelect.do", memberLoginPage);
		list.put("/members/hairshopSelectResult.do", memberLoginPage);

		list.put("/members/hairSelect.do", memberLoginPage);
		list.put("/members/hairSelectResult.do", memberLoginPage);

		list.put("/members/designerSelect.do", memberLoginPage);
		list.put("/members/designerSelectResult.do", memberLoginPage);

		list.put("/members/regionHairshopRank.do", memberLoginPage); // 우리동네 미용실 순위
		list.put("/members/regionDesignerRank.do", memberLoginPage); // 우리동네 디자이너 순위
		list.put("/members/hairRank.do", memberLoginPage); // 헤어 순위

		list.put("/members/payment.do", memberLoginPage);
		list.put("/members/paymentMember.do", memberLoginPage); // 회원결제
		list.put("/members/paymentImport.do", memberLoginPage);

		list.put("/popup/hairshopReview.do", memberLoginPage); // 리뷰 이동용
		list.put("/members/hairshopReviewInsert.do", memberLoginPage);
		list.put("/members/membersInsert.do", memberLoginPage);
		list.put("/members/myRegionSetting.do", memberLoginPage);

		list.put("/ajax/changeDesigner.do", memberLoginPage);

		list.put("/ajax/hairBookmark.do", memberLoginPage); // 헤어 북마크
		list.put("/ajax/hairshopBookmark.do", memberLoginPage); // 헤어샵 북마크
		list.put("/ajax/designerBookmark.do", memberLoginPage); // 디자이너 북마크

		list.put("/ajax/searchRealtime.do", memberLoginPage); // 자동완성 검색
		list.put("/members/searchDetail.do", memberLoginPage); // 상세검색

		list.put("/members/gpsHairshopSearch.do", memberLoginPage);

		list.put("/members/membersBookmarkHairshop.do", memberLoginPage);
		list.put("/members/membersBookmarkDesigner.do", memberLoginPage);
		list.put("/members/membersBookmarkHairstyle.do", memberLoginPage);

		// 송현
		list.put("/designer/designerUpdate.do", designerLoginPage);
		list.put("/designer/designerInfo.do", designerLoginPage);
		list.put("/designer/designerLogin.do", null);
		// list.put("/designer/customerJoinCtrl.do", designerLoginPage);

		list.put("/hairshop/hairshopNoticeCtrl.do", designerLoginPage);
		list.put("/hairshop/hairshopNoticeWriteCtrl.do", designerLoginPage);
		list.put("/hairshop/hairshopNoticeViewCtrl.do", designerLoginPage);

		list.put("/designer/designerMyPageCtrl.do", designerLoginPage);
		list.put("/designer/designerMyPageUpdateCtrl.do", designerLoginPage);
		// list.put("/hairshop/hairshopNoticeCtrl.do", hairLoginPage);
		list.put("/hairshop/HairshopCouponListCtrl.do", hairLoginPage);
		list.put("/hairshop/HairshopCouponInsertCtrl.do", hairLoginPage);

		// 린아
		list.put("/members/membersLogin.do", null); // 로그인 페이지 이동 컨트롤러
		list.put("/members/membersLogout.do", memberLoginPage); // 로그아웃 페이지 이동 컨트롤러
		list.put("/members/membersLoginS.do", null); // 로그인 처리하는 컨트롤러

		list.put("/members/membersIdSearch.do", memberLoginPage); // ID 찾기 페이지 이동 컨트롤러
		list.put("/members/membersIdSearchS.do", memberLoginPage); // ID 찾기 넘어가는 컨트롤러
		list.put("/members/membersPwSearch.do", memberLoginPage); // PW 찾기 페이지 이동 컨트롤러
		list.put("/members/membersPwSearchS.do", memberLoginPage); // PW 찾기 넘어가는 컨트롤러
		list.put("/members/membersPwEnd.do", memberLoginPage); // PW 찾기 완료 페이지 이동하는 컨트롤러
		list.put("/members/membersPwEmail.do", memberLoginPage); // PW EMAIL 인증 클릭 컨트롤러
		list.put("/members/membersPwModify.do", memberLoginPage); // PW 수정 처리하는 컨트롤러

		list.put("/members/membersJoin.do", memberLoginPage); // 회원가입 페이지 이동 컨트롤러
		list.put("/members/membersJoinS.do", memberLoginPage); // 회원가입 넘어가는 컨트롤러
		list.put("/ajax/membersJoinIdCheck.do", memberLoginPage); // 회원가입 ID 중복확인 컨트롤러
		list.put("/members/membersJoinEmail.do", memberLoginPage); // 회원가입 이메일 인증하는 컨트롤러
		list.put("/members/membersJoinEnd.do", memberLoginPage); // 회원가입 완료 페이지 이동하는 컨트롤러

		list.put("/members/membersInfoModify.do", memberLoginPage); // 회원수정 컨트롤러
		list.put("/members/membersInfoView.do", memberLoginPage); // 회원수정 정보확인 컨트롤러
		list.put("/members/membersRD.do", memberLoginPage); // 예약내역 컨트롤러
		list.put("/members/membersDR.do", memberLoginPage); // 예약 상세 확인 컨트롤러
		list.put("/members/membersMypageTop.do", memberLoginPage); // 마이페이지 톱 컨트롤러
		list.put("/members/membersCoupon.do", memberLoginPage); // 내 쿠폰 내역 확인 컨트롤러

		list.put("/members/membersDelete.do", memberLoginPage); // 회원 탈퇴로 이동하는 컨트롤러
		list.put("/members/membersDeleteS.do", memberLoginPage); // 회원 탈퇴 처리하는 컨트롤러

		list.put("/members/hairshopInfo.do", memberLoginPage); // 헤어샵소개로 이동하는 컨트롤러
		list.put("/members/hairshopIntro.do", memberLoginPage); // 헤어샵 정보 뿌려주는 컨트롤러
		list.put("/members/hsDesignerIntro.do", memberLoginPage); // 헤어샵안의 디자이너 소개 정보 뿌려주는 컨트롤러
		list.put("/members/hsEventIntro.do", memberLoginPage); // 헤어샵 안의 쿠폰 보여주는 컨트롤러
		list.put("/members/hsCouponIssuance.do", memberLoginPage); // 헤어샵 안의 쿠폰 발급해주는 컨트롤러

		list.put("/members/membersNotice.do", memberLoginPage); // 공지사항 목록 컨트롤러
		list.put("/members/membersNoticeWG.do", memberLoginPage); // 공지사항 글쓰기로 이동하는 컨트롤러
		list.put("/members/membersNoticeW.do", memberLoginPage); // 공지사항 글쓰기 컨트롤러
		list.put("/members/membersNoticeV.do", memberLoginPage); // 공지사항 보기 컨트롤러
		list.put("/members/membersNoticeMG.do", memberLoginPage); // 공지사항 수정으로 이동하는 컨트롤러
		list.put("/members/membersNoticeM.do", memberLoginPage); // 공지사항 수정 하는 컨트롤러
		list.put("/members/membersNoticeD.do", memberLoginPage); // 공지사항 삭제 컨트롤러

		list.put("/members/membersQna.do", memberLoginPage); // Qna 목록 컨트롤러
		list.put("/members/membersQnaWG.do", memberLoginPage); // Qna 글쓰기로 이동하는 컨트롤러
		list.put("/members/membersQnaW.do", memberLoginPage); // Qna 글쓰기 컨트롤러
		list.put("/members/membersQnaV.do", memberLoginPage); // Qna 보기 컨트롤러
		list.put("/members/membersQnaReG.do", memberLoginPage); // Qna 답변으로 이동 컨트롤러
		list.put("/members/membersQnaRe.do", memberLoginPage); // Qna 답변 처리하는 컨트롤러
		list.put("/members/membersQnaMG.do", memberLoginPage); // Qna 수정으로 이동하는 컨트롤러
		list.put("/members/membersQnaM.do", memberLoginPage); // Qna 수정하는 컨트롤러
		list.put("/members/membersQnaD.do", memberLoginPage); // Qna 삭제 컨트롤러

		// 강산
		list.put("/admin/adminLogin.do", null);// 로그인
		list.put("/admin/adminMain.do", adminLoginPage);
		list.put("/admin/adminReturnToLogin.do", null);

		list.put("/ajax/hairshop/salesStatistics.do", adminLoginPage);// 헤어샵통계
		list.put("/hairshop/salesStatisticsResult.do", adminLoginPage);
		list.put("/ajax/hairshop/sales.do", adminLoginPage);

		list.put("/ajax/hairshop/chart.do", adminLoginPage);
		list.put("/admin/adminSalesStatistics.do", adminLoginPage);
//		list.put("/admin/adminSalesStatisticsFind.do", adminLoginPage);
//		list.put("/admin/adminSales.do", adminLoginPage);

		list.put("/admin/adminBoardManage.do", adminLoginPage);// 보드
		list.put("/admin/adminBoardManageFind.do", adminLoginPage);

		list.put("/admin/adminNoticeManage.do", adminLoginPage);// notice
		list.put("/admin/adminNoticeManageFind.do", adminLoginPage);
		list.put("/admin/adminNoticeView.do", adminLoginPage);
		list.put("/admin/adminInsertNotice.do", adminLoginPage);
		list.put("/admin/adminNoticeInsertSubmit.do", adminLoginPage);
		list.put("/admin/adminQnaManage.do", adminLoginPage);// qna
		list.put("/admin/adminQnaManageFind.do", adminLoginPage);
		list.put("/admin/adminQnaAnswer.do", adminLoginPage);
		list.put("/admin/adminQnaView.do", adminLoginPage);
		list.put("/admin/adminBoardSetting.do", adminLoginPage);// setting
		list.put("/admin/adminBoardSettingFind.do", adminLoginPage);

		list.put("/admin/adminDesignerManage.do", adminLoginPage);// 회원관리
		list.put("/admin/adminDesignerManageFind.do", adminLoginPage);
		list.put("/admin/adminCustomerManage.do", adminLoginPage);
		list.put("/admin/adminCustomerManageFind.do", adminLoginPage);
		list.put("/admin/adminHairshopManage.do", adminLoginPage);
		list.put("/admin/adminHairshopManageFind.do", adminLoginPage);

		list.put("/admin/hairshopAnalysisFind.do", adminLoginPage);// 분석
		list.put("/admin/designerAnalysisFind.do", adminLoginPage);
		list.put("/admin/hairshopAnalysis.do", adminLoginPage);
		list.put("/admin/hairAnalysisFind.do", adminLoginPage);
		list.put("/admin/hairAnalysis.do", adminLoginPage);
		list.put("/admin/designerAnalysis.do", adminLoginPage);

		list.put("/admin/adminCouponManage.do", adminLoginPage);// 쿠폰
		list.put("/admin/adminCouponInsert.do", adminLoginPage);
		list.put("/admin/adminCouponInsertSubmit.do", adminLoginPage);

		// 승연
		list.put("/hairshop/hairshopMain.do", hairLoginPage); // 헤어샵 로그인 후 메인페이지
		list.put("/hairshop/hairshopDesignerLogin.do", null); // 헤어샵,디자이너 로그인페이지 -> 최종메인페이지 // 필요
		list.put("/hairshop/employeeList.do", hairLoginPage); // 디자이너 직원목록
		list.put("/hairshop/employeeSimpleJoin.do", hairLoginPage); // 디자이너 간편등록
		list.put("/hairshop/retiredEmployeeList.do", hairLoginPage); // 디자이너 퇴사명단
		list.put("/ajax/hairshopReturnToLogin.do", null); // 로그인페이지 이동처리
		list.put("/hairshop/employeeUpdate.do", hairLoginPage); // 직원정보수정
		list.put("/ajax/findEmployees.do", hairLoginPage); // 직원목록 들고오기
		list.put("/hairshop/fireEmployee.do", hairLoginPage); // 직원퇴사처리
		list.put("/hairshop/employeeAuth.do", hairLoginPage); // 직원 인증 처리
		list.put("/ajax/hairshopJoin.do", null); // 회원가입
		list.put("/ajax/hairshopJoinPre.do", null); // 회원가입
		list.put("/ajax/hairshopJoinFin.do", null); // 회원가입
		list.put("/ajax/hairshopEmailUse.do", null); // 미용실 이메일 사용여부

		list.put("/ajax/memberReservationInfo.do", hairLoginPage); // 예약상세정보확인
		list.put("/ajax/updateMdriMemo.do", hairLoginPage); // 상세예약정보 메모
		list.put("/ajax/changeReservationStatus.do", hairLoginPage); // 예약상태변경

		list.put("/hairshop/dailyReservationList.do", hairLoginPage); // 미용실 일간 예약자 리스트 (리소스 방식)
		list.put("/hairshop/weeklyReservationList.do", hairLoginPage); // 미용실 주간 예약자 리스트 (리소스 방식)
		list.put("/hairshop/monthlyReservationList.do", hairLoginPage); // 미용실 월간 예약자 리스트 (일반 캘린더 방식)

		list.put("/ajax/dailyReservationListAj.do", hairLoginPage); // 일간예약명단 가져오기 (리소스방식)
		list.put("/ajax/weeklyReservationListAj.do", hairLoginPage); // 주간예약명단 가져오기 (리소스방식)
		list.put("/ajax/monthlyReservationListAj.do", hairLoginPage); // 월간예약명단 가져오기 (일반캘린더 방식)

		list.put("/designer/designerMain.do", designerLoginPage); // 디자이너 메인페이지
		list.put("/designer/desDailyReservationList.do", designerLoginPage); // 디자이너 일간예약자 리스트(일반캘린더방식)
		list.put("/designer/desWeeklyReservationList.do", designerLoginPage); // 디자이너 주간예약자 리스트(일반캘린더방식)
		list.put("/designer/desMonthlyReservationList.do", designerLoginPage); // 디자이너 월간예약자
																				// 리스트(일반캘린더방식)
		list.put("/ajax/desDailyReservationListAj.do", designerLoginPage); // 일간예약명단 가져오기(일반캘린더방식)-싱글톤
		list.put("/ajax/desWeeklyReservationListAj.do", designerLoginPage); // 일간(주간)예약명단
																			// 가져오기(일반캘린더방식) - 객체생성

		list.put("/ajax/designerNextCustomer.do", designerLoginPage); // 디자이너용 다음 고객 찾기
		list.put("/designer/findMyCustomer.do", designerLoginPage); // 디자이너용 예약자 검색 및 명단보기
		list.put("/designer/findMycustomerRe.do", designerLoginPage); // 검색페이지로 돌아가기
		list.put("/designer/findMyCustomerDetail.do", designerLoginPage); // 디자이너용 예약자 상세 + 매출 정보 보기

		list.put("/ajax/hairshopNextCustomer.do", hairLoginPage); // 미용실용 다음 고객 찾기
		list.put("/hairshop/hsFindMyCustomer.do", hairLoginPage); // 미용실용 예약자 검색 및 명단보기
		list.put("/hairshop/hsFindMycustomerRe.do", hairLoginPage); // 미용실용 검색페이지로 돌아가기
		list.put("/hairshop/hsFindMyCustomerDetail.do", hairLoginPage); // 미용실용 예약자 상세 + 매출 정보 보기

		list.put("/admin/codeList.do", adminLoginPage); // 코드리스트 페이지 이동
		list.put("/ajax/primaryCodeInsert.do", adminLoginPage); // 주코드 입력
		list.put("/ajax/secondaryCodeInsert.do", adminLoginPage); // 보조코드 추가
		list.put("/ajax/codeUpdate.do", adminLoginPage); // 코드 수정
		list.put("/ajax/categoryMajorDelete.do", adminLoginPage); // 삭제
	}

	public void destroy() {
	}

}
