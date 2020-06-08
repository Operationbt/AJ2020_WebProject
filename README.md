># AJ2020_WebProject
># 후원사이트 프로젝트

#깃연동을 새로 했더니 안고친거까지 전부 수정된상태로 올라가서 실제로는 뭐뭐 수정했는지 모르실거같아요...
dao에서 ProjectDataTableDAO, dto에서 ProjectDataBean, action에서 ListProjectAction.java이랑AddProjectAction, DonateAction 이정도인거같고
jsp에서는 AddProjectView.jsp,category.jsp,confirmProject.jsp, donationList.jsp, mainPage.jsp, projectDetail.jsp
이정도 고친거같아요


>## 빌드 도움말
> 이클립스 프로젝트를 만들고 빌드 path에서 라이브러리로 mysql-connector-java-8.0.20.jar를 추가해줘야함

> 원활한 실행 테스트를 하려면 /DB의 최신 테이블을 자신의 mySQL에 import시켜야 할 수도 있음

> /jdbc/ConnectionProvider.java의 USER, PASS값을 자신의 mySQL에 맞춰 설정해야함. DB_SCHEMAS는 teamcoffeedb

> 

>## doc
>doc폴더는 프로젝트 진행하면서 나온 문서들 저장

>## WebContent
>WebContent폴더는 이클립스 Dynamic web project 생성시 jsp 소스들이 저장된다.

>## src
>src폴더는 이클립스 Dynamic web project 생성시 DAO, DTO, 자바빈즈 등의 소스들이 저장된다.

>## DB
>DB폴더는 mySQL 테이블들을 저장

>스키마 이름은 teamcoffeeDB이고 테이블은 이름 뒤에 _tb를 붙임
>>### userdata_tb
>>user_id char(20) not null : 유저 아이디를 저장

>>user_password char(20) not null : 유저 비밀번호를 저장

>>user_money int 0 : 기부에 필요한 재화를 저장

>>user_scheduledMoney int null : user_money로 넣기 전에 보관되는 재화

>>user_isAdmin tinyint 0 : 관리자 권한인지 판별. 0이면 일반 사용자, 1이면 관리자

>>user_name varchar(45) null : 유저 이름

>>user_email varchar(45) null : 유저 이메일

>>user_phone varchar(45) null : 유저 전화번호

>>user_date DATE null : 회원가입 날짜
