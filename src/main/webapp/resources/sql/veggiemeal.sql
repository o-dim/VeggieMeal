DROP TABLE FAST_ORDER_DETAIL;
DROP TABLE ORDER_TBL;
DROP TABLE CART_DETAIL;
DROP TABLE RECIPE_REPLY;
DROP TABLE SLEEP_PERSON;
DROP TABLE LEAVE_PERSON;
DROP TABLE QNA_ANSWER;
DROP TABLE QNA;
DROP TABLE RECOMMAND;
DROP TABLE CART;
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
   PROD_CODE                       NUMBER               NOT NULL, -- 제품코드
   SALE_TITLE                    VARCHAR2(100 BYTE)       NULL, -- 제품이름
   SALE_CONTENT                  VARCHAR2(100 BYTE)       NULL, 
   SALE_PRICE                    NUMBER                   NULL  -- 제품가격
);

-- 상품이미지 : 상품이미지번호, 상품코드, 경로, 파일명, 메인이미지 ( 대표이미지라면1, 아니면0)
CREATE TABLE PIMG (
   PIMG_NO                       NUMBER               NOT NULL,
   PIMG_PATH                       VARCHAR2(100 BYTE)   NOT NULL,
   PIMG_FILE                       VARCHAR2(50 BYTE)    NOT NULL,
   PROD_CODE                       NUMBER               NOT NULL,
   PIMG_MAIN_IMG                  NUMBER               NOT NULL
);

-- 회원(탈퇴,휴면)
CREATE TABLE PERSON (
   PER_NO                         NUMBER               NOT NULL,
   PW                           VARCHAR2(100 BYTE)   NOT NULL,
   PHONENO                      CLOB                   NOT NULL,
   POST_CODE                     VARCHAR2(5 BYTE)           NULL,
   ROAD_ADDRESS                  VARCHAR2(100 BYTE)       NULL,
   JIBUN_ADDRESS                  VARCHAR2(100 BYTE)       NULL,
   DETAIL_ADDRESS               VARCHAR2(100 BYTE)       NULL,
   EMAIL                          VARCHAR2(20 BYTE)    NOT NULL,
   GENDER                       VARCHAR2(10 BYTE)        NULL,
   NAME                          VARCHAR2(20 BYTE)        NULL,
   JOINED_AT                      DATE                       NULL,
   ID                           VARCHAR2(20 BYTE)    NOT NULL UNIQUE
);

-- 장바구니 : 장바구니번호, 장바구니에담은개수, 사용자번호(정보), 판매번호(판매정보,제품코드)
CREATE TABLE CART_DETAIL (
    CART_DETAIL_NO             NUMBER               NOT NULL, --PK
    COUNT                      NUMBER               NOT NULL,
    SALE_NO                    NUMBER               NOT NULL,
    CART_NO                    NUMBER               NOT NULL
);

