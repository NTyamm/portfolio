CREATE TABLE `member` (
	`me_id` varchar(16)	NOT NULL,
    `me_gr_code`	INT NOT NULL,
	`me_pw`	varchar(255) NOT NULL,
	`me_name`	varchar(8) NOT NULL,
	`me_email`	varchar(50) NOT NULL,
	`me_zip`	INT(5) NOT NULL,
	`me_address1`	varchar(50) NOT NULL,
	`me_address2`	varchar(30) NOT NULL,
	`me_phone`	INT(11) NOT NULL,
	`me_recommending` varchar(8) NOT NULL,
	`me_point`	INT	DEFAULT 0,
	`me_auth`	INT	 DEFAULT 0	COMMENT '0: 일반
1: 관리자'
);

CREATE TABLE `orders` (
	`or_num`	INT(16) NOT NULL,
	`or_date`	DATE,
	`or_name`	VARCHAR(8) NOT NULL,
	`or_phone`	INT(11) NOT NULL,
	`or_zip`	INT(5) NOT NULL,
	`or_address1`	VARCHAR(50) NOT NULL,
	`or_address2`	VARCHAR(30) NOT NULL,
	`or_price`	INT NOT NULL,
	`or_payment` VARCHAR(10)	NOT NULL,
	`or_point`	INT NOT NULL,
	`or_status`	VARCHAR(10) NOT NULL
);

CREATE TABLE `murchandise` (
	`mu_num`	INT(8) NOT NULL,
	`mu_name`	VARCHAR(20) NOT NULL,
	`mu_category`	VARCHAR(10) NOT NULL,
	`mu_ca_num` INT	NOT NULL,
	`mu_contents`	VARCHAR(255)	NULL
);

CREATE TABLE `inout` (
	`io_num`	INT NOT NULL,
	`io_op_num` INT	NOT NULL,
	`io_amount`	INT NOT NULL,
	`io_date`	DATE,
	`io_status`	VARCHAR(10) NOT NULL
);

CREATE TABLE `board` (
	`bd_num`	INT NOT NULL,
	`bd_me_id`	VARCHAR(16),
	`bd_mu_num`	INT(8),
	`bd_title`	VARCHAR(40),
	`bd_contents`	LONGTEXT NOT NULL,
	`bd_date`	DATE,
	`bd_del`	VARCHAR(255)	NULL,
	`bd_bc_id`	INT NOT NULL,
	`bc_score`	INT NULL	DEFAULT 0
);

CREATE TABLE `addedpic` (
	`ap_num`	INT NOT NULL,
	`ap_bd_num`	INT NOT NULL,
	`ap_name`	VARCHAR(255) NOT NULL,
	`ap_del`	INT
);

CREATE TABLE `cart` (
	`cart_id`	INT(12) NOT NULL,
	`ca_me_id`	VARCHAR(16) NOT NULL,
	`ca_mu_num`	INT(8) NOT NULL,
	`ca_price`	INT NOT NULL,
	`ca_amount` INT	NOT NULL	DEFAULT 0
);

CREATE TABLE `comment` (
	`co_num`	INT NOT NULL,
	`co_me_id`	VARCHAR(16) NOT NULL,
	`co_bd_num`	INT NOT NULL,
	`co_contents` LONGTEXT	NOT NULL,
	`co_date`	DATE
);

CREATE TABLE `murchancate` (
	`ca_num`	INT NOT NULL,
	`ca_name`	VARCHAR(10) NOT NULL
);

CREATE TABLE `grade` (
	`gr_code`	INT NOT NULL,
	`gr_name`	VARCHAR(15) NOT NULL,
	`gr_pointpercent`	INT NOT	NULL,
    `gr_shippinng` INT NOT NULL DEFAULT 0
);

CREATE TABLE `murchanoption` (
	`op_num`	 INT NOT NULL,
	`op_mu_num`	INT(8),
	`op_cate`	VARCHAR(255)	NULL	DEFAULT NULL,
	`op_capacity`	VARCHAR(255)	NULL	DEFAULT 0,
	`op_price`	VARCHAR(255)	NOT NULL,
	`op_status` VARCHAR(10) NOT NULL,
	`op_stock`	INT NOT	NULL DEFAULT 0
);

CREATE TABLE `point` (
	`po_code`	INT NOT NULL	DEFAULT 0,
	`po_me_id`	VARCHAR(16) NOT NULL,
	`po_hisdated`	DATE,
	`po_status`	VARCHAR(255)	NULL	DEFAULT 0,
	`po_contents`	VARCHAR(255)	NULL
);

CREATE TABLE `orderlist` (
	`ol_num`	INT	NOT NULL,
	`ol_or_num`	INT(16),
	`op_num`	INT	NOT NULL,
	`ol_amount`	INT	NULL	DEFAULT 0,
	`ol_price`	INT	NULL	DEFAULT 0
);

CREATE TABLE `bdcate` (
	`bc_id`	INT	NOT NULL,
	`bc_view`	INT	NULL	DEFAULT 0,
	`bc_write`	INT	NULL	DEFAULT 0,
	`bc_comment`	INT	NULL	DEFAULT 0
);

