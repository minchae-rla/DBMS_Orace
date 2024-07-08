SELECT * FROM employees;

--1. 모든 직원의 이름, 성, 급여 조회
SELECT first_name 이름, last_name 성, salary 급여
FROM employees;

--2. 모든 직원의 직원번호, 이름, 입사일 조회하고 입사일을 기준으로 오름차순 정렬
SELECT job_id 직원번호, first_name 이름, hire_date 입사일
FROM employees
ORDER BY hire_date;

--3. 급여가 10000이상 15000 이하인 직원을 성함, 급여를 조회하고 급여 내리참순으로 정렬
--(이름과 성 띄어쓰기로 연결)
SELECT first_name || ' ' || last_name 성함, salary 급여
FROM employees
WHERE salary BETWEEN 10000 AND 15000
ORDER BY salary DESC;

--4. 부서번호가 50인 직원의 이름, 성, 부서번호를 조회
SELECT first_name 이름, last_name 성, department_id 부서번호
FROM employees
WHERE department_id = 50;

--5. 모든 직원의 이름, 성, 입사일, 급여, 입사일에서 100일을 뺀 날짜 조회
SELECT first_name 이름, last_name 성, hire_date 입사일, salary 급여, hire_date - 100 AS "입사일-100"
FROM employees;

--6. 모든 직원의 이름, 보너스, 매니저 번호를 보너스가 NULL이 아닌 직원만 조회
SELECT first_name 이름, commission_pct 보너스, MANAGER_ID 매니저번호
FROM employees
WHERE COMMISSION_PCT IS NOT NULL;

--7. job_id가 IT_PROG인 직원의 이름, 성, 부서번호를 조회
SELECT first_name 이름, last_name 성, department_id
FROM EMPLOYEES
WHERE job_id = 'IT_PROG';

--8. last_name이 King인 직원의 모든 정보 조회
SELECT *
FROM employees
WHERE last_name = 'King';

--9. 모든 직원의 이름, 성, 급여, 보너스, 매니저번호, 전화번호를 조회하고 commission_pct가 0.1이상 0.3이하 이거나
--manager_id 가 100인 직원만 조회
SELECT first_name 이름, last_name 성, salary 급여, commission_pct 보너스, manager_id 매니저번호, phone_number 전화번호
FROM employees
WHERE (COMMISSION_PCT BETWEEN 0.1 AND 0.3) OR MANAGER_ID = 100;

--10. 모든 직원의 성, 이름, 이메일, 핸드폰번호, 급여를조회하고 hire_date 기준 오름차순으로 정렬
SELECT last_name 성, first_name 이름, email 이메일, PHONE_NUMBER 핸드폰번호, SALARY 급여
FROM employees
ORDER BY hire_date;

--11. 성, 이름, 급여를 조회하고 commission_pct가 0.2인 직원의 급여가 10% 인상한 값을 함께 조회
SELECT last_name 성, first_name 이름, salary 급여, salary * 1.1 인상급여
FROM employees
WHERE commission_pct = 0.2;

--12. 모든 직원의 정보를 조회하는데 hire_date에 1년을 더한 날짜를 함께 조회
SELECT employees.*, hire_date + 365 "입사일+1년"
FROM employees;