-- 
CREATE TABLE CART (
    CART_NO                    NUMBER               NOT NULL,
    CREATED_AT                 DATE                     NULL,
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

-- 레시피 추천 : 사용자(FK), 레시피 번호(FK)
CREATE TABLE RECOMMAND (
   RECOMMAND_NO                NUMBER                 NOT NULL,
   PER_NO                      NUMBER               NOT NULL,
   RECIPE_NO                   NUMBER               NOT NULL
);

-- QNA
CREATE TABLE QNA (
   QNA_NO                       NUMBER               NOT NULL,
   TITLE                          VARCHAR2(100 BYTE)   NOT NULL,
   CONTENT                      CLOB                       NULL,
   WRITE_AT                      TIMESTAMP                NULL,
   ID                             VARCHAR2(20 BYTE)    NOT NULL UNIQUE  
);

-- QNA
CREATE TABLE QNA_ANSWER (
   TITLE                       VARCHAR2(100 BYTE)   NOT NULL,
   CONTENT                     CLOB                      NULL,
   ANSWER_AT                   TIMESTAMP                  NULL,
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

-- 휴면 계정
CREATE TABLE SLEEP_PERSON (
   SLEEP_PER_NO                   NUMBER              NOT NULL,
   ID                           VARCHAR2(20 BYTE)   NOT NULL UNIQUE,
   PW                           VARCHAR2(100 BYTE)  NOT NULL,
   PHONENO                      CLOB                  NOT NULL,
   POST_CODE                      VARCHAR2(5 BYTE)          NULL,
   ROAD_ADDRESS                   VARCHAR2(100 BYTE)      NULL,
   JIBUN_ADDRESS                  VARCHAR2(100 BYTE)      NULL,
   DETAIL_ADDRESS               VARCHAR2(100 BYTE)      NULL,
   EMAIL                          VARCHAR2(20 BYTE)   NOT NULL,
   GENDER                       NUMBER                  NULL,
   NAME                          VARCHAR2(20 BYTE)   NOT NULL,
   JOINED_AT                      DATE                      NULL,
   SLEPT_AT                      DATE                      NULL
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
   MODIFIED_AT                TIMESTAMP               NULL,
   IMG_FILE_NAME             VARCHAR2(50 BYTE)  NOT NULL
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
      
ALTER TABLE CART 
  ADD CONSTRAINT PK_CART
      PRIMARY KEY (CART_NO);
      
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
      
ALTER TABLE CART
    ADD CONSTRAINT FK_PERSON  FOREIGN KEY (PER_NO)
        REFERENCES PERSON (PER_NO);
        
ALTER TABLE CART_DETAIL
    ADD CONSTRAINT FK_SALE FOREIGN KEY (SALE_NO)
        REFERENCES SALE (SALE_NO);
        
ALTER TABLE CART_DETAIL
  ADD CONSTRAINT FK_CART FOREIGN KEY (CART_NO)
      REFERENCES CART (CART_NO);
      



INSERT INTO PERSON VALUES (
    PERSON_SEQ.NEXTVAL,
    'B28FFB70BEAABE4EE42FBD 5579E60A2C81ADE1E6FB5647740EB9273F1E3E4E0',
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
    'B28FFB70BEAABE4EE42FBD 5579E60A2C81ADE1E6FB5647740EB9273F1E3E4E0',
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
    'B28FFB70BEAABE4EE42FBD 5579E60A2C81ADE1E6FB5647740EB9273F1E3E4E0',
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
); INSERT INTO PERSON VALUES (
    PERSON_SEQ.NEXTVAL,
    'B28FFB70BEAABE4EE42FBD 5579E60A2C81ADE1E6FB5647740EB9273F1E3E4E0',
    '01011111119',
    '11312',
    '나보카도',
    '아보카도',
    '보보',
    'avocado@gmail.com',
    1,
    '아보카',
    SYSDATE,
    'avocado1'
); 
INSERT INTO PERSON VALUES (
    PERSON_SEQ.NEXTVAL,
    'B28FFB70BEAABE4EE42FBD 5579E60A2C81ADE1E6FB5647740EB9273F1E3E4E0',
    '01011111119',
    '11312',
    '나보카도',
    '아보카도',
    '보보',
    'avocado@gmail.com',
    1,
    '아보카',
    SYSDATE,
    'avocado2'
); 
INSERT INTO PERSON VALUES (
    PERSON_SEQ.NEXTVAL,
    'B28FFB70BEAABE4EE42FBD 5579E60A2C81ADE1E6FB5647740EB9273F1E3E4E0',
    '01011111119',
    '11312',
    '나보카도',
    '아보카도',
    '보보',
    'avocado@gmail.com',
    1,
    '아보카',
    SYSDATE,
    'avocado3'
); 
INSERT INTO PERSON VALUES (
    PERSON_SEQ.NEXTVAL,
    'B28FFB70BEAABE4EE42FBD 5579E60A2C81ADE1E6FB5647740EB9273F1E3E4E0',
    '01011111119',
    '11312',
    '나보카도',
    '아보카도',
    '보보',
    'avocado@gmail.com',
    1,
    '아보카',
    SYSDATE,
    'avocado4'
); 
INSERT INTO PERSON VALUES (
    PERSON_SEQ.NEXTVAL,
    'B28FFB70BEAABE4EE42FBD 5579E60A2C81ADE1E6FB5647740EB9273F1E3E4E0',
    '01011111119',
    '11312',
    '나보카도',
    '아보카도',
    '보보',
    'avocado@gmail.com',
    1,
    '아보카',
    SYSDATE,
    'avocado5'
); 
INSERT INTO PERSON VALUES (
    PERSON_SEQ.NEXTVAL,
    'B28FFB70BEAABE4EE42FBD 5579E60A2C81ADE1E6FB5647740EB9273F1E3E4E0',
    '01011111119',
    '11312',
    '나보카도',
    '아보카도',
    '보보',
    'avocado@gmail.com',
    1,
    '아보카',
    SYSDATE,
    'avocado6'
); 
INSERT INTO PERSON VALUES (
    PERSON_SEQ.NEXTVAL,
    'B28FFB70BEAABE4EE42FBD 5579E60A2C81ADE1E6FB5647740EB9273F1E3E4E0',
    '01011111119',
    '11312',
    '나보카도',
    '아보카도',
    '보보',
    'avocado@gmail.com',
    1,
    '아보카',
    SYSDATE,
    'avocado7'
); 
INSERT INTO PERSON VALUES (
    PERSON_SEQ.NEXTVAL,
    'B28FFB70BEAABE4EE42FBD 5579E60A2C81ADE1E6FB5647740EB9273F1E3E4E0',
    '01011111119',
    '11312',
    '나보카도',
    '아보카도',
    '보보',
    'avocado@gmail.com',
    1,
    '아보카',
    SYSDATE,
    'avocado8'
); 
INSERT INTO PERSON VALUES (
    PERSON_SEQ.NEXTVAL,
    'B28FFB70BEAABE4EE42FBD 5579E60A2C81ADE1E6FB5647740EB9273F1E3E4E0',
    '01011111119',
    '11312',
    '나보카도',
    '아보카도',
    '보보',
    'avocado@gmail.com',
    1,
    '아보카',
    SYSDATE,
    'avocado9'
); 
INSERT INTO PERSON VALUES (PERSON_SEQ.NEXTVAL, 'B28FFB70BEAABE4EE42FBD 5579E60A2C81ADE1E6FB5647740EB9273F1E3E4E0', '01011111123', '11223', '감자도리', '감자링', '감자감자', 'potato@gmail.com', null, '박감자', SYSDATE, 'potato');
INSERT INTO PERSON VALUES (PERSON_SEQ.NEXTVAL, 'B28FFB70BEAABE4EE42FBD 5579E60A2C81ADE1E6FB5647740EB9273F1E3E4E0', '01011111124', '11224', '당', '당근이', '당근냠', 'carrot@gmail.com', null, '당당근', SYSDATE, 'carrot');


 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '고수',       '/storage\\product', 'V_01.PNG', 12000, 20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '깻잎',       '/storage\\product', 'V_02.PNG', 10000, 20);
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '땅콩',       '/storage\\product', 'V_03.PNG', 8500,  20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '양배추',     '/storage\\product', 'V_05.PNG', 10000, 20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '오이',       '/storage\\product', 'V_07.PNG', 20000, 20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '마늘',       '/storage\\product', 'V_32.PNG', 16000, 20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '그린빈',     '/storage\\product', 'V_21.PNG', 15000, 20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '가지',       '/storage\\product', 'V_11.PNG', 10000, 20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '호박고구마', '/storage\\product', 'V_38.PNG', 11000, 20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '청포도',     '/storage\\product', 'F_01.JPG', 12000, 20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '천도복숭아', '/storage\\product', 'F_05.PNG', 11000, 20);
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '산딸기',     '/storage\\product', 'F_08.PNG', 9500,  20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '청사과',     '/storage\\product', 'F_10.PNG', 10000, 20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '수박',       '/storage\\product', 'F_11.PNG', 20000, 20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '모과',       '/storage\\product', 'F_15.PNG', 12000, 20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '딸기',       '/storage\\product', 'F_16.PNG', 13000, 20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '비파',       '/storage\\product', 'F_18.PNG', 12000, 20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '참다래',     '/storage\\product', 'F_21.PNG', 15000, 20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '피클용오이', '/storage\\product', 'V_15.PNG', 12000, 20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '순무',       '/storage\\product', 'V_26.PNG', 11000, 20);
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '옥수수',     '/storage\\product', 'V_37.PNG', 9500,  20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '무우',       '/storage\\product', 'V_39.PNG', 10000, 20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '파프리카',   '/storage\\product', 'V_41.PNG', 10000, 20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '양송이버섯', '/storage\\product', 'V_43.PNG', 12000, 20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '브로콜리',   '/storage\\product', 'V_42.PNG', 10000, 20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '표고버섯',   '/storage\\product', 'V_36.PNG', 12000, 20); 
 INSERT INTO PRODUCT VALUES (PROD_SEQ.NEXTVAL, '여주',       '/storage\\product', 'V_24.PNG', 15000, 20); 
 COMMIT;
 
INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 1, '싸움고수', '고수 중의 고수입니다. 검거하는 동안 몸부림이 장난 아니었습니다.', 14000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 2, '깻잎', '남해에서 포획한 깻잎을 야무지게 입으로 검거해주세요.', 12000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 3, '땅땅콩콩', '제주도에서 잡아온 땅콩입니다. 역시 작은 땅콩이 더 고소합니다.', 17000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 4, '양배추', '양구의 자랑 양배추입니다.', 14000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 5, '오이', '전국 각지에서 데려온 오이', 14000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 6, '너마늘사랑해', '너, 나, 우리 모두 마늘 사랑해', 14000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 7, '그린빈', '그린빈 념념 굿입니다.', 17000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 8, '가지', '가지는 밥 경찰이 아닙니다. 그저 검거대상이죠.', 11000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 9, '호박고구마', '어머님, 마트.. 다녀오셨어요?의 그 호박고구마! 입니다.', 13500);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL,10, '청포도', '단연코 샤인머스켓보다 맛있습니다', 14000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 11, '천도복숭아', '앗뜨거 복숭아', 13000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 12, '산딸기', '입 안에서 톡톡 산딸기', 12500);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 13, '청사과', '초여름 향기 가득 머금은 청사과', 14000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 14, '수박', '달콤한 수박 맛보세요!', 24000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 15, '모과', '여름 감기 빨리 낫게하는 모과', 14000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 16, '딸기', '논산에서 가장 유명한 신家네 딸기입니다. 실한 놈들만 잡아들였습니다.', 17000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 17, '비파', '개그맨도 추천한 그 과일! 비파입니다.', 13000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 18, '참다래', '참다래가 키위보다 맛있습니다', 20000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 19, '피클용오이', '피클용 오이의 아삭함을 느껴보세요', 14000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 20, '순무', '무우 잡으러 갔다가 덤으로 잡아왔습니다.', 13000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 21, '옥수수', '강원도 옥수수(강냉이)입니다. 제 강냉이도 위험했습니다.', 12500);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 22, '무우', '무우, 무우 울면서 잡힌 무우입니다.', 14000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 23, '팟프리카', '팟프리카 단면 보고 조금 무서웠습니다만 안전하게 검거했습니다.', 12000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 24, '양송이버섯', '양송이버섯을 구울 때 나오는 물은 그냥 물입니다..', 14000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 25, '브로콜리', '시장에서 판매되는 보리꼬리와 같은 품종입니다.', 12000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 26, '표고버섯', '진도산 표고버섯! 다시는 안 올 기회 잡아보시겠어요?', 13000);
 INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, 27, '여주', '당뇨에 좋은 여주입니다.', 20000);
