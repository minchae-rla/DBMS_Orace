-- 테이블 생성
CREATE TABLE TBL_MEMBER(
	MEMBER_NAME VARCHAR2(100),
	MEMBER_AGE NUMBER
);

SELECT * FROM TBL_MEMBER;

-- INSERT 문 : 데이터 추가
INSERT INTO TBL_MEMBER
VALUES ('김민채', 27);

INSERT INTO TBL_MEMBER
VALUES('신짱구', 5);

INSERT INTO TBL_MEMBER(MEMBER_NAME)
VALUES('유리');

INSERT INTO TBL_MEMBER(MEMBER_AGE, MEMBER_NAME)
VALUES(10, '철수');

SELECT  * FROM TBL_MEMBER;

-- 신짱구 -> 신짱아 변경(수정)
-- UPDATE : 수정
UPDATE TBL_MEMBER
SET MEMBER_NAME = '신짱아';

UPDATE TBL_MEMBER
SET MEMBER_NAME = '짱구'
WHERE MEMBER_AGE = 5;

SELECT * FROM TBL_MEMBER;

UPDATE TBL_MEMBER
SET MEMBER_NAME = '김민채'
WHERE MEMBER_AGE = 20;

UPDATE TBL_MEMBER
SET MEMBER_NAME = '철수'
WHERE MEMBER_AGE = 10;
-- WHERE절에 조건을 걸어주면 특정 행의 값만 변경된다

-- 삭제 : DELETE
DELETE FROM TBL_MEMBER
WHERE MEMBER_NAME = '신짱아';
-- WHERE절을 작성하면 특정 행의 데이터만 삭제한다

SELECT * FROM TBL_MEMBER;

DELETE FROM TBL_MEMBER;
-- WHERE 절을 생략하면 모든 행의 데이터가 지워진다(주의)

-- 학생테이블 생성
CREATE TABLE TBL_STUDENT(
	STUDENT_NUMBER NUMBER,
	STUDENT_NAME VARCHAR2(100),
	STUDENT_MAT NUMBER,
	STUDENT_KOR NUMBER,
	STUDENT_ENG NUMBER,
	STUDENT_GRADE VARCHAR2(100)
);

-- 항상 만들고 확인하기
SELECT * FROM TBL_STUDENT;

-- [실습]
-- 학생 테이블에 데이터 추가
-- 학생번호, 이름, 수학, 영어, 국어
-- 1, 김철수, 90 ,90, 90
-- 2, 홍길동, 70, 25, 55
-- 3, 이유리, 89, 91, 77
-- 4, 김웅이, 52, 100, 93
-- 5, 신짱구, 22, 71, 90

INSERT INTO TBL_STUDENT(STUDENT_NUMBER, STUDENT_NAME, STUDENT_MAT, STUDENT_ENG, STUDENT_KOR)
--VALUES (1, '김철수', 90 ,90, 90);
--VALUES (2, '홍길동', 70 ,25, 55);
--VALUES (3, '이유리', 89 ,91, 77);
--VALUES (4, '김웅이', 52 ,100, 93);
--VALUES (5, '신짱구', 22 ,71, 90);
--각각 한줄씩 주석처리하며 입력 또는
--INSERT INTO TBL_STUDENT(STUDENT_NUMBER, STUDENT_NAME, STUDENT_MAT, STUDENT_ENG, STUDENT_KOR)
--VALUES (1, '김철수', 90 ,90, 90);로 각 입력마다 INSERT INTO를 입력해줘야함

SELECT * FROM TBL_STUDENT;

-- 전체 학생의 이름과 평균 점수 조회하기(별칭)
SELECT STUDENT_NAME 이름, (STUDENT_MAT + STUDENT_ENG + STUDENT_KOR) / 3 AS "평균 점수" 
FROM TBL_STUDENT;

-- ROUND(값, 자리수) : 소수점을 반올림하여 특정 소수점까지만 표현한다
SELECT STUDENT_NAME 이름,
ROUND((STUDENT_MAT + STUDENT_ENG + STUDENT_KOR) / 3, 2) AS "평균 점수" 
FROM TBL_STUDENT;

-- [실습/과제]
-- 1. 학생의 평균
-- 학생의 평균점수에 따라 학점으로 수정
-- A : 90점이상
-- B : 80점이상 90점 미만
-- C : 50점이상 80점 미만
-- F : 50점 미만
UPDATE TBL_STUDENT
SET STUDENT_GRADE = 'A'
WHERE (STUDENT_MAT + STUDENT_ENG + STUDENT_KOR) / 3 >= 90;

UPDATE TBL_STUDENT
SET STUDENT_GRADE = 'B'
WHERE (STUDENT_MAT + STUDENT_ENG + STUDENT_KOR) / 3 >= 80
		AND (STUDENT_MAT + STUDENT_ENG + STUDENT_KOR) / 3 < 90;
	
UPDATE TBL_STUDENT
SET STUDENT_GRADE = 'C'
WHERE (STUDENT_MAT + STUDENT_ENG + STUDENT_KOR) / 3 >= 50
		AND (STUDENT_MAT + STUDENT_ENG + STUDENT_KOR) / 3 < 80;
	
UPDATE TBL_STUDENT
SET STUDENT_GRADE = 'F'
WHERE (STUDENT_MAT + STUDENT_ENG + STUDENT_KOR) / 3 < 50;

