># AJ2020_WebProject
># 후원사이트 프로젝트

>## doc
>doc폴더는 프로젝트 진행하면서 나온 문서들 저장

>## src
>src폴더는 .jsp, .java등등 이클립스 프로젝트 src에 들어가는것과 동일 

>## DB
>DB폴더는 mySQL 테이블들을 저장
>스키마 이름은 teamcoffeeDB이고 테이블은 이름 뒤에 _tb를 붙임
>>### userdata_tb
>>user_id char(20) not null : 유저 아이디를 저장

>>user_password char(20) not null : 유저 비밀번호를 저장

>>user_money int null : 기부에 필요한 재화를 저장

>>user_isAdmin tinyint null : 관리자 권한인지 판별. 0이면 일반 사용자, 1이면 관리자