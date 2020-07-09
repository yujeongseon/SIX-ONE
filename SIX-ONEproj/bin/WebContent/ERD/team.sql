<<<<<<< HEAD

/* Drop Tables */

DROP TABLE board_like CASCADE CONSTRAINTS;
DROP TABLE comments CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE play_exe CASCADE CONSTRAINTS;
DROP TABLE rou_exe CASCADE CONSTRAINTS;
DROP TABLE exercise CASCADE CONSTRAINTS;
DROP TABLE note CASCADE CONSTRAINTS;
DROP TABLE sub_calendar CASCADE CONSTRAINTS;
DROP TABLE subscribe CASCADE CONSTRAINTS;
DROP TABLE routine CASCADE CONSTRAINTS;
DROP TABLE timeilne_like CASCADE CONSTRAINTS;
DROP TABLE timeline_comments CASCADE CONSTRAINTS;
DROP TABLE timeline CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE protein CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_BOARD;
DROP SEQUENCE SEQ_EXERCISE;
DROP SEQUENCE SEQ_NOTE;
DROP SEQUENCE SEQ_PROTEIN;
DROP SEQUENCE SEQ_ROUTINE;
DROP SEQUENCE SEQ_TIMELINE;
DROP SEQUENCE SEQ_TIMELINE_COMMENTS;




/* Create Sequences */

CREATE SEQUENCE SEQ_BOARD
nocache
nocycle
;
CREATE SEQUENCE SEQ_EXERCISE
nocache
nocycle;
CREATE SEQUENCE SEQ_NOTE
nocache
nocycle;
CREATE SEQUENCE SEQ_PROTEIN
nocache
nocycle;
CREATE SEQUENCE SEQ_ROUTINE
nocache
nocycle;
CREATE SEQUENCE SEQ_TIMELINE
nocache
nocycle;
CREATE SEQUENCE SEQ_TIMELINE_COMMENTS
nocache
nocycle;
create SEQuence SEQ_ROU_EXE
nocache
nocycle;




/* Create Tables */

CREATE TABLE board
(
	board_no number NOT NULL,
	title nvarchar2(20) NOT NULL,
	content nvarchar2(1000) NOT NULL,
	created_at date DEFAULT SYSDATE,
	image_name varchar2(30),
	category nvarchar2(10),
	count number DEFAULT 0,
	id varchar2(20) NOT NULL,
	PRIMARY KEY (board_no)
);


CREATE TABLE board_like
(
	id varchar2(20) NOT NULL,
	board_no number NOT NULL
);


CREATE TABLE comments
(
	comments_no number NOT NULL,
	content nvarchar2(200),
	created_at date DEFAULT SYSDATE,
	board_no number NOT NULL,
	id varchar2(20) NOT NULL,
	PRIMARY KEY (comments_no)
);


CREATE TABLE exercise
(
	exercise_no number NOT NULL,
	exercise_name nvarchar2(20),
	exercise_partials nvarchar2(20),
	exercise_motions nvarchar2(100),
	PRIMARY KEY (exercise_no)
);


CREATE TABLE member
(
	id varchar2(20) NOT NULL,
	password varchar2(20) NOT NULL,
	name nvarchar2(10),
	height number,
	weight number,
	profile varchar2(100),
	gender nvarchar2(5),
	goal varchar2(10),
	question nvarchar2(30),
	answer nvarchar2(20),
	PRIMARY KEY (id)
);


CREATE TABLE note
(
	note_no number NOT NULL,
	recv_id varchar2(20),
	content nvarchar2(150),
	date_sent date DEFAULT SYSDATE,
	recv_read varchar2(1),
	recv_del varchar2(1),
	sent_del varchar2(1),
	id varchar2(20) NOT NULL,
	PRIMARY KEY (note_no)
);


