create table tblManager (
          managerSeq number not null references tblMember(memberSeq) primary key
);

insert into tblManager values (1);
insert into tblManager values (2);
insert into tblManager values (3);
