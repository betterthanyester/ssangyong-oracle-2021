-- Project.sql

create table tblMember (
	memberSeq number primary key,
    name varchar2(30) not null,
	jumin varchar2(60) not null check (substr(jumin,7,1) = '-'),
    tel varchar2(60) not null,
    email varchar2(60) not null
);



insert into tblMember (memberSeq, name, jumin, tel, email) values (1, '엄현준', '362319-1612794', '042-325-9688', 'YCC9vlbG@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (2, '정성연', '120723-2790708', '051-980-2695', 'DDxw2NWd@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (3, '주형준', '434887-1779208', '061-417-4280', 'X9Nlz7hg@gmail.com');  --관리자
insert into tblMember (memberSeq, name, jumin, tel, email) values (4, '주현성', '169551-2853344', '063-864-8632', 'Tmvs2ww3@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (5, '김형수', '393704-1911720', '052-298-4597', '7ikrCdoy@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (6, '이형재', '412350-1996094', '052-752-2688', 'KoNOiLOQ@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (7, '이석선', '433659-1106182', '041-661-3178', 'tAcjxHsd@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (8, '정하선', '190883-2123710', '031-167-3856', 'Oy0cPQyw@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (9, '박희희', '349609-2453858', '055-767-6842', 'G14bVS97@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (10, '김제연', '103963-2125697', '031-927-6530', 'ciTq6p8S@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (11, '정제형', '204918-2596762', '062-777-2043', '4ncxWALG@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (12, '최성석', '747019-1673786', '062-163-5796', 'r7dCwIqC@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (13, '강경연', '761248-2955570', '063-682-2422', 'OvqZL3G1@yahoo.com'); --교사
insert into tblMember (memberSeq, name, jumin, tel, email) values (14, '엄연연', '284934-2926756', '063-214-2776', 'malsZQ7Y@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (15, '엄선형', '213299-1916064', '053-234-9738', '8UxWmiog@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (16, '강선경', '924952-2428156', '051-224-5815', '8PiFyBoh@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (17, '한석석', '473415-2455992', '02-826-1424', 'lQ0qwTVD@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (18, '강연준', '420436-1585786', '062-511-7147', 'npwbYhJR@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (19, '강제연', '166968-1307728', '062-591-9025', 'YkDbAusI@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (20, '이연선', '548214-1763856', '063-456-6531', 'YDnOAc5t@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (21, '김연연', '836257-2891025', '064-503-2124', 'CRolosIk@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (22, '박연제', '642965-2782079', '044-117-1016', 'dtmTtVs9@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (23, '한선준', '203637-2335226', '051-869-5011', 'dsepsoqm@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (24, '엄제성', '151528-1219794', '043-783-4974', 'BxJKOizp@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (25, '주성석', '174716-1150898', '044-337-1772', '3owIVnJP@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (26, '박수준', '249107-1627994', '052-244-7301', '0g2gq6F8@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (27, '김경연', '348102-2500394', '031-496-5324', 'DlUbsAjj@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (28, '엄희성', '865454-2745284', '053-694-1399', 'L9rcG7UX@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (29, '심경선', '920782-2943531', '061-158-3031', '5vVTWNLo@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (30, '이석석', '230546-2726298', '051-103-6900', 'l966Bj95@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (31, '엄희형', '273262-2601667', '062-368-6508', 'lYtIi5bM@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (32, '심재희', '391425-1142580', '032-935-2945', 'a2unp3lM@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (33, '엄현선', '862266-1440871', '042-402-4861', 'QXLpEmgy@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (34, '이연경', '984240-2582170', '051-672-2279', 'DzIglYDr@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (35, '이준하', '529372-2322756', '055-731-5035', 'q9OwcLBB@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (36, '박재형', '255667-2341593', '044-616-4783', 'OhUPJXhg@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (37, '엄준준', '259243-2870984', '044-681-7615', 'cIjtzYAW@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (38, '박형형', '392004-1735231', '041-979-1018', 'HiOXhKXo@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (39, '최석연', '565736-2944423', '041-403-4358', 'c3qR1ZvF@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (40, '최선희', '899056-2773620', '053-845-5726', 'TylaHZ5h@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (41, '최희형', '291253-2569549', '042-964-1051', 'gdYHWf7B@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (42, '주제성', '533824-1167286', '02-809-4620', 'HXBh6kMb@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (43, '이하선', '103060-1952735', '052-494-2888', 'GjuwqVNp@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (44, '이선연', '451329-2444528', '052-728-5046', 'yqRwg3CV@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (45, '이제하', '176889-1836781', '053-173-9670', 'NASd7oIe@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (46, '엄석성', '978129-1906936', '053-765-4813', 'fmKPsYeB@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (47, '엄경석', '850220-1827575', '042-792-2145', 'NKzPtuiW@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (48, '박성하', '364134-1589251', '042-124-4368', 'r1SzHseF@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (49, '박형연', '782783-2485018', '042-406-1985', 'o8icU3Md@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (50, '엄준현', '187995-1834919', '052-750-7921', '9S5abAS2@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (51, '박재연', '679943-1277432', '053-272-6938', 'V3aeFibg@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (52, '강하경', '635737-2129325', '062-244-5321', '2ebnU600@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (53, '강경경', '296795-1258401', '041-370-1308', '2TVgyvtM@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (54, '주경선', '826239-2442512', '02-421-9107', '4GW5NEuY@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (55, '정현현', '385734-1603425', '063-872-7510', 'kixjzIOA@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (56, '박성성', '902255-2279958', '042-735-5765', 'y8zoedP8@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (57, '박현경', '164586-2946150', '062-105-7461', 'Th1Jswy0@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (58, '엄희재', '910038-2525161', '055-153-1930', '4HIDzvOD@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (59, '박수제', '968114-1895822', '055-263-5618', 'kTiUhaIR@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (60, '이석선', '449623-1123794', '02-640-7364', 'liUrJxkG@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (61, '박제경', '674803-1719402', '02-122-9241', '1Elq6LtB@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (62, '한희석', '831381-1972114', '033-607-2631', '14Eo8Dxw@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (63, '김선하', '841888-1493554', '052-119-9645', 'Oc4vN9cq@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (64, '강연준', '782491-1337885', '032-624-5032', 'N8Rff3TM@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (65, '이경수', '547752-2219751', '033-124-8457', 'EmzG86Tf@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (66, '정선석', '403081-1347669', '043-385-1060', 'E8r1i9QD@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (67, '엄준성', '243470-1367871', '051-283-7249', 'NYVHjHKp@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (68, '엄연선', '796028-1350529', '062-316-8293', 'nyLCscYN@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (69, '이희형', '642628-1955248', '063-828-3262', 'zcvURHjm@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (70, '엄준성', '686202-1987271', '033-813-3822', 'RS49ZHY1@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (71, '김연수', '243941-1271003', '043-856-7552', '5IafXwqh@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (72, '주연제', '212216-2426765', '042-302-6239', 'JL79MuOP@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (73, '엄선형', '492525-1859347', '042-199-6709', 'xSuSCMZ4@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (74, '박성성', '497833-2978439', '062-484-9531', 'HZRQRuym@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (75, '심연준', '185942-1915338', '052-945-1351', 'p7u98b2B@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (76, '김재희', '583077-1750685', '043-945-4014', 'XXOeRbEk@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (77, '김현연', '311441-1779160', '032-865-7683', '7lupSaL0@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (78, '엄희선', '641075-1827228', '054-969-4116', 'ChI2wUMG@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (79, '강석희', '955774-2456904', '02-304-6565', 'aXr8jwOX@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (80, '한경희', '448980-1959574', '051-951-9453', 'fTBNQqJu@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (81, '김선연', '570730-1382048', '053-706-5617', '1xZ4rVLu@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (82, '김재성', '697806-2561432', '032-162-1220', 'taiP6ZcE@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (83, '심수수', '261636-2713933', '02-860-5284', '5QEjBTgc@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (84, '엄형준', '176913-2959880', '064-880-7750', '6fa8PAJp@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (85, '한하제', '215131-1347401', '031-410-2929', 'uS6yBFkC@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (86, '정수희', '825864-1836665', '041-927-3927', 'nNORxRSv@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (87, '김경희', '830583-1644777', '053-662-5183', 'UfPNEMhH@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (88, '한경경', '276351-1533676', '042-126-3071', 'UGHUgB2M@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (89, '박연준', '456178-1701926', '043-286-3175', 'qyNXSKh4@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (90, '최석성', '360397-2767588', '061-607-1532', 'NCwsnT3i@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (91, '심현하', '703251-1614471', '055-190-3194', 'KnViQSYQ@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (92, '엄선하', '766398-1678949', '062-597-4928', 'sFlMHCti@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (93, '강선형', '818214-1955657', '042-235-6304', 'urVLT1Z4@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (94, '이연현', '694015-2588138', '063-568-7202', 'iDcLeLfh@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (95, '이형연', '568346-1223980', '055-625-4037', 'nsx2OVPk@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (96, '정제수', '129542-2928961', '063-605-2762', 'JbbtkE89@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (97, '이경석', '619480-1572507', '062-383-9437', 'qsfJ4hs1@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (98, '김현재', '608445-2716389', '02-220-4206', 'mIDq6Nkr@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (99, '정경형', '421469-1927350', '061-946-4328', 'PKDB9hmo@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (100, '주연경', '617163-2266391', '061-680-2673', 'B5IRgvun@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (101, '강재선', '798708-1673151', '062-184-2753', 'xUhsOysL@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (102, '최경연', '864639-1561113', '051-131-3275', 'AmCWvE65@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (103, '엄연경', '513330-2275584', '054-363-8256', 'feYndiwL@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (104, '엄연재', '304313-1573128', '044-823-7107', 'vwPLtGIH@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (105, '최경현', '906094-2204053', '031-802-4918', 'JATwe6mU@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (106, '이형제', '133973-2647413', '062-473-1487', 'rFk9op5C@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (107, '엄경제', '863517-1968058', '031-722-4408', 'IYA74aLc@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (108, '김희선', '229526-2881088', '063-178-6222', 'vMXyeVtb@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (109, '심재석', '185351-1235410', '031-314-1348', 'N1R1jeF3@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (110, '강연형', '189005-1525329', '032-263-6245', 'DxHpypfs@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (111, '엄연현', '778185-2631986', '052-698-8448', 'oM7BpAsJ@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (112, '주준준', '960421-2674291', '032-346-3389', 'TQ2TsRIv@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (113, '주형연', '744807-1621130', '054-716-8506', 'dY9S0SWC@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (114, '박준선', '223628-2281327', '054-303-2981', 'YBp4lJaB@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (115, '김연연', '871405-2339856', '063-362-7753', '1O4Fm3U6@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (116, '강경현', '864959-2648994', '032-716-3210', 'kcXVE2Rg@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (117, '김석제', '583074-2322120', '055-358-9570', 'H8RD4gLT@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (118, '박현석', '258929-2665979', '061-278-5908', 'HOY5D87I@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (119, '주준형', '784169-1122899', '041-118-7366', 'ZnZtZug8@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (120, '최재희', '525753-2530389', '043-237-1613', 'zxpn5v61@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (121, '정경준', '276469-2282418', '054-967-6648', 'DlngzwYZ@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (122, '이현제', '589239-2654285', '044-807-2386', 'zrvL9YDF@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (123, '박재하', '754472-2189398', '051-879-1332', 'LamvcYmU@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (124, '최수석', '230146-1162560', '054-733-6275', 'fI2zIx7x@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (125, '심준준', '528040-2868359', '054-660-8387', 'ZXiWkBwo@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (126, '주재성', '368689-2723907', '054-919-1599', 'eOKvzq9m@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (127, '정연연', '258461-1886127', '051-897-8163', 'D8QPv65P@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (128, '엄현하', '254244-1292000', '02-190-6264', 'I5Jk4ib8@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (129, '강경준', '473771-1600898', '062-327-5602', '1NAHx2y9@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (130, '김석석', '936461-2121481', '063-892-1973', 'aagDVWxl@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (131, '엄성선', '546664-1522444', '053-483-2434', 'PSjMzQ2O@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (132, '이현수', '632704-2663004', '063-912-3013', 'Pmp9e5ui@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (133, '심연경', '329754-2928407', '032-912-6632', '8ZEhb6Qd@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (134, '강연연', '358964-1657171', '053-827-8401', 'dcVseWII@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (135, '한형선', '162064-1905718', '062-824-1086', 'R4NzkMDR@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (136, '한성희', '136467-2497158', '051-160-7114', 'uHAGRjGN@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (137, '강희준', '683707-2846450', '032-129-9288', 'AAWDnHWa@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (138, '한성하', '569701-1953759', '032-440-7913', 'uzVqetZX@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (139, '강경현', '657832-1208176', '064-435-1763', 'JjzMHmdc@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (140, '한현경', '477141-2784953', '062-242-3541', '3JRwZLte@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (141, '최수재', '230556-1280348', '02-920-5137', 'J7wjgmBz@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (142, '김재재', '903807-1564790', '061-907-8062', 'Kfjvtr3i@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (143, '박석석', '170700-2268790', '044-552-3257', 'y5puLScm@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (144, '엄성경', '508791-1978363', '064-117-2904', 'wc9flez6@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (145, '심경준', '641815-1514583', '061-613-1379', 'PbzKI7D2@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (146, '한경재', '940822-2352265', '041-890-3106', 'wkjSSLFo@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (147, '박준연', '667778-1113696', '055-571-5728', 'ZnZOyLse@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (148, '박준준', '968290-1475514', '041-927-5550', 'BBwpJFhK@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (149, '정제하', '754768-1265215', '041-610-3135', 'QARL3wKS@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (150, '심연수', '797754-1764246', '061-127-5131', 'klbvnIQi@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (151, '주제재', '746043-1176254', '043-437-6251', 'TGdlrwcO@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (152, '엄재하', '316252-2285840', '062-728-7357', 'eoAti2F3@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (153, '정성경', '138579-2361257', '063-961-2578', 'VnTK1TEj@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (154, '정수하', '908693-1641217', '042-785-7574', 'HOoOPOhq@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (155, '최성성', '539314-1528347', '042-530-2377', 'jZM4g1pZ@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (156, '정재연', '608708-2323585', '042-718-7294', 'TPIFgYhu@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (157, '엄경수', '361144-1276229', '053-610-8154', 'RDqxEvlw@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (158, '정하경', '204395-1454429', '055-447-9741', 'scf1hCBE@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (159, '주수수', '579753-1440572', '042-251-4703', 'l3xHoQOs@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (160, '최성준', '933234-1654617', '043-663-5312', 'fdju0utZ@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (161, '한경수', '642112-2533117', '053-207-1671', 'MvDiFxYI@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (162, '주선경', '499161-2196802', '064-550-8017', 'DlVNq2F8@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (163, '주재성', '583024-1353695', '02-484-2854', 'boqXui8p@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (164, '정선석', '650042-2787888', '031-587-5400', 'aQxSxkY4@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (165, '박형하', '336631-1264533', '052-909-5075', 'VpJrTQVC@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (166, '한연경', '298040-2752150', '043-313-6984', 'rGeXeHOE@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (167, '심수선', '651103-2711102', '044-297-9906', 'R1GRhc0t@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (168, '최경준', '238920-2928327', '063-312-1132', 'fMaAEH7J@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (169, '한연경', '489906-2367627', '064-218-3330', 'ikO2EadY@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (170, '김경경', '505145-2920999', '061-817-4295', 'pp8h4Udw@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (171, '심수준', '286168-2248075', '051-621-1897', '3gl2EjLi@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (172, '한석연', '948706-1883114', '041-710-7338', 'FcK2P1qq@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (173, '박경연', '366768-2653398', '052-606-2306', 'AO1BwFkN@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (174, '이제석', '579624-1257484', '02-364-2200', 'FwSIFbhe@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (175, '박경제', '593576-2860500', '061-380-3512', 'oBplo0OA@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (176, '엄형연', '146250-1131149', '052-563-2757', 'GeuTWP7m@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (177, '박연준', '762874-1803432', '044-252-9283', '1mDaYQwy@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (178, '정하수', '970827-1347593', '061-451-2589', 'eqQO3UlB@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (179, '주선제', '396581-1728894', '044-674-2361', 'yn8gflOF@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (180, '주현하', '199995-1121777', '062-434-8177', '0z7JsDA0@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (181, '주재선', '142436-1252750', '054-404-8552', 'pdmcX93W@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (182, '최수석', '915138-2323177', '041-678-4099', 'Xi8MYpBU@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (183, '정재경', '663727-2270507', '041-255-5287', 'UiSJqhQP@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (184, '주준하', '352137-1860862', '052-934-2049', 'nP5IsWjI@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (185, '정경재', '916428-1477004', '053-548-4828', '5er2U07j@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (186, '이성준', '465382-1587619', '033-200-7111', 'pLcsQsMN@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (187, '최형석', '670544-2541397', '042-760-7127', '3EVMkcRY@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (188, '한석경', '719556-2613000', '032-293-6951', 'SaESEtM3@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (189, '심수제', '922263-1938659', '032-908-4661', 'DTrXSMob@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (190, '강형연', '559180-2563575', '054-269-3812', 'fmVDXPka@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (191, '한재현', '657053-2449042', '064-565-9384', '27wi0VPx@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (192, '최연수', '669587-2661388', '033-687-1244', 'bf8YazPP@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (193, '한선희', '989049-1509740', '054-668-2868', 'OKvVHiNp@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (194, '이제선', '175424-1613744', '031-542-2674', '66tooy6s@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (195, '최준경', '377077-2989872', '051-794-3716', '4k2Pl7AG@naver.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (196, '엄현석', '518970-2641298', '062-262-6483', 'ePiejE9R@gmail.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (197, '주연경', '226411-2266044', '044-266-2810', 'xQvhbPc1@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (198, '주준선', '644940-2103778', '041-905-8744', 'jGDPkZxM@yahoo.com');
insert into tblMember (memberSeq, name, jumin, tel, email) values (199, '김경성', '233054-2858744', '031-256-1757', 'u2fsJ6yD@hanmail.net');
insert into tblMember (memberSeq, name, jumin, tel, email) values (200, '최수희', '931189-2795306', '053-804-7993', 'BXE2r4Ok@yahoo.com');

commit;

























