SELECT * FROM TBL_STUDENT;

-- 평균점수에 따라 학점 수정
UPDATE TBL_STUDENT 
SET STUDENT_GRADE = 
CASE
	WHEN (STUDENT_MAT + STUDENT_ENG + STUDENT_KOR) / 3 >= 90 THEN 'A'
	WHEN (STUDENT_MAT + STUDENT_ENG + STUDENT_KOR) / 3 >= 80 THEN 'B'
	WHEN (STUDENT_MAT + STUDENT_ENG + STUDENT_KOR) / 3 >= 50 THEN 'C'
	ELSE 'F'
END;


-- 2. 학점이 잘 들어갔는지 확인하기 위해서
-- 학생번호, 이름, 평균, 학점 조회하기(별칭넣기)
SELECT student_number 학생번호, student_name 이름,
ROUND((STUDENT_MAT + STUDENT_ENG + STUDENT_KOR) / 3, 2) 평균, STUDENT_GRADE
FROM TBL_STUDENT;

-- 3. 학생의 수학, 영어, 국어점수 중 한과목이라도 70점 이하가 아니고
-- 학점이 B이상인 학생만 학생 번호, 이름, 학점 출력하기
SELECT STUDENT_NUMBER "학생 번호", STUDENT_NAME 이름, STUDENT_GRADE 학점
FROM TBL_STUDENT
WHERE STUDENT_MAT > 70 AND STUDENT_ENG > 70 AND STUDENT_KOR > 70
AND (STUDENT_GRADE = 'B' OR STUDENT_GRADE = 'A');

-- 4. 이름이 이유리, 김웅이인 학생의 영어점수를 28점으로 수정하기
UPDATE TBL_STUDENT 
SET STUDENT_ENG = 28
WHERE STUDENT_NAME = '이유리' OR STUDENT_NAME = '김웅이';

SELECT STUDENT_NAME 이름, STUDENT_ENG 영어
FROM TBL_STUDENT
WHERE STUDENT_NAME = '이유리' OR STUDENT_NAME = '김웅이';

-- 5. 학생의 수학, 영어, 국어 점수 중 한 과목이라도 30점 미만이면 퇴학시키기(db에서 삭제)
DELETE FROM TBL_STUDENT
WHERE STUDENT_MAT < 30 OR STUDENT_ENG < 30 OR STUDENT_KOR < 30;

SELECT * FROM TBL_STUDENT;
-- 위에서 이유리, 김웅이 학생의 점수를 28점으로 변경하여 삭제당함

-- 6. 상품 테이블 생성
CREATE TABLE TBL_PRODUCT(
   PRODUCT_NUMBER NUMBER,
   PRODUCT_NAME VARCHAR2(100),
   PRODUCT_PRICE NUMBER
);

-- 조회하기
SELECT * FROM TBL_PRODUCT;

-- 7. 아래 값들을 상품 테이블에 삽입
-- 1, '신라면'
-- 2, '아몬드 빼빼로', 1200
-- 3, '오리지날 빼빼로', 1200
-- 4, '진라면', 1100
-- 5, '삼양라면', 900

-- case문을 사용할 때는 하나의 컬럼에 수정할 행마다 들어가는 값이 각각 지정될 때 사용하면 편하다
-- 7번 문제의 5개 데이터를 추가할 때는 각각의 조건이 다르기 때문에 ISNERT INTO로 사용하는 것이 편하다
INSERT INTO TBL_PRODUCT(PRODUCT_NAME, PRODUCT_PRICE)
VALUES (1, '신라면');

INSERT INTO TBL_PRODUCT
--VALUES (2, '아몬드 빼빼로' , 1200);
--VALUES (3, '오리지날 빼빼로' , 1200);
--VALUES (4, '진라면' , 1100);
--VALUES (5, '삼양라면' , 900);

SELECT * FROM TBL_PRODUCT;

-- 8. 신라면 가격을 1000원으로 수정
UPDATE TBL_PRODUCT
SET PRODUCT_PRICE = 1000
WHERE PRODUCT_NAME = '신라면';

-- 9. 오리지날 빼빼로를 누드 빼빼로로 이름 변경
UPDATE TBL_PRODUCT
SET PRODUCT_NAME = '누드 빼빼로'
WHERE PRODUCT_NAME = '오리지날 빼빼로';

-- 10. 삼양라면 가격 10% 인상으로 수정
UPDATE TBL_PRODUCT
SET PRODUCT_PRICE = PRODUCT_PRICE * 1.1
WHERE PRODUCT_NAME = '삼양라면';

-- 11. 빼빼로 가격 전부 10% 인하
-- 단, 쿼리문은 한번만 사용할 것
UPDATE TBL_PRODUCT
SET PRODUCT_PRICE = PRODUCT_PRICE * 0.9
WHERE PRODUCT_NAME LIKE '%빼빼로';

SELECT * FROM TBL_PRODUCT;

-- 12. 상품 테이블에서 라면 전부 삭제
-- 단, 쿼리문은 한번만 사용할 것
DELETE FROM TBL_PRODUCT
WHERE PRODUCT_NAME LIKE '%라면';

SELECT *FROM TBL_PRODUCT;

