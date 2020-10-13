package com.yedam.hairshop.common;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.admin.AdminCouponInsertCtrl;
import com.yedam.hairshop.admin.AdminCouponInsertFCtrl;
import com.yedam.hairshop.admin.AdminCouponManageCtrl;
import com.yedam.hairshop.admin.AdminCustomerManageCtrl;
import com.yedam.hairshop.admin.AdminCustomerManageFCtrl;
import com.yedam.hairshop.admin.AdminDesignerManageCFtrl;
import com.yedam.hairshop.admin.AdminDesignerManageCtrl;
import com.yedam.hairshop.admin.AdminHairshopManageCtrl;
import com.yedam.hairshop.admin.AdminHairshopManageFCtrl;
import com.yedam.hairshop.admin.AdminMypageCtrl;
import com.yedam.hairshop.admin.AdminNewHairshopApprovalCtrl;
import com.yedam.hairshop.admin.AdminNewHairshopCtrl;
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
import com.yedam.hairshop.admin.AdminTmicApprovalCtrl;
import com.yedam.hairshop.admin.AdminTtCategoryRequestCtrl;
import com.yedam.hairshop.admin.AnalysisByNewCtrl;
import com.yedam.hairshop.admin.AnalysisCtrl;
import com.yedam.hairshop.admin.CategoryMajorDeleteAjCtrl;
import com.yedam.hairshop.admin.CodeListCtrl;
import com.yedam.hairshop.admin.PrimaryCodeInsertAjCtrl;
import com.yedam.hairshop.admin.SecondaryCodeInsertAjCtrl;
import com.yedam.hairshop.admin.SendEmailToCustomerCtrl;
import com.yedam.hairshop.admin.TestController;
import com.yedam.hairshop.admin.TmicDelete;
import com.yedam.hairshop.admin.TmicInsert;
import com.yedam.hairshop.admin.TmicUpdate;
import com.yedam.hairshop.admin.TtCategoryManageCtrl;
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
import com.yedam.hairshop.designer.AnalysisSalesByDsCtrl;
import com.yedam.hairshop.designer.AnalysisSalesByDsGoCtrl;
import com.yedam.hairshop.designer.DesDailyReservationListAjCtrl;
import com.yedam.hairshop.designer.DesDailyReservationListCtrl;
import com.yedam.hairshop.designer.DesMemberReservationInfoCtrl;
import com.yedam.hairshop.designer.DesReturnToLoginCtrl;
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
import com.yedam.hairshop.hairshop.AnalysisAgeCtrl;
import com.yedam.hairshop.hairshop.AnalysisByHairshopCount;
import com.yedam.hairshop.hairshop.AnalysisByTreatCtrl;
import com.yedam.hairshop.hairshop.AnalysisDesignerRsvRankCtrl;
import com.yedam.hairshop.hairshop.AnalysisDesignerTotalCtrl;
import com.yedam.hairshop.hairshop.AnalysisGenderCtrl;
import com.yedam.hairshop.hairshop.AnalysisMonthlyCtrl;
import com.yedam.hairshop.hairshop.AnalysisTotalCtrl;
import com.yedam.hairshop.hairshop.AnalysisTreatGenderCtrl;
import com.yedam.hairshop.hairshop.AnalysisTreatTableCtrl;
import com.yedam.hairshop.hairshop.AnalysisTreatTableGoCtrl;
import com.yedam.hairshop.hairshop.ChangeReservationStatusAjCtrl;
import com.yedam.hairshop.hairshop.ChartCtrl;
import com.yedam.hairshop.hairshop.CheckSameHhiNameAjCtrl;
import com.yedam.hairshop.hairshop.DailyReservationListAjCtrl;
import com.yedam.hairshop.hairshop.DailyReservationListCtrl;
import com.yedam.hairshop.hairshop.EmployeeAuthFCtrl;
import com.yedam.hairshop.hairshop.EmployeeListCtrl;
import com.yedam.hairshop.hairshop.EmployeeSimpleJoinFCtrl;
import com.yedam.hairshop.hairshop.EmployeeUpdateFCtrl;
import com.yedam.hairshop.hairshop.FindEmployeesAjCtrl;
import com.yedam.hairshop.hairshop.FireEmployeeFCtrl;
import com.yedam.hairshop.hairshop.GetTmicListAjCtrl;
import com.yedam.hairshop.hairshop.HairDesLogoutCtrl;
import com.yedam.hairshop.hairshop.HairInfoDetailCtrl;
import com.yedam.hairshop.hairshop.HairInfoFullListCtrl;
import com.yedam.hairshop.hairshop.HairInfoInsertCtrl;
import com.yedam.hairshop.hairshop.HairInfoInsertFormFCtrl;
import com.yedam.hairshop.hairshop.HairInfoListCtrl;
import com.yedam.hairshop.hairshop.HairInfoListCtrlRe;
import com.yedam.hairshop.hairshop.HairInfoPicUploadFCtrl;
import com.yedam.hairshop.hairshop.HairNameRequestCtrl;
import com.yedam.hairshop.hairshop.HairStatusChangeAjCtrl;
import com.yedam.hairshop.hairshop.HairshopCloseDayManageCtrl;
import com.yedam.hairshop.hairshop.HairshopCloseDayManageUCtrl;
import com.yedam.hairshop.hairshop.HairshopCouponCtrl;
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
import com.yedam.hairshop.hairshop.MyHairShopProfileCtrl;
import com.yedam.hairshop.hairshop.MyHairshopInfoCtrl;
import com.yedam.hairshop.hairshop.MyHairshopInfoUpdateFrmFCtrl;
import com.yedam.hairshop.hairshop.MyHairshopProfileUpdateFCtrl;
import com.yedam.hairshop.hairshop.MyParkingChangeCtrl;
import com.yedam.hairshop.hairshop.RetiredEmployeeListCtrl;
import com.yedam.hairshop.hairshop.SalesBydesignerCtrl;
import com.yedam.hairshop.hairshop.SalesStatisticsByDesignerCtrl;
import com.yedam.hairshop.hairshop.UpdateMdriMemoAjCtrl;
import com.yedam.hairshop.hairshop.employeeCloseDayManageCtrl;
import com.yedam.hairshop.hairshop.employeeCloseDayManageUCtrl;
import com.yedam.hairshop.hairshop.hairshopJoinCtrl;
import com.yedam.hairshop.hairshop.hairshopMainCtrl;
import com.yedam.hairshop.hairshop.hairshopNoticeCtrl;
import com.yedam.hairshop.hairshop.hairshopNoticeViewCtrl;
import com.yedam.hairshop.hairshop.hairshopNoticeWriteCtrl;
import com.yedam.hairshop.hairshop.hairshopProcedureFinishCtrl;
import com.yedam.hairshop.hairshop.hairshopProcedureFinishListCtrl;
import com.yedam.hairshop.hairshop.hairshopProcedureFinishSDCtrl;
import com.yedam.hairshop.hairshop.salesCtrl;
import com.yedam.hairshop.hairshop.salesStatisticsCtrl;
import com.yedam.hairshop.harishop.MyHairshopInfoUpdate;
import com.yedam.hairshop.members.ChangeDesignerCtrl;
import com.yedam.hairshop.members.DesignerBookmarkCtrl;
import com.yedam.hairshop.members.DesignerSelectCtrl;
import com.yedam.hairshop.members.DesignerSelectResultCtrl;
import com.yedam.hairshop.members.DetailedReservationCtrl;
import com.yedam.hairshop.members.GpsHairshopSearchCtrl;
import com.yedam.hairshop.members.HairBookmarkCtrl;
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
import com.yedam.hairshop.members.MembersHairIntroCtrl;
import com.yedam.hairshop.members.MembersHairShopInfoCtrl;
import com.yedam.hairshop.members.MembersHairShopIntroCtrl;
import com.yedam.hairshop.members.MembersHsCouponICtrl;
import com.yedam.hairshop.members.MembersHsDesignerIntroCtrl;
import com.yedam.hairshop.members.MembersHsEventIntroCtrl;
import com.yedam.hairshop.members.MembersHsReviewIntrolCtrl;
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
import com.yedam.hairshop.members.RegionHairRankCtrl;
import com.yedam.hairshop.members.RegionHairshopRankCtrl;
import com.yedam.hairshop.members.SearchDetailCtrl;
import com.yedam.hairshop.members.SearchRealtimCtrl;
import com.yedam.hairshop.members.membersQnaReGCtrl;
import com.yedam.hairshop.members.membersQnaVCtrl;

