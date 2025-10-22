----------------------------------------------------------------
---------------------- MEMBER TABLE ----------------------------
----------------------------------------------------------------
create table member (
     user_id varchar2(30) primary key,
     user_pwd varchar2(100) not null,
     user_name varchar2(15) not null,
     email varchar2(100),
     birthday char(6),
     gender char(1) check (gender in('M', 'F')),
     phone char(13),
     address varchar2(100),
     enroll_date date default sysdate,
     modify_date date default sysdate,
     status char(1) default 'Y' check(status in('Y', 'N'))
);

insert into  member
values ('admin', '1234', '관리자', 'admin@google.com', '800918', 'F', '010-1111-2222','서울시 강남구 한국빌딩', default, default, default);

insert into  member
values ('user01', '1234', '이남길', 'user01@google.com', '900213', 'M','010-3333-4444','서울시 양천구 목동', default, default, default);

----------------------------------------------------------------
------------------------ board TABLE ---------------------------
----------------------------------------------------------------
create table board(
      board_no number primary key,
      board_title varchar2(100) not null,
      board_content varchar2(4000) not null,
      board_writer varchar2(30),
      count number default 0,
      create_date date default sysdate,
      status char(1) default 'Y' check(status in('Y', 'N')),
      foreign key (board_writer) references member
);

create sequence seq_bno nocache;

insert into  board
values(seq_bno.nextval, '첫번째 게시판 서비스를 시작하겠습니다.', '안녕하세요. 첫 게시판입니다.','admin', default, '20250911', default);

insert into  board
values(seq_bno.nextval, '두번째 게시판 서비스를 시작하겠습니다.', '안녕하세요. 2 게시판입니다.','user01', default, '20250915', default);

insert into  board
values(seq_bno.nextval, '하이 에브리원 게시판 서비스를 시작하겠습니다.', '안녕하세요. 3 게시판입니다','user01',default, '20250919', default);

insert into  board
values(seq_bno.nextval, '안녕.. 마이바티스는 처음이지?', '안녕하세요. 첫 게시판입니다.', 'user01',default, '20250920', default);

insert into  board
values(seq_bno.nextval, '안녕. 제목1', '안녕 내용1', 'admin', default, '20250923', default);

insert into  board
values(seq_bno.nextval, '페이징 처리때문에 샘플데이터 많이 넣어놓는다...', '안녕하십니까', 'admin',default,  '20250924', default);

insert into  board
values(seq_bno.nextval,'제목2' ,'내용2', 'admin', default, '20250925',default);

insert into  board
values(seq_bno.nextval,'제목3' ,'내용3' , 'admin', default, '20250926', default);

insert into  board
values(seq_bno.nextval,'제목4' ,'내용4', 'user01', default, '20250927', default);

insert into  board
values(seq_bno.nextval, '제목5' ,'내용5', 'admin', default, '20251005', default);

insert into  board
values(seq_bno.nextval,'제목6' ,'내용6', 'user01', default, '20251013', default);

insert into  board
values(seq_bno.nextval, '제목7' ,'내용7', 'admin', default, '20251020', default);

insert into  board
values(seq_bno.nextval, '마지막 게시판 시작하겠습니다.', '안녕하세요. 마지막 게시판입니다.', 'admin',  default, sysdate, default);

----------------------------------------------------------------
------------------------ reply TABLE ---------------------------
----------------------------------------------------------------
create table reply(
    reply_no number primary key,
    reply_content varchar2(400),
    ref_bno number,
    reply_writer varchar2(30),
    create_date date default sysdate,
    status char(1) default 'Y' check(status in('Y', 'N')),
    foreign key (ref_bno) references board,
    foreign key (reply_writer) references member
);

create sequence seq_rno nocache;

insert into  reply
values(seq_rno.nextval,'첫번째 댓글입니다', 1, 'user01', '20251004', default);

insert into  reply
values(seq_rno.nextval, '첫번째 댓글입니다', 13, 'user01', '20251007', default);

insert into  reply
values(seq_rno.nextval, '두번째 댓글입니다', 13, 'user01', '20251013', default);

insert into  reply
values(seq_rno.nextval, '마지막 댓글입니다', 13, 'user01', '20251020', default);

commit;