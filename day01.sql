SELECT
   first_name
FROM
   employees;
-- 주석
-- 한줄 주석 : 컴퓨터가 해석하지 않는다
-- 실행시키지 않고 설명을 작성할 때 사용한다
-- employees 테이블 : 107명의 직원 데이터를 저장해 놓은 연습용 테이블
--    hr 계정 내에 존재하는 테이블
--   11개의 컬럼으로 이루어져있다
--    107개의 행이 존재한다
-- SELECT : 테이블에서 데이터를 조회할 때 사용하는 명령어

-- SELECT를 사용하여 employees 테이블의 first_name 컬럼만 선택하여 조회하기
 SELECT first_name FROM hr.employees;
  -- 디비버는 예약어는 알아서 대문자로 바꿔준다
  -- 테이블명을 작성할 때는 정확하게 작성하려면 계정명을 작성하고 (.)을 써야한다
  -- . ~안에 있는 이라는 의미이다
  -- ; 하나의 명령이 끝나면 작성한다(마침표라고 생각하면 된다)
  -- 세미콜론을 작성해야 한줄의 끝이라고 생각하기 때문에 세미콜론 이전에 줄바꿈을 해도 상관없다
 
SELECT FIRST_NAME FROM HR.EMPLOYEES;
 -- 대문자로 작성해도 오류가 발생하지 않는다

SELECT first_name, last_name FROM hr.employees;
-- 현재 hr계정으로 로그인했기 때문에 hr.은 생략가능하다
-- hr계정을 작성한 이유는 여러 계정에 같은 이름의 테이블명이 존재할 수 있기 때문이다
-- 지금 로그인한 계정의 테이블 우선순위가 높기 때문에 일반적으로 계정명은 생략 가능하다
SELECT
	last_name,
	first_name
FROM
	employees;

-- [실습1]
-- first_name 이름, last_name 성
-- 직원의 성, 이름, 핸드폰번호, 이메일주소, 사원번호를 순서대로 한번에 조회하기
SELECT
	last_name,
	first_name,
	phone_number,
	email,
	job_id
FROM
	employees;

SELECT  * FROM employees; --employees 테이블에 모든것을 조회하겠다
-- * 은 모든 컬럼을 의미한다

-- 정렬 조회하기
-- ORDER BY절
-- SELECT 컬럼명 FROM 테이블명 ORDER BY 컬럼명[오름차순 ASC OR 내림차순 DESC];

-- 사원의 이름, 성, 봉급을 조회 봉급 낮은순 -> 높은순으로 정렬
SELECT first_name, LAST_name, salary
FROM employees
ORDER BY salary DESC;
-- ASC : ascending 오름차순
-- DESC : descending 내림차순

-- 문자타입 정렬하기
SELECT first_name
FROM employees
ORDER BY first_name ASC;
--문자타입의 컬럼을 올므차순 정렬 시 a~z순서로 정렬된다

SELECT first_name
FROM employees
ORDER BY first_name DESC;
-- 문자타입의 컬럼을 내림차순 정렬 시 z~a순서로 정렬된다

--[과제]
-- 1. 직원의 이름, 성, 고용일을 고용일 순서로 정렬(오름차순, 내림차순)
-- 2. 직원의 이름, 성을 성 순서로 내림차순 정렬
-- 3. 직원의 이름, 성, 급여, 고용일을 성 오름차순으로 정렬(단 ASC 쓰지 않을 것)

-- 1.
-- 오름차순
SELECT first_name, last_name, hire_date
FROM employees
ORDER BY hire_date ASC;
-- 내림차순
SELECT first_name, last_name, hire_date
FROM employees
ORDER BY hire_date DESC;

-- 2.
SELECT first_name, last_name
FROM employees
ORDER BY last_name DESC;

-- 3.
SELECT first_name, last_name, salary, hire_date
FROM employees
ORDER BY last_name