CREATE TABLE play_exe
(
	play_no number NOT NULL,
	count number,
	set_count number DEFAULT 0,
	play_at date DEFAULT SYSDATE,
	id varchar2(20) NOT NULL,
	exercise_no number NOT NULL,
	PRIMARY KEY (play_no)
);


CREATE TABLE protein
(
	protein_no number NOT NULL,
	protein_name nvarchar2(20),
	protein_price number,
	protein_kinds varchar2(1),
	protein_company nvarchar2(20),
	protein_url nvarchar2(100),
	PRIMARY KEY (protein_no)
);


CREATE TABLE routine
(
	routine_no number NOT NULL,
	routine_name nvarchar2(30),
	create_at date DEFAULT SYSDATE,
	id varchar2(20) NOT NULL,
	PRIMARY KEY (routine_no)
);


CREATE TABLE rou_exe
(
	exercise_no number NOT NULL,
	routine_no number NOT NULL,
	goal_count number,
	goal_set number DEFAULT 0,
	routine_days number
);


CREATE TABLE subscribe
(
	subscribe_no number NOT NULL,
	routine_no number NOT NULL,
	id varchar2(20) NOT NULL,
	PRIMARY KEY (subscribe_no)
);


CREATE TABLE sub_calendar
(
	sub_calendar_no number NOT NULL,
	start_date date DEFAULT SYSDATE,
	subscribe_no number NOT NULL,
	PRIMARY KEY (sub_calendar_no)
);


CREATE TABLE timeilne_like
(
	id varchar2(20) NOT NULL,
	timeline_no number NOT NULL
);


CREATE TABLE timeline
(
	timeline_no number NOT NULL,
	content nvarchar2(300),
	image_name nvarchar2(20),
	created_at date DEFAULT SYSDATE,
	id varchar2(20) NOT NULL,
	PRIMARY KEY (timeline_no)
);


CREATE TABLE timeline_comments
(
	comments_no number NOT NULL,
	content nvarchar2(200),
	id varchar2(20) NOT NULL,
	timeline_no number NOT NULL,
	PRIMARY KEY (comments_no)
);



/* Create Foreign Keys */

ALTER TABLE board_like
	ADD FOREIGN KEY (board_no)
	REFERENCES board (board_no)
;


ALTER TABLE comments
	ADD FOREIGN KEY (board_no)
	REFERENCES board (board_no)
;


ALTER TABLE play_exe
	ADD FOREIGN KEY (exercise_no)
	REFERENCES exercise (exercise_no)
;


ALTER TABLE rou_exe
	ADD FOREIGN KEY (exercise_no)
	REFERENCES exercise (exercise_no)
;


ALTER TABLE board
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE board_like
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE comments
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE note
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE play_exe
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE routine
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE subscribe
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE timeilne_like
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE timeline
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE timeline_comments
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE rou_exe
	ADD FOREIGN KEY (routine_no)
	REFERENCES routine (routine_no)
;


ALTER TABLE subscribe
	ADD FOREIGN KEY (routine_no)
	REFERENCES routine (routine_no)
;


ALTER TABLE sub_calendar
	ADD FOREIGN KEY (subscribe_no)
	REFERENCES subscribe (subscribe_no)
;


ALTER TABLE timeilne_like
	ADD FOREIGN KEY (timeline_no)
	REFERENCES timeline (timeline_no)
;


ALTER TABLE timeline_comments
	ADD FOREIGN KEY (timeline_no)
	REFERENCES timeline (timeline_no)
;



=======

/* Drop Tables */

