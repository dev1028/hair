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
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.HairshopVo;

public class MyHairshopInfoUpdateFrmFCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HairshopVo hVo = new HairshopVo();
		String hsNo = (String) request.getSession().getAttribute("hsno");
		try {
			BeanUtils.copyProperties(hVo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		hVo.setHs_no(hsNo);
		
		String xy = hVo.getHs_latlong();
		String[] latlong = xy.split(",");

		double x = Double.parseDouble( latlong[0] );//x좌표 
		double y = Double.parseDouble( latlong[1] );//y좌표 

		CRSFactory factory = new CRSFactory(); 
		CoordinateReferenceSystem srcCrs = factory.createFromName("EPSG:5179");//현재 좌표 
		CoordinateReferenceSystem dstCrs = factory.createFromName("EPSG:4326");//변경할 좌표 

		BasicCoordinateTransform transform = new BasicCoordinateTransform(srcCrs, dstCrs); 

		ProjCoordinate srcCoord = new ProjCoordinate(x, y); 
		ProjCoordinate dstCoord = new ProjCoordinate(); 

		transform.transform(srcCoord, dstCoord);//좌표변환 
		hVo.setHs_latlong(dstCoord.y + "," + dstCoord.x );

		int r = HairshopDAO.getInstance().updateHairshop(hVo);
		
		if (r == 1) {
			HairshopVo loginVo = (HairshopVo) request.getSession().getAttribute("login");
			loginVo.setHs_tel(hVo.getHs_tel());
			loginVo.setHs_fulladdr(hVo.getHs_fulladdr());
			loginVo.setHs_cityaddr(hVo.getHs_cityaddr());
			loginVo.setHs_townaddr(hVo.getHs_townaddr());
			loginVo.setHs_streetaddr(hVo.getHs_streetaddr());
			loginVo.setHs_latlong(hVo.getHs_latlong());
			loginVo.setHs_starttime(hVo.getHs_starttime());
			loginVo.setHs_endtime(hVo.getHs_endtime());
			request.getSession().setAttribute("login", loginVo);
			
			response.getWriter().append("<script>").append("alert('수정에 성공하였습니다.');")
					.append("location.href='" + request.getContextPath() + "/hairshop/myHairshopInfo.do';")
					.append("</script>");
		} else {
			response.getWriter().append("<script>").append("alert('수정에 실패하였습니다.');")
					.append("location.href='" + request.getContextPath() + "/hairshop/myHairshopInfo.do';")
					.append("</script>");
		}
	}

}
