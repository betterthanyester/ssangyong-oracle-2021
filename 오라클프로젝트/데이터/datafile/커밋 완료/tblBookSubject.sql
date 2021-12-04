--교재-과목

create table tblBookSubject (
          subjectSeq number not null references tblSubject(subjectSeq),
          bookSeq number not null references tblBook(bookSeq)
);

drop table tblBookSubject;

insert into tblBookSubject  values (1,18); 
insert into tblBookSubject  values (2,23); 
insert into tblBookSubject  values (3,20); 
insert into tblBookSubject  values (4,1); 
insert into tblBookSubject  values (5,19); 
insert into tblBookSubject  values (6,26); 


insert into tblBookSubject  values (7,4); 
insert into tblBookSubject  values (8,30); 
insert into tblBookSubject  values (9,29); 
insert into tblBookSubject  values (10,15); 
insert into tblBookSubject  values (11,26); 
insert into tblBookSubject  values (12,16); 
insert into tblBookSubject  values (13,18); 
insert into tblBookSubject  values (14,5); 
insert into tblBookSubject  values (15,18); 
insert into tblBookSubject  values (16,23); 
insert into tblBookSubject  values (17,13); 
insert into tblBookSubject  values (18,9); 
insert into tblBookSubject  values (19,20); 
insert into tblBookSubject  values (20,4); 
insert into tblBookSubject  values (21,10); 
insert into tblBookSubject  values (22,14); 
insert into tblBookSubject  values (23,16); 
insert into tblBookSubject  values (24,24); 
insert into tblBookSubject  values (25,10); 
insert into tblBookSubject  values (26,11); 
insert into tblBookSubject  values (27,24); 
insert into tblBookSubject  values (28,3); 
insert into tblBookSubject  values (29,2); 
insert into tblBookSubject  values (30,17); 

commit;

select * from tblBookSubject;