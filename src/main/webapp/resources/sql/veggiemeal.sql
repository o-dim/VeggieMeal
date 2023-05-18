DROP TABLE ORDER_DETAIL;
DROP TABLE ORDER_TBL;
DROP TABLE BASKET;
DROP TABLE RECIPE_REPLY;
DROP TABLE SLEEP_PERSON;
DROP TABLE LEAVE_PERSON;
DROP TABLE QNA;
DROP TABLE RECOMMAND;
DROP TABLE RIMG;
DROP TABLE CART;
DROP TABLE PIMG;
DROP TABLE SALE;
DROP TABLE PRODUCT;
DROP TABLE RECIPE;
DROP TABLE PERSON;


-- 상품 : 상품코드(번호), 상품명, 대표이미지경로, 대표이미지이름, 원가, 재고수량

-- 관리자 페이지
CREATE TABLE PRODUCT (
	PROD_CODE	                NUMBER	            NOT NULL,
	PROD_NAME	                VARCHAR2(100 BYTE)	NOT NULL,
	PROD_PATH	                VARCHAR2(100 BYTE)	NOT NULL,
	PROD_IMG_NAME	            VARCHAR2(100 BYTE)	NOT NULL,
	PROD_ORIGIN_PRICE	        NUMBER	                NULL,
    PROD_PRICE                  NUMBER                  NULL,        -- 추가
	PROD_STOCK	                NUMBER	                NULL,
    PROD_COUNT                  NUMBER                  NULL        -- CART_COUNT에서 추가됨
);

-- 상품판매 (판매 원티드 페이지)
CREATE TABLE SALE (
	SALE_NO	                    NUMBER	            NOT NULL,
	PROD_CODE	                NUMBER	            NOT NULL,
	SALE_TITLE	                VARCHAR2(100 BYTE)	    NULL,
	SALE_CONTENT	            VARCHAR2(100 BYTE)	    NULL,
	SALE_PRICE	                NUMBER	                NULL,
	PROD_PATH	                VARCHAR2(100 BYTE)	NOT NULL,
	PROD_IMG_NAME	            VARCHAR2(100 BYTE)	NOT NULL
);

-- 상품이미지 : 상품이미지번호, 상품코드, 경로, 파일명, 메인이미지 ( 대표이미지라면1, 아니면0)
CREATE TABLE PIMG (
	PIMG_NO	                    NUMBER	            NOT NULL,
	PIMG_PATH	                VARCHAR2(100 BYTE)	NOT NULL,
	PIMG_FILE	                VARCHAR2(50 BYTE)	NOT NULL,
	PROD_CODE	                NUMBER	            NOT NULL,
    PIMG_MAIN_IMG               NUMBER              NOT NULL        -- 추가
);

-- 회원(탈퇴,휴면)
CREATE TABLE PERSON (
	PER_NO                      NUMBER	            NOT NULL,
	PW	                        VARCHAR2(20 BYTE)	NOT NULL,
	PHONENO	                    NUMBER	            NOT NULL,
	POST_ADDRESS	            VARCHAR2(5 BYTE)	    NULL,
	ROAD_ADDRESS	            VARCHAR2(100 BYTE)	    NULL,
	JIBUN_ADDRESS	            VARCHAR2(100 BYTE)	    NULL,
	DETAIL_ADDRESS	            VARCHAR2(100 BYTE)	NOT NULL,
	EMAIL	                    VARCHAR2(20 BYTE)	NOT NULL,
	GENDER	                    VARCHAR2(10 BYTE)	NOT NULL,
	NAME	                    VARCHAR2(20 BYTE)	NOT NULL,
	AGGRECODE	                NUMBER	                NULL,
	JOINED_AT	                DATE	                NULL,
	ID	                        VARCHAR2(20 BYTE)	NOT NULL UNIQUE
);

-- 장바구니 : 장바구니번호, 상품코드, 장바구니에담은개수
CREATE TABLE CART (
	CART_NO	                    NUMBER	            NOT NULL,       -- PK
	PROD_CODE	                NUMBER	            NOT NULL,
    COUNT                       NUMBER              NOT NULL
);

-- 
CREATE TABLE BASKET (
    BASKET_NO                   NUMBER              NOT NULL,       -- PK
    CART_NO                     NUMBER              NOT NULL,       -- FK
    PROD_CODE                   NUMBER              NOT NULL        -- FK
);

CREATE TABLE ORDER_TBL (
    ORDER_NO                    NUMBER              NOT NULL,       -- PK
    PER_NO                      NUMBER              NOT NULL,       -- FK 
    BASKET_NO                   NUMBER              NOT NULL        -- FK
);

CREATE TABLE ORDER_DETAIL (
    O_D_NO                      NUMBER              NOT NULL,       -- PK
    ORDER_NO                    NUMBER              NOT NULL,       -- FK
    PROD_CODE                   NUMBER              NOT NULL        -- FK
);