<<<<<<< HEAD
DROP TABLE board_like CASCADE CONSTRAINTS;
DROP TABLE comments CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE play_exe CASCADE CONSTRAINTS;
DROP TABLE rou_exe CASCADE CONSTRAINTS;
DROP TABLE exercise CASCADE CONSTRAINTS;
DROP TABLE note CASCADE CONSTRAINTS;
DROP TABLE sub_calendar CASCADE CONSTRAINTS;
DROP TABLE subscribe CASCADE CONSTRAINTS;
DROP TABLE routine CASCADE CONSTRAINTS;
DROP TABLE timeilne_like CASCADE CONSTRAINTS;
DROP TABLE timeline_comments CASCADE CONSTRAINTS;
DROP TABLE timeline CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE protein CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_BOARD;
DROP SEQUENCE SEQ_EXERCISE;
DROP SEQUENCE SEQ_NOTE;
DROP SEQUENCE SEQ_PROTEIN;
DROP SEQUENCE SEQ_ROUTINE;
DROP SEQUENCE SEQ_TIMELINE;
DROP SEQUENCE SEQ_TIMELINE_COMMENTS;




/* Create Sequences */

CREATE SEQUENCE SEQ_BOARD;
CREATE SEQUENCE SEQ_EXERCISE;
CREATE SEQUENCE SEQ_NOTE;
CREATE SEQUENCE SEQ_PROTEIN;
CREATE SEQUENCE SEQ_ROUTINE;
CREATE SEQUENCE SEQ_TIMELINE;
CREATE SEQUENCE SEQ_TIMELINE_COMMENTS;



/* Create Tables */

CREATE TABLE board
(
	board_no number NOT NULL,
	title nvarchar2(20) NOT NULL,
	content nvarchar2(1000) NOT NULL,
	created_at date DEFAULT SYSDATE,
	image_name varchar2(30),
	category nvarchar2(10),
	count number DEFAULT 0,
	id varchar2(20) NOT NULL,
	PRIMARY KEY (board_no)
);


CREATE TABLE board_like
(
	id varchar2(20) NOT NULL,
	board_no number NOT NULL
);


CREATE TABLE comments
(
	comments_no number NOT NULL,
	content nvarchar2(200),
	created_at date DEFAULT SYSDATE,
	board_no number NOT NULL,
	id varchar2(20) NOT NULL,
	PRIMARY KEY (comments_no)
);


CREATE TABLE exercise
(
	exercise_no number NOT NULL,
	exercise_name nvarchar2(20),
	exercise_partials nvarchar2(20),
	exercise_motions nvarchar2(100),
	PRIMARY KEY (exercise_no)
);


CREATE TABLE member
(
	id varchar2(20) NOT NULL,
	password varchar2(20) NOT NULL,
	name nvarchar2(10),
	height number,
	weight number,
	profile varchar2(100),
	gender nvarchar2(5),
	goal varchar2(10),
	question nvarchar2(30),
	answer nvarchar2(20),
	PRIMARY KEY (id)
);


CREATE TABLE note
(
	note_no number NOT NULL,
	recv_id varchar2(20),
	content nvarchar2(150),
	date_sent date DEFAULT SYSDATE,
	recv_read varchar2(1),
	recv_del varchar2(1),
	sent_del varchar2(1),
	id varchar2(20) NOT NULL,
	PRIMARY KEY (note_no)
);


CREATE TABLE play_exe
(
	play_no number NOT NULL,
	count number,
	set_count number DEFAULT 0,
	play_at date DEFAULT SYSDATE,
	id varchar2(20) NOT NULL,
	exercise_no number NOT NULL,
	PRIMARY KEY (play_no)
);


CREATE TABLE protein
(
	protein_no number NOT NULL,
	protein_name nvarchar2(20),
	protein_price number,
	protein_kinds varchar2(1),
	protein_company nvarchar2(20),
	protein_url nvarchar2(100),
	PRIMARY KEY (protein_no)
);


CREATE TABLE routine
(
	routine_no number NOT NULL,
	routine_name nvarchar2(30),
	create_at date DEFAULT SYSDATE,
	id varchar2(20) NOT NULL,
	PRIMARY KEY (routine_no)
);


CREATE TABLE rou_exe
(
	exercise_no number NOT NULL,
	routine_no number NOT NULL,
	goal_count number,
	goal_set number DEFAULT 0,
	routine_days number
);


