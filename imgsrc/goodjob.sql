CREATE TABLE `user` (
	`username`	varchar(30)	PRIMARY KEY,
	`password`	varchar(30)	NOT NULL,
	`role`	varchar(20)	NOT NULL
);

CREATE TABLE `member` (
	`mem_no`	BIGINT	PRIMARY KEY AUTO_INCREMENT,
	`username`	varchar(30)	NOT NULL,
	`mem_name`	varChar(20)	NOT NULL,
	`mem_tel`	varChar(13)	NOT NULL,
	`mem_email`	varChar(50)	NOT NULL,
	`mem_gender`	varChar(20)	NOT NULL,
	`make_date`	date	NOT NULL DEFAULT CURRENT_DATE,
	`mem_birth`	varchar(10)	NOT NULL,
	`mem_addr`	varchar(50)	NOT NULL,
	FOREIGN KEY(username) REFERENCES USER(username)
	ON UPDATE CASCADE	
);


CREATE TABLE `company` (
	`com_no`	BIGINT	PRIMARY KEY AUTO_INCREMENT,
	`username`	varchar(30)	NOT NULL,
	`com_name`	varChar(50)	NOT NULL,
	`com_type`	varChar(10)	NOT NULL,
	`com_ceo`	varChar(30)	NOT NULL,
	`com_addr`	varChar(100)	NOT NULL,
	`com_companynum`	varChar(20)	NOT NULL,
	`com_tel`	varChar(13)	NOT NULL,
	`com_email`	varChar(50)	NOT NULL,
	FOREIGN KEY(username) REFERENCES USER(username)
	ON UPDATE CASCADE
);

CREATE TABLE `notice` (
	`notice_no`	BIGINT	PRIMARY KEY AUTO_INCREMENT,
	`mem_no`	bigint	NOT NULL,
	`title`	varChar(100)	NOT NULL,
	`contetn`	varChar(1000)	NOT NULL,
	`reg_date`	date	NULL DEFAULT CURRENT_DATE,
	`category`	varchar(20)	NOT NULL,
	FOREIGN KEY(mem_no) REFERENCES member(mem_no)
);

CREATE TABLE `service_question` (
	`cs_no`	BIGINT	PRIMARY KEY AUTO_INCREMENT,
	`mem_no`	bigint	NOT NULL,
	`title`	varChar(100)	NOT NULL,
	`content`	varChar(1000)	NOT NULL,
	`reg_date`	date	NULL DEFAULT CURRENT_DATE,
	`category`	varChar(20)	NOT NULL,
	`ch_private`	boolean	NOT NULL,
	`answer` VARCHAR(1000) NULL,
	FOREIGN KEY(mem_no) REFERENCES member(mem_no)
);

CREATE TABLE `resume` (
	`resume_no`	BIGINT	PRIMARY KEY AUTO_INCREMENT,
	`mem_no`	bigint	NOT NULL,
	`title`	VARCHAR(100)	NOT NULL,
	`img_url`	VARCHAR(100)	NULL,
	`hope_job`	VARCHAR(50)	NULL,
	`hope_city` VARCHAR(30) NULL,
	`hope_pay` BIGINT NULL,
	`military`	VARCHAR(100)	NULL,
	`port_url`	VARCHAR(100)	NULL,
	`growth`	varchar(1000)	NULL,
	`motive` VARCHAR(1000) NULL,
	`personality` VARCHAR(1000) NULL,
	FOREIGN KEY(mem_no) REFERENCES member(mem_no)
);

CREATE TABLE `license` (
	`license_no`	BIGINT	PRIMARY KEY AUTO_INCREMENT,
	`resume_no`	bigint	NOT NULL,
	`license_name`	varChar(100)	NOT NULL,
	`agency`	varChar(100)	NOT NULL,
	`get_date`	date	NOT NULL,
	FOREIGN KEY(resume_no) REFERENCES resume(resume_no)
);

CREATE TABLE `career` (
	`career_no`	BIGINT	PRIMARY KEY AUTO_INCREMENT,
	`resume_no`	bigint	NOT NULL,
	`company`	varChar(100)	NOT NULL,
	`car_join_date`	date	NOT NULL,
	`quit_date`	date	NOT NULL,
	`main_part`	varChar(100)	NOT NULL,
	FOREIGN KEY(resume_no) REFERENCES resume(resume_no)
);

