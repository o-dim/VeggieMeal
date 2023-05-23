DROP TABLE FAST_ORDER_DETAIL;
DROP TABLE ORDER_TBL;
DROP TABLE CART_DETAIL;
DROP TABLE RECIPE_REPLY;
DROP TABLE SLEEP_PERSON;
DROP TABLE LEAVE_PERSON;
DROP TABLE QNA_ANSWER;
DROP TABLE QNA;
DROP TABLE RECOMMAND;
DROP TABLE RIMG;
DROP TABLE CART_TBL;
DROP TABLE PIMG;
DROP TABLE SALE;
DROP TABLE PRODUCT;
DROP TABLE RECIPE;
DROP TABLE PERSON;


DROP SEQUENCE PROD_SEQ;
CREATE SEQUENCE PROD_SEQ NOCACHE;
DROP SEQUENCE SALE_SEQ;
CREATE SEQUENCE SALE_SEQ NOCACHE;
DROP SEQUENCE PIMG_SEQ;
CREATE SEQUENCE PIMG_SEQ NOCACHE;
DROP SEQUENCE PERSON_SEQ;
CREATE SEQUENCE PERSON_SEQ NOCACHE;
DROP SEQUENCE CART_SEQ;
CREATE SEQUENCE CART_SEQ NOCACHE;
DROP SEQUENCE CART_DETAIL_SEQ;
CREATE SEQUENCE CART_DETAIL_SEQ NOCACHE;
DROP SEQUENCE ORDER_TBL_SEQ;
CREATE SEQUENCE ORDER_TBL_SEQ NOCACHE;
DROP SEQUENCE FAST_ORDER_DETAIL_SEQ;
CREATE SEQUENCE FAST_ORDER_DETAIL_SEQ NOCACHE;
DROP SEQUENCE RIMG_SEQ;
CREATE SEQUENCE RIMG_SEQ NOCACHE;
DROP SEQUENCE RECOMMAND_SEQ;
CREATE SEQUENCE RECOMMAND_SEQ NOCACHE;
DROP SEQUENCE QNA_SEQ;
CREATE SEQUENCE QNA_SEQ NOCACHE;
DROP SEQUENCE QNA_ANSWER_SEQ;
CREATE SEQUENCE QNA_ANSWER_SEQ NOCACHE;
DROP SEQUENCE LEAVE_PERSON_SEQ;
CREATE SEQUENCE LEAVE_PERSON_SEQ NOCACHE;
DROP SEQUENCE SLEEP_PERSON_SEQ;
CREATE SEQUENCE SLEEP_PERSON_SEQ NOCACHE;
DROP SEQUENCE RECIPE_SEQ;
CREATE SEQUENCE RECIPE_SEQ NOCACHE;
DROP SEQUENCE RECIPE_REPLY_SEQ;
CREATE SEQUENCE RECIPE_REPLY_SEQ NOCACHE;

-- 상품 : 상품코드(번호), 상품명, 대표이미지경로, 대표이미지이름, 원가, 재고수량

-- 관리자 페이지
CREATE TABLE PRODUCT (
   PROD_CODE                   NUMBER               NOT NULL,
   PROD_NAME                   VARCHAR2(100 BYTE)   NOT NULL,
   PROD_PATH                   VARCHAR2(100 BYTE)   NOT NULL,
   PROD_IMG_NAME               VARCHAR2(100 BYTE)   NOT NULL,
   PROD_ORIGIN_PRICE           NUMBER                   NULL,
   PROD_STOCK                  NUMBER                   NULL
);

-- 상품판매 (판매 원티드 페이지)
CREATE TABLE SALE (
   SALE_NO                       NUMBER               NOT NULL,
   PROD_CODE                   	 NUMBER               NOT NULL,
   SALE_TITLE                    VARCHAR2(100 BYTE)       NULL,
   SALE_CONTENT                  VARCHAR2(100 BYTE)       NULL,
   SALE_PRICE                    NUMBER                   NULL
);

