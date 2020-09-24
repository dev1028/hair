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
	String code;
	int sum;
	int cash;
	int kakao;
	int account;
	int card;
	int etc;
}