CREATE TABLE `education` (
	`education_no`	BIGINT	PRIMARY KEY AUTO_INCREMENT,
	`resume_no`	bigint	NOT NULL,
	`school`	varChar(100)	NOT NULL,
	`edu_join_date`	date	NOT NULL,
	`edu_gra_date`	date	NOT NULL,
	`graduation`	VARCHAR(20)	NOT NULL,
	`grades`	varchar(10)	NULL,
	`major`	varChar(100)	NULL,
	FOREIGN KEY(resume_no) REFERENCES resume(resume_no)
);

CREATE TABLE `skill` (
	`skill_no`	BIGINT	PRIMARY KEY AUTO_INCREMENT,
	`resume_no`	bigint	NOT NULL,
	`sk_name`	varChar(100)	NOT NULL,
	FOREIGN KEY(resume_no) REFERENCES resume(resume_no)
);

CREATE TABLE `etc` (
	`etc_no`	bigint	PRIMARY KEY AUTO_INCREMENT,
	`resume_no`	bigint	NOT NULL,
	`etc_name1`	varchar(200)	NOT NULL,
	`etc_name2`	varchar(200)   NULL,
	`etc_name3`	varchar(200)   NULL,
	FOREIGN KEY(resume_no) REFERENCES resume(resume_no)
);

CREATE TABLE `recruit` (
	`recruit_no`	BIGINT	PRIMARY KEY AUTO_INCREMENT,
	`com_no`	bigint	NOT NULL,
	`username`	varchar(30)	NOT NULL,
	`career`	varChar(100)	NOT NULL,
	`education`	varChar(100)	NOT NULL,
	`Field`	varChar(100)	NOT NULL,
	`pay`	int	NOT NULL,
	`location`	varChar(100)	NOT NULL,
	`working_time`	varChar(100)	NULL,
	`rank`	varChar(100)	NOT NULL,
	`title`	varChar(100)	NOT NULL,
	`qualification`	varChar(500)	NULL,
	`welfare`	varChar(500)	NULL,
	`seprocedure`	varChar(500)	NULL,
	`notice`	varChar(500)	NULL,
	`reg_date`	date	NULL DEFAULT CURRENT_DATE,
	`deadline_date`	date	NULL,
	`p_number`	varchar(10)	NOT NULL,
	`recruit_intro`	VARCHAR(1000)	NULL,
	FOREIGN KEY(com_no) REFERENCES company(com_no),
	FOREIGN KEY(username) REFERENCES user(username)
	ON UPDATE CASCADE
);

CREATE TABLE `scrap_recruit` (
	`s_recruit_no`	BIGINT	PRIMARY KEY AUTO_INCREMENT,
	`mem_no`	bigint	NOT NULL,
	`recruit_no`	bigint	NOT NULL,
	FOREIGN KEY(mem_no) REFERENCES member(mem_no),
	FOREIGN KEY(recruit_no) REFERENCES recruit(recruit_no)
);

CREATE TABLE `com_interest` (
	`com_interest_no`	BIGINT	PRIMARY KEY AUTO_INCREMENT,
	`mem_no`	bigint	NOT NULL,
	`com_no`	bigint	NOT NULL,
	FOREIGN KEY(mem_no) REFERENCES member(mem_no),
	FOREIGN KEY(com_no) REFERENCES company(com_no)
);

CREATE TABLE `mem_community` (
	`mem_community_no`	BIGINT	PRIMARY KEY AUTO_INCREMENT,
	`mem_no`	bigint	NOT NULL,
	`title`	varChar(100)	NOT NULL,
	`content`	varChar(1000)	NOT NULL,
	`reg_date`	date	NULL DEFAULT CURRENT_DATE,
	`views`	bigint	NULL,
	FOREIGN KEY(mem_no) REFERENCES member(mem_no)
);

CREATE TABLE `mem_reply` (
	`mem_reply_no`	bigint	PRIMARY KEY AUTO_INCREMENT,
	`mem_community_no`	bigint	NOT NULL,
	`mem_no`	bigint	NOT NULL,
	`content`	varChar(1000)	NOT NULL,
	`reg_date`	date	NULL DEFAULT CURRENT_DATE,
	FOREIGN KEY(mem_no) REFERENCES member(mem_no),
	FOREIGN KEY(mem_community_no) REFERENCES mem_community(mem_community_no)
);