COMMIT;

INSERT INTO RECIPE VALUES(RECIPE_SEQ.NEXTVAL, 'mango', '버섯 꼬치구이', 
'오늘은 간단하지만, 매력이 솔솔 넘치는  버섯꼬치구이로 인사드립니다. 지금 한창 표고버섯이 고기만큼 맛있어서
사실 어떻게 요리해도 맛있습니다~~ 하여, 간단한 술안주로 양보도 해봅니다ㅎㅎ 유난히 씹는 질감이 좋은 버섯에 
매콤달콤한 양념에 발라 구웠더니 매력넘치는 술안주가 되었습니다ㅎㅎ', 
'재료: 표고버섯5개, 대파3대(흰부분)                        바름장: 고추장1작은술, 매실청1큰술, 간장1작은술,설탕1작은술, 참기름1작은술,통깨약간', 
'1. 준비: 표고버섯은 기둥을 떼어내고 갓만 준비한다.도톰하게 편썰어준다. 
꼬치에 꿰어지는 두께는 되어야 합니당ㅎㅎ 
(표고버섯이 아니여도 새송이버섯도 잘 어울릴듯합니다~) 
대파는 떨어져서 오늘 1단사왔어요 굵기가 굵은것만 골라 흰대부분만 사용합니다. 
너무 굵은 부분은 반갈라서 준비합니다. (양파도 곁들여도 좋습니다~참조) 
2. 꼬치에 꿰기 대파, 버섯 , 대파 순으로 꽂아줍니다. 대파보다 버섯이 단단해서 버섯을 끝쪽으로 가게 하면 좋더군요ㅎㅎ 버섯5개일뿐인데..
꼬치로 만드니 양이 많아져 보이네요~~ 모양이쁜 꼬치로 넣으려니 넘 굵더군요ㅠㅠ 하여, 산적꼬치로 바꿔 꿰였다는ㅎㅎㅎ', SYSTIMESTAMP, SYSTIMESTAMP, 'r_12.png');
INSERT INTO RECIPE VALUES(RECIPE_SEQ.NEXTVAL, 'grape', '바게트 부르스게타', '너무너무많이들어가', '끝나고', '뭐먹지', SYSTIMESTAMP, SYSTIMESTAMP, 'r_11.png');
INSERT INTO RECIPE VALUES(RECIPE_SEQ.NEXTVAL, 'avocado', '감자뇨끼', '너무너무많이들어가', '끝나고', '뭐먹지', SYSTIMESTAMP, SYSTIMESTAMP, 'r_16.png');
INSERT INTO RECIPE VALUES(RECIPE_SEQ.NEXTVAL, 'avocado1', '암것도안대zxc', '너무너무많이들어가', '끝나고', '뭐먹지', SYSTIMESTAMP, SYSTIMESTAMP, 'r_29.png');
INSERT INTO RECIPE VALUES(RECIPE_SEQ.NEXTVAL, 'avocado2', '암것도안대zxc', '너무너무많이들어가', '끝나고', '뭐먹지', SYSTIMESTAMP, SYSTIMESTAMP, 'r_31.png');
INSERT INTO RECIPE VALUES(RECIPE_SEQ.NEXTVAL, 'avocado3', '암것도안대az', '너무너무많이들어가', '끝나고', '뭐먹지', SYSTIMESTAMP, SYSTIMESTAMP, 'r_27.png');
INSERT INTO RECIPE VALUES(RECIPE_SEQ.NEXTVAL, 'avocado4', '암것도안대zz', '너무너무많이들어가', '끝나고', '뭐먹지', SYSTIMESTAMP, SYSTIMESTAMP, 'r_15.png');
INSERT INTO RECIPE VALUES(RECIPE_SEQ.NEXTVAL, 'avocado5', '암것도안대zz', '너무너무많이들어가', '끝나고', '뭐먹지', SYSTIMESTAMP, SYSTIMESTAMP, 'r_08.png');
INSERT INTO RECIPE VALUES(RECIPE_SEQ.NEXTVAL, 'avocado6', '암것도안대zz', '너무너무많이들어가', '끝나고', '뭐먹지', SYSTIMESTAMP, SYSTIMESTAMP, 'r_10.png');
INSERT INTO RECIPE VALUES(RECIPE_SEQ.NEXTVAL, 'avocado7', '암것도안대zz', '너무너무많이들어가', '끝나고', '뭐먹지', SYSTIMESTAMP, SYSTIMESTAMP, 'r_22.png');
INSERT INTO RECIPE VALUES(RECIPE_SEQ.NEXTVAL, 'avocado8', '암것도안대zz', '너무너무많이들어가', '끝나고', '뭐먹지', SYSTIMESTAMP, SYSTIMESTAMP, 'r_24.png');
INSERT INTO RECIPE VALUES(RECIPE_SEQ.NEXTVAL, 'avocado9', '암것도안대zz', '너무너무많이들어가', '끝나고', '뭐먹지', SYSTIMESTAMP, SYSTIMESTAMP, 'r_30.png');
COMMIT;

INSERT INTO CART VALUES(CART_SEQ.NEXTVAL, '20230515', 1);
INSERT INTO CART VALUES(CART_SEQ.NEXTVAL, '20230516', 2);
INSERT INTO CART VALUES(CART_SEQ.NEXTVAL, '20230517', 3);
INSERT INTO CART VALUES(CART_SEQ.NEXTVAL, '20230518', 4);
INSERT INTO CART VALUES(CART_SEQ.NEXTVAL, '20230519', 5);
INSERT INTO CART VALUES(CART_SEQ.NEXTVAL, '20230520', 6);
INSERT INTO CART VALUES(CART_SEQ.NEXTVAL, '20230521', 7);
INSERT INTO CART VALUES(CART_SEQ.NEXTVAL, '20230522', 8);
INSERT INTO CART VALUES(CART_SEQ.NEXTVAL, '20230523', 9);
INSERT INTO CART VALUES(CART_SEQ.NEXTVAL, '20230524', 10);

INSERT INTO CART_DETAIL VALUES(CART_DETAIL_SEQ.NEXTVAL, 10, 1, 1);
INSERT INTO CART_DETAIL VALUES(CART_DETAIL_SEQ.NEXTVAL, 10, 2, 2);
INSERT INTO CART_DETAIL VALUES(CART_DETAIL_SEQ.NEXTVAL, 10, 3, 3);
INSERT INTO CART_DETAIL VALUES(CART_DETAIL_SEQ.NEXTVAL, 10, 4, 4);
INSERT INTO CART_DETAIL VALUES(CART_DETAIL_SEQ.NEXTVAL, 10, 5, 5);
INSERT INTO CART_DETAIL VALUES(CART_DETAIL_SEQ.NEXTVAL, 10, 6, 6);
INSERT INTO CART_DETAIL VALUES(CART_DETAIL_SEQ.NEXTVAL, 10, 7, 7);
INSERT INTO CART_DETAIL VALUES(CART_DETAIL_SEQ.NEXTVAL, 10, 8, 8);
INSERT INTO CART_DETAIL VALUES(CART_DETAIL_SEQ.NEXTVAL, 10, 9, 9);
INSERT INTO CART_DETAIL VALUES(CART_DETAIL_SEQ.NEXTVAL, 10, 10, 10);

COMMIT;

INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL, '감자가 갈색', '감자가 갈색이라니 정상인가요?', TO_DATE('20210520', 'YYYYMMDD'), 'DrPotato1');
INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL, '고구마 투머치', '고구마가 너무 달아요', TO_DATE('20210522', 'YYYYMMDD'), 'Sweetpotato1');
INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL, '오이소박이는', '오이소박이가 박박맛있네요', TO_DATE('20210524', 'YYYYMMDD'), 'good');
INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL, '당근런', '당근이 도망갔어요 환불해주시나요?', TO_DATE('20210607', 'YYYYMMDD'), 'VegeRun');
INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL, '애호박은 우리애', '애가 참 좋아하네요 ', TO_DATE('20210619', 'YYYYMMDD'), 'child');
INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL, '양상추가 상했어요', '상하면 맛있어', TO_DATE('20210620', 'YYYYMMDD'), 'sangham');
COMMIT;
