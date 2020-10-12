//김승연
package com.yedam.hairshop.common;

public class ChangeUtil {

	public static String changeDayOffNumToStr(String dayoff) { // 숫자로 된 휴무일 변환
		if(dayoff == null) {
			return null;
		}
		String[] dayoffArr = dayoff.split(",");
		String result = "";
		if (dayoffArr.length > 1) {
			for (int i = 0; i < dayoffArr.length - 1; i++) {
				result += (switchDayToStr(dayoffArr[i]) + ",");
			}
			result += switchDayToStr(dayoffArr[dayoffArr.length - 1]);
		} else if (dayoffArr.length == 1) {
			result = switchDayToStr(dayoffArr[dayoffArr.length - 1]);
		}

		return result;
	}

	public static String changeDayOffStrToNum(String dayoff) { // 문자로 된 숫자로 변환
		if(dayoff == null) {
			return null;
		}
		String[] dayoffArr = dayoff.split(",");
		String result = "";
		if (dayoffArr.length > 1) {
			for (int i = 0; i < dayoffArr.length - 1; i++) {
				result += (switchDayToNum(dayoffArr[i]) + ",");
			}
			result += switchDayToNum(dayoffArr[dayoffArr.length - 1]);
		} else if (dayoffArr.length == 1) {
			result = switchDayToNum(dayoffArr[dayoffArr.length - 1]);
		}

		return result;
	}

	private static String switchDayToStr(String str) {
		String result = null;
		switch (str.trim()) {
		case "0":
			result = "일";
			break;
		case "1":
			result = "월";
			break;
		case "2":
			result = "화";
			break;
		case "3":
			result = "수";
			break;
		case "4":
			result = "목";
			break;
		case "5":
			result = "금";
			break;
		case "6":
			result = "토";
			break;
		}
		return result;
	}

	private static String switchDayToNum(String num) {
		String result = null;
		num = num.trim();
		if (num.equals("일") || num.equals("일요일")) {
			result = "0";
		} else if (num.equals("월") || num.equals("월요일")) {
			result = "1";
		} else if (num.equals("화") || num.equals("화요일")) {
			result = "2";
		} else if (num.equals("수") || num.equals("수요일")) {
			result = "3";
		} else if (num.equals("목") || num.equals("목요일")) {
			result = "4";
		} else if (num.equals("금") || num.equals("금요일")) {
			result = "5";
		} else if (num.equals("토") || num.equals("토요일")) {
			result = "6";
		}

		return result;
	}

}