-- 레시피 이미지 게시판(사진 여러 개)
CREATE TABLE RIMG (
	RECIPE_NO	                NUMBER	            NOT NULL,
    RIMG_NO                     NUMBER              NOT NULL,
	RIMG_PATH	                VARCHAR2(100 BYTE)	NOT NULL,
	RIMG_ORIGIN_NAME	        VARCHAR2(300 BYTE)	NOT NULL,
	RIMG_FILE_NAME	            VARCHAR2(50 BYTE)	NOT NULL
);

-- 레시피 추천 : 사용자(FK), 레시피 번호(FK)
CREATE TABLE RECOMMAND (
    RECOMMAND_NO                NUMBER              NOT NULL,
	PER_NO	                    NUMBER	            NOT NULL,
	RECIPE_NO	                NUMBER	            NOT NULL
);

-- QNA
CREATE TABLE QNA (
	QNA_NO	                    NUMBER	            NOT NULL,
	TITLE	                    VARCHAR2(100 BYTE)	NOT NULL,
	CONTENT	                    CLOB	                NULL,
	WRITE_AT	                TIMESTAMP	            NULL,
	QNA_REPLY	                VARCHAR2(1000 BYTE)	    NULL,
    PER_NO                      NUMBER              NOT NULL    
);

-- 탈퇴 (탈퇴한 아이디로 재가입이 불가능)
CREATE TABLE LEAVE_PERSON (
    LEAVE_PER_NO                NUMBER              NOT NULL,
	ID	                        VARCHAR2(20 BYTE)	NOT NULL UNIQUE,
	EMAIL	                    VARCHAR2(20 BYTE)	    NULL,
	JOINED_AT	                DATE	                NULL,
	LEAVE_AT	                DATE	                NULL
);

-- 휴먼 계정
CREATE TABLE SLEEP_PERSON (
	ID	                        VARCHAR2(20 BYTE)	NOT NULL UNIQUE,
    SLEEP_PER_NO                NUMBER              NOT NULL,
	PW	                        VARCHAR2(20 BYTE)	NOT NULL,
	PHONENO	                    NUMBER	            NOT NULL,
	POST_ADDRESS	            VARCHAR2(5 BYTE)	    NULL,
	ROAD_ADDRESS	            VARCHAR2(100 BYTE)	    NULL,
	JIBUN_ADDRESS	            VARCHAR2(100 BYTE)	    NULL,
	DETAIL_ADDRESS	            VARCHAR2(100 BYTE)	NOT NULL,
	EMAIL	                    VARCHAR2(20 BYTE)	NOT NULL,
	GENDER	                    NUMBER	            NOT NULL,
	NAME	                    VARCHAR2(20 BYTE)	NOT NULL,
	AGGRECODE	                NUMBER	                NULL,
	JOINED_AT	                DATE	                NULL,
	SLEPT_AT	                DATE	                NULL
);

-- 레시피 게시판
CREATE TABLE RECIPE (
	RECIPE_NO	                NUMBER	            NOT NULL,       -- PK
	ID	                        VARCHAR2(20 BYTE)	NOT NULL UNIQUE,
	TITLE	                    VARCHAR2(100 BYTE)	NOT NULL,
	TOOL	                    VARCHAR2(1000 BYTE) 	NULL,
	CONTENT1	                VARCHAR2(200 BYTE)	    NULL,
	CONTENT2	                CLOB	            NOT NULL,
	WRITE_AT	                TIMESTAMP	            NULL,
	MODIFIED_AT	                TIMESTAMP	            NULL
);

-- 레시피 댓글 게시판 : 댓글번호, 레시피번호(fk), 작성자(FK), 내용, 작성일
CREATE TABLE RECIPE_REPLY (
	REPLY_NO	                NUMBER	            NOT NULL,       -- PK
	CONTENT	                    VARCHAR2(1000 BYTE)	    NULL,
	GROUP_NO	                NUMBER	            NOT NULL,
    GROUP_ORDER                 NUMBER              NOT NULL,
	DEPTH	                    NUMBER	                NULL,
	WRITE_AT	                DATE	                NULL,
	RE_WRITE_AT	                DATE	                NULL,
	ID	                        VARCHAR2(20 BYTE)	NOT NULL UNIQUE,
    RECIPE_NO                   NUMBER              NOT NULL        -- FK
);

--------------------------- PK ---------------------------

ALTER TABLE PRODUCT
  ADD CONSTRAINT PK_PRODUCT 
      PRIMARY KEY (PROD_CODE);

ALTER TABLE SALE 
  ADD CONSTRAINT PK_SALE
      PRIMARY KEY (SALE_NO);
      
ALTER TABLE PIMG 
  ADD CONSTRAINT PK_PIMG
      PRIMARY KEY (PIMG_NO);

ALTER TABLE PERSON 
  ADD CONSTRAINT PK_PERSON
      PRIMARY KEY (PER_NO);
      
