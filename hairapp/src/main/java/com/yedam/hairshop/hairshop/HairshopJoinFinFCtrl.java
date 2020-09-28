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

		double x = Double.parseDouble( latlong[0] );//x좌표 
		double y = Double.parseDouble( latlong[1] );//y좌표 

		CRSFactory factory = new CRSFactory(); 
		CoordinateReferenceSystem srcCrs = factory.createFromName("EPSG:5179");//현재 좌표 
		CoordinateReferenceSystem dstCrs = factory.createFromName("EPSG:4326");//변경할 좌표 

		BasicCoordinateTransform transform = new BasicCoordinateTransform(srcCrs, dstCrs); 

		ProjCoordinate srcCoord = new ProjCoordinate(x, y); 
		ProjCoordinate dstCoord = new ProjCoordinate(); 

		transform.transform(srcCoord, dstCoord);//좌표변환 
		System.out.println(dstCoord.y + "," + dstCoord.x );//변환된 좌표 
		
		hVo.setHs_latlong(dstCoord.y + "," + dstCoord.x );
		
		HairshopDAO.getInstance().insert(hVo);
		
		response.sendRedirect("/hairapp/hairshop/hairshopDesignerLogin.jsp");
		//미용실회원가입 성공페이지 만들기
	}

}
