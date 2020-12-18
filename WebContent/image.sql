CREATE TABLE IF NOT EXISTS image(
	priNumber INT not NULL,
	id VARCHAR(20) not NULL,
	path VARCHAR(30),
	title VARCHAR(20),
	dateMade date,
	tag VARCHAR(30),
	comment VARCHAR(100),
	PRIMARY KEY (priNumber)
);
INSERT INTO image(priNumber,id, path, title, dateMade, tag, comment) VALUES(1,'관리자','../image/1.jpg','여름과 가을 사이',NOW(),'노을 햇빛','한적한 오후 열심히 밭일을 마치고 땀을 닦고 있는데 구수한 밥짓는 냄새가 정 있는 목소리로 저녁 먹으라고 하네요.');
INSERT INTO image(priNumber, id, path, title, dateMade, tag, comment) VALUES(2,'관리자','../image/2.jpg','봇대',NOW(),'풀 하늘',' 저 멀리서 반찍이는 무언가를 팢아 풀들을 헤치며 힘겹게 걸어들어가자 불빛이꺼진 가로등이 하나 있었습니다.');
INSERT INTO image(priNumber, id, path, title, dateMade, tag, comment) VALUES(3,'관리자','../image/3.jpg','햇빛이 나를 바라보다',NOW(),'햇빛 풀 하늘','친구와 풀밭아래에서 도란도란 이야기를 나누는데 햇볕이 너무 뜨거워 덥지만 친구와의 이야기가 너무 신나서 멈출 수 없었던 시간을 사진으로 담아 보았습니다.');
INSERT INTO image(priNumber, id, path, title, dateMade, tag, comment) VALUES(4,'관리자','../image/4.jpg','꽃 그리고 하얀 집',NOW(),'풀 집 꽃','예쁜 꽃구경을 와서 꽃과 너무 잘 어울리는 예쁜 집이 마음에 들어 가까이 다가가 둘러보았는데 화장실이였네요.');
INSERT INTO image(priNumber, id, path, title, dateMade, tag, comment) VALUES(5,'관리자','../image/5.jpg','곧지 않은 길',NOW(),'꽃 길','예쁜 꽃들이 너무나도 많아 쉴틈없이 구경하다 앞을 보자 이제 마지막이라고 이야기 하는 것 처럼 나타나는 그림같은 원두막.');
INSERT INTO image(priNumber, id, path, title, dateMade, tag, comment) VALUES(6,'관리자','../image/6.jpg','바다',NOW(),'바다 햇빛','바다가 바로 앞에 있는데 철조망이 쳐저 있어 제대로 바다를 볼 수 없어 아쉬운 마음을 사진에 담아 보았습니다.');
INSERT INTO image(priNumber, id, path, title, dateMade, tag, comment) VALUES(7,'관리자','../image/7.jpg','풀 구름 하늘',NOW(),'풀 구름 하늘','귀뚜라미가 울고 잔잔한 바람이 살랑살랑 불어올 때 귀뚜라미를 잡으려다 지쳐 풀에 누워 파랗고 맑은 하늘을 구경하던 때를 사진으로 담아보았습니다 .');
INSERT INTO image(priNumber, id, path, title, dateMade, tag, comment) VALUES(8,'관리자','../image/8.jpg','햇빛이 가득 담긴 풀장',NOW(),'풀장 햇빛','연인과 함께 돗자리를 깔고 이어폰을 하나씩 나눠끼고 노을지는 하늘을 바라보며 노래를 듣던 순간을 사진에 담아보았습니다.');
INSERT INTO image(priNumber, id, path, title, dateMade, tag, comment) VALUES(9,'관리자','../image/9.jpg','불빛',NOW(),'불빛 풀','주말 오후 점심식사를 마치고 자판기 커피하나 뽑아 담장에 자라난넝쿨을 보며 여유롭게 커피 한잔 하자 전구가 반짝하고 불이 들어온 순간.');
INSERT INTO image(priNumber, id, path, title, dateMade, tag, comment) VALUES(10,'관리자','../image/10.jpg','의자',NOW(),'나무 풀','나지막한 오후 한적하게 흘러가는 강물 앞에 있는 조그만 의자에 앉아 따뜻해진 아이스 아메리카노를 마시면서 책을 읽을 것 같은 순간을 사진으로 담았습니다.');
INSERT INTO image(priNumber, id, path, title, dateMade, tag, comment) VALUES(11,'관리자','../image/11.jpg','바람에 흩날린 구름',NOW(),'구름','일을 마치고 조금 일찍 나온 퇴근길의 예쁜 구름들과 저 멀리서 조금씩 노을지는 하늘이 마치 어릴적 운동회가 생각납니다.');


delete from image where priNumber=12;
delete from image where path = '../image/null';
delete from image;	--테이블에 잇는 모든 필드 지우기
drop table image;		--테이블 자체를 지우기
select * from image;	--테이블 조회