CREATE TABLE `favorite` (
	`fa_num`	INT	NOT NULL	DEFAULT 0,
	`fa_mu_num`	VARCHAR(20)	NOT NULL,
	`fa_me_id`	VARCHAR(16)	NOT NULL
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`me_id`
);

ALTER TABLE `orders` ADD CONSTRAINT `PK_ORDERS` PRIMARY KEY (
	`or_num`
);

ALTER TABLE `murchandise` ADD CONSTRAINT `PK_MURCHANDISE` PRIMARY KEY (
	`mu_num`
);

ALTER TABLE `inout` ADD CONSTRAINT `PK_INOUT` PRIMARY KEY (
	`io_num`
);

ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`bd_num`
);

ALTER TABLE `addedpic` ADD CONSTRAINT `PK_ADDEDPIC` PRIMARY KEY (
	`ap_num`
);

ALTER TABLE `cart` ADD CONSTRAINT `PK_CART` PRIMARY KEY (
	`cart_id`
);

ALTER TABLE `comment` ADD CONSTRAINT `PK_COMMENT` PRIMARY KEY (
	`co_num`
);

ALTER TABLE `murchancate` ADD CONSTRAINT `PK_MURCHANCATE` PRIMARY KEY (
	`ca_num`
);

ALTER TABLE `grade` ADD CONSTRAINT `PK_GRADE` PRIMARY KEY (
	`gr_code`
);

ALTER TABLE `murchanoption` ADD CONSTRAINT `PK_MURCHANOPTION` PRIMARY KEY (
	`op_num`
);

ALTER TABLE `point` ADD CONSTRAINT `PK_POINT` PRIMARY KEY (
	`po_code`
);

ALTER TABLE `orderlist` ADD CONSTRAINT `PK_ORDERLIST` PRIMARY KEY (
	`ol_num`
);

ALTER TABLE `bdcate` ADD CONSTRAINT `PK_BDCATE` PRIMARY KEY (
	`bc_id`
);

ALTER TABLE `favorite` ADD CONSTRAINT `PK_FAVORITE` PRIMARY KEY (
	`fa_num`
);
ALTER TABLE `shoppingmall`.`board` 
CHANGE COLUMN `bd_num` `bd_num` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`bd_num`);
;

ALTER TABLE `shoppingmall`.`addedpic` 
CHANGE COLUMN `ap_num` `ap_num` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`ap_num`);
;
ALTER TABLE `shoppingmall`.`comment` 
CHANGE COLUMN `co_num` `co_num` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`co_num`);
;
ALTER TABLE `shoppingmall`.`cart` 
CHANGE COLUMN `cart_id` `cart_id` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`cart_id`);
;
ALTER TABLE `shoppingmall`.`bdcate` 
CHANGE COLUMN `bc_id` `bc_id` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`bc_id`);
;
ALTER TABLE `shoppingmall`.`inout` 
CHANGE COLUMN `io_num` `io_num` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`io_num`);
;
ALTER TABLE `shoppingmall`.`member` 
ADD UNIQUE INDEX `me_email_UNIQUE` (`me_email` ASC) VISIBLE;
;
ALTER TABLE `shoppingmall`.`murchancate` 
CHANGE COLUMN `ca_num` `ca_num` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`ca_num`);
;
ALTER TABLE `shoppingmall`.`murchandise` 
CHANGE COLUMN `mu_num` `mu_num` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`mu_num`);
;
ALTER TABLE `shoppingmall`.`orderlist` 
CHANGE COLUMN `ol_num` `ol_num` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`ol_num`);
;
ALTER TABLE `shoppingmall`.`murchanoption` 
CHANGE COLUMN `op_num` `op_num` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`op_num`);
;
ALTER TABLE `shoppingmall`.`orders` 
CHANGE COLUMN `or_num` `or_num` INT NOT NULL AUTO_INCREMENT ;
ALTER TABLE `shoppingmall`.`point` 
CHANGE COLUMN `po_code` `po_code` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`po_code`);
;
ALTER TABLE `shoppingmall`.`board` 
ADD INDEX `bd_me_id_idx` (`bd_me_id` ASC) VISIBLE;
;
ALTER TABLE `shoppingmall`.`board` 
ADD CONSTRAINT `bd_me_id`
  FOREIGN KEY (`bd_me_id`)
  REFERENCES `shoppingmall`.`member` (`me_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `shoppingmall`.`favorite` 
CHANGE COLUMN `fa_num` `fa_num` INT NOT NULL AUTO_INCREMENT ;
ALTER TABLE `shoppingmall`.`favorite` 
ADD INDEX `fa_me_id_idx` (`fa_me_id` ASC) VISIBLE;
;
ALTER TABLE `shoppingmall`.`favorite` 
ADD CONSTRAINT `fa_me_id`
  FOREIGN KEY (`fa_me_id`)
  REFERENCES `shoppingmall`.`member` (`me_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
