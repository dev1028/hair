package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersCouponDAO;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.MembersCouponVo;
import com.yedam.hairshop.model.MembersVo;

public class PaymentCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//결제할 고객정보
		MembersVo memVo = (MembersVo) request.getSession().getAttribute("login");
		if(memVo != null){
			//HairshopVo hairshopVo = (HairshopVo) request.getSession().getAttribute("selHairshopVo");
			DesignerVo designerVo = (DesignerVo) request.getSession().getAttribute("selDesignerVo");
			if(designerVo != null) {
				MembersCouponVo vo = new MembersCouponVo();
				vo.setMem_no(memVo.getMem_no());
				vo.setHs_no(designerVo.getHs_no());
				
				List<MembersCouponVo> listCoupon = MembersCouponDAO.getInstance().selectListUnusedCoupon(vo);
				request.setAttribute("listCoupon", listCoupon);
				request.getRequestDispatcher("payment.jsp").forward(request, response);
			}else {
				System.out.println("결제 창인데 디자이너가  선택되지 않음.");
			}
		}else {
			System.out.println("결제창인데 로그인이 되지 않았습니다.");
		}
	}
}
