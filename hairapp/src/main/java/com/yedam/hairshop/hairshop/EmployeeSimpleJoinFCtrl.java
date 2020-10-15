package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.common.SandEmail;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.EmailVo;


public class EmployeeSimpleJoinFCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DesignerVo dVo = new DesignerVo();
		try {
			BeanUtils.copyProperties(dVo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		String hs_no = (String) request.getSession().getAttribute("hsno");
		dVo.setHs_no(hs_no);
		
		DesignerVo deseExVo = new DesignerVo();
		deseExVo = DesignerDAO.getInstance().selectOneEmail(dVo);
		int r1 = 0;
		String alertSay;
		if(deseExVo == null) {
			r1 = DesignerDAO.getInstance().simpleInsert(dVo);
		} else {
			String acc = deseExVo.getDesigner_access_status();
			if(Integer.parseInt(acc) == 1) {
				if(deseExVo.getHs_no() == null) {
					//재가입알리기
					int r2 = DesignerDAO.getInstance().simpleReJoin(dVo);
					if(r2 == 0) {
						alertSay = "alert('직원등록에 실패하였습니다. 반복시 관리자에게 문의해주세요.');";
					} else {
						alertSay = "alert('가입한 이력이 있는 디자이너입니다. 인증없이 바로 로그인 해주세요.');";
					}
				} else {
					//이미 다른미용실에서 일하고 있음 // 아무 처리하지않고 되돌아 가기
					alertSay = "alert('직원등록에 실패하였습니다. 사용 중인 이메일 입니다.');";
				}
			} else {
				//아직 인증절차를 하지않은 회원
				alertSay = "alert('직원등록에 실패하였습니다. 인증절차를 마치지 않은 이메일입니다.');";
			}
			
			response.getWriter().append("<script>")
			.append(alertSay)
			.append("location.href='employeeList.do';")
			.append("</script>");
		}

		if (r1 == 0) {
			response.getWriter().append("<script>")
								.append("alert('직원등록에 실패하였습니다. 반복시 관리자에게 문의해주세요.');")
								.append("location.href='employeeList.do';")
								.append("</script>");
		} else {
			Thread task = new Thread (new Runnable() {
				public void run() {
					SandEmail se = new SandEmail();
					EmailVo em = new EmailVo();
					em.setReceiverMail(dVo.getDesigner_email());
					em.setReceiverName(dVo.getDesigner_name());
					em.setTitle("우동디자이너 인증요청");
					em.setContentType("text/html; charset=UTF-8");
					String contents = "<h3>디자이너 인증요청</h3>"
							+ "<span>임시비밀번호: <strong>"+dVo.getDesigner_pw()+"</strong></span><br>"
							+ "<a href='http://192.168.0.104/hairapp/ajax/employeeAuth.do?designer_email="+dVo.getDesigner_email()+"'>인증완료</a>";
						//나중에 이메일 인증 ip주소는 웹서버껄로 바꿔야함
					em.setContents(contents);
					se.sand(em);
				}
			});
			
			task.start();
			response.getWriter().append("<script>")
			.append("alert('직원등록에 성공하였습니다. 디자이너는 이메일 인증이 완료되어야 로그인이 가능합니다. 인증메일이 도착하지 않았다면 관리자에게 문의하세요.');")
			.append("location.href='employeeList.do';")
			.append("</script>");
		}
	}
	
	
	

}