/*
@WebServlet(name = "front", 
			urlPatterns = "*.do", 
			initParams = {
					@WebInitParam(name = "charset", value="UTF-8")
			})
*/

@MultipartConfig(location = "c:/hairapp", maxRequestSize = 1024 * 1024 * 10)
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String charset = null;
	HashMap<String, Controller> list = null;

	@Override
	public void init(ServletConfig config) throws ServletException {
		charset = config.getInitParameter("charset");
		list = new HashMap<String, Controller>();

		// 상민
		list.put("/members/membersMain.do", new MembersMainCtrl());
		list.put("/members/membersMainResult.do", new MembersMainResultCtrl());

		list.put("/members/hairshopSelect.do", new HairShopSelectCtrl());
		list.put("/members/hairshopSelectResult.do", new HairshopSelectResultCtrl());

		list.put("/members/hairSelect.do", new HairSelectCtrl());
		list.put("/members/hairSelectResult.do", new HairSelectResultCtrl());

		list.put("/members/designerSelect.do", new DesignerSelectCtrl());
		list.put("/members/designerSelectResult.do", new DesignerSelectResultCtrl());

		list.put("/members/regionHairshopRank.do", new RegionHairshopRankCtrl()); // 우리동네 미용실 순위
		list.put("/members/regionDesignerRank.do", new RegionDesignerRankCtrl()); // 우리동네 디자이너 순위
		list.put("/members/regionHairRank.do", new RegionHairRankCtrl()); // 헤어 순위

		list.put("/members/payment.do", new PaymentCtrl());
		list.put("/members/paymentMember.do", new PaymentMemberCtrl()); // 회원결제
		list.put("/members/paymentImport.do", new PaymentImportCtrl());

		list.put("/popup/hairshopReview.do", new HairShopReviewCtrl()); // 리뷰 이동용
		list.put("/members/hairshopReviewInsert.do", new HairShopReviewInsertCtrl());
		list.put("/members/membersInsert.do", new TestController());
		list.put("/members/myRegionSetting.do", new MyRegionSettingCtrl());

		list.put("/ajax/changeDesigner.do", new ChangeDesignerCtrl());

		list.put("/ajax/hairBookmark.do", new HairBookmarkCtrl()); // 헤어 북마크
		list.put("/ajax/hairshopBookmark.do", new HairshopBookmarkCtrl()); // 헤어샵 북마크
		list.put("/ajax/designerBookmark.do", new DesignerBookmarkCtrl()); // 디자이너 북마크

		list.put("/ajax/searchRealtime.do", new SearchRealtimCtrl()); // 자동완성 검색
		list.put("/members/searchDetail.do", new SearchDetailCtrl()); // 상세검색

		list.put("/members/gpsHairshopSearch.do", new GpsHairshopSearchCtrl());

		list.put("/members/membersBookmarkHairshop.do", new MembersBookmarkHairshopCtrl());
		list.put("/members/membersBookmarkDesigner.do", new MembersBookmarkDesignerCtrl());
		list.put("/members/membersBookmarkHairstyle.do", new MembersBookmarkHairstyleCtrl());

		list.put("/members/hsHairIntro.do", new MembersHairIntroCtrl());

		list.put("/hairshop/hairNameRequest.do", new HairNameRequestCtrl()); // 헤어 시술명 중분류 등록.
		
		// 송현
		list.put("/designer/designerUpdate.do", new DesignerUpdateCtrl());
		list.put("/designer/designerInfo.do", new DesignerInfoCtrl());
		list.put("/designer/designerLogin.do", new DesignerLoginCtrl());
		// list.put("/designer/customerJoinCtrl.do", new CustomerJoinCtrl());

		list.put("/hairshop/hairshopNoticeCtrl.do", new hairshopNoticeCtrl());
		list.put("/hairshop/hairshopNoticeWriteCtrl.do", new hairshopNoticeWriteCtrl());
		list.put("/hairshop/hairshopNoticeViewCtrl.do", new hairshopNoticeViewCtrl());

		list.put("/designer/designerMyPageCtrl.do", new DesignerMyPageCtrl());
		list.put("/designer/designerMyPageUpdateCtrl.do", new DesignerMyPageUpdateCtrl());
		// list.put("/hairshop/hairshopNoticeCtrl.do", new hairshopNoticeCtrl());
		list.put("/hairshop/HairshopCouponCtrl.do", new HairshopCouponCtrl());
		list.put("/hairshop/HairshopCouponListCtrl.do", new HairshopCouponListCtrl());
		list.put("/hairshop/HairshopCouponInsertCtrl.do", new HairshopCouponInsertCtrl());

		list.put("/hairshop/hairshopProcedureFinish.do", new hairshopProcedureFinishCtrl());
		list.put("/hairshop/hairshopProcedureFinishList.do", new hairshopProcedureFinishListCtrl());

		list.put("/hairshop/hairshopProcedureFinishSD.do", new hairshopProcedureFinishSDCtrl()); //시술완료고객 디자이너로검색해서 보기
		
		list.put("/hairshop/HairshopCloseDayManage.do", new HairshopCloseDayManageCtrl()); //미용실 휴무일 설정
		list.put("/hairshop/HairshopCloseDayManageU.do", new HairshopCloseDayManageUCtrl()); //미용실 휴무일 업데이트
		list.put("/hairshop/employeeCloseDayManage.do", new employeeCloseDayManageCtrl()); //디자이너 리스트 휴무일 설정
		list.put("/hairshop/employeeCloseDayManageU.do", new employeeCloseDayManageUCtrl()); //디자이너 리스트 휴무일 설정
		

		//list.put("/hairshop/hairshopProcedureFinishSD.do", new hairshopProcedureFinishSDCtrl()); // 시술완료고객 디자이너로검색해서 보기


		// 린아
		list.put("/members/membersLogin.do", new MembersLoginCtrl()); // 로그인 페이지 이동 컨트롤러
		list.put("/members/membersLogout.do", new MembersLogoutCtrl()); // 로그아웃 페이지 이동 컨트롤러
		list.put("/members/membersLoginS.do", new MembersLoginSCtrl()); // 로그인 처리하는 컨트롤러

		list.put("/members/membersIdSearch.do", new MembersIdSearchCtrl()); // ID 찾기 페이지 이동 컨트롤러
		list.put("/members/membersIdSearchS.do", new MembersIdSearchSCtrl()); // ID 찾기 넘어가는 컨트롤러
		list.put("/members/membersPwSearch.do", new MembersPwSearchCtrl()); // PW 찾기 페이지 이동 컨트롤러
		list.put("/members/membersPwSearchS.do", new MembersPwSearchSCtrl()); // PW 찾기 넘어가는 컨트롤러
		list.put("/members/membersPwEnd.do", new MembersPwEndCtrl()); // PW 찾기 완료 페이지 이동하는 컨트롤러
		list.put("/members/membersPwEmail.do", new MembersPwEmailCtrl()); // PW EMAIL 인증 클릭 컨트롤러
		list.put("/members/membersPwModify.do", new MembersPwModifyCtrl()); // PW 수정 처리하는 컨트롤러

		list.put("/members/membersJoin.do", new MembersJoinCtrl()); // 회원가입 페이지 이동 컨트롤러
		list.put("/members/membersJoinS.do", new MembersJoinSCtrl()); // 회원가입 넘어가는 컨트롤러
		list.put("/ajax/membersJoinIdCheck.do", new MembersJoinIdCheckCtrl()); // 회원가입 ID 중복확인 컨트롤러
		list.put("/members/membersJoinEmail.do", new MembersJoinEmailCtrl()); // 회원가입 이메일 인증하는 컨트롤러
		list.put("/members/membersJoinEnd.do", new MembersJoinEndCtrl()); // 회원가입 완료 페이지 이동하는 컨트롤러

		list.put("/members/membersInfoModify.do", new MembersInfoModifyCtrl()); // 회원수정 컨트롤러
		list.put("/members/membersInfoView.do", new MembersInfoViewCtrl()); // 회원수정 정보확인 컨트롤러
		list.put("/members/membersRD.do", new MembersReservationDetailsCtrl()); // 예약내역 컨트롤러
		list.put("/members/membersDR.do", new DetailedReservationCtrl()); // 예약 상세 확인 컨트롤러
		list.put("/members/membersMypageTop.do", new MembersMyPageTopCtrl()); // 마이페이지 톱 컨트롤러
		list.put("/members/membersCoupon.do", new MembersCouponCtrl()); // 내 쿠폰 내역 확인 컨트롤러

		list.put("/members/membersDelete.do", new MembersDeleteCtrl()); // 회원 탈퇴로 이동하는 컨트롤러
		list.put("/members/membersDeleteS.do", new MembersDeleteSCtrl()); // 회원 탈퇴 처리하는 컨트롤러

		list.put("/members/hairshopInfo.do", new MembersHairShopInfoCtrl()); // 헤어샵소개로 이동하는 컨트롤러
		list.put("/members/hairshopIntro.do", new MembersHairShopIntroCtrl()); // 헤어샵 정보 뿌려주는 컨트롤러
		list.put("/members/hsDesignerIntro.do", new MembersHsDesignerIntroCtrl()); // 헤어샵안의 디자이너 소개 정보 뿌려주는 컨트롤러
		list.put("/members/hsEventIntro.do", new MembersHsEventIntroCtrl()); // 헤어샵 안의 쿠폰 보여주는 컨트롤러
		list.put("/members/hsCouponIssuance.do", new MembersHsCouponICtrl()); // 헤어샵 안의 쿠폰 발급해주는 컨트롤러
		list.put("/members/hsReviewIntro.do", new MembersHsReviewIntrolCtrl()); // 헤어샵 안의 리뷰보기 컨트롤러

		list.put("/members/membersNotice.do", new MembersNoticeCtrl()); // 공지사항 목록 컨트롤러
		list.put("/members/membersNoticeWG.do", new MembersNoticeWGCtrl()); // 공지사항 글쓰기로 이동하는 컨트롤러
		list.put("/members/membersNoticeW.do", new MembersNoticeWCtrl()); // 공지사항 글쓰기 컨트롤러
		list.put("/members/membersNoticeV.do", new MembersNoticeVCtrl()); // 공지사항 보기 컨트롤러
		list.put("/members/membersNoticeMG.do", new MembersNoticeMGCtrl()); // 공지사항 수정으로 이동하는 컨트롤러
		list.put("/members/membersNoticeM.do", new MembersNoticeMCtrl()); // 공지사항 수정 하는 컨트롤러
		list.put("/members/membersNoticeD.do", new MembersNoticeDCtrl()); // 공지사항 삭제 컨트롤러

		list.put("/members/membersQna.do", new MembersQnaCtrl()); // Qna 목록 컨트롤러
		list.put("/members/membersQnaWG.do", new MembersQnaWGCtrl()); // Qna 글쓰기로 이동하는 컨트롤러
		list.put("/members/membersQnaW.do", new MembersQnaWCtrl()); // Qna 글쓰기 컨트롤러
		list.put("/members/membersQnaV.do", new membersQnaVCtrl()); // Qna 보기 컨트롤러
		list.put("/members/membersQnaReG.do", new membersQnaReGCtrl()); // Qna 답변으로 이동 컨트롤러
		list.put("/members/membersQnaRe.do", new MembersQnaReCtrl()); // Qna 답변 처리하는 컨트롤러
		list.put("/members/membersQnaMG.do", new MembersQnaMGCtrl()); // Qna 수정으로 이동하는 컨트롤러
		list.put("/members/membersQnaM.do", new MembersQnaMCtrl()); // Qna 수정하는 컨트롤러
		list.put("/members/membersQnaD.do", new MembersQnaDCtrl()); // Qna 삭제 컨트롤러

		// 강산
		list.put("/admin/adminLogin.do", new adminLoginCtrl());// 로그인
		list.put("/admin/adminMain.do", new adminMainCtrl());//
		list.put("/admin/adminReturnToLogin.do", new adminReturnToLoginCtrl());
		list.put("/admin/adminMypage.do", new AdminMypageCtrl());//

		list.put("/hairshop/salesStatistics.do", new salesStatisticsCtrl());// 헤어샵통계
		// list.put("/hairshop/salesStatisticsResult.do", new salesStatisticsFCtrl());
		list.put("/ajax/hairshop/sales.do", new salesCtrl());

		list.put("/hairshop/salesStatisticsByDesigner.do", new SalesStatisticsByDesignerCtrl());
		list.put("/hairshop/analysisByTreat.do", new AnalysisByTreatCtrl());
		list.put("/hairshop/analysisMonthly.do", new AnalysisMonthlyCtrl());//
		list.put("/ajax/hairshop/analysisGender.do", new AnalysisGenderCtrl());
		list.put("/ajax/hairshop/analysisAge.do", new AnalysisAgeCtrl());
		list.put("/ajax/hairshop/analysisTotal.do", new AnalysisTotalCtrl());
		list.put("/ajax/hairshop/analysisTreatGender.do", new AnalysisTreatGenderCtrl());
		list.put("/ajax/hairshop/analysisTreatTable.do", new AnalysisTreatTableCtrl());
		list.put("/hairshop/analysisTreatTableGo.do", new AnalysisTreatTableGoCtrl());
		list.put("/hairshop/analysisByTreat.do", new AnalysisByTreatCtrl());//
		list.put("/ajax/hairshop/analysisGender.do", new AnalysisGenderCtrl());//
		list.put("/ajax/hairshop/analysis.do", new AnalysisCtrl());//
		list.put("/ajax/hairshop/analysisAge.do", new AnalysisAgeCtrl());//
		list.put("/ajax/hairshop/analysisTotal.do", new AnalysisTotalCtrl());//
		list.put("/ajax/hairshop/analysisTreatGender.do", new AnalysisTreatGenderCtrl());//
		list.put("/ajax/hairshop/analysisTreatTable.do", new AnalysisTreatTableCtrl());//
		list.put("/hairshop/analysisTreatTableGo.do", new AnalysisTreatTableGoCtrl());//

		
		list.put("/hairshop/analysisDesignerTotal.do", new AnalysisDesignerTotalCtrl());
		list.put("/ajax/hairshop/analysisDesignerRsvRank.do", new AnalysisDesignerRsvRankCtrl());//
		
		
		list.put("/ajax/hairshop/salesByDesigner.do", new SalesBydesignerCtrl());
		list.put("/ajax/designer/analysisSales.do", new AnalysisSalesByDsCtrl());//
		list.put("/designer/analysisSalesGo.do", new AnalysisSalesByDsGoCtrl());//
		list.put("/ajax/hairshop/chart.do", new ChartCtrl());
		
		
		list.put("/admin/adminSalesStatistics.do", new AdminSalesStatisticsCtrl());

		list.put("/admin/adminBoardManage.do", new adminBoardManageCtrl());// 보드
		list.put("/admin/adminBoardManageFind.do", new adminBoardManageFCtrl());

		list.put("/admin/adminNoticeManage.do", new AdminNoticeManageCtrl());// notice
		list.put("/admin/adminNoticeManageFind.do", new AdminNoticeManageFCtrl());
		list.put("/admin/adminNoticeView.do", new AdminNoticeViewCtrl());
		list.put("/admin/adminInsertNotice.do", new AdminNoticeInsertCtrl());
		list.put("/admin/adminNoticeInsertSubmit.do", new AdminNoticeInsertFCtrl());
		list.put("/admin/adminQnaManage.do", new AdminQnaManageCtrl());// qna
		list.put("/admin/adminQnaManageFind.do", new AdminQnaManageFCtrl());
		list.put("/admin/adminQnaAnswer.do", new AdminQnaAnswerCtrl());
		list.put("/admin/adminQnaView.do", new AdminQnaViewCtrl());
		list.put("/admin/adminBoardSetting.do", new adminBoardSettingCtrl());// setting
		list.put("/admin/adminBoardSettingFind.do", new adminBoardSettingFCtrl());

		list.put("/admin/adminDesignerManage.do", new AdminDesignerManageCtrl());// 회원관리
		list.put("/admin/adminDesignerManageFind.do", new AdminDesignerManageCFtrl());
		list.put("/admin/adminCustomerManage.do", new AdminCustomerManageCtrl());
		list.put("/admin/adminCustomerManageFind.do", new AdminCustomerManageFCtrl());
		list.put("/admin/adminHairshopManage.do", new AdminHairshopManageCtrl());
		list.put("/admin/adminHairshopManageFind.do", new AdminHairshopManageFCtrl());
		list.put("/admin/adminNewHairshop.do", new AdminNewHairshopCtrl());
		list.put("/admin/adminNewHairshopApproval.do", new AdminNewHairshopApprovalCtrl());
		list.put("/admin/sendEmail.do", new SendEmailToCustomerCtrl());

		list.put("/admin/hairshopAnalysisFind.do", new hairshopAnalysisFCtrl());// 분석
		list.put("/admin/designerAnalysisFind.do", new designerAnalysisFCtrl());
		list.put("/admin/hairshopAnalysis.do", new hairshopAnalysisCtrl());
		list.put("/ajax/admin/analysisByHairshopCount.do", new AnalysisByHairshopCount());
		list.put("/ajax/admin/analysisByNew.do", new AnalysisByNewCtrl());//

		list.put("/admin/hairAnalysisFind.do", new hairAnalysisFCtrl());
		list.put("/admin/hairAnalysis.do", new hairAnalysisCtrl());
		list.put("/admin/designerAnalysis.do", new designerAnalysisCtrl());

		list.put("/admin/adminCouponManage.do", new AdminCouponManageCtrl());// 쿠폰
		list.put("/admin/adminCouponInsert.do", new AdminCouponInsertCtrl());
		list.put("/admin/adminCouponInsertSubmit.do", new AdminCouponInsertFCtrl());
		list.put("/admin/ttCategoryRequest.do", new AdminTtCategoryRequestCtrl());//시술중분류 승인요청 조//
		list.put("/admin/tmicApproval.do", new AdminTmicApprovalCtrl());//시술중분류 승인요청 조//
		list.put("/admin/ttCategoryManage.do", new TtCategoryManageCtrl());//시술중분류 승인요청 조//
		list.put("/ajax/admin/tmicUpdate.do", new TmicUpdate());//시술중분류 승인요청 조//
		list.put("/ajax/admin/tmicDelete.do", new TmicDelete());//시술중분류 승인요청 조//
		list.put("/ajax/admin/tmicInsert.do", new TmicInsert());//시술중분류 승인요청 조//

		// 승연
		list.put("/hairshop/hairshopMain.do", new hairshopMainCtrl()); // 헤어샵 로그인 후 메인페이지
		list.put("/hairshop/hairshopDesignerLogin.do", new HairshopDesignerLoginCtrl()); // 헤어샵,디자이너 로그인페이지 -> 최종메인페이지
																							// 필요
		list.put("/hairshop/employeeList.do", new EmployeeListCtrl()); // 디자이너 직원목록
		list.put("/hairshop/employeeSimpleJoin.do", new EmployeeSimpleJoinFCtrl()); // 디자이너 간편등록
		list.put("/hairshop/retiredEmployeeList.do", new RetiredEmployeeListCtrl()); // 디자이너 퇴사명단
		list.put("/ajax/hairshopReturnToLogin.do", new HairshopReturnToLoginCtrl()); // 로그인페이지 이동처리
		list.put("/ajax/designerReturnToLogin.do", new DesReturnToLoginCtrl());
		list.put("/hairshop/employeeUpdate.do", new EmployeeUpdateFCtrl()); // 직원정보수정
		list.put("/ajax/findEmployees.do", new FindEmployeesAjCtrl()); // 직원목록 들고오기
		list.put("/hairshop/fireEmployee.do", new FireEmployeeFCtrl()); // 직원퇴사처리
		list.put("/hairshop/employeeAuth.do", new EmployeeAuthFCtrl()); // 직원 인증 처리
		list.put("/ajax/hairshopJoin.do", new hairshopJoinCtrl()); // 회원가입
		list.put("/ajax/hairshopJoinPre.do", new HairshopJoinPreFCtrl()); // 회원가입
		list.put("/ajax/hairshopJoinFin.do", new HairshopJoinFinFCtrl()); // 회원가입
		list.put("/ajax/hairshopEmailUse.do", new HairshopEmailUseAjCtrl()); // 미용실 이메일 사용여부

		list.put("/ajax/memberReservationInfo.do", new MemberReservationInfoCtrl()); // 예약상세정보확인
		list.put("/ajax/updateMdriMemo.do", new UpdateMdriMemoAjCtrl()); // 상세예약정보 메모
		list.put("/ajax/changeReservationStatus.do", new ChangeReservationStatusAjCtrl()); // 예약상태변경
		list.put("/ajax/desMemberReservationInfo.do", new DesMemberReservationInfoCtrl()); // 예약상세정보확인
		list.put("/ajax/desUpdateMdriMemo.do", new UpdateMdriMemoAjCtrl()); // 상세예약정보 메모
		list.put("/ajax/desChangeReservationStatus.do", new ChangeReservationStatusAjCtrl()); // 예약상태변경

		list.put("/hairshop/dailyReservationList.do", new DailyReservationListCtrl()); // 미용실 일간 예약자 리스트 (리소스 방식)
		list.put("/hairshop/weeklyReservationList.do", new DailyReservationListCtrl()); // 미용실 주간 예약자 리스트 (리소스 방식)
		list.put("/hairshop/monthlyReservationList.do", new MonthlyReservationListCtrl()); // 미용실 월간 예약자 리스트 (일반 캘린더 방식)

		list.put("/ajax/dailyReservationListAj.do", new DailyReservationListAjCtrl()); // 일간예약명단 가져오기 (리소스방식)
		list.put("/ajax/weeklyReservationListAj.do", new DailyReservationListAjCtrl()); // 주간예약명단 가져오기 (리소스방식)
		list.put("/ajax/monthlyReservationListAj.do", new MonthlyReservationListAjCtrl()); // 월간예약명단 가져오기 (일반캘린더 방식)

		list.put("/designer/designerMain.do", new DesignerMainCtrl()); // 디자이너 메인페이지
		list.put("/designer/desDailyReservationList.do", new DesDailyReservationListCtrl()); // 디자이너 일간예약자 리스트(일반캘린더방식)
		list.put("/designer/desWeeklyReservationList.do", new DesDailyReservationListCtrl()); // 디자이너 주간예약자 리스트(일반캘린더방식)
		list.put("/designer/desMonthlyReservationList.do", new DesDailyReservationListCtrl()); // 디자이너 월간예약자
																								// 리스트(일반캘린더방식)
		list.put("/ajax/desDailyReservationListAj.do", new DesDailyReservationListAjCtrl()); // 일간예약명단 가져오기(일반캘린더방식)-싱글톤
		list.put("/ajax/desWeeklyReservationListAj.do", new DesWeeklyReservationListAjCtrl()); // 일간(주간)예약명단
																								// 가져오기(일반캘린더방식) - 객체생성

		list.put("/ajax/designerNextCustomer.do", new DesignerNextCustomerAjCtrl()); // 디자이너용 다음 고객 찾기
		list.put("/designer/findMyCustomer.do", new FindMyCustomerCtrl()); // 디자이너용 예약자 검색 및 명단보기
		list.put("/designer/findMycustomerRe.do", new FindMyCustomerReCtrl()); // 검색페이지로 돌아가기
		list.put("/designer/findMyCustomerDetail.do", new FindMyCustomerDetailCtrl()); // 디자이너용 예약자 상세 + 매출 정보 보기

		list.put("/ajax/hairshopNextCustomer.do", new HairshopNextCustomerAjCtrl()); // 미용실용 다음 고객 찾기
		list.put("/hairshop/hsFindMyCustomer.do", new HsFindMyCustomerCtrl()); // 미용실용 예약자 검색 및 명단보기
		list.put("/hairshop/hsFindMycustomerRe.do", new HsFindMyCustomerReCtrl()); // 미용실용 검색페이지로 돌아가기
		list.put("/hairshop/hsFindMyCustomerDetail.do", new HsFindMyCustomerDetailCtrl()); // 미용실용 예약자 상세 + 매출 정보 보기

		list.put("/admin/codeList.do", new CodeListCtrl()); // 코드리스트 페이지 이동
		list.put("/ajax/primaryCodeInsert.do", new PrimaryCodeInsertAjCtrl()); // 주코드 입력
		list.put("/ajax/secondaryCodeInsert.do", new SecondaryCodeInsertAjCtrl()); // 보조코드 추가
		list.put("/ajax/codeUpdate.do", new SecondaryCodeInsertAjCtrl()); // 코드 수정
		list.put("/ajax/categoryMajorDelete.do", new CategoryMajorDeleteAjCtrl()); // 삭제

		list.put("/hairshop/hairInfoList.do", new HairInfoListCtrl()); // 헤어시술목록 페이지이동
		list.put("/hairshop/hairInfoFullList.do", new HairInfoFullListCtrl()); // 헤어시술 전체목록
		list.put("/hairshop/hairInfoListRe.do", new HairInfoListCtrlRe()); // 헤어시술목록 검색페이지로 이동
		list.put("/hairshop/hairInfoDetail.do", new HairInfoDetailCtrl()); // 헤어시술목록 상세페이지
		list.put("/designer/desHairInfoDetail.do", new HairInfoDetailCtrl()); // 헤어시술목록상세페이지 디자이너용
		list.put("/hairshop/hairInfoPicUpload.do", new HairInfoPicUploadFCtrl()); // 헤어시술목록 상세페이지에서 이미지 업로드
		list.put("/ajax/hairStatusChange.do", new HairStatusChangeAjCtrl()); // 헤어 사용미사용 상태 바꾸기
		list.put("/hairshop/hairInfoInsert.do", new HairInfoInsertCtrl()); // 헤어시술등록이동
		list.put("/hairshop/hairInfoInsertForm.do", new HairInfoInsertFormFCtrl()); // 헤어시술등록처리
		list.put("/ajax/getTmicList.do", new GetTmicListAjCtrl());// 시술중분류리스트 가져오기
		list.put("/ajax/checkSameHhiName.do", new CheckSameHhiNameAjCtrl()); // 시술명 중복체크

		list.put("/hairshop/myHairshopProfile.do", new MyHairShopProfileCtrl()); // 미용실 프로필공지사항이미지 조회페이지
		list.put("/hairshop/myHairshopProfileUpdate.do", new MyHairshopProfileUpdateFCtrl()); // 미용실 프로필공지사항이미지 수정처리
		list.put("/hairshop/myHairshopInfo.do", new MyHairshopInfoCtrl()); //미용실마이페이지
		list.put("/hairshop/myParkingChange.do", new MyParkingChangeCtrl()); //주차장 사용여부 변경
		list.put("/hairshop/myHairshopInfoUpdate.do", new MyHairshopInfoUpdate()); //미용실 정보업데이트페이지
		list.put("/hairshop/myHairshopInfoUpdateFrm.do", new MyHairshopInfoUpdateFrmFCtrl()); //미용실 정보업데이트처리
		
		list.put("/ajax/imgView.do", new ImgViewCtrl()); //클라이언트에 이미지 다운로드 시키기 (뷰) //img_name, img_path
		list.put("/ajax/hairDeslogout.do", new HairDesLogoutCtrl()); // 미용실,헤어샵 로그아웃 처리

	}

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding(charset);
		res.setContentType("text/html; charset=UTF-8");
		String uri = req.getRequestURI(); // frontWeb/memberInsert.do
		String contextPath = req.getContextPath(); // frontWeb
		String path = uri.substring(contextPath.length()); // memberInsert.do
		Controller subController = list.get(path);
//		System.out.println(path);
		if (subController == null) {
			System.out.println("잘못된 URL: " + path);
		} else {
			subController.execute(req, res);
		}
	}

}