CREATE TABLE `com_community` (
	`com_community__no`	bigint	PRIMARY KEY AUTO_INCREMENT,
	`com_no`	bigint	NOT NULL,
	`title`	varChar(100)	NOT NULL,
	`content`	varChar(500)	NOT NULL,
	`regdate`	date	NULL DEFAULT CURRENT_DATE,
	`category`	varChar(100)	NOT NULL,
	`views`	bigint	NULL,
	FOREIGN KEY(com_no) REFERENCES company(com_no)
);

CREATE TABLE `com_reply` (
	`com_reply_no`	bigint	PRIMARY KEY AUTO_INCREMENT,
	`com_community__no`	bigint	NOT NULL,
	`content`	varChar(100)	NOT NULL,
	`regdate`	date	NULL DEFAULT CURRENT_DATE,
	FOREIGN KEY(com_community__no) REFERENCES com_community(com_community__no)
);

CREATE TABLE `company_detail` (
	`com_detail_no`	bigint	PRIMARY KEY AUTO_INCREMENT,
	`com_no`	bigint	NOT NULL,
	`Introduction`	varChar(500)	NULL,
	`img_url`	varChar(200)	NULL,
	`Pension`	varChar(1000)	NULL,
	`compensation`	varChar(1000)	NULL,
	`facilities`	varChar(1000)	NULL,
	`policy`	varChar(1000)	NULL,
	`Convenience`	varChar(1000)	NULL,
	`Sectors`	varChar(100)	NULL,
	`history`	varChar(1000)	NULL,
	`ideal_talent`	varChar(100)	NULL,
	`foundation`	date	NULL,
	`amount`	int	NULL,
	`url`	varchar(200)	NULL,
	FOREIGN KEY(com_no) REFERENCES company(com_no)
);

CREATE TABLE `mem_recruit` (
	`mem_recruit_no`	bigint	PRIMARY KEY AUTO_INCREMENT,
	`mem_no`	bigint	NOT NULL,
	`recruit_no`	bigint	NOT NULL,
	`resume_pass`	int	NULL,
	`view`	boolean	NULL,
	`s_resume_no`	bigint	NOT NULL,
	`interview_pass` INT		NULL,
	FOREIGN KEY(mem_no) REFERENCES member(mem_no),
	FOREIGN KEY(recruit_no) REFERENCES recruit(recruit_no)
);

CREATE TABLE `mem_interest` (
	`mem_interest_no`	bigint	PRIMARY KEY AUTO_INCREMENT,
	`mem_no`	bigint	NOT NULL,
	`com_no`	bigint	NOT NULL,
	FOREIGN KEY(mem_no) REFERENCES member(mem_no),
	FOREIGN KEY(com_no) REFERENCES company(com_no)
);

CREATE TABLE `service_request` (
	`request_no`	bigint	PRIMARY KEY AUTO_INCREMENT,
	`cs_no`	bigint	NOT NULL,
	`title`	varchar(100)	NOT NULL,
	`content`	varchar(1000)	NOT NULL,
	`reg_date`	date	NULL DEFAULT CURRENT_DATE,
	FOREIGN KEY(cs_no) REFERENCES service_question(cs_no)
);

CREATE TABLE `service_faq` (
	`faq_no`	bigint	PRIMARY KEY AUTO_INCREMENT,
	`username`	varchar(30)	NOT NULL,
	`title`	varchar(100)	NOT NULL,
	`content`	varchar(1000)	NOT NULL,
	`faq_reg_date`	date	NULL DEFAULT CURRENT_DATE,
	`category`	varchar(20)	NOT NULL,
	FOREIGN KEY(username) REFERENCES user(username)
	ON UPDATE CASCADE
);

CREATE TABLE `c_skill` (
	`c_skill_no`	bigint	PRIMARY KEY AUTO_INCREMENT,
	`recruit_no`	bigint	NOT NULL,
	`skill_name`	varchar(20)	NOT NULL,
	FOREIGN KEY(recruit_no) REFERENCES recruit(recruit_no)
);


