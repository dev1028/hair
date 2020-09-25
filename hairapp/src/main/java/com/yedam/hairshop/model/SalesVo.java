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
	int mdrNo;
	String dsName;
	String memName;
	String hName;
	int totalAmountRsv;
	int totalAmountDay;
	int cash;
	int kakao;
	int account;
	int card;
	int etc;
}
