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






public class Login implements Filter {
	HashMap<String, String> list = null;
	final String memberLoginPage = "/members/membersLogin.do";
	final String hairLoginPage = "/ajax/hairshopReturnToLogin.do";
	final String designerLoginPage = "/ajax/designerReturnToLogin.do";
	final String adminLoginPage = "/admin/adminReturnToLogin.do";
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		HttpSession sess = req.getSession();
		//Object login = sess.getAttribute("login");
		String udong = (String) sess.getAttribute("udong");
		//System.out.println(udong);

		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath(); // frontWeb//
		String path = requestURI.substring(contextPath.length()); // memberInsert.do
		//System.out.println(path);
		// String isIn = list.get(path);

		if (list.get(path) != null) {
			
			if (udong == null || udong.trim().length() <= 0) {
				res.sendRedirect(req.getContextPath() + list.get(path));
				return;
			} else {
				
				if (list.get(path).equals(memberLoginPage)) {
					
					if (!udong.equals("member")) {
						res.sendRedirect(req.getContextPath() + list.get(path));
						return;
					}
				} else if (list.get(path).equals(hairLoginPage)) {
					if (!udong.equals("hairshop")) {
						res.sendRedirect(req.getContextPath() + list.get(path));
						return;
					}
				} else if (list.get(path).equals(designerLoginPage)) {
					if (!udong.equals("designer")) {
						res.sendRedirect(req.getContextPath() + list.get(path));
						return;
					}
				} else if (list.get(path).equals(adminLoginPage)) {
					if (!udong.equals("admin")) {
						res.sendRedirect(req.getContextPath() + list.get(path));
						return;
					}
				}
			}
		} else {
			//System.out.println("로그인 불필요");
		}
		chain.doFilter(req, res);
	}
	
	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		list = new HashMap<String, String>();

		// 상민
		list.put("/members/membersMain.do", null);
		list.put("/members/membersMainResult.do", null);

		list.put("/members/hairshopSelect.do", null);
		list.put("/members/hairshopSelectResult.do", null);

		list.put("/members/hairSelect.do", null);
		list.put("/members/hairSelectResult.do", null);

		list.put("/members/designerSelect.do", null);
		list.put("/members/designerSelectResult.do", null);

		list.put("/members/regionHairshopRank.do", null); // 우리동네 미용실 순위
		list.put("/members/regionDesignerRank.do", null); // 우리동네 디자이너 순위
		list.put("/members/regionHairRank.do", null); // 헤어 순위

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

		list.put("/members/gpsHairshopSearch.do", null);

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
		list.put("/hairshop/HairshopCouponCtrl.do",  hairLoginPage);
		
		list.put("/hairshop/hairshopProcedureFinish.do",  hairLoginPage);
		list.put("/hairshop/hairshopProcedureFinishList.do",  hairLoginPage);
		list.put("/hairshop/hairshopProcedureFinishSD.do",  hairLoginPage);  //시술완료고객 디자이너로검색해서 보기
		
		// 린아
		list.put("/members/membersLogin.do", null); // 로그인 페이지 이동 컨트롤러
		list.put("/members/membersLogout.do", memberLoginPage); // 로그아웃 페이지 이동 컨트롤러
		list.put("/members/membersLoginS.do", null); // 로그인 처리하는 컨트롤러

		list.put("/members/membersIdSearch.do", null); // ID 찾기 페이지 이동 컨트롤러
		list.put("/members/membersIdSearchS.do", null); // ID 찾기 넘어가는 컨트롤러
		list.put("/members/membersPwSearch.do", null); // PW 찾기 페이지 이동 컨트롤러
		list.put("/members/membersPwSearchS.do", null); // PW 찾기 넘어가는 컨트롤러
		list.put("/members/membersPwEnd.do", null); // PW 찾기 완료 페이지 이동하는 컨트롤러
		list.put("/members/membersPwEmail.do", memberLoginPage); // PW EMAIL 인증 클릭 컨트롤러
		list.put("/members/membersPwModify.do", memberLoginPage); // PW 수정 처리하는 컨트롤러

		list.put("/members/membersJoin.do", null); // 회원가입 페이지 이동 컨트롤러
		list.put("/members/membersJoinS.do", null); // 회원가입 넘어가는 컨트롤러
		list.put("/ajax/membersJoinIdCheck.do", null); // 회원가입 ID 중복확인 컨트롤러
		list.put("/members/membersJoinEmail.do", null); // 회원가입 이메일 인증하는 컨트롤러
		list.put("/members/membersJoinEnd.do", null); // 회원가입 완료 페이지 이동하는 컨트롤러

		list.put("/members/membersInfoModify.do", memberLoginPage); // 회원수정 컨트롤러
		list.put("/members/membersInfoView.do", memberLoginPage); // 회원수정 정보확인 컨트롤러
		list.put("/members/membersRD.do", memberLoginPage); // 예약내역 컨트롤러
		list.put("/members/membersDR.do", memberLoginPage); // 예약 상세 확인 컨트롤러
		list.put("/members/membersMypageTop.do", memberLoginPage); // 마이페이지 톱 컨트롤러
		list.put("/members/membersCoupon.do", memberLoginPage); // 내 쿠폰 내역 확인 컨트롤러

		list.put("/members/membersDelete.do", memberLoginPage); // 회원 탈퇴로 이동하는 컨트롤러
		list.put("/members/membersDeleteS.do", memberLoginPage); // 회원 탈퇴 처리하는 컨트롤러

		list.put("/members/hairshopInfo.do", null); // 헤어샵소개로 이동하는 컨트롤러
		list.put("/members/hairshopIntro.do", null); // 헤어샵 정보 뿌려주는 컨트롤러
		list.put("/members/hsDesignerIntro.do", null); // 헤어샵안의 디자이너 소개 정보 뿌려주는 컨트롤러
		list.put("/members/hsEventIntro.do", null); // 헤어샵 안의 쿠폰 보여주는 컨트롤러
		list.put("/members/hsCouponIssuance.do", memberLoginPage); // 헤어샵 안의 쿠폰 발급해주는 컨트롤러
		list.put("/members/hsReviewIntro.do", null);	// 헤어샵 안의 리뷰보기 컨트롤러

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
		list.put("/ajax/designerReturnToLogin.do", null);
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
		list.put("/ajax/desMemberReservationInfo.do", designerLoginPage); // 예약상세정보확인
		list.put("/ajax/desUpdateMdriMemo.do", designerLoginPage); // 상세예약정보 메모
		list.put("/ajax/desChangeReservationStatus.do", designerLoginPage); // 예약상태변경

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
		
		list.put("/hairshop/hairInfoList.do", hairLoginPage); //헤어시술목록 페이지이동
		list.put("/hairshop/hairInfoDetail.do", hairLoginPage); //헤어시술상세페이지 이동
		list.put("/hairshop/hairInfoListRe.do", hairLoginPage); //헤어시술목록 검색페이지로 이동
		list.put("/hairshop/hairInfoFullList.do", hairLoginPage); //헤어시술 전체목록
		list.put("/hairshop/myHairshopInfo", hairLoginPage); //마이페이지
		list.put("/ajax/hairDeslogout.do", hairLoginPage); // 미용실,헤어샵 로그아웃 처리
		list.put("/ajax/hairStatusChange.do", hairLoginPage); // 헤에 사용미사용상태 변경
		list.put("/hairshop/hairInfoInsert.do", hairLoginPage); // 헤어시술등록이동
		list.put("/hairshop/hairInfoInsertForm.do", hairLoginPage); // 헤어시술등록처리
		list.put("/ajax/getTmicList.do",hairLoginPage);//시술중분류리스트 가져오기
		list.put("/ajax/checkSameHhiName.do", hairLoginPage); //시술명 중복체크
		list.put("/hairshop/myHairshopProfile.do", hairLoginPage); //미용실 프로필공지사항이미지 조회페이지
		list.put("/hairshop/myHairshopProfileUpdate.do", hairLoginPage); // 미용실 프로필공지사항이미지 수정처리
		list.put("/hairshop/myParkingChange.do", hairLoginPage); //주차장 사용여부 변경
		list.put("/ajax/myHairshopInfoUpdate.do", hairLoginPage); //미용실 정보업데이트페이지
	}
	
	@Override
	public void destroy() {
	}

}
