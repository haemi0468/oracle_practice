show user;

--계정생성
create user workshop
identified by workshop;

--권한설정
grant connect, resource
to workshop;