-- 상품이미지 : 상품이미지번호, 상품코드, 경로, 파일명, 메인이미지 ( 대표이미지라면1, 아니면0)
CREATE TABLE PIMG (
   PIMG_NO                       NUMBER               NOT NULL,
   PIMG_PATH                   	 VARCHAR2(100 BYTE)   NOT NULL,
   PIMG_FILE                   	 VARCHAR2(50 BYTE)    NOT NULL,
   PROD_CODE                   	 NUMBER               NOT NULL,
   PIMG_MAIN_IMG              	 NUMBER               NOT NULL
);

-- 회원(탈퇴,휴면)
CREATE TABLE PERSON (
   PER_NO                      	NUMBER               NOT NULL,
   PW                           VARCHAR2(100 BYTE)   NOT NULL,
   PHONENO                      CLOB               	 NOT NULL,
   POST_CODE               		VARCHAR2(5 BYTE)       	 NULL,
   ROAD_ADDRESS               	VARCHAR2(100 BYTE)       NULL,
   JIBUN_ADDRESS               	VARCHAR2(100 BYTE)       NULL,
   DETAIL_ADDRESS               VARCHAR2(100 BYTE)   NOT NULL,
   EMAIL                       	VARCHAR2(20 BYTE)    NOT NULL,
   GENDER                       VARCHAR2(10 BYTE)    NOT NULL,
   NAME                       	VARCHAR2(20 BYTE)    NOT NULL,
   JOINED_AT                   	DATE                   	 NULL,
   ID                           VARCHAR2(20 BYTE)    NOT NULL UNIQUE
);

-- 장바구니 : 장바구니번호, 장바구니에담은개수
CREATE TABLE CART_TBL (
    CART_NO                    NUMBER               NOT NULL,
    COUNT                      NUMBER               NOT NULL
);

-- 
CREATE TABLE CART_DETAIL (
    CART_DETAIL_NO             NUMBER               NOT NULL,
    CART_NO                    NUMBER               NOT NULL,
    PER_NO                     NUMBER               NOT NULL
);

-- 
CREATE TABLE ORDER_TBL (
    ORDER_NO                    NUMBER              NOT NULL,
    PER_NO                      NUMBER              NOT NULL,
    CART_DETAIL_NO              NUMBER              NOT NULL,
    TOTAL                       NUMBER              NOT NULL,
    FAST_ORDER                  NUMBER              NOT NULL
);

-- 바로주문 
CREATE TABLE FAST_ORDER_DETAIL (
    O_D_NO                      NUMBER              NOT NULL,
    ORDER_NO                    NUMBER              NOT NULL,
    PROD_CODE                   NUMBER              NOT NULL,
    COUNT                       NUMBER              NOT NULL
);


-- 레시피 이미지 게시판(사진 여러 개)
CREATE TABLE RIMG (
   RECIPE_NO                   NUMBER               NOT NULL,
   RIMG_NO                     NUMBER              	NOT NULL,
   RIMG_PATH                   VARCHAR2(100 BYTE)   NOT NULL,
   RIMG_ORIGIN_NAME            VARCHAR2(300 BYTE)   NOT NULL,
   RIMG_FILE_NAME              VARCHAR2(50 BYTE)   	NOT NULL
);

-- 레시피 추천 : 사용자(FK), 레시피 번호(FK)
CREATE TABLE RECOMMAND (
   RECOMMAND_NO                NUMBER              	NOT NULL,
   PER_NO                      NUMBER               NOT NULL,
   RECIPE_NO                   NUMBER               NOT NULL
);

-- QNA
CREATE TABLE QNA (
   QNA_NO                       NUMBER               NOT NULL,
   TITLE                       	VARCHAR2(100 BYTE)   NOT NULL,
   CONTENT                      CLOB                   	 NULL,
   WRITE_AT                   	TIMESTAMP                NULL,
   ID                          	VARCHAR2(20 BYTE)    NOT NULL UNIQUE  
);

-- QNA
CREATE TABLE QNA_ANSWER (
   TITLE                       VARCHAR2(100 BYTE)   NOT NULL,
   CONTENT                     CLOB                   	NULL,
   ANSWER_AT                   TIMESTAMP               	NULL,
   ID                          VARCHAR2(20 BYTE)    NOT NULL UNIQUE  
);

