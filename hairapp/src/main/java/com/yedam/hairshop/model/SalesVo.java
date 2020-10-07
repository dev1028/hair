package com.yedam.hairshop.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SalesVo {
	String mdrNo;
	String mdrDate;
	String dsName;
	String dsNo;
	String memName;
	String hName;
	String totalAmountRsv;
	String totalAmountDay;
	String cash;
	String kakao;
	String account;
	String card;
	String etc;
}
