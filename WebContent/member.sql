CREATE TABLE IF NOT EXISTS Artmember(
	id VARCHAR(20) NOT NULL,
	passwd VARCHAR(20),
	name VARCHAR(30),
	PRIMARY KEY (id)
);

INSERT INTO Artmember(id, passwd, name) VALUES('abcd','1234','관리자');

delete from Artmember;
select * from Artmember;
select id, passwd, name from Artmember;