

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
	goal_set number DEFAULT 0
);


CREATE TABLE subscribe
(
	routine_no number NOT NULL,
	id varchar2(20) NOT NULL,
	start_date date DEFAULT null,
	end_date date DEFAULT null
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


ALTER TABLE timeilne_like
	ADD FOREIGN KEY (timeline_no)
	REFERENCES timeline (timeline_no)
;


ALTER TABLE timeline_comments
	ADD FOREIGN KEY (timeline_no)
	REFERENCES timeline (timeline_no)
;



