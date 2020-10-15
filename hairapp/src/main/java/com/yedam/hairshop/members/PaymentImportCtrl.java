package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.PaymentDAO;
import com.yedam.hairshop.model.PaymentVo;

public class PaymentImportCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PaymentImportCtrl");
		String suc = request.getParameter("suc");
		
	
//		String imp_uid = request.getParameter("imp_uid");
//		String merchant_uid = request.getParameter("merchant_uid");
//		String paid_amount = request.getParameter("paid_amount");
//		String apply_num = request.getParameter("apply_num");
//		 
//		System.out.println(imp_uid);
//		System.out.println(merchant_uid);
//		System.out.println(paid_amount);
//		System.out.println(apply_num);
		
		PaymentVo payVo = (PaymentVo) request.getSession().getAttribute("payVo");
		if(suc.equals("suc")) {
			PaymentDAO.getInstance().onlinePayi1(payVo);
			System.out.println("결제 완료 프로시저 실행");
			
//			response.sendRedirect("paymentS.do");
		}else {
			int r = PaymentDAO.getInstance().onlinePayFailed(payVo);
			System.out.println(r + "건 삭제됨");
		}
		
		//request.getRequestDispatcher("paymentS.do").forward(request, response);
		
//		if(suc.equals("suc"))
//		{
//			String mdrNo =  (String) request.getSession().getAttribute("mdrNo");
//			if(mdrNo != null) {
//				PaymentVo vo = new PaymentVo();
//				vo.setMdr_no(String.valueOf(mdrNo));
//				int r = PaymentDAO.getInstance().onlinePaySuc(vo);
//				System.out.println(r + "건 예약처리됨");
//			}else {
//				System.out.println("예약 번호를 확인할 수 없음.");
//			}
//		}else if(suc.equals("failed")) {
//			String mdrNo =  (String) request.getSession().getAttribute("mdrNo");
//			if(mdrNo != null) {
//				PaymentVo vo = new PaymentVo();
//				vo.setMdr_no(String.valueOf(mdrNo));
//				int r = PaymentDAO.getInstance().onlinePayFailed(vo);
//				System.out.println(r + "건 삭제됨");
//			}else {
//				System.out.println("예약 번호를 확인할 수 없음.");
//			}
//		}
	}

}