-- 탈퇴 (탈퇴한 아이디로 재가입이 불가능)
CREATE TABLE LEAVE_PERSON (
   LEAVE_PER_NO                NUMBER              NOT NULL,
   ID                          VARCHAR2(20 BYTE)   NOT NULL UNIQUE,
   EMAIL                       VARCHAR2(20 BYTE)       NULL,
   JOINED_AT                   DATE                    NULL,
   LEAVE_AT                    DATE                    NULL
);

-- 휴먼 계정
CREATE TABLE SLEEP_PERSON (
   SLEEP_PER_NO                	NUMBER              NOT NULL,
   ID                           VARCHAR2(20 BYTE)   NOT NULL UNIQUE,
   PW                           VARCHAR2(100 BYTE)  NOT NULL,
   PHONENO                      CLOB               	NOT NULL,
   POST_CODE               	 	VARCHAR2(5 BYTE)       	NULL,
   ROAD_ADDRESS                	VARCHAR2(100 BYTE)      NULL,
   JIBUN_ADDRESS               	VARCHAR2(100 BYTE)      NULL,
   DETAIL_ADDRESS               VARCHAR2(100 BYTE)  NOT NULL,
   EMAIL                       	VARCHAR2(20 BYTE)   NOT NULL,
   GENDER                       NUMBER              NOT NULL,
   NAME                       	VARCHAR2(20 BYTE)   NOT NULL,
   JOINED_AT                   	DATE                   	NULL,
   SLEPT_AT                   	DATE                   	NULL
);

-- 레시피 게시판
CREATE TABLE RECIPE (
   RECIPE_NO                  NUMBER              NOT NULL,
   ID                         VARCHAR2(20 BYTE)   NOT NULL UNIQUE,
   TITLE                      VARCHAR2(100 BYTE)  NOT NULL,
   TOOL                       VARCHAR2(1000 BYTE)     NULL,
   CONTENT1                   VARCHAR2(200 BYTE)      NULL,
   CONTENT2                   CLOB                NOT NULL,
   WRITE_AT                   TIMESTAMP               NULL,
   MODIFIED_AT                TIMESTAMP               NULL
);