ALTER TABLE CART 
  ADD CONSTRAINT PK_CART
      PRIMARY KEY (CART_NO);
      
ALTER TABLE RIMG 
  ADD CONSTRAINT PK_RIMG
      PRIMARY KEY (RIMG_NO);
      
ALTER TABLE RECOMMAND 
  ADD CONSTRAINT PK_RECOMMAND
      PRIMARY KEY (RECOMMAND_NO);
      
ALTER TABLE QNA
  ADD CONSTRAINT PK_QNA
      PRIMARY KEY (QNA_NO);
      
ALTER TABLE LEAVE_PERSON 
  ADD CONSTRAINT PK_LEAVE_PERSON 
      PRIMARY KEY (LEAVE_PER_NO);
      
ALTER TABLE SLEEP_PERSON
  ADD CONSTRAINT PK_SLEEP_PERSON 
      PRIMARY KEY (SLEEP_PER_NO);
      
ALTER TABLE RECIPE 
  ADD CONSTRAINT PK_RECIPE
      PRIMARY KEY (RECIPE_NO);

ALTER TABLE RECIPE_REPLY
  ADD CONSTRAINT PK_REPLY_NO 
      PRIMARY KEY (REPLY_NO);

ALTER TABLE BASKET
  ADD CONSTRAINT PK_BASKET_NO
      PRIMARY KEY (BASKET_NO);

ALTER TABLE ORDER_TBL
  ADD CONSTRAINT PK_ORDER_NO
      PRIMARY KEY (ORDER_NO);
      
ALTER TABLE ORDER_DETAIL
  ADD CONSTRAINT PK_O_D_NO
      PRIMARY KEY (O_D_NO);
      
-------------------------- FK ------------------------------------


ALTER TABLE SALE 
  ADD CONSTRAINT FK_PRODUCT FOREIGN KEY (PROD_CODE)
      REFERENCES PRODUCT (PROD_CODE);

ALTER TABLE PIMG
  ADD CONSTRAINT FK_PRODUCT1 FOREIGN KEY (PROD_CODE)
      REFERENCES PRODUCT (PROD_CODE);

ALTER TABLE CART
  ADD CONSTRAINT FK_PRODUCT2 FOREIGN KEY (PROD_CODE)
      REFERENCES PRODUCT (PROD_CODE);

ALTER TABLE QNA
  ADD CONSTRAINT FK_PERSON FOREIGN KEY (PER_NO)
      REFERENCES PERSON (PER_NO);
      
ALTER TABLE RECIPE
  ADD CONSTRAINT FK_PERSON1 FOREIGN KEY (ID)
      REFERENCES PERSON (ID);
      
ALTER TABLE RECIPE_REPLY
  ADD CONSTRAINT FK_PERSON2 FOREIGN KEY (ID)
      REFERENCES PERSON (ID);

ALTER TABLE RECOMMAND 
  ADD CONSTRAINT FK_PERSON3 FOREIGN KEY (PER_NO)
      REFERENCES PERSON (PER_NO);
      
ALTER TABLE RECIPE_REPLY
  ADD CONSTRAINT FK_RECIPE FOREIGN KEY (RECIPE_NO)
      REFERENCES RECIPE (RECIPE_NO);
      
ALTER TABLE RECOMMAND
  ADD CONSTRAINT FK_RECIPE2 FOREIGN KEY (RECIPE_NO)
      REFERENCES RECIPE (RECIPE_NO);
      
ALTER TABLE RIMG
  ADD CONSTRAINT FK_RECIPE3 FOREIGN KEY (RECIPE_NO)
      REFERENCES RECIPE (RECIPE_NO);
      
ALTER TABLE BASKET
  ADD CONSTRAINT FK_CART_NO FOREIGN KEY (CART_NO)
      REFERENCES CART (CART_NO);

ALTER TABLE BASKET
  ADD CONSTRAINT FK_PROD_CODE FOREIGN KEY (PROD_CODE)
      REFERENCES PRODUCT (PROD_CODE);
      
ALTER TABLE ORDER_TBL
  ADD CONSTRAINT FK_BASKET_NO1 FOREIGN KEY (BASKET_NO)
      REFERENCES BASKET (BASKET_NO);
      
ALTER TABLE ORDER_TBL
  ADD CONSTRAINT FK_PER_NO1 FOREIGN KEY (PER_NO)
      REFERENCES PERSON (PER_NO);
      
ALTER TABLE ORDER_DETAIL
    ADD CONSTRAINT FK_ORDER_NO1 FOREIGN KEY (ORDER_NO)
        REFERENCES ORDER_TBL (ORDER_NO);

ALTER TABLE ORDER_DETAIL
  ADD CONSTRAINT FK_PROD_CODE2 FOREIGN KEY (PROD_CODE)
      REFERENCES PRODUCT (PROD_CODE);
      