CREATE TABLE subscribe
(
	subscribe_no number NOT NULL,
	routine_no number NOT NULL,
	id varchar2(20) NOT NULL,
	PRIMARY KEY (subscribe_no)
);


CREATE TABLE sub_calendar
(
	sub_calendar_no number NOT NULL,
	start_date date DEFAULT SYSDATE,
	subscribe_no number NOT NULL,
	PRIMARY KEY (sub_calendar_no)
);


CREATE TABLE timeilne_like
(
	id varchar2(20) NOT NULL,
	timeline_no number NOT NULL
);


CREATE TABLE timeline
(
	timeline_no number NOT NULL,
	content nvarchar2(300),
	image_name nvarchar2(20),
	created_at date DEFAULT SYSDATE,
	id varchar2(20) NOT NULL,
	PRIMARY KEY (timeline_no)
);


CREATE TABLE timeline_comments
(
	comments_no number NOT NULL,
	content nvarchar2(200),
	id varchar2(20) NOT NULL,
	timeline_no number NOT NULL,
	PRIMARY KEY (comments_no)
);



/* Create Foreign Keys */

ALTER TABLE board_like
	ADD FOREIGN KEY (board_no)
	REFERENCES board (board_no)
;


ALTER TABLE comments
	ADD FOREIGN KEY (board_no)
	REFERENCES board (board_no)
;


ALTER TABLE play_exe
	ADD FOREIGN KEY (exercise_no)
	REFERENCES exercise (exercise_no)
;


ALTER TABLE rou_exe
	ADD FOREIGN KEY (exercise_no)
	REFERENCES exercise (exercise_no)
;


ALTER TABLE board
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE board_like
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE comments
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE note
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE play_exe
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE routine
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE subscribe
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE timeilne_like
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE timeline
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE timeline_comments
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE rou_exe
	ADD FOREIGN KEY (routine_no)
	REFERENCES routine (routine_no)
;


ALTER TABLE subscribe
	ADD FOREIGN KEY (routine_no)
	REFERENCES routine (routine_no)
;


ALTER TABLE sub_calendar
	ADD FOREIGN KEY (subscribe_no)
	REFERENCES subscribe (subscribe_no)
;


ALTER TABLE timeilne_like
=======
DROP TABLE comments CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE calendar CASCADE CONSTRAINTS;
DROP TABLE play_exe CASCADE CONSTRAINTS;
DROP TABLE rou_exe CASCADE CONSTRAINTS;
DROP TABLE exercise CASCADE CONSTRAINTS;
DROP TABLE likey CASCADE CONSTRAINTS;
DROP TABLE note CASCADE CONSTRAINTS;
DROP TABLE subscribe CASCADE CONSTRAINTS;
DROP TABLE routine CASCADE CONSTRAINTS;
DROP TABLE timeline_comments CASCADE CONSTRAINTS;
DROP TABLE timeline CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE board
(
	board_no number NOT NULL,
	title nvarchar2(20) NOT NULL,
	content nvarchar2(1000) NOT NULL,
	created_at date DEFAULT SYSDATE,
	image_name varchar2(30),
	category nvarchar2(10),
	id varchar2(20) NOT NULL,
	PRIMARY KEY (board_no)
);


CREATE TABLE calendar
(
	calendar_no number NOT NULL,
	start_date date DEFAULT SYSDATE,
	end_date date DEFAULT SYSDATE,
	id varchar2(20) NOT NULL,
	routine_no number,
	play_no number,
	PRIMARY KEY (calendar_no)
);


CREATE TABLE comments
(
	comments_no number NOT NULL,
	content nvarchar2(200),
	board_no number NOT NULL,
	id varchar2(20) NOT NULL,
	PRIMARY KEY (comments_no)
);


