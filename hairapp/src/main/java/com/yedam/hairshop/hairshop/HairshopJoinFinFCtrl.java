package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.locationtech.proj4j.BasicCoordinateTransform;
import org.locationtech.proj4j.CRSFactory;
import org.locationtech.proj4j.CoordinateReferenceSystem;
import org.locationtech.proj4j.ProjCoordinate;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.common.SandEmail;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.EmailVo;
import com.yedam.hairshop.model.HairshopVo;

public class HairshopJoinFinFCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HairshopVo hVo = new HairshopVo();
		try {
			BeanUtils.copyProperties(hVo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		String xy = hVo.getHs_latlong();
		String[] latlong = xy.split(",");

		double x = Double.parseDouble(latlong[0]);// x좌표
		double y = Double.parseDouble(latlong[1]);// y좌표

		CRSFactory factory = new CRSFactory();
		CoordinateReferenceSystem srcCrs = factory.createFromName("EPSG:5179");// 현재 좌표
		CoordinateReferenceSystem dstCrs = factory.createFromName("EPSG:4326");// 변경할 좌표

		BasicCoordinateTransform transform = new BasicCoordinateTransform(srcCrs, dstCrs);

		ProjCoordinate srcCoord = new ProjCoordinate(x, y);
		ProjCoordinate dstCoord = new ProjCoordinate();

		transform.transform(srcCoord, dstCoord);// 좌표변환
		System.out.println(dstCoord.y + "," + dstCoord.x);// 변환된 좌표

		hVo.setHs_latlong(dstCoord.y + "," + dstCoord.x);

		hVo.setHs_approval("-1");
		int r1 = HairshopDAO.getInstance().insert(hVo);
		int r2 = -1;
		if (r1 == 0) {
			response.getWriter().append("<script>").append("alert('가입에 실패하였습니다.');")
					.append("location.href='" + request.getContextPath() + "/ajax/hairshopReturnToLogin.do';")
					.append("</script>");

		} else {
			String oDS = hVo.getCheckOwnerDesSame();
			if(oDS.equals("Y")) { //대표자도 디자이너로 등록
				//if(hVo.getCheckOwnerDesEmailSame().equals("Y")) {
						HairshopVo h1Vo = new HairshopVo();

						h1Vo = HairshopDAO.getInstance().loginSelectOne(hVo);
						DesignerVo dVo = new DesignerVo();
						dVo.setDesigner_name(hVo.getHs_owner());
						dVo.setPosition(hVo.getPosition());
						dVo.setDesigner_email(hVo.getDesigner_email());
						dVo.setDesigner_dayoff(hVo.getHs_dayoff());
						dVo.setDesigner_phone(hVo.getDesigner_phone());
						dVo.setDesigner_pw(hVo.getHs_pw());
						dVo.setWork_start_time(hVo.getHs_starttime());
						dVo.setWork_end_time(hVo.getHs_endtime());
						dVo.setHs_no(h1Vo.getHs_no());
						
					if(hVo.getCheckOwnerDesEmailExist().equals("N")) {
						//insert
						r2 = DesignerDAO.getInstance().insertAll(dVo);
					} else {
						//update
						r2 = DesignerDAO.getInstance().updateAll(dVo);
					}
				//} else {
					
				//}
				
			} else {
				//대표자는 디자이너 등록안함
			}
			
			if(r2== -1) {
				Thread task = new Thread(new Runnable() {
					public void run() {
						SandEmail se = new SandEmail();
						EmailVo em = new EmailVo();
						em.setReceiverMail(hVo.getHs_email());
						em.setReceiverName(hVo.getHs_name());
						em.setTitle("우동디자이너 인증요청");
						em.setContentType("text/html; charset=UTF-8");
						String contents = "<h3>디자이너 인증요청</h3>" + "<span><strong>" + hVo.getHs_owner()
								+ "</strong>님 회원가입을 축하합니다.</span><br>"
								+ "<a href='http://192.168.0.104/hairapp/ajax/hairshopEmailAuth.do?hs_email="+ hVo.getHs_email() + "'>인증완료</a>";
						// 나중에 이메일 인증 ip주소는 웹서버껄로 바꿔야함
						em.setContents(contents);
						se.sand(em);
					}

				});
				
				task.start();
				response.sendRedirect("/hairapp/hairshop/hairshopJoinSuccess.jsp");
			} else if(r2 == 0) {
				Thread task = new Thread(new Runnable() {
					public void run() {
						SandEmail se = new SandEmail();
						EmailVo em = new EmailVo();
						em.setReceiverMail(hVo.getHs_email());
						em.setReceiverName(hVo.getHs_name());
						em.setTitle("우동디자이너 인증요청");
						em.setContentType("text/html; charset=UTF-8");
						String contents = "<h3>미용실 인증요청</h3>" + "<span><strong>" + hVo.getHs_owner()
								+ "</strong>님 회원가입을 축하합니다.</span><br>"
								+ "</strong>본인의 디자이너 등록을 실패했습니다. 인증완료 후 미용실ERP에서 다시 등록해 주세요.</span><br>"
								+ "<a href='http://192.168.0.104/hairapp/ajax/hairshopEmailAuth.do?hs_email="+ hVo.getHs_email() + "'>인증완료</a>";
						// 나중에 이메일 인증 ip주소는 웹서버껄로 바꿔야함
						em.setContents(contents);
						se.sand(em);
					}

				});
				
				task.start();
				response.sendRedirect("/hairapp/hairshop/hairshopJoinSuccess.jsp");
			} else {
				if(hVo.getHs_email().equals(hVo.getDesigner_email())) {
					
					Thread task = new Thread(new Runnable() {
						public void run() {
							SandEmail se = new SandEmail();
							EmailVo em = new EmailVo();
							em.setReceiverMail(hVo.getHs_email());
							em.setReceiverName(hVo.getHs_name());
							em.setTitle("우동디자이너 인증요청");
							em.setContentType("text/html; charset=UTF-8");
							String contents = "<h3>미용실, 디자이너  인증요청</h3>" + "<span><strong>" + hVo.getHs_owner()
									+ "</strong>님 회원가입을 축하합니다.</span><br>"
									+ "<a href='http://192.168.0.104/hairapp/ajax/hairshopEmailAuth.do?hs_email="+ hVo.getHs_email() + "'>미용실 인증완료</a>"
											+ "<br><a href='http://192.168.0.104/hairapp/ajax/employeeAuth.do?designer_email="+ hVo.getDesigner_email() + "'>디자이너 인증완료</a>";
							// 나중에 이메일 인증 ip주소는 웹서버껄로 바꿔야함
							em.setContents(contents);
							se.sand(em);
						}

					});
					
					task.start();
					response.sendRedirect("/hairapp/hairshop/hairshopJoinSuccess.jsp");
					
				} else {
					
					Thread task = new Thread(new Runnable() {
						public void run() {
							SandEmail se = new SandEmail();
							EmailVo em = new EmailVo();
							em.setReceiverMail(hVo.getHs_email());
							em.setReceiverName(hVo.getHs_name());
							em.setTitle("우동디자이너 미용실 인증요청");
							em.setContentType("text/html; charset=UTF-8");
							String contents = "<h3>미용실 인증요청</h3>" + "<span><strong>" + hVo.getHs_owner()
									+ "</strong>님 회원가입을 축하합니다.</span><br>"
									+ "<a href='http://192.168.0.104/hairapp/ajax/hairshopEmailAuth.do?hs_email="+ hVo.getHs_email() + "'>인증완료</a>";
								
							// 나중에 이메일 인증 ip주소는 웹서버껄로 바꿔야함
							em.setContents(contents);
							se.sand(em);
						
							SandEmail se2 = new SandEmail();
							EmailVo em2 = new EmailVo();
							em2.setReceiverMail(hVo.getDesigner_email());
							em2.setReceiverName(hVo.getHs_name());
							em2.setTitle("우동디자이너 디자이너 인증요청");
							em2.setContentType("text/html; charset=UTF-8");
							String contents2 = "<h3>디자이너 인증요청</h3>" + "<span><strong>" + hVo.getHs_owner()
									+ "</strong>님 회원가입을 축하합니다.</span><br>"
											+ "<a href='http://192.168.0.104/hairapp/ajax/employeeAuth.do?designer_email="+ hVo.getDesigner_email() + "'>인증완료</a>";
							// 나중에 이메일 인증 ip주소는 웹서버껄로 바꿔야함
							em2.setContents(contents2);
							se2.sand(em2);
						}

					});
					
					task.start();
					response.sendRedirect("/hairapp/hairshop/hairshopJoinSuccess.jsp");

				}
			
			}
			

		}

		// 미용실회원가입 성공페이지 만들기
	}
}
