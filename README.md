# 우리동네 헤어샵 UDONG project
![UDONG](https://user-images.githubusercontent.com/64175774/114571968-09f38c80-9cb2-11eb-8faf-23efa7300cb6.png)

## 개발동기
고객이 헤어샵을 예약하는 사이트에서는 미용실의 전체적인 관리를 도와주는 시스템이 마련되어 있지 않아서 미용실에서는 별도의 관리시스템을 사용해야 했었다. 예약과 관리 두가지를 별도의 시스템으로 관리해야 하므로 미용실의 운영이 매끄럽지 않고 유연성이 떨어진다.
그래서 두 시스템을 연동시켜서 운영하면 미용실과 미용실을 이용하는 회원이 서로 상생하
는 방향으로 이용할 수 있어서 효율적일 것 같기에 개발을 시작하게 되었다.

## 업무분장
 * 김강산<br>
어드민 사이트의 전체적인 UI, 레이아웃 관리
ADMIN - 메인, 로그인, Q&A 게시물 관리, members 통계, 게시판 설정, 쿠폰 관리, 회원 관리(헤어샵, 디자이너, 일반회원), 시술 대분류 중분류 관리, 미용실 승인, 시술중분류 승인 페이지 구현
헤어샵 관리자 - 미용실별 통계(매출별, 시술별, 예약별), 직원별 통계(매출별, 시술별, 예약별), 직원별 통계, 디자이너 개인 매출목록  페이지 구현

* 김린아<br>
헤어샵 예약 사이트의 전체적인 UI, 레이아웃 관리
헤어샵 인트로 - 헤어샵 소개와 위치, 디자이너 소개, 쿠폰 발급 , 후기, 결제완료 페이지 구현
일반 회원 - 메인, 로그인, 회원가입, ID/PW 찾기,  마이페이지, 회원정보수정, 회원탈퇴, 예약내역확인, Q&A, 공지사항 페이지 구현

 * 김승연<br>
헤어샵 관리자 & 디자이너 관리 사이트의 전체적인 UI, 레이아웃 관리
디자이너 - 메인, 예약현황(일,주,월), 다음 예약자 정보, 예약자 조회, 헤어 시술 정보 조회, 헤어 시술 정보 검색 페이지 구현
헤어샵 관리자 - 메인, 회원가입, 예약현황(일,주,월), 직원현황, 로그인, 직원퇴사처리, 회원예약 상세정보, 헤어 시술 정보 등록, 헤어 시술 정보 조회, 미용실 공지사항과 소개 수정, 미용실 상세정보, 미용실 상세정보 수정, 다음 예약자 정보 조회, 예약자 조회, TTS, 공통코드 관리 페이지 구현
클라우드 환경 구축(AWS EC2, ORACLE ATP)

 * 이상민<br>
헤어샵 예약 검색, 헤어 선택, 디자이너 선택, 결제 페이지 구현
메인, 우리동네 설정, 우리동네 미용실 모아보기, 지역별 순위(미용실, 디자이너, 헤어), 북마크(미용실, 디자이너, 헤어) 페이지 구현 
시술 통계, 시술 중분류 신청 페이지 구현

 * 이송현<br>
디자이너 - 로그인, 디자이너 정보 수정, 디자이너 시술완료 고객페이지, 미용실 쿠폰 리스트, 쿠폰 등록, 마이페이지
헤어샵 관리자 - 미용실 휴무일 설정, 직원 휴무일 설정, Q&A, 공지사항 페이지 구현
<br>

## 구축환경
![image](https://user-images.githubusercontent.com/64175774/114572854-d5cc9b80-9cb2-11eb-8325-b231a14fa0e5.png)
<br>
<br>
## 개발구성도
![image](https://user-images.githubusercontent.com/64175774/114573032-fbf23b80-9cb2-11eb-8ab0-6c7273703fd7.png)
<br>
<br>
## 개발기대효과
![image](https://user-images.githubusercontent.com/64175774/114573192-20e6ae80-9cb3-11eb-8b62-fcdf4fd59af1.png)