-- 레시피 댓글 게시판 : 댓글번호, 레시피번호(fk), 작성자(FK), 내용, 작성일
CREATE TABLE RECIPE_REPLY (
   REPLY_NO                   NUMBER               NOT NULL,
   CONTENT                    VARCHAR2(1000 BYTE)      NULL,
   GROUP_NO                   NUMBER               NOT NULL,
   GROUP_ORDER                NUMBER               NOT NULL,
   DEPTH                      NUMBER                   NULL,
   WRITE_AT                   DATE                     NULL,
   RE_WRITE_AT                DATE                     NULL,
   ID                         VARCHAR2(20 BYTE)    NOT NULL UNIQUE,
   RECIPE_NO                  NUMBER               NOT NULL
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
      
ALTER TABLE CART_TBL 
  ADD CONSTRAINT PK_CART_TBL
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

ALTER TABLE CART_DETAIL
  ADD CONSTRAINT PK_CART_DETAIL_NO
      PRIMARY KEY (CART_DETAIL_NO);

ALTER TABLE ORDER_TBL
  ADD CONSTRAINT PK_ORDER_NO
      PRIMARY KEY (ORDER_NO);
      
ALTER TABLE FAST_ORDER_DETAIL
  ADD CONSTRAINT PK_O_D_NO
      PRIMARY KEY (O_D_NO);
      
-------------------------- FK ------------------------------------


ALTER TABLE SALE 
  ADD CONSTRAINT FK_PRODUCT FOREIGN KEY (PROD_CODE)
      REFERENCES PRODUCT (PROD_CODE);

ALTER TABLE PIMG
  ADD CONSTRAINT FK_PRODUCT1 FOREIGN KEY (PROD_CODE)
      REFERENCES PRODUCT (PROD_CODE);
      
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
      
ALTER TABLE CART_DETAIL
  ADD CONSTRAINT FK_CART_TBL FOREIGN KEY (CART_NO)
      REFERENCES CART_TBL (CART_NO);

ALTER TABLE CART_DETAIL
  ADD CONSTRAINT FK_PERSON4 FOREIGN KEY (PER_NO)
      REFERENCES PERSON (PER_NO);
      
ALTER TABLE ORDER_TBL
  ADD CONSTRAINT FK_CART_DETAIL FOREIGN KEY (CART_DETAIL_NO)
      REFERENCES CART_DETAIL (CART_DETAIL_NO);
      
ALTER TABLE ORDER_TBL
  ADD CONSTRAINT FK_PERSON5 FOREIGN KEY (PER_NO)
      REFERENCES PERSON (PER_NO);
      
ALTER TABLE FAST_ORDER_DETAIL
    ADD CONSTRAINT FK_FAST_ORDER_DETAIL FOREIGN KEY (ORDER_NO)
        REFERENCES ORDER_TBL (ORDER_NO);

ALTER TABLE FAST_ORDER_DETAIL
  ADD CONSTRAINT FK_PRODUCT2 FOREIGN KEY (PROD_CODE)
      REFERENCES PRODUCT (PROD_CODE);
      


INSERT INTO PERSON VALUES (
    PERSON_SEQ.NEXTVAL,
    'mango123!',
    '01011111113',
    '11111',
    '망고광역시',
    '망고동',
    '망망',
    'mango@gmail.com',
    1,
    '김망고',
    SYSDATE,
    'mango'
);



INSERT INTO PERSON VALUES (
    PERSON_SEQ.NEXTVAL,
    'grape123!',
    '01011111116',
    '11114',
    '포도',
    '포도동',
    '바바',
    'grape@gmail.com',
    2,
    '포도씨',
    SYSDATE,
    'grape'
);
INSERT INTO PERSON VALUES (
    PERSON_SEQ.NEXTVAL,
    'avocado123!',
    '01011111119',
    '11312',
    '나보카도',
    '아보카도',
    '보보',
    'avocado@gmail.com',
    1,
    '아보카',
    SYSDATE,
    'avocado'
); 


INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL, '감자', '감자가 갈색이라니 정상인가요?', TO_DATE('20230520', 'YYYYMMDD'), 'DrPotato1');
INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL, '고구마', '고구마가 너무 달아요', TO_DATE('20230522', 'YYYYMMDD'), 'Sweetpotato1');
INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL, '당근', '당근이 도망갔어요 환불해주시나요?', TO_DATE('20230519', 'YYYYMMDD'), 'VegeRun');
COMMIT;

INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '고수',       '/storage\\product', 'V_01.PNG', 12000, 20); 
INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '깻잎',       '/storage\\product', 'V_02.PNG', 10000, 20);
INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '땅콩',       '/storage\\product', 'V_03.PNG', 8500,  20); 
INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '양배추',     '/storage\\product', 'V_05.PNG', 10000, 20); 
INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '오이',       '/storage\\product', 'V_07.PNG', 20000, 20); 
INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '마늘',       '/storage\\product', 'V_32.PNG', 16000, 20); 
INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '그린빈',     '/storage\\product', 'V_21.PNG', 15000, 20); 
INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '가지',       '/storage\\product', 'V_11.PNG', 10000, 20);
INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '호박고구마', '/storage\\product', 'V_38.PNG', 12000, 20);
COMMIT;

INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 1, '맛 좋은 고수', '강화도 해풍 맞고 자란 고수', 14000);
INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 2, '깻잎', '남해에서 올라온 깻잎', 12000);
INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 3, '땅땅콩콩', '제주도에서 건너온 땅콩', 17000);
INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 4, '양배추', '양구의 자랑 양배추', 14000);
INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 5, '오이', '전국 각지에서 데려온 오이', 14000);
INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 6, '너마늘사랑해', '한국인의 요리에는 무조건 들어가는 마늘', 14000);
INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 7, '그린빈', '그린빈 맛있어요', 17000);
INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 8, '가지', '가지는 건강에 좋아요', 11000);
INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 9, '호박고구마', '호박고구마! 호박고구마!', 13500);
COMMIT;
