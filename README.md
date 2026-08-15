# StockHub

사내·매장 창고의 **현재고**와 **입출고**를 관리하는 웹 시스템입니다.  
Spring 없이 Servlet 4.0 + JSP + MyBatis로 구현했습니다.

재고의 기준은 **창고 × 품목**입니다. 품목 전체 수량은 창고 합계입니다.  
일반 회원은 입고·출고를 **요청**만 하고, 실제 수량은 관리자 승인 후에만 바뀝니다.

## 문서

GitHub에서 아래 링크를 누르면 보고서 문서를 볼 수 있습니다.

| 문서 | 설명 |
|---|---|
| [기획서](보고서/기획서.md) | 목표, 사용자, 범위, 재고 규칙, 기술 스택 |
| [요구사항 정의서](보고서/요구사항정의서.md) | 기능·비기능 요구사항, 권한, 업무 규칙 |
| [기능 명세서](보고서/기능명세서.md) | 화면·URL·처리 내용 |
| [시스템 아키텍처](보고서/시스템아키텍처.md) | 계층, Filter, 패키지, 배포 |
| [ERD](보고서/ERD.md) | 테이블 관계 |
| [테이블 정의서](보고서/테이블정의서.md) | 컬럼·제약·상태 값 |

## 주요 기능

- 회원가입(이메일 인증), 로그인, 마이페이지, 비밀번호 찾기
- 재고 조회, 품목 상세, 바코드
- 일반 회원: 입고·출고 요청, 내 요청
- 관리자: 품목·창고·카테고리·회원 관리
- 입고, 출고, 창고 이동, 재고 조정, 입출고 이력
- 요청 승인·거절 (출고 부족이면 실패, 대기 유지)
- 대시보드(카드·차트·표), 입출고 엑셀 다운로드

## 기술 스택

- Java 11, Maven war, Apache Tomcat 9
- Servlet 4.0, JSP, JSTL, EL
- MyBatis, Oracle XE, ojdbc8
- jQuery, Chart.js, JsBarcode, Apache POI, Gson
- HttpSession, jBCrypt, JavaMail

## 실행

1. `src/main/resources/db.properties.example` → `db.properties`
2. `src/main/resources/mail.properties.example` → `mail.properties`
3. Oracle에 `sql/schema.sql` 반영
4. `mvn package` 후 Tomcat에 `target/stockhub.war` 배포

로컬 Maven Cargo는 `pom.xml` 기준 **8070**입니다.