CREATE TABLE exercise
(
	exercise_no number NOT NULL,
	exercise_name nvarchar2(20),
	exercise_partials nvarchar2(20),
	exercise_motions nvarchar2(100),
	PRIMARY KEY (exercise_no)
);


CREATE TABLE likey
(
	id varchar2(20) NOT NULL,
	timeline_no number NOT NULL
);


CREATE TABLE member
(
	id varchar2(20) NOT NULL,
	password varchar2(20) NOT NULL,
	name nvarchar2(10),
	height number,
	weight number,
	profile varchar2(100),
	gender nvarchar2(5),
	goal varchar2(10),
	question nvarchar2(30),
	answer nvarchar2(20),
	PRIMARY KEY (id)
);


CREATE TABLE note
(
	note_no number NOT NULL,
	recv_id varchar2(20),
	content nvarchar2(150),
	date_sent date DEFAULT SYSDATE,
	recv_read varchar2(1),
	recv_del varchar2(1),
	sent_del varchar2(1),
	id varchar2(20) NOT NULL,
	PRIMARY KEY (note_no)
);


CREATE TABLE play_exe
(
	play_no number NOT NULL,
	count number,
	play_at date DEFAULT SYSDATE,
	id varchar2(20) NOT NULL,
	exercise_no number NOT NULL,
	PRIMARY KEY (play_no)
);


CREATE TABLE routine
(
	routine_no number NOT NULL,
	routine_name nvarchar2(30),
	create_at date DEFAULT SYSDATE,
	id varchar2(20) NOT NULL,
	PRIMARY KEY (routine_no)
);


CREATE TABLE rou_exe
(
	exercise_no number NOT NULL,
	routine_no number NOT NULL,
	goal_count number
);


CREATE TABLE subscribe
(
	routine_no number NOT NULL,
	id varchar2(20) NOT NULL
);


CREATE TABLE timeline
(
	timeline_no number NOT NULL,
	content nvarchar2(300),
	image_name nvarchar2(20),
	created_at date DEFAULT SYSDATE,
	id varchar2(20) NOT NULL,
	PRIMARY KEY (timeline_no)
);


CREATE TABLE timeline_comments
(
	comments_no number NOT NULL,
	content nvarchar2(200),
	id varchar2(20) NOT NULL,
	timeline_no number NOT NULL,
	PRIMARY KEY (comments_no)
);



/* Create Foreign Keys */

ALTER TABLE comments
	ADD FOREIGN KEY (board_no)
	REFERENCES board (board_no)
;


ALTER TABLE play_exe
	ADD FOREIGN KEY (exercise_no)
	REFERENCES exercise (exercise_no)
;


ALTER TABLE rou_exe
	ADD FOREIGN KEY (exercise_no)
	REFERENCES exercise (exercise_no)
;


ALTER TABLE board
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE calendar
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE comments
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE likey
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE note
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE play_exe
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE routine
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE subscribe
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE timeline
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE timeline_comments
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
;


ALTER TABLE calendar
	ADD FOREIGN KEY (play_no)
	REFERENCES play_exe (play_no)
;


ALTER TABLE calendar
	ADD FOREIGN KEY (routine_no)
	REFERENCES routine (routine_no)
;


ALTER TABLE rou_exe
	ADD FOREIGN KEY (routine_no)
	REFERENCES routine (routine_no)
;


ALTER TABLE subscribe
	ADD FOREIGN KEY (routine_no)
	REFERENCES routine (routine_no)
;


ALTER TABLE likey
>>>>>>> branch 'suntae' of https://github.com/yujeongseon/SIX-ONE.git
	ADD FOREIGN KEY (timeline_no)
	REFERENCES timeline (timeline_no)
;


ALTER TABLE timeline_comments
	ADD FOREIGN KEY (timeline_no)
	REFERENCES timeline (timeline_no)
;



>>>>>>> branch 'suntae' of https://github.com/yujeongseon/SIX-ONE.git
