--
-- PostgreSQL database dump
--

\restrict sVBQj7W2uuKxl3pXM05YefRqF0Jbhn4obqDtDcIFiyGOHL6e4el7gCMza54IDPj

-- Dumped from database version 16.9 (Debian 16.9-1.pgdg120+1)
-- Dumped by pg_dump version 16.10 (Debian 16.10-1.pgdg11+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: formula_one_baseteam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_baseteam (id, name, api_id) FROM stdin;
\.


--
-- Data for Name: formula_one_championshipsystem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_championshipsystem (id, reference, name, eligibility, driver_season_split, driver_best_results, team_season_split, team_best_results, team_points_per_session, api_id) FROM stdin;
1	s1950	1950 - 1953 Championship	1	0	4	0	0	0	championshipsystem_nOtKOEQW
2	s1954	1954 - 1957 Championship	1	0	5	0	0	0	championshipsystem_34z7l8W7
3	s1958	1958, 1960, 1963-1965\tChampionship	1	0	6	0	6	1	championshipsystem_EEmoioVr
4	s1959	1959, 1961, 1962, 1966 Championship	1	0	5	0	5	1	championshipsystem_eOLDxHqq
5	s1967	1967 - 1978 Championship	1	2	-2	2	-2	1	championshipsystem_NTgvvIzr
6	s1979	1979 Championship	1	3	4	0	-1	0	championshipsystem_ihR4sGBs
7	s1980	1980 Championship	1	3	5	0	-1	0	championshipsystem_7uiLf6Kz
8	s1981	1981-1990 Championship	1	0	11	0	-1	0	championshipsystem_NDb24yv7
9	s1991	1991 - 2001 Championship	1	0	-1	0	-1	0	championshipsystem_wtKaesRL
10	s2002	2002 - Present Championship	2	0	-1	0	-1	0	championshipsystem_75E7BPMf
\.


--
-- Data for Name: formula_one_driver; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_driver (id, reference, forename, surname, abbreviation, nationality, permanent_car_number, date_of_birth, wikipedia, country_code, api_id) FROM stdin;
1	farina	Nino	Farina	\N	Italian	\N	1906-10-30	http://en.wikipedia.org/wiki/Nino_Farina	ITA	driver_NNme7ruE
2	fagioli	Luigi	Fagioli	\N	Italian	\N	1898-06-09	http://en.wikipedia.org/wiki/Luigi_Fagioli	ITA	driver_oSJ2AZ19
3	reg_parnell	Reg	Parnell	\N	British	\N	1911-07-02	http://en.wikipedia.org/wiki/Reg_Parnell	GBR	driver_K1dAqP21
4	cabantous	Yves	Cabantous	\N	French	\N	1904-10-08	http://en.wikipedia.org/wiki/Yves_Giraud_Cabantous	FRA	driver_mMgKa2QC
5	rosier	Louis	Rosier	\N	French	\N	1905-11-05	http://en.wikipedia.org/wiki/Louis_Rosier	FRA	driver_JBHqCjL6
6	gerard	Bob	Gerard	\N	British	\N	1914-01-19	http://en.wikipedia.org/wiki/Bob_Gerard	GBR	driver_0vM2JtQS
7	harrison	Cuth	Harrison	\N	British	\N	1906-07-06	http://en.wikipedia.org/wiki/Cuth_Harrison	GBR	driver_8fVX2Oi5
8	etancelin	Philippe	Étancelin	\N	French	\N	1896-12-28	http://en.wikipedia.org/wiki/Philippe_%C3%89tancelin	FRA	driver_hVOO3oPh
9	hampshire	David	Hampshire	\N	British	\N	1917-12-29	http://en.wikipedia.org/wiki/David_Hampshire	GBR	driver_KrgKEQqw
10	shawe_taylor	Brian	Shawe Taylor	\N	British	\N	1915-01-28	http://en.wikipedia.org/wiki/Brian_Shawe_Taylor	GBR	driver_a6aSD1ML
11	fry	Joe	Fry	\N	British	\N	1915-10-26	http://en.wikipedia.org/wiki/Joe_Fry	GBR	driver_qC30SzKm
12	claes	Johnny	Claes	\N	Belgian	\N	1916-08-11	http://en.wikipedia.org/wiki/Johnny_Claes	BEL	driver_78AZYCLa
13	fangio	Juan	Fangio	\N	Argentine	\N	1911-06-24	http://en.wikipedia.org/wiki/Juan_Manuel_Fangio	ARG	driver_Z1VX9us3
14	kelly	Joe	Kelly	\N	Irish	\N	1913-03-13	http://en.wikipedia.org/wiki/Joe_Kelly_(Formula_One)	IRL	driver_JbUl3Nmu
15	bira	Prince	Bira	\N	Thai	\N	1914-07-15	http://en.wikipedia.org/wiki/Prince_Bira	THA	driver_6clklIgl
16	murray	David	Murray	\N	British	\N	1909-12-28	http://en.wikipedia.org/wiki/David_Murray_(driver)	GBR	driver_DixGrQHz
17	crossley	Geoff	Crossley	\N	British	\N	1921-05-11	http://en.wikipedia.org/wiki/Geoff_Crossley	GBR	driver_K2w3R9p1
18	graffenried	Toulo	de Graffenried	\N	Swiss	\N	1914-05-18	http://en.wikipedia.org/wiki/Toulo_de_Graffenried	CHE	driver_6e3MUmGt
19	chiron	Louis	Chiron	\N	Monegasque	\N	1899-08-03	http://en.wikipedia.org/wiki/Louis_Chiron	MCO	driver_yByLAncH
20	martin	Eugène	Martin	\N	French	\N	1915-03-24	http://en.wikipedia.org/wiki/Eug%C3%A8ne_Martin	FRA	driver_1o2Z03xA
21	peter_walker	Peter	Walker	\N	British	\N	1912-10-07	http://en.wikipedia.org/wiki/Peter_Walker_(driver)	GBR	driver_BRO2SoRo
22	rolt	Tony	Rolt	\N	British	\N	1918-10-16	http://en.wikipedia.org/wiki/Tony_Rolt	GBR	driver_00XwUfD0
23	leslie_johnson	Leslie	Johnson	\N	British	\N	1912-03-22	http://en.wikipedia.org/wiki/Leslie_Johnson_(racing_driver)	GBR	driver_vrf8Z1Ih
24	ascari	Alberto	Ascari	\N	Italian	\N	1918-07-13	http://en.wikipedia.org/wiki/Alberto_Ascari	ITA	driver_JcscnZhM
25	sommer	Raymond	Sommer	\N	French	\N	1906-08-31	http://en.wikipedia.org/wiki/Raymond_Sommer	FRA	driver_1Yt3ZoQb
26	villoresi	Luigi	Villoresi	\N	Italian	\N	1909-05-16	http://en.wikipedia.org/wiki/Luigi_Villoresi	ITA	driver_wkSFgYxm
27	gonzalez	José Froilán	González	\N	Argentine	\N	1922-10-05	http://en.wikipedia.org/wiki/Jos%C3%A9_Froil%C3%A1n_Gonz%C3%A1lez	ARG	driver_SXXDAhYS
28	manzon	Robert	Manzon	\N	French	\N	1917-04-12	http://en.wikipedia.org/wiki/Robert_Manzon	FRA	driver_7oWir3Eg
29	trintignant	Maurice	Trintignant	\N	French	\N	1917-10-30	http://en.wikipedia.org/wiki/Maurice_Trintignant	FRA	driver_nZFsadwH
30	rol	Franco	Rol	\N	Italian	\N	1908-06-05	http://en.wikipedia.org/wiki/Franco_Rol	ITA	driver_hl2FzdCN
31	schell	Harry	Schell	\N	American	\N	1921-06-29	http://en.wikipedia.org/wiki/Harry_Schell	USA	driver_lR3uUcuE
32	whitehead	Peter	Whitehead	\N	British	\N	1914-11-12	http://en.wikipedia.org/wiki/Peter_Whitehead_(racing_driver)	GBR	driver_iJjRn5Tv
33	pian	Alfredo	Pián	\N	Argentine	\N	1912-10-21	http://en.wikipedia.org/wiki/Alfredo_Pi%C3%A0n	ARG	driver_nYkjfJDA
34	parsons	Johnnie	Parsons	\N	American	\N	1918-07-04	http://en.wikipedia.org/wiki/Johnnie_Parsons	USA	driver_Ndsronyc
35	holland	Bill	Holland	\N	American	\N	1907-12-18	http://en.wikipedia.org/wiki/Bill_Holland	USA	driver_4WYLDz1H
36	rose	Mauri	Rose	\N	American	\N	1906-05-26	http://en.wikipedia.org/wiki/Mauri_Rose	USA	driver_i7UiPItP
37	green	Cecil	Green	\N	American	\N	1919-09-30	http://en.wikipedia.org/wiki/Cecil_Green	USA	driver_f7C1GA11
38	bettenhausen	Tony	Bettenhausen	\N	American	\N	1916-09-12	http://en.wikipedia.org/wiki/Tony_Bettenhausen	USA	driver_PhszAGaJ
39	chitwood	Joie	Chitwood	\N	American	\N	1912-04-14	http://en.wikipedia.org/wiki/Joie_Chitwood	USA	driver_gELyrYu0
40	wallard	Lee	Wallard	\N	American	\N	1910-09-07	http://en.wikipedia.org/wiki/Lee_Wallard	USA	driver_DqPwk5ZE
41	faulkner	Walt	Faulkner	\N	American	\N	1920-02-16	http://en.wikipedia.org/wiki/Walt_Faulkner	USA	driver_RAMiz1X4
42	george_connor	George	Connor	\N	American	\N	1906-08-16	http://en.wikipedia.org/wiki/George_Connor_(driver)	USA	driver_2iTdi3c8
43	paul_russo	Paul	Russo	\N	American	\N	1914-04-10	http://en.wikipedia.org/wiki/Paul_Russo	USA	driver_tjvWRhki
44	flaherty	Pat	Flaherty	\N	American	\N	1926-01-06	http://en.wikipedia.org/wiki/Pat_Flaherty_(racing_driver)	USA	driver_BuEuypIa
45	fohr	Myron	Fohr	\N	American	\N	1912-06-17	http://en.wikipedia.org/wiki/Myron_Fohr	USA	driver_stZLYMPk
46	darter	Duane	Carter	\N	American	\N	1913-05-05	http://en.wikipedia.org/wiki/Duane_Carter	USA	driver_pwBOKx7y
47	hellings	Mack	Hellings	\N	American	\N	1915-09-14	http://en.wikipedia.org/wiki/Mack_Hellings	USA	driver_6LrKnIxD
48	mcgrath	Jack	McGrath	\N	American	\N	1919-10-08	http://en.wikipedia.org/wiki/Jack_McGrath_(racing_driver)	USA	driver_gbqmUQsI
49	ruttman	Troy	Ruttman	\N	American	\N	1930-03-11	http://en.wikipedia.org/wiki/Troy_Ruttman	USA	driver_rmv7yFNB
50	hartley	Gene	Hartley	\N	American	\N	1926-01-28	http://en.wikipedia.org/wiki/Gene_Hartley	USA	driver_ZsPuOa46
51	davies	Jimmy	Davies	\N	American	\N	1929-08-08	http://en.wikipedia.org/wiki/Jimmy_Davies	USA	driver_apcB1WlU
52	mcdowell	Johnny	McDowell	\N	American	\N	1915-01-29	http://en.wikipedia.org/wiki/Johnny_McDowell	USA	driver_sLFPTGG7
53	walt_brown	Walt	Brown	\N	American	\N	1911-12-30	http://en.wikipedia.org/wiki/Walt_Brown_(auto_racer)	USA	driver_H8QiWVfE
54	webb	Travis	Webb	\N	American	\N	1910-10-08	http://en.wikipedia.org/wiki/Travis_Webb	USA	driver_ryjXcvYh
55	hoyt	Jerry	Hoyt	\N	American	\N	1929-01-29	http://en.wikipedia.org/wiki/Jerry_Hoyt	USA	driver_TLj6HDob
56	ader	Walt	Ader	\N	American	\N	1913-12-15	http://en.wikipedia.org/wiki/Walt_Ader	USA	driver_JvOfwYKa
57	holmes	Jackie	Holmes	\N	American	\N	1920-09-04	http://en.wikipedia.org/wiki/Jackie_Holmes	USA	driver_So64gU5K
58	rathmann	Jim	Rathmann	\N	American	\N	1928-07-16	http://en.wikipedia.org/wiki/Jim_Rathmann	USA	driver_Ntp27UdF
59	banks	Henry	Banks	\N	American	\N	1913-06-14	http://en.wikipedia.org/wiki/Henry_Banks	USA	driver_CqWrSK48
60	schindler	Bill	Schindler	\N	American	\N	1909-03-06	http://en.wikipedia.org/wiki/Bill_Schindler	USA	driver_Gan7Zrbs
61	levrett	Bayliss	Levrett	\N	American	\N	1914-02-14	http://en.wikipedia.org/wiki/Bayliss_Levrett	USA	driver_sigF8Dlt
62	cantrell	Bill	Cantrell	\N	American	\N	1908-01-31	http://en.wikipedia.org/wiki/William_Cantrell	USA	driver_O0uLUuYY
63	agabashian	Fred	Agabashian	\N	American	\N	1913-08-21	http://en.wikipedia.org/wiki/Fred_Agabashian	USA	driver_AGKcW4GK
64	jackson	Jimmy	Jackson	\N	American	\N	1910-07-25	http://en.wikipedia.org/wiki/Jimmy_Jackson_(driver)	USA	driver_d7lq5in4
65	hanks	Sam	Hanks	\N	American	\N	1914-07-13	http://en.wikipedia.org/wiki/Sam_Hanks	USA	driver_aOrsqF4n
66	dick_rathmann	Dick	Rathmann	\N	American	\N	1924-01-06	http://en.wikipedia.org/wiki/Dick_Rathmann	USA	driver_hbPHVeJp
67	dinsmore	Duke	Dinsmore	\N	American	\N	1913-04-10	http://en.wikipedia.org/wiki/Duke_Dinsmore	USA	driver_V2jcq5x8
68	bonetto	Felice	Bonetto	\N	Italian	\N	1903-06-09	http://en.wikipedia.org/wiki/Felice_Bonetto	ITA	driver_Bx37ktxy
69	pagani	Nello	Pagani	\N	Italian	\N	1911-10-11	http://en.wikipedia.org/wiki/Nello_Pagani	ITA	driver_iJeg8vCT
70	branca	Toni	Branca	\N	Swiss	\N	1916-09-15	http://en.wikipedia.org/wiki/Toni_Branca	CHE	driver_u4daLXIZ
71	levegh	Pierre	Levegh	\N	French	\N	1905-12-22	http://en.wikipedia.org/wiki/Pierre_Levegh	FRA	driver_EQWXAv9I
72	chaboud	Eugène	Chaboud	\N	French	\N	1907-04-12	http://en.wikipedia.org/wiki/Eug%C3%A8ne_Chaboud	FRA	driver_8hTvFNiS
73	pozzi	Charles	Pozzi	\N	French	\N	1909-08-27	http://en.wikipedia.org/wiki/Charles_Pozzi	FRA	driver_9oRNXHh6
74	serafini	Dorino	Serafini	\N	Italian	\N	1909-07-22	http://en.wikipedia.org/wiki/Dorino_Serafini	ITA	driver_XRab9IQI
75	guy_mairesse	Guy	Mairesse	\N	French	\N	1910-08-10	http://en.wikipedia.org/wiki/Guy_Mairesse	FRA	driver_cMojDpib
76	taruffi	Piero	Taruffi	\N	Italian	\N	1906-10-12	http://en.wikipedia.org/wiki/Piero_Taruffi	ITA	driver_R3M0HQEU
77	biondetti	Clemente	Biondetti	\N	Italian	\N	1898-08-18	http://en.wikipedia.org/wiki/Clemente_Biondetti	ITA	driver_ZPvjKlWV
78	louveau	Henri	Louveau	\N	French	\N	1910-01-25	http://en.wikipedia.org/wiki/Henri_Louveau	FRA	driver_QQhVJsyW
79	comotti	Franco	Comotti	\N	Italian	\N	1906-07-24	http://en.wikipedia.org/wiki/Franco_Comotti	ITA	driver_DHjtOX3g
80	sanesi	Consalvo	Sanesi	\N	Italian	\N	1911-03-28	http://en.wikipedia.org/wiki/Consalvo_Sanesi	ITA	driver_ztJFh4nQ
81	pietsch	Paul	Pietsch	\N	German	\N	1911-06-20	http://en.wikipedia.org/wiki/Paul_Pietsch	DEU	driver_QEgY3SBo
82	moss	Stirling	Moss	\N	British	\N	1929-09-17	http://en.wikipedia.org/wiki/Stirling_Moss	GBR	driver_w6R86tvE
83	fischer	Rudi	Fischer	\N	Swiss	\N	1912-04-19	http://en.wikipedia.org/wiki/Rudi_Fischer	CHE	driver_Bsgb5vcT
84	abecassis	George	Abecassis	\N	British	\N	1913-03-21	http://en.wikipedia.org/wiki/George_Abecassis	GBR	driver_EkNJRy8p
85	hirt	Peter	Hirt	\N	Swiss	\N	1910-03-30	http://en.wikipedia.org/wiki/Peter_Hirt	CHE	driver_cEdE7spU
86	nazaruk	Mike	Nazaruk	\N	American	\N	1921-10-02	http://en.wikipedia.org/wiki/Mike_Nazaruk	USA	driver_ekQoEF9s
87	ayulo	Manny	Ayulo	\N	American	\N	1921-10-20	http://en.wikipedia.org/wiki/Manny_Ayulo	USA	driver_VKe4MPE6
88	linden	Andy	Linden	\N	American	\N	1922-04-05	http://en.wikipedia.org/wiki/Andy_Linden_(racing_driver)	USA	driver_3UzToWrc
89	ball	Bobby	Ball	\N	American	\N	1925-08-26	http://en.wikipedia.org/wiki/Bobby_Ball_(auto_racer)	USA	driver_1hjujuAo
90	forberg	Carl	Forberg	\N	American	\N	1911-03-04	http://en.wikipedia.org/wiki/Carl_Forberg	USA	driver_MgkUp9Qj
91	nalon	Duke	Nalon	\N	American	\N	1913-03-02	http://en.wikipedia.org/wiki/Duke_Nalon	USA	driver_J1XG78oX
92	force	Gene	Force	\N	American	\N	1916-06-15	http://en.wikipedia.org/wiki/Gene_Force	USA	driver_rAuPUw4t
93	scarborough	Carl	Scarborough	\N	American	\N	1914-07-03	http://en.wikipedia.org/wiki/Carl_Scarborough	USA	driver_pY4StT6A
94	mackey	Bill	Mackey	\N	American	\N	1927-12-15	http://en.wikipedia.org/wiki/Bill_Mackey	USA	driver_RPpuumfG
95	stevenson	Chuck	Stevenson	\N	American	\N	1919-10-15	http://en.wikipedia.org/wiki/Chuck_Stevenson	USA	driver_d8kOkcey
96	miller	Chet	Miller	\N	American	\N	1902-07-19	http://en.wikipedia.org/wiki/Chet_Miller	USA	driver_7GXlNDkI
97	ward	Rodger	Ward	\N	American	\N	1921-01-10	http://en.wikipedia.org/wiki/Rodger_Ward	USA	driver_v8WGZbYp
98	griffith	Cliff	Griffith	\N	American	\N	1916-02-06	http://en.wikipedia.org/wiki/Cliff_Griffith	USA	driver_keprcy2U
99	vukovich	Bill	Vukovich	\N	American	\N	1918-12-13	http://en.wikipedia.org/wiki/Bill_Vukovich	USA	driver_9ZzwmXCS
100	james	Joe	James	\N	American	\N	1925-05-23	http://en.wikipedia.org/wiki/Joe_James_(racing_driver)	USA	driver_aV2C0M7J
101	andre_pilette	André	Pilette	\N	Belgian	\N	1918-10-06	http://en.wikipedia.org/wiki/Andr%C3%A9_Pilette	BEL	driver_zrLReZMS
102	gordini	Aldo	Gordini	\N	French	\N	1921-05-20	http://en.wikipedia.org/wiki/Aldo_Gordini	FRA	driver_GOsLneEa
103	simon	André	Simon	\N	French	\N	1920-01-05	http://en.wikipedia.org/wiki/Andr%C3%A9_Simon_(racing_driver)	FRA	driver_78KqwRPe
104	marimon	Onofre	Marimón	\N	Argentine	\N	1923-12-19	http://en.wikipedia.org/wiki/Onofre_Marim%C3%B3n	ARG	driver_KZ2hgah3
105	duncan_hamilton	Duncan	Hamilton	\N	British	\N	1920-04-30	http://en.wikipedia.org/wiki/Duncan_Hamilton_(racing_driver)	GBR	driver_hIZZE03S
106	parker	Philip	Fotheringham-Parker	\N	British	\N	1907-09-22	http://en.wikipedia.org/wiki/Philip_Fotheringham-Parker	GBR	driver_tR7Shi0g
107	john_james	John	James	\N	British	\N	1914-05-10	http://en.wikipedia.org/wiki/John_James_(auto_racer)	GBR	driver_Vko4of8v
108	swaters	Jacques	Swaters	\N	American	\N	1926-10-30	http://en.wikipedia.org/wiki/Jacques_Swaters	USA	driver_tK4lwAbn
109	landi	Chico	Landi	\N	Brazilian	\N	1907-07-14	http://en.wikipedia.org/wiki/Chico_Landi	BRA	driver_OSXoHuXS
110	richardson	Ken	Richardson	\N	British	\N	1911-08-21	http://en.wikipedia.org/wiki/Ken_Richardson_(race_car_driver)	GBR	driver_XzSVPpa4
111	godia	Paco	Godia	\N	Spanish	\N	1921-03-21	http://en.wikipedia.org/wiki/Paco_Godia	ESP	driver_JNt3htAB
112	grignard	Georges	Grignard	\N	French	\N	1905-07-25	http://en.wikipedia.org/wiki/Georges_Grignard	FRA	driver_C9yXS8GE
113	jover	Juan	Jover	\N	Spanish	\N	1903-11-23	http://en.wikipedia.org/wiki/Juan_Jover	ESP	driver_FI5YcddL
114	behra	Jean	Behra	\N	French	\N	1921-02-16	http://en.wikipedia.org/wiki/Jean_Behra	FRA	driver_aKuX97Hh
115	wharton	Ken	Wharton	\N	British	\N	1916-03-21	http://en.wikipedia.org/wiki/Ken_Wharton	GBR	driver_fxPg2rNJ
116	alan_brown	Alan	Brown	\N	British	\N	1919-11-20	http://en.wikipedia.org/wiki/Alan_Brown_(racing_driver)	GBR	driver_K1b6ZkpW
117	brandon	Eric	Brandon	\N	British	\N	1920-07-18	http://en.wikipedia.org/wiki/Eric_Brandon	GBR	driver_fh5883VB
118	macklin	Lance	Macklin	\N	British	\N	1919-09-02	http://en.wikipedia.org/wiki/Lance_Macklin	GBR	driver_XrKEzKCg
119	collins	Peter	Collins	\N	British	\N	1931-11-06	http://en.wikipedia.org/wiki/Peter_Collins_(racing_driver)	GBR	driver_EMjlo9zh
120	hans_stuck	Hans	von Stuck	\N	German	\N	1900-12-27	http://en.wikipedia.org/wiki/Hans_Von_Stuck	DEU	driver_08GdiIgL
121	ulmen	Toni	Ulmen	\N	German	\N	1906-01-25	http://en.wikipedia.org/wiki/Toni_Ulmen	DEU	driver_RRltsTyT
122	terra	Max	de Terra	\N	Swiss	\N	1918-10-06	http://en.wikipedia.org/wiki/Max_de_Terra	CHE	driver_OClfHEeb
123	cross	Art	Cross	\N	American	\N	1918-01-24	http://en.wikipedia.org/wiki/Art_Cross	USA	driver_bBljWXEp
124	bryan	Jimmy	Bryan	\N	American	\N	1926-01-28	http://en.wikipedia.org/wiki/Jimmy_Bryan	USA	driver_jdaZXbfV
125	reece	Jimmy	Reece	\N	American	\N	1929-11-17	http://en.wikipedia.org/wiki/Jimmy_Reece	USA	driver_tJ5rQhLc
126	rigsby	Jim	Rigsby	\N	American	\N	1923-06-06	http://en.wikipedia.org/wiki/Jim_Rigsby	USA	driver_YA0zxbMv
127	fonder	George	Fonder	\N	American	\N	1917-06-22	http://en.wikipedia.org/wiki/George_Fonder	USA	driver_Y8TFklqJ
128	johnson	Eddie	Johnson	\N	American	\N	1919-02-10	http://en.wikipedia.org/wiki/Eddie_Johnson_(auto_racer)	USA	driver_uN302DZU
129	sweikert	Bob	Sweikert	\N	American	\N	1926-05-20	http://en.wikipedia.org/wiki/Bob_Sweikert	USA	driver_jD9zTuhd
130	bob_scott	Bob	Scott	\N	American	\N	1928-10-04	http://en.wikipedia.org/wiki/Bob_Scott_(auto_racer)	USA	driver_UBxaGXx0
131	hawthorn	Mike	Hawthorn	\N	British	\N	1929-04-10	http://en.wikipedia.org/wiki/Mike_Hawthorn	GBR	driver_tJVdg7WR
132	frere	Paul	Frère	\N	Belgian	\N	1917-01-30	http://en.wikipedia.org/wiki/Paul_Fr%C3%A8re	BEL	driver_hK7YEdqc
133	tornaco	Charles	de Tornaco	\N	Belgian	\N	1927-06-07	http://en.wikipedia.org/wiki/Charles_de_Tornaco	BEL	driver_nHwoj89m
134	laurent	Roger	Laurent	\N	Belgian	\N	1913-02-21	http://en.wikipedia.org/wiki/Roger_Laurent	BEL	driver_VSmBu2ja
135	legat	Arthur	Legat	\N	Belgian	\N	1898-11-01	http://en.wikipedia.org/wiki/Arthur_Legat	BEL	driver_skpIbFy4
136	obrien	Robert	O'Brien	\N	American	\N	1908-04-11	http://en.wikipedia.org/wiki/Robert_O%27Brien_(auto_racer)	USA	driver_DHPcvwbQ
137	gaze	Tony	Gaze	\N	Australian	\N	1920-02-03	http://en.wikipedia.org/wiki/Tony_Gaze	AUS	driver_9u7QmeFy
138	charrington	Robin	Montgomerie-Charrington	\N	British	\N	1915-06-23	http://en.wikipedia.org/wiki/Robin_Montgomerie-Charrington	GBR	driver_Qca8d88U
139	carini	Piero	Carini	\N	Italian	\N	1921-03-06	http://en.wikipedia.org/wiki/Piero_Carini	ITA	driver_sunTsfaB
140	poore	Dennis	Poore	\N	British	\N	1916-08-19	http://en.wikipedia.org/wiki/Dennis_Poore	GBR	driver_mhwjKuz4
141	thompson	Eric	Thompson	\N	British	\N	1919-11-04	http://en.wikipedia.org/wiki/Eric_Thompson_(racing_driver)	GBR	driver_ZV3ZxMjb
142	salvadori	Roy	Salvadori	\N	British	\N	1922-05-12	http://en.wikipedia.org/wiki/Roy_Salvadori	GBR	driver_5ys9cvqh
143	downing	Ken	Downing	\N	British	\N	1917-12-05	http://en.wikipedia.org/wiki/Ken_Downing	GBR	driver_GkpAv0hh
144	graham_whitehead	Graham	Whitehead	\N	British	\N	1922-04-15	http://en.wikipedia.org/wiki/Graham_Whitehead	GBR	driver_eAXsOkpJ
145	mcalpine	Kenneth	McAlpine	\N	British	\N	1920-09-21	http://en.wikipedia.org/wiki/Kenneth_McAlpine	GBR	driver_yrcw4QPe
146	bianco	Gino	Bianco	\N	Brazilian	\N	1916-07-22	http://en.wikipedia.org/wiki/Gino_Bianco	BRA	driver_eIXMeQt1
147	crook	Tony	Crook	\N	British	\N	1920-02-16	http://en.wikipedia.org/wiki/Tony_Crook	GBR	driver_NklcrvDm
148	cantoni	Eitel	Cantoni	\N	Uruguayan	\N	1906-10-04	http://en.wikipedia.org/wiki/Eitel_Cantoni	URY	driver_aiLYaid7
149	aston	Bill	Aston	\N	British	\N	1900-03-29	http://en.wikipedia.org/wiki/Bill_Aston	GBR	driver_Qn3lJsFL
150	riess	Fritz	Riess	\N	German	\N	1922-07-11	http://en.wikipedia.org/wiki/Fritz_Riess	DEU	driver_4glDg4n2
151	niedermayr	Helmut	Niedermayr	\N	German	\N	1915-11-29	http://en.wikipedia.org/wiki/Helmut_Niedermayr	DEU	driver_uKHFR1go
152	klenk	Hans	Klenk	\N	German	\N	1919-10-28	http://en.wikipedia.org/wiki/Hans_Klenk	DEU	driver_oC8bvkID
153	klodwig	Ernst	Klodwig	\N	East German	\N	1903-05-23	http://en.wikipedia.org/wiki/Ernst_Klodwig	DEU	driver_GQu4zYVN
154	heeks	Willi	Heeks	\N	German	\N	1922-02-13	http://en.wikipedia.org/wiki/Willi_Heeks	DEU	driver_k0N5L106
155	brudes	Adolf	Brudes	\N	German	\N	1899-10-15	http://en.wikipedia.org/wiki/Adolf_Brudes	DEU	driver_6lvsVAJt
156	balsa	Marcel	Balsa	\N	French	\N	1909-01-01	http://en.wikipedia.org/wiki/Marcel_Balsa	FRA	driver_ELChM5SI
157	bechem	Günther	Bechem	\N	German	\N	1921-12-21	http://en.wikipedia.org/wiki/G%C3%BCnther_Bechem	DEU	driver_8O3yNtrg
158	krause	Rudolf	Krause	\N	East German	\N	1907-03-30	http://en.wikipedia.org/wiki/Rudolf_Krause	DEU	driver_qAHAloz3
159	schoeller	Rudolf	Schoeller	\N	Swiss	\N	1902-04-27	http://en.wikipedia.org/wiki/Rudolf_Schoeller	CHE	driver_dlCwUWLO
160	helfrich	Theo	Helfrich	\N	German	\N	1913-05-13	http://en.wikipedia.org/wiki/Theo_Helfrich	DEU	driver_8Vw6KIQs
161	peters	Josef	Peters	\N	German	\N	1914-09-16	http://en.wikipedia.org/wiki/Josef_Peters_(driver)	DEU	driver_MwEZKD75
162	flinterman	Jan	Flinterman	\N	Dutch	\N	1919-10-02	http://en.wikipedia.org/wiki/Jan_Flinterman	NLD	driver_2AxaFZO4
163	lof	Dries	van der Lof	\N	Dutch	\N	1919-08-23	http://en.wikipedia.org/wiki/Dries_van_der_Lof	NLD	driver_c7j6NWfH
164	bayol	Élie	Bayol	\N	French	\N	1914-02-28	http://en.wikipedia.org/wiki/%C3%89lie_Bayol	FRA	driver_VQVJbfn4
165	crespo	Alberto	Crespo	\N	Argentine	\N	1920-01-16	http://en.wikipedia.org/wiki/Alberto_Crespo	ARG	driver_sz1kKM70
166	dusio	Piero	Dusio	\N	Italian	\N	1899-10-13	http://en.wikipedia.org/wiki/Piero_Dusio	ITA	driver_jcoNWDEr
167	galvez	Oscar	Gálvez	\N	Argentine	\N	1913-08-17	http://en.wikipedia.org/wiki/%C3%93scar_Alfredo_G%C3%A1lvez	ARG	driver_ZGuGXLfv
168	john_barber	John	Barber	\N	British	\N	1929-07-22	http://en.wikipedia.org/wiki/John_Barber_(racing_driver)	GBR	driver_Ztxx8fme
169	menditeguy	Carlos	Menditeguy	\N	Argentine	\N	1914-08-10	http://en.wikipedia.org/wiki/Carlos_Menditeguy	ARG	driver_wJqSLDsE
170	birger	Pablo	Birger	\N	Argentine	\N	1924-01-07	http://en.wikipedia.org/wiki/Pablo_Birger	ARG	driver_FzgkhlsC
171	cruz	Adolfo	Cruz	\N	Argentine	\N	1923-06-28	http://en.wikipedia.org/wiki/Adolfo_Schewelm_Cruz	ARG	driver_rmjOuq2M
172	daywalt	Jimmy	Daywalt	\N	American	\N	1924-08-28	http://en.wikipedia.org/wiki/Jimmy_Daywalt	USA	driver_ekARyIjX
173	mccoy	Ernie	McCoy	\N	American	\N	1921-02-19	http://en.wikipedia.org/wiki/Ernie_McCoy	USA	driver_73cJftuL
174	mantz	Johnny	Mantz	\N	American	\N	1918-09-18	http://en.wikipedia.org/wiki/Johnny_Mantz	USA	driver_bYTAZlPI
175	teague	Marshall	Teague	\N	American	\N	1921-02-22	http://en.wikipedia.org/wiki/Marshall_Teague_(racing_driver)	USA	driver_QPVOmywM
176	thomson	Johnny	Thomson	\N	American	\N	1922-04-09	http://en.wikipedia.org/wiki/Johnny_Thomson	USA	driver_qmktqsTG
177	freeland	Don	Freeland	\N	American	\N	1925-03-25	http://en.wikipedia.org/wiki/Don_Freeland	USA	driver_MWvKdEPb
178	niday	Cal	Niday	\N	American	\N	1914-04-29	http://en.wikipedia.org/wiki/Cal_Niday	USA	driver_9cFwKYif
179	mieres	Roberto	Mieres	\N	Argentine	\N	1924-12-03	http://en.wikipedia.org/wiki/Roberto_Mieres	ARG	driver_4Ku5dG5x
180	wacker	Fred	Wacker	\N	American	\N	1918-07-10	http://en.wikipedia.org/wiki/Fred_Wacker	USA	driver_YT9AdnvQ
181	georges_berger	Georges	Berger	\N	Belgian	\N	1918-09-14	http://en.wikipedia.org/wiki/Georges_Berger	BEL	driver_PxoQiAy3
182	jimmy_stewart	Jimmy	Stewart	\N	British	\N	1931-03-06	http://en.wikipedia.org/wiki/Jimmy_Stewart_(racing_driver)	GBR	driver_8OlCPxbk
183	fairman	Jack	Fairman	\N	British	\N	1913-03-15	http://en.wikipedia.org/wiki/Jack_Fairman	GBR	driver_ujdZpQmt
184	ian_stewart	Ian	Stewart	\N	British	\N	1929-07-15	http://en.wikipedia.org/wiki/Ian_Stewart_(racing_driver)	GBR	driver_DVa70QcI
185	herrmann	Hans	Herrmann	\N	German	\N	1928-02-23	http://en.wikipedia.org/wiki/Hans_Herrmann	DEU	driver_e6u0apMP
186	nuckey	Rodney	Nuckey	\N	British	\N	1929-06-26	http://en.wikipedia.org/wiki/Rodney_Nuckey	GBR	driver_gg6W5Ed7
187	seidel	Wolfgang	Seidel	\N	German	\N	1926-07-04	http://en.wikipedia.org/wiki/Wolfgang_Seidel	DEU	driver_lAsn6GAs
188	barth	Edgar	Barth	\N	German	\N	1917-01-26	http://en.wikipedia.org/wiki/Edgar_Barth	DEU	driver_xSdYQS3C
189	karch	Oswald	Karch	\N	German	\N	1917-03-06	http://en.wikipedia.org/wiki/Oswald_Karch	DEU	driver_2p1qnqYl
190	fitzau	Theo	Fitzau	\N	East German	\N	1923-02-10	http://en.wikipedia.org/wiki/Theo_Fitzau	DEU	driver_xapLb55l
191	adolff	Kurt	Adolff	\N	German	\N	1921-11-05	http://en.wikipedia.org/wiki/Kurt_Adolff	DEU	driver_mMopYdgx
192	bauer	Erwin	Bauer	\N	German	\N	1912-07-17	http://en.wikipedia.org/wiki/Erwin_Bauer	DEU	driver_INDGfjg3
193	loof	Ernst	Loof	\N	German	\N	1907-07-04	http://en.wikipedia.org/wiki/Ernst_Loof	DEU	driver_yb3ut8Rt
194	lang	Hermann	Lang	\N	German	\N	1909-04-06	http://en.wikipedia.org/wiki/Hermann_Lang	DEU	driver_mtAP33zp
195	scherrer	Albert	Scherrer	\N	Swiss	\N	1908-02-28	http://en.wikipedia.org/wiki/Albert_Scherrer	CHE	driver_DGT3xXZF
196	musso	Luigi	Musso	\N	Italian	\N	1924-07-28	http://en.wikipedia.org/wiki/Luigi_Musso	ITA	driver_R9v4RzMf
197	mantovani	Sergio	Mantovani	\N	Italian	\N	1929-05-22	http://en.wikipedia.org/wiki/Sergio_Mantovani	ITA	driver_BfKEw2xb
198	maglioli	Umberto	Maglioli	\N	Italian	\N	1928-06-05	http://en.wikipedia.org/wiki/Umberto_Maglioli	ITA	driver_Fla8jwbN
199	fitch	John	Fitch	\N	American	\N	1917-08-04	http://en.wikipedia.org/wiki/John_Fitch_(driver)	USA	driver_vaZEk22a
200	loyer	Roger	Loyer	\N	French	\N	1907-08-05	http://en.wikipedia.org/wiki/Roger_Loyer	FRA	driver_mHLrrTai
201	daponte	Jorge	Daponte	\N	Argentine	\N	1923-06-05	http://en.wikipedia.org/wiki/Jorge_Daponte	ARG	driver_5UtJ3LKm
202	crockett	Larry	Crockett	\N	American	\N	1926-10-23	http://en.wikipedia.org/wiki/Larry_Crockett	USA	driver_cPAMgx3z
203	elisian	Ed	Elisian	\N	American	\N	1926-12-09	http://en.wikipedia.org/wiki/Ed_Elisian	USA	driver_y9gQVDdI
204	armi	Frank	Armi	\N	American	\N	1918-10-12	http://en.wikipedia.org/wiki/Frank_Armi	USA	driver_1G8MlcaB
205	connor	Pat	O'Connor	\N	American	\N	1928-10-09	http://en.wikipedia.org/wiki/Pat_O%27Connor_(auto_racer)	USA	driver_Lm3YmNMI
206	kladis	Danny	Kladis	\N	American	\N	1917-02-10	http://en.wikipedia.org/wiki/Danny_Kladis	USA	driver_IWHHgmn6
207	duncan	Len	Duncan	\N	American	\N	1911-07-25	http://en.wikipedia.org/wiki/Len_Duncan	USA	driver_4XwIDJvQ
208	homeier	Bill	Homeier	\N	American	\N	1918-08-31	http://en.wikipedia.org/wiki/Bill_Homeier	USA	driver_Rv6KjDXc
209	kling	Karl	Kling	\N	German	\N	1910-09-16	http://en.wikipedia.org/wiki/Karl_Kling	DEU	driver_FxNy20v4
210	pollet	Jacques	Pollet	\N	French	\N	1922-07-02	http://en.wikipedia.org/wiki/Jacques_Pollet	FRA	driver_qqxZCr1l
211	beauman	Don	Beauman	\N	British	\N	1928-07-26	http://en.wikipedia.org/wiki/Don_Beauman	GBR	driver_G6QbxaaN
212	marr	Leslie	Marr	\N	British	\N	1922-08-14	http://en.wikipedia.org/wiki/Leslie_Marr	GBR	driver_I0Y5fNX3
213	thorne	Leslie	Thorne	\N	British	\N	1916-06-23	http://en.wikipedia.org/wiki/Leslie_Thorne	GBR	driver_b2E9pD2U
214	gould	Horace	Gould	\N	British	\N	1918-09-20	http://en.wikipedia.org/wiki/Horace_Gould	GBR	driver_bcSLNCKV
215	whitehouse	Bill	Whitehouse	\N	British	\N	1909-04-01	http://en.wikipedia.org/wiki/Bill_Whitehouse	GBR	driver_BXYng6JT
216	flockhart	Ron	Flockhart	\N	British	\N	1923-06-16	http://en.wikipedia.org/wiki/Ron_Flockhart_(auto_racing)	GBR	driver_Vcb8MOWd
217	riseley_prichard	John	Riseley-Prichard	\N	British	\N	1924-01-17	http://en.wikipedia.org/wiki/John_Riseley-Prichard	GBR	driver_P3DnunLo
218	bucci	Clemar	Bucci	\N	Argentine	\N	1920-09-04	http://en.wikipedia.org/wiki/Clemar_Bucci	ARG	driver_5saiqL7b
219	riu	Giovanni	de Riu	\N	Italian	\N	1925-03-10	http://en.wikipedia.org/wiki/Giovanni_de_Riu	ITA	driver_xMBT1ckc
220	volonterio	Ottorino	Volonterio	\N	Swiss	\N	1917-12-07	http://en.wikipedia.org/wiki/Ottorino_Volonterio	CHE	driver_JVJHyF3X
221	iglesias	Jesús	Iglesias	\N	Argentine	\N	1922-02-22	http://en.wikipedia.org/wiki/Jes%C3%BAs_Iglesias	ARG	driver_T6Ef1r96
222	castellotti	Eugenio	Castellotti	\N	Italian	\N	1930-10-10	http://en.wikipedia.org/wiki/Eugenio_Castellotti	ITA	driver_phksPFuw
223	uria	Alberto	Uria	\N	Uruguayan	\N	1924-07-11	http://en.wikipedia.org/wiki/Alberto_Uria	URY	driver_zlSmwiT7
224	perdisa	Cesare	Perdisa	\N	Italian	\N	1932-10-21	http://en.wikipedia.org/wiki/Cesare_Perdisa	ITA	driver_DyXdBBCM
225	whiteaway	Ted	Whiteaway	\N	British	\N	1928-11-01	http://en.wikipedia.org/wiki/Ted_Whiteaway	GBR	driver_l75ehmhj
226	herman	Al	Herman	\N	American	\N	1927-03-15	http://en.wikipedia.org/wiki/Al_Herman	USA	driver_EkvpDFOh
227	weyant	Chuck	Weyant	\N	American	\N	1923-04-03	http://en.wikipedia.org/wiki/Chuck_Weyant	USA	driver_l9oXjdCn
228	templeman	Shorty	Templeman	\N	American	\N	1919-08-12	http://en.wikipedia.org/wiki/Shorty_Templeman	USA	driver_s7lFGVwZ
229	andrews	Keith	Andrews	\N	American	\N	1920-06-15	http://en.wikipedia.org/wiki/Keith_Andrews_(driver)	USA	driver_wNlpAF93
230	russo	Eddie	Russo	\N	American	\N	1925-11-19	http://en.wikipedia.org/wiki/Eddie_Russo	USA	driver_odGgXwQC
231	ray_crawford	Ray	Crawford	\N	American	\N	1915-10-26	http://en.wikipedia.org/wiki/Ray_Crawford	USA	driver_orvRS7br
232	keller	Al	Keller	\N	American	\N	1920-04-11	http://en.wikipedia.org/wiki/Al_Keller	USA	driver_PqZfby8v
233	boyd	Johnny	Boyd	\N	American	\N	1926-08-19	http://en.wikipedia.org/wiki/Johnny_Boyd	USA	driver_uek7skhY
234	ramos	Hernando	da Silva Ramos	\N	Brazilian	\N	1925-12-07	http://en.wikipedia.org/wiki/Hernando_da_Silva_Ramos	BRA	driver_dYkKhzKx
235	sparken	Mike	Sparken	\N	French	\N	1930-06-16	http://en.wikipedia.org/wiki/Mike_Sparken	FRA	driver_rK18pE7P
236	jack_brabham	Jack	Brabham	\N	Australian	\N	1926-04-02	http://en.wikipedia.org/wiki/Jack_Brabham	AUS	driver_nH1aJ0CT
237	lucas	Jean	Lucas	\N	French	\N	1917-04-25	http://en.wikipedia.org/wiki/Jean_Lucas	FRA	driver_uNRXN452
238	piotti	Luigi	Piotti	\N	Italian	\N	1913-10-27	http://en.wikipedia.org/wiki/Luigi_Piotti	ITA	driver_NTMeV0QA
239	gerini	Gerino	Gerini	\N	Italian	\N	1928-08-10	http://en.wikipedia.org/wiki/Gerino_Gerini_(racing_driver)	ITA	driver_AQX1wdAF
240	gendebien	Olivier	Gendebien	\N	Belgian	\N	1924-01-12	http://en.wikipedia.org/wiki/Olivier_Gendebien	BEL	driver_zMr7msYe
241	oscar_gonzalez	Óscar	González	\N	Uruguayan	\N	1923-11-10	http://en.wikipedia.org/wiki/%C3%93scar_Gonz%C3%A1lez_(racing_driver)	URY	driver_dwActz0A
242	scarlatti	Giorgio	Scarlatti	\N	Italian	\N	1921-10-02	http://en.wikipedia.org/wiki/Giorgio_Scarlatti	ITA	driver_A1Mvak9o
243	brooks	Tony	Brooks	\N	British	\N	1932-02-25	http://en.wikipedia.org/wiki/Tony_Brooks	GBR	driver_tDtWN7DN
244	veith	Bob	Veith	\N	American	\N	1926-11-01	http://en.wikipedia.org/wiki/Bob_Veith	USA	driver_O1OzXAB9
245	christie	Bob	Christie	\N	American	\N	1924-04-04	http://en.wikipedia.org/wiki/Bob_Christie_(racing_driver)	USA	driver_tTDgzTyR
246	garrett	Billy	Garrett	\N	American	\N	1933-04-24	http://en.wikipedia.org/wiki/Billy_Garrett	USA	driver_Wq8Q3YZl
247	tolan	Johnnie	Tolan	\N	American	\N	1917-10-22	http://en.wikipedia.org/wiki/Johnnie_Tolan	USA	driver_0R0828br
248	turner	Jack	Turner	\N	American	\N	1920-02-12	http://en.wikipedia.org/wiki/Jack_Turner_(driver)	USA	driver_CyszNbvi
249	scotti	Piero	Scotti	\N	Italian	\N	1909-11-11	http://en.wikipedia.org/wiki/Piero_Scotti	ITA	driver_hZwC7d0N
250	portago	Alfonso	de Portago	\N	Spanish	\N	1928-10-11	http://en.wikipedia.org/wiki/Alfonso_de_Portago	ESP	driver_U3kYcOFa
251	chapman	Colin	Chapman	\N	British	\N	1928-05-19	http://en.wikipedia.org/wiki/Colin_Chapman	GBR	driver_PzyIXcYt
252	titterington	Desmond	Titterington	\N	British	\N	1928-05-01	http://en.wikipedia.org/wiki/Desmond_Titterington	GBR	driver_ocHzL1kH
253	halford	Bruce	Halford	\N	British	\N	1931-05-18	http://en.wikipedia.org/wiki/Bruce_Halford	GBR	driver_M6GI7wQR
254	scott_Brown	Archie	Scott Brown	\N	British	\N	1927-05-13	http://en.wikipedia.org/wiki/Archie_Scott_Brown	GBR	driver_vyibvdjt
255	emery	Paul	Emery	\N	British	\N	1916-11-12	http://en.wikipedia.org/wiki/Paul_Emery	GBR	driver_R31KYZyd
256	milhoux	André	Milhoux	\N	Belgian	\N	1928-12-09	http://en.wikipedia.org/wiki/Andr%C3%A9_Milhoux	BEL	driver_Z3ZQ7DVb
257	bonnier	Jo	Bonnier	\N	Swedish	\N	1930-01-31	http://en.wikipedia.org/wiki/Joakim_Bonnier	SWE	driver_2RyIuJcK
258	leston	Les	Leston	\N	British	\N	1920-12-16	http://en.wikipedia.org/wiki/Les_Leston	GBR	driver_5FX2tbsc
259	trips	Wolfgang	von Trips	\N	German	\N	1928-05-04	http://en.wikipedia.org/wiki/Wolfgang_Graf_Berghe_von_Trips	DEU	driver_kpnWbx3q
260	tomaso	Alessandro	de Tomaso	\N	Argentine	\N	1928-07-10	http://en.wikipedia.org/wiki/Alessandro_de_Tomaso	ARG	driver_e9E9txmm
261	gregory	Masten	Gregory	\N	American	\N	1932-02-29	http://en.wikipedia.org/wiki/Masten_Gregory	USA	driver_8i6dN9Hs
262	lewis-evans	Stuart	Lewis-Evans	\N	British	\N	1930-04-20	http://en.wikipedia.org/wiki/Stuart_Lewis-Evans	GBR	driver_zG6hq1UY
263	bueb	Ivor	Bueb	\N	British	\N	1923-06-06	http://en.wikipedia.org/wiki/Ivor_Bueb	GBR	driver_Y2NsX8s2
264	edmunds	Don	Edmunds	\N	American	\N	1930-09-23	http://en.wikipedia.org/wiki/Don_Edmunds	USA	driver_V09yfGOL
265	sachs	Eddie	Sachs	\N	American	\N	1927-05-28	http://en.wikipedia.org/wiki/Eddie_Sachs	USA	driver_SGnBu0dr
266	magill	Mike	Magill	\N	American	\N	1920-02-08	http://en.wikipedia.org/wiki/Mike_Magill	USA	driver_0Yo7TUNy
267	cheesbourg	Bill	Cheesbourg	\N	American	\N	1927-06-12	http://en.wikipedia.org/wiki/Bill_Cheesbourg	USA	driver_bzPPuFxC
268	george	Elmer	George	\N	American	\N	1928-07-15	http://en.wikipedia.org/wiki/Elmer_George	USA	driver_i0WZQ1lQ
269	macdowel	Mike	MacDowel	\N	British	\N	1932-09-13	http://en.wikipedia.org/wiki/Mike_MacDowel	GBR	driver_njFJpbf7
270	mackay-fraser	Herbert	MacKay-Fraser	\N	American	\N	1927-06-23	http://en.wikipedia.org/wiki/Herbert_MacKay-Fraser	USA	driver_AlJbandX
271	naylor	Brian	Naylor	\N	British	\N	1923-03-24	http://en.wikipedia.org/wiki/Brian_Naylor	GBR	driver_aAksrF4J
272	beaufort	Carel Godin	de Beaufort	\N	Dutch	\N	1934-04-10	http://en.wikipedia.org/wiki/Carel_Godin_de_Beaufort	NLD	driver_JgVznoGx
273	marsh	Tony	Marsh	\N	British	\N	1931-07-20	http://en.wikipedia.org/wiki/Tony_Marsh_(racing_driver)	GBR	driver_2NhfDdmn
274	england	Paul	England	\N	Australian	\N	1929-03-28	http://en.wikipedia.org/wiki/Paul_England	AUS	driver_EVtiP8rF
275	gibson	Dick	Gibson	\N	British	\N	1918-04-16	http://en.wikipedia.org/wiki/Dick_Gibson	GBR	driver_VOuhmB80
276	allison	Cliff	Allison	\N	British	\N	1932-02-08	http://en.wikipedia.org/wiki/Cliff_Allison	GBR	driver_kSETEdJp
277	hill	Graham	Hill	\N	British	\N	1929-02-15	http://en.wikipedia.org/wiki/Graham_Hill	GBR	driver_fq0Cdhjo
278	kavanagh	Ken	Kavanagh	\N	Australian	\N	1923-12-12	http://en.wikipedia.org/wiki/Ken_Kavanagh	AUS	driver_WiXfvSGF
279	kessler	Bruce	Kessler	\N	American	\N	1936-03-23	http://en.wikipedia.org/wiki/Bruce_Kessler	USA	driver_royP1df5
280	filippis	Maria	de Filippis	\N	Italian	\N	1926-11-11	http://en.wikipedia.org/wiki/Maria_Teresa_de_Filippis	ITA	driver_eKDnLIDl
281	testut	André	Testut	\N	Monegasque	\N	1926-04-13	http://en.wikipedia.org/wiki/Andr%C3%A9_Testut	MCO	driver_aWY0B1zw
282	cabianca	Giulio	Cabianca	\N	Italian	\N	1923-02-19	http://en.wikipedia.org/wiki/Giulio_Cabianca	ITA	driver_znDS6Jbo
283	ecclestone	Bernie	Ecclestone	\N	British	\N	1930-10-28	http://en.wikipedia.org/wiki/Bernie_Ecclestone	GBR	driver_2iwFXXxp
284	taramazzo	Luigi	Taramazzo	\N	Italian	\N	1932-05-05	http://en.wikipedia.org/wiki/Luigi_Taramazzo	ITA	driver_HcKg9Ksm
285	george_amick	George	Amick	\N	American	\N	1924-10-24	http://en.wikipedia.org/wiki/George_Amick	USA	driver_ykX8xdbp
286	larson	Jud	Larson	\N	American	\N	1923-01-21	http://en.wikipedia.org/wiki/Jud_Larson	USA	driver_Gme2u5qa
287	dempsey_wilson	Dempsey	Wilson	\N	American	\N	1927-03-11	http://en.wikipedia.org/wiki/Dempsey_Wilson	USA	driver_rBCPeYmU
288	foyt	Anthony	Foyt	\N	American	\N	1935-01-16	http://en.wikipedia.org/wiki/A.J._Foyt	USA	driver_8aEJahyw
289	goldsmith	Paul	Goldsmith	\N	American	\N	1925-10-02	http://en.wikipedia.org/wiki/Paul_Goldsmith	USA	driver_cKYUaFrR
290	jerry_unser	Jerry	Unser	\N	American	\N	1932-11-15	http://en.wikipedia.org/wiki/Jerry_Unser	USA	driver_wOoTeb6Y
291	sutton	Len	Sutton	\N	American	\N	1925-08-09	http://en.wikipedia.org/wiki/Len_Sutton	USA	driver_tvmsTKQ3
292	bisch	Art	Bisch	\N	American	\N	1926-11-10	http://en.wikipedia.org/wiki/Art_Bisch	USA	driver_xGJM3RpX
293	phil_hill	Phil	Hill	\N	American	\N	1927-04-20	http://en.wikipedia.org/wiki/Phil_Hill	USA	driver_0Rv1smUb
294	shelby	Carroll	Shelby	\N	American	\N	1923-01-11	http://en.wikipedia.org/wiki/Carroll_Shelby	USA	driver_wJVdTxKQ
295	burgess	Ian	Burgess	\N	British	\N	1930-07-06	http://en.wikipedia.org/wiki/Ian_Burgess	GBR	driver_lOIbeSfK
296	stacey	Alan	Stacey	\N	British	\N	1933-08-29	http://en.wikipedia.org/wiki/Alan_Stacey	GBR	driver_iAp7ersQ
297	mclaren	Bruce	McLaren	\N	New Zealander	\N	1937-08-30	http://en.wikipedia.org/wiki/Bruce_McLaren	NZL	driver_SC7BbR1C
298	goethals	Christian	Goethals	\N	Belgian	\N	1928-08-04	http://en.wikipedia.org/wiki/Christian_Goethals	BEL	driver_yRyFEv0Z
299	la_caze	Robert	La Caze	\N	French	\N	1917-02-26	http://en.wikipedia.org/wiki/Robert_La_Caze	FRA	driver_hocrJ1Ad
300	guelfi	André	Guelfi	\N	French	\N	1919-05-06	http://en.wikipedia.org/wiki/Andr%C3%A9_Guelfi	FRA	driver_E3elvaPw
301	picard	François	Picard	\N	French	\N	1921-04-26	http://en.wikipedia.org/wiki/Fran%C3%A7ois_Picard	FRA	driver_p5XFIYfB
302	bridger	Tom	Bridger	\N	British	\N	1934-06-24	http://en.wikipedia.org/wiki/Tom_Bridger	GBR	driver_kmsL6yD8
303	Changy	Alain	de Changy	\N	Belgian	\N	1922-02-05	http://en.wikipedia.org/wiki/Alain_de_Changy	BEL	driver_wQjSJshf
304	bianchi	Lucien	Bianchi	BIA	Belgian	\N	1934-11-10	http://en.wikipedia.org/wiki/Lucien_Bianchi	BEL	driver_4bJCuEHq
305	lovely	Pete	Lovely	\N	American	\N	1926-04-11	http://en.wikipedia.org/wiki/Pete_Lovely	USA	driver_HG4z1fQr
306	lucienbonnet	Jean	Lucienbonnet	\N	French	\N	1923-01-07	http://en.wikipedia.org/wiki/Jean_Lucienbonnet	FRA	driver_Anh0uMoi
307	arnold	Chuck	Arnold	\N	American	\N	1926-05-30	http://en.wikipedia.org/wiki/Chuck_Arnold	USA	driver_P2YQvHSt
308	mcwithey	Jim	McWithey	\N	American	\N	1927-07-04	http://en.wikipedia.org/wiki/Jim_McWithey	USA	driver_kLTupJvi
309	branson	Don	Branson	\N	American	\N	1920-06-02	http://en.wikipedia.org/wiki/Don_Branson	USA	driver_wlxMbj2Q
310	grim	Bobby	Grim	\N	American	\N	1924-09-04	http://en.wikipedia.org/wiki/Bobby_Grim	USA	driver_XUXJ3cN2
311	amick	Red	Amick	\N	American	\N	1929-01-19	http://en.wikipedia.org/wiki/Red_Amick	USA	driver_kWzQr51h
312	ireland	Innes	Ireland	\N	British	\N	1930-06-12	http://en.wikipedia.org/wiki/Innes_Ireland	GBR	driver_aTseCE08
313	orey	Fritz	d'Orey	\N	Brazilian	\N	1938-03-25	http://en.wikipedia.org/wiki/Fritz_d%27Orey	BRA	driver_1zQvI7kS
314	gurney	Dan	Gurney	\N	American	\N	1931-04-13	http://en.wikipedia.org/wiki/Dan_Gurney	USA	driver_ywnZvkxc
315	davis	Colin	Davis	\N	British	\N	1933-07-29	http://en.wikipedia.org/wiki/Colin_Davis_(driver)	GBR	driver_8aob2o4b
316	fontes	Azdrubal	Fontes	\N	Uruguayan	\N	1922-12-26	http://en.wikipedia.org/wiki/Azdrubal_Fontes	URY	driver_eKN0kVMw
317	bristow	Chris	Bristow	\N	British	\N	1937-12-02	http://en.wikipedia.org/wiki/Chris_Bristow	GBR	driver_ZFjZyryA
318	henry_taylor	Henry	Taylor	\N	British	\N	1932-12-16	http://en.wikipedia.org/wiki/Henry_Taylor_(racing_driver)	GBR	driver_Anw7K1VY
319	ashdown	Peter	Ashdown	\N	British	\N	1934-10-16	http://en.wikipedia.org/wiki/Peter_Ashdown	GBR	driver_GDI5ZYoD
320	piper	David	Piper	\N	British	\N	1930-12-02	http://en.wikipedia.org/wiki/David_Piper	GBR	driver_lyH7ANLV
321	mike_taylor	Mike	Taylor	\N	British	\N	1934-04-24	http://en.wikipedia.org/wiki/Mike_Taylor_(driver)	GBR	driver_Jn1N5YKu
322	greene	Keith	Greene	\N	British	\N	1938-01-05	http://en.wikipedia.org/wiki/Keith_Greene	GBR	driver_0BOQRtu9
323	bill_moss	Bill	Moss	\N	British	\N	1933-09-04	http://en.wikipedia.org/wiki/Bill_Moss_(racing_driver)	GBR	driver_qWhsEK6p
324	parkes	Mike	Parkes	\N	British	\N	1931-09-24	http://en.wikipedia.org/wiki/Mike_Parkes	GBR	driver_yv9icHgN
325	dennis_taylor	Dennis	Taylor	\N	British	\N	1921-06-12	http://en.wikipedia.org/wiki/Dennis_Taylor_(racing_driver)	GBR	driver_PnlFaiR5
326	trevor_taylor	Trevor	Taylor	\N	British	\N	1936-12-26	http://en.wikipedia.org/wiki/Trevor_Taylor	GBR	driver_raESLbgQ
327	parnell	Tim	Parnell	\N	British	\N	1932-06-25	http://en.wikipedia.org/wiki/Tim_Parnell	GBR	driver_a7856cHn
328	cabral	Mário de Araújo	Cabral	\N	Portuguese	\N	1934-01-15	http://en.wikipedia.org/wiki/Mario_de_Araujo_Cabral	PRT	driver_df6diWQo
329	blanchard	Harry	Blanchard	\N	American	\N	1929-06-13	http://en.wikipedia.org/wiki/Harry_Blanchard	USA	driver_MvLLQvs9
330	constantine	George	Constantine	\N	American	\N	1918-02-22	http://en.wikipedia.org/wiki/George_Constantine	USA	driver_FWvD4Ip8
331	said	Bob	Said	\N	American	\N	1932-05-05	http://en.wikipedia.org/wiki/Bob_Said	USA	driver_4xa7Y8mV
332	cade	Phil	Cade	\N	American	\N	1916-06-12	http://en.wikipedia.org/wiki/Phil_Cade	USA	driver_ZgAMzd08
333	larreta	Alberto Rodriguez	Larreta	\N	Argentine	\N	1934-01-14	http://en.wikipedia.org/wiki/Alberto_Rodriguez_Larreta	ARG	driver_ISq4bk0b
334	bonomi	Roberto	Bonomi	\N	Argentine	\N	1919-09-30	http://en.wikipedia.org/wiki/Roberto_Bonomi	ARG	driver_NBYeRlFJ
335	munaron	Gino	Munaron	\N	Italian	\N	1928-04-02	http://en.wikipedia.org/wiki/Gino_Munaron	ITA	driver_zz4qTjEK
336	estefano	Nasif	Estéfano	\N	Argentine	\N	1932-11-18	http://en.wikipedia.org/wiki/Nasif_Est%C3%A9fano	ARG	driver_oYgW5JYp
337	chimeri	Ettore	Chimeri	\N	Venezuelan	\N	1921-06-04	http://en.wikipedia.org/wiki/Ettore_Chimeri	VEN	driver_N8SnLUve
338	creus	Antonio	Creus	\N	Spanish	\N	1924-10-28	http://en.wikipedia.org/wiki/Antonio_Creus	ESP	driver_H135Om4c
339	ginther	Richie	Ginther	\N	American	\N	1930-08-05	http://en.wikipedia.org/wiki/Richie_Ginther	USA	driver_BnqlVIxW
340	surtees	John	Surtees	\N	British	\N	1934-02-11	http://en.wikipedia.org/wiki/John_Surtees	GBR	driver_s7nn3Kvo
341	daigh	Chuck	Daigh	\N	American	\N	1923-11-29	http://en.wikipedia.org/wiki/Chuck_Daigh	USA	driver_7ZhyVz7n
342	reventlow	Lance	Reventlow	\N	American	\N	1936-02-24	http://en.wikipedia.org/wiki/Lance_Reventlow	USA	driver_J3lc8Tax
343	ruby	Lloyd	Ruby	\N	American	\N	1928-01-12	http://en.wikipedia.org/wiki/Lloyd_Ruby	USA	driver_shHw0Pf9
344	tingelstad	Bud	Tingelstad	\N	American	\N	1928-04-04	http://en.wikipedia.org/wiki/Bud_Tingelstad	USA	driver_pH4hKFFV
345	hurtubise	Jim	Hurtubise	\N	American	\N	1932-12-05	http://en.wikipedia.org/wiki/Jim_Hurtubise	USA	driver_O4iPXL23
346	weiler	Wayne	Weiler	\N	American	\N	1934-12-09	http://en.wikipedia.org/wiki/Wayne_Weiler	USA	driver_oSesi2kh
347	clark	Jim	Clark	\N	British	\N	1936-03-04	http://en.wikipedia.org/wiki/Jim_Clark	GBR	driver_ZC001F4C
348	mairesse	Willy	Mairesse	\N	Belgian	\N	1928-10-01	http://en.wikipedia.org/wiki/Willy_Mairesse	BEL	driver_BQJ5rA73
349	drogo	Piero	Drogo	\N	Italian	\N	1926-08-08	http://en.wikipedia.org/wiki/Piero_Drogo	ITA	driver_rfMEnu3M
350	gamble	Fred	Gamble	\N	American	\N	1932-03-17	http://en.wikipedia.org/wiki/Fred_Gamble_(racing_driver)	USA	driver_b0ZnIPx7
351	thiele	Alfonso	Thiele	\N	Italian	\N	1920-04-05	http://en.wikipedia.org/wiki/Alfonso_Thiele	ITA	driver_zAqagh9e
352	vic_wilson	Vic	Wilson	\N	British	\N	1931-04-14	http://en.wikipedia.org/wiki/Vic_Wilson_(motor_racing_driver)	GBR	driver_dGJ3LEEr
353	owen	Arthur	Owen	\N	British	\N	1915-03-23	http://en.wikipedia.org/wiki/Arthur_Owen	GBR	driver_jaj8HbOf
354	hall	Jim	Hall	\N	American	\N	1935-07-23	http://en.wikipedia.org/wiki/Jim_Hall_(race_car_driver)	USA	driver_aHxM1sqD
355	drake	Bob	Drake	\N	American	\N	1919-12-14	http://en.wikipedia.org/wiki/Bob_Drake_(Formula_One)	USA	driver_vCTUboRP
356	may	Michael	May	\N	Swiss	\N	1934-08-18	http://en.wikipedia.org/wiki/Michael_May_(racing_driver)	CHE	driver_2e2wSB2t
357	lewis	Jackie	Lewis	\N	British	\N	1936-11-01	http://en.wikipedia.org/wiki/Jackie_Lewis	GBR	driver_FX9nrw7g
358	bandini	Lorenzo	Bandini	\N	Italian	\N	1935-12-21	http://en.wikipedia.org/wiki/Lorenzo_Bandini	ITA	driver_pgWqTLkj
359	baghetti	Giancarlo	Baghetti	\N	Italian	\N	1934-12-25	http://en.wikipedia.org/wiki/Giancarlo_Baghetti	ITA	driver_t3cK7FVb
360	collomb	Bernard	Collomb	\N	French	\N	1930-10-07	http://en.wikipedia.org/wiki/Bernard_Collomb	FRA	driver_VnG9zGfi
361	bordeu	Juan Manuel	Bordeu	\N	Argentine	\N	1934-01-28	http://en.wikipedia.org/wiki/Juan_Manuel_Bordeu	ARG	driver_qGyWykFR
362	maggs	Tony	Maggs	\N	South African	\N	1937-02-09	http://en.wikipedia.org/wiki/Tony_Maggs	ZAF	driver_1qIFzxdx
363	ashmore	Gerry	Ashmore	\N	British	\N	1936-07-25	http://en.wikipedia.org/wiki/Gerry_Ashmore	GBR	driver_CYZLMda0
364	natili	Massimo	Natili	\N	Italian	\N	1935-07-28	http://en.wikipedia.org/wiki/Massimo_Natili	ITA	driver_MHeKWwop
365	monteverdi	Peter	Monteverdi	\N	Swiss	\N	1934-06-07	http://en.wikipedia.org/wiki/Peter_Monteverdi	CHE	driver_U4i8d1yU
366	pirocchi	Renato	Pirocchi	\N	Italian	\N	1933-03-26	http://en.wikipedia.org/wiki/Renato_Pirocchi	ITA	driver_snEvLbYW
367	duke	Geoff	Duke	\N	British	\N	1923-03-29	http://en.wikipedia.org/wiki/Geoff_Duke	GBR	driver_VHyOwrZP
368	campbell-jones	John	Campbell-Jones	\N	British	\N	1930-01-21	http://en.wikipedia.org/wiki/John_Campbell-Jones	GBR	driver_iJC193gu
369	starrabba	Gaetano	Starrabba	\N	Italian	\N	1932-12-03	http://en.wikipedia.org/wiki/Gaetano_Starrabba	ITA	driver_W63GsnFZ
370	ricardo_rodriguez	Ricardo	Rodríguez	\N	Mexican	\N	1942-02-14	http://en.wikipedia.org/wiki/Ricardo_Rodr%C3%ADguez_(Formula_One)	MEX	driver_qPRWmjjn
371	vaccarella	Nino	Vaccarella	\N	Italian	\N	1933-03-04	http://en.wikipedia.org/wiki/Nino_Vaccarella	ITA	driver_maJ7aipS
372	bussinello	Roberto	Bussinello	\N	Italian	\N	1927-10-04	http://en.wikipedia.org/wiki/Roberto_Bussinello	ITA	driver_W1EeI1iC
373	lippi	Roberto	Lippi	\N	Italian	\N	1926-10-17	http://en.wikipedia.org/wiki/Roberto_Lippi	ITA	driver_KV8y4CiC
374	prinoth	Ernesto	Prinoth	\N	Italian	\N	1923-04-15	http://en.wikipedia.org/wiki/Ernesto_Prinoth	ITA	driver_0uOsFMBx
375	boffa	Menato	Boffa	\N	Italian	\N	1930-01-04	http://en.wikipedia.org/wiki/Menato_Boffa	ITA	driver_MJj6Sh43
376	penske	Roger	Penske	\N	American	\N	1937-02-20	http://en.wikipedia.org/wiki/Roger_Penske	USA	driver_Z05QWzcI
377	ryan	Peter	Ryan	\N	Canadian	\N	1940-06-10	http://en.wikipedia.org/wiki/Peter_Ryan_(driver)	CAN	driver_tLMPDxX8
378	sharp	Hap	Sharp	\N	American	\N	1928-01-01	http://en.wikipedia.org/wiki/Hap_Sharp	USA	driver_hpWjZ7AI
379	hansgen	Walt	Hansgen	\N	American	\N	1919-10-28	http://en.wikipedia.org/wiki/Walt_Hansgen	USA	driver_w3jHBMxr
380	ken_miles	Ken	Miles	\N	British	\N	1918-11-01	http://en.wikipedia.org/wiki/Ken_Miles	GBR	driver_77G94vAi
381	pon	Ben	Pon	\N	Dutch	\N	1936-12-09	http://en.wikipedia.org/wiki/Ben_Pon	NLD	driver_8X7hAXKj
382	slotemaker	Rob	Slotemaker	\N	Dutch	\N	1929-06-13	http://en.wikipedia.org/wiki/Rob_Slotemaker	NLD	driver_dLeRk2lL
600	daly	Derek	Daly	\N	Irish	\N	1953-03-11	http://en.wikipedia.org/wiki/Derek_Daly	IRL	driver_j1sOfAWP
383	siffert	Jo	Siffert	\N	Swiss	\N	1936-07-07	http://en.wikipedia.org/wiki/Jo_Siffert	CHE	driver_Dfuhbt9M
384	schiller	Heinz	Schiller	\N	Swiss	\N	1930-01-25	http://en.wikipedia.org/wiki/Heinz_Schiller	CHE	driver_iPIzwQoX
385	arundell	Peter	Arundell	\N	British	\N	1933-11-08	http://en.wikipedia.org/wiki/Peter_Arundell	GBR	driver_R4x4Io2G
386	abate	Carlo	Abate	\N	Italian	\N	1932-07-10	http://en.wikipedia.org/wiki/Carlo_Mario_Abate	ITA	driver_MIKXAGqu
387	settember	Tony	Settember	\N	American	\N	1926-07-10	http://en.wikipedia.org/wiki/Tony_Settember	USA	driver_UHzIVNvg
388	chamberlain	Jay	Chamberlain	\N	American	\N	1925-12-29	http://en.wikipedia.org/wiki/Jay_Chamberlain	USA	driver_PQF7hxqQ
389	shelly	Tony	Shelly	\N	New Zealander	\N	1937-02-02	http://en.wikipedia.org/wiki/Tony_Shelly	NZL	driver_6qHDa4NZ
390	walter	Heini	Walter	\N	Swiss	\N	1927-07-28	http://en.wikipedia.org/wiki/Heini_Walter	CHE	driver_OloVilc3
391	seiffert	Günther	Seiffert	\N	German	\N	1937-10-18	http://en.wikipedia.org/wiki/G%C3%BCnther_Seiffert	DEU	driver_ptKDhVAv
392	kuhnke	Kurt	Kuhnke	\N	German	\N	1910-04-30	http://en.wikipedia.org/wiki/Kurt_Kuhnke	DEU	driver_D48dIKr8
393	schroeder	Rob	Schroeder	\N	British	\N	1926-05-11	http://en.wikipedia.org/wiki/Rob_Schroeder	GBR	driver_HBtsWU5j
394	mayer	Timmy	Mayer	\N	American	\N	1938-02-22	http://en.wikipedia.org/wiki/Timmy_Mayer	USA	driver_WR1cvg2D
395	lederle	Neville	Lederle	\N	South African	\N	1938-09-25	http://en.wikipedia.org/wiki/Neville_Lederle	ZAF	driver_M68JsRNM
396	love	John	Love	\N	Rhodesian	\N	1924-12-07	http://en.wikipedia.org/wiki/John_Love_(racing_driver)	RSR	driver_Hw8gfOU8
397	johnstone	Bruce	Johnstone	\N	South African	\N	1937-01-30	http://en.wikipedia.org/wiki/Bruce_Johnstone_(racing_driver)	ZAF	driver_zfIKeNNz
398	pieterse	Ernie	Pieterse	\N	South African	\N	1938-07-04	http://en.wikipedia.org/wiki/Ernie_Pieterse	ZAF	driver_IM96eNSs
399	serrurier	Doug	Serrurier	\N	South African	\N	1920-12-09	http://en.wikipedia.org/wiki/Doug_Serrurier	ZAF	driver_i6JudFDx
400	harris	Mike	Harris	\N	South African	\N	1939-05-25	http://en.wikipedia.org/wiki/Mike_Harris_(race_car_driver)	ZAF	driver_0j9FBCne
401	hocking	Gary	Hocking	\N	Rhodesian	\N	1937-09-30	http://en.wikipedia.org/wiki/Gary_Hocking	RSR	driver_sx1BVAOe
402	vyver	Syd	van der Vyver	\N	South African	\N	1920-06-01	http://en.wikipedia.org/wiki/Syd_van_der_Vyver	ZAF	driver_aHEbN6lc
403	tingle	Sam	Tingle	\N	Rhodesian	\N	1921-08-24	http://en.wikipedia.org/wiki/Sam_Tingle	RSR	driver_hbEGKxhI
404	amon	Chris	Amon	\N	New Zealander	\N	1943-07-20	http://en.wikipedia.org/wiki/Chris_Amon	NZL	driver_MmEwPceC
405	scarfiotti	Ludovico	Scarfiotti	\N	Italian	\N	1933-10-18	http://en.wikipedia.org/wiki/Ludovico_Scarfiotti	ITA	driver_mGzzws8K
406	mitter	Gerhard	Mitter	\N	German	\N	1935-08-30	http://en.wikipedia.org/wiki/Gerhard_Mitter	DEU	driver_1ZHYtSQS
407	hailwood	Mike	Hailwood	\N	British	\N	1940-04-02	http://en.wikipedia.org/wiki/Mike_Hailwood	GBR	driver_Tn34UB8p
408	anderson	Bob	Anderson	\N	British	\N	1931-05-19	http://en.wikipedia.org/wiki/Bob_Anderson_(racing_driver)	GBR	driver_r38VcL1c
409	raby	Ian	Raby	\N	British	\N	1921-09-22	http://en.wikipedia.org/wiki/Ian_Raby	GBR	driver_ivxF98Md
410	spence	Mike	Spence	\N	British	\N	1936-12-30	http://en.wikipedia.org/wiki/Mike_Spence	GBR	driver_uIZRTyxg
411	ernesto_brambilla	Ernesto	Brambilla	\N	Italian	\N	1934-01-31	http://en.wikipedia.org/wiki/Ernesto_Brambilla	ITA	driver_0BiyGBTO
412	broeker	Peter	Broeker	\N	Canadian	\N	1926-05-15	http://en.wikipedia.org/wiki/Peter_Broeker	CAN	driver_jSq4UU6C
413	rodriguez	Pedro	Rodríguez	\N	Mexican	\N	1940-01-18	http://en.wikipedia.org/wiki/Pedro_Rodr%C3%ADguez_(racing_driver)	MEX	driver_DRQdBLaR
414	vos	Ernie	de Vos	\N	Dutch	\N	1941-07-01	http://en.wikipedia.org/wiki/Ernie_de_Vos	NLD	driver_AgzP678V
415	solana	Moisés	Solana	\N	Mexican	\N	1935-12-26	http://en.wikipedia.org/wiki/Mois%C3%A9s_Solana	MEX	driver_thpXHemI
416	dochnal	Frank	Dochnal	\N	American	\N	1920-10-08	http://en.wikipedia.org/wiki/Frank_Dochnal	USA	driver_WiNVLVVp
417	monarch	Thomas	Monarch	\N	American	\N	1945-09-03	http://en.wikipedia.org/wiki/Talk:1963_Mexican_Grand_Prix#Who_was_Thomas_Monarch.3F	USA	driver_oKqfyMMf
418	blokdyk	Trevor	Blokdyk	\N	South African	\N	1935-11-30	http://en.wikipedia.org/wiki/Trevor_Blokdyk	ZAF	driver_yfc62DVt
419	niemann	Brausch	Niemann	\N	South African	\N	1939-01-07	http://en.wikipedia.org/wiki/Brausch_Niemann	ZAF	driver_gHkKxT2P
420	klerk	Peter	de Klerk	\N	South African	\N	1935-03-16	http://en.wikipedia.org/wiki/Peter_de_Klerk	ZAF	driver_AK24Jf8e
421	prophet	David	Prophet	\N	British	\N	1937-10-09	http://en.wikipedia.org/wiki/David_Prophet	GBR	driver_QDdkLdZS
422	driver	Paddy	Driver	\N	South African	\N	1934-05-13	http://en.wikipedia.org/wiki/Paddy_Driver	ZAF	driver_i674N2GQ
423	revson	Peter	Revson	\N	American	\N	1939-02-27	http://en.wikipedia.org/wiki/Peter_Revson	USA	driver_VLVFGKmQ
424	taylor	John	Taylor	\N	British	\N	1933-03-23	http://en.wikipedia.org/wiki/John_Taylor_(racer)	GBR	driver_1e8b1rpi
425	gardner	Frank	Gardner	\N	Australian	\N	1930-10-01	http://en.wikipedia.org/wiki/Frank_Gardner_(driver)	AUS	driver_vOrkAc5c
426	attwood	Richard	Attwood	\N	British	\N	1940-04-04	http://en.wikipedia.org/wiki/Richard_Attwood	GBR	driver_aQNRAE8p
427	bucknum	Ronnie	Bucknum	\N	American	\N	1936-04-05	http://en.wikipedia.org/wiki/Ronnie_Bucknum	USA	driver_m6vJcLAR
428	rindt	Jochen	Rindt	\N	Austrian	\N	1942-04-18	http://en.wikipedia.org/wiki/Jochen_Rindt	AUT	driver_x3V4h2RT
429	geki	Giacomo	Russo	\N	Italian	\N	1937-10-23	http://en.wikipedia.org/wiki/Geki_(driver)	ITA	driver_EXJ9FuhV
430	stewart	Jackie	Stewart	\N	British	\N	1939-06-11	http://en.wikipedia.org/wiki/Jackie_Stewart	GBR	driver_5UmmQoYl
431	hawkins	Paul	Hawkins	\N	Australian	\N	1937-10-12	http://en.wikipedia.org/wiki/Paul_Hawkins_(racing_driver)	AUS	driver_5zmfHHur
432	puzey	Clive	Puzey	\N	Rhodesian	\N	1941-07-11	http://en.wikipedia.org/wiki/Clive_Puzey	RSR	driver_uvfBf7Ff
433	pretorius	Jackie	Pretorius	\N	South African	\N	1934-11-22	http://en.wikipedia.org/wiki/Jackie_Pretorius	ZAF	driver_lk3YWvKp
434	charlton	Dave	Charlton	\N	South African	\N	1936-10-27	http://en.wikipedia.org/wiki/Dave_Charlton	ZAF	driver_RGGa0gKP
435	reed	Ray	Reed	\N	South African	\N	1932-04-30	http://en.wikipedia.org/wiki/Ray_Reed	ZAF	driver_gDBRHv66
436	clapham	David	Clapham	\N	South African	\N	1931-05-18	http://en.wikipedia.org/wiki/David_Clapham	ZAF	driver_WcunFmoN
437	blignaut	Alex	Blignaut	\N	South African	\N	1932-11-30	http://en.wikipedia.org/wiki/Alex_Blignaut	ZAF	driver_uKzofI1u
438	hulme	Denny	Hulme	\N	New Zealander	\N	1936-06-18	http://en.wikipedia.org/wiki/Denny_Hulme	NZL	driver_T6rjdfCq
439	rhodes	John	Rhodes	\N	British	\N	1927-08-18	http://en.wikipedia.org/wiki/John_Rhodes_(driver)	GBR	driver_6bJT7CJ4
440	rollinson	Alan	Rollinson	\N	British	\N	1943-05-15	http://en.wikipedia.org/wiki/Alan_Rollinson	GBR	driver_6E9QoS45
441	gubby	Brian	Gubby	\N	British	\N	1934-04-17	http://en.wikipedia.org/wiki/Brian_Gubby	GBR	driver_NMgmklck
442	bassi	Giorgio	Bassi	\N	Italian	\N	1934-01-20	http://en.wikipedia.org/wiki/Giorgio_Bassi	ITA	driver_qnysGrBO
443	bondurant	Bob	Bondurant	\N	American	\N	1933-04-27	http://en.wikipedia.org/wiki/Bob_Bondurant	USA	driver_LqQ0gMJc
444	ligier	Guy	Ligier	\N	French	\N	1930-07-12	http://en.wikipedia.org/wiki/Guy_Ligier	FRA	driver_YPQLWELY
445	irwin	Chris	Irwin	\N	British	\N	1942-06-27	http://en.wikipedia.org/wiki/Chris_Irwin	GBR	driver_duoUtbaE
446	lawrence	Chris	Lawrence	\N	British	\N	1933-07-27	http://en.wikipedia.org/wiki/Chris_Lawrence_(racing_driver)	GBR	driver_dQwNJW2L
447	botha	Luki	Botha	\N	South African	\N	1930-01-16	http://en.wikipedia.org/wiki/Luki_Botha	ZAF	driver_wKn5HhQ2
448	courage	Piers	Courage	\N	British	\N	1942-05-27	http://en.wikipedia.org/wiki/Piers_Courage	GBR	driver_EngcnFte
449	gavin	Johnny	Servoz-Gavin	\N	French	\N	1942-01-18	http://en.wikipedia.org/wiki/Johnny_Servoz-Gavin	FRA	driver_ppUJ3MwH
450	beltoise	Jean-Pierre	Beltoise	\N	French	\N	1937-04-26	http://en.wikipedia.org/wiki/Jean-Pierre_Beltoise	FRA	driver_zSb4coBE
451	hobbs	David	Hobbs	\N	British	\N	1939-06-09	http://en.wikipedia.org/wiki/David_Hobbs_(racing_driver)	GBR	driver_ywhrU8ln
452	rees	Alan	Rees	\N	British	\N	1938-01-12	http://en.wikipedia.org/wiki/Alan_Rees_(racing_driver)	GBR	driver_SkgIZcmz
453	moser	Silvio	Moser	\N	Swiss	\N	1941-04-24	http://en.wikipedia.org/wiki/Silvio_Moser	CHE	driver_t8HZAZvJ
454	oliver	Jackie	Oliver	\N	British	\N	1942-08-14	http://en.wikipedia.org/wiki/Jackie_Oliver	GBR	driver_GJb5yGpg
455	ickx	Jacky	Ickx	\N	Belgian	\N	1945-01-01	http://en.wikipedia.org/wiki/Jacky_Ickx	BEL	driver_jmMwPMwM
456	hart	Brian	Hart	\N	British	\N	1936-09-07	http://en.wikipedia.org/wiki/Brian_Hart	GBR	driver_MBgH6BFA
457	hahne	Hubert	Hahne	\N	German	\N	1935-03-28	http://en.wikipedia.org/wiki/Hubert_Hahne	DEU	driver_0uliSQKS
458	ahrens	Kurt	Ahrens	\N	German	\N	1940-04-19	http://en.wikipedia.org/wiki/Kurt_Ahrens,_Jr.	DEU	driver_ObTCesuN
459	jo_schlesser	Jo	Schlesser	\N	French	\N	1928-05-18	http://en.wikipedia.org/wiki/Jo_Schlesser	FRA	driver_GjNmZwB6
460	fisher	Mike	Fisher	\N	American	\N	1943-03-13	http://en.wikipedia.org/wiki/Mike_Fisher_(driver)	USA	driver_5PhCLbs3
461	wietzes	Eppie	Wietzes	\N	Canadian	\N	1938-05-28	http://en.wikipedia.org/wiki/Eppie_Wietzes	CAN	driver_PhKhVD8h
462	pease	Al	Pease	\N	Canadian	\N	1921-10-15	http://en.wikipedia.org/wiki/Al_Pease	CAN	driver_7ZEdQEfO
463	tom_jones	Tom	Jones	\N	American	\N	1943-04-26	http://en.wikipedia.org/wiki/Tom_Jones_(auto_racer)	USA	driver_saAaqKQc
464	williams	Jonathan	Williams	\N	British	\N	1942-10-26	http://en.wikipedia.org/wiki/Jonathan_Williams_(racing_driver)	GBR	driver_da07zlXV
465	rooyen	Basil	van Rooyen	\N	South African	\N	1939-04-19	http://en.wikipedia.org/wiki/Basil_van_Rooyen	ZAF	driver_NcOpHMIZ
466	adamich	Andrea	de Adamich	\N	Italian	\N	1941-10-03	http://en.wikipedia.org/wiki/Andrea_de_Adamich	ITA	driver_HY3TEpim
467	redman	Brian	Redman	\N	British	\N	1937-03-09	http://en.wikipedia.org/wiki/Brian_Redman	GBR	driver_NtZhun85
468	elford	Vic	Elford	\N	British	\N	1935-06-10	http://en.wikipedia.org/wiki/Vic_Elford	GBR	driver_IKLdbCtJ
469	widdows	Robin	Widdows	\N	British	\N	1942-05-27	http://en.wikipedia.org/wiki/Robin_Widdows	GBR	driver_zJB32HP5
470	bell	Derek	Bell	\N	British	\N	1941-10-31	http://en.wikipedia.org/wiki/Derek_Bell_(auto_racer)	GBR	driver_yKJcSiLn
471	pescarolo	Henri	Pescarolo	\N	French	\N	1942-09-25	http://en.wikipedia.org/wiki/Henri_Pescarolo	FRA	driver_ayO6d6hl
472	brack	Bill	Brack	\N	Canadian	\N	1935-12-26	http://en.wikipedia.org/wiki/Bill_Brack	CAN	driver_hqWIWXMi
473	unser	Bobby	Unser	\N	American	\N	1934-02-20	http://en.wikipedia.org/wiki/Bobby_Unser	USA	driver_dfSWgc8w
474	mario_andretti	Mario	Andretti	\N	American	\N	1940-02-28	http://en.wikipedia.org/wiki/Mario_Andretti	USA	driver_9i8LKsKt
475	miles	John	Miles	\N	British	\N	1943-06-14	http://en.wikipedia.org/wiki/John_Miles_(auto_racer)	GBR	driver_jIvxXOGx
476	cordts	John	Cordts	\N	Canadian	\N	1935-07-23	http://en.wikipedia.org/wiki/John_Cordts	CAN	driver_mtOaAZOR
477	eaton	George	Eaton	\N	Canadian	\N	1945-11-12	http://en.wikipedia.org/wiki/George_Eaton	CAN	driver_x2hh8uSF
478	stommelen	Rolf	Stommelen	\N	German	\N	1943-07-11	http://en.wikipedia.org/wiki/Rolf_Stommelen	DEU	driver_gupQI5ye
479	roig	Alex	Soler-Roig	\N	Spanish	\N	1932-10-29	http://en.wikipedia.org/wiki/Alex_Soler-Roig	ESP	driver_Nekzs3pt
480	peterson	Ronnie	Peterson	\N	Swedish	\N	1944-02-14	http://en.wikipedia.org/wiki/Ronnie_Peterson	SWE	driver_sJfpBtA7
481	giunti	Ignazio	Giunti	\N	Italian	\N	1941-08-30	http://en.wikipedia.org/wiki/Ignazio_Giunti	ITA	driver_KVhXGSn0
482	regazzoni	Clay	Regazzoni	\N	Swiss	\N	1939-09-05	http://en.wikipedia.org/wiki/Clay_Regazzoni	CHE	driver_7Su1TFk7
483	cevert	François	Cevert	\N	French	\N	1944-02-25	http://en.wikipedia.org/wiki/Fran%C3%A7ois_Cevert	FRA	driver_k6CDyhMw
484	gethin	Peter	Gethin	\N	British	\N	1940-02-21	http://en.wikipedia.org/wiki/Peter_Gethin	GBR	driver_OqA4bJPA
485	emerson_fittipaldi	Emerson	Fittipaldi	\N	Brazilian	\N	1946-12-12	http://en.wikipedia.org/wiki/Emerson_Fittipaldi	BRA	driver_cc8qTB9S
486	schenken	Tim	Schenken	\N	Australian	\N	1943-09-26	http://en.wikipedia.org/wiki/Tim_Schenken	AUS	driver_m90RAPFs
487	galli	Nanni	Galli	\N	Italian	\N	1940-10-02	http://en.wikipedia.org/wiki/Nanni_Galli	ITA	driver_YZSkmsZm
488	wisell	Reine	Wisell	\N	Swedish	\N	1941-09-30	http://en.wikipedia.org/wiki/Reine_Wisell	SWE	driver_5Olo0Y46
489	hutchison	Gus	Hutchison	\N	American	\N	1937-04-26	http://en.wikipedia.org/wiki/Gus_Hutchison	USA	driver_X6kY5BuU
490	westbury	Peter	Westbury	\N	British	\N	1938-05-26	http://en.wikipedia.org/wiki/Peter_Westbury	GBR	driver_22a93dwt
491	ganley	Howden	Ganley	\N	New Zealander	\N	1941-12-24	http://en.wikipedia.org/wiki/Howden_Ganley	NZL	driver_vVTEwFbc
492	barber	Skip	Barber	\N	American	\N	1936-11-16	http://en.wikipedia.org/wiki/Skip_Barber	USA	driver_BXzAajAf
493	lennep	Gijs	van Lennep	\N	Dutch	\N	1942-03-16	http://en.wikipedia.org/wiki/Gijs_Van_Lennep	NLD	driver_VseFCkra
494	walker	David	Walker	\N	Australian	\N	1941-06-10	http://en.wikipedia.org/wiki/David_Walker_(racing_driver)	AUS	driver_hgPvmtOb
495	mazet	François	Mazet	\N	French	\N	1943-02-24	http://en.wikipedia.org/wiki/Fran%C3%A7ois_Mazet	FRA	driver_oWW3hyGU
496	jean	Max	Jean	\N	French	\N	1943-07-27	http://en.wikipedia.org/wiki/Max_Jean	FRA	driver_3o3KGMXU
497	beuttler	Mike	Beuttler	\N	British	\N	1940-04-13	http://en.wikipedia.org/wiki/Mike_Beuttler	GBR	driver_glR1HXrf
498	marko	Helmut	Marko	\N	Austrian	\N	1943-04-27	http://en.wikipedia.org/wiki/Helmut_Marko	AUT	driver_ZGAymbG9
499	lauda	Niki	Lauda	\N	Austrian	\N	1949-02-22	http://en.wikipedia.org/wiki/Niki_Lauda	AUT	driver_UIHrg8ZT
500	jarier	Jean-Pierre	Jarier	\N	French	\N	1946-07-10	http://en.wikipedia.org/wiki/Jean-Pierre_Jarier	FRA	driver_dHPwtLtO
501	donohue	Mark	Donohue	\N	American	\N	1937-03-18	http://en.wikipedia.org/wiki/Mark_Donohue	USA	driver_JR5Jb8d3
502	craft	Chris	Craft	\N	British	\N	1939-11-17	http://en.wikipedia.org/wiki/Chris_Craft_(racing_driver)	GBR	driver_jj19GX6L
503	Cannoc	John	Cannon	\N	Canadian	\N	1933-06-21	http://en.wikipedia.org/wiki/John_Cannon_(auto_racer)	CAN	driver_CxxbaEnn
504	posey	Sam	Posey	\N	American	\N	1944-05-26	http://en.wikipedia.org/wiki/Sam_Posey	USA	driver_lioGXhHh
505	reutemann	Carlos	Reutemann	\N	Argentine	\N	1942-04-12	http://en.wikipedia.org/wiki/Carlos_Reutemann	ARG	driver_JhEwcbV5
506	pace	Carlos	Pace	\N	Brazilian	\N	1944-10-06	http://en.wikipedia.org/wiki/Carlos_Pace	BRA	driver_t2aIc0BV
507	wilson_fittipaldi	Wilson	Fittipaldi	\N	Brazilian	\N	1943-12-25	http://en.wikipedia.org/wiki/Wilson_Fittipaldi	BRA	driver_qpqUMaK9
508	depailler	Patrick	Depailler	\N	French	\N	1944-08-09	http://en.wikipedia.org/wiki/Patrick_Depailler	FRA	driver_Ht9Gh9We
509	merzario	Arturo	Merzario	\N	Italian	\N	1943-03-11	http://en.wikipedia.org/wiki/Arturo_Merzario	ITA	driver_lqazX04Z
510	migault	François	Migault	\N	French	\N	1944-12-04	http://en.wikipedia.org/wiki/Fran%C3%A7ois_Migault	FRA	driver_EYMBN5km
511	scheckter	Jody	Scheckter	\N	South African	\N	1950-01-29	http://en.wikipedia.org/wiki/Jody_Scheckter	ZAF	driver_OTo1gqRF
512	bueno	Luiz	Bueno	\N	Brazilian	\N	1937-01-16	http://en.wikipedia.org/wiki/Luiz_Bueno	BRA	driver_2m0ZBen3
513	follmer	George	Follmer	\N	American	\N	1934-01-27	http://en.wikipedia.org/wiki/George_Follmer	USA	driver_cE224Oxr
514	keizan	Eddie	Keizan	\N	South African	\N	1944-09-12	http://en.wikipedia.org/wiki/Eddie_Keizan	ZAF	driver_onPR3ggb
515	hunt	James	Hunt	\N	British	\N	1947-08-29	http://en.wikipedia.org/wiki/James_Hunt	GBR	driver_okmTDFDZ
516	purley	David	Purley	\N	British	\N	1945-01-26	http://en.wikipedia.org/wiki/David_Purley	GBR	driver_dFzIJ5ci
517	opel	Rikky	von Opel	\N	Liechtensteiner	\N	1947-10-14	http://en.wikipedia.org/wiki/Rikky_von_Opel	LIE	driver_O69HNYJ8
518	watson	John	Watson	\N	British	\N	1946-05-04	http://en.wikipedia.org/wiki/John_Watson_(racing_driver)	GBR	driver_J4yEZsiG
519	mass	Jochen	Mass	\N	German	\N	1946-09-30	http://en.wikipedia.org/wiki/Jochen_Mass	DEU	driver_AoxOVVtq
520	williamson	Roger	Williamson	\N	British	\N	1948-02-02	http://en.wikipedia.org/wiki/Roger_Williamson	GBR	driver_HkwaGKJy
521	mcrae	Graham	McRae	\N	New Zealander	\N	1940-03-05	http://en.wikipedia.org/wiki/Graham_McRae	NZL	driver_gUDShu8O
522	edwards	Guy	Edwards	\N	British	\N	1942-12-30	http://en.wikipedia.org/wiki/Guy_Edwards	GBR	driver_sgy5JGat
523	robarts	Richard	Robarts	\N	British	\N	1944-09-22	http://en.wikipedia.org/wiki/Richard_Robarts	GBR	driver_iMnZVj3Z
524	stuck	Hans-Joachim	Stuck	\N	German	\N	1951-01-01	http://en.wikipedia.org/wiki/Hans_Joachim_Stuck	DEU	driver_m9lQiDky
525	brambilla	Vittorio	Brambilla	\N	Italian	\N	1937-11-11	http://en.wikipedia.org/wiki/Vittorio_Brambilla	ITA	driver_TLqt1LZp
526	ian_scheckter	Ian	Scheckter	\N	South African	\N	1947-08-22	http://en.wikipedia.org/wiki/Ian_Scheckter	ZAF	driver_IF3u2Uhe
527	belso	Tom	Belsø	\N	Danish	\N	1942-08-27	http://en.wikipedia.org/wiki/Tom_Bels%C3%B8	DNK	driver_xBY9V8sC
528	schuppan	Vern	Schuppan	\N	Australian	\N	1943-03-19	http://en.wikipedia.org/wiki/Vern_Schuppan	AUS	driver_yzXuv6a2
529	pilette	Teddy	Pilette	\N	Belgian	\N	1942-07-26	http://en.wikipedia.org/wiki/Teddy_Pilette	BEL	driver_slD780Ug
530	pryce	Tom	Pryce	\N	British	\N	1949-06-11	http://en.wikipedia.org/wiki/Tom_Pryce	GBR	driver_t9WUcLT4
531	larrousse	Gérard	Larrousse	\N	French	\N	1940-05-23	http://en.wikipedia.org/wiki/G%C3%A9rard_Larrousse	FRA	driver_5sdXnNJJ
532	kinnunen	Leo	Kinnunen	\N	Finnish	\N	1943-08-05	http://en.wikipedia.org/wiki/Leo_Kinnunen	FIN	driver_6URCFY6J
533	roos	Bertil	Roos	\N	Swedish	\N	1943-10-12	http://en.wikipedia.org/wiki/Bertil_Roos	SWE	driver_00E20Kfc
534	jabouille	Jean-Pierre	Jabouille	\N	French	\N	1942-10-01	http://en.wikipedia.org/wiki/Jean-Pierre_Jabouille	FRA	driver_2D8o5kXD
535	dolhem	José	Dolhem	\N	French	\N	1944-04-26	http://en.wikipedia.org/wiki/Jos%C3%A9_Dolhem	FRA	driver_T0HKI0dj
536	lombardi	Lella	Lombardi	\N	Italian	\N	1941-03-26	http://en.wikipedia.org/wiki/Lella_Lombardi	ITA	driver_j85pRx4j
537	nicholson	John	Nicholson	\N	New Zealander	\N	1941-10-06	http://en.wikipedia.org/wiki/John_Nicholson_(racing_driver)	NZL	driver_fgyNJ8qE
538	wilds	Mike	Wilds	\N	British	\N	1946-01-07	http://en.wikipedia.org/wiki/Mike_Wilds	GBR	driver_15cE2nf6
539	ashley	Ian	Ashley	\N	British	\N	1947-10-26	http://en.wikipedia.org/wiki/Ian_Ashley	GBR	driver_uxoAbL8t
540	laffite	Jacques	Laffite	\N	French	\N	1943-11-21	http://en.wikipedia.org/wiki/Jacques_Laffite	FRA	driver_EZmD9Imr
541	perkins	Larry	Perkins	\N	Australian	\N	1950-03-18	http://en.wikipedia.org/wiki/Larry_Perkins	AUS	driver_JaDaghkz
542	quester	Dieter	Quester	\N	Austrian	\N	1939-05-30	http://en.wikipedia.org/wiki/Dieter_Quester	AUT	driver_UJsUyuFc
543	koinigg	Helmuth	Koinigg	\N	Austrian	\N	1948-11-03	http://en.wikipedia.org/wiki/Helmuth_Koinigg	AUT	driver_aARBY6Zh
544	facetti	Carlo	Facetti	\N	Italian	\N	1935-06-26	http://en.wikipedia.org/wiki/Carlo_Facetti	ITA	driver_NoZS6m0V
545	tunmer	Guy	Tunmer	\N	South African	\N	1948-12-01	http://en.wikipedia.org/wiki/Guy_Tunmer	ZAF	driver_dOn0sv0K
546	evans	Bob	Evans	\N	British	\N	1947-06-11	http://en.wikipedia.org/wiki/Bob_Evans_(race_driver)	GBR	driver_sveXazNQ
547	brise	Tony	Brise	\N	British	\N	1952-03-28	http://en.wikipedia.org/wiki/Tony_Brise	GBR	driver_p5zMUtQR
548	wunderink	Roelof	Wunderink	\N	Dutch	\N	1948-12-12	http://en.wikipedia.org/wiki/Roelof_Wunderink	NLD	driver_YKVyzojd
549	jones	Alan	Jones	\N	Australian	\N	1946-11-02	http://en.wikipedia.org/wiki/Alan_Jones_(Formula_1)	AUS	driver_xSkaFmJS
550	palm	Torsten	Palm	\N	Swedish	\N	1947-07-23	http://en.wikipedia.org/wiki/Torsten_Palm	SWE	driver_hL0xyoWX
551	magee	Damien	Magee	\N	British	\N	1945-11-17	http://en.wikipedia.org/wiki/Damien_Magee	GBR	driver_QI9fmBwH
552	fushida	Hiroshi	Fushida	\N	Japanese	\N	1946-03-10	http://en.wikipedia.org/wiki/Hiroshi_Fushida	JPN	driver_rIkyqMlv
553	henton	Brian	Henton	\N	British	\N	1946-09-19	http://en.wikipedia.org/wiki/Brian_Henton	GBR	driver_FMHp88CF
554	morgan	Dave	Morgan	\N	British	\N	1944-08-07	http://en.wikipedia.org/wiki/Dave_Morgan_(racing_driver)	GBR	driver_cCOmde8X
555	crawford	Jim	Crawford	\N	British	\N	1948-02-13	http://en.wikipedia.org/wiki/Jim_Crawford_(driver)	GBR	driver_wRQjguH7
556	ertl	Harald	Ertl	\N	Austrian	\N	1948-08-31	http://en.wikipedia.org/wiki/Harald_Ertl	AUT	driver_n6dvN4rw
557	trimmer	Tony	Trimmer	\N	British	\N	1943-01-24	http://en.wikipedia.org/wiki/Tony_Trimmer	GBR	driver_5FYUvebY
558	lunger	Brett	Lunger	\N	American	\N	1945-11-14	http://en.wikipedia.org/wiki/Brett_Lunger	USA	driver_AoJLL6Bk
559	vonlanthen	Jo	Vonlanthen	\N	Swiss	\N	1942-05-31	http://en.wikipedia.org/wiki/Jo_Vonlanthen	CHE	driver_ckASseuV
560	zorzi	Renzo	Zorzi	\N	Italian	\N	1946-12-12	http://en.wikipedia.org/wiki/Renzo_Zorzi	ITA	driver_sW5iI9Kv
561	leclere	Michel	Leclère	\N	French	\N	1946-03-18	http://en.wikipedia.org/wiki/Michel_Lecl%C3%A8re	FRA	driver_Hj3gU4BW
562	hoffmann	Ingo	Hoffmann	\N	Brazilian	\N	1953-02-28	http://en.wikipedia.org/wiki/Ingo_Hoffmann	BRA	driver_PPdD4vtb
563	nilsson	Gunnar	Nilsson	\N	Swedish	\N	1948-11-20	http://en.wikipedia.org/wiki/Gunnar_Nilsson	SWE	driver_XqM92MfX
564	kessel	Loris	Kessel	\N	Swiss	\N	1950-04-01	http://en.wikipedia.org/wiki/Loris_Kessel	CHE	driver_6o0RQ2EO
565	zapico	Emilio	Zapico	\N	Spanish	\N	1944-05-27	http://en.wikipedia.org/wiki/Emilio_Zapico	ESP	driver_A8ejvh2b
566	villota	Emilio	de Villota	\N	Spanish	\N	1946-07-26	http://en.wikipedia.org/wiki/Emilio_de_Villota	ESP	driver_RfnlPcDU
567	neve	Patrick	Nève	\N	Belgian	\N	1949-10-13	http://en.wikipedia.org/wiki/Patrick_Neve	BEL	driver_8Dprnkhw
568	nelleman	Jac	Nelleman	\N	Danish	\N	1944-04-19	http://en.wikipedia.org/wiki/Jac_Nelleman	DNK	driver_DYA7aStH
569	galica	Divina	Galica	\N	British	\N	1944-08-13	http://en.wikipedia.org/wiki/Divina_Galica	GBR	driver_jepDEhRp
570	pesenti_rossi	Alessandro	Pesenti-Rossi	\N	Italian	\N	1942-08-31	http://en.wikipedia.org/wiki/Alessandro_Pesenti-Rossi	ITA	driver_A6vTnMmO
571	binder	Hans	Binder	\N	Austrian	\N	1948-06-12	http://en.wikipedia.org/wiki/Hans_Binder	AUT	driver_eZgqtI8a
572	hayje	Boy	Lunger	\N	Dutch	\N	1949-05-03	http://en.wikipedia.org/wiki/Boy_Hayje	NLD	driver_N3tsZHly
573	andersson	Conny	Andersson	\N	Swedish	\N	1939-12-28	http://en.wikipedia.org/wiki/Conny_Andersson_(racing_driver)	SWE	driver_UQO6Fshq
574	stuppacher	Otto	Stuppacher	\N	Austrian	\N	1947-03-03	http://en.wikipedia.org/wiki/Otto_Stuppacher	AUT	driver_8Llqlav9
575	ribeiro	Alex	Ribeiro	\N	Brazilian	\N	1948-11-07	http://en.wikipedia.org/wiki/Alex_Ribeiro	BRA	driver_Z2cADRGV
576	brown	Warwick	Brown	\N	Australian	\N	1949-12-24	http://en.wikipedia.org/wiki/Warwick_Brown	AUS	driver_0K5F7NdQ
577	takahara	Noritake	Takahara	\N	Japanese	\N	1951-06-06	http://en.wikipedia.org/wiki/Noritake_Takahara	JPN	driver_zaNqgy9I
578	hasemi	Masahiro	Hasemi	\N	Japanese	\N	1945-11-13	http://en.wikipedia.org/wiki/Masahiro_Hasemi	JPN	driver_GAlh8wIr
579	hoshino	Kazuyoshi	Hoshino	\N	Japanese	\N	1947-07-01	http://en.wikipedia.org/wiki/Kazuyoshi_Hoshino	JPN	driver_SCSKCdrX
580	keegan	Rupert	Keegan	\N	British	\N	1955-02-26	http://en.wikipedia.org/wiki/Rupert_Keegan	GBR	driver_ThZ6nCHG
581	patrese	Riccardo	Patrese	\N	Italian	\N	1954-04-17	http://en.wikipedia.org/wiki/Riccardo_Patrese	ITA	driver_eaUlUzAs
582	dryver	Bernard	de Dryver	\N	Belgian	\N	1952-09-19	http://en.wikipedia.org/wiki/Bernard_de_Dryver	BEL	driver_EGUL6Yuy
583	rebaque	Hector	Rebaque	\N	Mexican	\N	1956-02-05	http://en.wikipedia.org/wiki/Hector_Rebaque	MEX	driver_a2rGkozY
584	kozarowitzky	Mikko	Kozarowitzky	\N	Finnish	\N	1948-05-17	http://en.wikipedia.org/wiki/Mikko_Kozarowitzky	FIN	driver_Lo5oqtIu
585	tambay	Patrick	Tambay	\N	French	\N	1949-06-25	http://en.wikipedia.org/wiki/Patrick_Tambay	FRA	driver_Aiy6S5DT
586	gilles_villeneuve	Gilles	Villeneuve	\N	Canadian	\N	1950-01-18	http://en.wikipedia.org/wiki/Gilles_Villeneuve	CAN	driver_C07cOVFk
587	sutcliffe	Andy	Sutcliffe	\N	British	\N	1947-05-09	http://en.wikipedia.org/wiki/Andy_Sutcliffe	GBR	driver_nGuVYY09
588	mcguire	Brian	McGuire	\N	Australian	\N	1945-12-13	http://en.wikipedia.org/wiki/Brian_McGuire	AUS	driver_OtXD7Mxe
589	heyer	Hans	Heyer	\N	German	\N	1943-03-16	http://en.wikipedia.org/wiki/Hans_Heyer	DEU	driver_mWePSMgW
590	bleekemolen	Michael	Bleekemolen	\N	Dutch	\N	1949-10-02	http://en.wikipedia.org/wiki/Michael_Bleekemolen	NLD	driver_5a30xfyL
591	giacomelli	Bruno	Giacomelli	\N	Italian	\N	1952-09-10	http://en.wikipedia.org/wiki/Bruno_Giacomelli	ITA	driver_6PnP5e9h
592	leoni	Lamberto	Leoni	\N	Italian	\N	1953-05-24	http://en.wikipedia.org/wiki/Lamberto_Leoni	ITA	driver_tjFHRhGL
593	francia	Giorgio	Francia	\N	Italian	\N	1947-11-08	http://en.wikipedia.org/wiki/Giorgio_Francia	ITA	driver_pKrvXpBG
594	ongais	Danny	Ongais	\N	American	\N	1942-05-21	http://en.wikipedia.org/wiki/Danny_Ongais	USA	driver_0KNb0JJ6
595	takahashi	Kunimitsu	Takahashi	\N	Japanese	\N	1940-01-29	http://en.wikipedia.org/wiki/Kunimitsu_Takahashi	JPN	driver_aTHkN1HD
596	pironi	Didier	Pironi	\N	French	\N	1952-03-26	http://en.wikipedia.org/wiki/Didier_Pironi	FRA	driver_2rSPioHh
597	cheever	Eddie	Cheever	\N	American	\N	1958-01-10	http://en.wikipedia.org/wiki/Eddie_Cheever	USA	driver_Nk6167p7
598	keke_rosberg	Keke	Rosberg	\N	Finnish	\N	1948-12-06	http://en.wikipedia.org/wiki/Keke_Rosberg	FIN	driver_2hVbZRXg
599	arnoux	René	Arnoux	\N	French	\N	1948-07-04	http://en.wikipedia.org/wiki/Ren%C3%A9_Arnoux	FRA	driver_ivAMfiaX
601	colombo	Alberto	Colombo	\N	Italian	\N	1946-02-23	http://en.wikipedia.org/wiki/Alberto_Colombo	ITA	driver_MJxqfiVO
602	lees	Geoff	Lees	\N	British	\N	1951-05-01	http://en.wikipedia.org/wiki/Geoff_Lees	GBR	driver_8hNwMA8h
603	piquet	Nelson	Piquet	\N	Brazilian	\N	1952-08-17	http://en.wikipedia.org/wiki/Nelson_Piquet	BRA	driver_8xNj6AW6
604	gimax	Carlo	Franchi	\N	Italian	\N	1938-01-01	http://en.wikipedia.org/wiki/Gimax	ITA	driver_y3xzaSGp
605	rahal	Bobby	Rahal	\N	American	\N	1953-01-10	http://en.wikipedia.org/wiki/Bobby_Rahal	USA	driver_WD2Zddca
606	gabbiani	Beppe	Gabbiani	\N	Italian	\N	1957-01-02	http://en.wikipedia.org/wiki/Beppe_Gabbiani	ITA	driver_2HbVDG5C
607	angelis	Elio	de Angelis	\N	Italian	\N	1958-03-26	http://en.wikipedia.org/wiki/Elio_de_Angelis	ITA	driver_AK7h8uJR
608	lammers	Jan	Lammers	\N	Dutch	\N	1956-06-02	http://en.wikipedia.org/wiki/Jan_Lammers	NLD	driver_OTKsPItR
609	brancatelli	Gianfranco	Brancatelli	\N	Italian	\N	1950-01-18	http://en.wikipedia.org/wiki/Gianfranco_Brancatelli	ITA	driver_h15vhzXM
610	gaillard	Patrick	Gaillard	\N	French	\N	1952-02-12	http://en.wikipedia.org/wiki/Patrick_Gaillard	FRA	driver_63f0m1yS
611	surer	Marc	Surer	\N	Swiss	\N	1951-09-18	http://en.wikipedia.org/wiki/Marc_Surer	CHE	driver_SGw1DJbH
612	zunino	Ricardo	Zunino	\N	Argentine	\N	1949-04-13	http://en.wikipedia.org/wiki/Ricardo_Zunino	ARG	driver_MgRew09f
613	prost	Alain	Prost	\N	French	\N	1955-02-24	http://en.wikipedia.org/wiki/Alain_Prost	FRA	driver_xbkSsfDv
614	kennedy	Dave	Kennedy	\N	Irish	\N	1953-01-15	http://en.wikipedia.org/wiki/David_Kennedy_(racing_driver)	IRL	driver_fQ77X3il
615	johansson	Stefan	Johansson	\N	Swedish	\N	1956-09-08	http://en.wikipedia.org/wiki/Stefan_Johansson	SWE	driver_vPVtyRY0
616	south	Stephen	South	\N	British	\N	1952-02-19	http://en.wikipedia.org/wiki/Stephen_South	GBR	driver_ki4lIVqQ
617	needell	Tiff	Needell	\N	British	\N	1951-10-29	http://en.wikipedia.org/wiki/Tiff_Needell	GBR	driver_0OQgQwnC
618	desire_wilson	Desiré	Wilson	\N	South African	\N	1953-11-26	http://en.wikipedia.org/wiki/Desir%C3%A9_Wilson	ZAF	driver_SGMkLswh
619	mansell	Nigel	Mansell	\N	British	\N	1953-08-08	http://en.wikipedia.org/wiki/Nigel_Mansell	GBR	driver_00pdpSvV
620	thackwell	Mike	Thackwell	\N	New Zealander	\N	1961-03-30	http://en.wikipedia.org/wiki/Mike_Thackwell	NZL	driver_6VRnJvEt
621	manfred_winkelhock	Manfred	Winkelhock	\N	German	\N	1951-10-06	http://en.wikipedia.org/wiki/Manfred_Winkelhock	DEU	driver_LsGxWXC3
622	cesaris	Andrea	de Cesaris	\N	Italian	\N	1959-05-31	http://en.wikipedia.org/wiki/Andrea_de_Cesaris	ITA	driver_GDutSJkG
623	cogan	Kevin	Cogan	\N	American	\N	1956-03-31	http://en.wikipedia.org/wiki/Kevin_Cogan	USA	driver_6xBCiXIM
624	serra	Chico	Serra	\N	Brazilian	\N	1957-02-03	http://en.wikipedia.org/wiki/Chico_Serra	BRA	driver_CfXzg3G4
625	guerra	Miguel Ángel	Guerra	\N	Argentine	\N	1953-08-31	http://en.wikipedia.org/wiki/Miguel_Angel_Guerra	ARG	driver_sMwk7hgh
626	stohr	Siegfried	Stohr	\N	Italian	\N	1952-10-10	http://en.wikipedia.org/wiki/Siegfried_Stohr	ITA	driver_VQ4lPHpb
627	salazar	Eliseo	Salazar	\N	Chilean	\N	1954-11-14	http://en.wikipedia.org/wiki/Eliseo_Salazar	CHL	driver_57e8StNZ
628	londono	Ricardo	Londoño	\N	Colombian	\N	1949-08-08	http://en.wikipedia.org/wiki/Ricardo_Londo%C3%B1o	COL	driver_ITOMZiyL
629	borgudd	Slim	Borgudd	\N	Swedish	\N	1946-11-25	http://en.wikipedia.org/wiki/Slim_Borgudd	SWE	driver_GAjKX2g9
630	alboreto	Michele	Alboreto	\N	Italian	\N	1956-12-23	http://en.wikipedia.org/wiki/Michele_Alboreto	ITA	driver_8kj9mLJF
631	warwick	Derek	Warwick	\N	British	\N	1954-08-27	http://en.wikipedia.org/wiki/Derek_Warwick	GBR	driver_n5Ux6jWo
632	ghinzani	Piercarlo	Ghinzani	\N	Italian	\N	1952-01-16	http://en.wikipedia.org/wiki/Piercarlo_Ghinzani	ITA	driver_xHYzZ5u7
633	villeneuve_sr	Jacques	Villeneuve Sr.	\N	Canadian	\N	1953-11-04	http://en.wikipedia.org/wiki/Jacques_Villeneuve_(elder)	CAN	driver_XsH8hjrG
634	boesel	Raul	Boesel	\N	Brazilian	\N	1957-12-04	http://en.wikipedia.org/wiki/Raul_Boesel	BRA	driver_soliDyBX
635	baldi	Mauro	Baldi	\N	Italian	\N	1954-01-31	http://en.wikipedia.org/wiki/Mauro_Baldi	ITA	driver_I4kHyToS
636	paletti	Riccardo	Paletti	\N	Italian	\N	1958-06-15	http://en.wikipedia.org/wiki/Riccardo_Paletti	ITA	driver_MHWJOguX
637	guerrero	Roberto	Guerrero	\N	Colombian	\N	1958-11-16	http://en.wikipedia.org/wiki/Roberto_Guerrero	COL	driver_xn4EkvZD
638	fabi	Teo	Fabi	\N	Italian	\N	1955-03-09	http://en.wikipedia.org/wiki/Teo_Fabi	ITA	driver_VVy7zSVf
639	moreno	Roberto	Moreno	\N	Brazilian	\N	1959-02-11	http://en.wikipedia.org/wiki/Roberto_Moreno	BRA	driver_5LUVRC7G
640	byrne	Tommy	Byrne	\N	Irish	\N	1958-05-06	http://en.wikipedia.org/wiki/Tommy_Byrne_%28racing_driver%29	IRL	driver_6EACpQyd
641	sullivan	Danny	Sullivan	\N	American	\N	1950-03-09	http://en.wikipedia.org/wiki/Danny_Sullivan	USA	driver_8CKsujgo
642	cecotto	Johnny	Cecotto	\N	Venezuelan	\N	1956-01-25	http://en.wikipedia.org/wiki/Johnny_Cecotto	VEN	driver_RYQa5JBX
643	corrado_fabi	Corrado	Fabi	\N	Italian	\N	1961-04-12	http://en.wikipedia.org/wiki/Corrado_Fabi	ITA	driver_HWNc1SX7
644	schlesser	Jean-Louis	Schlesser	\N	French	\N	1948-09-12	http://en.wikipedia.org/wiki/Jean-Louis_Schlesser	FRA	driver_cjvE7pRn
645	boutsen	Thierry	Boutsen	\N	Belgian	\N	1957-07-13	http://en.wikipedia.org/wiki/Thierry_Boutsen	BEL	driver_5t7IXlDZ
646	acheson	Kenny	Acheson	\N	British	\N	1957-11-27	http://en.wikipedia.org/wiki/Kenny_Acheson	GBR	driver_IkvRNJlP
647	palmer	Jonathan	Palmer	\N	British	\N	1956-11-07	http://en.wikipedia.org/wiki/Jonathan_Palmer	GBR	driver_xrzZzrKX
648	brundle	Martin	Brundle	\N	British	\N	1959-06-01	http://en.wikipedia.org/wiki/Martin_Brundle	GBR	driver_LWXKjO1X
649	hesnault	François	Hesnault	\N	French	\N	1956-12-30	http://en.wikipedia.org/wiki/Fran%C3%A7ois_Hesnault	FRA	driver_rBBtDAum
650	alliot	Philippe	Alliot	\N	French	\N	1954-07-27	http://en.wikipedia.org/wiki/Philippe_Alliot	FRA	driver_jTD9VpnA
651	bellof	Stefan	Bellof	\N	German	\N	1957-11-20	http://en.wikipedia.org/wiki/Stefan_Bellof	DEU	driver_i9MlnpxH
652	senna	Ayrton	Senna	\N	Brazilian	\N	1960-03-21	http://en.wikipedia.org/wiki/Ayrton_Senna	BRA	driver_9vGD0PmP
653	gartner	Jo	Gartner	\N	Austrian	\N	1954-01-24	http://en.wikipedia.org/wiki/Jo_Gartner	AUT	driver_zzhx0sWR
654	rothengatter	Huub	Rothengatter	\N	Dutch	\N	1954-10-08	http://en.wikipedia.org/wiki/Huub_Rothengatter	NLD	driver_xmbLXR3t
655	berger	Gerhard	Berger	\N	Austrian	\N	1959-08-27	http://en.wikipedia.org/wiki/Gerhard_Berger	AUT	driver_bACkd1Eh
656	martini	Pierluigi	Martini	\N	Italian	\N	1961-04-23	http://en.wikipedia.org/wiki/Pierluigi_Martini	ITA	driver_jiLE2WiC
657	streiff	Philippe	Streiff	\N	French	\N	1955-06-26	http://en.wikipedia.org/wiki/Philippe_Streiff	FRA	driver_zBVxBHe6
658	danner	Christian	Danner	\N	German	\N	1958-04-04	http://en.wikipedia.org/wiki/Christian_Danner	DEU	driver_AhQ1YopN
659	capelli	Ivan	Capelli	\N	Italian	\N	1963-05-24	http://en.wikipedia.org/wiki/Ivan_Capelli	ITA	driver_as5aNCgW
660	dumfries	Johnny	Dumfries	\N	British	\N	1958-04-26	http://en.wikipedia.org/wiki/Johnny_Dumfries	GBR	driver_GJsSbPnP
661	nannini	Alessandro	Nannini	\N	Italian	\N	1959-07-07	http://en.wikipedia.org/wiki/Alessandro_Nannini	ITA	driver_G24cpxh2
662	berg	Allen	Berg	\N	Canadian	\N	1961-08-01	http://en.wikipedia.org/wiki/Allen_Berg	CAN	driver_KpQ8LCnF
663	caffi	Alex	Caffi	\N	Italian	\N	1964-03-18	http://en.wikipedia.org/wiki/Alex_Caffi	ITA	driver_cyXHfwy2
664	satoru_nakajima	Satoru	Nakajima	\N	Japanese	\N	1953-02-23	http://en.wikipedia.org/wiki/Satoru_Nakajima	JPN	driver_VuJKGcuV
665	fabre	Pascal	Fabre	\N	French	\N	1960-01-09	http://en.wikipedia.org/wiki/Pascal_Fabre	FRA	driver_GjMXvsG6
666	campos	Adrián	Campos	\N	Spanish	\N	1960-06-17	http://en.wikipedia.org/wiki/Adri%C3%A1n_Campos	ESP	driver_lA2a9E6u
667	tarquini	Gabriele	Tarquini	\N	Italian	\N	1962-03-02	http://en.wikipedia.org/wiki/Gabriele_Tarquini	ITA	driver_aV7145Mb
668	forini	Franco	Forini	\N	Swiss	\N	1958-09-22	http://en.wikipedia.org/wiki/Franco_Forini	CHE	driver_jhRhrIDm
669	larini	Nicola	Larini	\N	Italian	\N	1964-03-19	http://en.wikipedia.org/wiki/Nicola_Larini	ITA	driver_0UcrQx3F
670	dalmas	Yannick	Dalmas	\N	French	\N	1961-07-28	http://en.wikipedia.org/wiki/Yannick_Dalmas	FRA	driver_B3b3OAmI
671	modena	Stefano	Modena	\N	Italian	\N	1963-05-12	http://en.wikipedia.org/wiki/Stefano_Modena	ITA	driver_Lm4b4hQK
672	sala	Luis	Pérez-Sala	\N	Spanish	\N	1959-05-15	http://en.wikipedia.org/wiki/Luis_Perez-Sala	ESP	driver_lEImBv6Y
673	gugelmin	Maurício	Gugelmin	\N	Brazilian	\N	1963-04-20	http://en.wikipedia.org/wiki/Maur%C3%ADcio_Gugelmin	BRA	driver_3bDyfXkM
674	larrauri	Oscar	Larrauri	\N	Argentine	\N	1954-08-19	http://en.wikipedia.org/wiki/Oscar_Larrauri	ARG	driver_OxfbYU44
675	bailey	Julian	Bailey	\N	British	\N	1961-10-09	http://en.wikipedia.org/wiki/Julian_Bailey	GBR	driver_TA6xp5Ip
676	schneider	Bernd	Schneider	\N	German	\N	1964-07-20	http://en.wikipedia.org/wiki/Bernd_Schneider_(racecar_driver)	DEU	driver_IZ5WHxDn
677	suzuki	Aguri	Suzuki	\N	Japanese	\N	1960-09-08	http://en.wikipedia.org/wiki/Aguri_Suzuki	JPN	driver_ddf82ZiG
678	raphanel	Pierre-Henri	Raphanel	\N	French	\N	1961-05-27	http://en.wikipedia.org/wiki/Pierre-Henri_Raphanel	FRA	driver_gA0ThBUv
679	herbert	Johnny	Herbert	\N	British	\N	1964-06-25	http://en.wikipedia.org/wiki/Johnny_Herbert	GBR	driver_BgiRKOoT
680	grouillard	Olivier	Grouillard	\N	French	\N	1958-09-02	http://en.wikipedia.org/wiki/Olivier_Grouillard	FRA	driver_I6kuQVDS
681	foitek	Gregor	Foitek	\N	Swiss	\N	1965-03-27	http://en.wikipedia.org/wiki/Gregor_Foitek	CHE	driver_HoVip0o4
682	weidler	Volker	Weidler	\N	German	\N	1962-03-18	http://en.wikipedia.org/wiki/Volker_Weidler	DEU	driver_zE3N86lS
683	joachim_winkelhock	Joachim	Winkelhock	\N	German	\N	1960-10-24	http://en.wikipedia.org/wiki/Joachim_Winkelhock	DEU	driver_Lieg7QPz
684	gachot	Bertrand	Gachot	\N	Belgian	\N	1962-12-23	http://en.wikipedia.org/wiki/Bertrand_Gachot	BEL	driver_n5GxU58Q
685	alesi	Jean	Alesi	\N	French	\N	1964-06-11	http://en.wikipedia.org/wiki/Jean_Alesi	FRA	driver_LmpLu2hG
686	pirro	Emanuele	Pirro	\N	Italian	\N	1962-01-12	http://en.wikipedia.org/wiki/Emanuele_Pirro	ITA	driver_4wSNIxAA
687	bernard	Éric	Bernard	\N	French	\N	1964-08-24	http://en.wikipedia.org/wiki/%C3%89ric_Bernard	FRA	driver_yfuI3eKH
688	donnelly	Martin	Donnelly	\N	British	\N	1964-03-26	http://en.wikipedia.org/wiki/Martin_Donnelly_(racing_driver)	GBR	driver_K2ki822V
689	bertaggia	Enrico	Bertaggia	\N	Italian	\N	1964-09-19	http://en.wikipedia.org/wiki/Enrico_Bertaggia	ITA	driver_wuqVDfqt
690	lehto	Jyrki	Järvilehto	\N	Finnish	\N	1966-01-31	http://en.wikipedia.org/wiki/Jyrki_J%C3%A4rvilehto	FIN	driver_hJK3rzY2
691	barilla	Paolo	Barilla	\N	Italian	\N	1961-04-20	http://en.wikipedia.org/wiki/Paolo_Barilla	ITA	driver_XMFzRSGU
692	morbidelli	Gianni	Morbidelli	\N	Italian	\N	1968-01-13	http://en.wikipedia.org/wiki/Gianni_Morbidelli	ITA	driver_cc3eypSD
693	langes	Claudio	Langes	\N	Italian	\N	1960-07-20	http://en.wikipedia.org/wiki/Claudio_Langes	ITA	driver_tIzXWQW8
694	gary_brabham	Gary	Brabham	\N	Australian	\N	1961-03-29	http://en.wikipedia.org/wiki/Gary_Brabham	AUS	driver_8gOLjTGf
695	brabham	David	Brabham	\N	Australian	\N	1965-09-05	http://en.wikipedia.org/wiki/David_Brabham	AUS	driver_GLHpCSPN
696	hakkinen	Mika	Häkkinen	\N	Finnish	\N	1968-09-28	http://en.wikipedia.org/wiki/Mika_H%C3%A4kkinen	FIN	driver_GbMyd0uN
697	blundell	Mark	Blundell	\N	British	\N	1966-04-08	http://en.wikipedia.org/wiki/Mark_Blundell	GBR	driver_mU4ZhZNZ
698	comas	Érik	Comas	\N	French	\N	1963-09-28	http://en.wikipedia.org/wiki/%C3%89rik_Comas	FRA	driver_fYDtKcSx
699	chaves	Pedro	Chaves	\N	Portuguese	\N	1965-02-27	http://en.wikipedia.org/wiki/Pedro_Chaves	PRT	driver_OSrDkPgA
700	poele	Eric	van de Poele	\N	Belgian	\N	1961-09-30	http://en.wikipedia.org/wiki/Eric_van_de_Poele	BEL	driver_ao0yV1B6
701	barbazza	Fabrizio	Barbazza	\N	Italian	\N	1963-04-02	http://en.wikipedia.org/wiki/Fabrizio_Barbazza	ITA	driver_SPCqSUYF
702	bartels	Michael	Bartels	\N	German	\N	1968-03-08	http://en.wikipedia.org/wiki/Michael_Bartels	DEU	driver_WTjfBPmt
703	michael_schumacher	Michael	Schumacher	MSC	German	\N	1969-01-03	http://en.wikipedia.org/wiki/Michael_Schumacher	DEU	driver_41CEOWyB
704	zanardi	Alessandro	Zanardi	\N	Italian	\N	1966-10-23	http://en.wikipedia.org/wiki/Alex_Zanardi	ITA	driver_M1CvFNmT
705	wendlinger	Karl	Wendlinger	\N	Austrian	\N	1968-12-20	http://en.wikipedia.org/wiki/Karl_Wendlinger	AUT	driver_4ApDlRQQ
706	hattori	Naoki	Hattori	\N	Japanese	\N	1966-06-13	http://en.wikipedia.org/wiki/Naoki_Hattori	JPN	driver_DSaBNMfG
707	katayama	Ukyo	Katayama	\N	Japanese	\N	1963-05-29	http://en.wikipedia.org/wiki/Ukyo_Katayama	JPN	driver_VrWzGoG9
708	fittipaldi	Christian	Fittipaldi	\N	Brazilian	\N	1971-01-18	http://en.wikipedia.org/wiki/Christian_Fittipaldi	BRA	driver_Jv81H8jg
709	belmondo	Paul	Belmondo	\N	French	\N	1963-04-23	http://en.wikipedia.org/wiki/Paul_Belmondo	FRA	driver_BlZa57Sv
710	chiesa	Andrea	Chiesa	\N	Swiss	\N	1964-05-06	http://en.wikipedia.org/wiki/Andrea_Chiesa	CHE	driver_YkogbBb4
711	amati	Giovanna	Amati	\N	Italian	\N	1959-07-20	http://en.wikipedia.org/wiki/Giovanna_Amati	ITA	driver_0JLxNb2a
712	damon_hill	Damon	Hill	\N	British	\N	1960-09-17	http://en.wikipedia.org/wiki/Damon_Hill	GBR	driver_hXhf4WQC
713	mccarthy	Perry	McCarthy	\N	British	\N	1961-03-03	http://en.wikipedia.org/wiki/Perry_McCarthy	GBR	driver_AEEqCYv7
714	naspetti	Emanuele	Naspetti	\N	Italian	\N	1968-02-24	http://en.wikipedia.org/wiki/Emanuele_Naspetti	ITA	driver_UV9rQZ37
715	barrichello	Rubens	Barrichello	BAR	Brazilian	\N	1972-05-23	http://en.wikipedia.org/wiki/Rubens_Barrichello	BRA	driver_ioEbIEe5
716	badoer	Luca	Badoer	BAD	Italian	\N	1971-01-25	http://en.wikipedia.org/wiki/Luca_Badoer	ITA	driver_JubWh4Ec
717	andretti	Michael	Andretti	\N	American	\N	1962-10-05	http://en.wikipedia.org/wiki/Michael_Andretti	USA	driver_4J4i2S29
718	lamy	Pedro	Lamy	\N	Portuguese	\N	1972-03-20	http://en.wikipedia.org/wiki/Pedro_Lamy	PRT	driver_kIjvJxcE
719	apicella	Marco	Apicella	\N	Italian	\N	1965-10-07	http://en.wikipedia.org/wiki/Marco_Apicella	ITA	driver_wyBZ6L3L
720	irvine	Eddie	Irvine	\N	British	\N	1965-11-10	http://en.wikipedia.org/wiki/Eddie_Irvine	GBR	driver_GQhrb7l3
721	toshio_suzuki	Toshio	Suzuki	\N	Japanese	\N	1955-03-10	http://en.wikipedia.org/wiki/Toshio_Suzuki_(driver)	JPN	driver_3C1FpCGJ
722	gounon	Jean-Marc	Gounon	\N	French	\N	1963-01-01	http://en.wikipedia.org/wiki/Jean-Marc_Gounon	FRA	driver_BVAZI9p3
723	panis	Olivier	Panis	\N	French	\N	1966-09-02	http://en.wikipedia.org/wiki/Olivier_Panis	FRA	driver_Ioe3rNDP
724	verstappen	Jos	Verstappen	\N	Dutch	\N	1972-03-04	http://en.wikipedia.org/wiki/Jos_Verstappen	NLD	driver_qJZHAtDL
725	frentzen	Heinz-Harald	Frentzen	\N	German	\N	1967-05-18	http://en.wikipedia.org/wiki/Heinz-Harald_Frentzen	DEU	driver_gSqBr9vv
726	beretta	Olivier	Beretta	\N	Monegasque	\N	1969-11-23	http://en.wikipedia.org/wiki/Olivier_Beretta	MCO	driver_ctx70Yhw
727	ratzenberger	Roland	Ratzenberger	\N	Austrian	\N	1960-07-04	http://en.wikipedia.org/wiki/Roland_Ratzenberger	AUT	driver_bwdNOFFL
728	coulthard	David	Coulthard	COU	British	\N	1971-03-27	http://en.wikipedia.org/wiki/David_Coulthard	GBR	driver_1P3fHlkz
729	montermini	Andrea	Montermini	\N	Italian	\N	1964-05-30	http://en.wikipedia.org/wiki/Andrea_Montermini	ITA	driver_xDS7nacc
730	adams	Philippe	Adams	\N	Belgian	\N	1969-11-19	http://en.wikipedia.org/wiki/Philippe_Adams	BEL	driver_cZuiHzMc
731	schiattarella	Domenico	Schiattarella	\N	Italian	\N	1967-11-17	http://en.wikipedia.org/wiki/Domenico_Schiattarella	ITA	driver_xQbSPwRe
732	noda	Hideki	Noda	\N	Japanese	\N	1969-03-07	http://en.wikipedia.org/wiki/Hideki_Noda	JPN	driver_UTQIhWuR
733	salo	Mika	Salo	\N	Finnish	\N	1966-11-30	http://en.wikipedia.org/wiki/Mika_Salo	FIN	driver_IFlo1tkD
734	lagorce	Franck	Lagorce	\N	French	\N	1968-09-01	http://en.wikipedia.org/wiki/Franck_Lagorce	FRA	driver_OuMjwVqW
735	inoue	Taki	Inoue	\N	Japanese	\N	1963-09-05	http://en.wikipedia.org/wiki/Taki_Inoue	JPN	driver_xXarR1CO
736	deletraz	Jean-Denis	Délétraz	\N	Swiss	\N	1963-10-01	http://en.wikipedia.org/wiki/Jean-Denis_Deletraz	CHE	driver_WodQ74HE
737	diniz	Pedro	Diniz	\N	Brazilian	\N	1970-05-22	http://en.wikipedia.org/wiki/Pedro_Diniz	BRA	driver_7K1SYItK
738	boullion	Jean-Christophe	Boullion	\N	French	\N	1969-12-27	http://en.wikipedia.org/wiki/Jean-Christophe_Boullion	FRA	driver_QyMktfpt
739	papis	Massimiliano	Papis	\N	Italian	\N	1969-10-03	http://en.wikipedia.org/wiki/Massimiliano_Papis	ITA	driver_sj2cgzh4
740	lavaggi	Giovanni	Lavaggi	\N	Italian	\N	1958-02-18	http://en.wikipedia.org/wiki/Giovanni_Lavaggi	ITA	driver_XfAWs4Mz
741	magnussen	Jan	Magnussen	MAG	Danish	\N	1973-07-04	http://en.wikipedia.org/wiki/Jan_Magnussen	DNK	driver_R6z8iWpe
742	villeneuve	Jacques	Villeneuve	VIL	Canadian	\N	1971-04-09	http://en.wikipedia.org/wiki/Jacques_Villeneuve	CAN	driver_RFhDlZIk
743	rosset	Ricardo	Rosset	\N	Brazilian	\N	1968-07-27	http://en.wikipedia.org/wiki/Ricardo_Rosset	BRA	driver_zY3WtxMk
744	fisichella	Giancarlo	Fisichella	FIS	Italian	\N	1973-01-14	http://en.wikipedia.org/wiki/Giancarlo_Fisichella	ITA	driver_S21so6Vb
745	marques	Tarso	Marques	\N	Brazilian	\N	1976-01-19	http://en.wikipedia.org/wiki/Tarso_Marques	BRA	driver_IaP4FQN7
746	nakano	Shinji	Nakano	\N	Japanese	\N	1971-04-01	http://en.wikipedia.org/wiki/Shinji_Nakano	JPN	driver_wqajISKT
747	trulli	Jarno	Trulli	TRU	Italian	\N	1974-07-13	http://en.wikipedia.org/wiki/Jarno_Trulli	ITA	driver_mWg8RRMg
748	ralf_schumacher	Ralf	Schumacher	SCH	German	\N	1975-06-30	http://en.wikipedia.org/wiki/Ralf_Schumacher	DEU	driver_LIWYFUFw
749	sospiri	Vincenzo	Sospiri	\N	Italian	\N	1966-10-07	http://en.wikipedia.org/wiki/Vincenzo_Sospiri	ITA	driver_IHNUv3Bv
750	wurz	Alexander	Wurz	WUR	Austrian	\N	1974-02-15	http://en.wikipedia.org/wiki/Alexander_Wurz	AUT	driver_Uiy1Sj5W
751	fontana	Norberto	Fontana	\N	Argentine	\N	1975-01-20	http://en.wikipedia.org/wiki/Norberto_Fontana	ARG	driver_YyxJj0nm
752	tuero	Esteban	Tuero	\N	Argentine	\N	1978-04-22	http://en.wikipedia.org/wiki/Esteban_Tuero	ARG	driver_ps5Ie8fd
753	takagi	Toranosuke	Takagi	\N	Japanese	\N	1974-02-12	http://en.wikipedia.org/wiki/Toranosuke_Takagi	JPN	driver_RckLZmFs
754	rosa	Pedro	de la Rosa	DLR	Spanish	\N	1971-02-24	http://en.wikipedia.org/wiki/Pedro_de_la_Rosa	ESP	driver_VGaAbBSy
755	zonta	Ricardo	Zonta	ZON	Brazilian	\N	1976-03-23	http://en.wikipedia.org/wiki/Ricardo_Zonta	BRA	driver_4Ipo8Hx4
756	gene	Marc	Gené	\N	Spanish	\N	1974-03-29	http://en.wikipedia.org/wiki/Marc_Gen%C3%A9	ESP	driver_tNSnZxVC
757	sarrazin	Stéphane	Sarrazin	\N	French	\N	1975-11-02	http://en.wikipedia.org/wiki/St%C3%A9phane_Sarrazin	FRA	driver_jvxlBXdB
758	heidfeld	Nick	Heidfeld	HEI	German	\N	1977-05-10	http://en.wikipedia.org/wiki/Nick_Heidfeld	DEU	driver_P9RHzLcZ
759	button	Jenson	Button	BUT	British	22	1980-01-19	http://en.wikipedia.org/wiki/Jenson_Button	GBR	driver_essPqmat
760	mazzacane	Gastón	Mazzacane	\N	Argentine	\N	1975-05-08	http://en.wikipedia.org/wiki/Gast%C3%B3n_Mazzacane	ARG	driver_OXaTJFyf
761	burti	Luciano	Burti	\N	Brazilian	\N	1975-03-05	http://en.wikipedia.org/wiki/Luciano_Burti	BRA	driver_evFtfTzG
762	raikkonen	Kimi	Räikkönen	RAI	Finnish	7	1979-10-17	http://en.wikipedia.org/wiki/Kimi_R%C3%A4ikk%C3%B6nen	FIN	driver_rVobWg9B
763	alonso	Fernando	Alonso	ALO	Spanish	14	1981-07-29	http://en.wikipedia.org/wiki/Fernando_Alonso	ESP	driver_WqMAI78W
764	montoya	Juan	Pablo Montoya	MON	Colombian	\N	1975-09-20	http://en.wikipedia.org/wiki/Juan_Pablo_Montoya	COL	driver_pJ1KNzHr
765	bernoldi	Enrique	Bernoldi	\N	Brazilian	\N	1978-10-19	http://en.wikipedia.org/wiki/Enrique_Bernoldi	BRA	driver_yXoQXawp
766	enge	Tomáš	Enge	\N	Czech	\N	1976-09-11	http://en.wikipedia.org/wiki/Tom%C3%A1%C5%A1_Enge	CZE	driver_dWK2XzgI
767	yoong	Alex	Yoong	\N	Malaysian	\N	1976-07-20	http://en.wikipedia.org/wiki/Alex_Yoong	MYS	driver_iClsl0sI
768	webber	Mark	Webber	WEB	Australian	\N	1976-08-27	http://en.wikipedia.org/wiki/Mark_Webber_(racing_driver)	AUS	driver_xKJxlmCp
769	sato	Takuma	Sato	SAT	Japanese	\N	1977-01-28	http://en.wikipedia.org/wiki/Takuma_Sato	JPN	driver_WxlLGJbq
770	massa	Felipe	Massa	MAS	Brazilian	19	1981-04-25	http://en.wikipedia.org/wiki/Felipe_Massa	BRA	driver_rkq3RIoX
771	mcnish	Allan	McNish	\N	British	\N	1969-12-29	http://en.wikipedia.org/wiki/Allan_McNish	GBR	driver_ZLxDvx9i
772	davidson	Anthony	Davidson	DAV	British	\N	1979-04-18	http://en.wikipedia.org/wiki/Anthony_Davidson	GBR	driver_KsMcDrK5
773	pizzonia	Antônio	Pizzonia	PIZ	Brazilian	\N	1980-09-11	http://en.wikipedia.org/wiki/Ant%C3%B4nio_Pizzonia	BRA	driver_sOXupnRS
774	wilson	Justin	Wilson	\N	British	\N	1978-07-31	http://en.wikipedia.org/wiki/Justin_Wilson_(racing_driver)	GBR	driver_oJPszKtp
775	matta	Cristiano	da Matta	\N	Brazilian	\N	1973-09-19	http://en.wikipedia.org/wiki/Cristiano_da_Matta	BRA	driver_R1va4lUR
776	firman	Ralph	Firman	\N	Irish	\N	1975-05-20	http://en.wikipedia.org/wiki/Ralph_Firman	IRL	driver_NnC2cNVO
777	kiesa	Nicolas	Kiesa	\N	Danish	\N	1978-03-03	http://en.wikipedia.org/wiki/Nicolas_Kiesa	DNK	driver_lTcc3O51
778	baumgartner	Zsolt	Baumgartner	\N	Hungarian	\N	1981-01-01	http://en.wikipedia.org/wiki/Zsolt_Baumgartner	HUN	driver_lvbUkpzQ
779	klien	Christian	Klien	KLI	Austrian	\N	1983-02-07	http://en.wikipedia.org/wiki/Christian_Klien	AUT	driver_9g3ssIS2
780	pantano	Giorgio	Pantano	\N	Italian	\N	1979-02-04	http://en.wikipedia.org/wiki/Giorgio_Pantano	ITA	driver_OeWERqnY
781	bruni	Gianmaria	Bruni	\N	Italian	\N	1981-05-30	http://en.wikipedia.org/wiki/Gianmaria_Bruni	ITA	driver_HHtAEsFi
782	glock	Timo	Glock	GLO	German	\N	1982-03-18	http://en.wikipedia.org/wiki/Timo_Glock	DEU	driver_52L5Ruy3
783	karthikeyan	Narain	Karthikeyan	KAR	Indian	\N	1977-01-14	http://en.wikipedia.org/wiki/Narain_Karthikeyan	IND	driver_WVqNi5cJ
784	monteiro	Tiago	Monteiro	TMO	Portuguese	\N	1976-07-24	http://en.wikipedia.org/wiki/Tiago_Monteiro	PRT	driver_Fe7ZC4Bn
785	friesacher	Patrick	Friesacher	FRI	Austrian	\N	1980-09-26	http://en.wikipedia.org/wiki/Patrick_Friesacher	AUT	driver_HI2QtN07
786	albers	Christijan	Albers	ALB	Dutch	\N	1979-04-16	http://en.wikipedia.org/wiki/Christijan_Albers	NLD	driver_Ty9wR4L7
787	liuzzi	Vitantonio	Liuzzi	LIU	Italian	\N	1980-08-06	http://en.wikipedia.org/wiki/Vitantonio_Liuzzi	ITA	driver_MvG9s7cS
788	doornbos	Robert	Doornbos	DOO	Dutch	\N	1981-09-23	http://en.wikipedia.org/wiki/Robert_Doornbos	NLD	driver_7FxvuMaP
789	rosberg	Nico	Rosberg	ROS	German	6	1985-06-27	http://en.wikipedia.org/wiki/Nico_Rosberg	DEU	driver_6LUY5kqq
790	speed	Scott	Speed	SPE	American	\N	1983-01-24	http://en.wikipedia.org/wiki/Scott_Speed	USA	driver_FCyYVqPA
791	ide	Yuji	Ide	IDE	Japanese	\N	1975-01-21	http://en.wikipedia.org/wiki/Yuji_Ide	JPN	driver_BYUahd5X
792	montagny	Franck	Montagny	FMO	French	\N	1978-01-05	http://en.wikipedia.org/wiki/Franck_Montagny	FRA	driver_t7dFNWQP
793	yamamoto	Sakon	Yamamoto	YAM	Japanese	\N	1982-07-09	http://en.wikipedia.org/wiki/Sakon_Yamamoto	JPN	driver_dHR0RShY
794	kubica	Robert	Kubica	KUB	Polish	88	1984-12-07	http://en.wikipedia.org/wiki/Robert_Kubica	POL	driver_udWRAkPy
795	hamilton	Lewis	Hamilton	HAM	British	44	1985-01-07	http://en.wikipedia.org/wiki/Lewis_Hamilton	GBR	driver_cAPSXDn9
796	kovalainen	Heikki	Kovalainen	KOV	Finnish	\N	1981-10-19	http://en.wikipedia.org/wiki/Heikki_Kovalainen	FIN	driver_Hs9PZl8r
797	sutil	Adrian	Sutil	SUT	German	99	1983-01-11	http://en.wikipedia.org/wiki/Adrian_Sutil	DEU	driver_zSB3TJKw
798	vettel	Sebastian	Vettel	VET	German	5	1987-07-03	http://en.wikipedia.org/wiki/Sebastian_Vettel	DEU	driver_NpmnWj7a
799	markus_winkelhock	Markus	Winkelhock	WIN	German	\N	1980-06-13	http://en.wikipedia.org/wiki/Markus_Winkelhock	DEU	driver_ZoQGE8uA
800	nakajima	Kazuki	Nakajima	NAK	Japanese	\N	1985-01-11	http://en.wikipedia.org/wiki/Kazuki_Nakajima	JPN	driver_UbsKwRpI
801	bourdais	Sébastien	Bourdais	BOU	French	\N	1979-02-28	http://en.wikipedia.org/wiki/S%C3%A9bastien_Bourdais	FRA	driver_6wOuWXC3
802	piquet_jr	Nelson	Piquet Jr.	PIQ	Brazilian	\N	1985-07-25	http://en.wikipedia.org/wiki/Nelson_Piquet,_Jr.	BRA	driver_NvuAnuAG
803	buemi	Sébastien	Buemi	BUE	Swiss	\N	1988-10-31	http://en.wikipedia.org/wiki/S%C3%A9bastien_Buemi	CHE	driver_2l827o2H
804	alguersuari	Jaime	Alguersuari	ALG	Spanish	\N	1990-03-23	http://en.wikipedia.org/wiki/Jaime_Alguersuari	ESP	driver_oNiRJ5g1
805	grosjean	Romain	Grosjean	GRO	French	8	1986-04-17	http://en.wikipedia.org/wiki/Romain_Grosjean	FRA	driver_TsLyZaTI
806	kobayashi	Kamui	Kobayashi	KOB	Japanese	10	1986-09-13	http://en.wikipedia.org/wiki/Kamui_Kobayashi	JPN	driver_JaJFf61y
807	hulkenberg	Nico	Hülkenberg	HUL	German	27	1987-08-19	http://en.wikipedia.org/wiki/Nico_H%C3%BClkenberg	DEU	driver_gADFaAX1
808	bruno_senna	Bruno	Senna	SEN	Brazilian	\N	1983-10-15	http://en.wikipedia.org/wiki/Bruno_Senna	BRA	driver_hy3ZnIVp
809	petrov	Vitaly	Petrov	PET	Russian	\N	1984-09-08	http://en.wikipedia.org/wiki/Vitaly_Petrov	RUS	driver_SShbJdLE
810	grassi	Lucas	di Grassi	DIG	Brazilian	\N	1984-08-11	http://en.wikipedia.org/wiki/Lucas_di_Grassi	BRA	driver_ujohWytf
811	chandhok	Karun	Chandhok	CHA	Indian	\N	1984-01-19	http://en.wikipedia.org/wiki/Karun_Chandhok	IND	driver_5bZkLvns
812	resta	Paul	di Resta	DIR	British	40	1986-04-16	http://en.wikipedia.org/wiki/Paul_di_Resta	GBR	driver_VoN0eg0x
813	ambrosio	Jérôme	d'Ambrosio	DAM	Belgian	\N	1985-12-27	http://en.wikipedia.org/wiki/J%C3%A9r%C3%B4me_d%27Ambrosio	BEL	driver_PvM6qZkl
814	maldonado	Pastor	Maldonado	MAL	Venezuelan	13	1985-03-09	http://en.wikipedia.org/wiki/Pastor_Maldonado	VEN	driver_hrA0goWi
815	perez	Sergio	Pérez	PER	Mexican	11	1990-01-26	http://en.wikipedia.org/wiki/Sergio_P%C3%A9rez	MEX	driver_NliMiGAb
816	ricciardo	Daniel	Ricciardo	RIC	Australian	3	1989-07-01	http://en.wikipedia.org/wiki/Daniel_Ricciardo	AUS	driver_yzCm34qm
817	vergne	Jean-Éric	Vergne	VER	French	25	1990-04-25	http://en.wikipedia.org/wiki/Jean-%C3%89ric_Vergne	FRA	driver_8l5sMbIL
818	pic	Charles	Pic	PIC	French	\N	1990-02-15	http://en.wikipedia.org/wiki/Charles_Pic	FRA	driver_YZ66PNy8
819	gutierrez	Esteban	Gutiérrez	GUT	Mexican	21	1991-08-05	http://en.wikipedia.org/wiki/Esteban_Guti%C3%A9rrez	MEX	driver_kCqKqFdI
820	bottas	Valtteri	Bottas	BOT	Finnish	77	1989-08-28	http://en.wikipedia.org/wiki/Valtteri_Bottas	FIN	driver_H43o382s
821	jules_bianchi	Jules	Bianchi	BIA	French	17	1989-08-03	http://en.wikipedia.org/wiki/Jules_Bianchi	FRA	driver_zL2M2XrU
822	chilton	Max	Chilton	CHI	British	4	1991-04-21	http://en.wikipedia.org/wiki/Max_Chilton	GBR	driver_JYsQRpQV
823	garde	Giedo	van der Garde	VDG	Dutch	\N	1985-04-25	http://en.wikipedia.org/wiki/Giedo_van_der_Garde	NLD	driver_ggHXDOzw
824	kevin_magnussen	Kevin	Magnussen	MAG	Danish	20	1992-10-05	http://en.wikipedia.org/wiki/Kevin_Magnussen	DNK	driver_8tH8zRcP
825	kvyat	Daniil	Kvyat	KVY	Russian	26	1994-04-26	http://en.wikipedia.org/wiki/Daniil_Kvyat	RUS	driver_yAyREtm5
826	ericsson	Marcus	Ericsson	ERI	Swedish	9	1990-09-02	http://en.wikipedia.org/wiki/Marcus_Ericsson	SWE	driver_VNDTqAUl
827	lotterer	André	Lotterer	LOT	German	45	1981-11-19	http://en.wikipedia.org/wiki/Andr%C3%A9_Lotterer	DEU	driver_plV03Ck4
828	stevens	Will	Stevens	STE	British	28	1991-06-28	http://en.wikipedia.org/wiki/Will_Stevens	GBR	driver_vVFRj2xA
829	nasr	Felipe	Nasr	NAS	Brazilian	12	1992-08-21	http://en.wikipedia.org/wiki/Felipe_Nasr	BRA	driver_ukIaEYIe
830	sainz	Carlos	Sainz	SAI	Spanish	55	1994-09-01	http://en.wikipedia.org/wiki/Carlos_Sainz_Jr.	ESP	driver_nPms5pYt
831	max_verstappen	Max	Verstappen	VER	Dutch	33	1997-09-30	http://en.wikipedia.org/wiki/Max_Verstappen	NLD	driver_VkTWWTC5
832	merhi	Roberto	Merhi	MER	Spanish	98	1991-03-22	http://en.wikipedia.org/wiki/Roberto_Merhi	ESP	driver_ZgSGE9zw
833	rossi	Alexander	Rossi	RSS	American	53	1991-09-25	http://en.wikipedia.org/wiki/Alexander_Rossi_%28racing_driver%29	USA	driver_oXSYPuKt
834	jolyon_palmer	Jolyon	Palmer	PAL	British	30	1991-01-20	http://en.wikipedia.org/wiki/Jolyon_Palmer	GBR	driver_Em1o0wN7
835	wehrlein	Pascal	Wehrlein	WEH	German	94	1994-10-18	http://en.wikipedia.org/wiki/Pascal_Wehrlein	DEU	driver_D4E4RT6b
836	haryanto	Rio	Haryanto	HAR	Indonesian	88	1993-01-22	http://en.wikipedia.org/wiki/Rio_Haryanto	IDN	driver_3aMv7hXW
837	vandoorne	Stoffel	Vandoorne	VAN	Belgian	2	1992-03-26	http://en.wikipedia.org/wiki/Stoffel_Vandoorne	BEL	driver_Y0gHC067
838	ocon	Esteban	Ocon	OCO	French	31	1996-09-17	http://en.wikipedia.org/wiki/Esteban_Ocon	FRA	driver_0GFvbLMc
839	giovinazzi	Antonio	Giovinazzi	GIO	Italian	99	1993-12-14	http://en.wikipedia.org/wiki/Antonio_Giovinazzi	ITA	driver_KgG5C2mX
840	stroll	Lance	Stroll	STR	Canadian	18	1998-10-29	http://en.wikipedia.org/wiki/Lance_Stroll	CAN	driver_XkmSOlgX
841	gasly	Pierre	Gasly	GAS	French	10	1996-02-07	http://en.wikipedia.org/wiki/Pierre_Gasly	FRA	driver_q7WdJenu
842	brendon_hartley	Brendon	Hartley	HAR	New Zealander	28	1989-11-10	http://en.wikipedia.org/wiki/Brendon_Hartley	NZL	driver_enDp9GIA
843	leclerc	Charles	Leclerc	LEC	Monegasque	16	1997-10-16	http://en.wikipedia.org/wiki/Charles_Leclerc	MCO	driver_pAXWnsA8
844	sirotkin	Sergey	Sirotkin	SIR	Russian	35	1995-08-27	http://en.wikipedia.org/wiki/Sergey_Sirotkin_(racing_driver)	RUS	driver_Z04874u4
845	norris	Lando	Norris	NOR	British	4	1999-11-13	http://en.wikipedia.org/wiki/Lando_Norris	GBR	driver_BOyYHlVE
846	albon	Alexander	Albon	ALB	Thai	23	1996-03-23	http://en.wikipedia.org/wiki/Alexander_Albon	THA	driver_0Z9Cjb1U
847	russell	George	Russell	RUS	British	63	1998-02-15	http://en.wikipedia.org/wiki/George_Russell_(racing_driver)	GBR	driver_dPPwWNxA
848	latifi	Nicholas	Latifi	LAT	Canadian	6	1995-06-29	http://en.wikipedia.org/wiki/Nicholas_Latifi	CAN	driver_mTVhQq4k
849	aitken	Jack	Aitken	AIT	British	89	1995-09-23	http://en.wikipedia.org/wiki/Jack_Aitken	GBR	driver_3ujEQimb
850	pietro_fittipaldi	Pietro	Fittipaldi	FIT	Brazilian	51	1996-06-25	http://en.wikipedia.org/wiki/Pietro_Fittipaldi	BRA	driver_ZZFFFYis
851	tsunoda	Yuki	Tsunoda	TSU	Japanese	22	2000-05-11	http://en.wikipedia.org/wiki/Yuki_Tsunoda	JPN	driver_aEOevTUh
852	mick_schumacher	Mick	Schumacher	MSC	German	47	1999-03-22	http://en.wikipedia.org/wiki/Mick_Schumacher	DEU	driver_UxnmZnub
853	mazepin	Nikita	Mazepin	MAZ	Russian	9	1999-03-02	http://en.wikipedia.org/wiki/Nikita_Mazepin	RUS	driver_qz190vuw
854	zhou	Guanyu	Zhou	ZHO	Chinese	24	1999-05-30	http://en.wikipedia.org/wiki/Zhou_Guanyu	CHN	driver_CyXA6GA4
855	de_vries	Nyck	de Vries	DEV	Dutch	21	1995-02-06	http://en.wikipedia.org/wiki/Nyck_de_Vries	NLD	driver_xKluwMtH
856	sargeant	Logan	Sargeant	SAR	American	2	2000-12-31	http://en.wikipedia.org/wiki/Logan_Sargeant	USA	driver_xXhDYjcC
857	piastri	Oscar	Piastri	PIA	Australian	81	2001-04-06	http://en.wikipedia.org/wiki/Oscar_Piastri	AUS	driver_1V17qcph
858	lawson	Liam	Lawson	LAW	New Zealander	30	2002-02-11	http://en.wikipedia.org/wiki/Liam_Lawson	NZL	driver_uLDLxCqO
859	bearman	Oliver	Bearman	BEA	British	87	2005-05-08	http://en.wikipedia.org/wiki/Oliver_Bearman	GBR	driver_19q67raM
860	colapinto	Franco	Colapinto	COL	Argentine	43	2003-05-27	http://en.wikipedia.org/wiki/Franco_Colapinto	ARG	driver_ElsSjDoL
861	doohan	Jack	Doohan	DOO	Australian	7	2003-01-20	http://en.wikipedia.org/wiki/Jack_Doohan	AUS	driver_g0a6B2Hm
862	bortoleto	Gabriel	Bortoleto	BOR	Brazilian	5	2004-10-14	https://en.wikipedia.org/wiki/Gabriel_Bortoleto	BRA	driver_d1a4FipV
863	antonelli	Andrea Kimi	Antonelli	ANT	Italian	12	2006-08-25	https://en.wikipedia.org/wiki/Andrea_Kimi_Antonelli	ITA	driver_yNfRW5Lg
864	hadjar	Isack	Hadjar	HAD	French	6	2004-09-28	https://en.wikipedia.org/wiki/Isack_Hadjar	FRA	driver_ZiErQgDm
\.


--
-- Data for Name: formula_one_season; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_season (id, year, wikipedia, championship_system_id, api_id) FROM stdin;
1	1950	https://en.wikipedia.org/wiki/1950_Formula_One_season	1	season_oPqQEC4b
2	1951	https://en.wikipedia.org/wiki/1951_Formula_One_season	1	season_nH07GTj5
3	1952	https://en.wikipedia.org/wiki/1952_Formula_One_season	1	season_AkHDeRX4
4	1953	https://en.wikipedia.org/wiki/1953_Formula_One_season	1	season_E63rvZZO
5	1954	https://en.wikipedia.org/wiki/1954_Formula_One_season	2	season_B36NWfA1
6	1955	https://en.wikipedia.org/wiki/1955_Formula_One_season	2	season_DBrGk2ul
7	1956	https://en.wikipedia.org/wiki/1956_Formula_One_season	2	season_4fd8Is4A
8	1957	https://en.wikipedia.org/wiki/1957_Formula_One_season	2	season_xuWvk5oC
9	1958	https://en.wikipedia.org/wiki/1958_Formula_One_season	3	season_bWlfBFd5
10	1959	https://en.wikipedia.org/wiki/1959_Formula_One_season	4	season_BxrRPClB
11	1960	https://en.wikipedia.org/wiki/1960_Formula_One_season	3	season_pz8pvIt0
12	1961	https://en.wikipedia.org/wiki/1961_Formula_One_season	4	season_Grfa3cuQ
13	1962	https://en.wikipedia.org/wiki/1962_Formula_One_season	4	season_1ZNNnCob
14	1963	https://en.wikipedia.org/wiki/1963_Formula_One_season	3	season_tPFuXriY
15	1964	https://en.wikipedia.org/wiki/1964_Formula_One_season	3	season_XZRfPDdC
16	1965	https://en.wikipedia.org/wiki/1965_Formula_One_season	3	season_Wdr0i1vL
17	1966	https://en.wikipedia.org/wiki/1966_Formula_One_season	4	season_s2BDscga
18	1967	https://en.wikipedia.org/wiki/1967_Formula_One_season	5	season_OaFVx2eU
19	1968	https://en.wikipedia.org/wiki/1968_Formula_One_season	5	season_v7LnsacP
20	1969	https://en.wikipedia.org/wiki/1969_Formula_One_season	5	season_ze0J4WyN
21	1970	https://en.wikipedia.org/wiki/1970_Formula_One_season	5	season_tYUiCY5q
22	1971	https://en.wikipedia.org/wiki/1971_Formula_One_season	5	season_k4lRoZdb
23	1972	https://en.wikipedia.org/wiki/1972_Formula_One_season	5	season_RW8o2jTr
24	1973	https://en.wikipedia.org/wiki/1973_Formula_One_season	5	season_iyXgihjq
25	1974	https://en.wikipedia.org/wiki/1974_Formula_One_season	5	season_O3mHgQl5
26	1975	https://en.wikipedia.org/wiki/1975_Formula_One_season	5	season_om72P1iI
27	1976	https://en.wikipedia.org/wiki/1976_Formula_One_season	5	season_ia0XzhGW
28	1977	https://en.wikipedia.org/wiki/1977_Formula_One_season	5	season_NUCYmI01
29	1978	https://en.wikipedia.org/wiki/1978_Formula_One_season	5	season_dVbGWXMY
30	1979	https://en.wikipedia.org/wiki/1979_Formula_One_season	6	season_Ar7VkByC
31	1980	https://en.wikipedia.org/wiki/1980_Formula_One_season	7	season_UPXDUUqK
32	1981	https://en.wikipedia.org/wiki/1981_Formula_One_World_Championship	8	season_tT30mOB8
33	1982	https://en.wikipedia.org/wiki/1982_Formula_One_World_Championship	8	season_VfGc75TB
34	1983	https://en.wikipedia.org/wiki/1983_Formula_One_World_Championship	8	season_BtjGOqcG
35	1984	https://en.wikipedia.org/wiki/1984_Formula_One_World_Championship	8	season_yj7kaUvc
36	1985	https://en.wikipedia.org/wiki/1985_Formula_One_World_Championship	8	season_MZE6iWL1
37	1986	https://en.wikipedia.org/wiki/1986_Formula_One_World_Championship	8	season_uxVIETPS
38	1987	https://en.wikipedia.org/wiki/1987_Formula_One_World_Championship	8	season_IZJlhW13
39	1988	https://en.wikipedia.org/wiki/1988_Formula_One_World_Championship	8	season_s8LeLo4d
40	1989	https://en.wikipedia.org/wiki/1989_Formula_One_World_Championship	8	season_19DKaABK
41	1990	https://en.wikipedia.org/wiki/1990_Formula_One_World_Championship	8	season_VTSaS97y
42	1991	https://en.wikipedia.org/wiki/1991_Formula_One_World_Championship	9	season_WXhs09Xl
43	1992	https://en.wikipedia.org/wiki/1992_Formula_One_World_Championship	9	season_uu1v97eb
44	1993	https://en.wikipedia.org/wiki/1993_Formula_One_World_Championship	9	season_ILAx4PfB
45	1994	https://en.wikipedia.org/wiki/1994_Formula_One_World_Championship	9	season_U3vFOLfr
46	1995	https://en.wikipedia.org/wiki/1995_Formula_One_World_Championship	9	season_jD1ETZCW
47	1996	https://en.wikipedia.org/wiki/1996_Formula_One_World_Championship	9	season_yvSVGvDq
48	1997	https://en.wikipedia.org/wiki/1997_Formula_One_World_Championship	9	season_c8DomdA4
49	1998	https://en.wikipedia.org/wiki/1998_Formula_One_World_Championship	9	season_U88C6eXw
50	1999	https://en.wikipedia.org/wiki/1999_Formula_One_World_Championship	9	season_iwGlXyem
51	2000	https://en.wikipedia.org/wiki/2000_Formula_One_World_Championship	9	season_yFVmObVG
52	2001	https://en.wikipedia.org/wiki/2001_Formula_One_World_Championship	9	season_Vd7Mjr3D
53	2002	https://en.wikipedia.org/wiki/2002_Formula_One_World_Championship	10	season_vs1lR7px
54	2003	https://en.wikipedia.org/wiki/2003_Formula_One_World_Championship	10	season_p6VHtPuG
55	2004	https://en.wikipedia.org/wiki/2004_Formula_One_World_Championship	10	season_wrElzAko
56	2005	https://en.wikipedia.org/wiki/2005_Formula_One_World_Championship	10	season_flxa6vll
57	2006	https://en.wikipedia.org/wiki/2006_Formula_One_World_Championship	10	season_8Ansd3iH
58	2007	https://en.wikipedia.org/wiki/2007_Formula_One_World_Championship	10	season_fZeieOeN
59	2008	https://en.wikipedia.org/wiki/2008_Formula_One_World_Championship	10	season_gdhtPT0K
60	2009	https://en.wikipedia.org/wiki/2009_Formula_One_World_Championship	10	season_H6bBsxu1
61	2010	https://en.wikipedia.org/wiki/2010_Formula_One_World_Championship	10	season_6xCpUt9S
62	2011	https://en.wikipedia.org/wiki/2011_Formula_One_World_Championship	10	season_8FHqPTXa
63	2012	https://en.wikipedia.org/wiki/2012_Formula_One_World_Championship	10	season_gBsCSXKV
64	2013	https://en.wikipedia.org/wiki/2013_Formula_One_World_Championship	10	season_ZdgKhugI
65	2014	https://en.wikipedia.org/wiki/2014_Formula_One_World_Championship	10	season_AJ6uXOc5
66	2015	https://en.wikipedia.org/wiki/2015_Formula_One_World_Championship	10	season_gZQGqIyf
67	2016	https://en.wikipedia.org/wiki/2016_Formula_One_World_Championship	10	season_qIKpLbD2
68	2017	https://en.wikipedia.org/wiki/2017_Formula_One_World_Championship	10	season_PMVt7Y0H
69	2018	https://en.wikipedia.org/wiki/2018_Formula_One_World_Championship	10	season_sBgQuQLL
70	2019	https://en.wikipedia.org/wiki/2019_Formula_One_World_Championship	10	season_RFoi7MRW
71	2020	https://en.wikipedia.org/wiki/2020_Formula_One_World_Championship	10	season_oJoumPj1
72	2021	https://en.wikipedia.org/wiki/2021_Formula_One_World_Championship	10	season_ExhxIdjW
73	2022	https://en.wikipedia.org/wiki/2022_Formula_One_World_Championship	10	season_5stUdACo
74	2023	https://en.wikipedia.org/wiki/2023_Formula_One_World_Championship	10	season_0VeNZC1A
75	2024	https://en.wikipedia.org/wiki/2024_Formula_One_World_Championship	10	season_MNVuvgwN
76	2025	https://en.wikipedia.org/wiki/2025_Formula_One_World_Championship	10	season_igb0pzQ3
\.


--
-- Data for Name: formula_one_team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_team (id, reference, name, nationality, wikipedia, base_team_id, country_code, api_id) FROM stdin;
1	alfa	Alfa Romeo	Swiss	http://en.wikipedia.org/wiki/Alfa_Romeo_in_Formula_One	\N	CHE	team_1XDKqgNu
2	maserati	Maserati	Italian	http://en.wikipedia.org/wiki/Maserati	\N	ITA	team_e9i5UU0k
3	alta	Alta	British	http://en.wikipedia.org/wiki/Alta_auto_racing_team	\N	GBR	team_R6ZNEH9U
4	era	ERA	British	http://en.wikipedia.org/wiki/English_Racing_Automobiles	\N	GBR	team_88ODtUbG
5	lago	Talbot-Lago	French	http://en.wikipedia.org/wiki/Talbot-Lago	\N	FRA	team_IlAsz4uS
6	ferrari	Ferrari	Italian	http://en.wikipedia.org/wiki/Scuderia_Ferrari	\N	ITA	team_LjEBz7Xq
7	cooper	Cooper	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N	GBR	team_30JF6LC9
8	simca	Simca	French	http://en.wikipedia.org/wiki/Simca	\N	FRA	team_Qvmt6Zze
9	watson	Watson	American	http://en.wikipedia.org/wiki/A.J._Watson	\N	USA	team_sEVdOPV8
10	kurtis_kraft	Kurtis Kraft	American	http://en.wikipedia.org/wiki/Kurtis_Kraft	\N	USA	team_5y7o18Qu
11	deidt	Deidt	American	http://en.wikipedia.org/wiki/Deidt	\N	USA	team_OKDS5Fi2
12	adams	Adams	American	http://en.wikipedia.org/wiki/Adams_(constructor)	\N	USA	team_PN3ACiV9
13	snowberger	Snowberger	American	http://en.wikipedia.org/wiki/Snowberger	\N	USA	team_21KLLFYZ
14	wetteroth	Wetteroth	American	http://en.wikipedia.org/wiki/Wetteroth	\N	USA	team_MV7KSYfg
15	olson	Olson	American	http://en.wikipedia.org/wiki/Olson_(constructor)	\N	USA	team_SmhyT8Uz
16	rae	Rae	American	http://en.wikipedia.org/wiki/Rae_(motorsport)	\N	USA	team_CTw57HyO
17	ewing	Ewing	American	http://en.wikipedia.org/wiki/Ewing_(constructor)	\N	USA	team_Gr2VVKW2
18	langley	Langley	American	http://en.wikipedia.org/wiki/Langley_(constructor)	\N	USA	team_L7rTnnrl
19	lesovsky	Lesovsky	American	http://en.wikipedia.org/wiki/Lesovsky	\N	USA	team_dlm9zQKn
20	stevens	Stevens	American	http://en.wikipedia.org/wiki/Stevens_(constructor)	\N	USA	team_Wn3hAIGV
21	marchese	Marchese	American	http://en.wikipedia.org/wiki/Marchese_(constructor)	\N	USA	team_xTHyPsEN
22	nichels	Nichels	American	http://en.wikipedia.org/wiki/Nichels	\N	USA	team_3kHopCrb
23	moore	Moore	American	http://en.wikipedia.org/wiki/Moore_(constructor)	\N	USA	team_2XDYD8Im
24	milano	Milano	Italian	http://en.wikipedia.org/wiki/Scuderia_Milano	\N	ITA	team_c3nYjvNS
25	hwm	HWM	British	http://en.wikipedia.org/wiki/Hersham_and_Walton_Motors	\N	GBR	team_t9M79bSY
26	veritas	Veritas	German	http://en.wikipedia.org/wiki/Veritas_(constructor)	\N	DEU	team_3cdJmvZb
27	trevis	Trevis	American	http://en.wikipedia.org/wiki/Trevis	\N	USA	team_aTG7djCg
28	kuzma	Kuzma	American	http://en.wikipedia.org/wiki/Kuzma_(constructor)	\N	USA	team_wzDWJIaX
29	schroeder	Schroeder	American	http://en.wikipedia.org/wiki/Schroeder_(constructor)	\N	USA	team_wTk8lwkP
30	pawl	Pawl	American	http://en.wikipedia.org/wiki/Pawl_(constructor)	\N	USA	team_Yo6H6fo9
31	bromme	Bromme	American	http://en.wikipedia.org/wiki/Bromme	\N	USA	team_59Vl6Ztz
32	hall	Hall	American	http://en.wikipedia.org/wiki/Hall_(constructor)	\N	USA	team_nbnNBZqZ
33	sherman	Sherman	American	http://en.wikipedia.org/wiki/Sherman_(constructor)	\N	USA	team_xqqePL3C
34	brm	BRM	British	http://en.wikipedia.org/wiki/BRM	\N	GBR	team_bh6newAp
35	osca	OSCA	Italian	http://en.wikipedia.org/wiki/Officine_Specializate_Costruzione_Automobili	\N	ITA	team_R5PXfCwI
36	gordini	Gordini	French	http://en.wikipedia.org/wiki/Gordini	\N	FRA	team_8FCRQeST
37	afm	AFM	German	http://en.wikipedia.org/wiki/Alex_von_Falkenhausen_Motorenbau	\N	DEU	team_E5uZoLJn
38	frazer_nash	Frazer Nash	British	http://en.wikipedia.org/wiki/Frazer_Nash	\N	GBR	team_iPa9DJVF
39	butterworth	Aston Butterworth	British	http://en.wikipedia.org/wiki/Aston_Butterworth	\N	GBR	team_LlW0CpgR
40	connaught	Connaught	British	http://en.wikipedia.org/wiki/Connaught_Engineering	\N	GBR	team_nmNSzedm
41	bmw	BMW	German	http://en.wikipedia.org/wiki/BMW	\N	DEU	team_0xWgVGgA
42	cisitalia	Cisitalia	Italian	http://en.wikipedia.org/wiki/Cisitalia	\N	ITA	team_oXlHzWsz
43	turner	Turner	American	http://en.wikipedia.org/wiki/Turner_(constructor)	\N	USA	team_4smAme7H
44	del_roy	Del Roy	American	http://en.wikipedia.org/wiki/Del_Roy	\N	USA	team_OgldHYwf
45	emw	EMW	East German	http://en.wikipedia.org/wiki/Eisenacher_Motorenwerk	\N	DEU	team_RvyU2uMj
46	pankratz	Pankratz	American	http://en.wikipedia.org/wiki/Pankratz	\N	USA	team_1VljTYAL
47	phillips	Phillips	American	http://en.wikipedia.org/wiki/Phillips_(constructor)	\N	USA	team_2rgeFCo6
48	mercedes	Mercedes	German	http://en.wikipedia.org/wiki/Mercedes-Benz_in_Formula_One	\N	DEU	team_tdiMmtQx
49	vanwall	Vanwall	British	http://en.wikipedia.org/wiki/Vanwall	\N	GBR	team_HG8pXipW
50	klenk	Klenk	German	http://en.wikipedia.org/wiki/Klenk	\N	DEU	team_69QGzCzc
51	lancia	Lancia	Italian	http://en.wikipedia.org/wiki/Lancia_in_Formula_One	\N	ITA	team_jPtVwO5z
52	epperly	Epperly	American	http://en.wikipedia.org/wiki/Epperly	\N	USA	team_CIuiyT82
53	arzani-volpini	Arzani-Volpini	Italian	http://en.wikipedia.org/wiki/Arzani-Volpini	\N	ITA	team_2GbIA72u
54	bugatti	Bugatti	French	http://en.wikipedia.org/wiki/Bugatti	\N	FRA	team_sHrnnruO
55	emeryson	Emeryson	British	http://en.wikipedia.org/wiki/Emeryson	\N	GBR	team_agrI5RDE
56	dunn	Dunn	American	http://en.wikipedia.org/wiki/Dunn_Engineering	\N	USA	team_mbLf6V0P
57	porsche	Porsche	German	http://en.wikipedia.org/wiki/Porsche_in_Formula_One	\N	DEU	team_NlfPVZUf
58	team_lotus	Team Lotus	British	http://en.wikipedia.org/wiki/Team_Lotus	\N	GBR	team_RRgxx20k
59	cooper-climax	Cooper-Climax	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N	GBR	team_qS3Y6u1Z
60	cooper-maserati	Cooper-Maserati	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N	GBR	team_jxmEOCk0
61	vhristensen	Christensen	American	http://en.wikipedia.org/wiki/Christensen_(constructor)	\N	USA	team_mHIpB6qj
62	elder	Elder	American	http://en.wikipedia.org/wiki/Elder_(constructor)	\N	USA	team_ZyXq89TE
63	sutton	Sutton	American	http://en.wikipedia.org/wiki/Sutton_(constructor)	\N	USA	team_fQWLTgg5
64	aston_martin	Aston Martin	British	http://en.wikipedia.org/wiki/Aston_Martin_in_Formula_One	\N	GBR	team_fhnXl3cF
65	jbw	JBW	British	http://en.wikipedia.org/wiki/JBW	\N	GBR	team_z9E9L9zl
66	fry	Fry	British	http://en.wikipedia.org/wiki/Fry_(racing_team)	\N	GBR	team_OjXlYMRr
67	cooper-borgward	Cooper-Borgward	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N	GBR	team_t0t5zwz6
68	tec-mec	Tec-Mec	Italian	http://en.wikipedia.org/wiki/Tec-Mec	\N	ITA	team_uvQ38k4S
69	cooper-osca	Cooper-OSCA	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N	GBR	team_xl9KLjoL
70	behra-porsche	Behra-Porsche	Italian	http://en.wikipedia.org/wiki/Behra-Porsche	\N	ITA	team_pn6GMWhm
71	scarab	Scarab	American	http://en.wikipedia.org/wiki/Scarab_(constructor)	\N	USA	team_JaY8QJMx
72	cooper-castellotti	Cooper-Castellotti	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N	GBR	team_jTjvOqvq
73	meskowski	Meskowski	American	http://en.wikipedia.org/wiki/Meskowski	\N	USA	team_cw9Mngfn
74	lotus-climax	Lotus-Climax	British	http://en.wikipedia.org/wiki/Team_Lotus	\N	GBR	team_iToyZhjf
75	de_tomaso-osca	De Tomaso-Osca	Italian	http://en.wikipedia.org/wiki/De_Tomaso	\N	ITA	team_FLWtBPf6
76	ferguson	Ferguson	British	http://en.wikipedia.org/wiki/Ferguson_Research_Ltd.	\N	GBR	team_8xSKv9N1
77	gilby	Gilby	British	http://en.wikipedia.org/wiki/Gilby	\N	GBR	team_WFqQ85c4
78	mbm	MBM	Swiss	http://en.wikipedia.org/wiki/Monteverdi_Basel_Motors	\N	CHE	team_LhFoCFCl
79	lotus-maserati	Lotus-Maserati	British	http://en.wikipedia.org/wiki/Team_Lotus	\N	GBR	team_fl7Gth4l
80	de_tomaso-alfa_romeo	De Tomaso-Alfa Romeo	Italian	http://en.wikipedia.org/wiki/De_Tomaso	\N	ITA	team_FRejiadM
81	lola	Lola	British	http://en.wikipedia.org/wiki/MasterCard_Lola	\N	GBR	team_ClwzNpB9
82	lotus-brm	Lotus-BRM	British	http://en.wikipedia.org/wiki/Team_Lotus	\N	GBR	team_Jk8ZWN2L
83	brabham	Brabham	British	http://en.wikipedia.org/wiki/Brabham	\N	GBR	team_63Hm3vdB
84	enb	ENB	Belgian	http://en.wikipedia.org/wiki/Ecurie_Nationale_Belge	\N	BEL	team_AOw2gW2Y
85	tomaso	De Tomaso	Italian	http://en.wikipedia.org/wiki/De_Tomaso	\N	ITA	team_wZpAdQ0M
86	lotus-borgward	Lotus-Borgward	British	http://en.wikipedia.org/wiki/Team_Lotus	\N	GBR	team_cCAuDAiv
87	lds	LDS	South African	http://en.wikipedia.org/wiki/LDS_(automobile)	\N	ZAF	team_IysyM7Tj
88	cooper-alfa_romeo	Cooper-Alfa Romeo	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N	GBR	team_QNffJhXX
89	ats	ATS	Italian	http://en.wikipedia.org/wiki/ATS_(wheels)	\N	ITA	team_mX6hv6EG
90	scirocco	Scirocco	British	http://en.wikipedia.org/wiki/Scirocco-Powell	\N	GBR	team_P19ZQ2W0
91	brp	BRP	British	http://en.wikipedia.org/wiki/British_Racing_Partnership	\N	GBR	team_miMQNYr7
92	de_tomaso-ferrari	De Tomaso-Ferrari	Italian	http://en.wikipedia.org/wiki/De_Tomaso	\N	ITA	team_g4SEwVgn
93	stebro	Stebro	Canadian	http://en.wikipedia.org/wiki/Stebro	\N	CAN	team_3rlDFDIy
94	lotus-ford	Lotus-Ford	British	http://en.wikipedia.org/wiki/Team_Lotus	\N	GBR	team_9oa1F3n1
95	brabham-climax	Brabham-Climax	British	http://en.wikipedia.org/wiki/Brabham	\N	GBR	team_wvbkzhVn
96	brabham-brm	Brabham-BRM	British	http://en.wikipedia.org/wiki/Brabham	\N	GBR	team_Ctek2drp
97	brabham-ford	Brabham-Ford	British	http://en.wikipedia.org/wiki/Brabham	\N	GBR	team_zawzOteX
98	honda	Honda	Japanese	http://en.wikipedia.org/wiki/Honda_Racing_F1	\N	JPN	team_tAKj8cc3
99	derrington	Derrington	British	http://en.wikipedia.org/wiki/Derrington-Francis	\N	GBR	team_XcaIR4Qj
100	re	RE	Rhodesian	http://en.wikipedia.org/wiki/RE_%28automobile%29	\N	RSR	team_M1JQWwUm
101	lds-climax	LDS-Climax	South African	http://en.wikipedia.org/wiki/LDS_(automobile)	\N	ZAF	team_1wQTA3Ui
102	lds-alfa_romeo	LDS-Alfa Romeo	South African	http://en.wikipedia.org/wiki/LDS_(automobile)	\N	ZAF	team_D1pjSlt9
103	cooper-ford	Cooper-Ford	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N	GBR	team_8dHIdEcV
104	mclaren-ford	McLaren-Ford	British	http://en.wikipedia.org/wiki/Team_McLaren	\N	GBR	team_4XDf9MlA
105	brabham-repco	Brabham-Repco	British	http://en.wikipedia.org/wiki/Brabham	\N	GBR	team_Iwcf10B9
106	mclaren-seren	McLaren-Serenissima	British	http://en.wikipedia.org/wiki/Team_McLaren	\N	GBR	team_FgdA2BhY
107	eagle-climax	Eagle-Climax	American	http://en.wikipedia.org/wiki/Anglo_American_Racers	\N	USA	team_mDCZRvu5
108	shannon	Shannon	British	http://en.wikipedia.org/wiki/Shannon_(Formula_One)	\N	GBR	team_1ouAl045
109	cooper-ferrari	Cooper-Ferrari	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N	GBR	team_3oFhZUHn
110	eagle-weslake	Eagle-Weslake	American	http://en.wikipedia.org/wiki/Anglo_American_Racers	\N	USA	team_o3gRVu8O
111	matra	Matra	French	http://en.wikipedia.org/wiki/Matra	\N	FRA	team_rNUPkoD0
112	mclaren-brm	McLaren-BRM	British	http://en.wikipedia.org/wiki/McLaren_(racing)	\N	GBR	team_Gz6XRgLJ
113	cooper-ats	Cooper-ATS	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N	GBR	team_6BZKbOAi
114	protos	Protos	British	http://en.wikipedia.org/wiki/Protos_(constructor)	\N	GBR	team_pFNfACnG
115	cooper-brm	Cooper-BRM	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N	GBR	team_KY3XbrVw
116	matra-ford	Matra-Ford	French	http://en.wikipedia.org/wiki/Matra	\N	FRA	team_Soo0jLPW
117	mclaren	McLaren	British	http://en.wikipedia.org/wiki/McLaren	\N	GBR	team_jJ6cuwXz
118	brm-ford	BRM-Ford	British	http://en.wikipedia.org/wiki/BRM	\N	GBR	team_eN55FeAl
119	march	March	British	http://en.wikipedia.org/wiki/March_Engineering	\N	GBR	team_RnZCG0K2
120	mclaren-alfa_romeo	McLaren-Alfa Romeo	British	http://en.wikipedia.org/wiki/McLaren_(racing)	\N	GBR	team_F7VM43fm
121	bellasi	Bellasi	Swiss	http://en.wikipedia.org/wiki/Bellasi	\N	CHE	team_jabAvjip
122	surtees	Surtees	British	http://en.wikipedia.org/wiki/Surtees	\N	GBR	team_jpyLr5CS
123	tyrrell	Tyrrell	British	http://en.wikipedia.org/wiki/Tyrrell_Racing	\N	GBR	team_UTKd5GMp
124	march-ford	March-Ford	British	http://en.wikipedia.org/wiki/March_Engineering	\N	GBR	team_C1acvD9f
125	march-alfa_romeo	March-Alfa Romeo	British	http://en.wikipedia.org/wiki/March_Engineering	\N	GBR	team_l22IFgg2
126	lotus-pw	Lotus-Pratt &amp; Whitney	British	http://en.wikipedia.org/wiki/Team_Lotus	\N	GBR	team_eecfbU1O
127	tecno	Tecno	Italian	http://en.wikipedia.org/wiki/Tecno	\N	ITA	team_VuEfPgeR
128	politoys	Politoys	British	http://en.wikipedia.org/wiki/Frank_Williams_Racing_Cars	\N	GBR	team_hVJoeQHJ
129	connew	Connew	British	http://en.wikipedia.org/wiki/Connew	\N	GBR	team_cIh1s78Y
130	iso_marlboro	Iso Marlboro	British	http://en.wikipedia.org/wiki/Iso_Marlboro	\N	GBR	team_LjQBOtEX
131	shadow	Shadow	British	http://en.wikipedia.org/wiki/Shadow_Racing_Cars	\N	GBR	team_iB8A1Hcn
132	ensign	Ensign	British	http://en.wikipedia.org/wiki/Ensign_%28racing_team%29	\N	GBR	team_KBIISNZs
133	hesketh	Hesketh	British	http://en.wikipedia.org/wiki/Hesketh_Racing	\N	GBR	team_qzbqeQR4
134	amon	Amon	New Zealander	http://en.wikipedia.org/wiki/Amon_(Formula_One_team)	\N	NZL	team_3Nh9ovhy
135	trojan	Trojan	British	http://en.wikipedia.org/wiki/Trojan_(Racing_team)	\N	GBR	team_Fy0KkRT5
136	token	Token	British	http://en.wikipedia.org/wiki/Token_(Racing_team)	\N	GBR	team_LvGM1Omi
137	maki	Maki	Japanese	http://en.wikipedia.org/wiki/Maki_(cars)	\N	JPN	team_KvLABykQ
138	lyncar	Lyncar	British	http://en.wikipedia.org/wiki/Lyncar	\N	GBR	team_H9QFcL3t
139	penske	Penske	American	http://en.wikipedia.org/wiki/Penske_Racing	\N	USA	team_MB1clSHY
140	parnelli	Parnelli	American	http://en.wikipedia.org/wiki/Parnelli	\N	USA	team_HuAgNKku
141	williams	Williams	British	http://en.wikipedia.org/wiki/Williams_Grand_Prix_Engineering	\N	GBR	team_IJAI583X
142	fittipaldi	Fittipaldi	Brazilian	http://en.wikipedia.org/wiki/Fittipaldi_%28constructor%29	\N	BRA	team_eiKn4bZT
143	shadow-ford	Shadow-Ford	British	http://en.wikipedia.org/wiki/Shadow_Racing_Cars	\N	GBR	team_t8DAon2Z
144	hill	Embassy Hill	British	http://en.wikipedia.org/wiki/Hill_(constructor)	\N	GBR	team_0gf0ynQG
145	shadow-matra	Shadow-Matra	British	http://en.wikipedia.org/wiki/Shadow_Racing_Cars	\N	GBR	team_RFNO3mCL
146	ligier	Ligier	French	http://en.wikipedia.org/wiki/Ligier	\N	FRA	team_H2NSOAwT
147	brabham-alfa_romeo	Brabham-Alfa Romeo	British	http://en.wikipedia.org/wiki/Brabham	\N	GBR	team_xCzwXV1L
148	wolf	Wolf	Canadian	http://en.wikipedia.org/wiki/Walter_Wolf_Racing	\N	CAN	team_Y7GpEwlz
149	boro	Boro	Dutch	http://en.wikipedia.org/wiki/Boro_(Formula_One)	\N	NLD	team_tKfQLLvs
150	kojima	Kojima	Japanese	http://en.wikipedia.org/wiki/Kojima_Engineering	\N	JPN	team_how6sU1r
151	lec	LEC	British	http://en.wikipedia.org/wiki/LEC_(Formula_One)	\N	GBR	team_hOn0b2kR
152	renault	Renault	French	http://en.wikipedia.org/wiki/Renault_in_Formula_One	\N	FRA	team_YPoaJdbN
153	mcguire	McGuire	Australian	http://en.wikipedia.org/wiki/McGuire_(Formula_One)	\N	AUS	team_j7uJKgKm
154	apollon	Apollon	Swiss	http://en.wikipedia.org/wiki/Apollon_(Formula_One)	\N	CHE	team_KjK6HN5c
155	theodore	Theodore	Hong Kong	http://en.wikipedia.org/wiki/Theodore_Racing	\N	HKG	team_rGg8knxJ
156	merzario	Merzario	Italian	http://en.wikipedia.org/wiki/Merzario	\N	ITA	team_nXskrdw7
157	arrows	Arrows	British	http://en.wikipedia.org/wiki/Arrows_Grand_Prix_International	\N	GBR	team_j6bmqSR3
158	martini	Martini	French	http://en.wikipedia.org/wiki/Martini_(cars)	\N	FRA	team_EbIMptH5
159	kauhsen	Kauhsen	German	http://en.wikipedia.org/wiki/Kauhsen	\N	DEU	team_7uCR7oZ4
160	rebaque	Rebaque	Mexican	http://en.wikipedia.org/wiki/Rebaque	\N	MEX	team_JBc95FQC
161	osella	Osella	Italian	http://en.wikipedia.org/wiki/Osella	\N	ITA	team_dxjfIjQo
162	toleman	Toleman	British	http://en.wikipedia.org/wiki/Toleman	\N	GBR	team_jUIw6b0D
163	ram	RAM	British	http://en.wikipedia.org/wiki/RAM_Racing	\N	GBR	team_jz5tMboC
164	spirit	Spirit	British	http://en.wikipedia.org/wiki/Spirit_(racing_team)	\N	GBR	team_5oM7BY0q
165	minardi	Minardi	Italian	http://en.wikipedia.org/wiki/Minardi	\N	ITA	team_bYs4DIHw
166	zakspeed	Zakspeed	German	http://en.wikipedia.org/wiki/Zakspeed	\N	DEU	team_MGPTMdu8
167	benetton	Benetton	Italian	http://en.wikipedia.org/wiki/Benetton_Formula	\N	ITA	team_Jqan5Bdt
168	ags	AGS	French	http://en.wikipedia.org/wiki/Automobiles_Gonfaronnaises_Sportives	\N	FRA	team_7zPl6H8F
169	larrousse	Larrousse	French	http://en.wikipedia.org/wiki/Larrousse	\N	FRA	team_rsLA6rBR
170	coloni	Coloni	Italian	http://en.wikipedia.org/wiki/Enzo_Coloni_Racing_Car_Systems	\N	ITA	team_NfZoU3CH
171	dallara	Dallara	Italian	http://en.wikipedia.org/wiki/Dallara	\N	ITA	team_cSjkY6g4
172	eurobrun	Euro Brun	Italian	http://en.wikipedia.org/wiki/Euro_Brun	\N	ITA	team_zoPvwZo5
173	rial	Rial	German	http://en.wikipedia.org/wiki/Rial_%28racing_team%29	\N	DEU	team_FCAMjvXY
174	onyx	Onyx	British	http://en.wikipedia.org/wiki/Onyx_(racing_team)	\N	GBR	team_20sXPN1N
175	leyton	Leyton House	British	http://en.wikipedia.org/wiki/Leyton_House	\N	GBR	team_hBBh2XDZ
176	life	Life	Italian	http://en.wikipedia.org/wiki/Life_(Racing_Team)	\N	ITA	team_wsiM6KoP
177	jordan	Jordan	Irish	http://en.wikipedia.org/wiki/Jordan_Grand_Prix	\N	IRL	team_MKzb4x5J
178	footwork	Footwork	British	http://en.wikipedia.org/wiki/Footwork_Arrows	\N	GBR	team_F1GF7Fgq
179	fondmetal	Fondmetal	Italian	http://en.wikipedia.org/wiki/Fondmetal	\N	ITA	team_nk5gWadd
180	lambo	Lambo	Italian	http://en.wikipedia.org/wiki/Modena_(racing_team)	\N	ITA	team_YfPyVBNX
181	moda	Andrea Moda	Italian	http://en.wikipedia.org/wiki/Andrea_Moda_Formula	\N	ITA	team_AZUSiaFQ
182	sauber	Sauber	Swiss	http://en.wikipedia.org/wiki/Sauber_Motorsport	\N	CHE	team_z7SnOy4M
183	pacific	Pacific	British	http://en.wikipedia.org/wiki/Pacific_Racing	\N	GBR	team_dZkI9hfo
184	simtek	Simtek	British	http://en.wikipedia.org/wiki/Simtek	\N	GBR	team_jqSZSnWd
185	forti	Forti	Italian	http://en.wikipedia.org/wiki/Forti	\N	ITA	team_p22eUOXp
186	stewart	Stewart	British	http://en.wikipedia.org/wiki/Stewart_Grand_Prix	\N	GBR	team_rlblk7Mg
187	prost	Prost	French	http://en.wikipedia.org/wiki/Prost_Grand_Prix	\N	FRA	team_pxSIfRRl
188	bar	BAR	British	http://en.wikipedia.org/wiki/British_American_Racing	\N	GBR	team_PplMmTBl
189	jaguar	Jaguar	British	http://en.wikipedia.org/wiki/Jaguar_Racing	\N	GBR	team_0zdTqmCa
190	toyota	Toyota	Japanese	http://en.wikipedia.org/wiki/Toyota_Racing	\N	JPN	team_nc8ZzG9D
191	red_bull	Red Bull	Austrian	http://en.wikipedia.org/wiki/Red_Bull_Racing	\N	AUT	team_SYB8m2Vp
192	bmw_sauber	BMW Sauber	German	http://en.wikipedia.org/wiki/BMW_Sauber	\N	DEU	team_h9jIxD44
193	super_aguri	Super Aguri	Japanese	http://en.wikipedia.org/wiki/Super_Aguri_F1	\N	JPN	team_86WATmhR
194	mf1	MF1	Russian	http://en.wikipedia.org/wiki/Midland_F1_Racing	\N	RUS	team_a91TBD4E
195	toro_rosso	Toro Rosso	Italian	http://en.wikipedia.org/wiki/Scuderia_Toro_Rosso	\N	ITA	team_PTRFDxzW
196	spyker_mf1	Spyker MF1	Dutch	http://en.wikipedia.org/wiki/Midland_F1_Racing	\N	NLD	team_YZ8x0P8E
197	spyker	Spyker	Dutch	http://en.wikipedia.org/wiki/Spyker_F1	\N	NLD	team_ERX8GUmh
198	force_india	Force India	Indian	http://en.wikipedia.org/wiki/Racing_Point_Force_India	\N	IND	team_s34AZB1b
199	brawn	Brawn	British	http://en.wikipedia.org/wiki/Brawn_GP	\N	GBR	team_JXBZagl0
200	hrt	HRT	Spanish	http://en.wikipedia.org/wiki/Hispania_Racing	\N	ESP	team_O0pgPYIO
201	virgin	Virgin	British	http://en.wikipedia.org/wiki/Virgin_Racing	\N	GBR	team_JlGj9CF6
202	lotus_racing	Lotus	Malaysian	http://en.wikipedia.org/wiki/Lotus_Racing	\N	MYS	team_s45f6Sqe
203	caterham	Caterham	Malaysian	http://en.wikipedia.org/wiki/Caterham_F1	\N	MYS	team_RLQlJSxC
204	lotus_f1	Lotus F1	British	http://en.wikipedia.org/wiki/Lotus_F1	\N	GBR	team_y4KzoIWY
205	marussia	Marussia	Russian	http://en.wikipedia.org/wiki/Marussia_F1	\N	RUS	team_2SeR1lJI
206	manor	Manor Marussia	British	http://en.wikipedia.org/wiki/Manor_Motorsport	\N	GBR	team_pW6cRF9Z
207	haas	Haas F1 Team	American	http://en.wikipedia.org/wiki/Haas_F1_Team	\N	USA	team_aDYlrycX
208	racing_point	Racing Point	British	http://en.wikipedia.org/wiki/Racing_Point_F1_Team	\N	GBR	team_alc8tSNK
209	alphatauri	AlphaTauri	Italian	http://en.wikipedia.org/wiki/Scuderia_AlphaTauri	\N	ITA	team_GV5YhhEU
210	alpine	Alpine F1 Team	French	http://en.wikipedia.org/wiki/Alpine_F1_Team	\N	FRA	team_LJ6hqyXM
211	rb	RB F1 Team	Italian	http://en.wikipedia.org/wiki/RB_Formula_One_Team	\N	ITA	team_M2xA0S6V
212	eagle	Eagle	American	http://en.wikipedia.org/wiki/Anglo_American_Racers	\N	USA	team_NKq0gCx7
\.


--
-- Data for Name: formula_one_championshipadjustment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_championshipadjustment (id, adjustment, points, driver_id, season_id, team_id, api_id) FROM stdin;
1	101	\N	703	48	\N	championshipadjustment_ytJcOgGB
2	102	\N	\N	58	117	championshipadjustment_yy7ogVVY
3	1	15	\N	71	208	championshipadjustment_zXL6omRH
\.


--
-- Data for Name: formula_one_circuit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_circuit (id, reference, name, locality, country, longitude, latitude, altitude, wikipedia, country_code, api_id) FROM stdin;
1	silverstone	Silverstone Circuit	Silverstone	UK	-1.01694	52.0786	153	https://en.wikipedia.org/wiki/Silverstone_Circuit	GBR	circuit_W8rwFAJs
2	monaco	Circuit de Monaco	Monte-Carlo	Monaco	7.42056	43.7347	7	https://en.wikipedia.org/wiki/Circuit_de_Monaco	MCO	circuit_r30Ojrot
3	indianapolis	Indianapolis Motor Speedway	Indianapolis	USA	-86.2347	39.795	223	https://en.wikipedia.org/wiki/Indianapolis_Motor_Speedway	USA	circuit_fcUWpmRF
4	bremgarten	Circuit Bremgarten	Bern	Switzerland	7.40194	46.9589	551	https://en.wikipedia.org/wiki/Circuit_Bremgarten	CHE	circuit_Ft2AvzTa
5	spa	Circuit de Spa-Francorchamps	Spa	Belgium	5.97139	50.4372	401	https://en.wikipedia.org/wiki/Circuit_de_Spa-Francorchamps	BEL	circuit_agKQuDST
6	reims	Reims-Gueux	Reims	France	3.93083	49.2542	88	https://en.wikipedia.org/wiki/Reims-Gueux	FRA	circuit_mwO804dg
7	monza	Autodromo Nazionale di Monza	Monza	Italy	9.28111	45.6156	162	https://en.wikipedia.org/wiki/Monza_Circuit	ITA	circuit_vmT5q8o7
8	nurburgring	Nürburgring	Nürburg	Germany	6.9475	50.3356	578	https://en.wikipedia.org/wiki/N%C3%BCrburgring	DEU	circuit_gCKQzgQJ
9	pedralbes	Circuit de Pedralbes	Barcelona	Spain	2.11667	41.3903	85	https://en.wikipedia.org/wiki/Pedralbes_Circuit	ESP	circuit_ZvC20Np8
10	essarts	Rouen-Les-Essarts	Rouen	France	1.00458	49.3306	81	https://en.wikipedia.org/wiki/Rouen-Les-Essarts	FRA	circuit_LkixrMv6
11	zandvoort	Circuit Park Zandvoort	Zandvoort	Netherlands	4.54092	52.3888	6	https://en.wikipedia.org/wiki/Circuit_Zandvoort	NLD	circuit_OLNnxVES
12	galvez	Autódromo Juan y Oscar Gálvez	Buenos Aires	Argentina	-58.4593	-34.6943	8	https://en.wikipedia.org/wiki/Autódromo_Oscar_y_Juan_Gálvez	ARG	circuit_WuRnGMfM
13	aintree	Aintree	Liverpool	UK	-2.94056	53.4769	20	https://en.wikipedia.org/wiki/Aintree_Motor_Racing_Circuit	GBR	circuit_GuGere6Y
14	pescara	Pescara Circuit	Pescara	Italy	14.1508	42.475	129	https://en.wikipedia.org/wiki/Pescara_Circuit	ITA	circuit_Tb8r9ElH
15	boavista	Circuito da Boavista	Oporto	Portugal	-8.67325	41.1705	28	https://en.wikipedia.org/wiki/Circuito_da_Boavista	PRT	circuit_0ftDFJMD
16	ain-diab	Ain Diab	Casablanca	Morocco	-7.6875	33.5786	19	https://en.wikipedia.org/wiki/Ain-Diab_Circuit	MAR	circuit_MgQOAxrb
17	avus	AVUS	Berlin	Germany	13.2514	52.4806	53	https://en.wikipedia.org/wiki/AVUS	DEU	circuit_bmot6a1m
18	monsanto	Monsanto Park Circuit	Lisbon	Portugal	-9.20306	38.7197	158	https://en.wikipedia.org/wiki/Circuito_de_Monsanto	PRT	circuit_55QrvCMw
19	sebring	Sebring International Raceway	Florida	USA	-81.3483	27.4547	18	https://en.wikipedia.org/wiki/Sebring_International_Raceway	USA	circuit_oqbH7biT
20	riverside	Riverside International Raceway	California	USA	-117.273	33.937	470	https://en.wikipedia.org/wiki/Riverside_International_Raceway	USA	circuit_dnsn0TcI
21	watkins_glen	Watkins Glen	New York State	USA	-76.9272	42.3369	485	https://en.wikipedia.org/wiki/Watkins_Glen_International	USA	circuit_SyYhpBRW
22	george	Prince George Circuit	Eastern Cape Province	South Africa	27.8736	-33.0486	15	https://en.wikipedia.org/wiki/Prince_George_Circuit	ZAF	circuit_jPsa51gf
23	rodriguez	Autódromo Hermanos Rodríguez	Mexico City	Mexico	-99.0907	19.4042	2227	https://en.wikipedia.org/wiki/Aut%C3%B3dromo_Hermanos_Rodr%C3%ADguez	MEX	circuit_xmtY0hcp
24	brands_hatch	Brands Hatch	Kent	UK	0.263056	51.3569	145	https://en.wikipedia.org/wiki/Brands_Hatch	GBR	circuit_JX9KvRwN
25	zeltweg	Zeltweg	Styria	Austria	14.7478	47.2039	676	https://en.wikipedia.org/wiki/Zeltweg_Air_Base	AUT	circuit_bGhdByWH
26	charade	Charade Circuit	Clermont-Ferrand	France	3.03889	45.7472	790	https://en.wikipedia.org/wiki/Circuit_de_Charade	FRA	circuit_MqeYwvqu
27	kyalami	Kyalami	Midrand	South Africa	28.0767	-25.9894	1460	https://en.wikipedia.org/wiki/Kyalami	ZAF	circuit_TdPZggxm
28	lemans	Le Mans	Le Mans	France	0.224231	47.95	67	https://en.wikipedia.org/wiki/Circuit_de_la_Sarthe#Bugatti_Circuit	FRA	circuit_FJFl2vAY
29	mosport	Mosport International Raceway	Ontario	Canada	-78.6756	44.0481	332	https://en.wikipedia.org/wiki/Canadian_Tire_Motorsport_Park	CAN	circuit_CkTSUzEW
30	jarama	Jarama	Madrid	Spain	-3.58558	40.6171	609	https://en.wikipedia.org/wiki/Circuito_del_Jarama	ESP	circuit_1UGemhTI
31	tremblant	Circuit Mont-Tremblant	Quebec	Canada	-74.6099	46.1877	214	https://en.wikipedia.org/wiki/Circuit_Mont-Tremblant	CAN	circuit_24qAtWgZ
32	montjuic	Montjuïc	Barcelona	Spain	2.15167	41.3664	79	https://en.wikipedia.org/wiki/Montju%C3%AFc_circuit	ESP	circuit_BKQyuvz3
33	hockenheimring	Hockenheimring	Hockenheim	Germany	8.56583	49.3278	103	https://en.wikipedia.org/wiki/Hockenheimring	DEU	circuit_nodsr7Tn
34	red_bull_ring	Red Bull Ring	Spielberg	Austria	14.7647	47.2197	678	https://en.wikipedia.org/wiki/Red_Bull_Ring	AUT	circuit_VrXQoBf5
35	ricard	Circuit Paul Ricard	Le Castellet	France	5.79167	43.2506	432	https://en.wikipedia.org/wiki/Circuit_Paul_Ricard	FRA	circuit_Dflr1Q9l
36	nivelles	Nivelles-Baulers	Brussels	Belgium	4.32694	50.6211	139	https://en.wikipedia.org/wiki/Nivelles-Baulers	BEL	circuit_B46LcKpt
37	interlagos	Autódromo José Carlos Pace	São Paulo	Brazil	-46.6997	-23.7036	785	https://en.wikipedia.org/wiki/Interlagos_Circuit	BRA	circuit_tpDerpEj
38	zolder	Zolder	Heusden-Zolder	Belgium	5.25694	50.9894	36	https://en.wikipedia.org/wiki/Circuit_Zolder	BEL	circuit_8kc4dseV
39	anderstorp	Scandinavian Raceway	Anderstorp	Sweden	13.6042	57.2653	153	https://en.wikipedia.org/wiki/Anderstorp_Raceway	SWE	circuit_4rhaVUdo
40	dijon	Dijon-Prenois	Dijon	France	4.89913	47.3625	484	https://en.wikipedia.org/wiki/Dijon-Prenois	FRA	circuit_9yusJwrO
41	long_beach	Long Beach	California	USA	-118.189	33.7651	12	https://en.wikipedia.org/wiki/Long_Beach,_California	USA	circuit_Vr7BAOms
42	fuji	Fuji Speedway	Oyama	Japan	138.927	35.3717	583	https://en.wikipedia.org/wiki/Fuji_Speedway	JPN	circuit_ZO7DAYW0
43	jacarepagua	Autódromo Internacional Nelson Piquet	Rio de Janeiro	Brazil	-43.395	-22.9756	1126	https://en.wikipedia.org/wiki/Aut%C3%B3dromo_Internacional_Nelson_Piquet	BRA	circuit_DyjUw48o
44	villeneuve	Circuit Gilles Villeneuve	Montreal	Canada	-73.5228	45.5	13	https://en.wikipedia.org/wiki/Circuit_Gilles_Villeneuve	CAN	circuit_xo04lqNS
45	imola	Autodromo Enzo e Dino Ferrari	Imola	Italy	11.7167	44.3439	37	https://en.wikipedia.org/wiki/Imola_Circuit	ITA	circuit_9GnkDt5q
46	las_vegas	Las Vegas Street Circuit	Nevada	USA	-115.174	36.1162	639	https://en.wikipedia.org/wiki/Las_Vegas_Strip_Circuit	USA	circuit_Fw7iHiGQ
47	detroit	Detroit Street Circuit	Detroit	USA	-83.0401	42.3298	177	https://en.wikipedia.org/wiki/Detroit_street_circuit	USA	circuit_wOWbuY56
48	dallas	Fair Park	Dallas	USA	-96.7587	32.7774	139	https://en.wikipedia.org/wiki/Fair_Park	USA	circuit_qMPxaD6E
49	estoril	Autódromo do Estoril	Estoril	Portugal	-9.39417	38.7506	130	https://en.wikipedia.org/wiki/Circuito_do_Estoril	PRT	circuit_oWx6MNZJ
50	adelaide	Adelaide Street Circuit	Adelaide	Australia	138.617	-34.9272	58	https://en.wikipedia.org/wiki/Adelaide_Street_Circuit	AUS	circuit_KQC3rMYo
51	jerez	Circuito de Jerez	Jerez de la Frontera	Spain	-6.03417	36.7083	37	https://en.wikipedia.org/wiki/Circuito_de_Jerez	ESP	circuit_P5XGjz0y
52	hungaroring	Hungaroring	Budapest	Hungary	19.2486	47.5789	264	https://en.wikipedia.org/wiki/Hungaroring	HUN	circuit_pd4fBIQZ
53	suzuka	Suzuka Circuit	Suzuka	Japan	136.541	34.8431	45	https://en.wikipedia.org/wiki/Suzuka_International_Racing_Course	JPN	circuit_0Bbz8sT8
54	phoenix	Phoenix street circuit	Phoenix	USA	-112.075	33.4479	345	https://en.wikipedia.org/wiki/Phoenix_street_circuit	USA	circuit_mhCuvkoQ
55	magny_cours	Circuit de Nevers Magny-Cours	Magny Cours	France	3.16361	46.8642	228	https://en.wikipedia.org/wiki/Circuit_de_Nevers_Magny-Cours	FRA	circuit_rO014AKV
56	catalunya	Circuit de Barcelona-Catalunya	Montmeló	Spain	2.26111	41.57	109	https://en.wikipedia.org/wiki/Circuit_de_Barcelona-Catalunya	ESP	circuit_Yxr9ajWK
57	donington	Donington Park	Castle Donington	UK	-1.37528	52.8306	88	https://en.wikipedia.org/wiki/Donington_Park	GBR	circuit_ej92Jo6k
58	okayama	Okayama International Circuit	Okayama	Japan	134.221	34.915	266	https://en.wikipedia.org/wiki/Okayama_International_Circuit	JPN	circuit_76Uis5UU
59	albert_park	Albert Park Grand Prix Circuit	Melbourne	Australia	144.968	-37.8497	10	https://en.wikipedia.org/wiki/Albert_Park_Circuit	AUS	circuit_5jHWvmoM
60	sepang	Sepang International Circuit	Kuala Lumpur	Malaysia	101.738	2.76083	18	https://en.wikipedia.org/wiki/Sepang_International_Circuit	MYS	circuit_tqQTg7rI
61	bahrain	Bahrain International Circuit	Sakhir	Bahrain	50.5106	26.0325	7	https://en.wikipedia.org/wiki/Bahrain_International_Circuit	BHR	circuit_vgMkq5S2
62	shanghai	Shanghai International Circuit	Shanghai	China	121.22	31.3389	5	https://en.wikipedia.org/wiki/Shanghai_International_Circuit	CHN	circuit_UZRLsrE2
63	istanbul	Istanbul Park	Istanbul	Turkey	29.405	40.9517	130	https://en.wikipedia.org/wiki/Istanbul_Park	TUR	circuit_wXzpDITo
64	valencia	Valencia Street Circuit	Valencia	Spain	-0.331667	39.4589	4	https://en.wikipedia.org/wiki/Valencia_Street_Circuit	ESP	circuit_UmwRSrTe
65	marina_bay	Marina Bay Street Circuit	Marina Bay	Singapore	103.864	1.2914	18	https://en.wikipedia.org/wiki/Marina_Bay_Street_Circuit	SGP	circuit_DAiie4ft
66	yas_marina	Yas Marina Circuit	Abu Dhabi	UAE	54.6031	24.4672	3	https://en.wikipedia.org/wiki/Yas_Marina_Circuit	ARE	circuit_6MnmIQpm
67	yeongam	Korean International Circuit	Yeongam County	Korea	126.417	34.7333	0	https://en.wikipedia.org/wiki/Korea_International_Circuit	KOR	circuit_cYm9Rest
68	buddh	Buddh International Circuit	Uttar Pradesh	India	77.5331	28.3487	194	https://en.wikipedia.org/wiki/Buddh_International_Circuit	IND	circuit_mohVtWhM
69	americas	Circuit of the Americas	Austin	USA	-97.6411	30.1328	161	https://en.wikipedia.org/wiki/Circuit_of_the_Americas	USA	circuit_C8L45nCq
70	sochi	Sochi Autodrom	Sochi	Russia	39.9578	43.4057	2	https://en.wikipedia.org/wiki/Sochi_Autodrom	RUS	circuit_ekInJG5X
71	baku	Baku City Circuit	Baku	Azerbaijan	49.8533	40.3725	-7	https://en.wikipedia.org/wiki/Baku_City_Circuit	AZE	circuit_l6rYoxTr
72	mugello	Autodromo Internazionale del Mugello	Mugello	Italy	11.3719	43.9975	255	https://en.wikipedia.org/wiki/Mugello_Circuit	ITA	circuit_768Ch5u7
73	portimao	Autódromo Internacional do Algarve	Portimão	Portugal	-8.6267	37.227	108	https://en.wikipedia.org/wiki/Algarve_International_Circuit	PRT	circuit_J9ijT6JU
74	losail	Losail International Circuit	Al Daayen	Qatar	51.4542	25.49	12	https://en.wikipedia.org/wiki/Lusail_International_Circuit	QAT	circuit_2ZoWBxNn
75	jeddah	Jeddah Corniche Circuit	Jeddah	Saudi Arabia	39.1044	21.6319	15	https://en.wikipedia.org/wiki/Jeddah_Corniche_Circuit	SAU	circuit_gtqp9VKv
76	miami	Miami International Autodrome	Miami	USA	-80.2389	25.9581	0	https://en.wikipedia.org/wiki/Miami_International_Autodrome	USA	circuit_nukLDdFs
77	vegas	Las Vegas Strip Street Circuit	Las Vegas	USA	-115.173	36.1147	642	https://en.wikipedia.org/wiki/Las_Vegas_Grand_Prix#Circuit	USA	circuit_MGz9yps6
\.


--
-- Data for Name: formula_one_penalty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_penalty (id, license_points, "position", "time", is_time_served_in_pit, earned_id, served_id, api_id) FROM stdin;
\.


--
-- Data for Name: formula_one_pointsystem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_pointsystem (id, reference, name, driver_position_points, driver_fastest_lap, team_position_points, team_fastest_lap, partial, shared_drive, is_double_points, api_id) FROM stdin;
1	No Points	Session with no Points Awarded	0	0	0	0	0	0	f	pointsystem_te7U11qP
2	r1950	1950-1953 Race Points	1	1	0	0	0	1	f	pointsystem_aedyNBvz
3	r1954	1954 Race Points	1	2	0	0	0	1	f	pointsystem_36p48Ou0
4	r1955	1955 Race Points	1	2	0	0	0	2	f	pointsystem_mfIxkoWG
5	r1956	1956 - 1957 Race Points	1	2	0	0	0	3	f	pointsystem_kmXb6q5E
6	r1958	1958 - 1959 Race Points	1	2	1	0	0	0	f	pointsystem_5iFOZCWr
7	r1958indi	1958 - 1959 Indianapolis Points	1	2	0	0	0	0	f	pointsystem_2SlAej3y
8	r1960	1960 Race Points	2	0	2	0	0	0	f	pointsystem_jSaHvbeG
9	r1960indi	1960 Indianapolis Points	2	0	0	0	0	0	f	pointsystem_x7XUB9OD
10	r1961	1961 Race Points	3	0	2	0	0	0	f	pointsystem_e6DycBsb
11	r1962	1962 - 1974 Race Points	3	0	3	0	0	0	f	pointsystem_j4226TWA
12	r1975	1975 - 1979 Race Points	3	0	3	0	1	0	f	pointsystem_1TN2OaDq
13	r1980	1980 - 1990 Race Points	3	0	3	0	2	0	f	pointsystem_r5QCWWNC
14	r1991	1991 - 2002 Race Points	5	0	5	0	2	0	f	pointsystem_9HC5FESG
15	r2003	2003 - 2009 Race Points	6	0	6	0	2	0	f	pointsystem_y8fq9GIS
16	r2010	2010 - 2018 Race Points	7	0	7	0	2	0	f	pointsystem_yd7mAbjd
17	r2014double	2014 Double Race Points	7	0	7	0	2	0	t	pointsystem_VVHVtBw9
18	r2019	2019 - 2021 Race Points	7	3	7	3	2	0	f	pointsystem_0ngMTsEV
19	sprint2021	2021 Sprint Points	21	0	21	0	2	0	f	pointsystem_CtXuX5Vn
20	r2022	2022 Race Points	7	4	7	4	3	0	f	pointsystem_RD5yEGVQ
21	sprint2022	2022 Sprint Points	22	0	22	0	3	0	f	pointsystem_cv5CDr0M
22	r2023	2023 - 2024 Race Points	7	4	7	4	4	0	f	pointsystem_IN5G1nKl
23	sprint2023	2023 - Present Sprint Points	22	0	22	0	4	0	f	pointsystem_HTXOoFPO
24	r2025	2025 - Present Race Points	7	0	7	0	4	0	f	pointsystem_yyy2n35V
\.


--
-- Data for Name: formula_one_round; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_round (id, number, name, date, race_number, wikipedia, is_cancelled, circuit_id, season_id, api_id) FROM stdin;
1	1	British Grand Prix	1950-05-13	1	https://en.wikipedia.org/wiki/1950_British_Grand_Prix	f	1	1	round_Pt9PwCgv
2	2	Monaco Grand Prix	1950-05-21	2	https://en.wikipedia.org/wiki/1950_Monaco_Grand_Prix	f	2	1	round_cAbLcO1L
3	3	Indianapolis 500	1950-05-30	3	https://en.wikipedia.org/wiki/1950_Indianapolis_500	f	3	1	round_RhrrZnkp
4	4	Swiss Grand Prix	1950-06-04	4	https://en.wikipedia.org/wiki/1950_Swiss_Grand_Prix	f	4	1	round_bcZ0QJDy
5	5	Belgian Grand Prix	1950-06-18	5	https://en.wikipedia.org/wiki/1950_Belgian_Grand_Prix	f	5	1	round_0hDWfNbp
6	6	French Grand Prix	1950-07-02	6	https://en.wikipedia.org/wiki/1950_French_Grand_Prix	f	6	1	round_E9j0OlQF
7	7	Italian Grand Prix	1950-09-03	7	https://en.wikipedia.org/wiki/1950_Italian_Grand_Prix	f	7	1	round_ASDsCyCn
8	1	Swiss Grand Prix	1951-05-27	8	https://en.wikipedia.org/wiki/1951_Swiss_Grand_Prix	f	4	2	round_0tJV4QpB
9	2	Indianapolis 500	1951-05-30	9	https://en.wikipedia.org/wiki/1951_Indianapolis_500	f	3	2	round_cvVY7bti
10	3	Belgian Grand Prix	1951-06-17	10	https://en.wikipedia.org/wiki/1951_Belgian_Grand_Prix	f	5	2	round_h5UEFsPX
11	4	French Grand Prix	1951-07-01	11	https://en.wikipedia.org/wiki/1951_French_Grand_Prix	f	6	2	round_1Uwo5oHj
12	5	British Grand Prix	1951-07-14	12	https://en.wikipedia.org/wiki/1951_British_Grand_Prix	f	1	2	round_maKXuPEJ
13	6	German Grand Prix	1951-07-29	13	https://en.wikipedia.org/wiki/1951_German_Grand_Prix	f	8	2	round_8LFRJRjj
14	7	Italian Grand Prix	1951-09-16	14	https://en.wikipedia.org/wiki/1951_Italian_Grand_Prix	f	7	2	round_I6ufd8hP
15	8	Spanish Grand Prix	1951-10-28	15	https://en.wikipedia.org/wiki/1951_Spanish_Grand_Prix	f	9	2	round_optSnG5z
16	1	Swiss Grand Prix	1952-05-18	16	https://en.wikipedia.org/wiki/1952_Swiss_Grand_Prix	f	4	3	round_sx9NfVk7
17	2	Indianapolis 500	1952-05-30	17	https://en.wikipedia.org/wiki/1952_Indianapolis_500	f	3	3	round_AQbbOIsp
18	3	Belgian Grand Prix	1952-06-22	18	https://en.wikipedia.org/wiki/1952_Belgian_Grand_Prix	f	5	3	round_2S7nIvK4
19	4	French Grand Prix	1952-07-06	19	https://en.wikipedia.org/wiki/1952_French_Grand_Prix	f	10	3	round_JyH4oW9x
20	5	British Grand Prix	1952-07-19	20	https://en.wikipedia.org/wiki/1952_British_Grand_Prix	f	1	3	round_v830We8o
21	6	German Grand Prix	1952-08-03	21	https://en.wikipedia.org/wiki/1952_German_Grand_Prix	f	8	3	round_s4ptuWXi
22	7	Dutch Grand Prix	1952-08-17	22	https://en.wikipedia.org/wiki/1952_Dutch_Grand_Prix	f	11	3	round_zVcuHcv0
23	8	Italian Grand Prix	1952-09-07	23	https://en.wikipedia.org/wiki/1952_Italian_Grand_Prix	f	7	3	round_wccJIRoj
24	1	Argentine Grand Prix	1953-01-18	24	https://en.wikipedia.org/wiki/1953_Argentine_Grand_Prix	f	12	4	round_uIW6a9Yw
25	2	Indianapolis 500	1953-05-30	25	https://en.wikipedia.org/wiki/1953_Indianapolis_500	f	3	4	round_yf5ljqpL
26	3	Dutch Grand Prix	1953-06-07	26	https://en.wikipedia.org/wiki/1953_Dutch_Grand_Prix	f	11	4	round_HJOkU2LF
27	4	Belgian Grand Prix	1953-06-21	27	https://en.wikipedia.org/wiki/1953_Belgian_Grand_Prix	f	5	4	round_MWlh2WTx
28	5	French Grand Prix	1953-07-05	28	https://en.wikipedia.org/wiki/1953_French_Grand_Prix	f	6	4	round_6PZcm6fF
29	6	British Grand Prix	1953-07-18	29	https://en.wikipedia.org/wiki/1953_British_Grand_Prix	f	1	4	round_R3xI7bP6
30	7	German Grand Prix	1953-08-02	30	https://en.wikipedia.org/wiki/1953_German_Grand_Prix	f	8	4	round_TsAqs9rF
31	8	Swiss Grand Prix	1953-08-23	31	https://en.wikipedia.org/wiki/1953_Swiss_Grand_Prix	f	4	4	round_MGy7EdPP
32	9	Italian Grand Prix	1953-09-13	32	https://en.wikipedia.org/wiki/1953_Italian_Grand_Prix	f	7	4	round_9Ig1NQbQ
33	1	Argentine Grand Prix	1954-01-17	33	https://en.wikipedia.org/wiki/1954_Argentine_Grand_Prix	f	12	5	round_KgFwuhMZ
34	2	Indianapolis 500	1954-05-31	34	https://en.wikipedia.org/wiki/1954_Indianapolis_500	f	3	5	round_CjoWkNZZ
35	3	Belgian Grand Prix	1954-06-20	35	https://en.wikipedia.org/wiki/1954_Belgian_Grand_Prix	f	5	5	round_zWHTpXp2
36	4	French Grand Prix	1954-07-04	36	https://en.wikipedia.org/wiki/1954_French_Grand_Prix	f	6	5	round_YKkxB1lr
37	5	British Grand Prix	1954-07-17	37	https://en.wikipedia.org/wiki/1954_British_Grand_Prix	f	1	5	round_afjYNCPO
38	6	German Grand Prix	1954-08-01	38	https://en.wikipedia.org/wiki/1954_German_Grand_Prix	f	8	5	round_BMnwuPgn
39	7	Swiss Grand Prix	1954-08-22	39	https://en.wikipedia.org/wiki/1954_Swiss_Grand_Prix	f	4	5	round_bxH8xiWA
40	8	Italian Grand Prix	1954-09-05	40	https://en.wikipedia.org/wiki/1954_Italian_Grand_Prix	f	7	5	round_VH4yJHYV
41	9	Spanish Grand Prix	1954-10-24	41	https://en.wikipedia.org/wiki/1954_Spanish_Grand_Prix	f	9	5	round_WpASk3s7
42	1	Argentine Grand Prix	1955-01-16	42	https://en.wikipedia.org/wiki/1955_Argentine_Grand_Prix	f	12	6	round_Ku5EOwPx
43	2	Monaco Grand Prix	1955-05-22	43	https://en.wikipedia.org/wiki/1955_Monaco_Grand_Prix	f	2	6	round_MXDGGWZW
44	3	Indianapolis 500	1955-05-30	44	https://en.wikipedia.org/wiki/1955_Indianapolis_500	f	3	6	round_oTQqhycb
45	4	Belgian Grand Prix	1955-06-05	45	https://en.wikipedia.org/wiki/1955_Belgian_Grand_Prix	f	5	6	round_ocVgp1vr
46	5	Dutch Grand Prix	1955-06-19	46	https://en.wikipedia.org/wiki/1955_Dutch_Grand_Prix	f	11	6	round_qRXdAV4Q
47	6	British Grand Prix	1955-07-16	47	https://en.wikipedia.org/wiki/1955_British_Grand_Prix	f	13	6	round_48olFOIp
48	7	Italian Grand Prix	1955-09-11	48	https://en.wikipedia.org/wiki/1955_Italian_Grand_Prix	f	7	6	round_Gx1qQNWu
49	1	Argentine Grand Prix	1956-01-22	49	https://en.wikipedia.org/wiki/1956_Argentine_Grand_Prix	f	12	7	round_vrvGvA70
50	2	Monaco Grand Prix	1956-05-13	50	https://en.wikipedia.org/wiki/1956_Monaco_Grand_Prix	f	2	7	round_QJvSCpUS
51	3	Indianapolis 500	1956-05-30	51	https://en.wikipedia.org/wiki/1956_Indianapolis_500	f	3	7	round_5PZ30rUZ
52	4	Belgian Grand Prix	1956-06-03	52	https://en.wikipedia.org/wiki/1956_Belgian_Grand_Prix	f	5	7	round_V8sFNY7f
53	5	French Grand Prix	1956-07-01	53	https://en.wikipedia.org/wiki/1956_French_Grand_Prix	f	6	7	round_AGYG3WAH
54	6	British Grand Prix	1956-07-14	54	https://en.wikipedia.org/wiki/1956_British_Grand_Prix	f	1	7	round_ngd1nC5T
55	7	German Grand Prix	1956-08-05	55	https://en.wikipedia.org/wiki/1956_German_Grand_Prix	f	8	7	round_tr5kd5lg
56	8	Italian Grand Prix	1956-09-02	56	https://en.wikipedia.org/wiki/1956_Italian_Grand_Prix	f	7	7	round_cmyiCzfY
57	1	Argentine Grand Prix	1957-01-13	57	https://en.wikipedia.org/wiki/1957_Argentine_Grand_Prix	f	12	8	round_nUV9n23Q
58	2	Monaco Grand Prix	1957-05-19	58	https://en.wikipedia.org/wiki/1957_Monaco_Grand_Prix	f	2	8	round_69nJiv4A
59	3	Indianapolis 500	1957-05-30	59	https://en.wikipedia.org/wiki/1957_Indianapolis_500	f	3	8	round_wmVP2icd
60	4	French Grand Prix	1957-07-07	60	https://en.wikipedia.org/wiki/1957_French_Grand_Prix	f	10	8	round_PbS5pVED
61	5	British Grand Prix	1957-07-20	61	https://en.wikipedia.org/wiki/1957_British_Grand_Prix	f	13	8	round_Hnp1J3dR
62	6	German Grand Prix	1957-08-04	62	https://en.wikipedia.org/wiki/1957_German_Grand_Prix	f	8	8	round_rdilZnjq
63	7	Pescara Grand Prix	1957-08-18	63	https://en.wikipedia.org/wiki/1957_Pescara_Grand_Prix	f	14	8	round_6MyddV6L
64	8	Italian Grand Prix	1957-09-08	64	https://en.wikipedia.org/wiki/1957_Italian_Grand_Prix	f	7	8	round_PLknU8tg
65	1	Argentine Grand Prix	1958-01-19	65	https://en.wikipedia.org/wiki/1958_Argentine_Grand_Prix	f	12	9	round_esSKhi1a
66	2	Monaco Grand Prix	1958-05-18	66	https://en.wikipedia.org/wiki/1958_Monaco_Grand_Prix	f	2	9	round_WI991yO6
67	3	Dutch Grand Prix	1958-05-26	67	https://en.wikipedia.org/wiki/1958_Dutch_Grand_Prix	f	11	9	round_EtdSJQHl
68	4	Indianapolis 500	1958-05-30	68	https://en.wikipedia.org/wiki/1958_Indianapolis_500	f	3	9	round_cdn0CVin
69	5	Belgian Grand Prix	1958-06-15	69	https://en.wikipedia.org/wiki/1958_Belgian_Grand_Prix	f	5	9	round_8tS6vWNI
70	6	French Grand Prix	1958-07-06	70	https://en.wikipedia.org/wiki/1958_French_Grand_Prix	f	6	9	round_DrfXE7m0
71	7	British Grand Prix	1958-07-19	71	https://en.wikipedia.org/wiki/1958_British_Grand_Prix	f	1	9	round_8U9sUm4Q
72	8	German Grand Prix	1958-08-03	72	https://en.wikipedia.org/wiki/1958_German_Grand_Prix	f	8	9	round_NkT5CP09
73	9	Portuguese Grand Prix	1958-08-24	73	https://en.wikipedia.org/wiki/1958_Portuguese_Grand_Prix	f	15	9	round_EkBl1eT8
74	10	Italian Grand Prix	1958-09-07	74	https://en.wikipedia.org/wiki/1958_Italian_Grand_Prix	f	7	9	round_0HJz7Ev0
75	11	Moroccan Grand Prix	1958-10-19	75	https://en.wikipedia.org/wiki/1958_Moroccan_Grand_Prix	f	16	9	round_xLXJrP3T
76	1	Monaco Grand Prix	1959-05-10	76	https://en.wikipedia.org/wiki/1959_Monaco_Grand_Prix	f	2	10	round_6aMtrV7t
77	2	Indianapolis 500	1959-05-30	77	https://en.wikipedia.org/wiki/1959_Indianapolis_500	f	3	10	round_P2iU2hXL
78	3	Dutch Grand Prix	1959-05-31	78	https://en.wikipedia.org/wiki/1959_Dutch_Grand_Prix	f	11	10	round_BvGBE2vs
79	4	French Grand Prix	1959-07-05	79	https://en.wikipedia.org/wiki/1959_French_Grand_Prix	f	6	10	round_mBmywyWL
80	5	British Grand Prix	1959-07-18	80	https://en.wikipedia.org/wiki/1959_British_Grand_Prix	f	13	10	round_9rMPX1WB
81	6	German Grand Prix	1959-08-02	81	https://en.wikipedia.org/wiki/1959_German_Grand_Prix	f	17	10	round_U7krivRQ
82	7	Portuguese Grand Prix	1959-08-23	82	https://en.wikipedia.org/wiki/1959_Portuguese_Grand_Prix	f	18	10	round_mBym8gAw
83	8	Italian Grand Prix	1959-09-13	83	https://en.wikipedia.org/wiki/1959_Italian_Grand_Prix	f	7	10	round_bzS5wK93
84	9	United States Grand Prix	1959-12-12	84	https://en.wikipedia.org/wiki/1959_United_States_Grand_Prix	f	19	10	round_zq9k6Q0z
85	1	Argentine Grand Prix	1960-02-07	85	https://en.wikipedia.org/wiki/1960_Argentine_Grand_Prix	f	12	11	round_QwOu43Hi
86	2	Monaco Grand Prix	1960-05-29	86	https://en.wikipedia.org/wiki/1960_Monaco_Grand_Prix	f	2	11	round_jYvcXFgg
87	3	Indianapolis 500	1960-05-30	87	https://en.wikipedia.org/wiki/1960_Indianapolis_500	f	3	11	round_he7sJ1qZ
88	4	Dutch Grand Prix	1960-06-06	88	https://en.wikipedia.org/wiki/1960_Dutch_Grand_Prix	f	11	11	round_ixxYlEhi
89	5	Belgian Grand Prix	1960-06-19	89	https://en.wikipedia.org/wiki/1960_Belgian_Grand_Prix	f	5	11	round_waqWBkwL
90	6	French Grand Prix	1960-07-03	90	https://en.wikipedia.org/wiki/1960_French_Grand_Prix	f	6	11	round_dWIVaJTu
91	7	British Grand Prix	1960-07-16	91	https://en.wikipedia.org/wiki/1960_British_Grand_Prix	f	1	11	round_yKO33bww
92	8	Portuguese Grand Prix	1960-08-14	92	https://en.wikipedia.org/wiki/1960_Portuguese_Grand_Prix	f	15	11	round_MjNc67p7
93	9	Italian Grand Prix	1960-09-04	93	https://en.wikipedia.org/wiki/1960_Italian_Grand_Prix	f	7	11	round_QRrmmTcf
94	10	United States Grand Prix	1960-11-20	94	https://en.wikipedia.org/wiki/1960_United_States_Grand_Prix	f	20	11	round_ZiNU4Aeh
95	1	Monaco Grand Prix	1961-05-14	95	https://en.wikipedia.org/wiki/1961_Monaco_Grand_Prix	f	2	12	round_Pjxr4rFm
96	2	Dutch Grand Prix	1961-05-22	96	https://en.wikipedia.org/wiki/1961_Dutch_Grand_Prix	f	11	12	round_9ix03t7U
97	3	Belgian Grand Prix	1961-06-18	97	https://en.wikipedia.org/wiki/1961_Belgian_Grand_Prix	f	5	12	round_vcJqhzgT
98	4	French Grand Prix	1961-07-02	98	https://en.wikipedia.org/wiki/1961_French_Grand_Prix	f	6	12	round_a7PEx36e
99	5	British Grand Prix	1961-07-15	99	https://en.wikipedia.org/wiki/1961_British_Grand_Prix	f	13	12	round_zfxD6uQV
100	6	German Grand Prix	1961-08-06	100	https://en.wikipedia.org/wiki/1961_German_Grand_Prix	f	8	12	round_xImgDFBv
101	7	Italian Grand Prix	1961-09-10	101	https://en.wikipedia.org/wiki/1961_Italian_Grand_Prix	f	7	12	round_QwUBuSal
102	8	United States Grand Prix	1961-10-08	102	https://en.wikipedia.org/wiki/1961_United_States_Grand_Prix	f	21	12	round_6MtjvTSW
103	1	Dutch Grand Prix	1962-05-20	103	https://en.wikipedia.org/wiki/1962_Dutch_Grand_Prix	f	11	13	round_CCdQjS7t
104	2	Monaco Grand Prix	1962-06-03	104	https://en.wikipedia.org/wiki/1962_Monaco_Grand_Prix	f	2	13	round_QYrnFwgz
105	3	Belgian Grand Prix	1962-06-17	105	https://en.wikipedia.org/wiki/1962_Belgian_Grand_Prix	f	5	13	round_zN4YIBCX
106	4	French Grand Prix	1962-07-08	106	https://en.wikipedia.org/wiki/1962_French_Grand_Prix	f	10	13	round_7G0jOXFW
107	5	British Grand Prix	1962-07-21	107	https://en.wikipedia.org/wiki/1962_British_Grand_Prix	f	13	13	round_qbD5KvaO
108	6	German Grand Prix	1962-08-05	108	https://en.wikipedia.org/wiki/1962_German_Grand_Prix	f	8	13	round_3NOqfODA
109	7	Italian Grand Prix	1962-09-16	109	https://en.wikipedia.org/wiki/1962_Italian_Grand_Prix	f	7	13	round_Rvps8slZ
110	8	United States Grand Prix	1962-10-07	110	https://en.wikipedia.org/wiki/1962_United_States_Grand_Prix	f	21	13	round_RsLJ6hqw
111	9	South African Grand Prix	1962-12-29	111	https://en.wikipedia.org/wiki/1962_South_African_Grand_Prix	f	22	13	round_a0oazdet
112	1	Monaco Grand Prix	1963-05-26	112	https://en.wikipedia.org/wiki/1963_Monaco_Grand_Prix	f	2	14	round_0otL9MlW
113	2	Belgian Grand Prix	1963-06-09	113	https://en.wikipedia.org/wiki/1963_Belgian_Grand_Prix	f	5	14	round_Lx3K4I48
114	3	Dutch Grand Prix	1963-06-23	114	https://en.wikipedia.org/wiki/1963_Dutch_Grand_Prix	f	11	14	round_A3Eawag6
115	4	French Grand Prix	1963-06-30	115	https://en.wikipedia.org/wiki/1963_French_Grand_Prix	f	6	14	round_CFZjlBio
116	5	British Grand Prix	1963-07-20	116	https://en.wikipedia.org/wiki/1963_British_Grand_Prix	f	1	14	round_MAKRsbIS
117	6	German Grand Prix	1963-08-04	117	https://en.wikipedia.org/wiki/1963_German_Grand_Prix	f	8	14	round_jLE915yE
118	7	Italian Grand Prix	1963-09-08	118	https://en.wikipedia.org/wiki/1963_Italian_Grand_Prix	f	7	14	round_FBrHoEZe
119	8	United States Grand Prix	1963-10-06	119	https://en.wikipedia.org/wiki/1963_United_States_Grand_Prix	f	21	14	round_np7iCPMt
120	9	Mexican Grand Prix	1963-10-27	120	https://en.wikipedia.org/wiki/1963_Mexican_Grand_Prix	f	23	14	round_yh07B6Io
121	10	South African Grand Prix	1963-12-28	121	https://en.wikipedia.org/wiki/1963_South_African_Grand_Prix	f	22	14	round_CtTrh4oV
122	1	Monaco Grand Prix	1964-05-10	122	https://en.wikipedia.org/wiki/1964_Monaco_Grand_Prix	f	2	15	round_sUqV3ecG
123	2	Dutch Grand Prix	1964-05-24	123	https://en.wikipedia.org/wiki/1964_Dutch_Grand_Prix	f	11	15	round_sPDsllNj
124	3	Belgian Grand Prix	1964-06-14	124	https://en.wikipedia.org/wiki/1964_Belgian_Grand_Prix	f	5	15	round_qfNUWERw
125	4	French Grand Prix	1964-06-28	125	https://en.wikipedia.org/wiki/1964_French_Grand_Prix	f	10	15	round_iZe94GKU
126	5	British Grand Prix	1964-07-11	126	https://en.wikipedia.org/wiki/1964_British_Grand_Prix	f	24	15	round_xdIc8I6z
127	6	German Grand Prix	1964-08-02	127	https://en.wikipedia.org/wiki/1964_German_Grand_Prix	f	8	15	round_biq5he1j
128	7	Austrian Grand Prix	1964-08-23	128	https://en.wikipedia.org/wiki/1964_Austrian_Grand_Prix	f	25	15	round_lg4ABU49
129	8	Italian Grand Prix	1964-09-06	129	https://en.wikipedia.org/wiki/1964_Italian_Grand_Prix	f	7	15	round_2aR0FVE3
130	9	United States Grand Prix	1964-10-04	130	https://en.wikipedia.org/wiki/1964_United_States_Grand_Prix	f	21	15	round_Z7Ovcvpl
131	10	Mexican Grand Prix	1964-10-25	131	https://en.wikipedia.org/wiki/1964_Mexican_Grand_Prix	f	23	15	round_V1nHMy5M
132	1	South African Grand Prix	1965-01-01	132	https://en.wikipedia.org/wiki/1965_South_African_Grand_Prix	f	22	16	round_AGZJU5bx
133	2	Monaco Grand Prix	1965-05-30	133	https://en.wikipedia.org/wiki/1965_Monaco_Grand_Prix	f	2	16	round_pPWcnao9
134	3	Belgian Grand Prix	1965-06-13	134	https://en.wikipedia.org/wiki/1965_Belgian_Grand_Prix	f	5	16	round_X2HQC8OP
135	4	French Grand Prix	1965-06-27	135	https://en.wikipedia.org/wiki/1965_French_Grand_Prix	f	26	16	round_mLVEFGyR
136	5	British Grand Prix	1965-07-10	136	https://en.wikipedia.org/wiki/1965_British_Grand_Prix	f	1	16	round_98JIeW8y
137	6	Dutch Grand Prix	1965-07-18	137	https://en.wikipedia.org/wiki/1965_Dutch_Grand_Prix	f	11	16	round_SheaRUaJ
138	7	German Grand Prix	1965-08-01	138	https://en.wikipedia.org/wiki/1965_German_Grand_Prix	f	8	16	round_GXpGeww7
139	8	Italian Grand Prix	1965-09-12	139	https://en.wikipedia.org/wiki/1965_Italian_Grand_Prix	f	7	16	round_drwSLVgb
140	9	United States Grand Prix	1965-10-03	140	https://en.wikipedia.org/wiki/1965_United_States_Grand_Prix	f	21	16	round_EkpHRZJm
141	10	Mexican Grand Prix	1965-10-24	141	https://en.wikipedia.org/wiki/1965_Mexican_Grand_Prix	f	23	16	round_6zCAPc9Y
142	1	Monaco Grand Prix	1966-05-22	142	https://en.wikipedia.org/wiki/1966_Monaco_Grand_Prix	f	2	17	round_dHjd8ouR
143	2	Belgian Grand Prix	1966-06-12	143	https://en.wikipedia.org/wiki/1966_Belgian_Grand_Prix	f	5	17	round_vEMbbTBZ
144	3	French Grand Prix	1966-07-03	144	https://en.wikipedia.org/wiki/1966_French_Grand_Prix	f	6	17	round_P3qibEc1
145	4	British Grand Prix	1966-07-16	145	https://en.wikipedia.org/wiki/1966_British_Grand_Prix	f	24	17	round_4Z3ouhF9
146	5	Dutch Grand Prix	1966-07-24	146	https://en.wikipedia.org/wiki/1966_Dutch_Grand_Prix	f	11	17	round_Wlg2ACv4
147	6	German Grand Prix	1966-08-07	147	https://en.wikipedia.org/wiki/1966_German_Grand_Prix	f	8	17	round_4qECoeip
148	7	Italian Grand Prix	1966-09-04	148	https://en.wikipedia.org/wiki/1966_Italian_Grand_Prix	f	7	17	round_RFJ1HuUP
149	8	United States Grand Prix	1966-10-02	149	https://en.wikipedia.org/wiki/1966_United_States_Grand_Prix	f	21	17	round_hMsGZPXn
150	9	Mexican Grand Prix	1966-10-23	150	https://en.wikipedia.org/wiki/1966_Mexican_Grand_Prix	f	23	17	round_bkFrJdrr
151	1	South African Grand Prix	1967-01-02	151	https://en.wikipedia.org/wiki/1967_South_African_Grand_Prix	f	27	18	round_bQx3hTV9
152	2	Monaco Grand Prix	1967-05-07	152	https://en.wikipedia.org/wiki/1967_Monaco_Grand_Prix	f	2	18	round_KLM7Tc2t
153	3	Dutch Grand Prix	1967-06-04	153	https://en.wikipedia.org/wiki/1967_Dutch_Grand_Prix	f	11	18	round_kAQU03lT
154	4	Belgian Grand Prix	1967-06-18	154	https://en.wikipedia.org/wiki/1967_Belgian_Grand_Prix	f	5	18	round_YXaWfZ7Q
155	5	French Grand Prix	1967-07-02	155	https://en.wikipedia.org/wiki/1967_French_Grand_Prix	f	28	18	round_Be1skrOQ
156	6	British Grand Prix	1967-07-15	156	https://en.wikipedia.org/wiki/1967_British_Grand_Prix	f	1	18	round_xowbmbzs
157	7	German Grand Prix	1967-08-06	157	https://en.wikipedia.org/wiki/1967_German_Grand_Prix	f	8	18	round_Ah5cEgB2
158	8	Canadian Grand Prix	1967-08-27	158	https://en.wikipedia.org/wiki/1967_Canadian_Grand_Prix	f	29	18	round_iju15vcr
159	9	Italian Grand Prix	1967-09-10	159	https://en.wikipedia.org/wiki/1967_Italian_Grand_Prix	f	7	18	round_yC8UApVU
160	10	United States Grand Prix	1967-10-01	160	https://en.wikipedia.org/wiki/1967_United_States_Grand_Prix	f	21	18	round_sPuDrSlM
161	11	Mexican Grand Prix	1967-10-22	161	https://en.wikipedia.org/wiki/1967_Mexican_Grand_Prix	f	23	18	round_xtwn41IP
162	1	South African Grand Prix	1968-01-01	162	https://en.wikipedia.org/wiki/1968_South_African_Grand_Prix	f	27	19	round_C75SjngY
163	2	Spanish Grand Prix	1968-05-12	163	https://en.wikipedia.org/wiki/1968_Spanish_Grand_Prix	f	30	19	round_VohvsOXE
164	3	Monaco Grand Prix	1968-05-26	164	https://en.wikipedia.org/wiki/1968_Monaco_Grand_Prix	f	2	19	round_Pp50bozj
165	4	Belgian Grand Prix	1968-06-09	165	https://en.wikipedia.org/wiki/1968_Belgian_Grand_Prix	f	5	19	round_lj2b4Sx6
166	5	Dutch Grand Prix	1968-06-23	166	https://en.wikipedia.org/wiki/1968_Dutch_Grand_Prix	f	11	19	round_OfNQZJW5
167	6	French Grand Prix	1968-07-07	167	https://en.wikipedia.org/wiki/1968_French_Grand_Prix	f	10	19	round_QqG8nMyr
168	7	British Grand Prix	1968-07-20	168	https://en.wikipedia.org/wiki/1968_British_Grand_Prix	f	24	19	round_Us8MVkRE
169	8	German Grand Prix	1968-08-04	169	https://en.wikipedia.org/wiki/1968_German_Grand_Prix	f	8	19	round_VlzJ8mBx
170	9	Italian Grand Prix	1968-09-08	170	https://en.wikipedia.org/wiki/1968_Italian_Grand_Prix	f	7	19	round_HcXZPL0X
171	10	Canadian Grand Prix	1968-09-22	171	https://en.wikipedia.org/wiki/1968_Canadian_Grand_Prix	f	31	19	round_f4162z7H
172	11	United States Grand Prix	1968-10-06	172	https://en.wikipedia.org/wiki/1968_United_States_Grand_Prix	f	21	19	round_flhyZqHU
173	12	Mexican Grand Prix	1968-11-03	173	https://en.wikipedia.org/wiki/1968_Mexican_Grand_Prix	f	23	19	round_01vqkhpI
174	1	South African Grand Prix	1969-03-01	174	https://en.wikipedia.org/wiki/1969_South_African_Grand_Prix	f	27	20	round_I5Sun8P7
175	2	Spanish Grand Prix	1969-05-04	175	https://en.wikipedia.org/wiki/1969_Spanish_Grand_Prix	f	32	20	round_XD1PAPAn
176	3	Monaco Grand Prix	1969-05-18	176	https://en.wikipedia.org/wiki/1969_Monaco_Grand_Prix	f	2	20	round_WfdMy98R
177	4	Dutch Grand Prix	1969-06-21	177	https://en.wikipedia.org/wiki/1969_Dutch_Grand_Prix	f	11	20	round_7T40Oo7Q
178	5	French Grand Prix	1969-07-06	178	https://en.wikipedia.org/wiki/1969_French_Grand_Prix	f	26	20	round_MYxPVpxY
179	6	British Grand Prix	1969-07-19	179	https://en.wikipedia.org/wiki/1969_British_Grand_Prix	f	1	20	round_PcgYGBTz
180	7	German Grand Prix	1969-08-03	180	https://en.wikipedia.org/wiki/1969_German_Grand_Prix	f	8	20	round_eP3KbRUO
181	8	Italian Grand Prix	1969-09-07	181	https://en.wikipedia.org/wiki/1969_Italian_Grand_Prix	f	7	20	round_EpnZ1Vkw
182	9	Canadian Grand Prix	1969-09-20	182	https://en.wikipedia.org/wiki/1969_Canadian_Grand_Prix	f	29	20	round_rZr726qD
183	10	United States Grand Prix	1969-10-05	183	https://en.wikipedia.org/wiki/1969_United_States_Grand_Prix	f	21	20	round_PEQIfEnM
184	11	Mexican Grand Prix	1969-10-19	184	https://en.wikipedia.org/wiki/1969_Mexican_Grand_Prix	f	23	20	round_oCAKBqPW
185	1	South African Grand Prix	1970-03-07	185	https://en.wikipedia.org/wiki/1970_South_African_Grand_Prix	f	27	21	round_CkJgO381
186	2	Spanish Grand Prix	1970-04-19	186	https://en.wikipedia.org/wiki/1970_Spanish_Grand_Prix	f	30	21	round_fnH0609Y
187	3	Monaco Grand Prix	1970-05-10	187	https://en.wikipedia.org/wiki/1970_Monaco_Grand_Prix	f	2	21	round_aQVu0VtO
188	4	Belgian Grand Prix	1970-06-07	188	https://en.wikipedia.org/wiki/1970_Belgian_Grand_Prix	f	5	21	round_y1Yb6DOk
189	5	Dutch Grand Prix	1970-06-21	189	https://en.wikipedia.org/wiki/1970_Dutch_Grand_Prix	f	11	21	round_rBy2oFSa
190	6	French Grand Prix	1970-07-05	190	https://en.wikipedia.org/wiki/1970_French_Grand_Prix	f	26	21	round_RB2FsXri
191	7	British Grand Prix	1970-07-18	191	https://en.wikipedia.org/wiki/1970_British_Grand_Prix	f	24	21	round_Aejj7hdD
192	8	German Grand Prix	1970-08-02	192	https://en.wikipedia.org/wiki/1970_German_Grand_Prix	f	33	21	round_nIi7V2TO
193	9	Austrian Grand Prix	1970-08-16	193	https://en.wikipedia.org/wiki/1970_Austrian_Grand_Prix	f	34	21	round_0ZXDvrL8
194	10	Italian Grand Prix	1970-09-06	194	https://en.wikipedia.org/wiki/1970_Italian_Grand_Prix	f	7	21	round_mpwnmZyJ
195	11	Canadian Grand Prix	1970-09-20	195	https://en.wikipedia.org/wiki/1970_Canadian_Grand_Prix	f	31	21	round_BdwgeMug
196	12	United States Grand Prix	1970-10-04	196	https://en.wikipedia.org/wiki/1970_United_States_Grand_Prix	f	21	21	round_GjDbharh
197	13	Mexican Grand Prix	1970-10-25	197	https://en.wikipedia.org/wiki/1970_Mexican_Grand_Prix	f	23	21	round_ylH7ufd7
198	1	South African Grand Prix	1971-03-06	198	https://en.wikipedia.org/wiki/1971_South_African_Grand_Prix	f	27	22	round_DREBQ7Jo
199	2	Spanish Grand Prix	1971-04-18	199	https://en.wikipedia.org/wiki/1971_Spanish_Grand_Prix	f	32	22	round_FmTYlGd9
200	3	Monaco Grand Prix	1971-05-23	200	https://en.wikipedia.org/wiki/1971_Monaco_Grand_Prix	f	2	22	round_xrkhvTVs
201	4	Dutch Grand Prix	1971-06-20	201	https://en.wikipedia.org/wiki/1971_Dutch_Grand_Prix	f	11	22	round_b5itwvkk
202	5	French Grand Prix	1971-07-04	202	https://en.wikipedia.org/wiki/1971_French_Grand_Prix	f	35	22	round_nAl9jbmo
203	6	British Grand Prix	1971-07-17	203	https://en.wikipedia.org/wiki/1971_British_Grand_Prix	f	1	22	round_Tf7rU29v
204	7	German Grand Prix	1971-08-01	204	https://en.wikipedia.org/wiki/1971_German_Grand_Prix	f	8	22	round_RuctZmIl
205	8	Austrian Grand Prix	1971-08-15	205	https://en.wikipedia.org/wiki/1971_Austrian_Grand_Prix	f	34	22	round_I7zkPQr8
206	9	Italian Grand Prix	1971-09-05	206	https://en.wikipedia.org/wiki/1971_Italian_Grand_Prix	f	7	22	round_qil0Q0ec
207	10	Canadian Grand Prix	1971-09-19	207	https://en.wikipedia.org/wiki/1971_Canadian_Grand_Prix	f	29	22	round_dG43mmDc
208	11	United States Grand Prix	1971-10-03	208	https://en.wikipedia.org/wiki/1971_United_States_Grand_Prix	f	21	22	round_ua8ERrvm
209	1	Argentine Grand Prix	1972-01-23	209	https://en.wikipedia.org/wiki/1972_Argentine_Grand_Prix	f	12	23	round_LSjsA0I5
210	2	South African Grand Prix	1972-03-04	210	https://en.wikipedia.org/wiki/1972_South_African_Grand_Prix	f	27	23	round_iTyiZ2za
211	3	Spanish Grand Prix	1972-05-01	211	https://en.wikipedia.org/wiki/1972_Spanish_Grand_Prix	f	30	23	round_OFhw4RaK
212	4	Monaco Grand Prix	1972-05-14	212	https://en.wikipedia.org/wiki/1972_Monaco_Grand_Prix	f	2	23	round_S3s9h1Ks
213	5	Belgian Grand Prix	1972-06-04	213	https://en.wikipedia.org/wiki/1972_Belgian_Grand_Prix	f	36	23	round_0MQNCOUs
214	6	French Grand Prix	1972-07-02	214	https://en.wikipedia.org/wiki/1972_French_Grand_Prix	f	26	23	round_2GjXYklV
215	7	British Grand Prix	1972-07-15	215	https://en.wikipedia.org/wiki/1972_British_Grand_Prix	f	24	23	round_BfmsoW73
216	8	German Grand Prix	1972-07-30	216	https://en.wikipedia.org/wiki/1972_German_Grand_Prix	f	8	23	round_VXXLgdYC
217	9	Austrian Grand Prix	1972-08-13	217	https://en.wikipedia.org/wiki/1972_Austrian_Grand_Prix	f	34	23	round_sRziBcJV
218	10	Italian Grand Prix	1972-09-10	218	https://en.wikipedia.org/wiki/1972_Italian_Grand_Prix	f	7	23	round_y0FHcbAn
219	11	Canadian Grand Prix	1972-09-24	219	https://en.wikipedia.org/wiki/1972_Canadian_Grand_Prix	f	29	23	round_FFH8CSUa
220	12	United States Grand Prix	1972-10-08	220	https://en.wikipedia.org/wiki/1972_United_States_Grand_Prix	f	21	23	round_y9ADGaON
221	1	Argentine Grand Prix	1973-01-28	221	https://en.wikipedia.org/wiki/1973_Argentine_Grand_Prix	f	12	24	round_0ipOwwJc
222	2	Brazilian Grand Prix	1973-02-11	222	https://en.wikipedia.org/wiki/1973_Brazilian_Grand_Prix	f	37	24	round_NG7GnviC
223	3	South African Grand Prix	1973-03-03	223	https://en.wikipedia.org/wiki/1973_South_African_Grand_Prix	f	27	24	round_dxx0U6pe
224	4	Spanish Grand Prix	1973-04-29	224	https://en.wikipedia.org/wiki/1973_Spanish_Grand_Prix	f	32	24	round_0g1JVO3C
225	5	Belgian Grand Prix	1973-05-20	225	https://en.wikipedia.org/wiki/1973_Belgian_Grand_Prix	f	38	24	round_0I57ZXHb
226	6	Monaco Grand Prix	1973-06-03	226	https://en.wikipedia.org/wiki/1973_Monaco_Grand_Prix	f	2	24	round_YiDKQ2lI
227	7	Swedish Grand Prix	1973-06-17	227	https://en.wikipedia.org/wiki/1973_Swedish_Grand_Prix	f	39	24	round_T7jFwZ9H
228	8	French Grand Prix	1973-07-01	228	https://en.wikipedia.org/wiki/1973_French_Grand_Prix	f	35	24	round_HKRGaWdu
229	9	British Grand Prix	1973-07-14	229	https://en.wikipedia.org/wiki/1973_British_Grand_Prix	f	1	24	round_lhEV4xwB
230	10	Dutch Grand Prix	1973-07-29	230	https://en.wikipedia.org/wiki/1973_Dutch_Grand_Prix	f	11	24	round_PvpSwq4t
231	11	German Grand Prix	1973-08-05	231	https://en.wikipedia.org/wiki/1973_German_Grand_Prix	f	8	24	round_cfOEOlEe
232	12	Austrian Grand Prix	1973-08-19	232	https://en.wikipedia.org/wiki/1973_Austrian_Grand_Prix	f	34	24	round_8GZ8KsNA
233	13	Italian Grand Prix	1973-09-09	233	https://en.wikipedia.org/wiki/1973_Italian_Grand_Prix	f	7	24	round_I71vUc5v
234	14	Canadian Grand Prix	1973-09-23	234	https://en.wikipedia.org/wiki/1973_Canadian_Grand_Prix	f	29	24	round_Y26BazGO
235	15	United States Grand Prix	1973-10-07	235	https://en.wikipedia.org/wiki/1973_United_States_Grand_Prix	f	21	24	round_b4fddY4H
236	1	Argentine Grand Prix	1974-01-13	236	https://en.wikipedia.org/wiki/1974_Argentine_Grand_Prix	f	12	25	round_X8ysE8gT
237	2	Brazilian Grand Prix	1974-01-27	237	https://en.wikipedia.org/wiki/1974_Brazilian_Grand_Prix	f	37	25	round_Ga5aaiiT
238	3	South African Grand Prix	1974-03-30	238	https://en.wikipedia.org/wiki/1974_South_African_Grand_Prix	f	27	25	round_I8C1AJHn
239	4	Spanish Grand Prix	1974-04-28	239	https://en.wikipedia.org/wiki/1974_Spanish_Grand_Prix	f	30	25	round_xQxKrlk6
240	5	Belgian Grand Prix	1974-05-12	240	https://en.wikipedia.org/wiki/1974_Belgian_Grand_Prix	f	36	25	round_gz3UXnLm
241	6	Monaco Grand Prix	1974-05-26	241	https://en.wikipedia.org/wiki/1974_Monaco_Grand_Prix	f	2	25	round_pKycBvDV
242	7	Swedish Grand Prix	1974-06-09	242	https://en.wikipedia.org/wiki/1974_Swedish_Grand_Prix	f	39	25	round_PdqhCjDB
243	8	Dutch Grand Prix	1974-06-23	243	https://en.wikipedia.org/wiki/1974_Dutch_Grand_Prix	f	11	25	round_kkFqF5lQ
244	9	French Grand Prix	1974-07-07	244	https://en.wikipedia.org/wiki/1974_French_Grand_Prix	f	40	25	round_7eRklnin
245	10	British Grand Prix	1974-07-20	245	https://en.wikipedia.org/wiki/1974_British_Grand_Prix	f	24	25	round_rXFuvlhZ
246	11	German Grand Prix	1974-08-04	246	https://en.wikipedia.org/wiki/1974_German_Grand_Prix	f	8	25	round_oJ2jSDbb
247	12	Austrian Grand Prix	1974-08-18	247	https://en.wikipedia.org/wiki/1974_Austrian_Grand_Prix	f	34	25	round_UYXGDXHy
248	13	Italian Grand Prix	1974-09-08	248	https://en.wikipedia.org/wiki/1974_Italian_Grand_Prix	f	7	25	round_rEkOkWLg
249	14	Canadian Grand Prix	1974-09-22	249	https://en.wikipedia.org/wiki/1974_Canadian_Grand_Prix	f	29	25	round_EMiD56Lc
250	15	United States Grand Prix	1974-10-06	250	https://en.wikipedia.org/wiki/1974_United_States_Grand_Prix	f	21	25	round_KZLqrtZr
251	1	Argentine Grand Prix	1975-01-12	251	https://en.wikipedia.org/wiki/1975_Argentine_Grand_Prix	f	12	26	round_hEbtI4iy
252	2	Brazilian Grand Prix	1975-01-26	252	https://en.wikipedia.org/wiki/1975_Brazilian_Grand_Prix	f	37	26	round_ji43VfyL
253	3	South African Grand Prix	1975-03-01	253	https://en.wikipedia.org/wiki/1975_South_African_Grand_Prix	f	27	26	round_c6Y7wTqn
254	4	Spanish Grand Prix	1975-04-27	254	https://en.wikipedia.org/wiki/1975_Spanish_Grand_Prix	f	32	26	round_wdGmEi07
255	5	Monaco Grand Prix	1975-05-11	255	https://en.wikipedia.org/wiki/1975_Monaco_Grand_Prix	f	2	26	round_KdDgo3UG
256	6	Belgian Grand Prix	1975-05-25	256	https://en.wikipedia.org/wiki/1975_Belgian_Grand_Prix	f	38	26	round_RpklxNJw
257	7	Swedish Grand Prix	1975-06-08	257	https://en.wikipedia.org/wiki/1975_Swedish_Grand_Prix	f	39	26	round_N9hfPvGq
258	8	Dutch Grand Prix	1975-06-22	258	https://en.wikipedia.org/wiki/1975_Dutch_Grand_Prix	f	11	26	round_4cxOVRTJ
259	9	French Grand Prix	1975-07-06	259	https://en.wikipedia.org/wiki/1975_French_Grand_Prix	f	35	26	round_uVhJMAQ5
260	10	British Grand Prix	1975-07-19	260	https://en.wikipedia.org/wiki/1975_British_Grand_Prix	f	1	26	round_kK6TcXGt
261	11	German Grand Prix	1975-08-03	261	https://en.wikipedia.org/wiki/1975_German_Grand_Prix	f	8	26	round_hbT5ZjxL
262	12	Austrian Grand Prix	1975-08-17	262	https://en.wikipedia.org/wiki/1975_Austrian_Grand_Prix	f	34	26	round_RTVLWxDf
263	13	Italian Grand Prix	1975-09-07	263	https://en.wikipedia.org/wiki/1975_Italian_Grand_Prix	f	7	26	round_3iJsrLuE
264	14	United States Grand Prix	1975-10-05	264	https://en.wikipedia.org/wiki/1975_United_States_Grand_Prix	f	21	26	round_FPpouxV2
265	1	Brazilian Grand Prix	1976-01-25	265	https://en.wikipedia.org/wiki/1976_Brazilian_Grand_Prix	f	37	27	round_x1xhwrMY
266	2	South African Grand Prix	1976-03-06	266	https://en.wikipedia.org/wiki/1976_South_African_Grand_Prix	f	27	27	round_NtpdhoSJ
267	3	United States Grand Prix West	1976-03-28	267	https://en.wikipedia.org/wiki/1976_United_States_Grand_Prix_West	f	41	27	round_SVZqy4Jl
268	4	Spanish Grand Prix	1976-05-02	268	https://en.wikipedia.org/wiki/1976_Spanish_Grand_Prix	f	30	27	round_v8aAOPLJ
269	5	Belgian Grand Prix	1976-05-16	269	https://en.wikipedia.org/wiki/1976_Belgian_Grand_Prix	f	38	27	round_7tAg8Skm
270	6	Monaco Grand Prix	1976-05-30	270	https://en.wikipedia.org/wiki/1976_Monaco_Grand_Prix	f	2	27	round_qhDBNBaz
271	7	Swedish Grand Prix	1976-06-13	271	https://en.wikipedia.org/wiki/1976_Swedish_Grand_Prix	f	39	27	round_O3FuKN50
272	8	French Grand Prix	1976-07-04	272	https://en.wikipedia.org/wiki/1976_French_Grand_Prix	f	35	27	round_Ci9wlyOD
273	9	British Grand Prix	1976-07-18	273	https://en.wikipedia.org/wiki/1976_British_Grand_Prix	f	24	27	round_mYECe155
274	10	German Grand Prix	1976-08-01	274	https://en.wikipedia.org/wiki/1976_German_Grand_Prix	f	8	27	round_9PCUDs1y
275	11	Austrian Grand Prix	1976-08-15	275	https://en.wikipedia.org/wiki/1976_Austrian_Grand_Prix	f	34	27	round_I5JzREyU
276	12	Dutch Grand Prix	1976-08-29	276	https://en.wikipedia.org/wiki/1976_Dutch_Grand_Prix	f	11	27	round_WqZThA39
277	13	Italian Grand Prix	1976-09-12	277	https://en.wikipedia.org/wiki/1976_Italian_Grand_Prix	f	7	27	round_MaZyJieX
278	14	Canadian Grand Prix	1976-10-03	278	https://en.wikipedia.org/wiki/1976_Canadian_Grand_Prix	f	29	27	round_R7kMvmbS
279	15	United States Grand Prix	1976-10-10	279	https://en.wikipedia.org/wiki/1976_United_States_Grand_Prix	f	21	27	round_hTYT1dm8
280	16	Japanese Grand Prix	1976-10-24	280	https://en.wikipedia.org/wiki/1976_Japanese_Grand_Prix	f	42	27	round_1xlfNjfg
281	1	Argentine Grand Prix	1977-01-09	281	https://en.wikipedia.org/wiki/1977_Argentine_Grand_Prix	f	12	28	round_eWsR9KCo
282	2	Brazilian Grand Prix	1977-01-23	282	https://en.wikipedia.org/wiki/1977_Brazilian_Grand_Prix	f	37	28	round_zWqHSLZA
283	3	South African Grand Prix	1977-03-05	283	https://en.wikipedia.org/wiki/1977_South_African_Grand_Prix	f	27	28	round_RjEGHqJm
284	4	United States Grand Prix West	1977-04-03	284	https://en.wikipedia.org/wiki/1977_United_States_Grand_Prix_West	f	41	28	round_WE2s9Z22
285	5	Spanish Grand Prix	1977-05-08	285	https://en.wikipedia.org/wiki/1977_Spanish_Grand_Prix	f	30	28	round_iALhxggv
286	6	Monaco Grand Prix	1977-05-22	286	https://en.wikipedia.org/wiki/1977_Monaco_Grand_Prix	f	2	28	round_KBQT6NHw
287	7	Belgian Grand Prix	1977-06-05	287	https://en.wikipedia.org/wiki/1977_Belgian_Grand_Prix	f	38	28	round_zZOr1WMM
288	8	Swedish Grand Prix	1977-06-19	288	https://en.wikipedia.org/wiki/1977_Swedish_Grand_Prix	f	39	28	round_GtDCrCEN
289	9	French Grand Prix	1977-07-03	289	https://en.wikipedia.org/wiki/1977_French_Grand_Prix	f	40	28	round_t4kJmCop
290	10	British Grand Prix	1977-07-16	290	https://en.wikipedia.org/wiki/1977_British_Grand_Prix	f	1	28	round_4bxhKoGq
291	11	German Grand Prix	1977-07-31	291	https://en.wikipedia.org/wiki/1977_German_Grand_Prix	f	33	28	round_EYUwccaa
292	12	Austrian Grand Prix	1977-08-14	292	https://en.wikipedia.org/wiki/1977_Austrian_Grand_Prix	f	34	28	round_5g9kijqD
293	13	Dutch Grand Prix	1977-08-28	293	https://en.wikipedia.org/wiki/1977_Dutch_Grand_Prix	f	11	28	round_hrsab4R6
294	14	Italian Grand Prix	1977-09-11	294	https://en.wikipedia.org/wiki/1977_Italian_Grand_Prix	f	7	28	round_PG5Uz0Tv
295	15	United States Grand Prix	1977-10-02	295	https://en.wikipedia.org/wiki/1977_United_States_Grand_Prix	f	21	28	round_tWUGJ5rZ
296	16	Canadian Grand Prix	1977-10-09	296	https://en.wikipedia.org/wiki/1977_Canadian_Grand_Prix	f	29	28	round_xtTbUaip
297	17	Japanese Grand Prix	1977-10-23	297	https://en.wikipedia.org/wiki/1977_Japanese_Grand_Prix	f	42	28	round_aRiEjCsj
298	1	Argentine Grand Prix	1978-01-15	298	https://en.wikipedia.org/wiki/1978_Argentine_Grand_Prix	f	12	29	round_X6060Rpw
299	2	Brazilian Grand Prix	1978-01-29	299	https://en.wikipedia.org/wiki/1978_Brazilian_Grand_Prix	f	43	29	round_9oQN8Ukq
300	3	South African Grand Prix	1978-03-04	300	https://en.wikipedia.org/wiki/1978_South_African_Grand_Prix	f	27	29	round_tl7Ag6aK
301	4	United States Grand Prix West	1978-04-02	301	https://en.wikipedia.org/wiki/1978_United_States_Grand_Prix_West	f	41	29	round_ojEgzvMc
302	5	Monaco Grand Prix	1978-05-07	302	https://en.wikipedia.org/wiki/1978_Monaco_Grand_Prix	f	2	29	round_y4jT8gEa
303	6	Belgian Grand Prix	1978-05-21	303	https://en.wikipedia.org/wiki/1978_Belgian_Grand_Prix	f	38	29	round_dO8JaTPM
304	7	Spanish Grand Prix	1978-06-04	304	https://en.wikipedia.org/wiki/1978_Spanish_Grand_Prix	f	30	29	round_tYnq4tYN
305	8	Swedish Grand Prix	1978-06-17	305	https://en.wikipedia.org/wiki/1978_Swedish_Grand_Prix	f	39	29	round_aaixxLYf
306	9	French Grand Prix	1978-07-02	306	https://en.wikipedia.org/wiki/1978_French_Grand_Prix	f	35	29	round_QAEMoQGy
307	10	British Grand Prix	1978-07-16	307	https://en.wikipedia.org/wiki/1978_British_Grand_Prix	f	24	29	round_IEmDrNGv
308	11	German Grand Prix	1978-07-30	308	https://en.wikipedia.org/wiki/1978_German_Grand_Prix	f	33	29	round_rC7lIPm9
309	12	Austrian Grand Prix	1978-08-13	309	https://en.wikipedia.org/wiki/1978_Austrian_Grand_Prix	f	34	29	round_pH9seSTq
310	13	Dutch Grand Prix	1978-08-27	310	https://en.wikipedia.org/wiki/1978_Dutch_Grand_Prix	f	11	29	round_bqoaJu1I
311	14	Italian Grand Prix	1978-09-10	311	https://en.wikipedia.org/wiki/1978_Italian_Grand_Prix	f	7	29	round_uwRFBN33
312	15	United States Grand Prix	1978-10-01	312	https://en.wikipedia.org/wiki/1978_United_States_Grand_Prix	f	21	29	round_hvqcjISJ
313	16	Canadian Grand Prix	1978-10-08	313	https://en.wikipedia.org/wiki/1978_Canadian_Grand_Prix	f	44	29	round_qjdVmhlV
314	1	Argentine Grand Prix	1979-01-21	314	https://en.wikipedia.org/wiki/1979_Argentine_Grand_Prix	f	12	30	round_2BGO4XpN
315	2	Brazilian Grand Prix	1979-02-04	315	https://en.wikipedia.org/wiki/1979_Brazilian_Grand_Prix	f	37	30	round_gC4TWPlc
316	3	South African Grand Prix	1979-03-03	316	https://en.wikipedia.org/wiki/1979_South_African_Grand_Prix	f	27	30	round_kfHcVUC6
317	4	United States Grand Prix West	1979-04-08	317	https://en.wikipedia.org/wiki/1979_United_States_Grand_Prix_West	f	41	30	round_IgyaujER
318	5	Spanish Grand Prix	1979-04-29	318	https://en.wikipedia.org/wiki/1979_Spanish_Grand_Prix	f	30	30	round_mT5qF2Xg
319	6	Belgian Grand Prix	1979-05-13	319	https://en.wikipedia.org/wiki/1979_Belgian_Grand_Prix	f	38	30	round_UUUAMEZI
320	7	Monaco Grand Prix	1979-05-27	320	https://en.wikipedia.org/wiki/1979_Monaco_Grand_Prix	f	2	30	round_giDFoPfD
321	8	French Grand Prix	1979-07-01	321	https://en.wikipedia.org/wiki/1979_French_Grand_Prix	f	40	30	round_4Z1qFq2F
322	9	British Grand Prix	1979-07-14	322	https://en.wikipedia.org/wiki/1979_British_Grand_Prix	f	1	30	round_6IviO9I0
323	10	German Grand Prix	1979-07-29	323	https://en.wikipedia.org/wiki/1979_German_Grand_Prix	f	33	30	round_mMaBQoz4
324	11	Austrian Grand Prix	1979-08-12	324	https://en.wikipedia.org/wiki/1979_Austrian_Grand_Prix	f	34	30	round_0kjH4XWm
325	12	Dutch Grand Prix	1979-08-26	325	https://en.wikipedia.org/wiki/1979_Dutch_Grand_Prix	f	11	30	round_NIwDvcvv
326	13	Italian Grand Prix	1979-09-09	326	https://en.wikipedia.org/wiki/1979_Italian_Grand_Prix	f	7	30	round_OgWbm8JP
327	14	Canadian Grand Prix	1979-09-30	327	https://en.wikipedia.org/wiki/1979_Canadian_Grand_Prix	f	44	30	round_KHDcKMBL
328	15	United States Grand Prix	1979-10-07	328	https://en.wikipedia.org/wiki/1979_United_States_Grand_Prix	f	21	30	round_FE5wJXzg
329	1	Argentine Grand Prix	1980-01-13	329	https://en.wikipedia.org/wiki/1980_Argentine_Grand_Prix	f	12	31	round_4mEFaaJP
330	2	Brazilian Grand Prix	1980-01-27	330	https://en.wikipedia.org/wiki/1980_Brazilian_Grand_Prix	f	37	31	round_9nwVuhXW
331	3	South African Grand Prix	1980-03-01	331	https://en.wikipedia.org/wiki/1980_South_African_Grand_Prix	f	27	31	round_go3vraXH
332	4	United States Grand Prix West	1980-03-30	332	https://en.wikipedia.org/wiki/1980_United_States_Grand_Prix_West	f	41	31	round_ccedo7Lc
333	5	Belgian Grand Prix	1980-05-04	333	https://en.wikipedia.org/wiki/1980_Belgian_Grand_Prix	f	38	31	round_P1CCsKVe
334	6	Monaco Grand Prix	1980-05-18	334	https://en.wikipedia.org/wiki/1980_Monaco_Grand_Prix	f	2	31	round_48W6MVtR
335	7	French Grand Prix	1980-06-29	335	https://en.wikipedia.org/wiki/1980_French_Grand_Prix	f	35	31	round_QvwkqigD
336	8	British Grand Prix	1980-07-13	336	https://en.wikipedia.org/wiki/1980_British_Grand_Prix	f	24	31	round_mD7EOC1k
337	9	German Grand Prix	1980-08-10	337	https://en.wikipedia.org/wiki/1980_German_Grand_Prix	f	33	31	round_o27NlM0S
338	10	Austrian Grand Prix	1980-08-17	338	https://en.wikipedia.org/wiki/1980_Austrian_Grand_Prix	f	34	31	round_O8Boqme9
339	11	Dutch Grand Prix	1980-08-31	339	https://en.wikipedia.org/wiki/1980_Dutch_Grand_Prix	f	11	31	round_BnoyVllK
340	12	Italian Grand Prix	1980-09-14	340	https://en.wikipedia.org/wiki/1980_Italian_Grand_Prix	f	45	31	round_vAS9rzBr
341	13	Canadian Grand Prix	1980-09-28	341	https://en.wikipedia.org/wiki/1980_Canadian_Grand_Prix	f	44	31	round_nnO3kwI7
342	14	United States Grand Prix	1980-10-05	342	https://en.wikipedia.org/wiki/1980_United_States_Grand_Prix	f	21	31	round_4ZMdC16s
343	1	United States Grand Prix West	1981-03-15	343	https://en.wikipedia.org/wiki/1981_United_States_Grand_Prix_West	f	41	32	round_foYWcAOf
344	2	Brazilian Grand Prix	1981-03-29	344	https://en.wikipedia.org/wiki/1981_Brazilian_Grand_Prix	f	43	32	round_urErAcwH
345	3	Argentine Grand Prix	1981-04-12	345	https://en.wikipedia.org/wiki/1981_Argentine_Grand_Prix	f	12	32	round_iGhOUxmi
346	4	San Marino Grand Prix	1981-05-03	346	https://en.wikipedia.org/wiki/1981_San_Marino_Grand_Prix	f	45	32	round_MqVZ61M2
347	5	Belgian Grand Prix	1981-05-17	347	https://en.wikipedia.org/wiki/1981_Belgian_Grand_Prix	f	38	32	round_wY3Bpon7
348	6	Monaco Grand Prix	1981-05-31	348	https://en.wikipedia.org/wiki/1981_Monaco_Grand_Prix	f	2	32	round_3qa4clKn
349	7	Spanish Grand Prix	1981-06-21	349	https://en.wikipedia.org/wiki/1981_Spanish_Grand_Prix	f	30	32	round_xVJIaVt9
350	8	French Grand Prix	1981-07-05	350	https://en.wikipedia.org/wiki/1981_French_Grand_Prix	f	40	32	round_SQnsGwTK
351	9	British Grand Prix	1981-07-18	351	https://en.wikipedia.org/wiki/1981_British_Grand_Prix	f	1	32	round_soDCf40Q
352	10	German Grand Prix	1981-08-02	352	https://en.wikipedia.org/wiki/1981_German_Grand_Prix	f	33	32	round_oysrSuTr
353	11	Austrian Grand Prix	1981-08-16	353	https://en.wikipedia.org/wiki/1981_Austrian_Grand_Prix	f	34	32	round_HEpSPVsX
354	12	Dutch Grand Prix	1981-08-30	354	https://en.wikipedia.org/wiki/1981_Dutch_Grand_Prix	f	11	32	round_ZN8mo9wK
355	13	Italian Grand Prix	1981-09-13	355	https://en.wikipedia.org/wiki/1981_Italian_Grand_Prix	f	7	32	round_WN2y5yjw
356	14	Canadian Grand Prix	1981-09-27	356	https://en.wikipedia.org/wiki/1981_Canadian_Grand_Prix	f	44	32	round_C9bAbj6f
357	15	Caesars Palace Grand Prix	1981-10-17	357	https://en.wikipedia.org/wiki/1981_Caesars_Palace_Grand_Prix	f	46	32	round_CZdutHZc
358	1	South African Grand Prix	1982-01-23	358	https://en.wikipedia.org/wiki/1982_South_African_Grand_Prix	f	27	33	round_q9pQIrOa
359	2	Brazilian Grand Prix	1982-03-21	359	https://en.wikipedia.org/wiki/1982_Brazilian_Grand_Prix	f	43	33	round_rMjtsk4r
360	3	United States Grand Prix West	1982-04-04	360	https://en.wikipedia.org/wiki/1982_United_States_Grand_Prix_West	f	41	33	round_pMaRFBoh
361	4	San Marino Grand Prix	1982-04-25	361	https://en.wikipedia.org/wiki/1982_San_Marino_Grand_Prix	f	45	33	round_0ppUIMp1
362	5	Belgian Grand Prix	1982-05-09	362	https://en.wikipedia.org/wiki/1982_Belgian_Grand_Prix	f	38	33	round_6ZEq8P8O
363	6	Monaco Grand Prix	1982-05-23	363	https://en.wikipedia.org/wiki/1982_Monaco_Grand_Prix	f	2	33	round_ApgBt5JH
364	7	Detroit Grand Prix	1982-06-06	364	https://en.wikipedia.org/wiki/1982_Detroit_Grand_Prix	f	47	33	round_tp8nGVlC
365	8	Canadian Grand Prix	1982-06-13	365	https://en.wikipedia.org/wiki/1982_Canadian_Grand_Prix	f	44	33	round_yRfFy4Jo
366	9	Dutch Grand Prix	1982-07-03	366	https://en.wikipedia.org/wiki/1982_Dutch_Grand_Prix	f	11	33	round_CzrAAXPk
367	10	British Grand Prix	1982-07-18	367	https://en.wikipedia.org/wiki/1982_British_Grand_Prix	f	24	33	round_Ewc8zCvi
368	11	French Grand Prix	1982-07-25	368	https://en.wikipedia.org/wiki/1982_French_Grand_Prix	f	35	33	round_1yA5ckLH
369	12	German Grand Prix	1982-08-08	369	https://en.wikipedia.org/wiki/1982_German_Grand_Prix	f	33	33	round_bNOkagq0
370	13	Austrian Grand Prix	1982-08-15	370	https://en.wikipedia.org/wiki/1982_Austrian_Grand_Prix	f	34	33	round_2n0LWnsc
371	14	Swiss Grand Prix	1982-08-29	371	https://en.wikipedia.org/wiki/1982_Swiss_Grand_Prix	f	40	33	round_CZfs9dSt
372	15	Italian Grand Prix	1982-09-12	372	https://en.wikipedia.org/wiki/1982_Italian_Grand_Prix	f	7	33	round_hp3GxONj
373	16	Caesars Palace Grand Prix	1982-09-25	373	https://en.wikipedia.org/wiki/1982_Caesars_Palace_Grand_Prix	f	46	33	round_nyx1ESwa
374	1	Brazilian Grand Prix	1983-03-13	374	https://en.wikipedia.org/wiki/1983_Brazilian_Grand_Prix	f	43	34	round_1Z3YKf0n
375	2	United States Grand Prix West	1983-03-27	375	https://en.wikipedia.org/wiki/1983_United_States_Grand_Prix_West	f	41	34	round_GMeiSurU
376	3	French Grand Prix	1983-04-17	376	https://en.wikipedia.org/wiki/1983_French_Grand_Prix	f	35	34	round_JNJTQXc1
377	4	San Marino Grand Prix	1983-05-01	377	https://en.wikipedia.org/wiki/1983_San_Marino_Grand_Prix	f	45	34	round_SCiTHcpT
378	5	Monaco Grand Prix	1983-05-15	378	https://en.wikipedia.org/wiki/1983_Monaco_Grand_Prix	f	2	34	round_ApxwXAAX
379	6	Belgian Grand Prix	1983-05-22	379	https://en.wikipedia.org/wiki/1983_Belgian_Grand_Prix	f	5	34	round_7315nmiY
380	7	Detroit Grand Prix	1983-06-05	380	https://en.wikipedia.org/wiki/1983_Detroit_Grand_Prix	f	47	34	round_8VVxUiSP
381	8	Canadian Grand Prix	1983-06-12	381	https://en.wikipedia.org/wiki/1983_Canadian_Grand_Prix	f	44	34	round_HUlffE4A
382	9	British Grand Prix	1983-07-16	382	https://en.wikipedia.org/wiki/1983_British_Grand_Prix	f	1	34	round_KwJ3MgxV
383	10	German Grand Prix	1983-08-07	383	https://en.wikipedia.org/wiki/1983_German_Grand_Prix	f	33	34	round_Fifuwnyj
384	11	Austrian Grand Prix	1983-08-14	384	https://en.wikipedia.org/wiki/1983_Austrian_Grand_Prix	f	34	34	round_PpcCp1lN
385	12	Dutch Grand Prix	1983-08-28	385	https://en.wikipedia.org/wiki/1983_Dutch_Grand_Prix	f	11	34	round_3ns8Lbqo
386	13	Italian Grand Prix	1983-09-11	386	https://en.wikipedia.org/wiki/1983_Italian_Grand_Prix	f	7	34	round_pRYpXW3w
387	14	European Grand Prix	1983-09-25	387	https://en.wikipedia.org/wiki/1983_European_Grand_Prix	f	24	34	round_5MFeM9Oz
388	15	South African Grand Prix	1983-10-15	388	https://en.wikipedia.org/wiki/1983_South_African_Grand_Prix	f	27	34	round_CH6lYVyc
389	1	Brazilian Grand Prix	1984-03-25	389	https://en.wikipedia.org/wiki/1984_Brazilian_Grand_Prix	f	43	35	round_UqRpLnIA
390	2	South African Grand Prix	1984-04-07	390	https://en.wikipedia.org/wiki/1984_South_African_Grand_Prix	f	27	35	round_ZLQQBgL1
391	3	Belgian Grand Prix	1984-04-29	391	https://en.wikipedia.org/wiki/1984_Belgian_Grand_Prix	f	38	35	round_HghOjmXY
392	4	San Marino Grand Prix	1984-05-06	392	https://en.wikipedia.org/wiki/1984_San_Marino_Grand_Prix	f	45	35	round_3l6pr8zY
393	5	French Grand Prix	1984-05-20	393	https://en.wikipedia.org/wiki/1984_French_Grand_Prix	f	40	35	round_EmVgl5UP
394	6	Monaco Grand Prix	1984-06-03	394	https://en.wikipedia.org/wiki/1984_Monaco_Grand_Prix	f	2	35	round_Apcsos5Y
395	7	Canadian Grand Prix	1984-06-17	395	https://en.wikipedia.org/wiki/1984_Canadian_Grand_Prix	f	44	35	round_xHkAFIXw
396	8	Detroit Grand Prix	1984-06-24	396	https://en.wikipedia.org/wiki/1984_Detroit_Grand_Prix	f	47	35	round_61lt4OjX
397	9	Dallas Grand Prix	1984-07-08	397	https://en.wikipedia.org/wiki/1984_Dallas_Grand_Prix	f	48	35	round_n4Qi1uWs
398	10	British Grand Prix	1984-07-22	398	https://en.wikipedia.org/wiki/1984_British_Grand_Prix	f	24	35	round_hC7CVpFl
399	11	German Grand Prix	1984-08-05	399	https://en.wikipedia.org/wiki/1984_German_Grand_Prix	f	33	35	round_VlGFRMu3
400	12	Austrian Grand Prix	1984-08-19	400	https://en.wikipedia.org/wiki/1984_Austrian_Grand_Prix	f	34	35	round_enCuIpjM
401	13	Dutch Grand Prix	1984-08-26	401	https://en.wikipedia.org/wiki/1984_Dutch_Grand_Prix	f	11	35	round_e9rCGcrd
402	14	Italian Grand Prix	1984-09-09	402	https://en.wikipedia.org/wiki/1984_Italian_Grand_Prix	f	7	35	round_t1TD7Zrn
403	15	European Grand Prix	1984-10-07	403	https://en.wikipedia.org/wiki/1984_European_Grand_Prix	f	8	35	round_d5c2tPdV
404	16	Portuguese Grand Prix	1984-10-21	404	https://en.wikipedia.org/wiki/1984_Portuguese_Grand_Prix	f	49	35	round_BgQyFd70
405	1	Brazilian Grand Prix	1985-04-07	405	https://en.wikipedia.org/wiki/1985_Brazilian_Grand_Prix	f	43	36	round_0Q6y7LQe
406	2	Portuguese Grand Prix	1985-04-21	406	https://en.wikipedia.org/wiki/1985_Portuguese_Grand_Prix	f	49	36	round_F4MrL7Js
407	3	San Marino Grand Prix	1985-05-05	407	https://en.wikipedia.org/wiki/1985_San_Marino_Grand_Prix	f	45	36	round_a7FWsKKw
408	4	Monaco Grand Prix	1985-05-19	408	https://en.wikipedia.org/wiki/1985_Monaco_Grand_Prix	f	2	36	round_EI8DkEf0
409	5	Canadian Grand Prix	1985-06-16	409	https://en.wikipedia.org/wiki/1985_Canadian_Grand_Prix	f	44	36	round_b1FVqhQp
410	6	Detroit Grand Prix	1985-06-23	410	https://en.wikipedia.org/wiki/1985_Detroit_Grand_Prix	f	47	36	round_bOscYSbo
411	7	French Grand Prix	1985-07-07	411	https://en.wikipedia.org/wiki/1985_French_Grand_Prix	f	35	36	round_YuxOtZZJ
412	8	British Grand Prix	1985-07-21	412	https://en.wikipedia.org/wiki/1985_British_Grand_Prix	f	1	36	round_JAjBNpX5
413	9	German Grand Prix	1985-08-04	413	https://en.wikipedia.org/wiki/1985_German_Grand_Prix	f	8	36	round_ZWONEMf4
414	10	Austrian Grand Prix	1985-08-18	414	https://en.wikipedia.org/wiki/1985_Austrian_Grand_Prix	f	34	36	round_MCdif8H5
415	11	Dutch Grand Prix	1985-08-25	415	https://en.wikipedia.org/wiki/1985_Dutch_Grand_Prix	f	11	36	round_zM9SPUfm
416	12	Italian Grand Prix	1985-09-08	416	https://en.wikipedia.org/wiki/1985_Italian_Grand_Prix	f	7	36	round_VAix529k
417	13	Belgian Grand Prix	1985-09-15	417	https://en.wikipedia.org/wiki/1985_Belgian_Grand_Prix	f	5	36	round_tEjEsNs9
418	14	European Grand Prix	1985-10-06	418	https://en.wikipedia.org/wiki/1985_European_Grand_Prix	f	24	36	round_9sRApnaY
419	15	South African Grand Prix	1985-10-19	419	https://en.wikipedia.org/wiki/1985_South_African_Grand_Prix	f	27	36	round_ImF4XvMg
420	16	Australian Grand Prix	1985-11-03	420	https://en.wikipedia.org/wiki/1985_Australian_Grand_Prix	f	50	36	round_s72eZmLO
421	1	Brazilian Grand Prix	1986-03-23	421	https://en.wikipedia.org/wiki/1986_Brazilian_Grand_Prix	f	43	37	round_MIlFCf9N
422	2	Spanish Grand Prix	1986-04-13	422	https://en.wikipedia.org/wiki/1986_Spanish_Grand_Prix	f	51	37	round_1x6GDzgm
423	3	San Marino Grand Prix	1986-04-27	423	https://en.wikipedia.org/wiki/1986_San_Marino_Grand_Prix	f	45	37	round_CZ1oE6kh
424	4	Monaco Grand Prix	1986-05-11	424	https://en.wikipedia.org/wiki/1986_Monaco_Grand_Prix	f	2	37	round_reRz38Gr
425	5	Belgian Grand Prix	1986-05-25	425	https://en.wikipedia.org/wiki/1986_Belgian_Grand_Prix	f	5	37	round_W4ZVUDzP
426	6	Canadian Grand Prix	1986-06-15	426	https://en.wikipedia.org/wiki/1986_Canadian_Grand_Prix	f	44	37	round_CUbCa21i
427	7	Detroit Grand Prix	1986-06-22	427	https://en.wikipedia.org/wiki/1986_Detroit_Grand_Prix	f	47	37	round_uNLFvN5S
428	8	French Grand Prix	1986-07-06	428	https://en.wikipedia.org/wiki/1986_French_Grand_Prix	f	35	37	round_0xy6mI4w
429	9	British Grand Prix	1986-07-13	429	https://en.wikipedia.org/wiki/1986_British_Grand_Prix	f	24	37	round_v32Q9vpz
430	10	German Grand Prix	1986-07-27	430	https://en.wikipedia.org/wiki/1986_German_Grand_Prix	f	33	37	round_mY3SQqks
431	11	Hungarian Grand Prix	1986-08-10	431	https://en.wikipedia.org/wiki/1986_Hungarian_Grand_Prix	f	52	37	round_yjSNdcSV
432	12	Austrian Grand Prix	1986-08-17	432	https://en.wikipedia.org/wiki/1986_Austrian_Grand_Prix	f	34	37	round_zW3ZkEG7
433	13	Italian Grand Prix	1986-09-07	433	https://en.wikipedia.org/wiki/1986_Italian_Grand_Prix	f	7	37	round_8mPe3sy5
434	14	Portuguese Grand Prix	1986-09-21	434	https://en.wikipedia.org/wiki/1986_Portuguese_Grand_Prix	f	49	37	round_0rn3kS7D
435	15	Mexican Grand Prix	1986-10-12	435	https://en.wikipedia.org/wiki/1986_Mexican_Grand_Prix	f	23	37	round_BHO76V8L
436	16	Australian Grand Prix	1986-10-26	436	https://en.wikipedia.org/wiki/1986_Australian_Grand_Prix	f	50	37	round_3Bx2bOsM
437	1	Brazilian Grand Prix	1987-04-12	437	https://en.wikipedia.org/wiki/1987_Brazilian_Grand_Prix	f	43	38	round_qOXENZd0
438	2	San Marino Grand Prix	1987-05-03	438	https://en.wikipedia.org/wiki/1987_San_Marino_Grand_Prix	f	45	38	round_6HUfo2A4
439	3	Belgian Grand Prix	1987-05-17	439	https://en.wikipedia.org/wiki/1987_Belgian_Grand_Prix	f	5	38	round_3Gho5mto
440	4	Monaco Grand Prix	1987-05-31	440	https://en.wikipedia.org/wiki/1987_Monaco_Grand_Prix	f	2	38	round_yMHj4ygr
441	5	Detroit Grand Prix	1987-06-21	441	https://en.wikipedia.org/wiki/1987_Detroit_Grand_Prix	f	47	38	round_SijOcT6t
442	6	French Grand Prix	1987-07-05	442	https://en.wikipedia.org/wiki/1987_French_Grand_Prix	f	35	38	round_QrPfUx0q
443	7	British Grand Prix	1987-07-12	443	https://en.wikipedia.org/wiki/1987_British_Grand_Prix	f	1	38	round_O1yX06xo
444	8	German Grand Prix	1987-07-26	444	https://en.wikipedia.org/wiki/1987_German_Grand_Prix	f	33	38	round_XUI1oLEt
445	9	Hungarian Grand Prix	1987-08-09	445	https://en.wikipedia.org/wiki/1987_Hungarian_Grand_Prix	f	52	38	round_j0ihOEIk
446	10	Austrian Grand Prix	1987-08-16	446	https://en.wikipedia.org/wiki/1987_Austrian_Grand_Prix	f	34	38	round_W9CGII3c
447	11	Italian Grand Prix	1987-09-06	447	https://en.wikipedia.org/wiki/1987_Italian_Grand_Prix	f	7	38	round_98yu1KTS
448	12	Portuguese Grand Prix	1987-09-20	448	https://en.wikipedia.org/wiki/1987_Portuguese_Grand_Prix	f	49	38	round_XHXbFx3K
449	13	Spanish Grand Prix	1987-09-27	449	https://en.wikipedia.org/wiki/1987_Spanish_Grand_Prix	f	51	38	round_6xK0ZXSl
450	14	Mexican Grand Prix	1987-10-18	450	https://en.wikipedia.org/wiki/1987_Mexican_Grand_Prix	f	23	38	round_xklyBKwx
451	15	Japanese Grand Prix	1987-11-01	451	https://en.wikipedia.org/wiki/1987_Japanese_Grand_Prix	f	53	38	round_8u9LnXIH
452	16	Australian Grand Prix	1987-11-15	452	https://en.wikipedia.org/wiki/1987_Australian_Grand_Prix	f	50	38	round_DU4skOpc
453	1	Brazilian Grand Prix	1988-04-03	453	https://en.wikipedia.org/wiki/1988_Brazilian_Grand_Prix	f	43	39	round_Kd5vPtGc
454	2	San Marino Grand Prix	1988-05-01	454	https://en.wikipedia.org/wiki/1988_San_Marino_Grand_Prix	f	45	39	round_1MlgLAie
455	3	Monaco Grand Prix	1988-05-15	455	https://en.wikipedia.org/wiki/1988_Monaco_Grand_Prix	f	2	39	round_dCiAHIis
456	4	Mexican Grand Prix	1988-05-29	456	https://en.wikipedia.org/wiki/1988_Mexican_Grand_Prix	f	23	39	round_pTPnNmFA
457	5	Canadian Grand Prix	1988-06-12	457	https://en.wikipedia.org/wiki/1988_Canadian_Grand_Prix	f	44	39	round_bkOXEuXL
458	6	Detroit Grand Prix	1988-06-19	458	https://en.wikipedia.org/wiki/1988_Detroit_Grand_Prix	f	47	39	round_yE4digoM
459	7	French Grand Prix	1988-07-03	459	https://en.wikipedia.org/wiki/1988_French_Grand_Prix	f	35	39	round_gpG5SNJh
460	8	British Grand Prix	1988-07-10	460	https://en.wikipedia.org/wiki/1988_British_Grand_Prix	f	1	39	round_fymgyLpP
461	9	German Grand Prix	1988-07-24	461	https://en.wikipedia.org/wiki/1988_German_Grand_Prix	f	33	39	round_TeqEKN2l
462	10	Hungarian Grand Prix	1988-08-07	462	https://en.wikipedia.org/wiki/1988_Hungarian_Grand_Prix	f	52	39	round_AqxA28ZS
463	11	Belgian Grand Prix	1988-08-28	463	https://en.wikipedia.org/wiki/1988_Belgian_Grand_Prix	f	5	39	round_GOtHaJEU
464	12	Italian Grand Prix	1988-09-11	464	https://en.wikipedia.org/wiki/1988_Italian_Grand_Prix	f	7	39	round_L4hCkb6W
465	13	Portuguese Grand Prix	1988-09-25	465	https://en.wikipedia.org/wiki/1988_Portuguese_Grand_Prix	f	49	39	round_DY8VzTdf
466	14	Spanish Grand Prix	1988-10-02	466	https://en.wikipedia.org/wiki/1988_Spanish_Grand_Prix	f	51	39	round_Lmk5dF3F
467	15	Japanese Grand Prix	1988-10-30	467	https://en.wikipedia.org/wiki/1988_Japanese_Grand_Prix	f	53	39	round_hzUWGNYB
468	16	Australian Grand Prix	1988-11-13	468	https://en.wikipedia.org/wiki/1988_Australian_Grand_Prix	f	50	39	round_QXmo3ULk
469	1	Brazilian Grand Prix	1989-03-26	469	https://en.wikipedia.org/wiki/1989_Brazilian_Grand_Prix	f	43	40	round_WFgMUtuv
470	2	San Marino Grand Prix	1989-04-23	470	https://en.wikipedia.org/wiki/1989_San_Marino_Grand_Prix	f	45	40	round_taLolKfD
471	3	Monaco Grand Prix	1989-05-07	471	https://en.wikipedia.org/wiki/1989_Monaco_Grand_Prix	f	2	40	round_W8RaklCR
472	4	Mexican Grand Prix	1989-05-28	472	https://en.wikipedia.org/wiki/1989_Mexican_Grand_Prix	f	23	40	round_Oh3dlLbv
473	5	United States Grand Prix	1989-06-04	473	https://en.wikipedia.org/wiki/1989_United_States_Grand_Prix	f	54	40	round_sF0r1Yna
474	6	Canadian Grand Prix	1989-06-18	474	https://en.wikipedia.org/wiki/1989_Canadian_Grand_Prix	f	44	40	round_DzZCl6OT
475	7	French Grand Prix	1989-07-09	475	https://en.wikipedia.org/wiki/1989_French_Grand_Prix	f	35	40	round_dzhdOmJJ
476	8	British Grand Prix	1989-07-16	476	https://en.wikipedia.org/wiki/1989_British_Grand_Prix	f	1	40	round_jm7UBS8R
477	9	German Grand Prix	1989-07-30	477	https://en.wikipedia.org/wiki/1989_German_Grand_Prix	f	33	40	round_B4mrlaN2
478	10	Hungarian Grand Prix	1989-08-13	478	https://en.wikipedia.org/wiki/1989_Hungarian_Grand_Prix	f	52	40	round_JeBVOUWp
479	11	Belgian Grand Prix	1989-08-27	479	https://en.wikipedia.org/wiki/1989_Belgian_Grand_Prix	f	5	40	round_yj4n8uHj
480	12	Italian Grand Prix	1989-09-10	480	https://en.wikipedia.org/wiki/1989_Italian_Grand_Prix	f	7	40	round_R4wNJdpx
481	13	Portuguese Grand Prix	1989-09-24	481	https://en.wikipedia.org/wiki/1989_Portuguese_Grand_Prix	f	49	40	round_HEJWsN5s
482	14	Spanish Grand Prix	1989-10-01	482	https://en.wikipedia.org/wiki/1989_Spanish_Grand_Prix	f	51	40	round_oXzVPGuq
483	15	Japanese Grand Prix	1989-10-22	483	https://en.wikipedia.org/wiki/1989_Japanese_Grand_Prix	f	53	40	round_rlF7RsZ8
484	16	Australian Grand Prix	1989-11-05	484	https://en.wikipedia.org/wiki/1989_Australian_Grand_Prix	f	50	40	round_3MKsDn8g
485	1	United States Grand Prix	1990-03-11	485	https://en.wikipedia.org/wiki/1990_United_States_Grand_Prix	f	54	41	round_mIslBUi3
486	2	Brazilian Grand Prix	1990-03-25	486	https://en.wikipedia.org/wiki/1990_Brazilian_Grand_Prix	f	37	41	round_JSWi6TW5
487	3	San Marino Grand Prix	1990-05-13	487	https://en.wikipedia.org/wiki/1990_San_Marino_Grand_Prix	f	45	41	round_Z8iLf8Yg
488	4	Monaco Grand Prix	1990-05-27	488	https://en.wikipedia.org/wiki/1990_Monaco_Grand_Prix	f	2	41	round_btpqFVFd
489	5	Canadian Grand Prix	1990-06-10	489	https://en.wikipedia.org/wiki/1990_Canadian_Grand_Prix	f	44	41	round_EpaYKEHx
490	6	Mexican Grand Prix	1990-06-24	490	https://en.wikipedia.org/wiki/1990_Mexican_Grand_Prix	f	23	41	round_Ej3lDnxk
491	7	French Grand Prix	1990-07-08	491	https://en.wikipedia.org/wiki/1990_French_Grand_Prix	f	35	41	round_cupq7Rwk
492	8	British Grand Prix	1990-07-15	492	https://en.wikipedia.org/wiki/1990_British_Grand_Prix	f	1	41	round_VumXI8Nq
493	9	German Grand Prix	1990-07-29	493	https://en.wikipedia.org/wiki/1990_German_Grand_Prix	f	33	41	round_7f1SoJI8
494	10	Hungarian Grand Prix	1990-08-12	494	https://en.wikipedia.org/wiki/1990_Hungarian_Grand_Prix	f	52	41	round_qwA1gass
495	11	Belgian Grand Prix	1990-08-26	495	https://en.wikipedia.org/wiki/1990_Belgian_Grand_Prix	f	5	41	round_wwRu11Uc
496	12	Italian Grand Prix	1990-09-09	496	https://en.wikipedia.org/wiki/1990_Italian_Grand_Prix	f	7	41	round_jnp8z7Dx
497	13	Portuguese Grand Prix	1990-09-23	497	https://en.wikipedia.org/wiki/1990_Portuguese_Grand_Prix	f	49	41	round_XBHlkhZA
498	14	Spanish Grand Prix	1990-09-30	498	https://en.wikipedia.org/wiki/1990_Spanish_Grand_Prix	f	51	41	round_EmkqNm45
499	15	Japanese Grand Prix	1990-10-21	499	https://en.wikipedia.org/wiki/1990_Japanese_Grand_Prix	f	53	41	round_CHxGe16J
500	16	Australian Grand Prix	1990-11-04	500	https://en.wikipedia.org/wiki/1990_Australian_Grand_Prix	f	50	41	round_7kt7LJ8D
501	1	United States Grand Prix	1991-03-10	501	https://en.wikipedia.org/wiki/1991_United_States_Grand_Prix	f	54	42	round_wSRbmJpE
502	2	Brazilian Grand Prix	1991-03-24	502	https://en.wikipedia.org/wiki/1991_Brazilian_Grand_Prix	f	37	42	round_Z4knUiOg
503	3	San Marino Grand Prix	1991-04-28	503	https://en.wikipedia.org/wiki/1991_San_Marino_Grand_Prix	f	45	42	round_BS1BveAg
504	4	Monaco Grand Prix	1991-05-12	504	https://en.wikipedia.org/wiki/1991_Monaco_Grand_Prix	f	2	42	round_62nHPqAF
505	5	Canadian Grand Prix	1991-06-02	505	https://en.wikipedia.org/wiki/1991_Canadian_Grand_Prix	f	44	42	round_Hf30W7a3
506	6	Mexican Grand Prix	1991-06-16	506	https://en.wikipedia.org/wiki/1991_Mexican_Grand_Prix	f	23	42	round_X0pdeRge
507	7	French Grand Prix	1991-07-07	507	https://en.wikipedia.org/wiki/1991_French_Grand_Prix	f	55	42	round_9YjlaZYe
508	8	British Grand Prix	1991-07-14	508	https://en.wikipedia.org/wiki/1991_British_Grand_Prix	f	1	42	round_uyIDfXXK
509	9	German Grand Prix	1991-07-28	509	https://en.wikipedia.org/wiki/1991_German_Grand_Prix	f	33	42	round_NkEGTHqt
510	10	Hungarian Grand Prix	1991-08-11	510	https://en.wikipedia.org/wiki/1991_Hungarian_Grand_Prix	f	52	42	round_G7jTgBdN
511	11	Belgian Grand Prix	1991-08-25	511	https://en.wikipedia.org/wiki/1991_Belgian_Grand_Prix	f	5	42	round_iTocS1W1
512	12	Italian Grand Prix	1991-09-08	512	https://en.wikipedia.org/wiki/1991_Italian_Grand_Prix	f	7	42	round_o9Tllio0
513	13	Portuguese Grand Prix	1991-09-22	513	https://en.wikipedia.org/wiki/1991_Portuguese_Grand_Prix	f	49	42	round_mBbUFB8G
514	14	Spanish Grand Prix	1991-09-29	514	https://en.wikipedia.org/wiki/1991_Spanish_Grand_Prix	f	56	42	round_1FghlxT1
515	15	Japanese Grand Prix	1991-10-20	515	https://en.wikipedia.org/wiki/1991_Japanese_Grand_Prix	f	53	42	round_0QOE6nfI
516	16	Australian Grand Prix	1991-11-03	516	https://en.wikipedia.org/wiki/1991_Australian_Grand_Prix	f	50	42	round_aqI0sm5X
517	1	South African Grand Prix	1992-03-01	517	https://en.wikipedia.org/wiki/1992_South_African_Grand_Prix	f	27	43	round_JsQBA2p4
518	2	Mexican Grand Prix	1992-03-22	518	https://en.wikipedia.org/wiki/1992_Mexican_Grand_Prix	f	23	43	round_Vsjo3N0h
519	3	Brazilian Grand Prix	1992-04-05	519	https://en.wikipedia.org/wiki/1992_Brazilian_Grand_Prix	f	37	43	round_jJAVwUTP
520	4	Spanish Grand Prix	1992-05-03	520	https://en.wikipedia.org/wiki/1992_Spanish_Grand_Prix	f	56	43	round_mnmrltP9
521	5	San Marino Grand Prix	1992-05-17	521	https://en.wikipedia.org/wiki/1992_San_Marino_Grand_Prix	f	45	43	round_xJFe1mq0
522	6	Monaco Grand Prix	1992-05-31	522	https://en.wikipedia.org/wiki/1992_Monaco_Grand_Prix	f	2	43	round_U5vmYKPQ
523	7	Canadian Grand Prix	1992-06-14	523	https://en.wikipedia.org/wiki/1992_Canadian_Grand_Prix	f	44	43	round_i5SFZeq1
524	8	French Grand Prix	1992-07-05	524	https://en.wikipedia.org/wiki/1992_French_Grand_Prix	f	55	43	round_ONAUjETj
525	9	British Grand Prix	1992-07-12	525	https://en.wikipedia.org/wiki/1992_British_Grand_Prix	f	1	43	round_9K2Zx6Hh
526	10	German Grand Prix	1992-07-26	526	https://en.wikipedia.org/wiki/1992_German_Grand_Prix	f	33	43	round_ez1CXF5Z
527	11	Hungarian Grand Prix	1992-08-16	527	https://en.wikipedia.org/wiki/1992_Hungarian_Grand_Prix	f	52	43	round_Ve4gFq9I
528	12	Belgian Grand Prix	1992-08-30	528	https://en.wikipedia.org/wiki/1992_Belgian_Grand_Prix	f	5	43	round_ZbDTjCy5
529	13	Italian Grand Prix	1992-09-13	529	https://en.wikipedia.org/wiki/1992_Italian_Grand_Prix	f	7	43	round_RzYFY57n
530	14	Portuguese Grand Prix	1992-09-27	530	https://en.wikipedia.org/wiki/1992_Portuguese_Grand_Prix	f	49	43	round_3KVgnl9d
531	15	Japanese Grand Prix	1992-10-25	531	https://en.wikipedia.org/wiki/1992_Japanese_Grand_Prix	f	53	43	round_PIty6owM
532	16	Australian Grand Prix	1992-11-08	532	https://en.wikipedia.org/wiki/1992_Australian_Grand_Prix	f	50	43	round_bsIEEMF6
533	1	South African Grand Prix	1993-03-14	533	https://en.wikipedia.org/wiki/1993_South_African_Grand_Prix	f	27	44	round_yHiMEqae
534	2	Brazilian Grand Prix	1993-03-28	534	https://en.wikipedia.org/wiki/1993_Brazilian_Grand_Prix	f	37	44	round_ONALpelD
535	3	European Grand Prix	1993-04-11	535	https://en.wikipedia.org/wiki/1993_European_Grand_Prix	f	57	44	round_SbiLPQYz
536	4	San Marino Grand Prix	1993-04-25	536	https://en.wikipedia.org/wiki/1993_San_Marino_Grand_Prix	f	45	44	round_hG3LDfJL
537	5	Spanish Grand Prix	1993-05-09	537	https://en.wikipedia.org/wiki/1993_Spanish_Grand_Prix	f	56	44	round_ZiZPyO4X
538	6	Monaco Grand Prix	1993-05-23	538	https://en.wikipedia.org/wiki/1993_Monaco_Grand_Prix	f	2	44	round_lsgCLNbB
539	7	Canadian Grand Prix	1993-06-13	539	https://en.wikipedia.org/wiki/1993_Canadian_Grand_Prix	f	44	44	round_rHI2B0p3
540	8	French Grand Prix	1993-07-04	540	https://en.wikipedia.org/wiki/1993_French_Grand_Prix	f	55	44	round_DdrSN6Vc
541	9	British Grand Prix	1993-07-11	541	https://en.wikipedia.org/wiki/1993_British_Grand_Prix	f	1	44	round_OyZ6B1NE
542	10	German Grand Prix	1993-07-25	542	https://en.wikipedia.org/wiki/1993_German_Grand_Prix	f	33	44	round_ipJt2r4F
543	11	Hungarian Grand Prix	1993-08-15	543	https://en.wikipedia.org/wiki/1993_Hungarian_Grand_Prix	f	52	44	round_v5Bdkz1K
544	12	Belgian Grand Prix	1993-08-29	544	https://en.wikipedia.org/wiki/1993_Belgian_Grand_Prix	f	5	44	round_LqsoHoUD
545	13	Italian Grand Prix	1993-09-12	545	https://en.wikipedia.org/wiki/1993_Italian_Grand_Prix	f	7	44	round_p8vCZYlA
546	14	Portuguese Grand Prix	1993-09-26	546	https://en.wikipedia.org/wiki/1993_Portuguese_Grand_Prix	f	49	44	round_lsrgoFaR
547	15	Japanese Grand Prix	1993-10-24	547	https://en.wikipedia.org/wiki/1993_Japanese_Grand_Prix	f	53	44	round_oGCFEswO
548	16	Australian Grand Prix	1993-11-07	548	https://en.wikipedia.org/wiki/1993_Australian_Grand_Prix	f	50	44	round_1G8Eqw8p
549	1	Brazilian Grand Prix	1994-03-27	549	https://en.wikipedia.org/wiki/1994_Brazilian_Grand_Prix	f	37	45	round_9MdzQ66Z
550	2	Pacific Grand Prix	1994-04-17	550	https://en.wikipedia.org/wiki/1994_Pacific_Grand_Prix	f	58	45	round_hD5OKKKY
551	3	San Marino Grand Prix	1994-05-01	551	https://en.wikipedia.org/wiki/1994_San_Marino_Grand_Prix	f	45	45	round_GOcGIbyp
552	4	Monaco Grand Prix	1994-05-15	552	https://en.wikipedia.org/wiki/1994_Monaco_Grand_Prix	f	2	45	round_Y36v8HYs
553	5	Spanish Grand Prix	1994-05-29	553	https://en.wikipedia.org/wiki/1994_Spanish_Grand_Prix	f	56	45	round_45dzL0YS
554	6	Canadian Grand Prix	1994-06-12	554	https://en.wikipedia.org/wiki/1994_Canadian_Grand_Prix	f	44	45	round_Xe8O0BSf
555	7	French Grand Prix	1994-07-03	555	https://en.wikipedia.org/wiki/1994_French_Grand_Prix	f	55	45	round_q7smWPZw
556	8	British Grand Prix	1994-07-10	556	https://en.wikipedia.org/wiki/1994_British_Grand_Prix	f	1	45	round_KUxZSMOq
557	9	German Grand Prix	1994-07-31	557	https://en.wikipedia.org/wiki/1994_German_Grand_Prix	f	33	45	round_1DkDUxE2
558	10	Hungarian Grand Prix	1994-08-14	558	https://en.wikipedia.org/wiki/1994_Hungarian_Grand_Prix	f	52	45	round_l3srWy9t
559	11	Belgian Grand Prix	1994-08-28	559	https://en.wikipedia.org/wiki/1994_Belgian_Grand_Prix	f	5	45	round_ijzmdnkP
560	12	Italian Grand Prix	1994-09-11	560	https://en.wikipedia.org/wiki/1994_Italian_Grand_Prix	f	7	45	round_b4tAgkxw
561	13	Portuguese Grand Prix	1994-09-25	561	https://en.wikipedia.org/wiki/1994_Portuguese_Grand_Prix	f	49	45	round_QTYEXHbK
562	14	European Grand Prix	1994-10-16	562	https://en.wikipedia.org/wiki/1994_European_Grand_Prix	f	51	45	round_G3AnJ08h
563	15	Japanese Grand Prix	1994-11-06	563	https://en.wikipedia.org/wiki/1994_Japanese_Grand_Prix	f	53	45	round_l7T3gDQ5
564	16	Australian Grand Prix	1994-11-13	564	https://en.wikipedia.org/wiki/1994_Australian_Grand_Prix	f	50	45	round_jy9sWsZi
565	1	Brazilian Grand Prix	1995-03-26	565	https://en.wikipedia.org/wiki/1995_Brazilian_Grand_Prix	f	37	46	round_JsBa8Xt7
566	2	Argentine Grand Prix	1995-04-09	566	https://en.wikipedia.org/wiki/1995_Argentine_Grand_Prix	f	12	46	round_TIDw3e3C
567	3	San Marino Grand Prix	1995-04-30	567	https://en.wikipedia.org/wiki/1995_San_Marino_Grand_Prix	f	45	46	round_CgJu5qaQ
568	4	Spanish Grand Prix	1995-05-14	568	https://en.wikipedia.org/wiki/1995_Spanish_Grand_Prix	f	56	46	round_VEZneR6R
569	5	Monaco Grand Prix	1995-05-28	569	https://en.wikipedia.org/wiki/1995_Monaco_Grand_Prix	f	2	46	round_pbLje7cQ
570	6	Canadian Grand Prix	1995-06-11	570	https://en.wikipedia.org/wiki/1995_Canadian_Grand_Prix	f	44	46	round_7O35gj6Y
571	7	French Grand Prix	1995-07-02	571	https://en.wikipedia.org/wiki/1995_French_Grand_Prix	f	55	46	round_HvegmjUV
572	8	British Grand Prix	1995-07-16	572	https://en.wikipedia.org/wiki/1995_British_Grand_Prix	f	1	46	round_cVH5Mt8U
573	9	German Grand Prix	1995-07-30	573	https://en.wikipedia.org/wiki/1995_German_Grand_Prix	f	33	46	round_YpPf7p0P
574	10	Hungarian Grand Prix	1995-08-13	574	https://en.wikipedia.org/wiki/1995_Hungarian_Grand_Prix	f	52	46	round_zXS8xvHx
575	11	Belgian Grand Prix	1995-08-27	575	https://en.wikipedia.org/wiki/1995_Belgian_Grand_Prix	f	5	46	round_84IQTSVb
576	12	Italian Grand Prix	1995-09-10	576	https://en.wikipedia.org/wiki/1995_Italian_Grand_Prix	f	7	46	round_7q4vmYkW
577	13	Portuguese Grand Prix	1995-09-24	577	https://en.wikipedia.org/wiki/1995_Portuguese_Grand_Prix	f	49	46	round_pXl6ENuS
578	14	European Grand Prix	1995-10-01	578	https://en.wikipedia.org/wiki/1995_European_Grand_Prix	f	8	46	round_ugIZAfA5
579	15	Pacific Grand Prix	1995-10-22	579	https://en.wikipedia.org/wiki/1995_Pacific_Grand_Prix	f	58	46	round_TJiVvBGO
580	16	Japanese Grand Prix	1995-10-29	580	https://en.wikipedia.org/wiki/1995_Japanese_Grand_Prix	f	53	46	round_LSlDDJbn
581	17	Australian Grand Prix	1995-11-12	581	https://en.wikipedia.org/wiki/1995_Australian_Grand_Prix	f	50	46	round_ZE5OPHNi
582	1	Australian Grand Prix	1996-03-10	582	https://en.wikipedia.org/wiki/1996_Australian_Grand_Prix	f	59	47	round_tjHOxBZm
583	2	Brazilian Grand Prix	1996-03-31	583	https://en.wikipedia.org/wiki/1996_Brazilian_Grand_Prix	f	37	47	round_lZrcQkFy
584	3	Argentine Grand Prix	1996-04-07	584	https://en.wikipedia.org/wiki/1996_Argentine_Grand_Prix	f	12	47	round_8T0tf1kU
585	4	European Grand Prix	1996-04-28	585	https://en.wikipedia.org/wiki/1996_European_Grand_Prix	f	8	47	round_GrQAMt85
586	5	San Marino Grand Prix	1996-05-05	586	https://en.wikipedia.org/wiki/1996_San_Marino_Grand_Prix	f	45	47	round_sHpvYjCm
587	6	Monaco Grand Prix	1996-05-19	587	https://en.wikipedia.org/wiki/1996_Monaco_Grand_Prix	f	2	47	round_kQjMNiVU
588	7	Spanish Grand Prix	1996-06-02	588	https://en.wikipedia.org/wiki/1996_Spanish_Grand_Prix	f	56	47	round_osVh046l
589	8	Canadian Grand Prix	1996-06-16	589	https://en.wikipedia.org/wiki/1996_Canadian_Grand_Prix	f	44	47	round_YhDGlmpo
590	9	French Grand Prix	1996-06-30	590	https://en.wikipedia.org/wiki/1996_French_Grand_Prix	f	55	47	round_jQ9vJtyP
591	10	British Grand Prix	1996-07-14	591	https://en.wikipedia.org/wiki/1996_British_Grand_Prix	f	1	47	round_0QQd1uCQ
592	11	German Grand Prix	1996-07-28	592	https://en.wikipedia.org/wiki/1996_German_Grand_Prix	f	33	47	round_F1tPKfs7
593	12	Hungarian Grand Prix	1996-08-11	593	https://en.wikipedia.org/wiki/1996_Hungarian_Grand_Prix	f	52	47	round_l2xxkpsd
594	13	Belgian Grand Prix	1996-08-25	594	https://en.wikipedia.org/wiki/1996_Belgian_Grand_Prix	f	5	47	round_Du3vVqXM
595	14	Italian Grand Prix	1996-09-08	595	https://en.wikipedia.org/wiki/1996_Italian_Grand_Prix	f	7	47	round_87xKyegu
596	15	Portuguese Grand Prix	1996-09-22	596	https://en.wikipedia.org/wiki/1996_Portuguese_Grand_Prix	f	49	47	round_YbdOB8kr
597	16	Japanese Grand Prix	1996-10-13	597	https://en.wikipedia.org/wiki/1996_Japanese_Grand_Prix	f	53	47	round_iADMPUg8
598	1	Australian Grand Prix	1997-03-09	598	https://en.wikipedia.org/wiki/1997_Australian_Grand_Prix	f	59	48	round_fSBPhtSf
599	2	Brazilian Grand Prix	1997-03-30	599	https://en.wikipedia.org/wiki/1997_Brazilian_Grand_Prix	f	37	48	round_ly13JN1S
600	3	Argentine Grand Prix	1997-04-13	600	https://en.wikipedia.org/wiki/1997_Argentine_Grand_Prix	f	12	48	round_m2ErPt9F
601	4	San Marino Grand Prix	1997-04-27	601	https://en.wikipedia.org/wiki/1997_San_Marino_Grand_Prix	f	45	48	round_sHNv0vAO
602	5	Monaco Grand Prix	1997-05-11	602	https://en.wikipedia.org/wiki/1997_Monaco_Grand_Prix	f	2	48	round_B8LtLjfn
603	6	Spanish Grand Prix	1997-05-25	603	https://en.wikipedia.org/wiki/1997_Spanish_Grand_Prix	f	56	48	round_3hbobmEF
604	7	Canadian Grand Prix	1997-06-15	604	https://en.wikipedia.org/wiki/1997_Canadian_Grand_Prix	f	44	48	round_USfj44ie
605	8	French Grand Prix	1997-06-29	605	https://en.wikipedia.org/wiki/1997_French_Grand_Prix	f	55	48	round_9M1rjXmY
606	9	British Grand Prix	1997-07-13	606	https://en.wikipedia.org/wiki/1997_British_Grand_Prix	f	1	48	round_YAwh2zLd
607	10	German Grand Prix	1997-07-27	607	https://en.wikipedia.org/wiki/1997_German_Grand_Prix	f	33	48	round_LyfSk3Bc
608	11	Hungarian Grand Prix	1997-08-10	608	https://en.wikipedia.org/wiki/1997_Hungarian_Grand_Prix	f	52	48	round_jZmZftX0
609	12	Belgian Grand Prix	1997-08-24	609	https://en.wikipedia.org/wiki/1997_Belgian_Grand_Prix	f	5	48	round_HXgGIQJx
610	13	Italian Grand Prix	1997-09-07	610	https://en.wikipedia.org/wiki/1997_Italian_Grand_Prix	f	7	48	round_d27f50qW
611	14	Austrian Grand Prix	1997-09-21	611	https://en.wikipedia.org/wiki/1997_Austrian_Grand_Prix	f	34	48	round_YDpEaDif
612	15	Luxembourg Grand Prix	1997-09-28	612	https://en.wikipedia.org/wiki/1997_Luxembourg_Grand_Prix	f	8	48	round_pUBHffiR
613	16	Japanese Grand Prix	1997-10-12	613	https://en.wikipedia.org/wiki/1997_Japanese_Grand_Prix	f	53	48	round_LK2b73yQ
614	17	European Grand Prix	1997-10-26	614	https://en.wikipedia.org/wiki/1997_European_Grand_Prix	f	51	48	round_rqE6We1Y
615	1	Australian Grand Prix	1998-03-08	615	https://en.wikipedia.org/wiki/1998_Australian_Grand_Prix	f	59	49	round_6FfQufaj
616	2	Brazilian Grand Prix	1998-03-29	616	https://en.wikipedia.org/wiki/1998_Brazilian_Grand_Prix	f	37	49	round_WGRugPYl
617	3	Argentine Grand Prix	1998-04-12	617	https://en.wikipedia.org/wiki/1998_Argentine_Grand_Prix	f	12	49	round_0QguLbzZ
618	4	San Marino Grand Prix	1998-04-26	618	https://en.wikipedia.org/wiki/1998_San_Marino_Grand_Prix	f	45	49	round_nYV4C7lA
619	5	Spanish Grand Prix	1998-05-10	619	https://en.wikipedia.org/wiki/1998_Spanish_Grand_Prix	f	56	49	round_gTztbKBK
620	6	Monaco Grand Prix	1998-05-24	620	https://en.wikipedia.org/wiki/1998_Monaco_Grand_Prix	f	2	49	round_0T4E99Ji
621	7	Canadian Grand Prix	1998-06-07	621	https://en.wikipedia.org/wiki/1998_Canadian_Grand_Prix	f	44	49	round_60rHyV6d
622	8	French Grand Prix	1998-06-28	622	https://en.wikipedia.org/wiki/1998_French_Grand_Prix	f	55	49	round_ziqbGxeW
623	9	British Grand Prix	1998-07-12	623	https://en.wikipedia.org/wiki/1998_British_Grand_Prix	f	1	49	round_RtayrXoU
624	10	Austrian Grand Prix	1998-07-26	624	https://en.wikipedia.org/wiki/1998_Austrian_Grand_Prix	f	34	49	round_yjtVHCC7
625	11	German Grand Prix	1998-08-02	625	https://en.wikipedia.org/wiki/1998_German_Grand_Prix	f	33	49	round_ZfOmAUV8
626	12	Hungarian Grand Prix	1998-08-16	626	https://en.wikipedia.org/wiki/1998_Hungarian_Grand_Prix	f	52	49	round_SQ9p19KG
627	13	Belgian Grand Prix	1998-08-30	627	https://en.wikipedia.org/wiki/1998_Belgian_Grand_Prix	f	5	49	round_DwLr9dKj
628	14	Italian Grand Prix	1998-09-13	628	https://en.wikipedia.org/wiki/1998_Italian_Grand_Prix	f	7	49	round_q7OD9Np5
629	15	Luxembourg Grand Prix	1998-09-27	629	https://en.wikipedia.org/wiki/1998_Luxembourg_Grand_Prix	f	8	49	round_TKjEd4jJ
630	16	Japanese Grand Prix	1998-11-01	630	https://en.wikipedia.org/wiki/1998_Japanese_Grand_Prix	f	53	49	round_Vw1zE9YE
631	1	Australian Grand Prix	1999-03-07	631	https://en.wikipedia.org/wiki/1999_Australian_Grand_Prix	f	59	50	round_6AJesX70
632	2	Brazilian Grand Prix	1999-04-11	632	https://en.wikipedia.org/wiki/1999_Brazilian_Grand_Prix	f	37	50	round_JMQJPuTC
633	3	San Marino Grand Prix	1999-05-02	633	https://en.wikipedia.org/wiki/1999_San_Marino_Grand_Prix	f	45	50	round_deZQ1fRU
634	4	Monaco Grand Prix	1999-05-16	634	https://en.wikipedia.org/wiki/1999_Monaco_Grand_Prix	f	2	50	round_jQUqng0l
635	5	Spanish Grand Prix	1999-05-30	635	https://en.wikipedia.org/wiki/1999_Spanish_Grand_Prix	f	56	50	round_SdBnZxY2
636	6	Canadian Grand Prix	1999-06-13	636	https://en.wikipedia.org/wiki/1999_Canadian_Grand_Prix	f	44	50	round_JiJcZUYQ
637	7	French Grand Prix	1999-06-27	637	https://en.wikipedia.org/wiki/1999_French_Grand_Prix	f	55	50	round_j5xrDK8j
638	8	British Grand Prix	1999-07-11	638	https://en.wikipedia.org/wiki/1999_British_Grand_Prix	f	1	50	round_h3vDAgRH
639	9	Austrian Grand Prix	1999-07-25	639	https://en.wikipedia.org/wiki/1999_Austrian_Grand_Prix	f	34	50	round_CvF4jDvI
640	10	German Grand Prix	1999-08-01	640	https://en.wikipedia.org/wiki/1999_German_Grand_Prix	f	33	50	round_2w2sHR3Q
641	11	Hungarian Grand Prix	1999-08-15	641	https://en.wikipedia.org/wiki/1999_Hungarian_Grand_Prix	f	52	50	round_TeKahPC0
642	12	Belgian Grand Prix	1999-08-29	642	https://en.wikipedia.org/wiki/1999_Belgian_Grand_Prix	f	5	50	round_0160aXaO
643	13	Italian Grand Prix	1999-09-12	643	https://en.wikipedia.org/wiki/1999_Italian_Grand_Prix	f	7	50	round_3vDhNDa5
644	14	European Grand Prix	1999-09-26	644	https://en.wikipedia.org/wiki/1999_European_Grand_Prix	f	8	50	round_JnN4Esrr
645	15	Malaysian Grand Prix	1999-10-17	645	https://en.wikipedia.org/wiki/1999_Malaysian_Grand_Prix	f	60	50	round_FZTdCGSy
646	16	Japanese Grand Prix	1999-10-31	646	https://en.wikipedia.org/wiki/1999_Japanese_Grand_Prix	f	53	50	round_qcT8MF6o
647	1	Australian Grand Prix	2000-03-12	647	https://en.wikipedia.org/wiki/2000_Australian_Grand_Prix	f	59	51	round_zANoAiQx
648	2	Brazilian Grand Prix	2000-03-26	648	https://en.wikipedia.org/wiki/2000_Brazilian_Grand_Prix	f	37	51	round_k34AW0Qy
649	3	San Marino Grand Prix	2000-04-09	649	https://en.wikipedia.org/wiki/2000_San_Marino_Grand_Prix	f	45	51	round_Z81kqp6R
650	4	British Grand Prix	2000-04-23	650	https://en.wikipedia.org/wiki/2000_British_Grand_Prix	f	1	51	round_Rx9ah2DY
651	5	Spanish Grand Prix	2000-05-07	651	https://en.wikipedia.org/wiki/2000_Spanish_Grand_Prix	f	56	51	round_fhNEkQEZ
652	6	European Grand Prix	2000-05-21	652	https://en.wikipedia.org/wiki/2000_European_Grand_Prix	f	8	51	round_hZXufrFU
653	7	Monaco Grand Prix	2000-06-04	653	https://en.wikipedia.org/wiki/2000_Monaco_Grand_Prix	f	2	51	round_RUy6GmFo
654	8	Canadian Grand Prix	2000-06-18	654	https://en.wikipedia.org/wiki/2000_Canadian_Grand_Prix	f	44	51	round_17pfReZl
655	9	French Grand Prix	2000-07-02	655	https://en.wikipedia.org/wiki/2000_French_Grand_Prix	f	55	51	round_zwtd0AR7
656	10	Austrian Grand Prix	2000-07-16	656	https://en.wikipedia.org/wiki/2000_Austrian_Grand_Prix	f	34	51	round_fuyUT5a1
657	11	German Grand Prix	2000-07-30	657	https://en.wikipedia.org/wiki/2000_German_Grand_Prix	f	33	51	round_qRIW9T5D
658	12	Hungarian Grand Prix	2000-08-13	658	https://en.wikipedia.org/wiki/2000_Hungarian_Grand_Prix	f	52	51	round_GeCSjoRh
659	13	Belgian Grand Prix	2000-08-27	659	https://en.wikipedia.org/wiki/2000_Belgian_Grand_Prix	f	5	51	round_tLzTHPTi
660	14	Italian Grand Prix	2000-09-10	660	https://en.wikipedia.org/wiki/2000_Italian_Grand_Prix	f	7	51	round_5NaKrE3s
661	15	United States Grand Prix	2000-09-24	661	https://en.wikipedia.org/wiki/2000_United_States_Grand_Prix	f	3	51	round_ThjDJPX4
662	16	Japanese Grand Prix	2000-10-08	662	https://en.wikipedia.org/wiki/2000_Japanese_Grand_Prix	f	53	51	round_IV4TJguw
663	17	Malaysian Grand Prix	2000-10-22	663	https://en.wikipedia.org/wiki/2000_Malaysian_Grand_Prix	f	60	51	round_zKXlGfXZ
664	1	Australian Grand Prix	2001-03-04	664	https://en.wikipedia.org/wiki/2001_Australian_Grand_Prix	f	59	52	round_OBAitQQT
665	2	Malaysian Grand Prix	2001-03-18	665	https://en.wikipedia.org/wiki/2001_Malaysian_Grand_Prix	f	60	52	round_0zKR8RpB
666	3	Brazilian Grand Prix	2001-04-01	666	https://en.wikipedia.org/wiki/2001_Brazilian_Grand_Prix	f	37	52	round_XcM0UmyW
667	4	San Marino Grand Prix	2001-04-15	667	https://en.wikipedia.org/wiki/2001_San_Marino_Grand_Prix	f	45	52	round_UsHYlekK
668	5	Spanish Grand Prix	2001-04-29	668	https://en.wikipedia.org/wiki/2001_Spanish_Grand_Prix	f	56	52	round_RY6f3d5Y
669	6	Austrian Grand Prix	2001-05-13	669	https://en.wikipedia.org/wiki/2001_Austrian_Grand_Prix	f	34	52	round_p9gWUGwQ
670	7	Monaco Grand Prix	2001-05-27	670	https://en.wikipedia.org/wiki/2001_Monaco_Grand_Prix	f	2	52	round_ZpyZzJ3C
671	8	Canadian Grand Prix	2001-06-10	671	https://en.wikipedia.org/wiki/2001_Canadian_Grand_Prix	f	44	52	round_rgC3OfB2
672	9	European Grand Prix	2001-06-24	672	https://en.wikipedia.org/wiki/2001_European_Grand_Prix	f	8	52	round_CqNzzFRB
673	10	French Grand Prix	2001-07-01	673	https://en.wikipedia.org/wiki/2001_French_Grand_Prix	f	55	52	round_r8XDEEk8
674	11	British Grand Prix	2001-07-15	674	https://en.wikipedia.org/wiki/2001_British_Grand_Prix	f	1	52	round_j4LkkMcp
675	12	German Grand Prix	2001-07-29	675	https://en.wikipedia.org/wiki/2001_German_Grand_Prix	f	33	52	round_lrXqsi6m
676	13	Hungarian Grand Prix	2001-08-19	676	https://en.wikipedia.org/wiki/2001_Hungarian_Grand_Prix	f	52	52	round_21BVxd3e
677	14	Belgian Grand Prix	2001-09-02	677	https://en.wikipedia.org/wiki/2001_Belgian_Grand_Prix	f	5	52	round_9cbFdVE9
678	15	Italian Grand Prix	2001-09-16	678	https://en.wikipedia.org/wiki/2001_Italian_Grand_Prix	f	7	52	round_EmLEUYgb
679	16	United States Grand Prix	2001-09-30	679	https://en.wikipedia.org/wiki/2001_United_States_Grand_Prix	f	3	52	round_U9MiPfbJ
680	17	Japanese Grand Prix	2001-10-14	680	https://en.wikipedia.org/wiki/2001_Japanese_Grand_Prix	f	53	52	round_wTrr5QRO
681	1	Australian Grand Prix	2002-03-03	681	https://en.wikipedia.org/wiki/2002_Australian_Grand_Prix	f	59	53	round_woAOP8K1
682	2	Malaysian Grand Prix	2002-03-17	682	https://en.wikipedia.org/wiki/2002_Malaysian_Grand_Prix	f	60	53	round_RdXIrbdn
683	3	Brazilian Grand Prix	2002-03-31	683	https://en.wikipedia.org/wiki/2002_Brazilian_Grand_Prix	f	37	53	round_JcFwq25n
684	4	San Marino Grand Prix	2002-04-14	684	https://en.wikipedia.org/wiki/2002_San_Marino_Grand_Prix	f	45	53	round_Uv6NlW1U
685	5	Spanish Grand Prix	2002-04-28	685	https://en.wikipedia.org/wiki/2002_Spanish_Grand_Prix	f	56	53	round_xsxtOCWJ
686	6	Austrian Grand Prix	2002-05-12	686	https://en.wikipedia.org/wiki/2002_Austrian_Grand_Prix	f	34	53	round_RRakwh9W
687	7	Monaco Grand Prix	2002-05-26	687	https://en.wikipedia.org/wiki/2002_Monaco_Grand_Prix	f	2	53	round_KqXAHlgP
688	8	Canadian Grand Prix	2002-06-09	688	https://en.wikipedia.org/wiki/2002_Canadian_Grand_Prix	f	44	53	round_W06KJR4J
689	9	European Grand Prix	2002-06-23	689	https://en.wikipedia.org/wiki/2002_European_Grand_Prix	f	8	53	round_sIgLhJi5
690	10	British Grand Prix	2002-07-07	690	https://en.wikipedia.org/wiki/2002_British_Grand_Prix	f	1	53	round_ppWWBZ27
691	11	French Grand Prix	2002-07-21	691	https://en.wikipedia.org/wiki/2002_French_Grand_Prix	f	55	53	round_Lqc0OY6J
692	12	German Grand Prix	2002-07-28	692	https://en.wikipedia.org/wiki/2002_German_Grand_Prix	f	33	53	round_EQ04uo6k
693	13	Hungarian Grand Prix	2002-08-18	693	https://en.wikipedia.org/wiki/2002_Hungarian_Grand_Prix	f	52	53	round_JhsG6dOF
694	14	Belgian Grand Prix	2002-09-01	694	https://en.wikipedia.org/wiki/2002_Belgian_Grand_Prix	f	5	53	round_td8jPBBR
695	15	Italian Grand Prix	2002-09-15	695	https://en.wikipedia.org/wiki/2002_Italian_Grand_Prix	f	7	53	round_sEhSTsDf
696	16	United States Grand Prix	2002-09-29	696	https://en.wikipedia.org/wiki/2002_United_States_Grand_Prix	f	3	53	round_0C2DqA3K
697	17	Japanese Grand Prix	2002-10-13	697	https://en.wikipedia.org/wiki/2002_Japanese_Grand_Prix	f	53	53	round_maMsEeeL
698	1	Australian Grand Prix	2003-03-09	698	https://en.wikipedia.org/wiki/2003_Australian_Grand_Prix	f	59	54	round_oNoJSXVS
699	2	Malaysian Grand Prix	2003-03-23	699	https://en.wikipedia.org/wiki/2003_Malaysian_Grand_Prix	f	60	54	round_JiaxL2sa
700	3	Brazilian Grand Prix	2003-04-06	700	https://en.wikipedia.org/wiki/2003_Brazilian_Grand_Prix	f	37	54	round_4pFnfwNN
701	4	San Marino Grand Prix	2003-04-20	701	https://en.wikipedia.org/wiki/2003_San_Marino_Grand_Prix	f	45	54	round_mXtwc8Ku
702	5	Spanish Grand Prix	2003-05-04	702	https://en.wikipedia.org/wiki/2003_Spanish_Grand_Prix	f	56	54	round_owYiuaym
703	6	Austrian Grand Prix	2003-05-18	703	https://en.wikipedia.org/wiki/2003_Austrian_Grand_Prix	f	34	54	round_IDd8DHmK
704	7	Monaco Grand Prix	2003-06-01	704	https://en.wikipedia.org/wiki/2003_Monaco_Grand_Prix	f	2	54	round_2alHoKav
705	8	Canadian Grand Prix	2003-06-15	705	https://en.wikipedia.org/wiki/2003_Canadian_Grand_Prix	f	44	54	round_jvmXo1Z1
706	9	European Grand Prix	2003-06-29	706	https://en.wikipedia.org/wiki/2003_European_Grand_Prix	f	8	54	round_fGzWOa6M
707	10	French Grand Prix	2003-07-06	707	https://en.wikipedia.org/wiki/2003_French_Grand_Prix	f	55	54	round_E0plLPU8
708	11	British Grand Prix	2003-07-20	708	https://en.wikipedia.org/wiki/2003_British_Grand_Prix	f	1	54	round_gy6n8Bwd
709	12	German Grand Prix	2003-08-03	709	https://en.wikipedia.org/wiki/2003_German_Grand_Prix	f	33	54	round_h2Ux3SOL
710	13	Hungarian Grand Prix	2003-08-24	710	https://en.wikipedia.org/wiki/2003_Hungarian_Grand_Prix	f	52	54	round_aOQbFRgO
711	14	Italian Grand Prix	2003-09-14	711	https://en.wikipedia.org/wiki/2003_Italian_Grand_Prix	f	7	54	round_Rfs2Hryq
712	15	United States Grand Prix	2003-09-28	712	https://en.wikipedia.org/wiki/2003_United_States_Grand_Prix	f	3	54	round_dOp9tDQb
713	16	Japanese Grand Prix	2003-10-12	713	https://en.wikipedia.org/wiki/2003_Japanese_Grand_Prix	f	53	54	round_rxIwDu4R
714	1	Australian Grand Prix	2004-03-07	714	https://en.wikipedia.org/wiki/2004_Australian_Grand_Prix	f	59	55	round_WoQrlcdi
715	2	Malaysian Grand Prix	2004-03-21	715	https://en.wikipedia.org/wiki/2004_Malaysian_Grand_Prix	f	60	55	round_FUkM9t5c
716	3	Bahrain Grand Prix	2004-04-04	716	https://en.wikipedia.org/wiki/2004_Bahrain_Grand_Prix	f	61	55	round_KSeQKb0r
717	4	San Marino Grand Prix	2004-04-25	717	https://en.wikipedia.org/wiki/2004_San_Marino_Grand_Prix	f	45	55	round_2gj3JEh5
718	5	Spanish Grand Prix	2004-05-09	718	https://en.wikipedia.org/wiki/2004_Spanish_Grand_Prix	f	56	55	round_4E34GcpD
719	6	Monaco Grand Prix	2004-05-23	719	https://en.wikipedia.org/wiki/2004_Monaco_Grand_Prix	f	2	55	round_PU92dtqa
720	7	European Grand Prix	2004-05-30	720	https://en.wikipedia.org/wiki/2004_European_Grand_Prix	f	8	55	round_x5K0IDxQ
721	8	Canadian Grand Prix	2004-06-13	721	https://en.wikipedia.org/wiki/2004_Canadian_Grand_Prix	f	44	55	round_8LmJ5WHH
722	9	United States Grand Prix	2004-06-20	722	https://en.wikipedia.org/wiki/2004_United_States_Grand_Prix	f	3	55	round_ngOzq06I
723	10	French Grand Prix	2004-07-04	723	https://en.wikipedia.org/wiki/2004_French_Grand_Prix	f	55	55	round_9DHXbQ63
724	11	British Grand Prix	2004-07-11	724	https://en.wikipedia.org/wiki/2004_British_Grand_Prix	f	1	55	round_iNsqqxKL
725	12	German Grand Prix	2004-07-25	725	https://en.wikipedia.org/wiki/2004_German_Grand_Prix	f	33	55	round_QKsb0e0v
726	13	Hungarian Grand Prix	2004-08-15	726	https://en.wikipedia.org/wiki/2004_Hungarian_Grand_Prix	f	52	55	round_BagG7Uwg
727	14	Belgian Grand Prix	2004-08-29	727	https://en.wikipedia.org/wiki/2004_Belgian_Grand_Prix	f	5	55	round_QesdHquT
728	15	Italian Grand Prix	2004-09-12	728	https://en.wikipedia.org/wiki/2004_Italian_Grand_Prix	f	7	55	round_UnLC9isZ
729	16	Chinese Grand Prix	2004-09-26	729	https://en.wikipedia.org/wiki/2004_Chinese_Grand_Prix	f	62	55	round_MV4TT7YP
730	17	Japanese Grand Prix	2004-10-10	730	https://en.wikipedia.org/wiki/2004_Japanese_Grand_Prix	f	53	55	round_wD6Uaai8
731	18	Brazilian Grand Prix	2004-10-24	731	https://en.wikipedia.org/wiki/2004_Brazilian_Grand_Prix	f	37	55	round_ziWq8cK6
732	1	Australian Grand Prix	2005-03-06	732	https://en.wikipedia.org/wiki/2005_Australian_Grand_Prix	f	59	56	round_KjBVg1r8
733	2	Malaysian Grand Prix	2005-03-20	733	https://en.wikipedia.org/wiki/2005_Malaysian_Grand_Prix	f	60	56	round_FX4jBuWu
734	3	Bahrain Grand Prix	2005-04-03	734	https://en.wikipedia.org/wiki/2005_Bahrain_Grand_Prix	f	61	56	round_ei4LfY7T
735	4	San Marino Grand Prix	2005-04-24	735	https://en.wikipedia.org/wiki/2005_San_Marino_Grand_Prix	f	45	56	round_ml8XAlNb
736	5	Spanish Grand Prix	2005-05-08	736	https://en.wikipedia.org/wiki/2005_Spanish_Grand_Prix	f	56	56	round_2af9GrIk
737	6	Monaco Grand Prix	2005-05-22	737	https://en.wikipedia.org/wiki/2005_Monaco_Grand_Prix	f	2	56	round_gILoIUwQ
738	7	European Grand Prix	2005-05-29	738	https://en.wikipedia.org/wiki/2005_European_Grand_Prix	f	8	56	round_yzAb4Z86
739	8	Canadian Grand Prix	2005-06-12	739	https://en.wikipedia.org/wiki/2005_Canadian_Grand_Prix	f	44	56	round_lAuk62bI
740	9	United States Grand Prix	2005-06-19	740	https://en.wikipedia.org/wiki/2005_United_States_Grand_Prix	f	3	56	round_lKmw1PAn
741	10	French Grand Prix	2005-07-03	741	https://en.wikipedia.org/wiki/2005_French_Grand_Prix	f	55	56	round_siThYx8u
742	11	British Grand Prix	2005-07-10	742	https://en.wikipedia.org/wiki/2005_British_Grand_Prix	f	1	56	round_yDksn09y
743	12	German Grand Prix	2005-07-24	743	https://en.wikipedia.org/wiki/2005_German_Grand_Prix	f	33	56	round_QEtAqhgo
744	13	Hungarian Grand Prix	2005-07-31	744	https://en.wikipedia.org/wiki/2005_Hungarian_Grand_Prix	f	52	56	round_Vu0Rlv9m
745	14	Turkish Grand Prix	2005-08-21	745	https://en.wikipedia.org/wiki/2005_Turkish_Grand_Prix	f	63	56	round_RyrN7DxF
746	15	Italian Grand Prix	2005-09-04	746	https://en.wikipedia.org/wiki/2005_Italian_Grand_Prix	f	7	56	round_IFjqxIQ3
747	16	Belgian Grand Prix	2005-09-11	747	https://en.wikipedia.org/wiki/2005_Belgian_Grand_Prix	f	5	56	round_JAvco2Vt
748	17	Brazilian Grand Prix	2005-09-25	748	https://en.wikipedia.org/wiki/2005_Brazilian_Grand_Prix	f	37	56	round_XpXqY1tL
749	18	Japanese Grand Prix	2005-10-09	749	https://en.wikipedia.org/wiki/2005_Japanese_Grand_Prix	f	53	56	round_5mavtJM4
750	19	Chinese Grand Prix	2005-10-16	750	https://en.wikipedia.org/wiki/2005_Chinese_Grand_Prix	f	62	56	round_YMyH5TKO
751	1	Bahrain Grand Prix	2006-03-12	751	https://en.wikipedia.org/wiki/2006_Bahrain_Grand_Prix	f	61	57	round_yNuvYJq1
752	2	Malaysian Grand Prix	2006-03-19	752	https://en.wikipedia.org/wiki/2006_Malaysian_Grand_Prix	f	60	57	round_04QZZnyE
753	3	Australian Grand Prix	2006-04-02	753	https://en.wikipedia.org/wiki/2006_Australian_Grand_Prix	f	59	57	round_MlBONjTH
754	4	San Marino Grand Prix	2006-04-23	754	https://en.wikipedia.org/wiki/2006_San_Marino_Grand_Prix	f	45	57	round_nq8BO8Uu
755	5	European Grand Prix	2006-05-07	755	https://en.wikipedia.org/wiki/2006_European_Grand_Prix	f	8	57	round_lKWPM6ej
756	6	Spanish Grand Prix	2006-05-14	756	https://en.wikipedia.org/wiki/2006_Spanish_Grand_Prix	f	56	57	round_pyzoipcS
757	7	Monaco Grand Prix	2006-05-28	757	https://en.wikipedia.org/wiki/2006_Monaco_Grand_Prix	f	2	57	round_1eBQQHNU
758	8	British Grand Prix	2006-06-11	758	https://en.wikipedia.org/wiki/2006_British_Grand_Prix	f	1	57	round_e0V7HGNP
759	9	Canadian Grand Prix	2006-06-25	759	https://en.wikipedia.org/wiki/2006_Canadian_Grand_Prix	f	44	57	round_zqddDl8l
760	10	United States Grand Prix	2006-07-02	760	https://en.wikipedia.org/wiki/2006_United_States_Grand_Prix	f	3	57	round_CasnHB6c
761	11	French Grand Prix	2006-07-16	761	https://en.wikipedia.org/wiki/2006_French_Grand_Prix	f	55	57	round_RzOZxVHg
762	12	German Grand Prix	2006-07-30	762	https://en.wikipedia.org/wiki/2006_German_Grand_Prix	f	33	57	round_nLEwNCev
763	13	Hungarian Grand Prix	2006-08-06	763	https://en.wikipedia.org/wiki/2006_Hungarian_Grand_Prix	f	52	57	round_p2Q5PjSC
764	14	Turkish Grand Prix	2006-08-27	764	https://en.wikipedia.org/wiki/2006_Turkish_Grand_Prix	f	63	57	round_Jz9HOoZJ
765	15	Italian Grand Prix	2006-09-10	765	https://en.wikipedia.org/wiki/2006_Italian_Grand_Prix	f	7	57	round_VP2QSpjC
766	16	Chinese Grand Prix	2006-10-01	766	https://en.wikipedia.org/wiki/2006_Chinese_Grand_Prix	f	62	57	round_0KOSHatz
767	17	Japanese Grand Prix	2006-10-08	767	https://en.wikipedia.org/wiki/2006_Japanese_Grand_Prix	f	53	57	round_iwh3RS9p
768	18	Brazilian Grand Prix	2006-10-22	768	https://en.wikipedia.org/wiki/2006_Brazilian_Grand_Prix	f	37	57	round_98pBt8vW
769	1	Australian Grand Prix	2007-03-18	769	https://en.wikipedia.org/wiki/2007_Australian_Grand_Prix	f	59	58	round_18gDuj7T
770	2	Malaysian Grand Prix	2007-04-08	770	https://en.wikipedia.org/wiki/2007_Malaysian_Grand_Prix	f	60	58	round_ksJRyzW4
771	3	Bahrain Grand Prix	2007-04-15	771	https://en.wikipedia.org/wiki/2007_Bahrain_Grand_Prix	f	61	58	round_Uj3MzWEK
772	4	Spanish Grand Prix	2007-05-13	772	https://en.wikipedia.org/wiki/2007_Spanish_Grand_Prix	f	56	58	round_TFYxEyTB
773	5	Monaco Grand Prix	2007-05-27	773	https://en.wikipedia.org/wiki/2007_Monaco_Grand_Prix	f	2	58	round_otguXXJW
774	6	Canadian Grand Prix	2007-06-10	774	https://en.wikipedia.org/wiki/2007_Canadian_Grand_Prix	f	44	58	round_OuVMVZiA
775	7	United States Grand Prix	2007-06-17	775	https://en.wikipedia.org/wiki/2007_United_States_Grand_Prix	f	3	58	round_ClJVL58x
776	8	French Grand Prix	2007-07-01	776	https://en.wikipedia.org/wiki/2007_French_Grand_Prix	f	55	58	round_2lEVcTuK
777	9	British Grand Prix	2007-07-08	777	https://en.wikipedia.org/wiki/2007_British_Grand_Prix	f	1	58	round_1HMku8On
778	10	European Grand Prix	2007-07-22	778	https://en.wikipedia.org/wiki/2007_European_Grand_Prix	f	8	58	round_MakNn0db
779	11	Hungarian Grand Prix	2007-08-05	779	https://en.wikipedia.org/wiki/2007_Hungarian_Grand_Prix	f	52	58	round_RdwDUIKM
780	12	Turkish Grand Prix	2007-08-26	780	https://en.wikipedia.org/wiki/2007_Turkish_Grand_Prix	f	63	58	round_nH1x1LSO
781	13	Italian Grand Prix	2007-09-09	781	https://en.wikipedia.org/wiki/2007_Italian_Grand_Prix	f	7	58	round_bFmhTQAE
782	14	Belgian Grand Prix	2007-09-16	782	https://en.wikipedia.org/wiki/2007_Belgian_Grand_Prix	f	5	58	round_e0MCQKNw
783	15	Japanese Grand Prix	2007-09-30	783	https://en.wikipedia.org/wiki/2007_Japanese_Grand_Prix	f	42	58	round_7EdyncHh
784	16	Chinese Grand Prix	2007-10-07	784	https://en.wikipedia.org/wiki/2007_Chinese_Grand_Prix	f	62	58	round_WM50adAC
785	17	Brazilian Grand Prix	2007-10-21	785	https://en.wikipedia.org/wiki/2007_Brazilian_Grand_Prix	f	37	58	round_dMsZb984
786	1	Australian Grand Prix	2008-03-16	786	https://en.wikipedia.org/wiki/2008_Australian_Grand_Prix	f	59	59	round_jFRx4Kqb
787	2	Malaysian Grand Prix	2008-03-23	787	https://en.wikipedia.org/wiki/2008_Malaysian_Grand_Prix	f	60	59	round_RTLDq4Nu
788	3	Bahrain Grand Prix	2008-04-06	788	https://en.wikipedia.org/wiki/2008_Bahrain_Grand_Prix	f	61	59	round_QUCex2Wm
789	4	Spanish Grand Prix	2008-04-27	789	https://en.wikipedia.org/wiki/2008_Spanish_Grand_Prix	f	56	59	round_9bxjTMvX
790	5	Turkish Grand Prix	2008-05-11	790	https://en.wikipedia.org/wiki/2008_Turkish_Grand_Prix	f	63	59	round_hb5uFh6q
791	6	Monaco Grand Prix	2008-05-25	791	https://en.wikipedia.org/wiki/2008_Monaco_Grand_Prix	f	2	59	round_8W5gqVWs
792	7	Canadian Grand Prix	2008-06-08	792	https://en.wikipedia.org/wiki/2008_Canadian_Grand_Prix	f	44	59	round_zkOaGT4S
793	8	French Grand Prix	2008-06-22	793	https://en.wikipedia.org/wiki/2008_French_Grand_Prix	f	55	59	round_PYK7LTKk
794	9	British Grand Prix	2008-07-06	794	https://en.wikipedia.org/wiki/2008_British_Grand_Prix	f	1	59	round_ly1ilRmF
795	10	German Grand Prix	2008-07-20	795	https://en.wikipedia.org/wiki/2008_German_Grand_Prix	f	33	59	round_NyQLaGER
796	11	Hungarian Grand Prix	2008-08-03	796	https://en.wikipedia.org/wiki/2008_Hungarian_Grand_Prix	f	52	59	round_wX7Zg39w
797	12	European Grand Prix	2008-08-24	797	https://en.wikipedia.org/wiki/2008_European_Grand_Prix	f	64	59	round_eqlmk4eN
798	13	Belgian Grand Prix	2008-09-07	798	https://en.wikipedia.org/wiki/2008_Belgian_Grand_Prix	f	5	59	round_Ne4ZSyhA
799	14	Italian Grand Prix	2008-09-14	799	https://en.wikipedia.org/wiki/2008_Italian_Grand_Prix	f	7	59	round_wBOuKOxW
800	15	Singapore Grand Prix	2008-09-28	800	https://en.wikipedia.org/wiki/2008_Singapore_Grand_Prix	f	65	59	round_dzJulxIB
801	16	Japanese Grand Prix	2008-10-12	801	https://en.wikipedia.org/wiki/2008_Japanese_Grand_Prix	f	42	59	round_gaNHOG2t
802	17	Chinese Grand Prix	2008-10-19	802	https://en.wikipedia.org/wiki/2008_Chinese_Grand_Prix	f	62	59	round_NPXMDsGr
803	18	Brazilian Grand Prix	2008-11-02	803	https://en.wikipedia.org/wiki/2008_Brazilian_Grand_Prix	f	37	59	round_xKeUE9kR
804	1	Australian Grand Prix	2009-03-29	804	https://en.wikipedia.org/wiki/2009_Australian_Grand_Prix	f	59	60	round_pQ6cIRE3
805	2	Malaysian Grand Prix	2009-04-05	805	https://en.wikipedia.org/wiki/2009_Malaysian_Grand_Prix	f	60	60	round_8aYS4h4L
806	3	Chinese Grand Prix	2009-04-19	806	https://en.wikipedia.org/wiki/2009_Chinese_Grand_Prix	f	62	60	round_qgSU9Alm
807	4	Bahrain Grand Prix	2009-04-26	807	https://en.wikipedia.org/wiki/2009_Bahrain_Grand_Prix	f	61	60	round_NoYq9x3D
808	5	Spanish Grand Prix	2009-05-10	808	https://en.wikipedia.org/wiki/2009_Spanish_Grand_Prix	f	56	60	round_q4DyZk5K
809	6	Monaco Grand Prix	2009-05-24	809	https://en.wikipedia.org/wiki/2009_Monaco_Grand_Prix	f	2	60	round_lK7vAoT4
810	7	Turkish Grand Prix	2009-06-07	810	https://en.wikipedia.org/wiki/2009_Turkish_Grand_Prix	f	63	60	round_d34d3twz
811	8	British Grand Prix	2009-06-21	811	https://en.wikipedia.org/wiki/2009_British_Grand_Prix	f	1	60	round_YtkflImu
812	9	German Grand Prix	2009-07-12	812	https://en.wikipedia.org/wiki/2009_German_Grand_Prix	f	8	60	round_AopQvlBr
813	10	Hungarian Grand Prix	2009-07-26	813	https://en.wikipedia.org/wiki/2009_Hungarian_Grand_Prix	f	52	60	round_Ells8Bhx
814	11	European Grand Prix	2009-08-23	814	https://en.wikipedia.org/wiki/2009_European_Grand_Prix	f	64	60	round_Xu4GaEAE
815	12	Belgian Grand Prix	2009-08-30	815	https://en.wikipedia.org/wiki/2009_Belgian_Grand_Prix	f	5	60	round_KHzreCkV
816	13	Italian Grand Prix	2009-09-13	816	https://en.wikipedia.org/wiki/2009_Italian_Grand_Prix	f	7	60	round_fEKNOvZr
817	14	Singapore Grand Prix	2009-09-27	817	https://en.wikipedia.org/wiki/2009_Singapore_Grand_Prix	f	65	60	round_5xzJMxjK
818	15	Japanese Grand Prix	2009-10-04	818	https://en.wikipedia.org/wiki/2009_Japanese_Grand_Prix	f	53	60	round_AB4zouCd
819	16	Brazilian Grand Prix	2009-10-18	819	https://en.wikipedia.org/wiki/2009_Brazilian_Grand_Prix	f	37	60	round_nAGH42nj
820	17	Abu Dhabi Grand Prix	2009-11-01	820	https://en.wikipedia.org/wiki/2009_Abu_Dhabi_Grand_Prix	f	66	60	round_NYrc4NjJ
821	1	Bahrain Grand Prix	2010-03-14	821	https://en.wikipedia.org/wiki/2010_Bahrain_Grand_Prix	f	61	61	round_QEXx9aIn
822	2	Australian Grand Prix	2010-03-28	822	https://en.wikipedia.org/wiki/2010_Australian_Grand_Prix	f	59	61	round_4FB8wXF6
823	3	Malaysian Grand Prix	2010-04-04	823	https://en.wikipedia.org/wiki/2010_Malaysian_Grand_Prix	f	60	61	round_yJ2GZeSQ
824	4	Chinese Grand Prix	2010-04-18	824	https://en.wikipedia.org/wiki/2010_Chinese_Grand_Prix	f	62	61	round_vfFZxtGR
825	5	Spanish Grand Prix	2010-05-09	825	https://en.wikipedia.org/wiki/2010_Spanish_Grand_Prix	f	56	61	round_IQ7v3iO1
826	6	Monaco Grand Prix	2010-05-16	826	https://en.wikipedia.org/wiki/2010_Monaco_Grand_Prix	f	2	61	round_ED5b6rPs
827	7	Turkish Grand Prix	2010-05-30	827	https://en.wikipedia.org/wiki/2010_Turkish_Grand_Prix	f	63	61	round_1U215rkf
828	8	Canadian Grand Prix	2010-06-13	828	https://en.wikipedia.org/wiki/2010_Canadian_Grand_Prix	f	44	61	round_LTXO6vQU
829	9	European Grand Prix	2010-06-27	829	https://en.wikipedia.org/wiki/2010_European_Grand_Prix	f	64	61	round_4pkUZima
830	10	British Grand Prix	2010-07-11	830	https://en.wikipedia.org/wiki/2010_British_Grand_Prix	f	1	61	round_T2hKiVqE
831	11	German Grand Prix	2010-07-25	831	https://en.wikipedia.org/wiki/2010_German_Grand_Prix	f	33	61	round_Ij0aNAcP
832	12	Hungarian Grand Prix	2010-08-01	832	https://en.wikipedia.org/wiki/2010_Hungarian_Grand_Prix	f	52	61	round_VzIp4Zoj
833	13	Belgian Grand Prix	2010-08-29	833	https://en.wikipedia.org/wiki/2010_Belgian_Grand_Prix	f	5	61	round_IaxmbG2f
834	14	Italian Grand Prix	2010-09-12	834	https://en.wikipedia.org/wiki/2010_Italian_Grand_Prix	f	7	61	round_leJKgMkF
835	15	Singapore Grand Prix	2010-09-26	835	https://en.wikipedia.org/wiki/2010_Singapore_Grand_Prix	f	65	61	round_nFHPIsJQ
836	16	Japanese Grand Prix	2010-10-10	836	https://en.wikipedia.org/wiki/2010_Japanese_Grand_Prix	f	53	61	round_RbxGf1V9
837	17	Korean Grand Prix	2010-10-24	837	https://en.wikipedia.org/wiki/2010_Korean_Grand_Prix	f	67	61	round_SwgnOPBu
838	18	Brazilian Grand Prix	2010-11-07	838	https://en.wikipedia.org/wiki/2010_Brazilian_Grand_Prix	f	37	61	round_sax5uPIR
839	19	Abu Dhabi Grand Prix	2010-11-14	839	https://en.wikipedia.org/wiki/2010_Abu_Dhabi_Grand_Prix	f	66	61	round_ornYQvul
840	1	Australian Grand Prix	2011-03-27	840	https://en.wikipedia.org/wiki/2011_Australian_Grand_Prix	f	59	62	round_lwZ5Zi7g
841	2	Malaysian Grand Prix	2011-04-10	841	https://en.wikipedia.org/wiki/2011_Malaysian_Grand_Prix	f	60	62	round_mROTfo6C
842	3	Chinese Grand Prix	2011-04-17	842	https://en.wikipedia.org/wiki/2011_Chinese_Grand_Prix	f	62	62	round_aUoLGFJS
843	4	Turkish Grand Prix	2011-05-08	843	https://en.wikipedia.org/wiki/2011_Turkish_Grand_Prix	f	63	62	round_nEyYtdQZ
844	5	Spanish Grand Prix	2011-05-22	844	https://en.wikipedia.org/wiki/2011_Spanish_Grand_Prix	f	56	62	round_7nCJsYYj
845	6	Monaco Grand Prix	2011-05-29	845	https://en.wikipedia.org/wiki/2011_Monaco_Grand_Prix	f	2	62	round_OY9e5l5g
846	7	Canadian Grand Prix	2011-06-12	846	https://en.wikipedia.org/wiki/2011_Canadian_Grand_Prix	f	44	62	round_li8B7wXA
847	8	European Grand Prix	2011-06-26	847	https://en.wikipedia.org/wiki/2011_European_Grand_Prix	f	64	62	round_WZAW9fxC
848	9	British Grand Prix	2011-07-10	848	https://en.wikipedia.org/wiki/2011_British_Grand_Prix	f	1	62	round_btz3NZcm
849	10	German Grand Prix	2011-07-24	849	https://en.wikipedia.org/wiki/2011_German_Grand_Prix	f	8	62	round_ZYGL8OEz
850	11	Hungarian Grand Prix	2011-07-31	850	https://en.wikipedia.org/wiki/2011_Hungarian_Grand_Prix	f	52	62	round_YLgE2Ihu
851	12	Belgian Grand Prix	2011-08-28	851	https://en.wikipedia.org/wiki/2011_Belgian_Grand_Prix	f	5	62	round_5mnx6KtO
852	13	Italian Grand Prix	2011-09-11	852	https://en.wikipedia.org/wiki/2011_Italian_Grand_Prix	f	7	62	round_iBzfVlYP
853	14	Singapore Grand Prix	2011-09-25	853	https://en.wikipedia.org/wiki/2011_Singapore_Grand_Prix	f	65	62	round_jwalM6PW
854	15	Japanese Grand Prix	2011-10-09	854	https://en.wikipedia.org/wiki/2011_Japanese_Grand_Prix	f	53	62	round_ru18lScn
855	16	Korean Grand Prix	2011-10-16	855	https://en.wikipedia.org/wiki/2011_Korean_Grand_Prix	f	67	62	round_ExB58lzZ
856	17	Indian Grand Prix	2011-10-30	856	https://en.wikipedia.org/wiki/2011_Indian_Grand_Prix	f	68	62	round_u9OlVb0b
857	18	Abu Dhabi Grand Prix	2011-11-13	857	https://en.wikipedia.org/wiki/2011_Abu_Dhabi_Grand_Prix	f	66	62	round_JxKFhV72
858	19	Brazilian Grand Prix	2011-11-27	858	https://en.wikipedia.org/wiki/2011_Brazilian_Grand_Prix	f	37	62	round_ZEZWGrfy
859	1	Australian Grand Prix	2012-03-18	859	https://en.wikipedia.org/wiki/2012_Australian_Grand_Prix	f	59	63	round_WcD680CX
860	2	Malaysian Grand Prix	2012-03-25	860	https://en.wikipedia.org/wiki/2012_Malaysian_Grand_Prix	f	60	63	round_jrSSiMrE
861	3	Chinese Grand Prix	2012-04-15	861	https://en.wikipedia.org/wiki/2012_Chinese_Grand_Prix	f	62	63	round_plk3XQGZ
862	4	Bahrain Grand Prix	2012-04-22	862	https://en.wikipedia.org/wiki/2012_Bahrain_Grand_Prix	f	61	63	round_agosrNZf
863	5	Spanish Grand Prix	2012-05-13	863	https://en.wikipedia.org/wiki/2012_Spanish_Grand_Prix	f	56	63	round_t8hjuuks
864	6	Monaco Grand Prix	2012-05-27	864	https://en.wikipedia.org/wiki/2012_Monaco_Grand_Prix	f	2	63	round_ogjoBc71
865	7	Canadian Grand Prix	2012-06-10	865	https://en.wikipedia.org/wiki/2012_Canadian_Grand_Prix	f	44	63	round_p0BlU6kd
866	8	European Grand Prix	2012-06-24	866	https://en.wikipedia.org/wiki/2012_European_Grand_Prix	f	64	63	round_2TUID2QZ
867	9	British Grand Prix	2012-07-08	867	https://en.wikipedia.org/wiki/2012_British_Grand_Prix	f	1	63	round_CeNT2Wrs
868	10	German Grand Prix	2012-07-22	868	https://en.wikipedia.org/wiki/2012_German_Grand_Prix	f	33	63	round_QrvRNP9d
869	11	Hungarian Grand Prix	2012-07-29	869	https://en.wikipedia.org/wiki/2012_Hungarian_Grand_Prix	f	52	63	round_TEwaldqz
870	12	Belgian Grand Prix	2012-09-02	870	https://en.wikipedia.org/wiki/2012_Belgian_Grand_Prix	f	5	63	round_Gy1pHVuU
871	13	Italian Grand Prix	2012-09-09	871	https://en.wikipedia.org/wiki/2012_Italian_Grand_Prix	f	7	63	round_nRQcn03P
872	14	Singapore Grand Prix	2012-09-23	872	https://en.wikipedia.org/wiki/2012_Singapore_Grand_Prix	f	65	63	round_MlSX5Cqw
873	15	Japanese Grand Prix	2012-10-07	873	https://en.wikipedia.org/wiki/2012_Japanese_Grand_Prix	f	53	63	round_Uuurp5XU
874	16	Korean Grand Prix	2012-10-14	874	https://en.wikipedia.org/wiki/2012_Korean_Grand_Prix	f	67	63	round_LB0RlBKp
875	17	Indian Grand Prix	2012-10-28	875	https://en.wikipedia.org/wiki/2012_Indian_Grand_Prix	f	68	63	round_SMbKKiI0
876	18	Abu Dhabi Grand Prix	2012-11-04	876	https://en.wikipedia.org/wiki/2012_Abu_Dhabi_Grand_Prix	f	66	63	round_NklvZXry
877	19	United States Grand Prix	2012-11-18	877	https://en.wikipedia.org/wiki/2012_United_States_Grand_Prix	f	69	63	round_kOP1JEyC
878	20	Brazilian Grand Prix	2012-11-25	878	https://en.wikipedia.org/wiki/2012_Brazilian_Grand_Prix	f	37	63	round_RG7y39bm
879	1	Australian Grand Prix	2013-03-17	879	https://en.wikipedia.org/wiki/2013_Australian_Grand_Prix	f	59	64	round_RON9sdd6
880	2	Malaysian Grand Prix	2013-03-24	880	https://en.wikipedia.org/wiki/2013_Malaysian_Grand_Prix	f	60	64	round_gXLFvO8q
881	3	Chinese Grand Prix	2013-04-14	881	https://en.wikipedia.org/wiki/2013_Chinese_Grand_Prix	f	62	64	round_uR4hY1Dm
882	4	Bahrain Grand Prix	2013-04-21	882	https://en.wikipedia.org/wiki/2013_Bahrain_Grand_Prix	f	61	64	round_6PaPwX5X
883	5	Spanish Grand Prix	2013-05-12	883	https://en.wikipedia.org/wiki/2013_Spanish_Grand_Prix	f	56	64	round_GUJ2Eudy
884	6	Monaco Grand Prix	2013-05-26	884	https://en.wikipedia.org/wiki/2013_Monaco_Grand_Prix	f	2	64	round_Y8oKZ6Dh
885	7	Canadian Grand Prix	2013-06-09	885	https://en.wikipedia.org/wiki/2013_Canadian_Grand_Prix	f	44	64	round_N0cU8ACS
886	8	British Grand Prix	2013-06-30	886	https://en.wikipedia.org/wiki/2013_British_Grand_Prix	f	1	64	round_ASc35UXm
887	9	German Grand Prix	2013-07-07	887	https://en.wikipedia.org/wiki/2013_German_Grand_Prix	f	8	64	round_OXL7VCrR
888	10	Hungarian Grand Prix	2013-07-28	888	https://en.wikipedia.org/wiki/2013_Hungarian_Grand_Prix	f	52	64	round_c43rtney
889	11	Belgian Grand Prix	2013-08-25	889	https://en.wikipedia.org/wiki/2013_Belgian_Grand_Prix	f	5	64	round_QJcrMC2B
890	12	Italian Grand Prix	2013-09-08	890	https://en.wikipedia.org/wiki/2013_Italian_Grand_Prix	f	7	64	round_SgHlsJEL
891	13	Singapore Grand Prix	2013-09-22	891	https://en.wikipedia.org/wiki/2013_Singapore_Grand_Prix	f	65	64	round_9WkjKkGO
892	14	Korean Grand Prix	2013-10-06	892	https://en.wikipedia.org/wiki/2013_Korean_Grand_Prix	f	67	64	round_ny8DDa5Z
893	15	Japanese Grand Prix	2013-10-13	893	https://en.wikipedia.org/wiki/2013_Japanese_Grand_Prix	f	53	64	round_swH0BgRu
894	16	Indian Grand Prix	2013-10-27	894	https://en.wikipedia.org/wiki/2013_Indian_Grand_Prix	f	68	64	round_k2d96J3c
895	17	Abu Dhabi Grand Prix	2013-11-03	895	https://en.wikipedia.org/wiki/2013_Abu_Dhabi_Grand_Prix	f	66	64	round_sn188KYw
896	18	United States Grand Prix	2013-11-17	896	https://en.wikipedia.org/wiki/2013_United_States_Grand_Prix	f	69	64	round_tKSC3c2j
897	19	Brazilian Grand Prix	2013-11-24	897	https://en.wikipedia.org/wiki/2013_Brazilian_Grand_Prix	f	37	64	round_VXkIl7Hk
898	1	Australian Grand Prix	2014-03-16	898	https://en.wikipedia.org/wiki/2014_Australian_Grand_Prix	f	59	65	round_IrB2EQYg
899	2	Malaysian Grand Prix	2014-03-30	899	https://en.wikipedia.org/wiki/2014_Malaysian_Grand_Prix	f	60	65	round_6U1AtyNo
900	3	Bahrain Grand Prix	2014-04-06	900	https://en.wikipedia.org/wiki/2014_Bahrain_Grand_Prix	f	61	65	round_67R9G7O3
901	4	Chinese Grand Prix	2014-04-20	901	https://en.wikipedia.org/wiki/2014_Chinese_Grand_Prix	f	62	65	round_WfUlgcrs
902	5	Spanish Grand Prix	2014-05-11	902	https://en.wikipedia.org/wiki/2014_Spanish_Grand_Prix	f	56	65	round_rpMy8Qu5
903	6	Monaco Grand Prix	2014-05-25	903	https://en.wikipedia.org/wiki/2014_Monaco_Grand_Prix	f	2	65	round_vhTEYjp2
904	7	Canadian Grand Prix	2014-06-08	904	https://en.wikipedia.org/wiki/2014_Canadian_Grand_Prix	f	44	65	round_zNrzNika
905	8	Austrian Grand Prix	2014-06-22	905	https://en.wikipedia.org/wiki/2014_Austrian_Grand_Prix	f	34	65	round_9TgZDq9U
906	9	British Grand Prix	2014-07-06	906	https://en.wikipedia.org/wiki/2014_British_Grand_Prix	f	1	65	round_08z3Yxe8
907	10	German Grand Prix	2014-07-20	907	https://en.wikipedia.org/wiki/2014_German_Grand_Prix	f	33	65	round_2QUtBmmG
908	11	Hungarian Grand Prix	2014-07-27	908	https://en.wikipedia.org/wiki/2014_Hungarian_Grand_Prix	f	52	65	round_NTnFKmVe
909	12	Belgian Grand Prix	2014-08-24	909	https://en.wikipedia.org/wiki/2014_Belgian_Grand_Prix	f	5	65	round_77sTnLW9
910	13	Italian Grand Prix	2014-09-07	910	https://en.wikipedia.org/wiki/2014_Italian_Grand_Prix	f	7	65	round_yx5JGqsc
911	14	Singapore Grand Prix	2014-09-21	911	https://en.wikipedia.org/wiki/2014_Singapore_Grand_Prix	f	65	65	round_CBkV1ZSd
912	15	Japanese Grand Prix	2014-10-05	912	https://en.wikipedia.org/wiki/2014_Japanese_Grand_Prix	f	53	65	round_ffmyhxvv
913	16	Russian Grand Prix	2014-10-12	913	https://en.wikipedia.org/wiki/2014_Russian_Grand_Prix	f	70	65	round_6IQMmMf3
914	17	United States Grand Prix	2014-11-02	914	https://en.wikipedia.org/wiki/2014_United_States_Grand_Prix	f	69	65	round_DPeZBEKm
915	18	Brazilian Grand Prix	2014-11-09	915	https://en.wikipedia.org/wiki/2014_Brazilian_Grand_Prix	f	37	65	round_gQJZUG60
916	19	Abu Dhabi Grand Prix	2014-11-23	916	https://en.wikipedia.org/wiki/2014_Abu_Dhabi_Grand_Prix	f	66	65	round_IQEJg1F7
917	1	Australian Grand Prix	2015-03-15	917	https://en.wikipedia.org/wiki/2015_Australian_Grand_Prix	f	59	66	round_QBP0gKFw
918	2	Malaysian Grand Prix	2015-03-29	918	https://en.wikipedia.org/wiki/2015_Malaysian_Grand_Prix	f	60	66	round_WQEvd2zL
919	3	Chinese Grand Prix	2015-04-12	919	https://en.wikipedia.org/wiki/2015_Chinese_Grand_Prix	f	62	66	round_fl9S5fxx
920	4	Bahrain Grand Prix	2015-04-19	920	https://en.wikipedia.org/wiki/2015_Bahrain_Grand_Prix	f	61	66	round_0g5G9vmx
921	5	Spanish Grand Prix	2015-05-10	921	https://en.wikipedia.org/wiki/2015_Spanish_Grand_Prix	f	56	66	round_YCCtfMUL
922	6	Monaco Grand Prix	2015-05-24	922	https://en.wikipedia.org/wiki/2015_Monaco_Grand_Prix	f	2	66	round_m51VNlyd
923	7	Canadian Grand Prix	2015-06-07	923	https://en.wikipedia.org/wiki/2015_Canadian_Grand_Prix	f	44	66	round_MR69oLAM
924	8	Austrian Grand Prix	2015-06-21	924	https://en.wikipedia.org/wiki/2015_Austrian_Grand_Prix	f	34	66	round_yD0uMcwu
925	9	British Grand Prix	2015-07-05	925	https://en.wikipedia.org/wiki/2015_British_Grand_Prix	f	1	66	round_pOYBbFsT
926	10	Hungarian Grand Prix	2015-07-26	926	https://en.wikipedia.org/wiki/2015_Hungarian_Grand_Prix	f	52	66	round_cJ84HvUt
927	11	Belgian Grand Prix	2015-08-23	927	https://en.wikipedia.org/wiki/2015_Belgian_Grand_Prix	f	5	66	round_jOFYeS4r
928	12	Italian Grand Prix	2015-09-06	928	https://en.wikipedia.org/wiki/2015_Italian_Grand_Prix	f	7	66	round_2Ro3RNGS
929	13	Singapore Grand Prix	2015-09-20	929	https://en.wikipedia.org/wiki/2015_Singapore_Grand_Prix	f	65	66	round_WZ5Q25Fd
930	14	Japanese Grand Prix	2015-09-27	930	https://en.wikipedia.org/wiki/2015_Japanese_Grand_Prix	f	53	66	round_41LINOec
931	15	Russian Grand Prix	2015-10-11	931	https://en.wikipedia.org/wiki/2015_Russian_Grand_Prix	f	70	66	round_09oB8XA6
932	16	United States Grand Prix	2015-10-25	932	https://en.wikipedia.org/wiki/2015_United_States_Grand_Prix	f	69	66	round_68t0X4IA
933	17	Mexican Grand Prix	2015-11-01	933	https://en.wikipedia.org/wiki/2015_Mexican_Grand_Prix	f	23	66	round_x2BNwunh
934	18	Brazilian Grand Prix	2015-11-15	934	https://en.wikipedia.org/wiki/2015_Brazilian_Grand_Prix	f	37	66	round_KqicxK84
935	19	Abu Dhabi Grand Prix	2015-11-29	935	https://en.wikipedia.org/wiki/2015_Abu_Dhabi_Grand_Prix	f	66	66	round_EEWPwVr6
936	1	Australian Grand Prix	2016-03-20	936	https://en.wikipedia.org/wiki/2016_Australian_Grand_Prix	f	59	67	round_lmc7h59i
937	2	Bahrain Grand Prix	2016-04-03	937	https://en.wikipedia.org/wiki/2016_Bahrain_Grand_Prix	f	61	67	round_bmaqml4B
938	3	Chinese Grand Prix	2016-04-17	938	https://en.wikipedia.org/wiki/2016_Chinese_Grand_Prix	f	62	67	round_Zmdxr4xu
939	4	Russian Grand Prix	2016-05-01	939	https://en.wikipedia.org/wiki/2016_Russian_Grand_Prix	f	70	67	round_1IBY5edo
940	5	Spanish Grand Prix	2016-05-15	940	https://en.wikipedia.org/wiki/2016_Spanish_Grand_Prix	f	56	67	round_jqG9zZ8n
941	6	Monaco Grand Prix	2016-05-29	941	https://en.wikipedia.org/wiki/2016_Monaco_Grand_Prix	f	2	67	round_jDiToWXq
942	7	Canadian Grand Prix	2016-06-12	942	https://en.wikipedia.org/wiki/2016_Canadian_Grand_Prix	f	44	67	round_zff0kPjX
943	8	European Grand Prix	2016-06-19	943	https://en.wikipedia.org/wiki/2016_European_Grand_Prix	f	71	67	round_SqT7MMo3
944	9	Austrian Grand Prix	2016-07-03	944	https://en.wikipedia.org/wiki/2016_Austrian_Grand_Prix	f	34	67	round_r94MSyoy
945	10	British Grand Prix	2016-07-10	945	https://en.wikipedia.org/wiki/2016_British_Grand_Prix	f	1	67	round_PFl6e3sR
946	11	Hungarian Grand Prix	2016-07-24	946	https://en.wikipedia.org/wiki/2016_Hungarian_Grand_Prix	f	52	67	round_1t2Stm5L
947	12	German Grand Prix	2016-07-31	947	https://en.wikipedia.org/wiki/2016_German_Grand_Prix	f	33	67	round_LaAznLM7
948	13	Belgian Grand Prix	2016-08-28	948	https://en.wikipedia.org/wiki/2016_Belgian_Grand_Prix	f	5	67	round_PrtP1GnR
949	14	Italian Grand Prix	2016-09-04	949	https://en.wikipedia.org/wiki/2016_Italian_Grand_Prix	f	7	67	round_RSzHNML8
950	15	Singapore Grand Prix	2016-09-18	950	https://en.wikipedia.org/wiki/2016_Singapore_Grand_Prix	f	65	67	round_VUSBSe1T
951	16	Malaysian Grand Prix	2016-10-02	951	https://en.wikipedia.org/wiki/2016_Malaysian_Grand_Prix	f	60	67	round_H9p1LISY
952	17	Japanese Grand Prix	2016-10-09	952	https://en.wikipedia.org/wiki/2016_Japanese_Grand_Prix	f	53	67	round_761Q08ZZ
953	18	United States Grand Prix	2016-10-23	953	https://en.wikipedia.org/wiki/2016_United_States_Grand_Prix	f	69	67	round_m0ksTZj0
954	19	Mexican Grand Prix	2016-10-30	954	https://en.wikipedia.org/wiki/2016_Mexican_Grand_Prix	f	23	67	round_cpt5hO62
955	20	Brazilian Grand Prix	2016-11-13	955	https://en.wikipedia.org/wiki/2016_Brazilian_Grand_Prix	f	37	67	round_rNgnE6k3
956	21	Abu Dhabi Grand Prix	2016-11-27	956	https://en.wikipedia.org/wiki/2016_Abu_Dhabi_Grand_Prix	f	66	67	round_qSfXLBqZ
957	1	Australian Grand Prix	2017-03-26	957	https://en.wikipedia.org/wiki/2017_Australian_Grand_Prix	f	59	68	round_E3BxJuFl
958	2	Chinese Grand Prix	2017-04-09	958	https://en.wikipedia.org/wiki/2017_Chinese_Grand_Prix	f	62	68	round_2vhN4UQj
959	3	Bahrain Grand Prix	2017-04-16	959	https://en.wikipedia.org/wiki/2017_Bahrain_Grand_Prix	f	61	68	round_WtvZVQ2x
960	4	Russian Grand Prix	2017-04-30	960	https://en.wikipedia.org/wiki/2017_Russian_Grand_Prix	f	70	68	round_mfE0Zuvm
961	5	Spanish Grand Prix	2017-05-14	961	https://en.wikipedia.org/wiki/2017_Spanish_Grand_Prix	f	56	68	round_QL26SDms
962	6	Monaco Grand Prix	2017-05-28	962	https://en.wikipedia.org/wiki/2017_Monaco_Grand_Prix	f	2	68	round_Qb5pmn8g
963	7	Canadian Grand Prix	2017-06-11	963	https://en.wikipedia.org/wiki/2017_Canadian_Grand_Prix	f	44	68	round_kdaSTYhm
964	8	Azerbaijan Grand Prix	2017-06-25	964	https://en.wikipedia.org/wiki/2017_Azerbaijan_Grand_Prix	f	71	68	round_Y4ABYB2a
965	9	Austrian Grand Prix	2017-07-09	965	https://en.wikipedia.org/wiki/2017_Austrian_Grand_Prix	f	34	68	round_c7eCRGOl
966	10	British Grand Prix	2017-07-16	966	https://en.wikipedia.org/wiki/2017_British_Grand_Prix	f	1	68	round_GNjR8NA1
967	11	Hungarian Grand Prix	2017-07-30	967	https://en.wikipedia.org/wiki/2017_Hungarian_Grand_Prix	f	52	68	round_hfL5GbNx
968	12	Belgian Grand Prix	2017-08-27	968	https://en.wikipedia.org/wiki/2017_Belgian_Grand_Prix	f	5	68	round_fN1rnp49
969	13	Italian Grand Prix	2017-09-03	969	https://en.wikipedia.org/wiki/2017_Italian_Grand_Prix	f	7	68	round_jfBsYkAt
970	14	Singapore Grand Prix	2017-09-17	970	https://en.wikipedia.org/wiki/2017_Singapore_Grand_Prix	f	65	68	round_CZ5BKDFn
971	15	Malaysian Grand Prix	2017-10-01	971	https://en.wikipedia.org/wiki/2017_Malaysian_Grand_Prix	f	60	68	round_iMWgK8AU
972	16	Japanese Grand Prix	2017-10-08	972	https://en.wikipedia.org/wiki/2017_Japanese_Grand_Prix	f	53	68	round_dMOC7d8A
973	17	United States Grand Prix	2017-10-22	973	https://en.wikipedia.org/wiki/2017_United_States_Grand_Prix	f	69	68	round_4ZEfVhnW
974	18	Mexican Grand Prix	2017-10-29	974	https://en.wikipedia.org/wiki/2017_Mexican_Grand_Prix	f	23	68	round_sxpPpMOC
975	19	Brazilian Grand Prix	2017-11-12	975	https://en.wikipedia.org/wiki/2017_Brazilian_Grand_Prix	f	37	68	round_pRRJVeZ4
976	20	Abu Dhabi Grand Prix	2017-11-26	976	https://en.wikipedia.org/wiki/2017_Abu_Dhabi_Grand_Prix	f	66	68	round_J0aBd38y
977	1	Australian Grand Prix	2018-03-25	977	https://en.wikipedia.org/wiki/2018_Australian_Grand_Prix	f	59	69	round_XIa7yXyR
978	2	Bahrain Grand Prix	2018-04-08	978	https://en.wikipedia.org/wiki/2018_Bahrain_Grand_Prix	f	61	69	round_mnqB99Jo
979	3	Chinese Grand Prix	2018-04-15	979	https://en.wikipedia.org/wiki/2018_Chinese_Grand_Prix	f	62	69	round_fO9gy1Ba
980	4	Azerbaijan Grand Prix	2018-04-29	980	https://en.wikipedia.org/wiki/2018_Azerbaijan_Grand_Prix	f	71	69	round_yvIDxJkW
981	5	Spanish Grand Prix	2018-05-13	981	https://en.wikipedia.org/wiki/2018_Spanish_Grand_Prix	f	56	69	round_0MLs2UEg
982	6	Monaco Grand Prix	2018-05-27	982	https://en.wikipedia.org/wiki/2018_Monaco_Grand_Prix	f	2	69	round_yAR2zMKV
983	7	Canadian Grand Prix	2018-06-10	983	https://en.wikipedia.org/wiki/2018_Canadian_Grand_Prix	f	44	69	round_5UilIdiL
984	8	French Grand Prix	2018-06-24	984	https://en.wikipedia.org/wiki/2018_French_Grand_Prix	f	35	69	round_L7vMOCZO
985	9	Austrian Grand Prix	2018-07-01	985	https://en.wikipedia.org/wiki/2018_Austrian_Grand_Prix	f	34	69	round_MrstuMP9
986	10	British Grand Prix	2018-07-08	986	https://en.wikipedia.org/wiki/2018_British_Grand_Prix	f	1	69	round_DxHRhgFq
987	11	German Grand Prix	2018-07-22	987	https://en.wikipedia.org/wiki/2018_German_Grand_Prix	f	33	69	round_BSXm6ahu
988	12	Hungarian Grand Prix	2018-07-29	988	https://en.wikipedia.org/wiki/2018_Hungarian_Grand_Prix	f	52	69	round_CPnDQOaH
989	13	Belgian Grand Prix	2018-08-26	989	https://en.wikipedia.org/wiki/2018_Belgian_Grand_Prix	f	5	69	round_y1eSeS9V
990	14	Italian Grand Prix	2018-09-02	990	https://en.wikipedia.org/wiki/2018_Italian_Grand_Prix	f	7	69	round_EDU1CRg6
991	15	Singapore Grand Prix	2018-09-16	991	https://en.wikipedia.org/wiki/2018_Singapore_Grand_Prix	f	65	69	round_eWUPVCB5
992	16	Russian Grand Prix	2018-09-30	992	https://en.wikipedia.org/wiki/2018_Russian_Grand_Prix	f	70	69	round_nWxt3xv8
993	17	Japanese Grand Prix	2018-10-07	993	https://en.wikipedia.org/wiki/2018_Japanese_Grand_Prix	f	53	69	round_HVAZboNY
994	18	United States Grand Prix	2018-10-21	994	https://en.wikipedia.org/wiki/2018_United_States_Grand_Prix	f	69	69	round_6rZHc9nb
995	19	Mexican Grand Prix	2018-10-28	995	https://en.wikipedia.org/wiki/2018_Mexican_Grand_Prix	f	23	69	round_PSlqQZek
996	20	Brazilian Grand Prix	2018-11-11	996	https://en.wikipedia.org/wiki/2018_Brazilian_Grand_Prix	f	37	69	round_bsqdxKcr
997	21	Abu Dhabi Grand Prix	2018-11-25	997	https://en.wikipedia.org/wiki/2018_Abu_Dhabi_Grand_Prix	f	66	69	round_xT5INLas
998	1	Australian Grand Prix	2019-03-17	998	https://en.wikipedia.org/wiki/2019_Australian_Grand_Prix	f	59	70	round_CHw5ZAL0
999	2	Bahrain Grand Prix	2019-03-31	999	https://en.wikipedia.org/wiki/2019_Bahrain_Grand_Prix	f	61	70	round_qLLZsShi
1000	3	Chinese Grand Prix	2019-04-14	1000	https://en.wikipedia.org/wiki/2019_Chinese_Grand_Prix	f	62	70	round_OJ6VLulD
1001	4	Azerbaijan Grand Prix	2019-04-28	1001	https://en.wikipedia.org/wiki/2019_Azerbaijan_Grand_Prix	f	71	70	round_L53bO89h
1002	5	Spanish Grand Prix	2019-05-12	1002	https://en.wikipedia.org/wiki/2019_Spanish_Grand_Prix	f	56	70	round_Yc8MksVt
1003	6	Monaco Grand Prix	2019-05-26	1003	https://en.wikipedia.org/wiki/2019_Monaco_Grand_Prix	f	2	70	round_8ijCKfpp
1004	7	Canadian Grand Prix	2019-06-09	1004	https://en.wikipedia.org/wiki/2019_Canadian_Grand_Prix	f	44	70	round_Kh3bbwo7
1005	8	French Grand Prix	2019-06-23	1005	https://en.wikipedia.org/wiki/2019_French_Grand_Prix	f	35	70	round_3zbXkM7k
1006	9	Austrian Grand Prix	2019-06-30	1006	https://en.wikipedia.org/wiki/2019_Austrian_Grand_Prix	f	34	70	round_sOXxZamb
1007	10	British Grand Prix	2019-07-14	1007	https://en.wikipedia.org/wiki/2019_British_Grand_Prix	f	1	70	round_rMQ9p8ID
1008	11	German Grand Prix	2019-07-28	1008	https://en.wikipedia.org/wiki/2019_German_Grand_Prix	f	33	70	round_xj694Jb8
1009	12	Hungarian Grand Prix	2019-08-04	1009	https://en.wikipedia.org/wiki/2019_Hungarian_Grand_Prix	f	52	70	round_oWqCkt0i
1010	13	Belgian Grand Prix	2019-09-01	1010	https://en.wikipedia.org/wiki/2019_Belgian_Grand_Prix	f	5	70	round_nXpg9ptd
1011	14	Italian Grand Prix	2019-09-08	1011	https://en.wikipedia.org/wiki/2019_Italian_Grand_Prix	f	7	70	round_jVoOMeJ1
1012	15	Singapore Grand Prix	2019-09-22	1012	https://en.wikipedia.org/wiki/2019_Singapore_Grand_Prix	f	65	70	round_vq2uRGHo
1013	16	Russian Grand Prix	2019-09-29	1013	https://en.wikipedia.org/wiki/2019_Russian_Grand_Prix	f	70	70	round_XKPwXiIT
1014	17	Japanese Grand Prix	2019-10-13	1014	https://en.wikipedia.org/wiki/2019_Japanese_Grand_Prix	f	53	70	round_YpHJlPal
1015	18	Mexican Grand Prix	2019-10-27	1015	https://en.wikipedia.org/wiki/2019_Mexican_Grand_Prix	f	23	70	round_kNKC1xob
1016	19	United States Grand Prix	2019-11-03	1016	https://en.wikipedia.org/wiki/2019_United_States_Grand_Prix	f	69	70	round_xJyjE3Z3
1017	20	Brazilian Grand Prix	2019-11-17	1017	https://en.wikipedia.org/wiki/2019_Brazilian_Grand_Prix	f	37	70	round_sBBgCbZl
1018	21	Abu Dhabi Grand Prix	2019-12-01	1018	https://en.wikipedia.org/wiki/2019_Abu_Dhabi_Grand_Prix	f	66	70	round_Xc5CT4sB
1019	1	Austrian Grand Prix	2020-07-05	1019	https://en.wikipedia.org/wiki/2020_Austrian_Grand_Prix	f	34	71	round_NbepOL3v
1020	2	Styrian Grand Prix	2020-07-12	1020	https://en.wikipedia.org/wiki/2020_Styrian_Grand_Prix	f	34	71	round_DZ0PmFbB
1021	3	Hungarian Grand Prix	2020-07-19	1021	https://en.wikipedia.org/wiki/2020_Hungarian_Grand_Prix	f	52	71	round_Y4fVDded
1022	4	British Grand Prix	2020-08-02	1022	https://en.wikipedia.org/wiki/2020_British_Grand_Prix	f	1	71	round_h2m5RZmG
1023	5	70th Anniversary Grand Prix	2020-08-09	1023	https://en.wikipedia.org/wiki/70th_Anniversary_Grand_Prix	f	1	71	round_auZsqk9s
1024	6	Spanish Grand Prix	2020-08-16	1024	https://en.wikipedia.org/wiki/2020_Spanish_Grand_Prix	f	56	71	round_w9ujp2pa
1025	7	Belgian Grand Prix	2020-08-30	1025	https://en.wikipedia.org/wiki/2020_Belgian_Grand_Prix	f	5	71	round_0SZbQmzy
1026	8	Italian Grand Prix	2020-09-06	1026	https://en.wikipedia.org/wiki/2020_Italian_Grand_Prix	f	7	71	round_9bmkfMx2
1027	9	Tuscan Grand Prix	2020-09-13	1027	https://en.wikipedia.org/wiki/2020_Tuscan_Grand_Prix	f	72	71	round_8721dULg
1028	10	Russian Grand Prix	2020-09-27	1028	https://en.wikipedia.org/wiki/2020_Russian_Grand_Prix	f	70	71	round_aB45iWYb
1029	11	Eifel Grand Prix	2020-10-11	1029	https://en.wikipedia.org/wiki/2020_Eifel_Grand_Prix	f	8	71	round_VeY57gAo
1030	12	Portuguese Grand Prix	2020-10-25	1030	https://en.wikipedia.org/wiki/2020_Portuguese_Grand_Prix	f	73	71	round_iCHe3N2c
1031	13	Emilia Romagna Grand Prix	2020-11-01	1031	https://en.wikipedia.org/wiki/2020_Emilia_Romagna_Grand_Prix	f	45	71	round_oC8Spv62
1032	14	Turkish Grand Prix	2020-11-15	1032	https://en.wikipedia.org/wiki/2020_Turkish_Grand_Prix	f	63	71	round_PDQNRWaW
1033	15	Bahrain Grand Prix	2020-11-29	1033	https://en.wikipedia.org/wiki/2020_Bahrain_Grand_Prix	f	61	71	round_7zEW7lbR
1034	16	Sakhir Grand Prix	2020-12-06	1034	https://en.wikipedia.org/wiki/2020_Sakhir_Grand_Prix	f	61	71	round_5AQ8DdK0
1035	17	Abu Dhabi Grand Prix	2020-12-13	1035	https://en.wikipedia.org/wiki/2020_Abu_Dhabi_Grand_Prix	f	66	71	round_qyGozq7t
1036	1	Bahrain Grand Prix	2021-03-28	1036	https://en.wikipedia.org/wiki/2021_Bahrain_Grand_Prix	f	61	72	round_3plLtO9q
1037	2	Emilia Romagna Grand Prix	2021-04-18	1037	https://en.wikipedia.org/wiki/2021_Emilia_Romagna_Grand_Prix	f	45	72	round_QFU3vnLm
1038	3	Portuguese Grand Prix	2021-05-02	1038	https://en.wikipedia.org/wiki/2021_Portuguese_Grand_Prix	f	73	72	round_JFQErZy4
1039	4	Spanish Grand Prix	2021-05-09	1039	https://en.wikipedia.org/wiki/2021_Spanish_Grand_Prix	f	56	72	round_NEQVoBhQ
1040	5	Monaco Grand Prix	2021-05-23	1040	https://en.wikipedia.org/wiki/2021_Monaco_Grand_Prix	f	2	72	round_XA5G8yUe
1041	6	Azerbaijan Grand Prix	2021-06-06	1041	https://en.wikipedia.org/wiki/2021_Azerbaijan_Grand_Prix	f	71	72	round_ubCpAlXE
1042	7	French Grand Prix	2021-06-20	1042	https://en.wikipedia.org/wiki/2021_French_Grand_Prix	f	35	72	round_rJRzeVK6
1043	8	Styrian Grand Prix	2021-06-27	1043	https://en.wikipedia.org/wiki/2021_Styrian_Grand_Prix	f	34	72	round_NwqN4oaV
1044	9	Austrian Grand Prix	2021-07-04	1044	https://en.wikipedia.org/wiki/2021_Austrian_Grand_Prix	f	34	72	round_iONQP1Qm
1045	10	British Grand Prix	2021-07-18	1045	https://en.wikipedia.org/wiki/2021_British_Grand_Prix	f	1	72	round_5dMZqjJT
1046	11	Hungarian Grand Prix	2021-08-01	1046	https://en.wikipedia.org/wiki/2021_Hungarian_Grand_Prix	f	52	72	round_d7NZmKp8
1047	12	Belgian Grand Prix	2021-08-29	1047	https://en.wikipedia.org/wiki/2021_Belgian_Grand_Prix	f	5	72	round_tZSSo7yW
1048	13	Dutch Grand Prix	2021-09-05	1048	https://en.wikipedia.org/wiki/2021_Dutch_Grand_Prix	f	11	72	round_hJsb8NT3
1049	14	Italian Grand Prix	2021-09-12	1049	https://en.wikipedia.org/wiki/2021_Italian_Grand_Prix	f	7	72	round_x290u9UG
1050	15	Russian Grand Prix	2021-09-26	1050	https://en.wikipedia.org/wiki/2021_Russian_Grand_Prix	f	70	72	round_hnsugLs6
1051	16	Turkish Grand Prix	2021-10-10	1051	https://en.wikipedia.org/wiki/2021_Turkish_Grand_Prix	f	63	72	round_vLGuTVvC
1052	17	United States Grand Prix	2021-10-24	1052	https://en.wikipedia.org/wiki/2021_United_States_Grand_Prix	f	69	72	round_gJW2vEjm
1053	18	Mexico City Grand Prix	2021-11-07	1053	https://en.wikipedia.org/wiki/2021_Mexico_City_Grand_Prix	f	23	72	round_i03de420
1054	19	São Paulo Grand Prix	2021-11-14	1054	https://en.wikipedia.org/wiki/2021_S%C3%A3o_Paulo_Grand_Prix	f	37	72	round_msjAOFti
1055	20	Qatar Grand Prix	2021-11-21	1055	https://en.wikipedia.org/wiki/2021_Qatar_Grand_Prix	f	74	72	round_voHHQWzL
1056	21	Saudi Arabian Grand Prix	2021-12-05	1056	https://en.wikipedia.org/wiki/2021_Saudi_Arabian_Grand_Prix	f	75	72	round_gwrfrayE
1057	22	Abu Dhabi Grand Prix	2021-12-12	1057	https://en.wikipedia.org/wiki/2021_Abu_Dhabi_Grand_Prix	f	66	72	round_szG1clrK
1058	1	Bahrain Grand Prix	2022-03-20	1058	https://en.wikipedia.org/wiki/2022_Bahrain_Grand_Prix	f	61	73	round_g6FMosCS
1059	2	Saudi Arabian Grand Prix	2022-03-27	1059	https://en.wikipedia.org/wiki/2022_Saudi_Arabian_Grand_Prix	f	75	73	round_ANAnRYZQ
1060	3	Australian Grand Prix	2022-04-10	1060	https://en.wikipedia.org/wiki/2022_Australian_Grand_Prix	f	59	73	round_Ogz0dz07
1061	4	Emilia Romagna Grand Prix	2022-04-24	1061	https://en.wikipedia.org/wiki/2022_Emilia_Romagna_Grand_Prix	f	45	73	round_5Dqgm3Dv
1062	5	Miami Grand Prix	2022-05-08	1062	https://en.wikipedia.org/wiki/2022_Miami_Grand_Prix	f	76	73	round_b7bAWgFf
1063	6	Spanish Grand Prix	2022-05-22	1063	https://en.wikipedia.org/wiki/2022_Spanish_Grand_Prix	f	56	73	round_erXHWXqM
1064	7	Monaco Grand Prix	2022-05-29	1064	https://en.wikipedia.org/wiki/2022_Monaco_Grand_Prix	f	2	73	round_R1FZK2ko
1065	8	Azerbaijan Grand Prix	2022-06-12	1065	https://en.wikipedia.org/wiki/2022_Azerbaijan_Grand_Prix	f	71	73	round_M6icVNvJ
1066	9	Canadian Grand Prix	2022-06-19	1066	https://en.wikipedia.org/wiki/2022_Canadian_Grand_Prix	f	44	73	round_DRhkUwWY
1067	10	British Grand Prix	2022-07-03	1067	https://en.wikipedia.org/wiki/2022_British_Grand_Prix	f	1	73	round_FwgR0BiZ
1068	11	Austrian Grand Prix	2022-07-10	1068	https://en.wikipedia.org/wiki/2022_Austrian_Grand_Prix	f	34	73	round_361gjFAr
1069	12	French Grand Prix	2022-07-24	1069	https://en.wikipedia.org/wiki/2022_French_Grand_Prix	f	35	73	round_8dBBN5c8
1070	13	Hungarian Grand Prix	2022-07-31	1070	https://en.wikipedia.org/wiki/2022_Hungarian_Grand_Prix	f	52	73	round_u4ZzSqn0
1071	14	Belgian Grand Prix	2022-08-28	1071	https://en.wikipedia.org/wiki/2022_Belgian_Grand_Prix	f	5	73	round_966aYxJm
1072	15	Dutch Grand Prix	2022-09-04	1072	https://en.wikipedia.org/wiki/2022_Dutch_Grand_Prix	f	11	73	round_uaYT3FWm
1073	16	Italian Grand Prix	2022-09-11	1073	https://en.wikipedia.org/wiki/2022_Italian_Grand_Prix	f	7	73	round_zO2wPbL7
1074	17	Singapore Grand Prix	2022-10-02	1074	https://en.wikipedia.org/wiki/2022_Singapore_Grand_Prix	f	65	73	round_uEN2fJdi
1075	18	Japanese Grand Prix	2022-10-09	1075	https://en.wikipedia.org/wiki/2022_Japanese_Grand_Prix	f	53	73	round_1PyCqGDK
1076	19	United States Grand Prix	2022-10-23	1076	https://en.wikipedia.org/wiki/2022_United_States_Grand_Prix	f	69	73	round_Zieh11Gu
1077	20	Mexico City Grand Prix	2022-10-30	1077	https://en.wikipedia.org/wiki/2022_Mexico_City_Grand_Prix	f	23	73	round_5vW2Z9GU
1078	21	São Paulo Grand Prix	2022-11-13	1078	https://en.wikipedia.org/wiki/2022_São_Paulo_Grand_Prix	f	37	73	round_Ng6iBJC3
1079	22	Abu Dhabi Grand Prix	2022-11-20	1079	https://en.wikipedia.org/wiki/2022_Abu_Dhabi_Grand_Prix	f	66	73	round_CLgAh1z9
1080	1	Bahrain Grand Prix	2023-03-05	1080	https://en.wikipedia.org/wiki/2023_Bahrain_Grand_Prix	f	61	74	round_ECtF5LRN
1081	2	Saudi Arabian Grand Prix	2023-03-19	1081	https://en.wikipedia.org/wiki/2023_Saudi_Arabian_Grand_Prix	f	75	74	round_xpfTt9Uo
1082	3	Australian Grand Prix	2023-04-02	1082	https://en.wikipedia.org/wiki/2023_Australian_Grand_Prix	f	59	74	round_eEefUSCH
1083	4	Azerbaijan Grand Prix	2023-04-30	1083	https://en.wikipedia.org/wiki/2023_Azerbaijan_Grand_Prix	f	71	74	round_Qo4mZcO4
1084	5	Miami Grand Prix	2023-05-07	1084	https://en.wikipedia.org/wiki/2023_Miami_Grand_Prix	f	76	74	round_rrNiOhSX
1085	6	Monaco Grand Prix	2023-05-28	1085	https://en.wikipedia.org/wiki/2023_Monaco_Grand_Prix	f	2	74	round_W901eAq5
1086	7	Spanish Grand Prix	2023-06-04	1086	https://en.wikipedia.org/wiki/2023_Spanish_Grand_Prix	f	56	74	round_jejxFu9R
1087	8	Canadian Grand Prix	2023-06-18	1087	https://en.wikipedia.org/wiki/2023_Canadian_Grand_Prix	f	44	74	round_TbRvK9dw
1088	9	Austrian Grand Prix	2023-07-02	1088	https://en.wikipedia.org/wiki/2023_Austrian_Grand_Prix	f	34	74	round_fAeP6ODW
1089	10	British Grand Prix	2023-07-09	1089	https://en.wikipedia.org/wiki/2023_British_Grand_Prix	f	1	74	round_0hYZFLEe
1090	11	Hungarian Grand Prix	2023-07-23	1090	https://en.wikipedia.org/wiki/2023_Hungarian_Grand_Prix	f	52	74	round_HQn8g1bp
1091	12	Belgian Grand Prix	2023-07-30	1091	https://en.wikipedia.org/wiki/2023_Belgian_Grand_Prix	f	5	74	round_KcblGuXV
1092	13	Dutch Grand Prix	2023-08-27	1092	https://en.wikipedia.org/wiki/2023_Dutch_Grand_Prix	f	11	74	round_Qwwlg9HF
1093	14	Italian Grand Prix	2023-09-03	1093	https://en.wikipedia.org/wiki/2023_Italian_Grand_Prix	f	7	74	round_P0ED1whN
1094	15	Singapore Grand Prix	2023-09-17	1094	https://en.wikipedia.org/wiki/2023_Singapore_Grand_Prix	f	65	74	round_MYqaYles
1095	16	Japanese Grand Prix	2023-09-24	1095	https://en.wikipedia.org/wiki/2023_Japanese_Grand_Prix	f	53	74	round_Pdv2T3mt
1096	17	Qatar Grand Prix	2023-10-08	1096	https://en.wikipedia.org/wiki/2023_Qatar_Grand_Prix	f	74	74	round_Tw4kpden
1097	18	United States Grand Prix	2023-10-22	1097	https://en.wikipedia.org/wiki/2023_United_States_Grand_Prix	f	69	74	round_MAyHMo0y
1098	19	Mexico City Grand Prix	2023-10-29	1098	https://en.wikipedia.org/wiki/2023_Mexico_City_Grand_Prix	f	23	74	round_QtdffE2o
1099	20	São Paulo Grand Prix	2023-11-05	1099	https://en.wikipedia.org/wiki/2023_S%C3%A3o_Paulo_Grand_Prix	f	37	74	round_CIV5JIoH
1100	21	Las Vegas Grand Prix	2023-11-19	1100	https://en.wikipedia.org/wiki/2023_Las_Vegas_Grand_Prix	f	77	74	round_OkQBWG40
1101	22	Abu Dhabi Grand Prix	2023-11-26	1101	https://en.wikipedia.org/wiki/2023_Abu_Dhabi_Grand_Prix	f	66	74	round_sbdchvkQ
1102	1	Bahrain Grand Prix	2024-03-02	1102	https://en.wikipedia.org/wiki/2024_Bahrain_Grand_Prix	f	61	75	round_7LG7vMDL
1103	2	Saudi Arabian Grand Prix	2024-03-09	1103	https://en.wikipedia.org/wiki/2024_Saudi_Arabian_Grand_Prix	f	75	75	round_3KERyFEN
1104	3	Australian Grand Prix	2024-03-24	1104	https://en.wikipedia.org/wiki/2024_Australian_Grand_Prix	f	59	75	round_ESCOpm2c
1105	4	Japanese Grand Prix	2024-04-07	1105	https://en.wikipedia.org/wiki/2024_Japanese_Grand_Prix	f	53	75	round_nEJzgYYk
1106	5	Chinese Grand Prix	2024-04-21	1106	https://en.wikipedia.org/wiki/2024_Chinese_Grand_Prix	f	62	75	round_Mzir85pu
1107	6	Miami Grand Prix	2024-05-05	1107	https://en.wikipedia.org/wiki/2024_Miami_Grand_Prix	f	76	75	round_EcDLWoLX
1108	7	Emilia Romagna Grand Prix	2024-05-19	1108	https://en.wikipedia.org/wiki/2024_Emilia_Romagna_Grand_Prix	f	45	75	round_HB3AD6Sj
1109	8	Monaco Grand Prix	2024-05-26	1109	https://en.wikipedia.org/wiki/2024_Monaco_Grand_Prix	f	2	75	round_SbtsUsqR
1110	9	Canadian Grand Prix	2024-06-09	1110	https://en.wikipedia.org/wiki/2024_Canadian_Grand_Prix	f	44	75	round_Inb2tNRh
1111	10	Spanish Grand Prix	2024-06-23	1111	https://en.wikipedia.org/wiki/2024_Spanish_Grand_Prix	f	56	75	round_U2AEEOto
1112	11	Austrian Grand Prix	2024-06-30	1112	https://en.wikipedia.org/wiki/2024_Austrian_Grand_Prix	f	34	75	round_OL8vB4yf
1113	12	British Grand Prix	2024-07-07	1113	https://en.wikipedia.org/wiki/2024_British_Grand_Prix	f	1	75	round_zLKVOgM6
1114	13	Hungarian Grand Prix	2024-07-21	1114	https://en.wikipedia.org/wiki/2024_Hungarian_Grand_Prix	f	52	75	round_j94qxHX7
1115	14	Belgian Grand Prix	2024-07-28	1115	https://en.wikipedia.org/wiki/2024_Belgian_Grand_Prix	f	5	75	round_1jr8Ya60
1116	15	Dutch Grand Prix	2024-08-25	1116	https://en.wikipedia.org/wiki/2024_Dutch_Grand_Prix	f	11	75	round_tkuAFHYR
1117	16	Italian Grand Prix	2024-09-01	1117	https://en.wikipedia.org/wiki/2024_Italian_Grand_Prix	f	7	75	round_0EUtlueB
1118	17	Azerbaijan Grand Prix	2024-09-15	1118	https://en.wikipedia.org/wiki/2024_Azerbaijan_Grand_Prix	f	71	75	round_zmtDqRJQ
1119	18	Singapore Grand Prix	2024-09-22	1119	https://en.wikipedia.org/wiki/2024_Singapore_Grand_Prix	f	65	75	round_woeeo2Ko
1120	19	United States Grand Prix	2024-10-20	1120	https://en.wikipedia.org/wiki/2024_United_States_Grand_Prix	f	69	75	round_xoqdl3SE
1121	20	Mexico City Grand Prix	2024-10-27	1121	https://en.wikipedia.org/wiki/2024_Mexico_City_Grand_Prix	f	23	75	round_JPdu4reO
1122	21	São Paulo Grand Prix	2024-11-03	1122	https://en.wikipedia.org/wiki/2024_S%C3%A3o_Paulo_Grand_Prix	f	37	75	round_ru9fn2AY
1123	22	Las Vegas Grand Prix	2024-11-23	1123	https://en.wikipedia.org/wiki/2024_Las_Vegas_Grand_Prix	f	77	75	round_GS5qjJAd
1124	23	Qatar Grand Prix	2024-12-01	1124	https://en.wikipedia.org/wiki/2024_Qatar_Grand_Prix	f	74	75	round_zwXFsR6N
1125	24	Abu Dhabi Grand Prix	2024-12-08	1125	https://en.wikipedia.org/wiki/2024_Abu_Dhabi_Grand_Prix	f	66	75	round_pk6yzh65
1126	1	Australian Grand Prix	2025-03-16	1126	https://en.wikipedia.org/wiki/2025_Australian_Grand_Prix	f	59	76	round_o8hVRhyD
1127	2	Chinese Grand Prix	2025-03-23	1127	https://en.wikipedia.org/wiki/2025_Chinese_Grand_Prix	f	62	76	round_qeHJwsLt
1128	3	Japanese Grand Prix	2025-04-06	1128	https://en.wikipedia.org/wiki/2025_Japanese_Grand_Prix	f	53	76	round_ACPPMICt
1129	4	Bahrain Grand Prix	2025-04-13	1129	https://en.wikipedia.org/wiki/2025_Bahrain_Grand_Prix	f	61	76	round_Ps0NYVtI
1130	5	Saudi Arabian Grand Prix	2025-04-20	1130	https://en.wikipedia.org/wiki/2025_Saudi_Arabian_Grand_Prix	f	75	76	round_aMsooP3B
1131	6	Miami Grand Prix	2025-05-04	1131	https://en.wikipedia.org/wiki/2025_Miami_Grand_Prix	f	76	76	round_BlTmWZnZ
1132	7	Emilia Romagna Grand Prix	2025-05-18	1132	https://en.wikipedia.org/wiki/2025_Emilia_Romagna_Grand_Prix	f	45	76	round_1cGKl3n5
1133	8	Monaco Grand Prix	2025-05-25	1133	https://en.wikipedia.org/wiki/2025_Monaco_Grand_Prix	f	2	76	round_hgM9vutr
1134	9	Spanish Grand Prix	2025-06-01	1134	https://en.wikipedia.org/wiki/2025_Spanish_Grand_Prix	f	56	76	round_UttnpexN
1135	10	Canadian Grand Prix	2025-06-15	1135	https://en.wikipedia.org/wiki/2025_Canadian_Grand_Prix	f	44	76	round_dX2GBelZ
1136	11	Austrian Grand Prix	2025-06-29	1136	https://en.wikipedia.org/wiki/2025_Austrian_Grand_Prix	f	34	76	round_6dOsIQNf
1137	12	British Grand Prix	2025-07-06	1137	https://en.wikipedia.org/wiki/2025_British_Grand_Prix	f	1	76	round_7WfRgZOn
1138	13	Belgian Grand Prix	2025-07-27	1138	https://en.wikipedia.org/wiki/2025_Belgian_Grand_Prix	f	5	76	round_ITLQXJwB
1139	14	Hungarian Grand Prix	2025-08-03	1139	https://en.wikipedia.org/wiki/2025_Hungarian_Grand_Prix	f	52	76	round_xfKQlOqf
1140	15	Dutch Grand Prix	2025-08-31	1140	https://en.wikipedia.org/wiki/2025_Dutch_Grand_Prix	f	11	76	round_QuXj6jaQ
1141	16	Italian Grand Prix	2025-09-07	1141	https://en.wikipedia.org/wiki/2025_Italian_Grand_Prix	f	7	76	round_uCSCkDO5
1142	17	Azerbaijan Grand Prix	2025-09-21	1142	https://en.wikipedia.org/wiki/2025_Azerbaijan_Grand_Prix	f	71	76	round_NepHP1jY
1143	18	Singapore Grand Prix	2025-10-05	1143	https://en.wikipedia.org/wiki/2025_Singapore_Grand_Prix	f	65	76	round_IF7rdAdy
1144	19	United States Grand Prix	2025-10-19	1144	https://en.wikipedia.org/wiki/2025_United_States_Grand_Prix	f	69	76	round_3qtjdi7s
1145	20	Mexico City Grand Prix	2025-10-26	1145	https://en.wikipedia.org/wiki/2025_Mexico_City_Grand_Prix	f	23	76	round_GjqaMOBR
1146	21	São Paulo Grand Prix	2025-11-09	1146	https://en.wikipedia.org/wiki/2025_S%C3%A3o_Paulo_Grand_Prix	f	37	76	round_NdsW6MO5
1147	22	Las Vegas Grand Prix	2025-11-22	1147	https://en.wikipedia.org/wiki/2025_Las_Vegas_Grand_Prix	f	77	76	round_f51tGI62
1148	23	Qatar Grand Prix	2025-11-30	1148	https://en.wikipedia.org/wiki/2025_Qatar_Grand_Prix	f	74	76	round_oEvMifxc
1149	24	Abu Dhabi Grand Prix	2025-12-07	1149	https://en.wikipedia.org/wiki/2025_Abu_Dhabi_Grand_Prix	f	66	76	round_LHzJR8OP
\.


--
-- Data for Name: formula_one_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_session (id, number, type, scheduled_laps, is_cancelled, point_system_id, round_id, api_id, has_time_data, "timestamp", timezone) FROM stdin;
4777	7	R	58	f	24	1126	session_Yqc2k17Z	t	2025-03-16 04:00:00+00	Australia/Melbourne
4776	6	Q3	\N	f	1	1126	session_DTzUXnEZ	t	2025-03-15 05:00:00+00	Australia/Melbourne
331	2	R	\N	f	11	111	session_xQZaJRyK	f	1962-12-29 00:00:00+00	Africa/Johannesburg
332	1	QB	\N	f	1	111	session_V07TfiOr	f	1962-12-27 00:00:00+00	Africa/Johannesburg
333	\N	QB	\N	f	1	111	session_VSpjk8Mk	f	1962-12-28 00:00:00+00	Africa/Johannesburg
70	2	R	\N	f	2	24	session_ZJy9B6LS	f	1953-01-18 00:00:00+00	America/Argentina/Buenos_Aires
71	1	QB	\N	f	1	24	session_9SZkbUiw	f	1953-01-16 00:00:00+00	America/Argentina/Buenos_Aires
72	\N	QB	\N	f	1	24	session_THK1o6au	f	1953-01-17 00:00:00+00	America/Argentina/Buenos_Aires
97	2	R	\N	f	3	33	session_pWaDgfkm	f	1954-01-17 00:00:00+00	America/Argentina/Buenos_Aires
98	1	QB	\N	f	1	33	session_Cry0hkGu	f	1954-01-15 00:00:00+00	America/Argentina/Buenos_Aires
99	\N	QB	\N	f	1	33	session_KChpWruK	f	1954-01-16 00:00:00+00	America/Argentina/Buenos_Aires
124	2	R	\N	f	4	42	session_igoSZUdn	f	1955-01-16 00:00:00+00	America/Argentina/Buenos_Aires
3004	7	R	\N	f	16	877	session_Ymph2aNO	t	2012-11-18 19:00:00+00	America/Chicago
3005	3	Q1	\N	f	1	877	session_EGjEHUJw	f	2012-11-17 00:00:00+00	America/Chicago
3006	4	Q2	\N	f	1	877	session_XJu4NE9h	f	2012-11-17 00:00:00+00	America/Chicago
3007	5	Q3	\N	f	1	877	session_d5h33ee9	f	2012-11-17 00:00:00+00	America/Chicago
3008	1	FP1	\N	f	1	877	session_fN6EWMo9	f	2012-11-16 00:00:00+00	America/Chicago
3009	2	FP2	\N	f	1	877	session_6GBrk2gc	f	2012-11-16 00:00:00+00	America/Chicago
3010	6	FP3	\N	f	1	877	session_d7E1p1Qq	f	2012-11-17 00:00:00+00	America/Chicago
3137	7	R	\N	f	16	896	session_k8DF7EKo	t	2013-11-17 19:00:00+00	America/Chicago
3138	3	Q1	\N	f	1	896	session_8yK1x9F2	f	2013-11-16 00:00:00+00	America/Chicago
3139	4	Q2	\N	f	1	896	session_nPr41JM8	f	2013-11-16 00:00:00+00	America/Chicago
3140	5	Q3	\N	f	1	896	session_c7AuMUBA	f	2013-11-16 00:00:00+00	America/Chicago
3141	1	FP1	\N	f	1	896	session_AzaWP0nA	f	2013-11-15 00:00:00+00	America/Chicago
3142	2	FP2	\N	f	1	896	session_RtLwM1By	f	2013-11-15 00:00:00+00	America/Chicago
3143	6	FP3	\N	f	1	896	session_1Kt1OQqi	f	2013-11-16 00:00:00+00	America/Chicago
3263	7	R	\N	f	16	914	session_TR5gZFDc	t	2014-11-02 20:00:00+00	America/Chicago
3264	3	Q1	\N	f	1	914	session_Ehj5cvkd	f	2014-11-01 00:00:00+00	America/Chicago
3265	4	Q2	\N	f	1	914	session_CKysZ2xb	f	2014-11-01 00:00:00+00	America/Chicago
3266	5	Q3	\N	f	1	914	session_RLhPf1dP	f	2014-11-01 00:00:00+00	America/Chicago
3267	1	FP1	\N	f	1	914	session_N0XM2MyC	f	2014-10-31 00:00:00+00	America/Chicago
3268	2	FP2	\N	f	1	914	session_JstRNtz8	f	2014-10-31 00:00:00+00	America/Chicago
3269	6	FP3	\N	f	1	914	session_7oyByUhT	f	2014-11-01 00:00:00+00	America/Chicago
25	2	R	\N	f	2	9	session_PP4tcRPv	f	1951-05-30 00:00:00+00	America/Indianapolis
26	1	QB	\N	f	1	9	session_TAqZZ2CL	f	1951-05-28 00:00:00+00	America/Indianapolis
949	2	R	\N	f	12	317	session_vXVI4tL6	f	1979-04-08 00:00:00+00	America/Los_Angeles
950	1	QB	\N	f	1	317	session_bDnO2ajK	f	1979-04-06 00:00:00+00	America/Los_Angeles
951	\N	QB	\N	f	1	317	session_cl71fkUW	f	1979-04-07 00:00:00+00	America/Los_Angeles
1029	\N	QB	\N	f	1	343	session_dFPb2zeu	f	1981-03-14 00:00:00+00	America/Los_Angeles
1078	2	R	\N	f	13	360	session_bIcDXP8a	f	1982-04-04 00:00:00+00	America/Los_Angeles
1079	1	QB	\N	f	1	360	session_K697W9Ul	f	1982-04-02 00:00:00+00	America/Los_Angeles
1080	\N	QB	\N	f	1	360	session_acjLacDP	f	1982-04-03 00:00:00+00	America/Los_Angeles
1117	2	R	\N	f	13	373	session_tUtsR3AT	f	1982-09-25 00:00:00+00	America/Los_Angeles
1118	1	QB	\N	f	1	373	session_nLiQbpkZ	f	1982-09-23 00:00:00+00	America/Los_Angeles
1119	\N	QB	\N	f	1	373	session_RoDUadxc	f	1982-09-24 00:00:00+00	America/Los_Angeles
1123	2	R	\N	f	13	375	session_k4dkIczB	f	1983-03-27 00:00:00+00	America/Los_Angeles
1124	1	QB	\N	f	1	375	session_dfNmVD65	f	1983-03-25 00:00:00+00	America/Los_Angeles
1125	\N	QB	\N	f	1	375	session_f8Tr3VsK	f	1983-03-26 00:00:00+00	America/Los_Angeles
1417	2	R	\N	f	13	473	session_bunDcTxD	f	1989-06-04 00:00:00+00	America/Los_Angeles
1418	1	QB	\N	f	1	473	session_wwTwta6l	f	1989-06-02 00:00:00+00	America/Los_Angeles
1419	\N	QB	\N	f	1	473	session_yGrZhUYc	f	1989-06-03 00:00:00+00	America/Los_Angeles
1453	2	R	\N	f	13	485	session_JMLUguKo	f	1990-03-11 00:00:00+00	America/Los_Angeles
1454	1	QB	\N	f	1	485	session_hTjSNzER	f	1990-03-09 00:00:00+00	America/Los_Angeles
1455	\N	QB	\N	f	1	485	session_YaOIAE2v	f	1990-03-10 00:00:00+00	America/Los_Angeles
4579	5	Q2	\N	f	1	1100	session_VE2kBhyg	t	2023-11-17 08:00:00+00	America/Los_Angeles
4580	6	Q3	\N	f	1	1100	session_7rl5RKAK	t	2023-11-17 08:00:00+00	America/Los_Angeles
4581	1	FP1	\N	f	1	1100	session_402AEU4s	t	2023-11-16 04:30:00+00	America/Los_Angeles
4582	2	FP2	\N	f	1	1100	session_RaQMBHzf	t	2023-11-16 08:00:00+00	America/Los_Angeles
421	2	R	\N	f	11	141	session_uHVtXxE3	f	1965-10-24 00:00:00+00	America/Mexico_City
422	1	QB	\N	f	1	141	session_7vNMjhf3	f	1965-10-22 00:00:00+00	America/Mexico_City
423	\N	QB	\N	f	1	141	session_Jp4qnev7	f	1965-10-23 00:00:00+00	America/Mexico_City
1185	\N	QB	\N	f	1	395	session_0Ti0aAi9	f	1984-06-16 00:00:00+00	America/Montreal
1422	\N	QB	\N	f	1	474	session_cYL3BtOR	f	1989-06-17 00:00:00+00	America/Montreal
1467	\N	QB	\N	f	1	489	session_HPKiVxT6	f	1990-06-09 00:00:00+00	America/Montreal
1569	\N	QB	\N	f	1	523	session_7OWD7iN8	f	1992-06-13 00:00:00+00	America/Montreal
1708	2	R	\N	f	14	570	session_kgNQy3pd	f	1995-06-11 00:00:00+00	America/Montreal
1709	1	QB	\N	f	1	570	session_rvoQrz4I	f	1995-06-09 00:00:00+00	America/Montreal
1710	\N	QB	\N	f	1	570	session_OqKWFN5w	f	1995-06-10 00:00:00+00	America/Montreal
1789	1	QB	\N	f	1	604	session_wOsv0Xkj	f	1997-06-14 00:00:00+00	America/Montreal
1852	2	R	\N	f	14	636	session_Ho4OGzo9	f	1999-06-13 00:00:00+00	America/Montreal
1853	1	QB	\N	f	1	636	session_Udrcz6Qg	f	1999-06-12 00:00:00+00	America/Montreal
1923	1	QB	\N	f	1	671	session_F4zgv17P	f	2001-06-09 00:00:00+00	America/Montreal
1999	2	QB	\N	f	1	705	session_mCi3XdTi	f	2003-06-14 00:00:00+00	America/Montreal
2098	2	R	\N	f	15	739	session_QNpteLlU	t	2005-06-12 13:00:00+00	America/Montreal
2099	1	QB	\N	f	1	739	session_H25vKou5	f	2005-06-11 00:00:00+00	America/Montreal
2184	6	FP3	\N	f	1	759	session_9HxG8Ykh	f	2006-06-24 00:00:00+00	America/Montreal
2289	6	FP3	\N	f	1	774	session_3EqMhcc2	f	2007-06-09 00:00:00+00	America/Montreal
2409	7	R	\N	f	15	792	session_z4rAvsO3	t	2008-06-08 17:00:00+00	America/Montreal
2410	3	Q1	\N	f	1	792	session_oEUoRJfe	f	2008-06-07 00:00:00+00	America/Montreal
2411	4	Q2	\N	f	1	792	session_iX42UKuB	f	2008-06-07 00:00:00+00	America/Montreal
2412	5	Q3	\N	f	1	792	session_eA4Bwdt6	f	2008-06-07 00:00:00+00	America/Montreal
2413	1	FP1	\N	f	1	792	session_mjJyCvZ8	f	2008-06-06 00:00:00+00	America/Montreal
2414	2	FP2	\N	f	1	792	session_QeLi7U7F	f	2008-06-06 00:00:00+00	America/Montreal
2415	6	FP3	\N	f	1	792	session_NrhnlOX1	f	2008-06-07 00:00:00+00	America/Montreal
2661	7	R	\N	f	16	828	session_xM1LvFGF	t	2010-06-13 16:00:00+00	America/Montreal
2662	3	Q1	\N	f	1	828	session_TLI3R8Kv	f	2010-06-12 00:00:00+00	America/Montreal
330	\N	QB	\N	f	1	110	session_LPXJ7uTi	f	1962-10-06 00:00:00+00	America/New_York
355	2	R	\N	f	11	119	session_w5osyl7G	f	1963-10-06 00:00:00+00	America/New_York
356	1	QB	\N	f	1	119	session_MpJDj78I	f	1963-10-04 00:00:00+00	America/New_York
357	\N	QB	\N	f	1	119	session_KYeJFCJK	f	1963-10-05 00:00:00+00	America/New_York
446	1	QB	\N	f	1	149	session_Gf5x6Llt	f	1966-09-30 00:00:00+00	America/New_York
447	\N	QB	\N	f	1	149	session_eESBH0bS	f	1966-10-01 00:00:00+00	America/New_York
588	\N	QB	\N	f	1	196	session_aI2kSark	f	1970-10-03 00:00:00+00	America/New_York
660	\N	QB	\N	f	1	220	session_g7KmoQjb	f	1972-10-07 00:00:00+00	America/New_York
748	2	R	\N	f	11	250	session_SVrvmaKR	f	1974-10-06 00:00:00+00	America/New_York
793	2	R	\N	f	12	265	session_AUCKG1gD	f	1976-01-25 00:00:00+00	America/Sao_Paulo
794	1	QB	\N	f	1	265	session_skNOphCD	f	1976-01-23 00:00:00+00	America/Sao_Paulo
795	\N	QB	\N	f	1	265	session_Fky6p5t1	f	1976-01-24 00:00:00+00	America/Sao_Paulo
897	\N	QB	\N	f	1	299	session_NOSDKKRG	f	1978-01-28 00:00:00+00	America/Sao_Paulo
1032	\N	QB	\N	f	1	344	session_NjTCb6sc	f	1981-03-28 00:00:00+00	America/Sao_Paulo
1261	2	R	\N	f	13	421	session_LGh0jyfJ	f	1986-03-23 00:00:00+00	America/Sao_Paulo
1262	1	QB	\N	f	1	421	session_eRTzWkWY	f	1986-03-21 00:00:00+00	America/Sao_Paulo
1263	\N	QB	\N	f	1	421	session_HnsWBasy	f	1986-03-22 00:00:00+00	America/Sao_Paulo
1406	1	QB	\N	f	1	469	session_6q3q2AL4	f	1989-03-24 00:00:00+00	America/Sao_Paulo
1407	\N	QB	\N	f	1	469	session_hNr7rp2Q	f	1989-03-25 00:00:00+00	America/Sao_Paulo
1557	\N	QB	\N	f	1	519	session_6YpizKzI	f	1992-04-04 00:00:00+00	America/Sao_Paulo
1602	\N	QB	\N	f	1	534	session_uzc3fjB0	f	1993-03-27 00:00:00+00	America/Sao_Paulo
1645	2	R	\N	f	14	549	session_Q1VWABfu	f	1994-03-27 00:00:00+00	America/Sao_Paulo
1646	1	QB	\N	f	1	549	session_sHUZK44m	f	1994-03-25 00:00:00+00	America/Sao_Paulo
1647	\N	QB	\N	f	1	549	session_Uh3XPsPl	f	1994-03-26 00:00:00+00	America/Sao_Paulo
1845	1	QB	\N	f	1	632	session_Dlzt7Maf	f	1999-04-10 00:00:00+00	America/Sao_Paulo
1946	2	R	\N	f	14	683	session_ICSOREGh	f	2002-03-31 00:00:00+00	America/Sao_Paulo
1947	1	QB	\N	f	1	683	session_WS3CbkGL	f	2002-03-30 00:00:00+00	America/Sao_Paulo
2117	1	QB	\N	f	1	748	session_LHU5NJRa	f	2005-09-24 00:00:00+00	America/Sao_Paulo
2247	6	FP3	\N	f	1	768	session_xbnfiAyX	f	2006-10-21 00:00:00+00	America/Sao_Paulo
2360	7	R	\N	f	15	785	session_40MfGUZb	t	2007-10-21 16:00:00+00	America/Sao_Paulo
2361	3	Q1	\N	f	1	785	session_7PMVRQD0	f	2007-10-20 00:00:00+00	America/Sao_Paulo
2362	4	Q2	\N	f	1	785	session_FpFFWg7c	f	2007-10-20 00:00:00+00	America/Sao_Paulo
2363	5	Q3	\N	f	1	785	session_mq86gFhI	f	2007-10-20 00:00:00+00	America/Sao_Paulo
657	\N	QB	\N	f	1	219	session_xMDBPdeq	f	1972-09-23 00:00:00+00	America/Toronto
747	\N	QB	\N	f	1	249	session_kUxAX3su	f	1974-09-21 00:00:00+00	America/Toronto
2085	1	QA	\N	f	1	734	session_WXaevU2J	f	2005-04-02 00:00:00+00	Asia/Bahrain
2086	3	QA	\N	f	1	734	session_yQ3WQjj2	f	2005-04-03 00:00:00+00	Asia/Bahrain
2124	4	Q2	\N	f	1	751	session_V8XS5iDy	f	2006-03-11 00:00:00+00	Asia/Bahrain
2125	5	Q3	\N	f	1	751	session_EEfKkotM	f	2006-03-11 00:00:00+00	Asia/Bahrain
2126	1	FP1	\N	f	1	751	session_kAVVAXJd	f	2006-03-10 00:00:00+00	Asia/Bahrain
2127	2	FP2	\N	f	1	751	session_WH35YkWd	f	2006-03-10 00:00:00+00	Asia/Bahrain
2128	6	FP3	\N	f	1	751	session_cpUHespL	f	2006-03-11 00:00:00+00	Asia/Bahrain
3045	6	FP3	\N	f	1	882	session_0RbDHRs3	f	2013-04-20 00:00:00+00	Asia/Bahrain
3171	6	FP3	\N	f	1	900	session_rFDuYy0V	f	2014-04-05 00:00:00+00	Asia/Bahrain
3430	6	FP3	\N	f	1	937	session_1B4A7Em5	f	2016-04-02 00:00:00+00	Asia/Bahrain
3717	6	FP3	\N	f	1	978	session_IdcHuOSR	f	2018-04-07 00:00:00+00	Asia/Bahrain
3864	6	FP3	\N	f	1	999	session_bWdvFfTv	f	2019-03-30 00:00:00+00	Asia/Bahrain
4096	7	R	\N	f	18	1033	session_65avkr0N	t	2020-11-29 14:10:00+00	Asia/Bahrain
4097	3	Q1	\N	f	1	1033	session_8cgJy5V9	f	2020-11-28 00:00:00+00	Asia/Bahrain
4098	4	Q2	\N	f	1	1033	session_wK7kMZ4r	f	2020-11-28 00:00:00+00	Asia/Bahrain
4099	5	Q3	\N	f	1	1033	session_3bpNx4XP	f	2020-11-28 00:00:00+00	Asia/Bahrain
4100	1	FP1	\N	f	1	1033	session_reejA2vi	f	2020-11-27 00:00:00+00	Asia/Bahrain
4101	2	FP2	\N	f	1	1033	session_xCN1c5dZ	f	2020-11-27 00:00:00+00	Asia/Bahrain
4102	6	FP3	\N	f	1	1033	session_HaN6QzuY	f	2020-11-28 00:00:00+00	Asia/Bahrain
4103	7	R	\N	f	18	1034	session_EosYAyxd	t	2020-12-06 17:10:00+00	Asia/Bahrain
4104	3	Q1	\N	f	1	1034	session_X6LENGt7	f	2020-12-05 00:00:00+00	Asia/Bahrain
4105	4	Q2	\N	f	1	1034	session_gRcAhHs2	f	2020-12-05 00:00:00+00	Asia/Bahrain
4106	5	Q3	\N	f	1	1034	session_fU0yG3xD	f	2020-12-05 00:00:00+00	Asia/Bahrain
3619	6	FP3	\N	f	1	964	session_VjbNeSE0	f	2017-06-24 00:00:00+00	Asia/Baku
4454	8	SR	\N	f	23	1083	session_JIKvGJnp	t	2023-04-29 13:30:00+00	Asia/Baku
4893	5	Q2	\N	f	1	1142	session_AadexSDu	t	2025-09-20 12:00:00+00	Asia/Baku
4894	6	Q3	\N	f	1	1142	session_yRXH2UF8	t	2025-09-20 12:00:00+00	Asia/Baku
4895	7	R	51	f	24	1142	session_TNtWVNu0	t	2025-09-21 11:00:00+00	Asia/Baku
2611	6	FP3	\N	f	1	820	session_SCWnwcwj	f	2009-10-31 00:00:00+00	Asia/Dubai
2870	6	FP3	\N	f	1	857	session_Rp64sdNI	f	2011-11-12 00:00:00+00	Asia/Dubai
3135	2	FP2	\N	f	1	895	session_5xR76hCk	f	2013-11-01 00:00:00+00	Asia/Dubai
3563	6	FP3	\N	f	1	956	session_WucsIK8I	f	2016-11-26 00:00:00+00	Asia/Dubai
3850	6	FP3	\N	f	1	997	session_XfdE90g3	f	2018-11-24 00:00:00+00	Asia/Dubai
2863	6	FP3	\N	f	1	856	session_aVoiXu83	f	2011-10-29 00:00:00+00	Asia/Kolkata
2996	6	FP3	\N	f	1	875	session_Zgaj80Yw	f	2012-10-27 00:00:00+00	Asia/Kolkata
3128	2	FP2	\N	f	1	894	session_eLiYmHnW	f	2013-10-25 00:00:00+00	Asia/Kolkata
3129	6	FP3	\N	f	1	894	session_ugrAugBk	f	2013-10-26 00:00:00+00	Asia/Kolkata
1945	1	QB	\N	f	1	682	session_ac7F4Jfz	f	2002-03-16 00:00:00+00	Asia/Kuala_Lumpur
2083	3	QA	\N	f	1	733	session_a7rkoWJk	f	2005-03-20 00:00:00+00	Asia/Kuala_Lumpur
2135	6	FP3	\N	f	1	752	session_kJXiLXjV	f	2006-03-18 00:00:00+00	Asia/Kuala_Lumpur
2260	2	FP2	\N	f	1	770	session_m2tOBYBO	f	2007-04-06 00:00:00+00	Asia/Kuala_Lumpur
2261	6	FP3	\N	f	1	770	session_zjYfZALm	f	2007-04-07 00:00:00+00	Asia/Kuala_Lumpur
2380	6	FP3	\N	f	1	787	session_KCf8JcN0	f	2008-03-22 00:00:00+00	Asia/Kuala_Lumpur
2506	6	FP3	\N	f	1	805	session_tcBJOoOP	f	2009-04-04 00:00:00+00	Asia/Kuala_Lumpur
2632	6	FP3	\N	f	1	823	session_AoYm3zeT	f	2010-04-03 00:00:00+00	Asia/Kuala_Lumpur
2758	6	FP3	\N	f	1	841	session_meLcmtZe	f	2011-04-09 00:00:00+00	Asia/Kuala_Lumpur
4263	6	FP3	\N	f	1	1056	session_5TQjQkXE	f	2021-12-04 00:00:00+00	Asia/Riyadh
4278	7	R	\N	f	20	1059	session_aVBq5axB	t	2022-03-27 17:00:00+00	Asia/Riyadh
4279	4	Q1	\N	f	1	1059	session_tqxYKxg7	t	2022-03-26 17:00:00+00	Asia/Riyadh
4280	5	Q2	\N	f	1	1059	session_dT03om9B	t	2022-03-26 17:00:00+00	Asia/Riyadh
4281	6	Q3	\N	f	1	1059	session_w9f5Rtrg	t	2022-03-26 17:00:00+00	Asia/Riyadh
4282	1	FP1	\N	f	1	1059	session_EVh4zkqU	t	2022-03-25 14:00:00+00	Asia/Riyadh
4283	2	FP2	\N	f	1	1059	session_4YYm5zGg	t	2022-03-25 17:00:00+00	Asia/Riyadh
4284	3	FP3	\N	f	1	1059	session_tvPLgYim	t	2022-03-26 14:00:00+00	Asia/Riyadh
2730	6	FP3	\N	f	1	837	session_2BYnklCB	f	2010-10-23 00:00:00+00	Asia/Seoul
2359	6	FP3	\N	f	1	784	session_wRkg6LHa	f	2007-10-06 00:00:00+00	Asia/Shanghai
2485	6	FP3	\N	f	1	802	session_XKhpmG0L	f	2008-10-18 00:00:00+00	Asia/Shanghai
2507	7	R	\N	f	15	806	session_3o2nyBi2	t	2009-04-19 07:00:00+00	Asia/Shanghai
2508	3	Q1	\N	f	1	806	session_2qr5Ii4v	f	2009-04-18 00:00:00+00	Asia/Shanghai
2509	4	Q2	\N	f	1	806	session_7u8RUEhR	f	2009-04-18 00:00:00+00	Asia/Shanghai
2510	5	Q3	\N	f	1	806	session_LzhD0p4v	f	2009-04-18 00:00:00+00	Asia/Shanghai
2511	1	FP1	\N	f	1	806	session_XlOzXLDi	f	2009-04-17 00:00:00+00	Asia/Shanghai
2590	6	FP3	\N	f	1	817	session_bkwcdL2N	f	2009-09-26 00:00:00+00	Asia/Singapore
2975	6	FP3	\N	f	1	872	session_ZVV7mSCa	f	2012-09-22 00:00:00+00	Asia/Singapore
3108	6	FP3	\N	f	1	891	session_ccuSgBSi	f	2013-09-21 00:00:00+00	Asia/Singapore
3248	6	FP3	\N	f	1	911	session_oW0Rltji	f	2014-09-20 00:00:00+00	Asia/Singapore
3374	6	FP3	\N	f	1	929	session_psJ2Yx6b	f	2015-09-19 00:00:00+00	Asia/Singapore
891	\N	QB	\N	f	1	297	session_V05nwbIF	f	1977-10-22 00:00:00+00	Asia/Tokyo
1449	\N	QB	\N	f	1	483	session_MB6Cr7Bf	f	1989-10-21 00:00:00+00	Asia/Tokyo
1495	2	R	\N	f	13	499	session_VmC5dis3	f	1990-10-21 00:00:00+00	Asia/Tokyo
1404	\N	QB	\N	f	1	468	session_FHgnaY5B	f	1988-11-12 00:00:00+00	Australia/Adelaide
1500	\N	QB	\N	f	1	500	session_Pwl9moza	f	1990-11-03 00:00:00+00	Australia/Adelaide
1875	1	QB	\N	f	1	647	session_9c11Vw4p	f	2000-03-11 00:00:00+00	Australia/Melbourne
2025	1	QO	\N	f	1	714	session_cXqXVuAT	f	2004-03-06 00:00:00+00	Australia/Melbourne
2142	6	FP3	\N	f	1	753	session_PPOfDzZt	f	2006-04-01 00:00:00+00	Australia/Melbourne
2254	6	FP3	\N	f	1	769	session_qB8fAQVO	f	2007-03-17 00:00:00+00	Australia/Melbourne
2373	6	FP3	\N	f	1	786	session_FmaCFzqV	f	2008-03-15 00:00:00+00	Australia/Melbourne
2625	6	FP3	\N	f	1	822	session_qY0oNENK	f	2010-03-27 00:00:00+00	Australia/Melbourne
2751	6	FP3	\N	f	1	840	session_Y7ZcjWXx	f	2011-03-26 00:00:00+00	Australia/Melbourne
2884	6	FP3	\N	f	1	859	session_hsrGCaJ6	f	2012-03-17 00:00:00+00	Australia/Melbourne
3024	6	FP3	\N	f	1	879	session_Ci4xzb5I	f	2013-03-16 00:00:00+00	Australia/Melbourne
3157	6	FP3	\N	f	1	898	session_yDaYI1kM	f	2014-03-15 00:00:00+00	Australia/Melbourne
3290	6	FP3	\N	f	1	917	session_uv90c9On	f	2015-03-14 00:00:00+00	Australia/Melbourne
3423	6	FP3	\N	f	1	936	session_bfKlRm6I	f	2016-03-19 00:00:00+00	Australia/Melbourne
3570	6	FP3	\N	f	1	957	session_tTvZlIH1	f	2017-03-25 00:00:00+00	Australia/Melbourne
3709	2	FP2	\N	f	1	977	session_vdGpgsLe	f	2018-03-23 00:00:00+00	Australia/Melbourne
3710	6	FP3	\N	f	1	977	session_oRSVSJkA	f	2018-03-24 00:00:00+00	Australia/Melbourne
3856	2	FP2	\N	f	1	998	session_ec5GdzSL	f	2019-03-15 00:00:00+00	Australia/Melbourne
3857	6	FP3	\N	f	1	998	session_sTcnUjPc	f	2019-03-16 00:00:00+00	Australia/Melbourne
263	1	QB	\N	f	1	88	session_xmwBNffa	f	1960-06-04 00:00:00+00	Europe/Amsterdam
264	\N	QB	\N	f	1	88	session_I9RO08RP	f	1960-06-05 00:00:00+00	Europe/Amsterdam
286	2	R	\N	f	10	96	session_50Du0HWn	f	1961-05-22 00:00:00+00	Europe/Amsterdam
287	1	QB	\N	f	1	96	session_xC8XZQAe	f	1961-05-20 00:00:00+00	Europe/Amsterdam
288	\N	QB	\N	f	1	96	session_2VPoykHz	f	1961-05-21 00:00:00+00	Europe/Amsterdam
368	1	QB	\N	f	1	123	session_lZvhKxKC	f	1964-05-22 00:00:00+00	Europe/Amsterdam
369	\N	QB	\N	f	1	123	session_4rgyTq3S	f	1964-05-23 00:00:00+00	Europe/Amsterdam
498	\N	QB	\N	f	1	166	session_nXQpncHs	f	1968-06-22 00:00:00+00	Europe/Amsterdam
566	1	QB	\N	f	1	189	session_B1jraGMu	f	1970-06-19 00:00:00+00	Europe/Amsterdam
567	\N	QB	\N	f	1	189	session_3HO8I4ur	f	1970-06-20 00:00:00+00	Europe/Amsterdam
729	\N	QB	\N	f	1	243	session_maJvouMf	f	1974-06-22 00:00:00+00	Europe/Amsterdam
879	\N	QB	\N	f	1	293	session_IzonOIEg	f	1977-08-27 00:00:00+00	Europe/Amsterdam
974	1	QB	\N	f	1	325	session_1gbYE9p3	f	1979-08-24 00:00:00+00	Europe/Amsterdam
975	\N	QB	\N	f	1	325	session_2Ji9tzIb	f	1979-08-25 00:00:00+00	Europe/Amsterdam
1244	1	QB	\N	f	1	415	session_NdTjrKZB	f	1985-08-23 00:00:00+00	Europe/Amsterdam
1245	\N	QB	\N	f	1	415	session_tNfKs5NW	f	1985-08-24 00:00:00+00	Europe/Amsterdam
4207	6	FP3	\N	f	1	1048	session_aAS4r0BZ	f	2021-09-04 00:00:00+00	Europe/Amsterdam
216	\N	QB	\N	f	1	72	session_wV6FtRLK	f	1958-08-02 00:00:00+00	Europe/Berlin
105	\N	QB	\N	f	1	35	session_KKnOfXAW	f	1954-06-19 00:00:00+00	Europe/Brussels
133	2	R	\N	f	4	45	session_VLDJlxTM	f	1955-06-05 00:00:00+00	Europe/Brussels
134	1	QB	\N	f	1	45	session_l8i53mwB	f	1955-06-03 00:00:00+00	Europe/Brussels
135	\N	QB	\N	f	1	45	session_3DPLgagm	f	1955-06-04 00:00:00+00	Europe/Brussels
372	\N	QB	\N	f	1	124	session_gyUglC2j	f	1964-06-13 00:00:00+00	Europe/Brussels
675	\N	QB	\N	f	1	225	session_uqpeioeh	f	1973-05-19 00:00:00+00	Europe/Brussels
957	\N	QB	\N	f	1	319	session_YaytaKyu	f	1979-05-12 00:00:00+00	Europe/Brussels
1040	1	QB	\N	f	1	347	session_1DjezkrZ	f	1981-05-15 00:00:00+00	Europe/Brussels
1041	\N	QB	\N	f	1	347	session_6HM3CquD	f	1981-05-16 00:00:00+00	Europe/Brussels
1275	\N	QB	\N	f	1	425	session_bZGIb1Xv	f	1986-05-24 00:00:00+00	Europe/Brussels
1485	\N	QB	\N	f	1	495	session_eNL6CWc4	f	1990-08-25 00:00:00+00	Europe/Brussels
1725	\N	QB	\N	f	1	575	session_qiO1o8G6	f	1995-08-26 00:00:00+00	Europe/Brussels
2702	6	FP3	\N	f	1	833	session_Z13fWc0t	f	2010-08-28 00:00:00+00	Europe/Brussels
2961	6	FP3	\N	f	1	870	session_ZndZDuf0	f	2012-09-01 00:00:00+00	Europe/Brussels
3094	6	FP3	\N	f	1	889	session_IGfQidwE	f	2013-08-24 00:00:00+00	Europe/Brussels
3234	6	FP3	\N	f	1	909	session_j04fv7sz	f	2014-08-23 00:00:00+00	Europe/Brussels
4046	6	FP3	\N	f	1	1025	session_NB2br5sl	f	2020-08-29 00:00:00+00	Europe/Brussels
4200	6	FP3	\N	f	1	1047	session_Y1zOR1Wy	f	2021-08-28 00:00:00+00	Europe/Brussels
4866	8	Q3	\N	f	1	1138	session_0Gy4BbUC	t	2025-07-26 14:00:00+00	Europe/Brussels
1335	\N	QB	\N	f	1	445	session_snYd2WRF	f	1987-08-08 00:00:00+00	Europe/Budapest
2219	6	FP3	\N	f	1	764	session_yCO06m27	f	2006-08-26 00:00:00+00	Europe/Istanbul
2331	6	FP3	\N	f	1	780	session_BQC2Jx5o	f	2007-08-25 00:00:00+00	Europe/Istanbul
2395	7	R	\N	f	15	790	session_2H8Tg50Z	t	2008-05-11 12:00:00+00	Europe/Istanbul
2660	6	FP3	\N	f	1	827	session_lNGVE9aQ	f	2010-05-29 00:00:00+00	Europe/Istanbul
2772	6	FP3	\N	f	1	843	session_I46L4I4x	f	2011-05-07 00:00:00+00	Europe/Istanbul
1218	\N	QB	\N	f	1	406	session_BU0GTJld	f	1985-04-20 00:00:00+00	Europe/Lisbon
1344	\N	QB	\N	f	1	448	session_KW609p0P	f	1987-09-19 00:00:00+00	Europe/Lisbon
4081	6	FP3	\N	f	1	1030	session_kcndzMbN	f	2020-10-24 00:00:00+00	Europe/Lisbon
60	\N	QB	\N	f	1	20	session_5wGA6X8D	f	1952-07-18 00:00:00+00	Europe/London
212	1	QB	\N	f	1	71	session_V6TtZPQy	f	1958-07-17 00:00:00+00	Europe/London
213	\N	QB	\N	f	1	71	session_vdNOpA24	f	1958-07-18 00:00:00+00	Europe/London
295	2	R	\N	f	10	99	session_NJTWlyJW	f	1961-07-15 00:00:00+00	Europe/London
296	1	QB	\N	f	1	99	session_ypOxV5Mc	f	1961-07-13 00:00:00+00	Europe/London
297	\N	QB	\N	f	1	99	session_iCbFe9ja	f	1961-07-14 00:00:00+00	Europe/London
435	\N	QB	\N	f	1	145	session_X6dZdxBa	f	1966-07-15 00:00:00+00	Europe/London
504	\N	QB	\N	f	1	168	session_zsg0ISIL	f	1968-07-19 00:00:00+00	Europe/London
573	\N	QB	\N	f	1	191	session_WPAKAwHG	f	1970-07-17 00:00:00+00	Europe/London
645	\N	QB	\N	f	1	215	session_68QlJWSG	f	1972-07-14 00:00:00+00	Europe/London
735	\N	QB	\N	f	1	245	session_BRK3Zb4c	f	1974-07-19 00:00:00+00	Europe/London
819	\N	QB	\N	f	1	273	session_HnXulXeo	f	1976-07-17 00:00:00+00	Europe/London
1161	\N	QB	\N	f	1	387	session_uyDOSjZy	f	1983-09-24 00:00:00+00	Europe/London
1192	2	R	\N	f	13	398	session_Bz7wJhpV	f	1984-07-22 00:00:00+00	Europe/London
525	\N	QB	\N	f	1	175	session_ZwqzczMx	f	1969-05-03 00:00:00+00	Europe/Madrid
597	\N	QB	\N	f	1	199	session_C8D2eCwK	f	1971-04-17 00:00:00+00	Europe/Madrid
954	\N	QB	\N	f	1	318	session_nTLauRD2	f	1979-04-28 00:00:00+00	Europe/Madrid
1560	\N	QB	\N	f	1	520	session_m6X7I5YF	f	1992-05-02 00:00:00+00	Europe/Madrid
1702	2	R	\N	f	14	568	session_Il4ze8h8	f	1995-05-14 00:00:00+00	Europe/Madrid
1703	1	QB	\N	f	1	568	session_jgeo0loj	f	1995-05-12 00:00:00+00	Europe/Madrid
1704	\N	QB	\N	f	1	568	session_o36Pxdxt	f	1995-05-13 00:00:00+00	Europe/Madrid
2275	6	FP3	\N	f	1	772	session_dlX1bfX1	f	2007-05-12 00:00:00+00	Europe/Madrid
2450	6	FP3	\N	f	1	797	session_Dgv7By2h	f	2008-08-23 00:00:00+00	Europe/Madrid
2569	6	FP3	\N	f	1	814	session_LsRpxgo8	f	2009-08-22 00:00:00+00	Europe/Madrid
2668	7	R	\N	f	16	829	session_2NsfVCVo	t	2010-06-27 12:00:00+00	Europe/Madrid
2669	3	Q1	\N	f	1	829	session_FSaBwWXn	f	2010-06-26 00:00:00+00	Europe/Madrid
2670	4	Q2	\N	f	1	829	session_w3iNfKJq	f	2010-06-26 00:00:00+00	Europe/Madrid
2671	5	Q3	\N	f	1	829	session_km8tkvyX	f	2010-06-26 00:00:00+00	Europe/Madrid
285	\N	QB	\N	f	1	95	session_KvdLZstJ	f	1961-05-13 00:00:00+00	Europe/Monaco
365	1	QB	\N	f	1	122	session_RK6kjlHE	f	1964-05-07 00:00:00+00	Europe/Monaco
366	\N	QB	\N	f	1	122	session_hC5OeM9y	f	1964-05-09 00:00:00+00	Europe/Monaco
598	2	R	\N	f	11	200	session_O020oAk5	f	1971-05-23 00:00:00+00	Europe/Monaco
599	1	QB	\N	f	1	200	session_gYEKEWqy	f	1971-05-20 00:00:00+00	Europe/Monaco
600	\N	QB	\N	f	1	200	session_cQeeeRWx	f	1971-05-22 00:00:00+00	Europe/Monaco
723	\N	QB	\N	f	1	241	session_2HKYmLoO	f	1974-05-25 00:00:00+00	Europe/Monaco
810	\N	QB	\N	f	1	270	session_OCRfeWJe	f	1976-05-29 00:00:00+00	Europe/Monaco
960	\N	QB	\N	f	1	320	session_LKBdzRIx	f	1979-05-26 00:00:00+00	Europe/Monaco
1044	\N	QB	\N	f	1	348	session_JVIcABUE	f	1981-05-30 00:00:00+00	Europe/Monaco
1272	\N	QB	\N	f	1	424	session_6EpbVhVm	f	1986-05-10 00:00:00+00	Europe/Monaco
1411	2	R	\N	f	13	471	session_4VUKXNox	f	1989-05-07 00:00:00+00	Europe/Monaco
1412	1	QB	\N	f	1	471	session_tuXTADcp	f	1989-05-04 00:00:00+00	Europe/Monaco
1413	\N	QB	\N	f	1	471	session_BUqT0BmW	f	1989-05-06 00:00:00+00	Europe/Monaco
1566	\N	QB	\N	f	1	522	session_Sjh9odat	f	1992-05-30 00:00:00+00	Europe/Monaco
3262	6	FP3	\N	f	1	913	session_ts59AGon	f	2014-10-11 00:00:00+00	Europe/Moscow
3388	6	FP3	\N	f	1	931	session_Lyx67Q8m	f	2015-10-10 00:00:00+00	Europe/Moscow
3591	6	FP3	\N	f	1	960	session_cevwzLjB	f	2017-04-29 00:00:00+00	Europe/Moscow
3962	6	FP3	\N	f	1	1013	session_2IoVaq2l	f	2019-09-28 00:00:00+00	Europe/Moscow
4221	6	FP3	\N	f	1	1050	session_K1499nvi	f	2021-09-25 00:00:00+00	Europe/Moscow
57	\N	QB	\N	f	1	19	session_QNk8BdQl	f	1952-07-05 00:00:00+00	Europe/Paris
210	\N	QB	\N	f	1	70	session_lLMlQkRf	f	1958-07-05 00:00:00+00	Europe/Paris
294	\N	QB	\N	f	1	98	session_CNvbpv5i	f	1961-07-01 00:00:00+00	Europe/Paris
375	\N	QB	\N	f	1	125	session_XDE6qKbq	f	1964-06-27 00:00:00+00	Europe/Paris
501	\N	QB	\N	f	1	167	session_9bRNlUBl	f	1968-07-06 00:00:00+00	Europe/Paris
642	\N	QB	\N	f	1	214	session_9oxz5MaV	f	1972-07-01 00:00:00+00	Europe/Paris
816	\N	QB	\N	f	1	272	session_oxU5BOOg	f	1976-07-03 00:00:00+00	Europe/Paris
1050	\N	QB	\N	f	1	350	session_qYMO5Hqc	f	1981-07-04 00:00:00+00	Europe/Paris
1113	\N	QB	\N	f	1	371	session_9dmoqMKW	f	1982-08-28 00:00:00+00	Europe/Paris
1326	\N	QB	\N	f	1	442	session_rzlGQiZC	f	1987-07-04 00:00:00+00	Europe/Paris
2198	6	FP3	\N	f	1	761	session_b78GWVwE	f	2006-07-15 00:00:00+00	Europe/Paris
2303	6	FP3	\N	f	1	776	session_TsZVlOUF	f	2007-06-30 00:00:00+00	Europe/Paris
3759	6	FP3	\N	f	1	984	session_TMlZDtX8	f	2018-06-23 00:00:00+00	Europe/Paris
3906	6	FP3	\N	f	1	1005	session_kxtqLJGy	f	2019-06-22 00:00:00+00	Europe/Paris
69	\N	QB	\N	f	1	23	session_AiXoDsIO	f	1952-09-06 00:00:00+00	Europe/Rome
142	2	R	\N	f	4	48	session_6u11zUZh	f	1955-09-11 00:00:00+00	Europe/Rome
143	1	QB	\N	f	1	48	session_v7RQFl9m	f	1955-09-09 00:00:00+00	Europe/Rome
144	\N	QB	\N	f	1	48	session_ghhYdy7R	f	1955-09-10 00:00:00+00	Europe/Rome
192	\N	QB	\N	f	1	64	session_74AXixP1	f	1957-09-07 00:00:00+00	Europe/Rome
220	2	R	\N	f	6	74	session_aHqwHw8s	f	1958-09-07 00:00:00+00	Europe/Rome
221	1	QB	\N	f	1	74	session_RMJucMMV	f	1958-09-05 00:00:00+00	Europe/Rome
222	\N	QB	\N	f	1	74	session_iG0AVVCx	f	1958-09-06 00:00:00+00	Europe/Rome
354	\N	QB	\N	f	1	118	session_tBLEyz2p	f	1963-09-07 00:00:00+00	Europe/Rome
442	2	R	\N	f	11	148	session_lbBvK6T5	f	1966-09-04 00:00:00+00	Europe/Rome
443	1	QB	\N	f	1	148	session_0xYWH6OP	f	1966-09-02 00:00:00+00	Europe/Rome
444	\N	QB	\N	f	1	148	session_ZaUHmos6	f	1966-09-03 00:00:00+00	Europe/Rome
654	\N	QB	\N	f	1	218	session_2JCWcA9R	f	1972-09-09 00:00:00+00	Europe/Rome
3514	6	FP3	\N	f	1	949	session_N6f2LRdh	f	2016-09-03 00:00:00+00	Europe/Rome
4053	6	FP3	\N	f	1	1026	session_ecKVUUGE	f	2020-09-05 00:00:00+00	Europe/Rome
4054	7	R	\N	f	18	1027	session_5Wmsvoax	t	2020-09-13 13:10:00+00	Europe/Rome
4055	3	Q1	\N	f	1	1027	session_jYGrC7Dc	f	2020-09-12 00:00:00+00	Europe/Rome
4056	4	Q2	\N	f	1	1027	session_KaaBYLw9	f	2020-09-12 00:00:00+00	Europe/Rome
4057	5	Q3	\N	f	1	1027	session_WHNtR2RV	f	2020-09-12 00:00:00+00	Europe/Rome
4058	1	FP1	\N	f	1	1027	session_Q3LCsEhg	f	2020-09-11 00:00:00+00	Europe/Rome
4059	2	FP2	\N	f	1	1027	session_8cLTi3i2	f	2020-09-11 00:00:00+00	Europe/Rome
4060	6	FP3	\N	f	1	1027	session_nriWBKtv	f	2020-09-12 00:00:00+00	Europe/Rome
4082	7	R	\N	f	18	1031	session_vIT1ksz9	t	2020-11-01 12:10:00+00	Europe/Rome
4083	3	Q1	\N	f	1	1031	session_avEQ6vlU	f	2020-10-31 00:00:00+00	Europe/Rome
4084	4	Q2	\N	f	1	1031	session_C4CxrT1g	f	2020-10-31 00:00:00+00	Europe/Rome
4085	5	Q3	\N	f	1	1031	session_kbben05x	f	2020-10-31 00:00:00+00	Europe/Rome
4086	1	FP1	\N	f	1	1031	session_5zrjv7ux	f	2020-10-30 00:00:00+00	Europe/Rome
4087	2	FP2	\N	f	1	1031	session_CX5kFLvH	f	2020-10-30 00:00:00+00	Europe/Rome
4088	6	FP3	\N	f	1	1031	session_vxPVo6cQ	f	2020-10-31 00:00:00+00	Europe/Rome
726	\N	QB	\N	f	1	242	session_0YGfi38y	f	1974-06-08 00:00:00+00	Europe/Stockholm
813	\N	QB	\N	f	1	271	session_K3DVRRco	f	1976-06-12 00:00:00+00	Europe/Stockholm
825	\N	QB	\N	f	1	275	session_HWgVWuSL	f	1976-08-14 00:00:00+00	Europe/Vienna
971	1	QB	\N	f	1	324	session_i0FZYC59	f	1979-08-10 00:00:00+00	Europe/Vienna
972	\N	QB	\N	f	1	324	session_LtGaBF9D	f	1979-08-11 00:00:00+00	Europe/Vienna
3206	6	FP3	\N	f	1	905	session_5b7TuCSW	f	2014-06-21 00:00:00+00	Europe/Vienna
3339	6	FP3	\N	f	1	924	session_kVAz2lBn	f	2015-06-20 00:00:00+00	Europe/Vienna
3479	6	FP3	\N	f	1	944	session_QZtUOIGY	f	2016-07-02 00:00:00+00	Europe/Vienna
3626	6	FP3	\N	f	1	965	session_Hufbo7x5	f	2017-07-08 00:00:00+00	Europe/Vienna
3766	6	FP3	\N	f	1	985	session_M7Yn7LC5	f	2018-06-30 00:00:00+00	Europe/Vienna
3913	6	FP3	\N	f	1	1006	session_PL7IG7Qs	f	2019-06-29 00:00:00+00	Europe/Vienna
4004	6	FP3	\N	f	1	1019	session_GffTC6Qb	f	2020-07-04 00:00:00+00	Europe/Vienna
4005	7	R	\N	f	18	1020	session_ik3r2WjH	t	2020-07-12 13:10:00+00	Europe/Vienna
4006	3	Q1	\N	f	1	1020	session_LBj0P4ph	f	2020-07-11 00:00:00+00	Europe/Vienna
4007	4	Q2	\N	f	1	1020	session_pYhsyjfg	f	2020-07-11 00:00:00+00	Europe/Vienna
48	\N	QB	\N	f	1	16	session_YLNS6oUP	f	1952-05-17 00:00:00+00	Europe/Zurich
223	2	R	\N	f	6	75	session_unYKDsov	f	1958-10-19 00:00:00+00	Africa/Casablanca
224	1	QB	\N	f	1	75	session_Jb0YqpS6	f	1958-10-17 00:00:00+00	Africa/Casablanca
225	\N	QB	\N	f	1	75	session_5RGhiwIz	f	1958-10-18 00:00:00+00	Africa/Casablanca
361	2	R	\N	f	11	121	session_UcyW0ynG	f	1963-12-28 00:00:00+00	Africa/Johannesburg
362	1	QB	\N	f	1	121	session_0bLieK6O	f	1963-12-26 00:00:00+00	Africa/Johannesburg
363	\N	QB	\N	f	1	121	session_2lbVa9fg	f	1963-12-27 00:00:00+00	Africa/Johannesburg
394	2	R	\N	f	11	132	session_IiTmccR2	f	1965-01-01 00:00:00+00	Africa/Johannesburg
395	1	QB	\N	f	1	132	session_675ioAxX	f	1964-12-30 00:00:00+00	Africa/Johannesburg
396	\N	QB	\N	f	1	132	session_7m0Mwiac	f	1964-12-31 00:00:00+00	Africa/Johannesburg
451	2	R	\N	f	11	151	session_UlegZ0Tm	f	1967-01-02 00:00:00+00	Africa/Johannesburg
452	1	QB	\N	f	1	151	session_wXaH59vt	f	1966-12-31 00:00:00+00	Africa/Johannesburg
453	\N	QB	\N	f	1	151	session_F5VoTIsG	f	1967-01-01 00:00:00+00	Africa/Johannesburg
484	2	R	\N	f	11	162	session_faqD5aoQ	f	1968-01-01 00:00:00+00	Africa/Johannesburg
485	1	QB	\N	f	1	162	session_okSyfHSO	f	1967-12-30 00:00:00+00	Africa/Johannesburg
486	\N	QB	\N	f	1	162	session_2FYgCBz3	f	1967-12-31 00:00:00+00	Africa/Johannesburg
520	2	R	\N	f	11	174	session_SbEePcC9	f	1969-03-01 00:00:00+00	Africa/Johannesburg
521	1	QB	\N	f	1	174	session_Jr829RDF	f	1969-02-27 00:00:00+00	Africa/Johannesburg
522	\N	QB	\N	f	1	174	session_En5hnEiN	f	1969-02-28 00:00:00+00	Africa/Johannesburg
553	2	R	\N	f	11	185	session_LHiORbpv	f	1970-03-07 00:00:00+00	Africa/Johannesburg
554	1	QB	\N	f	1	185	session_ywpYOh0r	f	1970-03-05 00:00:00+00	Africa/Johannesburg
555	\N	QB	\N	f	1	185	session_PfYNGqW2	f	1970-03-06 00:00:00+00	Africa/Johannesburg
592	2	R	\N	f	11	198	session_NdXylKsz	f	1971-03-06 00:00:00+00	Africa/Johannesburg
593	1	QB	\N	f	1	198	session_5ei2hoOt	f	1971-03-04 00:00:00+00	Africa/Johannesburg
594	\N	QB	\N	f	1	198	session_SR3bLbl6	f	1971-03-05 00:00:00+00	Africa/Johannesburg
628	2	R	\N	f	11	210	session_ZYMumT2a	f	1972-03-04 00:00:00+00	Africa/Johannesburg
629	1	QB	\N	f	1	210	session_1SJIKbiJ	f	1972-03-02 00:00:00+00	Africa/Johannesburg
630	\N	QB	\N	f	1	210	session_47c6KWzv	f	1972-03-03 00:00:00+00	Africa/Johannesburg
667	2	R	\N	f	11	223	session_fHGNGbgd	f	1973-03-03 00:00:00+00	Africa/Johannesburg
668	1	QB	\N	f	1	223	session_7rC0ySRR	f	1973-03-01 00:00:00+00	Africa/Johannesburg
669	\N	QB	\N	f	1	223	session_4Z7kKPCc	f	1973-03-02 00:00:00+00	Africa/Johannesburg
712	2	R	\N	f	11	238	session_EY99Mf24	f	1974-03-30 00:00:00+00	Africa/Johannesburg
713	1	QB	\N	f	1	238	session_ZdTlFS0o	f	1974-03-28 00:00:00+00	Africa/Johannesburg
714	\N	QB	\N	f	1	238	session_l3fInVQ6	f	1974-03-29 00:00:00+00	Africa/Johannesburg
757	2	R	\N	f	12	253	session_cb5IsYzm	f	1975-03-01 00:00:00+00	Africa/Johannesburg
758	1	QB	\N	f	1	253	session_GekRCcqr	f	1975-02-27 00:00:00+00	Africa/Johannesburg
759	\N	QB	\N	f	1	253	session_tvJuNzT9	f	1975-02-28 00:00:00+00	Africa/Johannesburg
796	2	R	\N	f	12	266	session_fR4xkGXC	f	1976-03-06 00:00:00+00	Africa/Johannesburg
797	1	QB	\N	f	1	266	session_lB8ilwVK	f	1976-03-04 00:00:00+00	Africa/Johannesburg
798	\N	QB	\N	f	1	266	session_NFr22wmm	f	1976-03-05 00:00:00+00	Africa/Johannesburg
847	2	R	\N	f	12	283	session_NrfhRfkj	f	1977-03-05 00:00:00+00	Africa/Johannesburg
848	1	QB	\N	f	1	283	session_tEOwX2D2	f	1977-03-03 00:00:00+00	Africa/Johannesburg
849	\N	QB	\N	f	1	283	session_KOC6Tog4	f	1977-03-04 00:00:00+00	Africa/Johannesburg
898	2	R	\N	f	12	300	session_p1BlfUav	f	1978-03-04 00:00:00+00	Africa/Johannesburg
899	1	QB	\N	f	1	300	session_8CVhTlQu	f	1978-03-02 00:00:00+00	Africa/Johannesburg
900	\N	QB	\N	f	1	300	session_W8tRa5zi	f	1978-03-03 00:00:00+00	Africa/Johannesburg
946	2	R	\N	f	12	316	session_2epoFi5Y	f	1979-03-03 00:00:00+00	Africa/Johannesburg
947	1	QB	\N	f	1	316	session_DeZ7alBw	f	1979-03-01 00:00:00+00	Africa/Johannesburg
948	\N	QB	\N	f	1	316	session_xGHwFOqy	f	1979-03-02 00:00:00+00	Africa/Johannesburg
991	2	R	\N	f	13	331	session_FWVftg63	f	1980-03-01 00:00:00+00	Africa/Johannesburg
992	1	QB	\N	f	1	331	session_XQVLumrE	f	1980-02-28 00:00:00+00	Africa/Johannesburg
993	\N	QB	\N	f	1	331	session_YhWSPUU0	f	1980-02-29 00:00:00+00	Africa/Johannesburg
1072	2	R	\N	f	13	358	session_VUdwt7Nt	f	1982-01-23 00:00:00+00	Africa/Johannesburg
1073	1	QB	\N	f	1	358	session_IviOUQL4	f	1982-01-21 00:00:00+00	Africa/Johannesburg
1074	\N	QB	\N	f	1	358	session_8IYrLTGi	f	1982-01-22 00:00:00+00	Africa/Johannesburg
1162	2	R	\N	f	13	388	session_m0HIQ2h6	f	1983-10-15 00:00:00+00	Africa/Johannesburg
1163	1	QB	\N	f	1	388	session_CpEIrY3M	f	1983-10-13 00:00:00+00	Africa/Johannesburg
1164	\N	QB	\N	f	1	388	session_1401hxhB	f	1983-10-14 00:00:00+00	Africa/Johannesburg
1168	2	R	\N	f	13	390	session_WB2Hr2R6	f	1984-04-07 00:00:00+00	Africa/Johannesburg
1169	1	QB	\N	f	1	390	session_mBuXRP4D	f	1984-04-05 00:00:00+00	Africa/Johannesburg
1170	\N	QB	\N	f	1	390	session_09QZJpX1	f	1984-04-06 00:00:00+00	Africa/Johannesburg
1255	2	R	\N	f	13	419	session_V2ry2uu8	f	1985-10-19 00:00:00+00	Africa/Johannesburg
1256	1	QB	\N	f	1	419	session_HVqqURBO	f	1985-10-17 00:00:00+00	Africa/Johannesburg
1257	\N	QB	\N	f	1	419	session_jsI6FvuJ	f	1985-10-18 00:00:00+00	Africa/Johannesburg
1549	2	R	\N	f	14	517	session_LOfqvatA	f	1992-03-01 00:00:00+00	Africa/Johannesburg
1550	1	QB	\N	f	1	517	session_ZRRpIAHK	f	1992-02-28 00:00:00+00	Africa/Johannesburg
1551	\N	QB	\N	f	1	517	session_Xi4cUw6U	f	1992-02-29 00:00:00+00	Africa/Johannesburg
1597	2	R	\N	f	14	533	session_agpuqI2H	f	1993-03-14 00:00:00+00	Africa/Johannesburg
1598	1	QB	\N	f	1	533	session_fQslFCQg	f	1993-03-12 00:00:00+00	Africa/Johannesburg
1599	\N	QB	\N	f	1	533	session_ricDK8ih	f	1993-03-13 00:00:00+00	Africa/Johannesburg
125	1	QB	\N	f	1	42	session_OJkXFcPV	f	1955-01-14 00:00:00+00	America/Argentina/Buenos_Aires
126	\N	QB	\N	f	1	42	session_5NDI8tiY	f	1955-01-15 00:00:00+00	America/Argentina/Buenos_Aires
145	2	R	\N	f	5	49	session_FQQBuCym	f	1956-01-22 00:00:00+00	America/Argentina/Buenos_Aires
146	1	QB	\N	f	1	49	session_flgJxeok	f	1956-01-20 00:00:00+00	America/Argentina/Buenos_Aires
147	\N	QB	\N	f	1	49	session_EtZCVUwY	f	1956-01-21 00:00:00+00	America/Argentina/Buenos_Aires
171	\N	QB	\N	f	1	57	session_5TDsGqie	f	1957-01-12 00:00:00+00	America/Argentina/Buenos_Aires
193	2	R	\N	f	6	65	session_8VZ53DWE	f	1958-01-19 00:00:00+00	America/Argentina/Buenos_Aires
194	1	QB	\N	f	1	65	session_67bkUzAi	f	1958-01-17 00:00:00+00	America/Argentina/Buenos_Aires
195	\N	QB	\N	f	1	65	session_CYSXpOf1	f	1958-01-18 00:00:00+00	America/Argentina/Buenos_Aires
253	2	R	\N	f	8	85	session_ZNbyvFB9	f	1960-02-07 00:00:00+00	America/Argentina/Buenos_Aires
254	1	QB	\N	f	1	85	session_HBbbd0re	f	1960-02-05 00:00:00+00	America/Argentina/Buenos_Aires
255	\N	QB	\N	f	1	85	session_iBXL1Nnl	f	1960-02-06 00:00:00+00	America/Argentina/Buenos_Aires
663	\N	QB	\N	f	1	221	session_Hom5IHYQ	f	1973-01-27 00:00:00+00	America/Argentina/Buenos_Aires
708	\N	QB	\N	f	1	236	session_28T0BEbq	f	1974-01-12 00:00:00+00	America/Argentina/Buenos_Aires
894	\N	QB	\N	f	1	298	session_n0qcadnV	f	1978-01-14 00:00:00+00	America/Argentina/Buenos_Aires
942	\N	QB	\N	f	1	314	session_iKlhIsL0	f	1979-01-20 00:00:00+00	America/Argentina/Buenos_Aires
987	\N	QB	\N	f	1	329	session_cR3aP8Ks	f	1980-01-12 00:00:00+00	America/Argentina/Buenos_Aires
1033	2	R	\N	f	13	345	session_4LWKV7Gc	f	1981-04-12 00:00:00+00	America/Argentina/Buenos_Aires
1034	1	QB	\N	f	1	345	session_Y6WHDvWQ	f	1981-04-10 00:00:00+00	America/Argentina/Buenos_Aires
1035	\N	QB	\N	f	1	345	session_62Nn9yv0	f	1981-04-11 00:00:00+00	America/Argentina/Buenos_Aires
1696	2	R	\N	f	14	566	session_0aK5GWvA	f	1995-04-09 00:00:00+00	America/Argentina/Buenos_Aires
1697	1	QB	\N	f	1	566	session_nlJ3s9Hb	f	1995-04-07 00:00:00+00	America/Argentina/Buenos_Aires
1698	\N	QB	\N	f	1	566	session_oB3OAive	f	1995-04-08 00:00:00+00	America/Argentina/Buenos_Aires
1748	2	R	\N	f	14	584	session_PH3eWJKI	f	1996-04-07 00:00:00+00	America/Argentina/Buenos_Aires
1749	1	QB	\N	f	1	584	session_6NPERyAj	f	1996-04-06 00:00:00+00	America/Argentina/Buenos_Aires
1780	2	R	\N	f	14	600	session_XOSe2D8q	f	1997-04-13 00:00:00+00	America/Argentina/Buenos_Aires
1781	1	QB	\N	f	1	600	session_Jg6ISI9Q	f	1997-04-12 00:00:00+00	America/Argentina/Buenos_Aires
1814	2	R	\N	f	14	617	session_CxLMGDiA	f	1998-04-12 00:00:00+00	America/Argentina/Buenos_Aires
1815	1	QB	\N	f	1	617	session_rtMLbt8z	f	1998-04-11 00:00:00+00	America/Argentina/Buenos_Aires
662	1	QB	\N	f	1	221	session_k1byN4QN	f	1973-01-26 00:00:00+00	America/Argentina/Buenos_Aires
893	1	QB	\N	f	1	298	session_05oaGyC4	f	1978-01-13 00:00:00+00	America/Argentina/Buenos_Aires
3389	7	R	\N	f	16	932	session_5JwZGi1E	t	2015-10-25 19:00:00+00	America/Chicago
3390	3	Q1	\N	f	1	932	session_DvgPmK8m	f	2015-10-24 00:00:00+00	America/Chicago
3391	4	Q2	\N	f	1	932	session_pgSEeUBB	f	2015-10-24 00:00:00+00	America/Chicago
3392	5	Q3	\N	f	1	932	session_DlgYHhCQ	f	2015-10-24 00:00:00+00	America/Chicago
3393	1	FP1	\N	f	1	932	session_1QsFcI55	f	2015-10-23 00:00:00+00	America/Chicago
3394	2	FP2	\N	f	1	932	session_UQq1OhyK	f	2015-10-23 00:00:00+00	America/Chicago
3395	6	FP3	\N	f	1	932	session_t5adqhak	f	2015-10-24 00:00:00+00	America/Chicago
3536	7	R	\N	f	16	953	session_mPeTHX3Q	t	2016-10-23 19:00:00+00	America/Chicago
3537	3	Q1	\N	f	1	953	session_XmgSUxvj	f	2016-10-22 00:00:00+00	America/Chicago
3538	4	Q2	\N	f	1	953	session_DwwWYLmu	f	2016-10-22 00:00:00+00	America/Chicago
3539	5	Q3	\N	f	1	953	session_xBOntL5B	f	2016-10-22 00:00:00+00	America/Chicago
3540	1	FP1	\N	f	1	953	session_TJdDhsOx	f	2016-10-21 00:00:00+00	America/Chicago
3541	2	FP2	\N	f	1	953	session_GxHP02Au	f	2016-10-21 00:00:00+00	America/Chicago
3542	6	FP3	\N	f	1	953	session_Ak5rS9T0	f	2016-10-22 00:00:00+00	America/Chicago
3676	7	R	\N	f	16	973	session_5ryg57Fe	t	2017-10-22 19:00:00+00	America/Chicago
3677	3	Q1	\N	f	1	973	session_3ksJEBxn	f	2017-10-21 00:00:00+00	America/Chicago
3678	4	Q2	\N	f	1	973	session_CcG71dKi	f	2017-10-21 00:00:00+00	America/Chicago
3679	5	Q3	\N	f	1	973	session_aTpm19py	f	2017-10-21 00:00:00+00	America/Chicago
3680	1	FP1	\N	f	1	973	session_6X2bJOyc	f	2017-10-20 00:00:00+00	America/Chicago
3681	2	FP2	\N	f	1	973	session_ofNdLguY	f	2017-10-20 00:00:00+00	America/Chicago
3682	6	FP3	\N	f	1	973	session_yH0pdjoV	f	2017-10-21 00:00:00+00	America/Chicago
3823	7	R	\N	f	16	994	session_10LnrShQ	t	2018-10-21 18:10:00+00	America/Chicago
3824	3	Q1	\N	f	1	994	session_Ubv0jXkg	f	2018-10-20 00:00:00+00	America/Chicago
3825	4	Q2	\N	f	1	994	session_HjnwOVZg	f	2018-10-20 00:00:00+00	America/Chicago
3826	5	Q3	\N	f	1	994	session_axptAPIP	f	2018-10-20 00:00:00+00	America/Chicago
3827	1	FP1	\N	f	1	994	session_8XHCTDmm	f	2018-10-19 00:00:00+00	America/Chicago
3828	2	FP2	\N	f	1	994	session_q69mF15h	f	2018-10-19 00:00:00+00	America/Chicago
3829	6	FP3	\N	f	1	994	session_g2RTAkUz	f	2018-10-20 00:00:00+00	America/Chicago
3977	7	R	\N	f	18	1016	session_bnq4Mcqg	t	2019-11-03 19:10:00+00	America/Chicago
3978	3	Q1	\N	f	1	1016	session_H4bBoL5I	f	2019-11-02 00:00:00+00	America/Chicago
3979	4	Q2	\N	f	1	1016	session_xPmTYSvu	f	2019-11-02 00:00:00+00	America/Chicago
3980	5	Q3	\N	f	1	1016	session_2sOB3FD1	f	2019-11-02 00:00:00+00	America/Chicago
3981	1	FP1	\N	f	1	1016	session_0x8uTn5s	f	2019-11-01 00:00:00+00	America/Chicago
3982	2	FP2	\N	f	1	1016	session_mvYpR7xg	f	2019-11-01 00:00:00+00	America/Chicago
3983	6	FP3	\N	f	1	1016	session_xY57KCiX	f	2019-11-02 00:00:00+00	America/Chicago
4229	7	R	\N	f	18	1052	session_Nr5haHGC	t	2021-10-24 19:00:00+00	America/Chicago
4230	3	Q1	\N	f	1	1052	session_mCfyCFwR	f	2021-10-23 00:00:00+00	America/Chicago
4231	4	Q2	\N	f	1	1052	session_5sAbZZfH	f	2021-10-23 00:00:00+00	America/Chicago
4232	5	Q3	\N	f	1	1052	session_BLtccaPN	f	2021-10-23 00:00:00+00	America/Chicago
4233	1	FP1	\N	f	1	1052	session_5bm5zLgp	f	2021-10-22 00:00:00+00	America/Chicago
4234	2	FP2	\N	f	1	1052	session_INkqoc3F	f	2021-10-22 00:00:00+00	America/Chicago
4235	6	FP3	\N	f	1	1052	session_LX3ILATG	f	2021-10-23 00:00:00+00	America/Chicago
4397	7	R	\N	f	20	1076	session_FJ5Te5Ds	t	2022-10-23 19:00:00+00	America/Chicago
4398	4	Q1	\N	f	1	1076	session_Qfx69iIJ	t	2022-10-22 22:00:00+00	America/Chicago
4399	5	Q2	\N	f	1	1076	session_RNTtU4B6	t	2022-10-22 22:00:00+00	America/Chicago
4400	6	Q3	\N	f	1	1076	session_DyyMoX2N	t	2022-10-22 22:00:00+00	America/Chicago
4401	1	FP1	\N	f	1	1076	session_RvYmShsU	t	2022-10-21 19:00:00+00	America/Chicago
4402	2	FP2	\N	f	1	1076	session_DrBqKFl1	t	2022-10-21 22:00:00+00	America/Chicago
4403	3	FP3	\N	f	1	1076	session_dBqVb4r6	t	2022-10-22 19:00:00+00	America/Chicago
4552	9	R	\N	f	22	1097	session_GfgZKI28	t	2023-10-22 19:00:00+00	America/Chicago
4553	2	Q1	\N	f	1	1097	session_axkmoXiK	t	2023-10-20 21:00:00+00	America/Chicago
4554	3	Q2	\N	f	1	1097	session_5qK4W4g0	t	2023-10-20 21:00:00+00	America/Chicago
4555	4	Q3	\N	f	1	1097	session_hm8XWg9Y	t	2023-10-20 21:00:00+00	America/Chicago
4556	1	FP1	\N	f	1	1097	session_G9eRYPdz	t	2023-10-20 17:30:00+00	America/Chicago
4557	5	SQ1	\N	f	1	1097	session_ZsdGEfWi	t	2023-10-21 18:00:00+00	America/Chicago
4558	6	SQ2	\N	f	1	1097	session_etFF7T8q	t	2023-10-21 18:00:00+00	America/Chicago
4559	7	SQ3	\N	f	1	1097	session_QlPHYkr4	t	2023-10-21 18:00:00+00	America/Chicago
4560	8	SR	\N	f	23	1097	session_uo1VT7rT	t	2023-10-21 22:00:00+00	America/Chicago
4724	6	Q1	\N	f	1	1120	session_WBZgq5Vt	t	2024-10-19 22:00:00+00	America/Chicago
4725	7	Q2	\N	f	1	1120	session_jQNnc9Gi	t	2024-10-19 22:00:00+00	America/Chicago
4726	8	Q3	\N	f	1	1120	session_w4gdWB8f	t	2024-10-19 22:00:00+00	America/Chicago
4727	1	FP1	\N	f	1	1120	session_CstfnyTO	t	2024-10-18 17:30:00+00	America/Chicago
4728	2	SQ1	\N	f	1	1120	session_qGnfuhHV	t	2024-10-18 21:30:00+00	America/Chicago
4729	3	SQ2	\N	f	1	1120	session_AjfW7G8l	t	2024-10-18 21:30:00+00	America/Chicago
4730	4	SQ3	\N	f	1	1120	session_g6pTJM4y	t	2024-10-18 21:30:00+00	America/Chicago
4731	5	SR	\N	f	23	1120	session_ndmZdSkX	t	2024-10-19 18:00:00+00	America/Chicago
4903	1	FP1	\N	f	1	1144	session_17EXX6fb	t	2025-10-17 17:30:00+00	America/Chicago
4904	2	SQ1	\N	f	1	1144	session_ZPcSeBBY	t	2025-10-17 21:30:00+00	America/Chicago
27	\N	QB	\N	f	1	9	session_Lq6lagMu	f	1951-05-29 00:00:00+00	America/Indianapolis
49	2	R	\N	f	2	17	session_W04ToMiv	f	1952-05-30 00:00:00+00	America/Indianapolis
50	1	QB	\N	f	1	17	session_ao1wN9fK	f	1952-05-28 00:00:00+00	America/Indianapolis
51	\N	QB	\N	f	1	17	session_TcWydMeg	f	1952-05-29 00:00:00+00	America/Indianapolis
73	2	R	\N	f	2	25	session_GFpV085h	f	1953-05-30 00:00:00+00	America/Indianapolis
74	1	QB	\N	f	1	25	session_05uYIY5F	f	1953-05-28 00:00:00+00	America/Indianapolis
75	\N	QB	\N	f	1	25	session_hQygrFVn	f	1953-05-29 00:00:00+00	America/Indianapolis
177	\N	QB	\N	f	1	59	session_P7BVRuFR	f	1957-05-29 00:00:00+00	America/Indianapolis
202	2	R	\N	f	7	68	session_o8PXYtwJ	f	1958-05-30 00:00:00+00	America/Indianapolis
203	1	QB	\N	f	1	68	session_IzqrozvP	f	1958-05-28 00:00:00+00	America/Indianapolis
204	\N	QB	\N	f	1	68	session_ELCPzwZF	f	1958-05-29 00:00:00+00	America/Indianapolis
259	2	R	\N	f	9	87	session_5bwgKKxF	f	1960-05-30 00:00:00+00	America/Indianapolis
260	1	QB	\N	f	1	87	session_GdUv5odq	f	1960-05-28 00:00:00+00	America/Indianapolis
261	\N	QB	\N	f	1	87	session_4urnxhx6	f	1960-05-29 00:00:00+00	America/Indianapolis
1902	2	R	\N	f	14	661	session_WdkAHRn8	f	2000-09-24 00:00:00+00	America/Indianapolis
1903	1	QB	\N	f	1	661	session_bv2CKisj	f	2000-09-23 00:00:00+00	America/Indianapolis
1938	2	R	\N	f	14	679	session_Rzf7I7tY	f	2001-09-30 00:00:00+00	America/Indianapolis
1939	1	QB	\N	f	1	679	session_KaFRisFS	f	2001-09-29 00:00:00+00	America/Indianapolis
1972	2	R	\N	f	14	696	session_P4MVftfk	f	2002-09-29 00:00:00+00	America/Indianapolis
1973	1	QB	\N	f	1	696	session_AksyObAm	f	2002-09-28 00:00:00+00	America/Indianapolis
2018	3	R	\N	f	15	712	session_QaIATWWQ	f	2003-09-28 00:00:00+00	America/Indianapolis
2019	1	QO	\N	f	1	712	session_BBNmC8Xj	f	2003-09-26 00:00:00+00	America/Indianapolis
2020	2	QB	\N	f	1	712	session_MA60JP8q	f	2003-09-27 00:00:00+00	America/Indianapolis
2048	3	R	\N	f	15	722	session_alLrF25X	f	2004-06-20 00:00:00+00	America/Indianapolis
2049	1	QO	\N	f	1	722	session_siUzxrLk	f	2004-06-19 00:00:00+00	America/Indianapolis
2050	2	QB	\N	f	1	722	session_kf0186IN	f	2004-06-19 00:00:00+00	America/Indianapolis
2100	2	R	\N	f	15	740	session_SzkuvZwO	t	2005-06-19 14:00:00+00	America/Indianapolis
2101	1	QB	\N	f	1	740	session_50Zw91pC	f	2005-06-18 00:00:00+00	America/Indianapolis
2185	7	R	\N	f	15	760	session_o01PUzz5	t	2006-07-02 14:00:00+00	America/Indianapolis
2186	3	Q1	\N	f	1	760	session_N8KQYxYj	f	2006-07-01 00:00:00+00	America/Indianapolis
2187	4	Q2	\N	f	1	760	session_5gGwz2RZ	f	2006-07-01 00:00:00+00	America/Indianapolis
2188	5	Q3	\N	f	1	760	session_8BFFo1oC	f	2006-07-01 00:00:00+00	America/Indianapolis
2189	1	FP1	\N	f	1	760	session_sZSDZI2K	f	2006-06-30 00:00:00+00	America/Indianapolis
2190	2	FP2	\N	f	1	760	session_KXoszzxY	f	2006-06-30 00:00:00+00	America/Indianapolis
2191	6	FP3	\N	f	1	760	session_GGObY2ZR	f	2006-07-01 00:00:00+00	America/Indianapolis
2290	7	R	\N	f	15	775	session_CTU7KNb4	t	2007-06-17 17:00:00+00	America/Indianapolis
2291	3	Q1	\N	f	1	775	session_LAV5Vm7o	f	2007-06-16 00:00:00+00	America/Indianapolis
2292	4	Q2	\N	f	1	775	session_SSu8DLpT	f	2007-06-16 00:00:00+00	America/Indianapolis
2293	5	Q3	\N	f	1	775	session_R9kmA2yY	f	2007-06-16 00:00:00+00	America/Indianapolis
2294	1	FP1	\N	f	1	775	session_OX9SyzAm	f	2007-06-15 00:00:00+00	America/Indianapolis
2295	2	FP2	\N	f	1	775	session_DcthZXTh	f	2007-06-15 00:00:00+00	America/Indianapolis
2296	6	FP3	\N	f	1	775	session_atj6zo87	f	2007-06-16 00:00:00+00	America/Indianapolis
4583	3	FP3	\N	f	1	1100	session_2qIWOIfO	t	2023-11-17 04:30:00+00	America/Los_Angeles
4930	5	Q2	\N	f	1	1147	session_wGtstAPI	t	2025-11-22 04:00:00+00	America/Los_Angeles
4931	6	Q3	\N	f	1	1147	session_QVxiBleC	t	2025-11-22 04:00:00+00	America/Los_Angeles
448	2	R	\N	f	11	150	session_xd0Xu2Xf	f	1966-10-23 00:00:00+00	America/Mexico_City
449	1	QB	\N	f	1	150	session_5opo7mKw	f	1966-10-21 00:00:00+00	America/Mexico_City
450	\N	QB	\N	f	1	150	session_JBqB9nei	f	1966-10-22 00:00:00+00	America/Mexico_City
591	\N	QB	\N	f	1	197	session_16ZvCely	f	1970-10-24 00:00:00+00	America/Mexico_City
1303	2	R	\N	f	13	435	session_41XxBpbN	f	1986-10-12 00:00:00+00	America/Mexico_City
1304	1	QB	\N	f	1	435	session_iAfSTT2j	f	1986-10-10 00:00:00+00	America/Mexico_City
1305	\N	QB	\N	f	1	435	session_lRpYQZQr	f	1986-10-11 00:00:00+00	America/Mexico_City
1348	2	R	\N	f	13	450	session_QOgV7s4z	f	1987-10-18 00:00:00+00	America/Mexico_City
1349	1	QB	\N	f	1	450	session_Res8AFzK	f	1987-10-16 00:00:00+00	America/Mexico_City
1350	\N	QB	\N	f	1	450	session_LVIP9Jq4	f	1987-10-17 00:00:00+00	America/Mexico_City
1414	2	R	\N	f	13	472	session_rVSXqLG4	f	1989-05-28 00:00:00+00	America/Mexico_City
1415	1	QB	\N	f	1	472	session_ZJa7anqQ	f	1989-05-26 00:00:00+00	America/Mexico_City
1416	\N	QB	\N	f	1	472	session_JETaRtIb	f	1989-05-27 00:00:00+00	America/Mexico_City
1518	\N	QB	\N	f	1	506	session_vzCbNcjc	f	1991-06-15 00:00:00+00	America/Mexico_City
1552	2	R	\N	f	14	518	session_jGMM0h7f	f	1992-03-22 00:00:00+00	America/Mexico_City
1553	1	QB	\N	f	1	518	session_CXeQ0V5b	f	1992-03-20 00:00:00+00	America/Mexico_City
1554	\N	QB	\N	f	1	518	session_OZgBsUFU	f	1992-03-21 00:00:00+00	America/Mexico_City
3402	6	FP3	\N	f	1	933	session_j69ZFQIm	f	2015-10-31 00:00:00+00	America/Mexico_City
3549	6	FP3	\N	f	1	954	session_6qaoUIB0	f	2016-10-29 00:00:00+00	America/Mexico_City
3689	6	FP3	\N	f	1	974	session_ZJwYygJW	f	2017-10-28 00:00:00+00	America/Mexico_City
3836	6	FP3	\N	f	1	995	session_mZHWCvSH	f	2018-10-27 00:00:00+00	America/Mexico_City
3976	6	FP3	\N	f	1	1015	session_ef2DiXR2	f	2019-10-26 00:00:00+00	America/Mexico_City
4242	6	FP3	\N	f	1	1053	session_u6E0Msg8	f	2021-11-06 00:00:00+00	America/Mexico_City
519	\N	QB	\N	f	1	173	session_VmjkkKM4	f	1968-11-02 00:00:00+00	America/Mexico_City
2663	4	Q2	\N	f	1	828	session_j6SS4Xig	f	2010-06-12 00:00:00+00	America/Montreal
2664	5	Q3	\N	f	1	828	session_WKvvAmbf	f	2010-06-12 00:00:00+00	America/Montreal
2665	1	FP1	\N	f	1	828	session_oClMdMze	f	2010-06-11 00:00:00+00	America/Montreal
2666	2	FP2	\N	f	1	828	session_QgcQsjnF	f	2010-06-11 00:00:00+00	America/Montreal
2667	6	FP3	\N	f	1	828	session_lCNCEG3X	f	2010-06-12 00:00:00+00	America/Montreal
2787	7	R	\N	f	16	846	session_l1PQM9Do	t	2011-06-12 17:00:00+00	America/Montreal
2788	3	Q1	\N	f	1	846	session_6laAqJZ4	f	2011-06-11 00:00:00+00	America/Montreal
2789	4	Q2	\N	f	1	846	session_RrDXOMZ5	f	2011-06-11 00:00:00+00	America/Montreal
2790	5	Q3	\N	f	1	846	session_dDwrak9s	f	2011-06-11 00:00:00+00	America/Montreal
2791	1	FP1	\N	f	1	846	session_5LshGCVt	f	2011-06-10 00:00:00+00	America/Montreal
2792	2	FP2	\N	f	1	846	session_Bd31RMym	f	2011-06-10 00:00:00+00	America/Montreal
2793	6	FP3	\N	f	1	846	session_tgNr3RDu	f	2011-06-11 00:00:00+00	America/Montreal
2920	7	R	\N	f	16	865	session_uARROhQt	t	2012-06-10 18:00:00+00	America/Montreal
2921	3	Q1	\N	f	1	865	session_7w1NtT0U	f	2012-06-09 00:00:00+00	America/Montreal
2922	4	Q2	\N	f	1	865	session_PzAv2Pbs	f	2012-06-09 00:00:00+00	America/Montreal
2923	5	Q3	\N	f	1	865	session_HarMNpAO	f	2012-06-09 00:00:00+00	America/Montreal
2924	1	FP1	\N	f	1	865	session_o7IVLdI2	f	2012-06-08 00:00:00+00	America/Montreal
2925	2	FP2	\N	f	1	865	session_fizrejcK	f	2012-06-08 00:00:00+00	America/Montreal
2926	6	FP3	\N	f	1	865	session_mPGChVY3	f	2012-06-09 00:00:00+00	America/Montreal
3062	4	Q2	\N	f	1	885	session_nJmFqe2W	f	2013-06-08 00:00:00+00	America/Montreal
3063	5	Q3	\N	f	1	885	session_FD0LFJA1	f	2013-06-08 00:00:00+00	America/Montreal
3064	1	FP1	\N	f	1	885	session_WNl0zdZ9	f	2013-06-07 00:00:00+00	America/Montreal
3065	2	FP2	\N	f	1	885	session_xpxXeZxF	f	2013-06-07 00:00:00+00	America/Montreal
3066	6	FP3	\N	f	1	885	session_tmRz1iZt	f	2013-06-08 00:00:00+00	America/Montreal
3199	6	FP3	\N	f	1	904	session_EbqWMNyJ	f	2014-06-07 00:00:00+00	America/Montreal
3326	7	R	\N	f	16	923	session_Ku4s7cpf	t	2015-06-07 18:00:00+00	America/Montreal
3327	3	Q1	\N	f	1	923	session_pnV2w2Kw	f	2015-06-06 00:00:00+00	America/Montreal
3328	4	Q2	\N	f	1	923	session_XVQhCOef	f	2015-06-06 00:00:00+00	America/Montreal
3329	5	Q3	\N	f	1	923	session_x54KAdEt	f	2015-06-06 00:00:00+00	America/Montreal
3330	1	FP1	\N	f	1	923	session_YCYYa64H	f	2015-06-05 00:00:00+00	America/Montreal
3331	2	FP2	\N	f	1	923	session_xm3cesHR	f	2015-06-05 00:00:00+00	America/Montreal
3332	6	FP3	\N	f	1	923	session_GKFPTTGX	f	2015-06-06 00:00:00+00	America/Montreal
3459	7	R	\N	f	16	942	session_LAqsExjP	t	2016-06-12 18:00:00+00	America/Montreal
3460	3	Q1	\N	f	1	942	session_zIw8RHU7	f	2016-06-11 00:00:00+00	America/Montreal
3461	4	Q2	\N	f	1	942	session_U2xv5ZP2	f	2016-06-11 00:00:00+00	America/Montreal
3462	5	Q3	\N	f	1	942	session_9qCrtshc	f	2016-06-11 00:00:00+00	America/Montreal
3463	1	FP1	\N	f	1	942	session_bjghkCW3	f	2016-06-10 00:00:00+00	America/Montreal
3464	2	FP2	\N	f	1	942	session_ynnxPUt3	f	2016-06-10 00:00:00+00	America/Montreal
3465	6	FP3	\N	f	1	942	session_KaX3rqvI	f	2016-06-11 00:00:00+00	America/Montreal
3606	7	R	\N	f	16	963	session_G2kWx5wz	t	2017-06-11 18:00:00+00	America/Montreal
3607	3	Q1	\N	f	1	963	session_NhANzg2L	f	2017-06-10 00:00:00+00	America/Montreal
3608	4	Q2	\N	f	1	963	session_xDcJ4M8C	f	2017-06-10 00:00:00+00	America/Montreal
3609	5	Q3	\N	f	1	963	session_t7RckfEN	f	2017-06-10 00:00:00+00	America/Montreal
3610	1	FP1	\N	f	1	963	session_DYwpvNq9	f	2017-06-09 00:00:00+00	America/Montreal
3611	2	FP2	\N	f	1	963	session_HVXChCYw	f	2017-06-09 00:00:00+00	America/Montreal
3612	6	FP3	\N	f	1	963	session_N4LzlLiF	f	2017-06-10 00:00:00+00	America/Montreal
3746	7	R	\N	f	16	983	session_CXg4X09V	t	2018-06-10 18:10:00+00	America/Montreal
3747	3	Q1	\N	f	1	983	session_6bgjbO50	f	2018-06-09 00:00:00+00	America/Montreal
3748	4	Q2	\N	f	1	983	session_bPoi1Fvx	f	2018-06-09 00:00:00+00	America/Montreal
3749	5	Q3	\N	f	1	983	session_4DpbpUFL	f	2018-06-09 00:00:00+00	America/Montreal
3750	1	FP1	\N	f	1	983	session_RnyRapBX	f	2018-06-08 00:00:00+00	America/Montreal
3751	2	FP2	\N	f	1	983	session_3LlLH3Xb	f	2018-06-08 00:00:00+00	America/Montreal
3752	6	FP3	\N	f	1	983	session_TKnRoUZ9	f	2018-06-09 00:00:00+00	America/Montreal
3893	7	R	\N	f	18	1004	session_j82ACwfT	t	2019-06-09 18:10:00+00	America/Montreal
3894	3	Q1	\N	f	1	1004	session_Udrc7og1	f	2019-06-08 00:00:00+00	America/Montreal
3895	4	Q2	\N	f	1	1004	session_D9c9i4cq	f	2019-06-08 00:00:00+00	America/Montreal
3896	5	Q3	\N	f	1	1004	session_0wxAuvMb	f	2019-06-08 00:00:00+00	America/Montreal
3897	1	FP1	\N	f	1	1004	session_4kSep86E	f	2019-06-07 00:00:00+00	America/Montreal
3898	2	FP2	\N	f	1	1004	session_dgdkjih7	f	2019-06-07 00:00:00+00	America/Montreal
3899	6	FP3	\N	f	1	1004	session_hIBcKFxu	f	2019-06-08 00:00:00+00	America/Montreal
4327	7	R	\N	f	20	1066	session_xge4DDam	t	2022-06-19 18:00:00+00	America/Montreal
4328	4	Q1	\N	f	1	1066	session_YtmmKc6y	t	2022-06-18 20:00:00+00	America/Montreal
4329	5	Q2	\N	f	1	1066	session_GvEF56K5	t	2022-06-18 20:00:00+00	America/Montreal
4330	6	Q3	\N	f	1	1066	session_Hwyz1taO	t	2022-06-18 20:00:00+00	America/Montreal
4331	1	FP1	\N	f	1	1066	session_gnsF6Vc4	t	2022-06-17 18:00:00+00	America/Montreal
4332	2	FP2	\N	f	1	1066	session_stLqkgaR	t	2022-06-17 21:00:00+00	America/Montreal
4333	3	FP3	\N	f	1	1066	session_5uQ7v929	t	2022-06-18 17:00:00+00	America/Montreal
4476	7	R	\N	f	22	1087	session_PAxokna3	t	2023-06-18 18:00:00+00	America/Montreal
4477	4	Q1	\N	f	1	1087	session_LXRy3ZFQ	t	2023-06-17 20:00:00+00	America/Montreal
4478	5	Q2	\N	f	1	1087	session_O9WQMIG7	t	2023-06-17 20:00:00+00	America/Montreal
4479	6	Q3	\N	f	1	1087	session_wYBauyjJ	t	2023-06-17 20:00:00+00	America/Montreal
4480	1	FP1	\N	f	1	1087	session_j8LJVZ19	t	2023-06-16 17:30:00+00	America/Montreal
4481	2	FP2	\N	f	1	1087	session_hksCciNu	t	2023-06-16 21:00:00+00	America/Montreal
4482	3	FP3	\N	f	1	1087	session_1i024fC0	t	2023-06-17 16:30:00+00	America/Montreal
4651	7	R	\N	f	22	1110	session_UgX1JoWP	t	2024-06-09 18:00:00+00	America/Montreal
4652	4	Q1	\N	f	1	1110	session_QtS9MRXt	t	2024-06-08 20:00:00+00	America/Montreal
4653	5	Q2	\N	f	1	1110	session_WGvJBuFD	t	2024-06-08 20:00:00+00	America/Montreal
4654	6	Q3	\N	f	1	1110	session_RX8HkUPy	t	2024-06-08 20:00:00+00	America/Montreal
4655	1	FP1	\N	f	1	1110	session_TuSU6NGa	t	2024-06-07 17:30:00+00	America/Montreal
4656	2	FP2	\N	f	1	1110	session_2lXGy1tQ	t	2024-06-07 21:00:00+00	America/Montreal
4657	3	FP3	\N	f	1	1110	session_TrBNQuBI	t	2024-06-08 16:30:00+00	America/Montreal
4839	2	FP2	\N	f	1	1135	session_uMEIgJzn	t	2025-06-13 21:00:00+00	America/Montreal
4840	3	FP3	\N	f	1	1135	session_9ts19wRs	t	2025-06-14 16:30:00+00	America/Montreal
4841	4	Q1	\N	f	1	1135	session_ZnSg5EPe	t	2025-06-14 20:00:00+00	America/Montreal
4842	5	Q2	\N	f	1	1135	session_xVu1yGS8	t	2025-06-14 20:00:00+00	America/Montreal
749	1	QB	\N	f	1	250	session_y3FE7fgP	f	1974-10-04 00:00:00+00	America/New_York
750	\N	QB	\N	f	1	250	session_39AHmZqc	f	1974-10-05 00:00:00+00	America/New_York
884	1	QB	\N	f	1	295	session_xvfwh3Yp	f	1977-09-30 00:00:00+00	America/New_York
885	\N	QB	\N	f	1	295	session_VYp2Ot4S	f	1977-10-01 00:00:00+00	America/New_York
1026	\N	QB	\N	f	1	342	session_H8I4SRS4	f	1980-10-04 00:00:00+00	America/New_York
1188	\N	QB	\N	f	1	396	session_WDQZtdpF	f	1984-06-23 00:00:00+00	America/New_York
1230	\N	QB	\N	f	1	410	session_FqIgT2YB	f	1985-06-22 00:00:00+00	America/New_York
1323	\N	QB	\N	f	1	441	session_WbJ83thZ	f	1987-06-20 00:00:00+00	America/New_York
4299	7	R	\N	f	20	1062	session_Oa1jDRQV	t	2022-05-08 19:30:00+00	America/New_York
4300	4	Q1	\N	f	1	1062	session_XvgVw70I	t	2022-05-07 20:00:00+00	America/New_York
4301	5	Q2	\N	f	1	1062	session_T8GlVAOz	t	2022-05-07 20:00:00+00	America/New_York
4302	6	Q3	\N	f	1	1062	session_xZrFtcfH	t	2022-05-07 20:00:00+00	America/New_York
4303	1	FP1	\N	f	1	1062	session_7hx9OnJQ	t	2022-05-06 18:30:00+00	America/New_York
4304	2	FP2	\N	f	1	1062	session_LOJrkSls	t	2022-05-06 21:30:00+00	America/New_York
4305	3	FP3	\N	f	1	1062	session_BuqgSJD1	t	2022-05-07 17:00:00+00	America/New_York
4633	2	SQ1	\N	f	1	1107	session_xojbosia	t	2024-05-03 20:30:00+00	America/New_York
4634	3	SQ2	\N	f	1	1107	session_eBCjc8iT	t	2024-05-03 20:30:00+00	America/New_York
4635	4	SQ3	\N	f	1	1107	session_cMhYd8La	t	2024-05-03 20:30:00+00	America/New_York
4636	5	SR	\N	f	23	1107	session_TlMZhn3S	t	2024-05-04 16:00:00+00	America/New_York
4813	6	Q1	\N	f	1	1131	session_sZnoM2KJ	t	2025-05-03 20:00:00+00	America/New_York
4814	7	Q2	\N	f	1	1131	session_4mJek7eU	t	2025-05-03 20:00:00+00	America/New_York
4815	8	Q3	\N	f	1	1131	session_GIFrKd3E	t	2025-05-03 20:00:00+00	America/New_York
4816	9	R	57	f	24	1131	session_KkjrO2fg	t	2025-05-04 20:00:00+00	America/New_York
2364	1	FP1	\N	f	1	785	session_os9ALDzR	f	2007-10-19 00:00:00+00	America/Sao_Paulo
2365	2	FP2	\N	f	1	785	session_1wGjylTi	f	2007-10-19 00:00:00+00	America/Sao_Paulo
2366	6	FP3	\N	f	1	785	session_XSQfzpbn	f	2007-10-20 00:00:00+00	America/Sao_Paulo
2486	7	R	\N	f	15	803	session_Fp1nqN2l	t	2008-11-02 17:00:00+00	America/Sao_Paulo
2487	3	Q1	\N	f	1	803	session_AYPTmKLe	f	2008-11-01 00:00:00+00	America/Sao_Paulo
2488	4	Q2	\N	f	1	803	session_kjYsHtXJ	f	2008-11-01 00:00:00+00	America/Sao_Paulo
2489	5	Q3	\N	f	1	803	session_uoqKEhbp	f	2008-11-01 00:00:00+00	America/Sao_Paulo
2490	1	FP1	\N	f	1	803	session_FFLTw3PX	f	2008-10-31 00:00:00+00	America/Sao_Paulo
2491	2	FP2	\N	f	1	803	session_jHbkGI5I	f	2008-10-31 00:00:00+00	America/Sao_Paulo
2492	6	FP3	\N	f	1	803	session_7iroDyTD	f	2008-11-01 00:00:00+00	America/Sao_Paulo
2598	7	R	\N	f	15	819	session_ruFlCgm3	t	2009-10-18 16:00:00+00	America/Sao_Paulo
2599	3	Q1	\N	f	1	819	session_1CVPAipl	f	2009-10-17 00:00:00+00	America/Sao_Paulo
2600	4	Q2	\N	f	1	819	session_eXnKQA4A	f	2009-10-17 00:00:00+00	America/Sao_Paulo
2601	5	Q3	\N	f	1	819	session_aDHwWyYx	f	2009-10-17 00:00:00+00	America/Sao_Paulo
2602	1	FP1	\N	f	1	819	session_eQ9Ps7Jq	f	2009-10-16 00:00:00+00	America/Sao_Paulo
2603	2	FP2	\N	f	1	819	session_0aqi12rN	f	2009-10-16 00:00:00+00	America/Sao_Paulo
2604	6	FP3	\N	f	1	819	session_DbfouRN2	f	2009-10-17 00:00:00+00	America/Sao_Paulo
2731	7	R	\N	f	16	838	session_btcJqXOl	t	2010-11-07 16:00:00+00	America/Sao_Paulo
2732	3	Q1	\N	f	1	838	session_sxx8P2UI	f	2010-11-06 00:00:00+00	America/Sao_Paulo
2733	4	Q2	\N	f	1	838	session_xZm5LWeM	f	2010-11-06 00:00:00+00	America/Sao_Paulo
2734	5	Q3	\N	f	1	838	session_2j0q725d	f	2010-11-06 00:00:00+00	America/Sao_Paulo
2735	1	FP1	\N	f	1	838	session_32ZsaYI6	f	2010-11-05 00:00:00+00	America/Sao_Paulo
2736	2	FP2	\N	f	1	838	session_U7HQwapw	f	2010-11-05 00:00:00+00	America/Sao_Paulo
2737	6	FP3	\N	f	1	838	session_UkEdFbC7	f	2010-11-06 00:00:00+00	America/Sao_Paulo
2871	7	R	\N	f	16	858	session_sDbvnaTk	t	2011-11-27 16:00:00+00	America/Sao_Paulo
2872	3	Q1	\N	f	1	858	session_45gpXJnD	f	2011-11-26 00:00:00+00	America/Sao_Paulo
2873	4	Q2	\N	f	1	858	session_wkBwPXON	f	2011-11-26 00:00:00+00	America/Sao_Paulo
2874	5	Q3	\N	f	1	858	session_06VFWi2P	f	2011-11-26 00:00:00+00	America/Sao_Paulo
2875	1	FP1	\N	f	1	858	session_7gf68g2D	f	2011-11-25 00:00:00+00	America/Sao_Paulo
2876	2	FP2	\N	f	1	858	session_L5KrLQ5F	f	2011-11-25 00:00:00+00	America/Sao_Paulo
2877	6	FP3	\N	f	1	858	session_kqDdejhm	f	2011-11-26 00:00:00+00	America/Sao_Paulo
3017	6	FP3	\N	f	1	878	session_wjfVKLEs	f	2012-11-24 00:00:00+00	America/Sao_Paulo
3150	6	FP3	\N	f	1	897	session_GodqyLng	f	2013-11-23 00:00:00+00	America/Sao_Paulo
3276	6	FP3	\N	f	1	915	session_t9UpYGyN	f	2014-11-08 00:00:00+00	America/Sao_Paulo
3409	6	FP3	\N	f	1	934	session_jLuhx2nr	f	2015-11-14 00:00:00+00	America/Sao_Paulo
3556	6	FP3	\N	f	1	955	session_UI3BUAUD	f	2016-11-12 00:00:00+00	America/Sao_Paulo
3696	6	FP3	\N	f	1	975	session_hUrFFX31	f	2017-11-11 00:00:00+00	America/Sao_Paulo
3843	6	FP3	\N	f	1	996	session_VO6GP31F	f	2018-11-10 00:00:00+00	America/Sao_Paulo
3990	6	FP3	\N	f	1	1017	session_ny9elaUA	f	2019-11-16 00:00:00+00	America/Sao_Paulo
4417	6	SR	\N	f	21	1078	session_nUQBWFF3	t	2022-11-12 19:30:00+00	America/Sao_Paulo
4576	8	SR	\N	f	23	1099	session_vZp8eou2	t	2023-11-04 18:30:00+00	America/Sao_Paulo
4747	5	SR	\N	f	23	1122	session_JgU1L1Rv	t	2024-11-02 14:00:00+00	America/Sao_Paulo
888	\N	QB	\N	f	1	296	session_WrF8WAP9	f	1977-10-08 00:00:00+00	America/Toronto
4107	1	FP1	\N	f	1	1034	session_2RXkC2KN	f	2020-12-04 00:00:00+00	Asia/Bahrain
4108	2	FP2	\N	f	1	1034	session_RGhAumqW	f	2020-12-04 00:00:00+00	Asia/Bahrain
4109	6	FP3	\N	f	1	1034	session_XLQOs3am	f	2020-12-05 00:00:00+00	Asia/Bahrain
4117	7	R	\N	f	18	1036	session_9q2BS6mw	t	2021-03-28 15:00:00+00	Asia/Bahrain
4118	3	Q1	\N	f	1	1036	session_3pQ7W9ZW	f	2021-03-27 00:00:00+00	Asia/Bahrain
4119	4	Q2	\N	f	1	1036	session_7c6xP3O4	f	2021-03-27 00:00:00+00	Asia/Bahrain
4120	5	Q3	\N	f	1	1036	session_ED83T5x7	f	2021-03-27 00:00:00+00	Asia/Bahrain
4121	1	FP1	\N	f	1	1036	session_CiVomkBs	f	2021-03-26 00:00:00+00	Asia/Bahrain
4122	2	FP2	\N	f	1	1036	session_r6LT5o1g	f	2021-03-26 00:00:00+00	Asia/Bahrain
4123	6	FP3	\N	f	1	1036	session_7je8Dys5	f	2021-03-27 00:00:00+00	Asia/Bahrain
4277	3	FP3	\N	f	1	1058	session_X2K9eZFq	t	2022-03-19 12:00:00+00	Asia/Bahrain
2268	6	FP3	\N	f	1	771	session_bkeumw72	f	2007-04-14 00:00:00+00	Asia/Bahrain
3472	6	FP3	\N	f	1	943	session_qBo9N5FA	f	2016-06-18 00:00:00+00	Asia/Baku
3003	6	FP3	\N	f	1	876	session_mtawYdWb	f	2012-11-03 00:00:00+00	Asia/Dubai
3283	6	FP3	\N	f	1	916	session_C3DrqTkZ	f	2014-11-22 00:00:00+00	Asia/Dubai
3416	6	FP3	\N	f	1	935	session_4PIR9wAv	f	2015-11-28 00:00:00+00	Asia/Dubai
2891	6	FP3	\N	f	1	860	session_brZgPxK6	f	2012-03-24 00:00:00+00	Asia/Kuala_Lumpur
3031	6	FP3	\N	f	1	880	session_cwUmJhuu	f	2013-03-23 00:00:00+00	Asia/Kuala_Lumpur
3164	6	FP3	\N	f	1	899	session_SS5ofyLu	f	2014-03-29 00:00:00+00	Asia/Kuala_Lumpur
3297	6	FP3	\N	f	1	918	session_ELQKvdTs	f	2015-03-28 00:00:00+00	Asia/Kuala_Lumpur
3528	6	FP3	\N	f	1	951	session_ZBpKXSCQ	f	2016-10-01 00:00:00+00	Asia/Kuala_Lumpur
3668	6	FP3	\N	f	1	971	session_xjpTnF3y	f	2017-09-30 00:00:00+00	Asia/Kuala_Lumpur
3115	6	FP3	\N	f	1	892	session_2gGbGYsf	f	2013-10-05 00:00:00+00	Asia/Seoul
2512	2	FP2	\N	f	1	806	session_js64vOro	f	2009-04-17 00:00:00+00	Asia/Shanghai
2513	6	FP3	\N	f	1	806	session_rgPzDY9f	f	2009-04-18 00:00:00+00	Asia/Shanghai
2639	6	FP3	\N	f	1	824	session_hBYkx0s2	f	2010-04-17 00:00:00+00	Asia/Shanghai
2765	6	FP3	\N	f	1	842	session_bubforLn	f	2011-04-16 00:00:00+00	Asia/Shanghai
2898	6	FP3	\N	f	1	861	session_OIrERGM3	f	2012-04-14 00:00:00+00	Asia/Shanghai
3038	6	FP3	\N	f	1	881	session_F51PFEp1	f	2013-04-13 00:00:00+00	Asia/Shanghai
3304	6	FP3	\N	f	1	919	session_kzuPCSKu	f	2015-04-11 00:00:00+00	Asia/Shanghai
3724	6	FP3	\N	f	1	979	session_WYx90oRV	f	2018-04-14 00:00:00+00	Asia/Shanghai
3871	6	FP3	\N	f	1	1000	session_qXqk40rW	f	2019-04-13 00:00:00+00	Asia/Shanghai
3521	6	FP3	\N	f	1	950	session_0Ostbav0	f	2016-09-17 00:00:00+00	Asia/Singapore
3661	6	FP3	\N	f	1	970	session_cd73vIRi	f	2017-09-16 00:00:00+00	Asia/Singapore
3808	6	FP3	\N	f	1	991	session_hZgfAfwk	f	2018-09-15 00:00:00+00	Asia/Singapore
1496	1	QB	\N	f	1	499	session_p9C8TPVp	f	1990-10-19 00:00:00+00	Asia/Tokyo
1497	\N	QB	\N	f	1	499	session_gG19Pvm2	f	1990-10-20 00:00:00+00	Asia/Tokyo
1648	2	R	\N	f	14	550	session_XIigOl1w	f	1994-04-17 00:00:00+00	Asia/Tokyo
1649	1	QB	\N	f	1	550	session_jn0qw1VB	f	1994-04-15 00:00:00+00	Asia/Tokyo
1650	\N	QB	\N	f	1	550	session_zSQZj3Pm	f	1994-04-16 00:00:00+00	Asia/Tokyo
1738	2	R	\N	f	14	580	session_E6eXN2Qy	f	1995-10-29 00:00:00+00	Asia/Tokyo
1739	1	QB	\N	f	1	580	session_pCPnM0YJ	f	1995-10-27 00:00:00+00	Asia/Tokyo
1740	\N	QB	\N	f	1	580	session_jtuIMtHC	f	1995-10-28 00:00:00+00	Asia/Tokyo
1774	2	R	\N	f	14	597	session_a9jSr2gv	f	1996-10-13 00:00:00+00	Asia/Tokyo
1775	1	QB	\N	f	1	597	session_2GuigRnu	f	1996-10-12 00:00:00+00	Asia/Tokyo
1841	1	QB	\N	f	1	630	session_0TyFb4l7	f	1998-10-31 00:00:00+00	Asia/Tokyo
1872	2	R	\N	f	14	646	session_nRUlL8C8	f	1999-10-31 00:00:00+00	Asia/Tokyo
1873	1	QB	\N	f	1	646	session_EAxloeUz	f	1999-10-30 00:00:00+00	Asia/Tokyo
2023	2	QB	\N	f	1	713	session_rhR0PfuM	f	2003-10-11 00:00:00+00	Asia/Tokyo
2240	6	FP3	\N	f	1	767	session_EVXAFI4d	f	2006-10-07 00:00:00+00	Asia/Tokyo
2352	6	FP3	\N	f	1	783	session_s7dLAG6I	f	2007-09-29 00:00:00+00	Asia/Tokyo
2723	6	FP3	\N	f	1	836	session_8d3iyZYb	f	2010-10-09 00:00:00+00	Asia/Tokyo
2849	6	FP3	\N	f	1	854	session_OaEfPGyz	f	2011-10-08 00:00:00+00	Asia/Tokyo
3122	6	FP3	\N	f	1	893	session_64l3zXQA	f	2013-10-12 00:00:00+00	Asia/Tokyo
3255	6	FP3	\N	f	1	912	session_afxnjaHr	f	2014-10-04 00:00:00+00	Asia/Tokyo
3381	6	FP3	\N	f	1	930	session_fD9CTMVt	f	2015-09-26 00:00:00+00	Asia/Tokyo
3535	6	FP3	\N	f	1	952	session_4q98tA3O	f	2016-10-08 00:00:00+00	Asia/Tokyo
3968	2	FP2	\N	f	1	1014	session_HMQQBlbl	f	2019-10-11 00:00:00+00	Asia/Tokyo
3969	6	FP3	\N	f	1	1014	session_o8dHEb8s	f	2019-10-12 00:00:00+00	Asia/Tokyo
2597	6	FP3	\N	f	1	818	session_w6E4QzZ2	f	2009-10-03 00:00:00+00	Asia/Tokyo
2982	6	FP3	\N	f	1	873	session_9FEPuKDs	f	2012-10-06 00:00:00+00	Asia/Tokyo
440	1	QB	\N	f	1	147	session_9LXCsMU8	f	1966-08-05 00:00:00+00	Europe/Berlin
441	\N	QB	\N	f	1	147	session_m1KL4ZgN	f	1966-08-06 00:00:00+00	Europe/Berlin
507	\N	QB	\N	f	1	169	session_EfJahBwT	f	1968-08-03 00:00:00+00	Europe/Berlin
648	\N	QB	\N	f	1	216	session_5FM7fY2C	f	1972-07-29 00:00:00+00	Europe/Berlin
738	\N	QB	\N	f	1	246	session_ed2gSGHb	f	1974-08-03 00:00:00+00	Europe/Berlin
822	\N	QB	\N	f	1	274	session_rDXLEiYN	f	1976-07-31 00:00:00+00	Europe/Berlin
969	\N	QB	\N	f	1	323	session_Qn41Vrmx	f	1979-07-28 00:00:00+00	Europe/Berlin
1196	1	QB	\N	f	1	399	session_Z5zo3ywC	f	1984-08-03 00:00:00+00	Europe/Berlin
1197	\N	QB	\N	f	1	399	session_zofuMx1R	f	1984-08-04 00:00:00+00	Europe/Berlin
1331	1	QB	\N	f	1	444	session_brqHMhn0	f	1987-07-24 00:00:00+00	Europe/Berlin
1332	\N	QB	\N	f	1	444	session_dOHqnrjY	f	1987-07-25 00:00:00+00	Europe/Berlin
1718	1	QB	\N	f	1	573	session_Xy8ddU1k	f	1995-07-28 00:00:00+00	Europe/Berlin
1719	\N	QB	\N	f	1	573	session_ogNXysKy	f	1995-07-29 00:00:00+00	Europe/Berlin
1765	1	QB	\N	f	1	592	session_XrDD61ia	f	1996-07-27 00:00:00+00	Europe/Berlin
1794	2	R	\N	f	14	607	session_iwdRnzEp	f	1997-07-27 00:00:00+00	Europe/Berlin
1795	1	QB	\N	f	1	607	session_AzYYY7Jo	f	1997-07-26 00:00:00+00	Europe/Berlin
1860	2	R	\N	f	14	640	session_RmdyjSHX	f	1999-08-01 00:00:00+00	Europe/Berlin
1861	1	QB	\N	f	1	640	session_bOKRmpVf	f	1999-07-31 00:00:00+00	Europe/Berlin
1868	2	R	\N	f	14	644	session_0zMQFF0K	f	1999-09-26 00:00:00+00	Europe/Berlin
1869	1	QB	\N	f	1	644	session_oHfUHBQN	f	1999-09-25 00:00:00+00	Europe/Berlin
1924	2	R	\N	f	14	672	session_Tdtj9pQT	f	2001-06-24 00:00:00+00	Europe/Berlin
1925	1	QB	\N	f	1	672	session_FqFliSpK	f	2001-06-23 00:00:00+00	Europe/Berlin
1930	2	R	\N	f	14	675	session_6xCABKTM	f	2001-07-29 00:00:00+00	Europe/Berlin
1931	1	QB	\N	f	1	675	session_wvuqlPus	f	2001-07-28 00:00:00+00	Europe/Berlin
2000	3	R	\N	f	15	706	session_RmP9hKbT	f	2003-06-29 00:00:00+00	Europe/Berlin
2001	1	QO	\N	f	1	706	session_5WgnudUk	f	2003-06-27 00:00:00+00	Europe/Berlin
2002	2	QB	\N	f	1	706	session_7wFKA1Jg	f	2003-06-28 00:00:00+00	Europe/Berlin
2009	3	R	\N	f	15	709	session_1FgdZxBB	f	2003-08-03 00:00:00+00	Europe/Berlin
2010	1	QO	\N	f	1	709	session_K3uWK0fx	f	2003-08-01 00:00:00+00	Europe/Berlin
2011	2	QB	\N	f	1	709	session_3KENy7vY	f	2003-08-02 00:00:00+00	Europe/Berlin
2058	1	QO	\N	f	1	725	session_Dt73m07d	f	2004-07-24 00:00:00+00	Europe/Berlin
2059	2	QB	\N	f	1	725	session_w68CPLgZ	f	2004-07-24 00:00:00+00	Europe/Berlin
2096	2	R	\N	f	15	738	session_n2m9kCnY	t	2005-05-29 14:00:00+00	Europe/Berlin
2097	1	QB	\N	f	1	738	session_pdVW5OtO	f	2005-05-28 00:00:00+00	Europe/Berlin
2154	1	FP1	\N	f	1	755	session_HOk1ciYf	f	2006-05-05 00:00:00+00	Europe/Berlin
2155	2	FP2	\N	f	1	755	session_7HqOns6w	f	2006-05-05 00:00:00+00	Europe/Berlin
2156	6	FP3	\N	f	1	755	session_ab0eZ338	f	2006-05-06 00:00:00+00	Europe/Berlin
2205	6	FP3	\N	f	1	762	session_yHlkQJyq	f	2006-07-29 00:00:00+00	Europe/Berlin
2436	6	FP3	\N	f	1	795	session_qAEXwK8n	f	2008-07-19 00:00:00+00	Europe/Berlin
2555	6	FP3	\N	f	1	812	session_jhI6768U	f	2009-07-11 00:00:00+00	Europe/Berlin
2814	6	FP3	\N	f	1	849	session_siXdBfmc	f	2011-07-23 00:00:00+00	Europe/Berlin
2947	6	FP3	\N	f	1	868	session_AOzz7exT	f	2012-07-21 00:00:00+00	Europe/Berlin
3499	2	FP2	\N	f	1	947	session_6pcdaits	f	2016-07-29 00:00:00+00	Europe/Berlin
3500	6	FP3	\N	f	1	947	session_Q9e3AW7v	f	2016-07-30 00:00:00+00	Europe/Berlin
3780	6	FP3	\N	f	1	987	session_T3AIOqGR	f	2018-07-21 00:00:00+00	Europe/Berlin
3927	6	FP3	\N	f	1	1008	session_usPW3Buo	f	2019-07-27 00:00:00+00	Europe/Berlin
4070	4	Q2	\N	f	1	1029	session_Tu5UNpSD	f	2020-10-10 00:00:00+00	Europe/Berlin
4071	5	Q3	\N	f	1	1029	session_42uINAlu	f	2020-10-10 00:00:00+00	Europe/Berlin
4072	1	FP1	\N	f	1	1029	session_kEO4lCcG	f	2020-10-09 00:00:00+00	Europe/Berlin
4073	2	FP2	\N	f	1	1029	session_WYenPDSn	f	2020-10-09 00:00:00+00	Europe/Berlin
4074	6	FP3	\N	f	1	1029	session_OZEdZRUs	f	2020-10-10 00:00:00+00	Europe/Berlin
215	1	QB	\N	f	1	72	session_VxxHBOb4	f	1958-08-01 00:00:00+00	Europe/Berlin
4867	9	R	44	f	24	1138	session_aN6sq8kI	t	2025-07-27 13:00:00+00	Europe/Brussels
54	\N	QB	\N	f	1	18	session_rjiaScYL	f	1952-06-21 00:00:00+00	Europe/Brussels
2457	6	FP3	\N	f	1	798	session_od9cwLDY	f	2008-09-06 00:00:00+00	Europe/Brussels
3647	6	FP3	\N	f	1	968	session_tx57lL4i	f	2017-08-26 00:00:00+00	Europe/Brussels
3794	6	FP3	\N	f	1	989	session_J9tt3Juo	f	2018-08-25 00:00:00+00	Europe/Brussels
3941	6	FP3	\N	f	1	1010	session_sBS6YPBy	f	2019-08-31 00:00:00+00	Europe/Brussels
1482	\N	QB	\N	f	1	494	session_laDFdyGt	f	1990-08-11 00:00:00+00	Europe/Budapest
1629	\N	QB	\N	f	1	543	session_RM75wTv1	f	1993-08-14 00:00:00+00	Europe/Budapest
1722	\N	QB	\N	f	1	574	session_koLlIl4v	f	1995-08-12 00:00:00+00	Europe/Budapest
2443	6	FP3	\N	f	1	796	session_ho10khkD	f	2008-08-02 00:00:00+00	Europe/Budapest
2562	6	FP3	\N	f	1	813	session_TMxibzjG	f	2009-07-25 00:00:00+00	Europe/Budapest
2821	6	FP3	\N	f	1	850	session_hm8G9Vf0	f	2011-07-30 00:00:00+00	Europe/Budapest
3087	6	FP3	\N	f	1	888	session_laVF4qWW	f	2013-07-27 00:00:00+00	Europe/Budapest
3227	6	FP3	\N	f	1	908	session_4MPdwRsw	f	2014-07-26 00:00:00+00	Europe/Budapest
3353	6	FP3	\N	f	1	926	session_p9931ZAC	f	2015-07-25 00:00:00+00	Europe/Budapest
3493	6	FP3	\N	f	1	946	session_USNtdOzB	f	2016-07-23 00:00:00+00	Europe/Budapest
3640	6	FP3	\N	f	1	967	session_iXmabQAS	f	2017-07-29 00:00:00+00	Europe/Budapest
3787	6	FP3	\N	f	1	988	session_DWMhBuPi	f	2018-07-28 00:00:00+00	Europe/Budapest
3934	6	FP3	\N	f	1	1009	session_AHF8xDEp	f	2019-08-03 00:00:00+00	Europe/Budapest
4193	6	FP3	\N	f	1	1046	session_urr5VOH4	f	2021-07-31 00:00:00+00	Europe/Budapest
1193	1	QB	\N	f	1	398	session_RUNGmevh	f	1984-07-20 00:00:00+00	Europe/London
1194	\N	QB	\N	f	1	398	session_8PkTbGjz	f	1984-07-21 00:00:00+00	Europe/London
1476	\N	QB	\N	f	1	492	session_oTI3Oyhl	f	1990-07-14 00:00:00+00	Europe/London
1574	1	QB	\N	f	1	525	session_g2o4JICU	f	1992-07-10 00:00:00+00	Europe/London
1575	\N	QB	\N	f	1	525	session_6WMQ60FO	f	1992-07-11 00:00:00+00	Europe/London
1623	\N	QB	\N	f	1	541	session_k5nfEYZ3	f	1993-07-10 00:00:00+00	Europe/London
1716	\N	QB	\N	f	1	572	session_pxEMdUJN	f	1995-07-15 00:00:00+00	Europe/London
2310	6	FP3	\N	f	1	777	session_NBMVHtgU	f	2007-07-07 00:00:00+00	Europe/London
2429	6	FP3	\N	f	1	794	session_iVPud995	f	2008-07-05 00:00:00+00	Europe/London
2681	6	FP3	\N	f	1	830	session_uYYoCH74	f	2010-07-10 00:00:00+00	Europe/London
2940	6	FP3	\N	f	1	867	session_nN7nP6Uv	f	2012-07-07 00:00:00+00	Europe/London
3346	6	FP3	\N	f	1	925	session_AB8NhoN5	f	2015-07-04 00:00:00+00	Europe/London
3633	6	FP3	\N	f	1	966	session_5GRG2EEI	f	2017-07-15 00:00:00+00	Europe/London
3773	6	FP3	\N	f	1	986	session_sLHsob3O	f	2018-07-07 00:00:00+00	Europe/London
3920	6	FP3	\N	f	1	1007	session_T2Dg07pP	f	2019-07-13 00:00:00+00	Europe/London
4031	2	FP2	\N	f	1	1023	session_aSlU6kc2	f	2020-08-07 00:00:00+00	Europe/London
4032	6	FP3	\N	f	1	1023	session_jHZSeXqX	f	2020-08-08 00:00:00+00	Europe/London
4186	6	SR	\N	f	19	1045	session_NmjuV5Um	f	2021-07-17 00:00:00+00	Europe/London
141	\N	QB	\N	f	1	47	session_TjlLIdDZ	f	1955-07-15 00:00:00+00	Europe/London
2672	1	FP1	\N	f	1	829	session_phZlI10m	f	2010-06-25 00:00:00+00	Europe/Madrid
2673	2	FP2	\N	f	1	829	session_rabsopfD	f	2010-06-25 00:00:00+00	Europe/Madrid
2674	6	FP3	\N	f	1	829	session_sHavkIXM	f	2010-06-26 00:00:00+00	Europe/Madrid
2779	6	FP3	\N	f	1	844	session_zm44WuLU	f	2011-05-21 00:00:00+00	Europe/Madrid
2794	7	R	\N	f	16	847	session_JVegWhCA	t	2011-06-26 12:00:00+00	Europe/Madrid
2795	3	Q1	\N	f	1	847	session_3gPopuwL	f	2011-06-25 00:00:00+00	Europe/Madrid
2796	4	Q2	\N	f	1	847	session_5x7H4CG0	f	2011-06-25 00:00:00+00	Europe/Madrid
2797	5	Q3	\N	f	1	847	session_BCb5Rj6S	f	2011-06-25 00:00:00+00	Europe/Madrid
2798	1	FP1	\N	f	1	847	session_GJaozQRl	f	2011-06-24 00:00:00+00	Europe/Madrid
2799	2	FP2	\N	f	1	847	session_7vif3LIc	f	2011-06-24 00:00:00+00	Europe/Madrid
2800	6	FP3	\N	f	1	847	session_RJ4IyUqG	f	2011-06-25 00:00:00+00	Europe/Madrid
2912	6	FP3	\N	f	1	863	session_D3hCw65u	f	2012-05-12 00:00:00+00	Europe/Madrid
2933	6	FP3	\N	f	1	866	session_UGPANVWi	f	2012-06-23 00:00:00+00	Europe/Madrid
3052	6	FP3	\N	f	1	883	session_zsy1WJD6	f	2013-05-11 00:00:00+00	Europe/Madrid
3185	6	FP3	\N	f	1	902	session_UfdxVzTK	f	2014-05-10 00:00:00+00	Europe/Madrid
3451	6	FP3	\N	f	1	940	session_8MquSWVo	f	2016-05-14 00:00:00+00	Europe/Madrid
2408	6	FP3	\N	f	1	791	session_Ow5K7Zmi	f	2008-05-24 00:00:00+00	Europe/Monaco
3192	6	FP3	\N	f	1	903	session_kCjGydLh	f	2014-05-24 00:00:00+00	Europe/Monaco
3325	6	FP3	\N	f	1	922	session_berizycE	f	2015-05-23 00:00:00+00	Europe/Monaco
3458	6	FP3	\N	f	1	941	session_yBlTRctH	f	2016-05-28 00:00:00+00	Europe/Monaco
3605	6	FP3	\N	f	1	962	session_XfEZ7llb	f	2017-05-27 00:00:00+00	Europe/Monaco
3745	6	FP3	\N	f	1	982	session_JzV9PcMc	f	2018-05-26 00:00:00+00	Europe/Monaco
3892	6	FP3	\N	f	1	1003	session_MKjmkGrl	f	2019-05-25 00:00:00+00	Europe/Monaco
284	1	QB	\N	f	1	95	session_zw5ZMk6f	f	1961-05-11 00:00:00+00	Europe/Monaco
732	\N	QB	\N	f	1	244	session_cwx3GcKj	f	1974-07-06 00:00:00+00	Europe/Paris
744	\N	QB	\N	f	1	248	session_cpgHDDo1	f	1974-09-07 00:00:00+00	Europe/Rome
881	1	QB	\N	f	1	294	session_uwMayAp4	f	1977-09-09 00:00:00+00	Europe/Rome
882	\N	QB	\N	f	1	294	session_ZqUF637r	f	1977-09-10 00:00:00+00	Europe/Rome
1036	2	R	\N	f	13	346	session_LZLvFDMw	f	1981-05-03 00:00:00+00	Europe/Rome
1037	1	QB	\N	f	1	346	session_RFpqQTrH	f	1981-05-01 00:00:00+00	Europe/Rome
1038	\N	QB	\N	f	1	346	session_8OhvUNOu	f	1981-05-02 00:00:00+00	Europe/Rome
1083	\N	QB	\N	f	1	361	session_mHOPswqn	f	1982-04-24 00:00:00+00	Europe/Rome
1114	2	R	\N	f	13	372	session_eG5fIOjQ	f	1982-09-12 00:00:00+00	Europe/Rome
1115	1	QB	\N	f	1	372	session_ADNf8GWu	f	1982-09-10 00:00:00+00	Europe/Rome
1116	\N	QB	\N	f	1	372	session_aUfcgm79	f	1982-09-11 00:00:00+00	Europe/Rome
1175	1	QB	\N	f	1	392	session_mFKKokSJ	f	1984-05-04 00:00:00+00	Europe/Rome
1176	\N	QB	\N	f	1	392	session_1ciNvPSH	f	1984-05-05 00:00:00+00	Europe/Rome
1221	\N	QB	\N	f	1	407	session_kbpkCg7J	f	1985-05-04 00:00:00+00	Europe/Rome
1246	2	R	\N	f	13	416	session_HcvLofH4	f	1985-09-08 00:00:00+00	Europe/Rome
1247	1	QB	\N	f	1	416	session_jGP0s3Vf	f	1985-09-06 00:00:00+00	Europe/Rome
1248	\N	QB	\N	f	1	416	session_dmKOxzEL	f	1985-09-07 00:00:00+00	Europe/Rome
1267	2	R	\N	f	13	423	session_EOy1LNoV	f	1986-04-27 00:00:00+00	Europe/Rome
1268	1	QB	\N	f	1	423	session_ZuAHPOkw	f	1986-04-25 00:00:00+00	Europe/Rome
1269	\N	QB	\N	f	1	423	session_LPvbgOUL	f	1986-04-26 00:00:00+00	Europe/Rome
1314	\N	QB	\N	f	1	438	session_PPuMLeQv	f	1987-05-02 00:00:00+00	Europe/Rome
1339	2	R	\N	f	13	447	session_koR203ui	f	1987-09-06 00:00:00+00	Europe/Rome
1340	1	QB	\N	f	1	447	session_YRoWI0Zo	f	1987-09-04 00:00:00+00	Europe/Rome
1341	\N	QB	\N	f	1	447	session_MLP4Tf5O	f	1987-09-05 00:00:00+00	Europe/Rome
1392	\N	QB	\N	f	1	464	session_ca6OlPsJ	f	1988-09-10 00:00:00+00	Europe/Rome
1408	2	R	\N	f	13	470	session_HmoI7KHA	f	1989-04-23 00:00:00+00	Europe/Rome
1409	1	QB	\N	f	1	470	session_7yiNC6gQ	f	1989-04-21 00:00:00+00	Europe/Rome
1410	\N	QB	\N	f	1	470	session_PTwgN0RI	f	1989-04-22 00:00:00+00	Europe/Rome
1460	1	QB	\N	f	1	487	session_nSVisZWv	f	1990-05-11 00:00:00+00	Europe/Rome
1461	\N	QB	\N	f	1	487	session_XJ3EpLPC	f	1990-05-12 00:00:00+00	Europe/Rome
1486	2	R	\N	f	13	496	session_wkUthcci	f	1990-09-09 00:00:00+00	Europe/Rome
1487	1	QB	\N	f	1	496	session_wLsBeVF0	f	1990-09-07 00:00:00+00	Europe/Rome
1488	\N	QB	\N	f	1	496	session_5llYgQlJ	f	1990-09-08 00:00:00+00	Europe/Rome
1536	\N	QB	\N	f	1	512	session_IT8Lxep1	f	1991-09-07 00:00:00+00	Europe/Rome
1561	2	R	\N	f	14	521	session_UL4VDcLY	f	1992-05-17 00:00:00+00	Europe/Rome
1562	1	QB	\N	f	1	521	session_BwdDFrvT	f	1992-05-15 00:00:00+00	Europe/Rome
1563	\N	QB	\N	f	1	521	session_FxHnRnCf	f	1992-05-16 00:00:00+00	Europe/Rome
1608	\N	QB	\N	f	1	536	session_j7qK6JWC	f	1993-04-24 00:00:00+00	Europe/Rome
1633	2	R	\N	f	14	545	session_K4s7tFJj	f	1993-09-12 00:00:00+00	Europe/Rome
1634	1	QB	\N	f	1	545	session_bHn9IeMI	f	1993-09-10 00:00:00+00	Europe/Rome
1635	\N	QB	\N	f	1	545	session_nimTbpMP	f	1993-09-11 00:00:00+00	Europe/Rome
1700	1	QB	\N	f	1	567	session_naYLY0Wo	f	1995-04-28 00:00:00+00	Europe/Rome
1701	\N	QB	\N	f	1	567	session_9PjsAi6Q	f	1995-04-29 00:00:00+00	Europe/Rome
1770	2	R	\N	f	14	595	session_LF95Pnci	f	1996-09-08 00:00:00+00	Europe/Rome
1771	1	QB	\N	f	1	595	session_EjQ5MJYh	f	1996-09-07 00:00:00+00	Europe/Rome
1782	2	R	\N	f	14	601	session_IgcpN2E8	f	1997-04-27 00:00:00+00	Europe/Rome
1783	1	QB	\N	f	1	601	session_LgTNcVdt	f	1997-04-26 00:00:00+00	Europe/Rome
1800	2	R	\N	f	14	610	session_mZA9fUk8	f	1997-09-07 00:00:00+00	Europe/Rome
1847	1	QB	\N	f	1	633	session_aEaM37jF	f	1999-05-01 00:00:00+00	Europe/Rome
1866	2	R	\N	f	14	643	session_LE3yaS4Q	f	1999-09-12 00:00:00+00	Europe/Rome
1867	1	QB	\N	f	1	643	session_Ft7EgqjX	f	1999-09-11 00:00:00+00	Europe/Rome
1915	1	QB	\N	f	1	667	session_VoSV47Gd	f	2001-04-14 00:00:00+00	Europe/Rome
1936	2	R	\N	f	14	678	session_22Qg69JM	f	2001-09-16 00:00:00+00	Europe/Rome
1937	1	QB	\N	f	1	678	session_HXTR7oGT	f	2001-09-15 00:00:00+00	Europe/Rome
1948	2	R	\N	f	14	684	session_JNdA3m48	f	2002-04-14 00:00:00+00	Europe/Rome
1949	1	QB	\N	f	1	684	session_6f6HybNl	f	2002-04-13 00:00:00+00	Europe/Rome
2017	2	QB	\N	f	1	711	session_1adlscko	f	2003-09-13 00:00:00+00	Europe/Rome
2068	2	QB	\N	f	1	728	session_gZxJl7fO	f	2004-09-11 00:00:00+00	Europe/Rome
2087	2	R	\N	f	15	735	session_f8YgTagq	t	2005-04-24 14:00:00+00	Europe/Rome
2088	1	QA	\N	f	1	735	session_aXfo6tEV	f	2005-04-23 00:00:00+00	Europe/Rome
2089	3	QA	\N	f	1	735	session_rM0jTPRe	f	2005-04-24 00:00:00+00	Europe/Rome
2147	1	FP1	\N	f	1	754	session_DY4VbNga	f	2006-04-21 00:00:00+00	Europe/Rome
2148	2	FP2	\N	f	1	754	session_gKLCvRJ3	f	2006-04-21 00:00:00+00	Europe/Rome
2149	6	FP3	\N	f	1	754	session_5hoKvx27	f	2006-04-22 00:00:00+00	Europe/Rome
2226	6	FP3	\N	f	1	765	session_Z57uFPv4	f	2006-09-09 00:00:00+00	Europe/Rome
2338	6	FP3	\N	f	1	781	session_mWNXDjJK	f	2007-09-08 00:00:00+00	Europe/Rome
2464	6	FP3	\N	f	1	799	session_nHPkRuQA	f	2008-09-13 00:00:00+00	Europe/Rome
2583	6	FP3	\N	f	1	816	session_l7oIaWRl	f	2009-09-12 00:00:00+00	Europe/Rome
2709	6	FP3	\N	f	1	834	session_TWXdYfwU	f	2010-09-11 00:00:00+00	Europe/Rome
2968	6	FP3	\N	f	1	871	session_hpwVeLkz	f	2012-09-08 00:00:00+00	Europe/Rome
3101	6	FP3	\N	f	1	890	session_ISA3bbkk	f	2013-09-07 00:00:00+00	Europe/Rome
2016	1	QO	\N	f	1	711	session_x2kTFTi4	f	2003-09-12 00:00:00+00	Europe/Rome
4008	5	Q3	\N	f	1	1020	session_90Gy3rmG	f	2020-07-11 00:00:00+00	Europe/Vienna
4009	1	FP1	\N	f	1	1020	session_6TXgTR1M	f	2020-07-10 00:00:00+00	Europe/Vienna
4010	2	FP2	\N	f	1	1020	session_nZvOdbzZ	f	2020-07-10 00:00:00+00	Europe/Vienna
4011	6	FP3	\N	f	1	1020	session_tUXk86Zw	f	2020-07-11 00:00:00+00	Europe/Vienna
4178	2	FP2	\N	f	1	1044	session_5yvpSf5v	f	2021-07-02 00:00:00+00	Europe/Vienna
4179	6	FP3	\N	f	1	1044	session_nzUAE9HR	f	2021-07-03 00:00:00+00	Europe/Vienna
4673	5	SR	\N	f	23	1112	session_Vom6afwe	t	2024-06-29 10:00:00+00	Europe/Vienna
4917	1	FP1	\N	f	1	1146	session_SI1U6PYh	t	2025-11-07 14:30:00+00	America/Sao_Paulo
4918	2	SQ1	\N	f	1	1146	session_IcAA6h2t	t	2025-11-07 18:30:00+00	America/Sao_Paulo
4919	3	SQ2	\N	f	1	1146	session_O9jqiWX4	t	2025-11-07 18:30:00+00	America/Sao_Paulo
4920	4	SQ3	\N	f	1	1146	session_IBmZGz57	t	2025-11-07 18:30:00+00	America/Sao_Paulo
4921	5	SR	\N	f	23	1146	session_neHaau0w	t	2025-11-08 14:00:00+00	America/Sao_Paulo
4922	6	Q1	\N	f	1	1146	session_WmYnvwvA	t	2025-11-08 18:00:00+00	America/Sao_Paulo
4923	7	Q2	\N	f	1	1146	session_76xXoLUT	t	2025-11-08 18:00:00+00	America/Sao_Paulo
4924	8	Q3	\N	f	1	1146	session_NmygkTs6	t	2025-11-08 18:00:00+00	America/Sao_Paulo
4925	9	R	71	f	24	1146	session_ETpcqxCO	t	2025-11-09 17:00:00+00	America/Sao_Paulo
4905	3	SQ2	\N	f	1	1144	session_N1gXtOoY	t	2025-10-17 21:30:00+00	America/Chicago
4906	4	SQ3	\N	f	1	1144	session_b6vAiInO	t	2025-10-17 21:30:00+00	America/Chicago
4907	5	SR	\N	f	23	1144	session_rHevTUp2	t	2025-10-18 17:00:00+00	America/Chicago
4908	6	Q1	\N	f	1	1144	session_MXIwqlPC	t	2025-10-18 21:00:00+00	America/Chicago
4909	7	Q2	\N	f	1	1144	session_of0KAzPQ	t	2025-10-18 21:00:00+00	America/Chicago
4926	1	FP1	\N	f	1	1147	session_ksdCqkmg	t	2025-11-21 00:30:00+00	America/Los_Angeles
4927	2	FP2	\N	f	1	1147	session_yQqf13cc	t	2025-11-21 04:00:00+00	America/Los_Angeles
4910	1	FP1	\N	f	1	1145	session_g3UBfe2y	t	2025-10-24 18:30:00+00	America/Mexico_City
4911	2	FP2	\N	f	1	1145	session_sPWf1Rn3	t	2025-10-24 22:00:00+00	America/Mexico_City
4912	3	FP3	\N	f	1	1145	session_mBI6BxaH	t	2025-10-25 17:30:00+00	America/Mexico_City
4913	4	Q1	\N	f	1	1145	session_gl98Ejgu	t	2025-10-25 21:00:00+00	America/Mexico_City
4914	5	Q2	\N	f	1	1145	session_18x7AxG8	t	2025-10-25 21:00:00+00	America/Mexico_City
4915	6	Q3	\N	f	1	1145	session_tVrj12W2	t	2025-10-25 21:00:00+00	America/Mexico_City
4916	7	R	71	f	24	1145	session_kUlCzvH2	t	2025-10-26 20:00:00+00	America/Mexico_City
64	2	R	\N	f	2	22	session_xRz2JwC8	f	1952-08-17 00:00:00+00	Europe/Amsterdam
65	1	QB	\N	f	1	22	session_bMYRPDvq	f	1952-08-15 00:00:00+00	Europe/Amsterdam
66	\N	QB	\N	f	1	22	session_jMqyj2fh	f	1952-08-16 00:00:00+00	Europe/Amsterdam
37	2	R	\N	f	2	13	session_aUryL4oE	f	1951-07-29 00:00:00+00	Europe/Berlin
38	1	QB	\N	f	1	13	session_Q5YVtvll	f	1951-07-27 00:00:00+00	Europe/Berlin
39	\N	QB	\N	f	1	13	session_wfY8tBXY	f	1951-07-28 00:00:00+00	Europe/Berlin
13	2	R	\N	f	2	5	session_nPfJZRH0	f	1950-06-18 00:00:00+00	Europe/Brussels
14	1	QB	\N	f	1	5	session_s8uKbySV	f	1950-06-16 00:00:00+00	Europe/Brussels
15	\N	QB	\N	f	1	5	session_eUSUcggs	f	1950-06-17 00:00:00+00	Europe/Brussels
28	2	R	\N	f	2	10	session_rm9c1y6l	f	1951-06-17 00:00:00+00	Europe/Brussels
29	1	QB	\N	f	1	10	session_NdlH6XJx	f	1951-06-15 00:00:00+00	Europe/Brussels
30	\N	QB	\N	f	1	10	session_OFDDL8rZ	f	1951-06-16 00:00:00+00	Europe/Brussels
1	2	R	\N	f	2	1	session_8sj3ZIRr	f	1950-05-13 00:00:00+00	Europe/London
2	1	QB	\N	f	1	1	session_wekmWw64	f	1950-05-11 00:00:00+00	Europe/London
3	\N	QB	\N	f	1	1	session_OqpKUX18	f	1950-05-12 00:00:00+00	Europe/London
34	2	R	\N	f	2	12	session_5fRh0dni	f	1951-07-14 00:00:00+00	Europe/London
35	1	QB	\N	f	1	12	session_3cyPIG6Q	f	1951-07-12 00:00:00+00	Europe/London
36	\N	QB	\N	f	1	12	session_V30jgDRJ	f	1951-07-13 00:00:00+00	Europe/London
58	2	R	\N	f	2	20	session_HbIJFl1D	f	1952-07-19 00:00:00+00	Europe/London
59	1	QB	\N	f	1	20	session_G30x9e3j	f	1952-07-17 00:00:00+00	Europe/London
43	2	R	\N	f	2	15	session_RSd3UNeB	f	1951-10-28 00:00:00+00	Europe/Madrid
44	1	QB	\N	f	1	15	session_R1VvOxX1	f	1951-10-26 00:00:00+00	Europe/Madrid
45	\N	QB	\N	f	1	15	session_iaxNKquU	f	1951-10-27 00:00:00+00	Europe/Madrid
4	2	R	\N	f	2	2	session_j3NT8Tq8	f	1950-05-21 00:00:00+00	Europe/Monaco
5	1	QB	\N	f	1	2	session_GLkBhJ5b	f	1950-05-18 00:00:00+00	Europe/Monaco
6	\N	QB	\N	f	1	2	session_b9y2DorS	f	1950-05-20 00:00:00+00	Europe/Monaco
16	2	R	\N	f	2	6	session_yio0F6vG	f	1950-07-02 00:00:00+00	Europe/Paris
17	1	QB	\N	f	1	6	session_0sYxR12x	f	1950-06-30 00:00:00+00	Europe/Paris
18	\N	QB	\N	f	1	6	session_deDxZlWg	f	1950-07-01 00:00:00+00	Europe/Paris
31	2	R	\N	f	2	11	session_pd1Bj5Ys	f	1951-07-01 00:00:00+00	Europe/Paris
32	1	QB	\N	f	1	11	session_qJ6ZWDXT	f	1951-06-29 00:00:00+00	Europe/Paris
33	\N	QB	\N	f	1	11	session_a2dIoqCV	f	1951-06-30 00:00:00+00	Europe/Paris
55	2	R	\N	f	2	19	session_ZfgyDEpE	f	1952-07-06 00:00:00+00	Europe/Paris
56	1	QB	\N	f	1	19	session_aOAuioAD	f	1952-07-04 00:00:00+00	Europe/Paris
19	2	R	\N	f	2	7	session_MWraMu23	f	1950-09-03 00:00:00+00	Europe/Rome
20	1	QB	\N	f	1	7	session_eX5qIlBP	f	1950-09-01 00:00:00+00	Europe/Rome
21	\N	QB	\N	f	1	7	session_E6Re62TT	f	1950-09-02 00:00:00+00	Europe/Rome
40	2	R	\N	f	2	14	session_yxwLHNj2	f	1951-09-16 00:00:00+00	Europe/Rome
41	1	QB	\N	f	1	14	session_pXne1b90	f	1951-09-14 00:00:00+00	Europe/Rome
42	\N	QB	\N	f	1	14	session_3UxsHw7t	f	1951-09-15 00:00:00+00	Europe/Rome
67	2	R	\N	f	2	23	session_D4nTmGZZ	f	1952-09-07 00:00:00+00	Europe/Rome
68	1	QB	\N	f	1	23	session_rZpt36tY	f	1952-09-05 00:00:00+00	Europe/Rome
10	2	R	\N	f	2	4	session_kRQMn8kL	f	1950-06-04 00:00:00+00	Europe/Zurich
11	1	QB	\N	f	1	4	session_0jacirA6	f	1950-06-02 00:00:00+00	Europe/Zurich
12	\N	QB	\N	f	1	4	session_7JIAbxeO	f	1950-06-03 00:00:00+00	Europe/Zurich
22	2	R	\N	f	2	8	session_d7Wgqsjd	f	1951-05-27 00:00:00+00	Europe/Zurich
23	1	QB	\N	f	1	8	session_ST6lVxsE	f	1951-05-25 00:00:00+00	Europe/Zurich
24	\N	QB	\N	f	1	8	session_EvcDklnd	f	1951-05-26 00:00:00+00	Europe/Zurich
46	2	R	\N	f	2	16	session_rUElI65t	f	1952-05-18 00:00:00+00	Europe/Zurich
47	1	QB	\N	f	1	16	session_k2pkiayA	f	1952-05-16 00:00:00+00	Europe/Zurich
7	2	R	\N	f	2	3	session_03lTVpug	f	1950-05-30 00:00:00+00	America/Indianapolis
8	1	QB	\N	f	1	3	session_kScTG1aw	f	1950-05-28 00:00:00+00	America/Indianapolis
9	\N	QB	\N	f	1	3	session_OYp10s64	f	1950-05-29 00:00:00+00	America/Indianapolis
61	2	R	\N	f	2	21	session_wSWhSVR7	f	1952-08-03 00:00:00+00	Europe/Berlin
62	1	QB	\N	f	1	21	session_H71LuVGS	f	1952-08-01 00:00:00+00	Europe/Berlin
63	\N	QB	\N	f	1	21	session_zaPcHspT	f	1952-08-02 00:00:00+00	Europe/Berlin
52	2	R	\N	f	2	18	session_NUHfL6y8	f	1952-06-22 00:00:00+00	Europe/Brussels
53	1	QB	\N	f	1	18	session_DlkKc5my	f	1952-06-20 00:00:00+00	Europe/Brussels
76	2	R	\N	f	2	26	session_FMTcIofV	f	1953-06-07 00:00:00+00	Europe/Amsterdam
77	1	QB	\N	f	1	26	session_vzhjox0z	f	1953-06-05 00:00:00+00	Europe/Amsterdam
78	\N	QB	\N	f	1	26	session_39894opb	f	1953-06-06 00:00:00+00	Europe/Amsterdam
136	2	R	\N	f	4	46	session_4sGBiLBc	f	1955-06-19 00:00:00+00	Europe/Amsterdam
137	1	QB	\N	f	1	46	session_VfqS1Dmu	f	1955-06-17 00:00:00+00	Europe/Amsterdam
138	\N	QB	\N	f	1	46	session_oOD7aBHJ	f	1955-06-18 00:00:00+00	Europe/Amsterdam
88	2	R	\N	f	2	30	session_I5wjgD8G	f	1953-08-02 00:00:00+00	Europe/Berlin
89	1	QB	\N	f	1	30	session_grnQ7ZCx	f	1953-07-31 00:00:00+00	Europe/Berlin
90	\N	QB	\N	f	1	30	session_1cehTR8U	f	1953-08-01 00:00:00+00	Europe/Berlin
112	2	R	\N	f	3	38	session_If04UCG7	f	1954-08-01 00:00:00+00	Europe/Berlin
113	1	QB	\N	f	1	38	session_9JOHzSxe	f	1954-07-30 00:00:00+00	Europe/Berlin
114	\N	QB	\N	f	1	38	session_4SB1GZjt	f	1954-07-31 00:00:00+00	Europe/Berlin
79	2	R	\N	f	2	27	session_GW7NfwpW	f	1953-06-21 00:00:00+00	Europe/Brussels
80	1	QB	\N	f	1	27	session_79XA4riG	f	1953-06-19 00:00:00+00	Europe/Brussels
81	\N	QB	\N	f	1	27	session_C3prgbHF	f	1953-06-20 00:00:00+00	Europe/Brussels
103	2	R	\N	f	3	35	session_dKytAPEz	f	1954-06-20 00:00:00+00	Europe/Brussels
104	1	QB	\N	f	1	35	session_mz3ngqhG	f	1954-06-18 00:00:00+00	Europe/Brussels
85	2	R	\N	f	2	29	session_5E4WnxHi	f	1953-07-18 00:00:00+00	Europe/London
86	1	QB	\N	f	1	29	session_uzvOvszk	f	1953-07-16 00:00:00+00	Europe/London
87	\N	QB	\N	f	1	29	session_pTSjP6QQ	f	1953-07-17 00:00:00+00	Europe/London
109	2	R	\N	f	3	37	session_Vju4eEb6	f	1954-07-17 00:00:00+00	Europe/London
110	1	QB	\N	f	1	37	session_AVKrcuKa	f	1954-07-15 00:00:00+00	Europe/London
111	\N	QB	\N	f	1	37	session_6BDiGbjL	f	1954-07-16 00:00:00+00	Europe/London
121	2	R	\N	f	3	41	session_d9FcDc8a	f	1954-10-24 00:00:00+00	Europe/Madrid
122	1	QB	\N	f	1	41	session_tA2cNBuK	f	1954-10-22 00:00:00+00	Europe/Madrid
123	\N	QB	\N	f	1	41	session_qDfvXHFz	f	1954-10-23 00:00:00+00	Europe/Madrid
127	2	R	\N	f	4	43	session_PMLk80w7	f	1955-05-22 00:00:00+00	Europe/Monaco
128	1	QB	\N	f	1	43	session_9Ke2oY9W	f	1955-05-19 00:00:00+00	Europe/Monaco
129	\N	QB	\N	f	1	43	session_0UafpSO5	f	1955-05-21 00:00:00+00	Europe/Monaco
148	2	R	\N	f	5	50	session_46R8bmDh	f	1956-05-13 00:00:00+00	Europe/Monaco
149	1	QB	\N	f	1	50	session_EncFsbHW	f	1956-05-10 00:00:00+00	Europe/Monaco
150	\N	QB	\N	f	1	50	session_pPToHxKL	f	1956-05-12 00:00:00+00	Europe/Monaco
82	2	R	\N	f	2	28	session_pVE6Bjz6	f	1953-07-05 00:00:00+00	Europe/Paris
83	1	QB	\N	f	1	28	session_A9atxu6y	f	1953-07-03 00:00:00+00	Europe/Paris
84	\N	QB	\N	f	1	28	session_WGLibNh9	f	1953-07-04 00:00:00+00	Europe/Paris
106	2	R	\N	f	3	36	session_ygKWVO9w	f	1954-07-04 00:00:00+00	Europe/Paris
107	1	QB	\N	f	1	36	session_F4CuFFzN	f	1954-07-02 00:00:00+00	Europe/Paris
108	\N	QB	\N	f	1	36	session_DrwnutGs	f	1954-07-03 00:00:00+00	Europe/Paris
94	2	R	\N	f	2	32	session_xhaWhwBS	f	1953-09-13 00:00:00+00	Europe/Rome
95	1	QB	\N	f	1	32	session_CcRFUgUk	f	1953-09-11 00:00:00+00	Europe/Rome
96	\N	QB	\N	f	1	32	session_xB5kzDlt	f	1953-09-12 00:00:00+00	Europe/Rome
118	2	R	\N	f	3	40	session_G2XdZsLx	f	1954-09-05 00:00:00+00	Europe/Rome
119	1	QB	\N	f	1	40	session_z1VR1d7c	f	1954-09-03 00:00:00+00	Europe/Rome
120	\N	QB	\N	f	1	40	session_IXKGVMr1	f	1954-09-04 00:00:00+00	Europe/Rome
91	2	R	\N	f	2	31	session_WRJDTEM6	f	1953-08-23 00:00:00+00	Europe/Zurich
92	1	QB	\N	f	1	31	session_cypi6gMA	f	1953-08-21 00:00:00+00	Europe/Zurich
93	\N	QB	\N	f	1	31	session_eWuqdqFB	f	1953-08-22 00:00:00+00	Europe/Zurich
115	2	R	\N	f	3	39	session_ewa1uVlP	f	1954-08-22 00:00:00+00	Europe/Zurich
116	1	QB	\N	f	1	39	session_IJbOsIRi	f	1954-08-20 00:00:00+00	Europe/Zurich
117	\N	QB	\N	f	1	39	session_ulvbHiGN	f	1954-08-21 00:00:00+00	Europe/Zurich
100	2	R	\N	f	3	34	session_sfQSNxXv	f	1954-05-31 00:00:00+00	America/Indianapolis
101	1	QB	\N	f	1	34	session_wSVdaGqt	f	1954-05-29 00:00:00+00	America/Indianapolis
102	\N	QB	\N	f	1	34	session_IFyZe9gl	f	1954-05-30 00:00:00+00	America/Indianapolis
130	2	R	\N	f	4	44	session_EPmzoE4x	f	1955-05-30 00:00:00+00	America/Indianapolis
131	1	QB	\N	f	1	44	session_MZAV1wgq	f	1955-05-28 00:00:00+00	America/Indianapolis
132	\N	QB	\N	f	1	44	session_Ty3CMNyQ	f	1955-05-29 00:00:00+00	America/Indianapolis
139	2	R	\N	f	4	47	session_ywOZ5ziF	f	1955-07-16 00:00:00+00	Europe/London
140	1	QB	\N	f	1	47	session_7TLCoJUN	f	1955-07-14 00:00:00+00	Europe/London
199	2	R	\N	f	6	67	session_RAVgyTyg	f	1958-05-26 00:00:00+00	Europe/Amsterdam
200	1	QB	\N	f	1	67	session_sZOhnrDM	f	1958-05-24 00:00:00+00	Europe/Amsterdam
201	\N	QB	\N	f	1	67	session_nkHlYmgu	f	1958-05-25 00:00:00+00	Europe/Amsterdam
163	2	R	\N	f	5	55	session_ZNcH8lSr	f	1956-08-05 00:00:00+00	Europe/Berlin
164	1	QB	\N	f	1	55	session_iHBPyUlF	f	1956-08-03 00:00:00+00	Europe/Berlin
165	\N	QB	\N	f	1	55	session_AunoUUMg	f	1956-08-04 00:00:00+00	Europe/Berlin
184	2	R	\N	f	5	62	session_25qRWsGN	f	1957-08-04 00:00:00+00	Europe/Berlin
154	2	R	\N	f	5	52	session_aPMOPoKD	f	1956-06-03 00:00:00+00	Europe/Brussels
155	1	QB	\N	f	1	52	session_HyB1aZ8L	f	1956-06-01 00:00:00+00	Europe/Brussels
156	\N	QB	\N	f	1	52	session_qPyV9jkI	f	1956-06-02 00:00:00+00	Europe/Brussels
205	2	R	\N	f	6	69	session_HIFT72p4	f	1958-06-15 00:00:00+00	Europe/Brussels
206	1	QB	\N	f	1	69	session_27BFZ4GK	f	1958-06-13 00:00:00+00	Europe/Brussels
207	\N	QB	\N	f	1	69	session_xT5jf4HN	f	1958-06-14 00:00:00+00	Europe/Brussels
217	2	R	\N	f	6	73	session_U2NJF1cZ	f	1958-08-24 00:00:00+00	Europe/Lisbon
218	1	QB	\N	f	1	73	session_cSCEWGg4	f	1958-08-22 00:00:00+00	Europe/Lisbon
219	\N	QB	\N	f	1	73	session_4xt0hBgM	f	1958-08-23 00:00:00+00	Europe/Lisbon
160	2	R	\N	f	5	54	session_YRBWTZ3P	f	1956-07-14 00:00:00+00	Europe/London
161	1	QB	\N	f	1	54	session_vBxv774I	f	1956-07-12 00:00:00+00	Europe/London
162	\N	QB	\N	f	1	54	session_xoghvYEn	f	1956-07-13 00:00:00+00	Europe/London
181	2	R	\N	f	5	61	session_jOwWtXrJ	f	1957-07-20 00:00:00+00	Europe/London
182	1	QB	\N	f	1	61	session_p0d4udxS	f	1957-07-18 00:00:00+00	Europe/London
183	\N	QB	\N	f	1	61	session_IBmDIcsm	f	1957-07-19 00:00:00+00	Europe/London
211	2	R	\N	f	6	71	session_SfSIXTat	f	1958-07-19 00:00:00+00	Europe/London
172	2	R	\N	f	5	58	session_iucMPfwX	f	1957-05-19 00:00:00+00	Europe/Monaco
173	1	QB	\N	f	1	58	session_E9VY7OKU	f	1957-05-16 00:00:00+00	Europe/Monaco
174	\N	QB	\N	f	1	58	session_2UdhJEJa	f	1957-05-18 00:00:00+00	Europe/Monaco
196	2	R	\N	f	6	66	session_EAlINvew	f	1958-05-18 00:00:00+00	Europe/Monaco
197	1	QB	\N	f	1	66	session_UiduB0Qm	f	1958-05-15 00:00:00+00	Europe/Monaco
198	\N	QB	\N	f	1	66	session_MAlqhTxx	f	1958-05-17 00:00:00+00	Europe/Monaco
157	2	R	\N	f	5	53	session_atguHfvj	f	1956-07-01 00:00:00+00	Europe/Paris
158	1	QB	\N	f	1	53	session_F8OWz4mP	f	1956-06-29 00:00:00+00	Europe/Paris
159	\N	QB	\N	f	1	53	session_Utsvi1GQ	f	1956-06-30 00:00:00+00	Europe/Paris
178	2	R	\N	f	5	60	session_wderWej5	f	1957-07-07 00:00:00+00	Europe/Paris
179	1	QB	\N	f	1	60	session_LSjaLKSy	f	1957-07-05 00:00:00+00	Europe/Paris
180	\N	QB	\N	f	1	60	session_yLNkxFEe	f	1957-07-06 00:00:00+00	Europe/Paris
208	2	R	\N	f	6	70	session_hbVxITxS	f	1958-07-06 00:00:00+00	Europe/Paris
209	1	QB	\N	f	1	70	session_k2K6kgYv	f	1958-07-04 00:00:00+00	Europe/Paris
166	2	R	\N	f	5	56	session_JEngSCgf	f	1956-09-02 00:00:00+00	Europe/Rome
167	1	QB	\N	f	1	56	session_5rB4N4HB	f	1956-08-31 00:00:00+00	Europe/Rome
168	\N	QB	\N	f	1	56	session_VuiXoUc9	f	1956-09-01 00:00:00+00	Europe/Rome
187	2	R	\N	f	5	63	session_xPRuECxM	f	1957-08-18 00:00:00+00	Europe/Rome
188	1	QB	\N	f	1	63	session_5JWUm4t9	f	1957-08-16 00:00:00+00	Europe/Rome
189	\N	QB	\N	f	1	63	session_jrrtfnWJ	f	1957-08-17 00:00:00+00	Europe/Rome
190	2	R	\N	f	5	64	session_Owxs0hIX	f	1957-09-08 00:00:00+00	Europe/Rome
191	1	QB	\N	f	1	64	session_DhwSVUNB	f	1957-09-06 00:00:00+00	Europe/Rome
169	2	R	\N	f	5	57	session_qwwdoXCk	f	1957-01-13 00:00:00+00	America/Argentina/Buenos_Aires
170	1	QB	\N	f	1	57	session_hbj4P0oc	f	1957-01-11 00:00:00+00	America/Argentina/Buenos_Aires
151	2	R	\N	f	5	51	session_iWCJt5kf	f	1956-05-30 00:00:00+00	America/Indianapolis
152	1	QB	\N	f	1	51	session_mQGMRTzB	f	1956-05-28 00:00:00+00	America/Indianapolis
153	\N	QB	\N	f	1	51	session_Z27lwix2	f	1956-05-29 00:00:00+00	America/Indianapolis
175	2	R	\N	f	5	59	session_8Rfz7jFX	f	1957-05-30 00:00:00+00	America/Indianapolis
176	1	QB	\N	f	1	59	session_k1CYb9Ip	f	1957-05-28 00:00:00+00	America/Indianapolis
185	1	QB	\N	f	1	62	session_BFSb53G7	f	1957-08-02 00:00:00+00	Europe/Berlin
186	\N	QB	\N	f	1	62	session_7Q1zMJfn	f	1957-08-03 00:00:00+00	Europe/Berlin
214	2	R	\N	f	6	72	session_Vg9zbOzC	f	1958-08-03 00:00:00+00	Europe/Berlin
280	2	R	\N	f	8	94	session_6wsDZchk	f	1960-11-20 00:00:00+00	America/Los_Angeles
281	1	QB	\N	f	1	94	session_whx0dkvB	f	1960-11-18 00:00:00+00	America/Los_Angeles
282	\N	QB	\N	f	1	94	session_SAlaAIYo	f	1960-11-19 00:00:00+00	America/Los_Angeles
250	2	R	\N	f	6	84	session_0ICdMwRu	f	1959-12-12 00:00:00+00	America/New_York
251	1	QB	\N	f	1	84	session_gKLZOrJH	f	1959-12-10 00:00:00+00	America/New_York
252	\N	QB	\N	f	1	84	session_dqd8t9ga	f	1959-12-11 00:00:00+00	America/New_York
232	2	R	\N	f	6	78	session_Drap105o	f	1959-05-31 00:00:00+00	Europe/Amsterdam
233	1	QB	\N	f	1	78	session_GyLpMGBe	f	1959-05-29 00:00:00+00	Europe/Amsterdam
234	\N	QB	\N	f	1	78	session_3J8mHUZQ	f	1959-05-30 00:00:00+00	Europe/Amsterdam
241	2	R	\N	f	6	81	session_Qj3QtYXn	f	1959-08-02 00:00:00+00	Europe/Berlin
242	1	QB	\N	f	1	81	session_4gG2aIFq	f	1959-07-31 00:00:00+00	Europe/Berlin
243	\N	QB	\N	f	1	81	session_nfrIZVaV	f	1959-08-01 00:00:00+00	Europe/Berlin
298	2	R	\N	f	10	100	session_gd7RjKoK	f	1961-08-06 00:00:00+00	Europe/Berlin
265	2	R	\N	f	8	89	session_MAcOUbVH	f	1960-06-19 00:00:00+00	Europe/Brussels
266	1	QB	\N	f	1	89	session_mhUOUcvf	f	1960-06-17 00:00:00+00	Europe/Brussels
267	\N	QB	\N	f	1	89	session_7xI6ErV6	f	1960-06-18 00:00:00+00	Europe/Brussels
289	2	R	\N	f	10	97	session_P7Gcgc9g	f	1961-06-18 00:00:00+00	Europe/Brussels
290	1	QB	\N	f	1	97	session_leoWcF5B	f	1961-06-16 00:00:00+00	Europe/Brussels
291	\N	QB	\N	f	1	97	session_1a8BSXU5	f	1961-06-17 00:00:00+00	Europe/Brussels
244	2	R	\N	f	6	82	session_QlUBgo5D	f	1959-08-23 00:00:00+00	Europe/Lisbon
245	1	QB	\N	f	1	82	session_eTN5ROWo	f	1959-08-21 00:00:00+00	Europe/Lisbon
246	\N	QB	\N	f	1	82	session_DOcBUHlm	f	1959-08-22 00:00:00+00	Europe/Lisbon
274	2	R	\N	f	8	92	session_kZ7Cdlp4	f	1960-08-14 00:00:00+00	Europe/Lisbon
275	1	QB	\N	f	1	92	session_oolpIqVv	f	1960-08-12 00:00:00+00	Europe/Lisbon
276	\N	QB	\N	f	1	92	session_GHYDWlFY	f	1960-08-13 00:00:00+00	Europe/Lisbon
238	2	R	\N	f	6	80	session_bGW24c2N	f	1959-07-18 00:00:00+00	Europe/London
239	1	QB	\N	f	1	80	session_KVTtE7qe	f	1959-07-16 00:00:00+00	Europe/London
240	\N	QB	\N	f	1	80	session_vtt95ypi	f	1959-07-17 00:00:00+00	Europe/London
271	2	R	\N	f	8	91	session_T9gktOBx	f	1960-07-16 00:00:00+00	Europe/London
272	1	QB	\N	f	1	91	session_eWKlEcci	f	1960-07-14 00:00:00+00	Europe/London
273	\N	QB	\N	f	1	91	session_8p8hRE22	f	1960-07-15 00:00:00+00	Europe/London
226	2	R	\N	f	6	76	session_M7oKbhZZ	f	1959-05-10 00:00:00+00	Europe/Monaco
227	1	QB	\N	f	1	76	session_WVLGlXx9	f	1959-05-07 00:00:00+00	Europe/Monaco
228	\N	QB	\N	f	1	76	session_A90ydIjH	f	1959-05-09 00:00:00+00	Europe/Monaco
256	2	R	\N	f	8	86	session_YCqeNHxU	f	1960-05-29 00:00:00+00	Europe/Monaco
257	1	QB	\N	f	1	86	session_BdxeKne6	f	1960-05-26 00:00:00+00	Europe/Monaco
258	\N	QB	\N	f	1	86	session_bSlfrskd	f	1960-05-28 00:00:00+00	Europe/Monaco
235	2	R	\N	f	6	79	session_J6Yw77dZ	f	1959-07-05 00:00:00+00	Europe/Paris
236	1	QB	\N	f	1	79	session_x7Ch1wdu	f	1959-07-03 00:00:00+00	Europe/Paris
237	\N	QB	\N	f	1	79	session_T9Vahfh4	f	1959-07-04 00:00:00+00	Europe/Paris
268	2	R	\N	f	8	90	session_tuAZoprm	f	1960-07-03 00:00:00+00	Europe/Paris
269	1	QB	\N	f	1	90	session_ywtwGOKs	f	1960-07-01 00:00:00+00	Europe/Paris
270	\N	QB	\N	f	1	90	session_kHk3E8dp	f	1960-07-02 00:00:00+00	Europe/Paris
292	2	R	\N	f	10	98	session_e96OITTS	f	1961-07-02 00:00:00+00	Europe/Paris
293	1	QB	\N	f	1	98	session_PoTsyQw1	f	1961-06-30 00:00:00+00	Europe/Paris
247	2	R	\N	f	6	83	session_6ouFycTq	f	1959-09-13 00:00:00+00	Europe/Rome
248	1	QB	\N	f	1	83	session_r55GBlML	f	1959-09-11 00:00:00+00	Europe/Rome
249	\N	QB	\N	f	1	83	session_76yFafTw	f	1959-09-12 00:00:00+00	Europe/Rome
277	2	R	\N	f	8	93	session_DVotqkut	f	1960-09-04 00:00:00+00	Europe/Rome
278	1	QB	\N	f	1	93	session_dp8WDJ4E	f	1960-09-02 00:00:00+00	Europe/Rome
279	\N	QB	\N	f	1	93	session_Pzsork6Y	f	1960-09-03 00:00:00+00	Europe/Rome
229	2	R	\N	f	7	77	session_gxCno0PO	f	1959-05-30 00:00:00+00	America/Indianapolis
230	1	QB	\N	f	1	77	session_HrVFFQMJ	f	1959-05-28 00:00:00+00	America/Indianapolis
231	\N	QB	\N	f	1	77	session_CQ0FQkCr	f	1959-05-29 00:00:00+00	America/Indianapolis
262	2	R	\N	f	8	88	session_wB8ldLKq	f	1960-06-06 00:00:00+00	Europe/Amsterdam
299	1	QB	\N	f	1	100	session_lAjY1FxW	f	1961-08-04 00:00:00+00	Europe/Berlin
300	\N	QB	\N	f	1	100	session_Sxe2pWGH	f	1961-08-05 00:00:00+00	Europe/Berlin
283	2	R	\N	f	10	95	session_GbFp8s4E	f	1961-05-14 00:00:00+00	Europe/Monaco
304	2	R	\N	f	10	102	session_w0HEsTOa	f	1961-10-08 00:00:00+00	America/New_York
305	1	QB	\N	f	1	102	session_I0W0NA2l	f	1961-10-06 00:00:00+00	America/New_York
306	\N	QB	\N	f	1	102	session_AZL7Krci	f	1961-10-07 00:00:00+00	America/New_York
307	2	R	\N	f	11	103	session_i0ZKNwKS	f	1962-05-20 00:00:00+00	Europe/Amsterdam
308	1	QB	\N	f	1	103	session_KkaEE3Be	f	1962-05-18 00:00:00+00	Europe/Amsterdam
309	\N	QB	\N	f	1	103	session_wR29HRco	f	1962-05-19 00:00:00+00	Europe/Amsterdam
340	2	R	\N	f	11	114	session_lQyPfO5S	f	1963-06-23 00:00:00+00	Europe/Amsterdam
341	1	QB	\N	f	1	114	session_PT77d3vI	f	1963-06-21 00:00:00+00	Europe/Amsterdam
322	2	R	\N	f	11	108	session_4fLJtm0a	f	1962-08-05 00:00:00+00	Europe/Berlin
323	1	QB	\N	f	1	108	session_2E7faR7s	f	1962-08-03 00:00:00+00	Europe/Berlin
324	\N	QB	\N	f	1	108	session_iJJjtvzU	f	1962-08-04 00:00:00+00	Europe/Berlin
349	2	R	\N	f	11	117	session_YfH1Updh	f	1963-08-04 00:00:00+00	Europe/Berlin
350	1	QB	\N	f	1	117	session_UrLOgJrF	f	1963-08-02 00:00:00+00	Europe/Berlin
351	\N	QB	\N	f	1	117	session_NgOFqcNQ	f	1963-08-03 00:00:00+00	Europe/Berlin
313	2	R	\N	f	11	105	session_lRjsDf3X	f	1962-06-17 00:00:00+00	Europe/Brussels
314	1	QB	\N	f	1	105	session_3TQ0TcG4	f	1962-06-15 00:00:00+00	Europe/Brussels
315	\N	QB	\N	f	1	105	session_hNMqBP1M	f	1962-06-16 00:00:00+00	Europe/Brussels
337	2	R	\N	f	11	113	session_KuvVBtzB	f	1963-06-09 00:00:00+00	Europe/Brussels
338	1	QB	\N	f	1	113	session_WWhdxsYy	f	1963-06-07 00:00:00+00	Europe/Brussels
339	\N	QB	\N	f	1	113	session_JEt9RO7i	f	1963-06-08 00:00:00+00	Europe/Brussels
370	2	R	\N	f	11	124	session_kuHAiUk5	f	1964-06-14 00:00:00+00	Europe/Brussels
319	2	R	\N	f	11	107	session_xcdG0JCO	f	1962-07-21 00:00:00+00	Europe/London
320	1	QB	\N	f	1	107	session_Asf5DQpY	f	1962-07-19 00:00:00+00	Europe/London
321	\N	QB	\N	f	1	107	session_PfV98V6j	f	1962-07-20 00:00:00+00	Europe/London
346	2	R	\N	f	11	116	session_prcps1iQ	f	1963-07-20 00:00:00+00	Europe/London
347	1	QB	\N	f	1	116	session_j3hGOeRB	f	1963-07-18 00:00:00+00	Europe/London
348	\N	QB	\N	f	1	116	session_Vp0AMrrD	f	1963-07-19 00:00:00+00	Europe/London
310	2	R	\N	f	11	104	session_8CV54PL6	f	1962-06-03 00:00:00+00	Europe/Monaco
311	1	QB	\N	f	1	104	session_1rFu6854	f	1962-05-31 00:00:00+00	Europe/Monaco
312	\N	QB	\N	f	1	104	session_rXiwr3wh	f	1962-06-02 00:00:00+00	Europe/Monaco
334	2	R	\N	f	11	112	session_NZAG0KpM	f	1963-05-26 00:00:00+00	Europe/Monaco
335	1	QB	\N	f	1	112	session_BySwoUJI	f	1963-05-23 00:00:00+00	Europe/Monaco
336	\N	QB	\N	f	1	112	session_lDybVP61	f	1963-05-25 00:00:00+00	Europe/Monaco
364	2	R	\N	f	11	122	session_81vXavzL	f	1964-05-10 00:00:00+00	Europe/Monaco
316	2	R	\N	f	11	106	session_TzcWFKkj	f	1962-07-08 00:00:00+00	Europe/Paris
317	1	QB	\N	f	1	106	session_Bco2ucF6	f	1962-07-06 00:00:00+00	Europe/Paris
318	\N	QB	\N	f	1	106	session_87NhzWeG	f	1962-07-07 00:00:00+00	Europe/Paris
343	2	R	\N	f	11	115	session_gzgfFXK4	f	1963-06-30 00:00:00+00	Europe/Paris
344	1	QB	\N	f	1	115	session_3VpXoT8a	f	1963-06-28 00:00:00+00	Europe/Paris
345	\N	QB	\N	f	1	115	session_OhVfGr3M	f	1963-06-29 00:00:00+00	Europe/Paris
373	2	R	\N	f	11	125	session_gs0ao6XN	f	1964-06-28 00:00:00+00	Europe/Paris
374	1	QB	\N	f	1	125	session_whZBly1G	f	1964-06-26 00:00:00+00	Europe/Paris
301	2	R	\N	f	10	101	session_KnA1oGYp	f	1961-09-10 00:00:00+00	Europe/Rome
302	1	QB	\N	f	1	101	session_H72o003w	f	1961-09-08 00:00:00+00	Europe/Rome
303	\N	QB	\N	f	1	101	session_L5fgiPDe	f	1961-09-09 00:00:00+00	Europe/Rome
325	2	R	\N	f	11	109	session_4UchtAWc	f	1962-09-16 00:00:00+00	Europe/Rome
326	1	QB	\N	f	1	109	session_MBS2u25u	f	1962-09-14 00:00:00+00	Europe/Rome
327	\N	QB	\N	f	1	109	session_u6zwJdkE	f	1962-09-15 00:00:00+00	Europe/Rome
352	2	R	\N	f	11	118	session_HgfTvqsW	f	1963-09-08 00:00:00+00	Europe/Rome
353	1	QB	\N	f	1	118	session_Ufcfj1n1	f	1963-09-06 00:00:00+00	Europe/Rome
358	2	R	\N	f	11	120	session_hr2xF3HS	f	1963-10-27 00:00:00+00	America/Mexico_City
359	1	QB	\N	f	1	120	session_61HhIuQk	f	1963-10-25 00:00:00+00	America/Mexico_City
360	\N	QB	\N	f	1	120	session_wqcexGwB	f	1963-10-26 00:00:00+00	America/Mexico_City
328	2	R	\N	f	11	110	session_G3gtjSWg	f	1962-10-07 00:00:00+00	America/New_York
329	1	QB	\N	f	1	110	session_pz9PBiE7	f	1962-10-05 00:00:00+00	America/New_York
342	\N	QB	\N	f	1	114	session_ss2VEQDJ	f	1963-06-22 00:00:00+00	Europe/Amsterdam
367	2	R	\N	f	11	123	session_j5vss9nk	f	1964-05-24 00:00:00+00	Europe/Amsterdam
371	1	QB	\N	f	1	124	session_JDVBx0Y0	f	1964-06-12 00:00:00+00	Europe/Brussels
388	2	R	\N	f	11	130	session_xBVwvTEi	f	1964-10-04 00:00:00+00	America/New_York
389	1	QB	\N	f	1	130	session_FMaSO5jw	f	1964-10-02 00:00:00+00	America/New_York
390	\N	QB	\N	f	1	130	session_DqVvHcUe	f	1964-10-03 00:00:00+00	America/New_York
409	2	R	\N	f	11	137	session_WQgybkDk	f	1965-07-18 00:00:00+00	Europe/Amsterdam
410	1	QB	\N	f	1	137	session_xSXCCMkf	f	1965-07-16 00:00:00+00	Europe/Amsterdam
411	\N	QB	\N	f	1	137	session_FaHXP5Wd	f	1965-07-17 00:00:00+00	Europe/Amsterdam
436	2	R	\N	f	11	146	session_kyeGbdOP	f	1966-07-24 00:00:00+00	Europe/Amsterdam
437	1	QB	\N	f	1	146	session_OtXmgtgL	f	1966-07-22 00:00:00+00	Europe/Amsterdam
438	\N	QB	\N	f	1	146	session_gBoYiZ78	f	1966-07-23 00:00:00+00	Europe/Amsterdam
379	2	R	\N	f	11	127	session_weWiworl	f	1964-08-02 00:00:00+00	Europe/Berlin
380	1	QB	\N	f	1	127	session_01agdSgS	f	1964-07-31 00:00:00+00	Europe/Berlin
381	\N	QB	\N	f	1	127	session_DQTPQAy2	f	1964-08-01 00:00:00+00	Europe/Berlin
412	2	R	\N	f	11	138	session_PYJX0rFA	f	1965-08-01 00:00:00+00	Europe/Berlin
413	1	QB	\N	f	1	138	session_EzH8KYOE	f	1965-07-30 00:00:00+00	Europe/Berlin
414	\N	QB	\N	f	1	138	session_egNKRn7W	f	1965-07-31 00:00:00+00	Europe/Berlin
439	2	R	\N	f	11	147	session_yQ5VoT55	f	1966-08-07 00:00:00+00	Europe/Berlin
400	2	R	\N	f	11	134	session_jTMVonAn	f	1965-06-13 00:00:00+00	Europe/Brussels
401	1	QB	\N	f	1	134	session_zJQlsZMo	f	1965-06-11 00:00:00+00	Europe/Brussels
402	\N	QB	\N	f	1	134	session_yeHn2bHS	f	1965-06-12 00:00:00+00	Europe/Brussels
427	2	R	\N	f	11	143	session_lrDtlh8U	f	1966-06-12 00:00:00+00	Europe/Brussels
428	1	QB	\N	f	1	143	session_VgjNfFdZ	f	1966-06-10 00:00:00+00	Europe/Brussels
429	\N	QB	\N	f	1	143	session_j4LfqWzW	f	1966-06-11 00:00:00+00	Europe/Brussels
376	2	R	\N	f	11	126	session_4mQgDphN	f	1964-07-11 00:00:00+00	Europe/London
377	1	QB	\N	f	1	126	session_Ta5M7edY	f	1964-07-09 00:00:00+00	Europe/London
378	\N	QB	\N	f	1	126	session_1lQXsguD	f	1964-07-10 00:00:00+00	Europe/London
406	2	R	\N	f	11	136	session_pedAqpvu	f	1965-07-10 00:00:00+00	Europe/London
407	1	QB	\N	f	1	136	session_rqY4JBWs	f	1965-07-08 00:00:00+00	Europe/London
408	\N	QB	\N	f	1	136	session_lSq4NYK6	f	1965-07-09 00:00:00+00	Europe/London
433	2	R	\N	f	11	145	session_cjnXZhax	f	1966-07-16 00:00:00+00	Europe/London
397	2	R	\N	f	11	133	session_3zjdevpx	f	1965-05-30 00:00:00+00	Europe/Monaco
398	1	QB	\N	f	1	133	session_EnwcjG5c	f	1965-05-27 00:00:00+00	Europe/Monaco
399	\N	QB	\N	f	1	133	session_4O3Hpq5b	f	1965-05-29 00:00:00+00	Europe/Monaco
424	2	R	\N	f	11	142	session_aOabDZVT	f	1966-05-22 00:00:00+00	Europe/Monaco
425	1	QB	\N	f	1	142	session_U5Zr7Vzi	f	1966-05-19 00:00:00+00	Europe/Monaco
426	\N	QB	\N	f	1	142	session_GxTIwHwR	f	1966-05-21 00:00:00+00	Europe/Monaco
403	2	R	\N	f	11	135	session_bwqQa9U3	f	1965-06-27 00:00:00+00	Europe/Paris
404	1	QB	\N	f	1	135	session_T1ZecNNa	f	1965-06-25 00:00:00+00	Europe/Paris
405	\N	QB	\N	f	1	135	session_dGAOqyYg	f	1965-06-26 00:00:00+00	Europe/Paris
430	2	R	\N	f	11	144	session_S3AzpU5M	f	1966-07-03 00:00:00+00	Europe/Paris
431	1	QB	\N	f	1	144	session_EXnQaWBo	f	1966-07-01 00:00:00+00	Europe/Paris
432	\N	QB	\N	f	1	144	session_qNxqKkwA	f	1966-07-02 00:00:00+00	Europe/Paris
385	2	R	\N	f	11	129	session_3q7LytXO	f	1964-09-06 00:00:00+00	Europe/Rome
386	1	QB	\N	f	1	129	session_8ZTX8mlZ	f	1964-09-04 00:00:00+00	Europe/Rome
387	\N	QB	\N	f	1	129	session_GbI6P5wd	f	1964-09-05 00:00:00+00	Europe/Rome
415	2	R	\N	f	11	139	session_6qw7Gxcs	f	1965-09-12 00:00:00+00	Europe/Rome
416	1	QB	\N	f	1	139	session_jSqIJz8s	f	1965-09-10 00:00:00+00	Europe/Rome
417	\N	QB	\N	f	1	139	session_uC40jaAF	f	1965-09-11 00:00:00+00	Europe/Rome
382	2	R	\N	f	11	128	session_GUkMDRPC	f	1964-08-23 00:00:00+00	Europe/Vienna
383	1	QB	\N	f	1	128	session_EXVygcu9	f	1964-08-21 00:00:00+00	Europe/Vienna
384	\N	QB	\N	f	1	128	session_sctg3Y1x	f	1964-08-22 00:00:00+00	Europe/Vienna
391	2	R	\N	f	11	131	session_4JkG79FY	f	1964-10-25 00:00:00+00	America/Mexico_City
392	1	QB	\N	f	1	131	session_sb7hOogv	f	1964-10-23 00:00:00+00	America/Mexico_City
393	\N	QB	\N	f	1	131	session_aym8HUIJ	f	1964-10-24 00:00:00+00	America/Mexico_City
418	2	R	\N	f	11	140	session_7mhlid7e	f	1965-10-03 00:00:00+00	America/New_York
419	1	QB	\N	f	1	140	session_fjemCn8S	f	1965-10-01 00:00:00+00	America/New_York
420	\N	QB	\N	f	1	140	session_gSTuTvDj	f	1965-10-02 00:00:00+00	America/New_York
445	2	R	\N	f	11	149	session_a9DF71Dw	f	1966-10-02 00:00:00+00	America/New_York
434	1	QB	\N	f	1	145	session_BNsFHmQn	f	1966-07-14 00:00:00+00	Europe/London
511	2	R	\N	f	11	171	session_sacYYBsz	f	1968-09-22 00:00:00+00	America/Montreal
512	1	QB	\N	f	1	171	session_MSNxIP7p	f	1968-09-20 00:00:00+00	America/Montreal
513	\N	QB	\N	f	1	171	session_ftxV2vWE	f	1968-09-21 00:00:00+00	America/Montreal
478	2	R	\N	f	11	160	session_XUB94ttl	f	1967-10-01 00:00:00+00	America/New_York
479	1	QB	\N	f	1	160	session_PGumyfvA	f	1967-09-29 00:00:00+00	America/New_York
480	\N	QB	\N	f	1	160	session_Wf794dEJ	f	1967-09-30 00:00:00+00	America/New_York
514	2	R	\N	f	11	172	session_7IsPcVYo	f	1968-10-06 00:00:00+00	America/New_York
515	1	QB	\N	f	1	172	session_Qy6qA8v0	f	1968-10-04 00:00:00+00	America/New_York
516	\N	QB	\N	f	1	172	session_5PRpE7Nv	f	1968-10-05 00:00:00+00	America/New_York
472	2	R	\N	f	11	158	session_Jmai6N0J	f	1967-08-27 00:00:00+00	America/Toronto
473	1	QB	\N	f	1	158	session_cXjVrl2M	f	1967-08-25 00:00:00+00	America/Toronto
474	\N	QB	\N	f	1	158	session_qdOKxhdI	f	1967-08-26 00:00:00+00	America/Toronto
457	2	R	\N	f	11	153	session_0JXzTnDP	f	1967-06-04 00:00:00+00	Europe/Amsterdam
458	1	QB	\N	f	1	153	session_RDD7GREs	f	1967-06-02 00:00:00+00	Europe/Amsterdam
459	\N	QB	\N	f	1	153	session_WrMo0SBn	f	1967-06-03 00:00:00+00	Europe/Amsterdam
496	2	R	\N	f	11	166	session_nmupSwdA	f	1968-06-23 00:00:00+00	Europe/Amsterdam
497	1	QB	\N	f	1	166	session_8OVjLTO7	f	1968-06-21 00:00:00+00	Europe/Amsterdam
469	2	R	\N	f	11	157	session_RF2JFS6A	f	1967-08-06 00:00:00+00	Europe/Berlin
470	1	QB	\N	f	1	157	session_LUvTMj42	f	1967-08-04 00:00:00+00	Europe/Berlin
471	\N	QB	\N	f	1	157	session_TyukAAWq	f	1967-08-05 00:00:00+00	Europe/Berlin
505	2	R	\N	f	11	169	session_MkiGXvsF	f	1968-08-04 00:00:00+00	Europe/Berlin
506	1	QB	\N	f	1	169	session_rWfL75Al	f	1968-08-02 00:00:00+00	Europe/Berlin
460	2	R	\N	f	11	154	session_CWmTQQMk	f	1967-06-18 00:00:00+00	Europe/Brussels
461	1	QB	\N	f	1	154	session_AXuuDuyr	f	1967-06-16 00:00:00+00	Europe/Brussels
462	\N	QB	\N	f	1	154	session_10wu0Lpd	f	1967-06-17 00:00:00+00	Europe/Brussels
493	2	R	\N	f	11	165	session_ZFTLP2dm	f	1968-06-09 00:00:00+00	Europe/Brussels
494	1	QB	\N	f	1	165	session_IlDrGUoY	f	1968-06-07 00:00:00+00	Europe/Brussels
495	\N	QB	\N	f	1	165	session_XoDKxcdG	f	1968-06-08 00:00:00+00	Europe/Brussels
466	2	R	\N	f	11	156	session_sP96UBrf	f	1967-07-15 00:00:00+00	Europe/London
467	1	QB	\N	f	1	156	session_AGkmNZtD	f	1967-07-13 00:00:00+00	Europe/London
468	\N	QB	\N	f	1	156	session_zVSxVn9D	f	1967-07-14 00:00:00+00	Europe/London
502	2	R	\N	f	11	168	session_ylCOtdvQ	f	1968-07-20 00:00:00+00	Europe/London
503	1	QB	\N	f	1	168	session_IKPMdCaA	f	1968-07-18 00:00:00+00	Europe/London
487	2	R	\N	f	11	163	session_xJ239CvL	f	1968-05-12 00:00:00+00	Europe/Madrid
488	1	QB	\N	f	1	163	session_ww2Wcyst	f	1968-05-10 00:00:00+00	Europe/Madrid
489	\N	QB	\N	f	1	163	session_wyBzxo42	f	1968-05-11 00:00:00+00	Europe/Madrid
523	2	R	\N	f	11	175	session_PTBhfGSv	f	1969-05-04 00:00:00+00	Europe/Madrid
524	1	QB	\N	f	1	175	session_JGFbdEF7	f	1969-05-02 00:00:00+00	Europe/Madrid
454	2	R	\N	f	11	152	session_wWi4ANlP	f	1967-05-07 00:00:00+00	Europe/Monaco
455	1	QB	\N	f	1	152	session_IsLvhCmK	f	1967-05-04 00:00:00+00	Europe/Monaco
456	\N	QB	\N	f	1	152	session_eu7R8xNO	f	1967-05-06 00:00:00+00	Europe/Monaco
490	2	R	\N	f	11	164	session_x1Jlf2oo	f	1968-05-26 00:00:00+00	Europe/Monaco
491	1	QB	\N	f	1	164	session_iM6WRpXv	f	1968-05-23 00:00:00+00	Europe/Monaco
492	\N	QB	\N	f	1	164	session_xXagKZpm	f	1968-05-25 00:00:00+00	Europe/Monaco
463	2	R	\N	f	11	155	session_xaa2a6xt	f	1967-07-02 00:00:00+00	Europe/Paris
464	1	QB	\N	f	1	155	session_8LP9a3OL	f	1967-06-30 00:00:00+00	Europe/Paris
465	\N	QB	\N	f	1	155	session_bX6jhQIr	f	1967-07-01 00:00:00+00	Europe/Paris
499	2	R	\N	f	11	167	session_kGbdclHo	f	1968-07-07 00:00:00+00	Europe/Paris
500	1	QB	\N	f	1	167	session_vxaffLgZ	f	1968-07-05 00:00:00+00	Europe/Paris
475	2	R	\N	f	11	159	session_BcHNjZcf	f	1967-09-10 00:00:00+00	Europe/Rome
476	1	QB	\N	f	1	159	session_ISsNC67V	f	1967-09-08 00:00:00+00	Europe/Rome
477	\N	QB	\N	f	1	159	session_iPIJQg0Q	f	1967-09-09 00:00:00+00	Europe/Rome
508	2	R	\N	f	11	170	session_vpmQZ0wI	f	1968-09-08 00:00:00+00	Europe/Rome
509	1	QB	\N	f	1	170	session_Lit0t9Yg	f	1968-09-06 00:00:00+00	Europe/Rome
510	\N	QB	\N	f	1	170	session_trZ89EVF	f	1968-09-07 00:00:00+00	Europe/Rome
481	2	R	\N	f	11	161	session_SKNTBRWW	f	1967-10-22 00:00:00+00	America/Mexico_City
482	1	QB	\N	f	1	161	session_XXrvosVn	f	1967-10-20 00:00:00+00	America/Mexico_City
483	\N	QB	\N	f	1	161	session_PL64oHAo	f	1967-10-21 00:00:00+00	America/Mexico_City
517	2	R	\N	f	11	173	session_puRFM6k7	f	1968-11-03 00:00:00+00	America/Mexico_City
518	1	QB	\N	f	1	173	session_7pjStcox	f	1968-11-01 00:00:00+00	America/Mexico_City
583	2	R	\N	f	11	195	session_eWKc38Rv	f	1970-09-20 00:00:00+00	America/Montreal
584	1	QB	\N	f	1	195	session_gyPMbVem	f	1970-09-18 00:00:00+00	America/Montreal
585	\N	QB	\N	f	1	195	session_u1fOJCIU	f	1970-09-19 00:00:00+00	America/Montreal
547	2	R	\N	f	11	183	session_duPErtmz	f	1969-10-05 00:00:00+00	America/New_York
548	1	QB	\N	f	1	183	session_NoZdzUML	f	1969-10-03 00:00:00+00	America/New_York
549	\N	QB	\N	f	1	183	session_QvhTXbj3	f	1969-10-04 00:00:00+00	America/New_York
586	2	R	\N	f	11	196	session_ge7ebKlg	f	1970-10-04 00:00:00+00	America/New_York
587	1	QB	\N	f	1	196	session_QjzPNfbo	f	1970-10-02 00:00:00+00	America/New_York
544	2	R	\N	f	11	182	session_KN5SIOqx	f	1969-09-20 00:00:00+00	America/Toronto
545	1	QB	\N	f	1	182	session_SCdEkDmi	f	1969-09-18 00:00:00+00	America/Toronto
546	\N	QB	\N	f	1	182	session_3h5i2arQ	f	1969-09-19 00:00:00+00	America/Toronto
529	2	R	\N	f	11	177	session_U58da3Se	f	1969-06-21 00:00:00+00	Europe/Amsterdam
530	1	QB	\N	f	1	177	session_S1OrH4rP	f	1969-06-19 00:00:00+00	Europe/Amsterdam
531	\N	QB	\N	f	1	177	session_42mhaRL3	f	1969-06-20 00:00:00+00	Europe/Amsterdam
565	2	R	\N	f	11	189	session_p0WcQtwt	f	1970-06-21 00:00:00+00	Europe/Amsterdam
538	2	R	\N	f	11	180	session_AedWFXBa	f	1969-08-03 00:00:00+00	Europe/Berlin
539	1	QB	\N	f	1	180	session_0zF9Xnbl	f	1969-08-01 00:00:00+00	Europe/Berlin
540	\N	QB	\N	f	1	180	session_iMP0A62l	f	1969-08-02 00:00:00+00	Europe/Berlin
574	2	R	\N	f	11	192	session_RD6uQUVp	f	1970-08-02 00:00:00+00	Europe/Berlin
575	1	QB	\N	f	1	192	session_rIyn5juy	f	1970-07-31 00:00:00+00	Europe/Berlin
562	2	R	\N	f	11	188	session_Xyd1roqH	f	1970-06-07 00:00:00+00	Europe/Brussels
563	1	QB	\N	f	1	188	session_nlhjb7OW	f	1970-06-05 00:00:00+00	Europe/Brussels
564	\N	QB	\N	f	1	188	session_2LlF7G2Q	f	1970-06-06 00:00:00+00	Europe/Brussels
535	2	R	\N	f	11	179	session_6hKL4ZEE	f	1969-07-19 00:00:00+00	Europe/London
536	1	QB	\N	f	1	179	session_Fs7GZ9Bx	f	1969-07-17 00:00:00+00	Europe/London
537	\N	QB	\N	f	1	179	session_5tfakOYx	f	1969-07-18 00:00:00+00	Europe/London
571	2	R	\N	f	11	191	session_p83qIj6b	f	1970-07-18 00:00:00+00	Europe/London
572	1	QB	\N	f	1	191	session_byoZW4Zv	f	1970-07-16 00:00:00+00	Europe/London
556	2	R	\N	f	11	186	session_5tagljYY	f	1970-04-19 00:00:00+00	Europe/Madrid
557	1	QB	\N	f	1	186	session_0eva3O91	f	1970-04-17 00:00:00+00	Europe/Madrid
558	\N	QB	\N	f	1	186	session_XJBpf6wu	f	1970-04-18 00:00:00+00	Europe/Madrid
595	2	R	\N	f	11	199	session_BUg1qNe1	f	1971-04-18 00:00:00+00	Europe/Madrid
596	1	QB	\N	f	1	199	session_aS7pHdyu	f	1971-04-16 00:00:00+00	Europe/Madrid
526	2	R	\N	f	11	176	session_Ub9aK38p	f	1969-05-18 00:00:00+00	Europe/Monaco
527	1	QB	\N	f	1	176	session_PToResJJ	f	1969-05-15 00:00:00+00	Europe/Monaco
528	\N	QB	\N	f	1	176	session_qoXcvXSr	f	1969-05-17 00:00:00+00	Europe/Monaco
559	2	R	\N	f	11	187	session_39G2uE6v	f	1970-05-10 00:00:00+00	Europe/Monaco
560	1	QB	\N	f	1	187	session_Es9g4r6z	f	1970-05-07 00:00:00+00	Europe/Monaco
561	\N	QB	\N	f	1	187	session_HtrcyjQj	f	1970-05-09 00:00:00+00	Europe/Monaco
532	2	R	\N	f	11	178	session_AQMzmPg6	f	1969-07-06 00:00:00+00	Europe/Paris
533	1	QB	\N	f	1	178	session_v8KvEsI8	f	1969-07-04 00:00:00+00	Europe/Paris
534	\N	QB	\N	f	1	178	session_OYK5Q6Fc	f	1969-07-05 00:00:00+00	Europe/Paris
568	2	R	\N	f	11	190	session_j84L8oHp	f	1970-07-05 00:00:00+00	Europe/Paris
569	1	QB	\N	f	1	190	session_RIdxnK7O	f	1970-07-03 00:00:00+00	Europe/Paris
570	\N	QB	\N	f	1	190	session_eA7FSIQk	f	1970-07-04 00:00:00+00	Europe/Paris
541	2	R	\N	f	11	181	session_hnZuHSaH	f	1969-09-07 00:00:00+00	Europe/Rome
542	1	QB	\N	f	1	181	session_lqxSpSGw	f	1969-09-05 00:00:00+00	Europe/Rome
543	\N	QB	\N	f	1	181	session_UGprSGf5	f	1969-09-06 00:00:00+00	Europe/Rome
580	2	R	\N	f	11	194	session_XcrWsNCA	f	1970-09-06 00:00:00+00	Europe/Rome
581	1	QB	\N	f	1	194	session_uS62coYS	f	1970-09-04 00:00:00+00	Europe/Rome
582	\N	QB	\N	f	1	194	session_r2eNHNS9	f	1970-09-05 00:00:00+00	Europe/Rome
577	2	R	\N	f	11	193	session_tZ8FgmWj	f	1970-08-16 00:00:00+00	Europe/Vienna
578	1	QB	\N	f	1	193	session_Xc7LHAFK	f	1970-08-14 00:00:00+00	Europe/Vienna
579	\N	QB	\N	f	1	193	session_GXh76lIm	f	1970-08-15 00:00:00+00	Europe/Vienna
550	2	R	\N	f	11	184	session_fUVcKfa0	f	1969-10-19 00:00:00+00	America/Mexico_City
551	1	QB	\N	f	1	184	session_2CuMvv79	f	1969-10-17 00:00:00+00	America/Mexico_City
552	\N	QB	\N	f	1	184	session_wArGTKEk	f	1969-10-18 00:00:00+00	America/Mexico_City
589	2	R	\N	f	11	197	session_QfMADVVc	f	1970-10-25 00:00:00+00	America/Mexico_City
590	1	QB	\N	f	1	197	session_tiC2kTOr	f	1970-10-23 00:00:00+00	America/Mexico_City
576	\N	QB	\N	f	1	192	session_kiFca8BI	f	1970-08-01 00:00:00+00	Europe/Berlin
622	2	R	\N	f	11	208	session_9k3sIBA7	f	1971-10-03 00:00:00+00	America/New_York
623	1	QB	\N	f	1	208	session_RLjsmarC	f	1971-10-01 00:00:00+00	America/New_York
624	\N	QB	\N	f	1	208	session_CxKWM9i2	f	1971-10-02 00:00:00+00	America/New_York
658	2	R	\N	f	11	220	session_9NZwWOaK	f	1972-10-08 00:00:00+00	America/New_York
659	1	QB	\N	f	1	220	session_cFgXsTLR	f	1972-10-06 00:00:00+00	America/New_York
664	2	R	\N	f	11	222	session_5bSKmIjz	f	1973-02-11 00:00:00+00	America/Sao_Paulo
665	1	QB	\N	f	1	222	session_TNbnmFD0	f	1973-02-09 00:00:00+00	America/Sao_Paulo
666	\N	QB	\N	f	1	222	session_7G10Xri6	f	1973-02-10 00:00:00+00	America/Sao_Paulo
619	2	R	\N	f	11	207	session_uRvCCNA8	f	1971-09-19 00:00:00+00	America/Toronto
620	1	QB	\N	f	1	207	session_G32RauwU	f	1971-09-17 00:00:00+00	America/Toronto
621	\N	QB	\N	f	1	207	session_ks1wRKoZ	f	1971-09-18 00:00:00+00	America/Toronto
655	2	R	\N	f	11	219	session_C5DxHbjO	f	1972-09-24 00:00:00+00	America/Toronto
656	1	QB	\N	f	1	219	session_cGbXyeyl	f	1972-09-22 00:00:00+00	America/Toronto
601	2	R	\N	f	11	201	session_ivsdA7YN	f	1971-06-20 00:00:00+00	Europe/Amsterdam
602	1	QB	\N	f	1	201	session_l7lxZBNg	f	1971-06-18 00:00:00+00	Europe/Amsterdam
603	\N	QB	\N	f	1	201	session_5QlKUS1d	f	1971-06-19 00:00:00+00	Europe/Amsterdam
610	2	R	\N	f	11	204	session_qxPyu3ss	f	1971-08-01 00:00:00+00	Europe/Berlin
611	1	QB	\N	f	1	204	session_yEp5iAmC	f	1971-07-30 00:00:00+00	Europe/Berlin
612	\N	QB	\N	f	1	204	session_TwyRDeYZ	f	1971-07-31 00:00:00+00	Europe/Berlin
646	2	R	\N	f	11	216	session_1KeXy92W	f	1972-07-30 00:00:00+00	Europe/Berlin
647	1	QB	\N	f	1	216	session_KFDQOBdc	f	1972-07-28 00:00:00+00	Europe/Berlin
637	2	R	\N	f	11	213	session_1axx2Snl	f	1972-06-04 00:00:00+00	Europe/Brussels
638	1	QB	\N	f	1	213	session_rmjtxTFf	f	1972-06-02 00:00:00+00	Europe/Brussels
639	\N	QB	\N	f	1	213	session_DYPvjmk5	f	1972-06-03 00:00:00+00	Europe/Brussels
673	2	R	\N	f	11	225	session_6aYN77F2	f	1973-05-20 00:00:00+00	Europe/Brussels
674	1	QB	\N	f	1	225	session_rrvSCqcf	f	1973-05-18 00:00:00+00	Europe/Brussels
607	2	R	\N	f	11	203	session_dUdTY9Lt	f	1971-07-17 00:00:00+00	Europe/London
608	1	QB	\N	f	1	203	session_xJWhMNj4	f	1971-07-15 00:00:00+00	Europe/London
609	\N	QB	\N	f	1	203	session_MRVCrhHM	f	1971-07-16 00:00:00+00	Europe/London
643	2	R	\N	f	11	215	session_iWXNEcPs	f	1972-07-15 00:00:00+00	Europe/London
644	1	QB	\N	f	1	215	session_KDvCbKvc	f	1972-07-13 00:00:00+00	Europe/London
631	2	R	\N	f	11	211	session_FbT0yiHf	f	1972-05-01 00:00:00+00	Europe/Madrid
632	1	QB	\N	f	1	211	session_194fHbzp	f	1972-04-29 00:00:00+00	Europe/Madrid
633	\N	QB	\N	f	1	211	session_zCdYNVNV	f	1972-04-30 00:00:00+00	Europe/Madrid
670	2	R	\N	f	11	224	session_tL7pNGv4	f	1973-04-29 00:00:00+00	Europe/Madrid
671	1	QB	\N	f	1	224	session_BefJlzKE	f	1973-04-27 00:00:00+00	Europe/Madrid
634	2	R	\N	f	11	212	session_ZnOzGBM7	f	1972-05-14 00:00:00+00	Europe/Monaco
635	1	QB	\N	f	1	212	session_9fO9IRGC	f	1972-05-11 00:00:00+00	Europe/Monaco
636	\N	QB	\N	f	1	212	session_VOc5cqu7	f	1972-05-13 00:00:00+00	Europe/Monaco
604	2	R	\N	f	11	202	session_5rIjdIy8	f	1971-07-04 00:00:00+00	Europe/Paris
605	1	QB	\N	f	1	202	session_m22YwD9h	f	1971-07-02 00:00:00+00	Europe/Paris
606	\N	QB	\N	f	1	202	session_fdavPb2o	f	1971-07-03 00:00:00+00	Europe/Paris
640	2	R	\N	f	11	214	session_Cjwmf0Rn	f	1972-07-02 00:00:00+00	Europe/Paris
641	1	QB	\N	f	1	214	session_icjNocdj	f	1972-06-30 00:00:00+00	Europe/Paris
616	2	R	\N	f	11	206	session_9GWpPqzM	f	1971-09-05 00:00:00+00	Europe/Rome
617	1	QB	\N	f	1	206	session_28sTkKY5	f	1971-09-03 00:00:00+00	Europe/Rome
618	\N	QB	\N	f	1	206	session_CdbGAaIO	f	1971-09-04 00:00:00+00	Europe/Rome
652	2	R	\N	f	11	218	session_DVrINaS4	f	1972-09-10 00:00:00+00	Europe/Rome
653	1	QB	\N	f	1	218	session_3p3qMAZ9	f	1972-09-08 00:00:00+00	Europe/Rome
613	2	R	\N	f	11	205	session_41HAlHbp	f	1971-08-15 00:00:00+00	Europe/Vienna
614	1	QB	\N	f	1	205	session_KvM6AZzk	f	1971-08-13 00:00:00+00	Europe/Vienna
615	\N	QB	\N	f	1	205	session_CAN75tkB	f	1971-08-14 00:00:00+00	Europe/Vienna
649	2	R	\N	f	11	217	session_7sYHx2gv	f	1972-08-13 00:00:00+00	Europe/Vienna
650	1	QB	\N	f	1	217	session_J36KydYM	f	1972-08-11 00:00:00+00	Europe/Vienna
651	\N	QB	\N	f	1	217	session_c2Fr8cEj	f	1972-08-12 00:00:00+00	Europe/Vienna
625	2	R	\N	f	11	209	session_VP30JIy5	f	1972-01-23 00:00:00+00	America/Argentina/Buenos_Aires
626	1	QB	\N	f	1	209	session_gvs5DTJ4	f	1972-01-21 00:00:00+00	America/Argentina/Buenos_Aires
627	\N	QB	\N	f	1	209	session_91B3lBw1	f	1972-01-22 00:00:00+00	America/Argentina/Buenos_Aires
661	2	R	\N	f	11	221	session_yDMVBKz7	f	1973-01-28 00:00:00+00	America/Argentina/Buenos_Aires
672	\N	QB	\N	f	1	224	session_3LnzU3Rl	f	1973-04-28 00:00:00+00	Europe/Madrid
703	2	R	\N	f	11	235	session_aCwMw9M1	f	1973-10-07 00:00:00+00	America/New_York
704	1	QB	\N	f	1	235	session_sAeqxXiZ	f	1973-10-05 00:00:00+00	America/New_York
709	2	R	\N	f	11	237	session_cfUA5UD2	f	1974-01-27 00:00:00+00	America/Sao_Paulo
710	1	QB	\N	f	1	237	session_QV7n2jIg	f	1974-01-25 00:00:00+00	America/Sao_Paulo
711	\N	QB	\N	f	1	237	session_eIL5uYkd	f	1974-01-26 00:00:00+00	America/Sao_Paulo
700	2	R	\N	f	11	234	session_6FaIL2LC	f	1973-09-23 00:00:00+00	America/Toronto
701	1	QB	\N	f	1	234	session_1SwduNi4	f	1973-09-21 00:00:00+00	America/Toronto
702	\N	QB	\N	f	1	234	session_gJCUKmwq	f	1973-09-22 00:00:00+00	America/Toronto
688	2	R	\N	f	11	230	session_sE28bDdq	f	1973-07-29 00:00:00+00	Europe/Amsterdam
689	1	QB	\N	f	1	230	session_vfvr4Wso	f	1973-07-27 00:00:00+00	Europe/Amsterdam
690	\N	QB	\N	f	1	230	session_qdLvgvEj	f	1973-07-28 00:00:00+00	Europe/Amsterdam
727	2	R	\N	f	11	243	session_iqSvgcy6	f	1974-06-23 00:00:00+00	Europe/Amsterdam
728	1	QB	\N	f	1	243	session_5Mv7wKh7	f	1974-06-21 00:00:00+00	Europe/Amsterdam
691	2	R	\N	f	11	231	session_ZCOgrBzd	f	1973-08-05 00:00:00+00	Europe/Berlin
692	1	QB	\N	f	1	231	session_O8mCp7bQ	f	1973-08-03 00:00:00+00	Europe/Berlin
693	\N	QB	\N	f	1	231	session_yK8ZeCfT	f	1973-08-04 00:00:00+00	Europe/Berlin
736	2	R	\N	f	11	246	session_nFKCFMO8	f	1974-08-04 00:00:00+00	Europe/Berlin
737	1	QB	\N	f	1	246	session_mGjihbWw	f	1974-08-02 00:00:00+00	Europe/Berlin
718	2	R	\N	f	11	240	session_vJUJzpTk	f	1974-05-12 00:00:00+00	Europe/Brussels
719	1	QB	\N	f	1	240	session_d7nEHPtW	f	1974-05-10 00:00:00+00	Europe/Brussels
720	\N	QB	\N	f	1	240	session_bauGwvhq	f	1974-05-11 00:00:00+00	Europe/Brussels
685	2	R	\N	f	11	229	session_lJTvGGYN	f	1973-07-14 00:00:00+00	Europe/London
686	1	QB	\N	f	1	229	session_KsQjANYJ	f	1973-07-12 00:00:00+00	Europe/London
687	\N	QB	\N	f	1	229	session_MWR2IpAp	f	1973-07-13 00:00:00+00	Europe/London
733	2	R	\N	f	11	245	session_5Jn9xNT9	f	1974-07-20 00:00:00+00	Europe/London
734	1	QB	\N	f	1	245	session_JZew9gGJ	f	1974-07-18 00:00:00+00	Europe/London
715	2	R	\N	f	11	239	session_RDfAOcxy	f	1974-04-28 00:00:00+00	Europe/Madrid
716	1	QB	\N	f	1	239	session_rIBb1Qfk	f	1974-04-26 00:00:00+00	Europe/Madrid
717	\N	QB	\N	f	1	239	session_NzC6Tbtj	f	1974-04-27 00:00:00+00	Europe/Madrid
676	2	R	\N	f	11	226	session_Jf1BrZ4t	f	1973-06-03 00:00:00+00	Europe/Monaco
677	1	QB	\N	f	1	226	session_eIPv6Rg2	f	1973-05-31 00:00:00+00	Europe/Monaco
678	\N	QB	\N	f	1	226	session_5FRFJnua	f	1973-06-02 00:00:00+00	Europe/Monaco
721	2	R	\N	f	11	241	session_mEjwvJyb	f	1974-05-26 00:00:00+00	Europe/Monaco
722	1	QB	\N	f	1	241	session_e1w7BeWF	f	1974-05-23 00:00:00+00	Europe/Monaco
682	2	R	\N	f	11	228	session_cnqsEu2M	f	1973-07-01 00:00:00+00	Europe/Paris
683	1	QB	\N	f	1	228	session_BIW9i3a1	f	1973-06-29 00:00:00+00	Europe/Paris
684	\N	QB	\N	f	1	228	session_Veisrt9S	f	1973-06-30 00:00:00+00	Europe/Paris
730	2	R	\N	f	11	244	session_akOnFdwz	f	1974-07-07 00:00:00+00	Europe/Paris
731	1	QB	\N	f	1	244	session_tRS0BTf7	f	1974-07-05 00:00:00+00	Europe/Paris
697	2	R	\N	f	11	233	session_rd6n6y93	f	1973-09-09 00:00:00+00	Europe/Rome
698	1	QB	\N	f	1	233	session_hAHhEanK	f	1973-09-07 00:00:00+00	Europe/Rome
699	\N	QB	\N	f	1	233	session_qp6HbYy0	f	1973-09-08 00:00:00+00	Europe/Rome
742	2	R	\N	f	11	248	session_k37xuuSH	f	1974-09-08 00:00:00+00	Europe/Rome
743	1	QB	\N	f	1	248	session_EqEbJgvI	f	1974-09-06 00:00:00+00	Europe/Rome
679	2	R	\N	f	11	227	session_aKRZhXtE	f	1973-06-17 00:00:00+00	Europe/Stockholm
680	1	QB	\N	f	1	227	session_kj8Worcc	f	1973-06-15 00:00:00+00	Europe/Stockholm
681	\N	QB	\N	f	1	227	session_axTx0KXJ	f	1973-06-16 00:00:00+00	Europe/Stockholm
724	2	R	\N	f	11	242	session_r2KnxDhQ	f	1974-06-09 00:00:00+00	Europe/Stockholm
725	1	QB	\N	f	1	242	session_GFt8glYh	f	1974-06-07 00:00:00+00	Europe/Stockholm
694	2	R	\N	f	11	232	session_hh3aBT6k	f	1973-08-19 00:00:00+00	Europe/Vienna
695	1	QB	\N	f	1	232	session_LWFCWdQa	f	1973-08-17 00:00:00+00	Europe/Vienna
696	\N	QB	\N	f	1	232	session_lWEzFZUd	f	1973-08-18 00:00:00+00	Europe/Vienna
739	2	R	\N	f	11	247	session_R8NQnmSl	f	1974-08-18 00:00:00+00	Europe/Vienna
740	1	QB	\N	f	1	247	session_eho3fY0Y	f	1974-08-16 00:00:00+00	Europe/Vienna
741	\N	QB	\N	f	1	247	session_8vw49CKf	f	1974-08-17 00:00:00+00	Europe/Vienna
706	2	R	\N	f	11	236	session_YS6TrG7K	f	1974-01-13 00:00:00+00	America/Argentina/Buenos_Aires
707	1	QB	\N	f	1	236	session_wtgxmS7P	f	1974-01-11 00:00:00+00	America/Argentina/Buenos_Aires
705	\N	QB	\N	f	1	235	session_9yVMagoU	f	1973-10-06 00:00:00+00	America/New_York
745	2	R	\N	f	11	249	session_bAV4mRKS	f	1974-09-22 00:00:00+00	America/Toronto
746	1	QB	\N	f	1	249	session_UrqXxoJB	f	1974-09-20 00:00:00+00	America/Toronto
799	2	R	\N	f	12	267	session_2u4LBtD9	f	1976-03-28 00:00:00+00	America/Los_Angeles
800	1	QB	\N	f	1	267	session_J9UvSN8Y	f	1976-03-26 00:00:00+00	America/Los_Angeles
801	\N	QB	\N	f	1	267	session_OFZIOTUU	f	1976-03-27 00:00:00+00	America/Los_Angeles
790	2	R	\N	f	12	264	session_DZWAe18N	f	1975-10-05 00:00:00+00	America/New_York
791	1	QB	\N	f	1	264	session_uT7abQqm	f	1975-10-03 00:00:00+00	America/New_York
792	\N	QB	\N	f	1	264	session_8swt7XCb	f	1975-10-04 00:00:00+00	America/New_York
754	2	R	\N	f	12	252	session_wydT5L8P	f	1975-01-26 00:00:00+00	America/Sao_Paulo
755	1	QB	\N	f	1	252	session_14PQCGOD	f	1975-01-24 00:00:00+00	America/Sao_Paulo
756	\N	QB	\N	f	1	252	session_2QRgi0WP	f	1975-01-25 00:00:00+00	America/Sao_Paulo
772	2	R	\N	f	12	258	session_tuxvjtaL	f	1975-06-22 00:00:00+00	Europe/Amsterdam
773	1	QB	\N	f	1	258	session_bpkCCMLj	f	1975-06-20 00:00:00+00	Europe/Amsterdam
774	\N	QB	\N	f	1	258	session_Tf5pbo01	f	1975-06-21 00:00:00+00	Europe/Amsterdam
781	2	R	\N	f	12	261	session_RyFxztdu	f	1975-08-03 00:00:00+00	Europe/Berlin
782	1	QB	\N	f	1	261	session_poN6OPMH	f	1975-08-01 00:00:00+00	Europe/Berlin
783	\N	QB	\N	f	1	261	session_sw0ChxA2	f	1975-08-02 00:00:00+00	Europe/Berlin
766	2	R	\N	f	12	256	session_lNRvsHlW	f	1975-05-25 00:00:00+00	Europe/Brussels
767	1	QB	\N	f	1	256	session_nLG1gdT6	f	1975-05-23 00:00:00+00	Europe/Brussels
768	\N	QB	\N	f	1	256	session_dufXhofw	f	1975-05-24 00:00:00+00	Europe/Brussels
805	2	R	\N	f	12	269	session_4QG4Nahz	f	1976-05-16 00:00:00+00	Europe/Brussels
806	1	QB	\N	f	1	269	session_2zW9bVzh	f	1976-05-14 00:00:00+00	Europe/Brussels
778	2	R	\N	f	12	260	session_J8tlOPeN	f	1975-07-19 00:00:00+00	Europe/London
779	1	QB	\N	f	1	260	session_PYsZd7zc	f	1975-07-17 00:00:00+00	Europe/London
780	\N	QB	\N	f	1	260	session_ReuqkiXc	f	1975-07-18 00:00:00+00	Europe/London
817	2	R	\N	f	12	273	session_3sE4ZggS	f	1976-07-18 00:00:00+00	Europe/London
818	1	QB	\N	f	1	273	session_AFBy3CUb	f	1976-07-16 00:00:00+00	Europe/London
760	2	R	\N	f	12	254	session_KotWEdds	f	1975-04-27 00:00:00+00	Europe/Madrid
761	1	QB	\N	f	1	254	session_3gDz6Sua	f	1975-04-25 00:00:00+00	Europe/Madrid
762	\N	QB	\N	f	1	254	session_HXvfKzLY	f	1975-04-26 00:00:00+00	Europe/Madrid
802	2	R	\N	f	12	268	session_2fO3juSQ	f	1976-05-02 00:00:00+00	Europe/Madrid
803	1	QB	\N	f	1	268	session_ej7LsiQq	f	1976-04-30 00:00:00+00	Europe/Madrid
804	\N	QB	\N	f	1	268	session_Ya6qVmlV	f	1976-05-01 00:00:00+00	Europe/Madrid
763	2	R	\N	f	12	255	session_gbIh5nlR	f	1975-05-11 00:00:00+00	Europe/Monaco
764	1	QB	\N	f	1	255	session_RcRZWWxI	f	1975-05-08 00:00:00+00	Europe/Monaco
765	\N	QB	\N	f	1	255	session_w4SksrrG	f	1975-05-10 00:00:00+00	Europe/Monaco
808	2	R	\N	f	12	270	session_pNoBTlvn	f	1976-05-30 00:00:00+00	Europe/Monaco
809	1	QB	\N	f	1	270	session_h3NYcG1z	f	1976-05-27 00:00:00+00	Europe/Monaco
775	2	R	\N	f	12	259	session_i2pFsfLn	f	1975-07-06 00:00:00+00	Europe/Paris
776	1	QB	\N	f	1	259	session_nwkLbMtp	f	1975-07-04 00:00:00+00	Europe/Paris
777	\N	QB	\N	f	1	259	session_jZNyLZ8J	f	1975-07-05 00:00:00+00	Europe/Paris
814	2	R	\N	f	12	272	session_AaJ45Cah	f	1976-07-04 00:00:00+00	Europe/Paris
815	1	QB	\N	f	1	272	session_OoBr99TK	f	1976-07-02 00:00:00+00	Europe/Paris
787	2	R	\N	f	12	263	session_gV23O2vE	f	1975-09-07 00:00:00+00	Europe/Rome
788	1	QB	\N	f	1	263	session_oR7l22mp	f	1975-09-05 00:00:00+00	Europe/Rome
789	\N	QB	\N	f	1	263	session_zPTMJJpD	f	1975-09-06 00:00:00+00	Europe/Rome
769	2	R	\N	f	12	257	session_RW3AGKBk	f	1975-06-08 00:00:00+00	Europe/Stockholm
770	1	QB	\N	f	1	257	session_zB5ykmyD	f	1975-06-06 00:00:00+00	Europe/Stockholm
771	\N	QB	\N	f	1	257	session_fHj33S4s	f	1975-06-07 00:00:00+00	Europe/Stockholm
811	2	R	\N	f	12	271	session_dEclaV1L	f	1976-06-13 00:00:00+00	Europe/Stockholm
812	1	QB	\N	f	1	271	session_3YGhzbuC	f	1976-06-11 00:00:00+00	Europe/Stockholm
784	2	R	\N	f	12	262	session_z4VXg98z	f	1975-08-17 00:00:00+00	Europe/Vienna
785	1	QB	\N	f	1	262	session_uyOlY27V	f	1975-08-15 00:00:00+00	Europe/Vienna
786	\N	QB	\N	f	1	262	session_KbbeT8xi	f	1975-08-16 00:00:00+00	Europe/Vienna
823	2	R	\N	f	12	275	session_M5Y1HCYG	f	1976-08-15 00:00:00+00	Europe/Vienna
824	1	QB	\N	f	1	275	session_cVKyf5IE	f	1976-08-13 00:00:00+00	Europe/Vienna
751	2	R	\N	f	12	251	session_rQXFQVZO	f	1975-01-12 00:00:00+00	America/Argentina/Buenos_Aires
752	1	QB	\N	f	1	251	session_FzfFiDkQ	f	1975-01-10 00:00:00+00	America/Argentina/Buenos_Aires
753	\N	QB	\N	f	1	251	session_XoKFpEbZ	f	1975-01-11 00:00:00+00	America/Argentina/Buenos_Aires
820	2	R	\N	f	12	274	session_SjT2l2Co	f	1976-08-01 00:00:00+00	Europe/Berlin
821	1	QB	\N	f	1	274	session_Bi3ihBgu	f	1976-07-30 00:00:00+00	Europe/Berlin
807	\N	QB	\N	f	1	269	session_QMK3eIXg	f	1976-05-15 00:00:00+00	Europe/Brussels
850	2	R	\N	f	12	284	session_Dst3IIlA	f	1977-04-03 00:00:00+00	America/Los_Angeles
851	1	QB	\N	f	1	284	session_qP2mpgnR	f	1977-04-01 00:00:00+00	America/Los_Angeles
852	\N	QB	\N	f	1	284	session_QqsUwywk	f	1977-04-02 00:00:00+00	America/Los_Angeles
835	2	R	\N	f	12	279	session_ifGLO0wW	f	1976-10-10 00:00:00+00	America/New_York
836	1	QB	\N	f	1	279	session_6d2WTye5	f	1976-10-08 00:00:00+00	America/New_York
837	\N	QB	\N	f	1	279	session_PJUN4SNE	f	1976-10-09 00:00:00+00	America/New_York
883	2	R	\N	f	12	295	session_tNEtlyKQ	f	1977-10-02 00:00:00+00	America/New_York
844	2	R	\N	f	12	282	session_Lq3OYvVq	f	1977-01-23 00:00:00+00	America/Sao_Paulo
845	1	QB	\N	f	1	282	session_v6twtZ9R	f	1977-01-21 00:00:00+00	America/Sao_Paulo
846	\N	QB	\N	f	1	282	session_na6eAZkz	f	1977-01-22 00:00:00+00	America/Sao_Paulo
895	2	R	\N	f	12	299	session_0QSZrrwh	f	1978-01-29 00:00:00+00	America/Sao_Paulo
896	1	QB	\N	f	1	299	session_NE7El4A2	f	1978-01-27 00:00:00+00	America/Sao_Paulo
832	2	R	\N	f	12	278	session_NzencQ1h	f	1976-10-03 00:00:00+00	America/Toronto
833	1	QB	\N	f	1	278	session_qwUp1HhW	f	1976-10-01 00:00:00+00	America/Toronto
834	\N	QB	\N	f	1	278	session_rQBz1ZNq	f	1976-10-02 00:00:00+00	America/Toronto
886	2	R	\N	f	12	296	session_FlayjKKN	f	1977-10-09 00:00:00+00	America/Toronto
887	1	QB	\N	f	1	296	session_URdKVT91	f	1977-10-07 00:00:00+00	America/Toronto
838	2	R	\N	f	12	280	session_Y9b1MSNp	f	1976-10-24 00:00:00+00	Asia/Tokyo
839	1	QB	\N	f	1	280	session_8NXdJYXn	f	1976-10-22 00:00:00+00	Asia/Tokyo
840	\N	QB	\N	f	1	280	session_X6Y2xIkl	f	1976-10-23 00:00:00+00	Asia/Tokyo
889	2	R	\N	f	12	297	session_v3mYOBNt	f	1977-10-23 00:00:00+00	Asia/Tokyo
890	1	QB	\N	f	1	297	session_X9ayiwHW	f	1977-10-21 00:00:00+00	Asia/Tokyo
826	2	R	\N	f	12	276	session_sVtQEFMH	f	1976-08-29 00:00:00+00	Europe/Amsterdam
827	1	QB	\N	f	1	276	session_LPvAIse5	f	1976-08-27 00:00:00+00	Europe/Amsterdam
828	\N	QB	\N	f	1	276	session_fNXcDyPj	f	1976-08-28 00:00:00+00	Europe/Amsterdam
877	2	R	\N	f	12	293	session_G5iM3uIZ	f	1977-08-28 00:00:00+00	Europe/Amsterdam
878	1	QB	\N	f	1	293	session_1v2qkSwX	f	1977-08-26 00:00:00+00	Europe/Amsterdam
871	2	R	\N	f	12	291	session_z1UCCjKs	f	1977-07-31 00:00:00+00	Europe/Berlin
872	1	QB	\N	f	1	291	session_GKq1cRNb	f	1977-07-29 00:00:00+00	Europe/Berlin
873	\N	QB	\N	f	1	291	session_cUNDke6l	f	1977-07-30 00:00:00+00	Europe/Berlin
859	2	R	\N	f	12	287	session_OS61GF9R	f	1977-06-05 00:00:00+00	Europe/Brussels
860	1	QB	\N	f	1	287	session_M2yTOPLZ	f	1977-06-03 00:00:00+00	Europe/Brussels
861	\N	QB	\N	f	1	287	session_3lTGVauz	f	1977-06-04 00:00:00+00	Europe/Brussels
868	2	R	\N	f	12	290	session_wUc1etu9	f	1977-07-16 00:00:00+00	Europe/London
869	1	QB	\N	f	1	290	session_E7joRqUO	f	1977-07-14 00:00:00+00	Europe/London
870	\N	QB	\N	f	1	290	session_NQV8bQlX	f	1977-07-15 00:00:00+00	Europe/London
853	2	R	\N	f	12	285	session_pv1IgLM2	f	1977-05-08 00:00:00+00	Europe/Madrid
854	1	QB	\N	f	1	285	session_uGxbAfgO	f	1977-05-06 00:00:00+00	Europe/Madrid
855	\N	QB	\N	f	1	285	session_BgTnmU0h	f	1977-05-07 00:00:00+00	Europe/Madrid
856	2	R	\N	f	12	286	session_A8MokGzn	f	1977-05-22 00:00:00+00	Europe/Monaco
857	1	QB	\N	f	1	286	session_zpXQ5X9B	f	1977-05-19 00:00:00+00	Europe/Monaco
858	\N	QB	\N	f	1	286	session_IllbwhGu	f	1977-05-21 00:00:00+00	Europe/Monaco
865	2	R	\N	f	12	289	session_4kFgnRVC	f	1977-07-03 00:00:00+00	Europe/Paris
866	1	QB	\N	f	1	289	session_POvHbXKQ	f	1977-07-01 00:00:00+00	Europe/Paris
867	\N	QB	\N	f	1	289	session_osD2iKg8	f	1977-07-02 00:00:00+00	Europe/Paris
829	2	R	\N	f	12	277	session_95gxp6IC	f	1976-09-12 00:00:00+00	Europe/Rome
830	1	QB	\N	f	1	277	session_0v8g5jYC	f	1976-09-10 00:00:00+00	Europe/Rome
831	\N	QB	\N	f	1	277	session_0WdT9us1	f	1976-09-11 00:00:00+00	Europe/Rome
880	2	R	\N	f	12	294	session_3dLdKmM2	f	1977-09-11 00:00:00+00	Europe/Rome
862	2	R	\N	f	12	288	session_77FCv767	f	1977-06-19 00:00:00+00	Europe/Stockholm
863	1	QB	\N	f	1	288	session_sTmhKtec	f	1977-06-17 00:00:00+00	Europe/Stockholm
864	\N	QB	\N	f	1	288	session_q95kUfSN	f	1977-06-18 00:00:00+00	Europe/Stockholm
874	2	R	\N	f	12	292	session_cDyF86lR	f	1977-08-14 00:00:00+00	Europe/Vienna
875	1	QB	\N	f	1	292	session_QtHXITMv	f	1977-08-12 00:00:00+00	Europe/Vienna
876	\N	QB	\N	f	1	292	session_T44P1WlH	f	1977-08-13 00:00:00+00	Europe/Vienna
841	2	R	\N	f	12	281	session_vRa0WIst	f	1977-01-09 00:00:00+00	America/Argentina/Buenos_Aires
842	1	QB	\N	f	1	281	session_nAK1Zc7X	f	1977-01-07 00:00:00+00	America/Argentina/Buenos_Aires
843	\N	QB	\N	f	1	281	session_pS1mSqxc	f	1977-01-08 00:00:00+00	America/Argentina/Buenos_Aires
892	2	R	\N	f	12	298	session_PrAs2F6E	f	1978-01-15 00:00:00+00	America/Argentina/Buenos_Aires
901	2	R	\N	f	12	301	session_eEqMP4aj	f	1978-04-02 00:00:00+00	America/Los_Angeles
902	1	QB	\N	f	1	301	session_uV1xPkxX	f	1978-03-31 00:00:00+00	America/Los_Angeles
937	2	R	\N	f	12	313	session_HM5XzB14	f	1978-10-08 00:00:00+00	America/Montreal
938	1	QB	\N	f	1	313	session_NabrNero	f	1978-10-06 00:00:00+00	America/Montreal
939	\N	QB	\N	f	1	313	session_dRX2KmHG	f	1978-10-07 00:00:00+00	America/Montreal
934	2	R	\N	f	12	312	session_x2Q4YXLo	f	1978-10-01 00:00:00+00	America/New_York
935	1	QB	\N	f	1	312	session_Pz6bNvsw	f	1978-09-29 00:00:00+00	America/New_York
936	\N	QB	\N	f	1	312	session_aNRqich5	f	1978-09-30 00:00:00+00	America/New_York
943	2	R	\N	f	12	315	session_WSPULZXh	f	1979-02-04 00:00:00+00	America/Sao_Paulo
944	1	QB	\N	f	1	315	session_pWKp3Ewc	f	1979-02-02 00:00:00+00	America/Sao_Paulo
945	\N	QB	\N	f	1	315	session_zJ1Jl2nM	f	1979-02-03 00:00:00+00	America/Sao_Paulo
928	2	R	\N	f	12	310	session_Js5TXe38	f	1978-08-27 00:00:00+00	Europe/Amsterdam
929	1	QB	\N	f	1	310	session_mJ0vUASE	f	1978-08-25 00:00:00+00	Europe/Amsterdam
930	\N	QB	\N	f	1	310	session_eqDt5GQh	f	1978-08-26 00:00:00+00	Europe/Amsterdam
922	2	R	\N	f	12	308	session_Cvoy32Vh	f	1978-07-30 00:00:00+00	Europe/Berlin
923	1	QB	\N	f	1	308	session_9w8nIO4s	f	1978-07-28 00:00:00+00	Europe/Berlin
924	\N	QB	\N	f	1	308	session_eSdUHQfy	f	1978-07-29 00:00:00+00	Europe/Berlin
967	2	R	\N	f	12	323	session_y2WVbkMu	f	1979-07-29 00:00:00+00	Europe/Berlin
907	2	R	\N	f	12	303	session_NPOq46TA	f	1978-05-21 00:00:00+00	Europe/Brussels
908	1	QB	\N	f	1	303	session_nBpe4uRR	f	1978-05-19 00:00:00+00	Europe/Brussels
909	\N	QB	\N	f	1	303	session_DztvlYJx	f	1978-05-20 00:00:00+00	Europe/Brussels
955	2	R	\N	f	12	319	session_WbFDs6Lf	f	1979-05-13 00:00:00+00	Europe/Brussels
956	1	QB	\N	f	1	319	session_02aWaYGg	f	1979-05-11 00:00:00+00	Europe/Brussels
919	2	R	\N	f	12	307	session_6Cm7HCXH	f	1978-07-16 00:00:00+00	Europe/London
920	1	QB	\N	f	1	307	session_efrlHwlq	f	1978-07-14 00:00:00+00	Europe/London
921	\N	QB	\N	f	1	307	session_EWpD9hOF	f	1978-07-15 00:00:00+00	Europe/London
964	2	R	\N	f	12	322	session_OOTzngEc	f	1979-07-14 00:00:00+00	Europe/London
965	1	QB	\N	f	1	322	session_UWYrRuDA	f	1979-07-12 00:00:00+00	Europe/London
910	2	R	\N	f	12	304	session_3i9sNLyO	f	1978-06-04 00:00:00+00	Europe/Madrid
911	1	QB	\N	f	1	304	session_qsB1Offk	f	1978-06-02 00:00:00+00	Europe/Madrid
912	\N	QB	\N	f	1	304	session_mCazAurp	f	1978-06-03 00:00:00+00	Europe/Madrid
952	2	R	\N	f	12	318	session_DPTw6uRq	f	1979-04-29 00:00:00+00	Europe/Madrid
953	1	QB	\N	f	1	318	session_aBvjMNCO	f	1979-04-27 00:00:00+00	Europe/Madrid
904	2	R	\N	f	12	302	session_1QBCVaQJ	f	1978-05-07 00:00:00+00	Europe/Monaco
905	1	QB	\N	f	1	302	session_f9JBfcNX	f	1978-05-04 00:00:00+00	Europe/Monaco
906	\N	QB	\N	f	1	302	session_R8YGx3KK	f	1978-05-06 00:00:00+00	Europe/Monaco
958	2	R	\N	f	12	320	session_vTQRBGYE	f	1979-05-27 00:00:00+00	Europe/Monaco
959	1	QB	\N	f	1	320	session_fSDDbCwE	f	1979-05-24 00:00:00+00	Europe/Monaco
916	2	R	\N	f	12	306	session_CHz9eIgV	f	1978-07-02 00:00:00+00	Europe/Paris
917	1	QB	\N	f	1	306	session_XdsueJ01	f	1978-06-30 00:00:00+00	Europe/Paris
918	\N	QB	\N	f	1	306	session_A3yyoyjX	f	1978-07-01 00:00:00+00	Europe/Paris
961	2	R	\N	f	12	321	session_8dDIc9Pn	f	1979-07-01 00:00:00+00	Europe/Paris
962	1	QB	\N	f	1	321	session_NPE1DyjM	f	1979-06-29 00:00:00+00	Europe/Paris
963	\N	QB	\N	f	1	321	session_5Sbk8CRM	f	1979-06-30 00:00:00+00	Europe/Paris
931	2	R	\N	f	12	311	session_R6WpLC8i	f	1978-09-10 00:00:00+00	Europe/Rome
932	1	QB	\N	f	1	311	session_59dizZ4O	f	1978-09-08 00:00:00+00	Europe/Rome
933	\N	QB	\N	f	1	311	session_6RSUTfI8	f	1978-09-09 00:00:00+00	Europe/Rome
913	2	R	\N	f	12	305	session_axgtaxrc	f	1978-06-17 00:00:00+00	Europe/Stockholm
914	1	QB	\N	f	1	305	session_IAyg9baU	f	1978-06-15 00:00:00+00	Europe/Stockholm
915	\N	QB	\N	f	1	305	session_dfx3nrXG	f	1978-06-16 00:00:00+00	Europe/Stockholm
925	2	R	\N	f	12	309	session_6GJZfJip	f	1978-08-13 00:00:00+00	Europe/Vienna
926	1	QB	\N	f	1	309	session_b9uaVvU1	f	1978-08-11 00:00:00+00	Europe/Vienna
927	\N	QB	\N	f	1	309	session_a7I4xGqy	f	1978-08-12 00:00:00+00	Europe/Vienna
970	2	R	\N	f	12	324	session_HxIkiC6C	f	1979-08-12 00:00:00+00	Europe/Vienna
940	2	R	\N	f	12	314	session_FdzNoAc7	f	1979-01-21 00:00:00+00	America/Argentina/Buenos_Aires
941	1	QB	\N	f	1	314	session_7hgjdK2Q	f	1979-01-19 00:00:00+00	America/Argentina/Buenos_Aires
903	\N	QB	\N	f	1	301	session_WrJkn1tj	f	1978-04-01 00:00:00+00	America/Los_Angeles
973	2	R	\N	f	12	325	session_TKbuug10	f	1979-08-26 00:00:00+00	Europe/Amsterdam
968	1	QB	\N	f	1	323	session_zjwMUftp	f	1979-07-27 00:00:00+00	Europe/Berlin
966	\N	QB	\N	f	1	322	session_eLEiYh4U	f	1979-07-13 00:00:00+00	Europe/London
994	2	R	\N	f	13	332	session_XHd7Cq84	f	1980-03-30 00:00:00+00	America/Los_Angeles
995	1	QB	\N	f	1	332	session_fwFySXcB	f	1980-03-28 00:00:00+00	America/Los_Angeles
979	2	R	\N	f	12	327	session_Z2OAhiXA	f	1979-09-30 00:00:00+00	America/Montreal
980	1	QB	\N	f	1	327	session_faWrX0cA	f	1979-09-28 00:00:00+00	America/Montreal
981	\N	QB	\N	f	1	327	session_wLyidzbq	f	1979-09-29 00:00:00+00	America/Montreal
1021	2	R	\N	f	13	341	session_Xw5Hj7iz	f	1980-09-28 00:00:00+00	America/Montreal
1022	1	QB	\N	f	1	341	session_PgJTLuV9	f	1980-09-26 00:00:00+00	America/Montreal
982	2	R	\N	f	12	328	session_OAhzzk8F	f	1979-10-07 00:00:00+00	America/New_York
983	1	QB	\N	f	1	328	session_Lj4exErz	f	1979-10-05 00:00:00+00	America/New_York
984	\N	QB	\N	f	1	328	session_1Bls7HkB	f	1979-10-06 00:00:00+00	America/New_York
1024	2	R	\N	f	13	342	session_GVM6fLEU	f	1980-10-05 00:00:00+00	America/New_York
1025	1	QB	\N	f	1	342	session_mDx2To9h	f	1980-10-03 00:00:00+00	America/New_York
988	2	R	\N	f	13	330	session_MR0nAxEL	f	1980-01-27 00:00:00+00	America/Sao_Paulo
989	1	QB	\N	f	1	330	session_RY3O1SZ4	f	1980-01-25 00:00:00+00	America/Sao_Paulo
990	\N	QB	\N	f	1	330	session_hXug3NJ3	f	1980-01-26 00:00:00+00	America/Sao_Paulo
1030	2	R	\N	f	13	344	session_iarF9kEX	f	1981-03-29 00:00:00+00	America/Sao_Paulo
1031	1	QB	\N	f	1	344	session_lkq7Dazy	f	1981-03-27 00:00:00+00	America/Sao_Paulo
1015	2	R	\N	f	13	339	session_tX7EKj26	f	1980-08-31 00:00:00+00	Europe/Amsterdam
1016	1	QB	\N	f	1	339	session_6roqdwU2	f	1980-08-29 00:00:00+00	Europe/Amsterdam
1017	\N	QB	\N	f	1	339	session_EW2CKnj1	f	1980-08-30 00:00:00+00	Europe/Amsterdam
1009	2	R	\N	f	13	337	session_5pxNpl2k	f	1980-08-10 00:00:00+00	Europe/Berlin
1010	1	QB	\N	f	1	337	session_tEDEn302	f	1980-08-08 00:00:00+00	Europe/Berlin
1011	\N	QB	\N	f	1	337	session_z5MA2mST	f	1980-08-09 00:00:00+00	Europe/Berlin
997	2	R	\N	f	13	333	session_4WW8yGBv	f	1980-05-04 00:00:00+00	Europe/Brussels
998	1	QB	\N	f	1	333	session_ajfvoaxn	f	1980-05-02 00:00:00+00	Europe/Brussels
999	\N	QB	\N	f	1	333	session_itZokSU9	f	1980-05-03 00:00:00+00	Europe/Brussels
1039	2	R	\N	f	13	347	session_WkcKnTvv	f	1981-05-17 00:00:00+00	Europe/Brussels
1006	2	R	\N	f	13	336	session_bMKF1qc3	f	1980-07-13 00:00:00+00	Europe/London
1007	1	QB	\N	f	1	336	session_GvJUiwG0	f	1980-07-11 00:00:00+00	Europe/London
1008	\N	QB	\N	f	1	336	session_hL25S6oP	f	1980-07-12 00:00:00+00	Europe/London
1045	2	R	\N	f	13	349	session_zdH5hbIX	f	1981-06-21 00:00:00+00	Europe/Madrid
1046	1	QB	\N	f	1	349	session_0xJVYPDr	f	1981-06-19 00:00:00+00	Europe/Madrid
1047	\N	QB	\N	f	1	349	session_nYRqJyDb	f	1981-06-20 00:00:00+00	Europe/Madrid
1000	2	R	\N	f	13	334	session_mSkH3fMo	f	1980-05-18 00:00:00+00	Europe/Monaco
1001	1	QB	\N	f	1	334	session_0f9IVCMe	f	1980-05-15 00:00:00+00	Europe/Monaco
1002	\N	QB	\N	f	1	334	session_AZaGQBHO	f	1980-05-17 00:00:00+00	Europe/Monaco
1042	2	R	\N	f	13	348	session_9wEv3Y0b	f	1981-05-31 00:00:00+00	Europe/Monaco
1043	1	QB	\N	f	1	348	session_qOnoyjUF	f	1981-05-28 00:00:00+00	Europe/Monaco
1003	2	R	\N	f	13	335	session_JEVsHOLV	f	1980-06-29 00:00:00+00	Europe/Paris
1004	1	QB	\N	f	1	335	session_pYvW8e7V	f	1980-06-27 00:00:00+00	Europe/Paris
1005	\N	QB	\N	f	1	335	session_DiWYZUyT	f	1980-06-28 00:00:00+00	Europe/Paris
1048	2	R	\N	f	13	350	session_bqigxtqp	f	1981-07-05 00:00:00+00	Europe/Paris
1049	1	QB	\N	f	1	350	session_KKmzWWSX	f	1981-07-03 00:00:00+00	Europe/Paris
976	2	R	\N	f	12	326	session_SW0WHKJa	f	1979-09-09 00:00:00+00	Europe/Rome
977	1	QB	\N	f	1	326	session_BnXFpMDe	f	1979-09-07 00:00:00+00	Europe/Rome
978	\N	QB	\N	f	1	326	session_IEfTveE9	f	1979-09-08 00:00:00+00	Europe/Rome
1018	2	R	\N	f	13	340	session_TRw9Aadq	f	1980-09-14 00:00:00+00	Europe/Rome
1019	1	QB	\N	f	1	340	session_xjl5xJEW	f	1980-09-12 00:00:00+00	Europe/Rome
1020	\N	QB	\N	f	1	340	session_NNT3bmtA	f	1980-09-13 00:00:00+00	Europe/Rome
1012	2	R	\N	f	13	338	session_Cr9g9AEO	f	1980-08-17 00:00:00+00	Europe/Vienna
1013	1	QB	\N	f	1	338	session_uVDuQOYi	f	1980-08-15 00:00:00+00	Europe/Vienna
1014	\N	QB	\N	f	1	338	session_j2DcUCcu	f	1980-08-16 00:00:00+00	Europe/Vienna
985	2	R	\N	f	13	329	session_bdyusYMe	f	1980-01-13 00:00:00+00	America/Argentina/Buenos_Aires
986	1	QB	\N	f	1	329	session_JMIyRYRK	f	1980-01-11 00:00:00+00	America/Argentina/Buenos_Aires
996	\N	QB	\N	f	1	332	session_ND124kVS	f	1980-03-29 00:00:00+00	America/Los_Angeles
1027	2	R	\N	f	13	343	session_EkgwP3pu	f	1981-03-15 00:00:00+00	America/Los_Angeles
1028	1	QB	\N	f	1	343	session_NGvB0CU8	f	1981-03-13 00:00:00+00	America/Los_Angeles
1023	\N	QB	\N	f	1	341	session_If7bP5L2	f	1980-09-27 00:00:00+00	America/Montreal
1066	2	R	\N	f	13	356	session_UlN0JniU	f	1981-09-27 00:00:00+00	America/Montreal
1067	1	QB	\N	f	1	356	session_RYoW2DX6	f	1981-09-25 00:00:00+00	America/Montreal
1068	\N	QB	\N	f	1	356	session_U5cDLkBX	f	1981-09-26 00:00:00+00	America/Montreal
1090	2	R	\N	f	13	364	session_zdHdycJ2	f	1982-06-06 00:00:00+00	America/New_York
1091	1	QB	\N	f	1	364	session_RoR3K2UD	f	1982-06-04 00:00:00+00	America/New_York
1092	\N	QB	\N	f	1	364	session_XmzzeLKG	f	1982-06-05 00:00:00+00	America/New_York
1075	2	R	\N	f	13	359	session_aGDM8kzF	f	1982-03-21 00:00:00+00	America/Sao_Paulo
1076	1	QB	\N	f	1	359	session_AZ4T3KYn	f	1982-03-19 00:00:00+00	America/Sao_Paulo
1077	\N	QB	\N	f	1	359	session_wND8hdi9	f	1982-03-20 00:00:00+00	America/Sao_Paulo
1120	2	R	\N	f	13	374	session_ZoHfRiCh	f	1983-03-13 00:00:00+00	America/Sao_Paulo
1121	1	QB	\N	f	1	374	session_keEaMFWN	f	1983-03-11 00:00:00+00	America/Sao_Paulo
1122	\N	QB	\N	f	1	374	session_A6QxN4iI	f	1983-03-12 00:00:00+00	America/Sao_Paulo
1060	2	R	\N	f	13	354	session_zJaqYB6U	f	1981-08-30 00:00:00+00	Europe/Amsterdam
1061	1	QB	\N	f	1	354	session_EoNl1aJO	f	1981-08-28 00:00:00+00	Europe/Amsterdam
1062	\N	QB	\N	f	1	354	session_0nqAv1Ro	f	1981-08-29 00:00:00+00	Europe/Amsterdam
1096	2	R	\N	f	13	366	session_TignPgmT	f	1982-07-03 00:00:00+00	Europe/Amsterdam
1097	1	QB	\N	f	1	366	session_YKeK95eD	f	1982-07-01 00:00:00+00	Europe/Amsterdam
1098	\N	QB	\N	f	1	366	session_L1vjhGmN	f	1982-07-02 00:00:00+00	Europe/Amsterdam
1054	2	R	\N	f	13	352	session_520uzFEd	f	1981-08-02 00:00:00+00	Europe/Berlin
1055	1	QB	\N	f	1	352	session_AvRYWyJX	f	1981-07-31 00:00:00+00	Europe/Berlin
1056	\N	QB	\N	f	1	352	session_atc20IDF	f	1981-08-01 00:00:00+00	Europe/Berlin
1105	2	R	\N	f	13	369	session_3Vm2tqCm	f	1982-08-08 00:00:00+00	Europe/Berlin
1106	1	QB	\N	f	1	369	session_XhVSV1hE	f	1982-08-06 00:00:00+00	Europe/Berlin
1107	\N	QB	\N	f	1	369	session_qMnUpiTq	f	1982-08-07 00:00:00+00	Europe/Berlin
1084	2	R	\N	f	13	362	session_qYdTkU8J	f	1982-05-09 00:00:00+00	Europe/Brussels
1085	1	QB	\N	f	1	362	session_SH7Cvxqv	f	1982-05-07 00:00:00+00	Europe/Brussels
1086	\N	QB	\N	f	1	362	session_VINF4EW8	f	1982-05-08 00:00:00+00	Europe/Brussels
1051	2	R	\N	f	13	351	session_0CjBvmPj	f	1981-07-18 00:00:00+00	Europe/London
1052	1	QB	\N	f	1	351	session_wSJqaN2T	f	1981-07-16 00:00:00+00	Europe/London
1053	\N	QB	\N	f	1	351	session_8TgePDWL	f	1981-07-17 00:00:00+00	Europe/London
1099	2	R	\N	f	13	367	session_V2cxy109	f	1982-07-18 00:00:00+00	Europe/London
1100	1	QB	\N	f	1	367	session_NhuKsVx0	f	1982-07-16 00:00:00+00	Europe/London
1101	\N	QB	\N	f	1	367	session_DEIwMhM9	f	1982-07-17 00:00:00+00	Europe/London
1087	2	R	\N	f	13	363	session_RQdKO7yL	f	1982-05-23 00:00:00+00	Europe/Monaco
1088	1	QB	\N	f	1	363	session_VQojo44O	f	1982-05-20 00:00:00+00	Europe/Monaco
1089	\N	QB	\N	f	1	363	session_kAxrnBnT	f	1982-05-22 00:00:00+00	Europe/Monaco
1102	2	R	\N	f	13	368	session_g4N2ZhEf	f	1982-07-25 00:00:00+00	Europe/Paris
1103	1	QB	\N	f	1	368	session_DUnwLeBS	f	1982-07-23 00:00:00+00	Europe/Paris
1104	\N	QB	\N	f	1	368	session_OoDvCsJN	f	1982-07-24 00:00:00+00	Europe/Paris
1111	2	R	\N	f	13	371	session_T3OBTttP	f	1982-08-29 00:00:00+00	Europe/Paris
1112	1	QB	\N	f	1	371	session_wLy74mEd	f	1982-08-27 00:00:00+00	Europe/Paris
1063	2	R	\N	f	13	355	session_BPhwIsZT	f	1981-09-13 00:00:00+00	Europe/Rome
1064	1	QB	\N	f	1	355	session_sC6zQtlv	f	1981-09-11 00:00:00+00	Europe/Rome
1065	\N	QB	\N	f	1	355	session_VyZdEj9y	f	1981-09-12 00:00:00+00	Europe/Rome
1081	2	R	\N	f	13	361	session_tm6rSzWi	f	1982-04-25 00:00:00+00	Europe/Rome
1082	1	QB	\N	f	1	361	session_guV7CUyI	f	1982-04-23 00:00:00+00	Europe/Rome
1057	2	R	\N	f	13	353	session_qdUZ29au	f	1981-08-16 00:00:00+00	Europe/Vienna
1058	1	QB	\N	f	1	353	session_wLsJwsP6	f	1981-08-14 00:00:00+00	Europe/Vienna
1059	\N	QB	\N	f	1	353	session_8cdLG6JB	f	1981-08-15 00:00:00+00	Europe/Vienna
1108	2	R	\N	f	13	370	session_qq7mAtn8	f	1982-08-15 00:00:00+00	Europe/Vienna
1109	1	QB	\N	f	1	370	session_IgoG7vIv	f	1982-08-13 00:00:00+00	Europe/Vienna
1110	\N	QB	\N	f	1	370	session_UGcOMZBa	f	1982-08-14 00:00:00+00	Europe/Vienna
1069	2	R	\N	f	13	357	session_fyLfhAY2	f	1981-10-17 00:00:00+00	America/Los_Angeles
1070	1	QB	\N	f	1	357	session_OCLy3qtb	f	1981-10-15 00:00:00+00	America/Los_Angeles
1071	\N	QB	\N	f	1	357	session_387s77Ip	f	1981-10-16 00:00:00+00	America/Los_Angeles
1093	2	R	\N	f	13	365	session_bxgzUOh1	f	1982-06-13 00:00:00+00	America/Montreal
1094	1	QB	\N	f	1	365	session_nbMGrgYt	f	1982-06-11 00:00:00+00	America/Montreal
1095	\N	QB	\N	f	1	365	session_O2Sb76Bl	f	1982-06-12 00:00:00+00	America/Montreal
1141	2	R	\N	f	13	381	session_mrXug5BL	f	1983-06-12 00:00:00+00	America/Montreal
1142	1	QB	\N	f	1	381	session_Ch166s7X	f	1983-06-10 00:00:00+00	America/Montreal
1143	\N	QB	\N	f	1	381	session_rspvR30W	f	1983-06-11 00:00:00+00	America/Montreal
1138	2	R	\N	f	13	380	session_i5oC0rVk	f	1983-06-05 00:00:00+00	America/New_York
1139	1	QB	\N	f	1	380	session_Xzuv65ic	f	1983-06-03 00:00:00+00	America/New_York
1140	\N	QB	\N	f	1	380	session_7WfwqMoD	f	1983-06-04 00:00:00+00	America/New_York
1186	2	R	\N	f	13	396	session_nOU7vaNc	f	1984-06-24 00:00:00+00	America/New_York
1187	1	QB	\N	f	1	396	session_vg2eGWFm	f	1984-06-22 00:00:00+00	America/New_York
1165	2	R	\N	f	13	389	session_DLNhVuUY	f	1984-03-25 00:00:00+00	America/Sao_Paulo
1166	1	QB	\N	f	1	389	session_ih0ajomX	f	1984-03-23 00:00:00+00	America/Sao_Paulo
1167	\N	QB	\N	f	1	389	session_fxAOVekf	f	1984-03-24 00:00:00+00	America/Sao_Paulo
1153	2	R	\N	f	13	385	session_h9a3NZJB	f	1983-08-28 00:00:00+00	Europe/Amsterdam
1154	1	QB	\N	f	1	385	session_Cns3OwSX	f	1983-08-26 00:00:00+00	Europe/Amsterdam
1155	\N	QB	\N	f	1	385	session_LxQSB104	f	1983-08-27 00:00:00+00	Europe/Amsterdam
1147	2	R	\N	f	13	383	session_Tb9GZq02	f	1983-08-07 00:00:00+00	Europe/Berlin
1148	1	QB	\N	f	1	383	session_5K3LXEtT	f	1983-08-05 00:00:00+00	Europe/Berlin
1149	\N	QB	\N	f	1	383	session_jqNxDLsK	f	1983-08-06 00:00:00+00	Europe/Berlin
1195	2	R	\N	f	13	399	session_KwXTzzJt	f	1984-08-05 00:00:00+00	Europe/Berlin
1135	2	R	\N	f	13	379	session_PwpDUau3	f	1983-05-22 00:00:00+00	Europe/Brussels
1136	1	QB	\N	f	1	379	session_sZrdnxe0	f	1983-05-20 00:00:00+00	Europe/Brussels
1137	\N	QB	\N	f	1	379	session_VzTN9q9o	f	1983-05-21 00:00:00+00	Europe/Brussels
1171	2	R	\N	f	13	391	session_1nXWSca2	f	1984-04-29 00:00:00+00	Europe/Brussels
1172	1	QB	\N	f	1	391	session_QKZlEPPI	f	1984-04-27 00:00:00+00	Europe/Brussels
1144	2	R	\N	f	13	382	session_moo7OAIQ	f	1983-07-16 00:00:00+00	Europe/London
1145	1	QB	\N	f	1	382	session_7g7LCSZQ	f	1983-07-14 00:00:00+00	Europe/London
1146	\N	QB	\N	f	1	382	session_Dl9WIq9Z	f	1983-07-15 00:00:00+00	Europe/London
1159	2	R	\N	f	13	387	session_0n9lTQef	f	1983-09-25 00:00:00+00	Europe/London
1160	1	QB	\N	f	1	387	session_GqSntCFI	f	1983-09-23 00:00:00+00	Europe/London
1132	2	R	\N	f	13	378	session_XwNZQetf	f	1983-05-15 00:00:00+00	Europe/Monaco
1133	1	QB	\N	f	1	378	session_ZwuirPVP	f	1983-05-12 00:00:00+00	Europe/Monaco
1134	\N	QB	\N	f	1	378	session_zVrAC7tw	f	1983-05-14 00:00:00+00	Europe/Monaco
1180	2	R	\N	f	13	394	session_SBTTPyUL	f	1984-06-03 00:00:00+00	Europe/Monaco
1181	1	QB	\N	f	1	394	session_9j5pyeNj	f	1984-05-31 00:00:00+00	Europe/Monaco
1182	\N	QB	\N	f	1	394	session_hrt6WxYI	f	1984-06-02 00:00:00+00	Europe/Monaco
1126	2	R	\N	f	13	376	session_godfqApu	f	1983-04-17 00:00:00+00	Europe/Paris
1127	1	QB	\N	f	1	376	session_J2j53zI3	f	1983-04-15 00:00:00+00	Europe/Paris
1128	\N	QB	\N	f	1	376	session_m5i7zPmD	f	1983-04-16 00:00:00+00	Europe/Paris
1177	2	R	\N	f	13	393	session_RJFTOybm	f	1984-05-20 00:00:00+00	Europe/Paris
1178	1	QB	\N	f	1	393	session_xYrY1SV7	f	1984-05-18 00:00:00+00	Europe/Paris
1179	\N	QB	\N	f	1	393	session_ZI7eE3Tm	f	1984-05-19 00:00:00+00	Europe/Paris
1129	2	R	\N	f	13	377	session_EMbaLAQw	f	1983-05-01 00:00:00+00	Europe/Rome
1130	1	QB	\N	f	1	377	session_FqsNguzI	f	1983-04-29 00:00:00+00	Europe/Rome
1131	\N	QB	\N	f	1	377	session_Li6aaZP4	f	1983-04-30 00:00:00+00	Europe/Rome
1156	2	R	\N	f	13	386	session_x5s8v62I	f	1983-09-11 00:00:00+00	Europe/Rome
1157	1	QB	\N	f	1	386	session_cdJ9W3Vo	f	1983-09-09 00:00:00+00	Europe/Rome
1158	\N	QB	\N	f	1	386	session_yQlnVYKk	f	1983-09-10 00:00:00+00	Europe/Rome
1150	2	R	\N	f	13	384	session_79kGKS3O	f	1983-08-14 00:00:00+00	Europe/Vienna
1151	1	QB	\N	f	1	384	session_CJctWSmW	f	1983-08-12 00:00:00+00	Europe/Vienna
1152	\N	QB	\N	f	1	384	session_hHN32tDU	f	1983-08-13 00:00:00+00	Europe/Vienna
1198	2	R	\N	f	13	400	session_uAMHOphN	f	1984-08-19 00:00:00+00	Europe/Vienna
1199	1	QB	\N	f	1	400	session_ZQyzjMVY	f	1984-08-17 00:00:00+00	Europe/Vienna
1200	\N	QB	\N	f	1	400	session_jrFrzt2P	f	1984-08-18 00:00:00+00	Europe/Vienna
1189	2	R	\N	f	13	397	session_shX52A9b	f	1984-07-08 00:00:00+00	America/Chicago
1190	1	QB	\N	f	1	397	session_JMvYSR4w	f	1984-07-06 00:00:00+00	America/Chicago
1191	\N	QB	\N	f	1	397	session_eubFJaNB	f	1984-07-07 00:00:00+00	America/Chicago
1183	2	R	\N	f	13	395	session_dvK4Zic4	f	1984-06-17 00:00:00+00	America/Montreal
1184	1	QB	\N	f	1	395	session_qllDODKU	f	1984-06-15 00:00:00+00	America/Montreal
1173	\N	QB	\N	f	1	391	session_b4deKfhZ	f	1984-04-28 00:00:00+00	Europe/Brussels
1174	2	R	\N	f	13	392	session_BowF4vI2	f	1984-05-06 00:00:00+00	Europe/Rome
1228	2	R	\N	f	13	410	session_j9cBJBOI	f	1985-06-23 00:00:00+00	America/New_York
1229	1	QB	\N	f	1	410	session_k9TSdErK	f	1985-06-21 00:00:00+00	America/New_York
1213	2	R	\N	f	13	405	session_lYq1nAZO	f	1985-04-07 00:00:00+00	America/Sao_Paulo
1258	2	R	\N	f	13	420	session_XrhEgSNg	f	1985-11-03 00:00:00+00	Australia/Adelaide
1259	1	QB	\N	f	1	420	session_iDJDiFLJ	f	1985-11-01 00:00:00+00	Australia/Adelaide
1260	\N	QB	\N	f	1	420	session_HbZIAtUL	f	1985-11-02 00:00:00+00	Australia/Adelaide
1201	2	R	\N	f	13	401	session_nXlHMh0o	f	1984-08-26 00:00:00+00	Europe/Amsterdam
1202	1	QB	\N	f	1	401	session_8W0mJ1u2	f	1984-08-24 00:00:00+00	Europe/Amsterdam
1207	2	R	\N	f	13	403	session_00Mpk9A5	f	1984-10-07 00:00:00+00	Europe/Berlin
1208	1	QB	\N	f	1	403	session_2ErhdXHO	f	1984-10-05 00:00:00+00	Europe/Berlin
1209	\N	QB	\N	f	1	403	session_zlRPeTZ9	f	1984-10-06 00:00:00+00	Europe/Berlin
1237	2	R	\N	f	13	413	session_FM3UHXTB	f	1985-08-04 00:00:00+00	Europe/Berlin
1238	1	QB	\N	f	1	413	session_iqeQaGoh	f	1985-08-02 00:00:00+00	Europe/Berlin
1239	\N	QB	\N	f	1	413	session_8SLkurkS	f	1985-08-03 00:00:00+00	Europe/Berlin
1249	2	R	\N	f	13	417	session_WgnToq0u	f	1985-09-15 00:00:00+00	Europe/Brussels
1250	1	QB	\N	f	1	417	session_Oe5ACtPM	f	1985-09-13 00:00:00+00	Europe/Brussels
1251	\N	QB	\N	f	1	417	session_dW4VGvap	f	1985-09-14 00:00:00+00	Europe/Brussels
1273	2	R	\N	f	13	425	session_rfNJI2Ia	f	1986-05-25 00:00:00+00	Europe/Brussels
1274	1	QB	\N	f	1	425	session_XIHdkNRq	f	1986-05-23 00:00:00+00	Europe/Brussels
1210	2	R	\N	f	13	404	session_SHculTsv	f	1984-10-21 00:00:00+00	Europe/Lisbon
1211	1	QB	\N	f	1	404	session_VKIAtYCi	f	1984-10-19 00:00:00+00	Europe/Lisbon
1212	\N	QB	\N	f	1	404	session_ECzxsp4C	f	1984-10-20 00:00:00+00	Europe/Lisbon
1216	2	R	\N	f	13	406	session_O9xorh72	f	1985-04-21 00:00:00+00	Europe/Lisbon
1217	1	QB	\N	f	1	406	session_F6hlfaUC	f	1985-04-19 00:00:00+00	Europe/Lisbon
1234	2	R	\N	f	13	412	session_smjutz4B	f	1985-07-21 00:00:00+00	Europe/London
1235	1	QB	\N	f	1	412	session_y9YKk1PZ	f	1985-07-19 00:00:00+00	Europe/London
1236	\N	QB	\N	f	1	412	session_6W8A5SJJ	f	1985-07-20 00:00:00+00	Europe/London
1252	2	R	\N	f	13	418	session_BDKGU1n1	f	1985-10-06 00:00:00+00	Europe/London
1253	1	QB	\N	f	1	418	session_naPKzGXs	f	1985-10-04 00:00:00+00	Europe/London
1254	\N	QB	\N	f	1	418	session_TsCSOkwF	f	1985-10-05 00:00:00+00	Europe/London
1264	2	R	\N	f	13	422	session_K0TkvChk	f	1986-04-13 00:00:00+00	Europe/Madrid
1265	1	QB	\N	f	1	422	session_Wh9y5fPZ	f	1986-04-11 00:00:00+00	Europe/Madrid
1266	\N	QB	\N	f	1	422	session_Z2dgEfl8	f	1986-04-12 00:00:00+00	Europe/Madrid
1222	2	R	\N	f	13	408	session_Om5QPpaM	f	1985-05-19 00:00:00+00	Europe/Monaco
1223	1	QB	\N	f	1	408	session_a1vtQikn	f	1985-05-16 00:00:00+00	Europe/Monaco
1224	\N	QB	\N	f	1	408	session_E6NJQVDe	f	1985-05-18 00:00:00+00	Europe/Monaco
1270	2	R	\N	f	13	424	session_IfAvfDPA	f	1986-05-11 00:00:00+00	Europe/Monaco
1231	2	R	\N	f	13	411	session_xWYmVzcG	f	1985-07-07 00:00:00+00	Europe/Paris
1232	1	QB	\N	f	1	411	session_8z9BMBY5	f	1985-07-05 00:00:00+00	Europe/Paris
1233	\N	QB	\N	f	1	411	session_hyaharrr	f	1985-07-06 00:00:00+00	Europe/Paris
1204	2	R	\N	f	13	402	session_AUf4yhn0	f	1984-09-09 00:00:00+00	Europe/Rome
1205	1	QB	\N	f	1	402	session_fpX4fjLj	f	1984-09-07 00:00:00+00	Europe/Rome
1206	\N	QB	\N	f	1	402	session_BItZVn02	f	1984-09-08 00:00:00+00	Europe/Rome
1219	2	R	\N	f	13	407	session_Br8flEkX	f	1985-05-05 00:00:00+00	Europe/Rome
1220	1	QB	\N	f	1	407	session_K61NL0uP	f	1985-05-03 00:00:00+00	Europe/Rome
1240	2	R	\N	f	13	414	session_X2FykVku	f	1985-08-18 00:00:00+00	Europe/Vienna
1241	1	QB	\N	f	1	414	session_k89oRXBH	f	1985-08-16 00:00:00+00	Europe/Vienna
1242	\N	QB	\N	f	1	414	session_WLzD5vag	f	1985-08-17 00:00:00+00	Europe/Vienna
1225	2	R	\N	f	13	409	session_6Ezh1FM1	f	1985-06-16 00:00:00+00	America/Montreal
1226	1	QB	\N	f	1	409	session_r5rfMnIe	f	1985-06-14 00:00:00+00	America/Montreal
1227	\N	QB	\N	f	1	409	session_C8GoJBH8	f	1985-06-15 00:00:00+00	America/Montreal
1214	1	QB	\N	f	1	405	session_UvcLGNO5	f	1985-04-05 00:00:00+00	America/Sao_Paulo
1215	\N	QB	\N	f	1	405	session_Soalh6Wk	f	1985-04-06 00:00:00+00	America/Sao_Paulo
1203	\N	QB	\N	f	1	401	session_unktVG5l	f	1984-08-25 00:00:00+00	Europe/Amsterdam
1243	2	R	\N	f	13	415	session_bGBhXiK5	f	1985-08-25 00:00:00+00	Europe/Amsterdam
1271	1	QB	\N	f	1	424	session_Dd6odEPR	f	1986-05-08 00:00:00+00	Europe/Monaco
1279	2	R	\N	f	13	427	session_15C0c4nl	f	1986-06-22 00:00:00+00	America/New_York
1280	1	QB	\N	f	1	427	session_5dNpqfDv	f	1986-06-20 00:00:00+00	America/New_York
1281	\N	QB	\N	f	1	427	session_al3kLNQ3	f	1986-06-21 00:00:00+00	America/New_York
1309	2	R	\N	f	13	437	session_JjFNCray	f	1987-04-12 00:00:00+00	America/Sao_Paulo
1310	1	QB	\N	f	1	437	session_eO2Rqqbn	f	1987-04-10 00:00:00+00	America/Sao_Paulo
1311	\N	QB	\N	f	1	437	session_h1cjkkco	f	1987-04-11 00:00:00+00	America/Sao_Paulo
1306	2	R	\N	f	13	436	session_ml3HSf7w	f	1986-10-26 00:00:00+00	Australia/Adelaide
1307	1	QB	\N	f	1	436	session_RkFY1wAD	f	1986-10-24 00:00:00+00	Australia/Adelaide
1308	\N	QB	\N	f	1	436	session_JZJnAJgB	f	1986-10-25 00:00:00+00	Australia/Adelaide
1288	2	R	\N	f	13	430	session_MqZsZb3r	f	1986-07-27 00:00:00+00	Europe/Berlin
1289	1	QB	\N	f	1	430	session_MOcTxhOD	f	1986-07-25 00:00:00+00	Europe/Berlin
1290	\N	QB	\N	f	1	430	session_wBxyoIAZ	f	1986-07-26 00:00:00+00	Europe/Berlin
1330	2	R	\N	f	13	444	session_i9Poy7dq	f	1987-07-26 00:00:00+00	Europe/Berlin
1315	2	R	\N	f	13	439	session_KFZsAqjA	f	1987-05-17 00:00:00+00	Europe/Brussels
1316	1	QB	\N	f	1	439	session_0ndDpEbE	f	1987-05-15 00:00:00+00	Europe/Brussels
1317	\N	QB	\N	f	1	439	session_tWSyQZWH	f	1987-05-16 00:00:00+00	Europe/Brussels
1291	2	R	\N	f	13	431	session_6bvpqiEY	f	1986-08-10 00:00:00+00	Europe/Budapest
1292	1	QB	\N	f	1	431	session_BzGCHALt	f	1986-08-08 00:00:00+00	Europe/Budapest
1293	\N	QB	\N	f	1	431	session_VMwWIsjj	f	1986-08-09 00:00:00+00	Europe/Budapest
1333	2	R	\N	f	13	445	session_L3xC1gVs	f	1987-08-09 00:00:00+00	Europe/Budapest
1334	1	QB	\N	f	1	445	session_5FHAJZLe	f	1987-08-07 00:00:00+00	Europe/Budapest
1300	2	R	\N	f	13	434	session_aBfDo2l0	f	1986-09-21 00:00:00+00	Europe/Lisbon
1301	1	QB	\N	f	1	434	session_i5G7fpuk	f	1986-09-19 00:00:00+00	Europe/Lisbon
1302	\N	QB	\N	f	1	434	session_7d3kYzy1	f	1986-09-20 00:00:00+00	Europe/Lisbon
1342	2	R	\N	f	13	448	session_e7dJaAiJ	f	1987-09-20 00:00:00+00	Europe/Lisbon
1343	1	QB	\N	f	1	448	session_mRoijrQn	f	1987-09-18 00:00:00+00	Europe/Lisbon
1285	2	R	\N	f	13	429	session_ezEa01pA	f	1986-07-13 00:00:00+00	Europe/London
1286	1	QB	\N	f	1	429	session_Retd3YDJ	f	1986-07-11 00:00:00+00	Europe/London
1287	\N	QB	\N	f	1	429	session_nTK7tKJN	f	1986-07-12 00:00:00+00	Europe/London
1327	2	R	\N	f	13	443	session_A9ouGCKD	f	1987-07-12 00:00:00+00	Europe/London
1328	1	QB	\N	f	1	443	session_vCiJN9a6	f	1987-07-10 00:00:00+00	Europe/London
1345	2	R	\N	f	13	449	session_nQ2sRm8i	f	1987-09-27 00:00:00+00	Europe/Madrid
1346	1	QB	\N	f	1	449	session_pfotERWs	f	1987-09-25 00:00:00+00	Europe/Madrid
1347	\N	QB	\N	f	1	449	session_UWETYj0w	f	1987-09-26 00:00:00+00	Europe/Madrid
1318	2	R	\N	f	13	440	session_SOKJTClr	f	1987-05-31 00:00:00+00	Europe/Monaco
1319	1	QB	\N	f	1	440	session_bgrY6UQf	f	1987-05-28 00:00:00+00	Europe/Monaco
1320	\N	QB	\N	f	1	440	session_yborQGCE	f	1987-05-30 00:00:00+00	Europe/Monaco
1282	2	R	\N	f	13	428	session_SK5QkpRM	f	1986-07-06 00:00:00+00	Europe/Paris
1283	1	QB	\N	f	1	428	session_3Fq6FrfP	f	1986-07-04 00:00:00+00	Europe/Paris
1284	\N	QB	\N	f	1	428	session_stAgiTgd	f	1986-07-05 00:00:00+00	Europe/Paris
1324	2	R	\N	f	13	442	session_NqEMtBrq	f	1987-07-05 00:00:00+00	Europe/Paris
1325	1	QB	\N	f	1	442	session_VWZfJDqV	f	1987-07-03 00:00:00+00	Europe/Paris
1297	2	R	\N	f	13	433	session_FoZN5UAZ	f	1986-09-07 00:00:00+00	Europe/Rome
1298	1	QB	\N	f	1	433	session_YxtWZ97q	f	1986-09-05 00:00:00+00	Europe/Rome
1299	\N	QB	\N	f	1	433	session_dW5108bf	f	1986-09-06 00:00:00+00	Europe/Rome
1312	2	R	\N	f	13	438	session_rUwkIxjc	f	1987-05-03 00:00:00+00	Europe/Rome
1313	1	QB	\N	f	1	438	session_RrRITGNG	f	1987-05-01 00:00:00+00	Europe/Rome
1294	2	R	\N	f	13	432	session_MT9cvf8F	f	1986-08-17 00:00:00+00	Europe/Vienna
1295	1	QB	\N	f	1	432	session_QGePm14f	f	1986-08-15 00:00:00+00	Europe/Vienna
1296	\N	QB	\N	f	1	432	session_zWgUgZhY	f	1986-08-16 00:00:00+00	Europe/Vienna
1336	2	R	\N	f	13	446	session_9DUwP4Hm	f	1987-08-16 00:00:00+00	Europe/Vienna
1337	1	QB	\N	f	1	446	session_FjkEp7kr	f	1987-08-14 00:00:00+00	Europe/Vienna
1338	\N	QB	\N	f	1	446	session_IdKc9xNR	f	1987-08-15 00:00:00+00	Europe/Vienna
1276	2	R	\N	f	13	426	session_G6VwOhCx	f	1986-06-15 00:00:00+00	America/Montreal
1277	1	QB	\N	f	1	426	session_d9jrhS19	f	1986-06-13 00:00:00+00	America/Montreal
1278	\N	QB	\N	f	1	426	session_zWetvRWx	f	1986-06-14 00:00:00+00	America/Montreal
1321	2	R	\N	f	13	441	session_wV2Qn2p5	f	1987-06-21 00:00:00+00	America/New_York
1322	1	QB	\N	f	1	441	session_TnH6F3vy	f	1987-06-19 00:00:00+00	America/New_York
1329	\N	QB	\N	f	1	443	session_HywUl16r	f	1987-07-11 00:00:00+00	Europe/London
1369	2	R	\N	f	13	457	session_srPhP4TV	f	1988-06-12 00:00:00+00	America/Montreal
1370	1	QB	\N	f	1	457	session_B886UFH9	f	1988-06-10 00:00:00+00	America/Montreal
1371	\N	QB	\N	f	1	457	session_M91o6TP4	f	1988-06-11 00:00:00+00	America/Montreal
1372	2	R	\N	f	13	458	session_htvvDoUZ	f	1988-06-19 00:00:00+00	America/New_York
1373	1	QB	\N	f	1	458	session_wcHs77bt	f	1988-06-17 00:00:00+00	America/New_York
1374	\N	QB	\N	f	1	458	session_Hm8UxwzI	f	1988-06-18 00:00:00+00	America/New_York
1357	2	R	\N	f	13	453	session_4uOwC3b5	f	1988-04-03 00:00:00+00	America/Sao_Paulo
1358	1	QB	\N	f	1	453	session_5BVjZD91	f	1988-04-01 00:00:00+00	America/Sao_Paulo
1359	\N	QB	\N	f	1	453	session_l0tqqG56	f	1988-04-02 00:00:00+00	America/Sao_Paulo
1405	2	R	\N	f	13	469	session_Pnt0hnC1	f	1989-03-26 00:00:00+00	America/Sao_Paulo
1351	2	R	\N	f	13	451	session_Ts202NRv	f	1987-11-01 00:00:00+00	Asia/Tokyo
1352	1	QB	\N	f	1	451	session_sek00RNe	f	1987-10-30 00:00:00+00	Asia/Tokyo
1353	\N	QB	\N	f	1	451	session_hQ0OHMgk	f	1987-10-31 00:00:00+00	Asia/Tokyo
1399	2	R	\N	f	13	467	session_gstwG6Mu	f	1988-10-30 00:00:00+00	Asia/Tokyo
1400	1	QB	\N	f	1	467	session_hgLII32E	f	1988-10-28 00:00:00+00	Asia/Tokyo
1354	2	R	\N	f	13	452	session_O35rLpos	f	1987-11-15 00:00:00+00	Australia/Adelaide
1355	1	QB	\N	f	1	452	session_qvaSr252	f	1987-11-13 00:00:00+00	Australia/Adelaide
1356	\N	QB	\N	f	1	452	session_vjgEMYjD	f	1987-11-14 00:00:00+00	Australia/Adelaide
1402	2	R	\N	f	13	468	session_DgEpziIt	f	1988-11-13 00:00:00+00	Australia/Adelaide
1403	1	QB	\N	f	1	468	session_3EEt4zRv	f	1988-11-11 00:00:00+00	Australia/Adelaide
1381	2	R	\N	f	13	461	session_wxyM6tCG	f	1988-07-24 00:00:00+00	Europe/Berlin
1382	1	QB	\N	f	1	461	session_liJ6YlSh	f	1988-07-22 00:00:00+00	Europe/Berlin
1383	\N	QB	\N	f	1	461	session_ydnMAh2x	f	1988-07-23 00:00:00+00	Europe/Berlin
1387	2	R	\N	f	13	463	session_I0XALoE7	f	1988-08-28 00:00:00+00	Europe/Brussels
1388	1	QB	\N	f	1	463	session_owzkDsUw	f	1988-08-26 00:00:00+00	Europe/Brussels
1389	\N	QB	\N	f	1	463	session_SzTPsrRa	f	1988-08-27 00:00:00+00	Europe/Brussels
1384	2	R	\N	f	13	462	session_KKF6XWWk	f	1988-08-07 00:00:00+00	Europe/Budapest
1385	1	QB	\N	f	1	462	session_owpbDbiN	f	1988-08-05 00:00:00+00	Europe/Budapest
1386	\N	QB	\N	f	1	462	session_y0sfT9R9	f	1988-08-06 00:00:00+00	Europe/Budapest
1393	2	R	\N	f	13	465	session_PIA6Y6ou	f	1988-09-25 00:00:00+00	Europe/Lisbon
1394	1	QB	\N	f	1	465	session_EHYomA0m	f	1988-09-23 00:00:00+00	Europe/Lisbon
1395	\N	QB	\N	f	1	465	session_uVZfaC7W	f	1988-09-24 00:00:00+00	Europe/Lisbon
1378	2	R	\N	f	13	460	session_k1q63j7o	f	1988-07-10 00:00:00+00	Europe/London
1379	1	QB	\N	f	1	460	session_2jTtOeHs	f	1988-07-08 00:00:00+00	Europe/London
1380	\N	QB	\N	f	1	460	session_njQjRcLD	f	1988-07-09 00:00:00+00	Europe/London
1396	2	R	\N	f	13	466	session_OkHa77BI	f	1988-10-02 00:00:00+00	Europe/Madrid
1397	1	QB	\N	f	1	466	session_NRNr8JsL	f	1988-09-30 00:00:00+00	Europe/Madrid
1398	\N	QB	\N	f	1	466	session_NveqDZwB	f	1988-10-01 00:00:00+00	Europe/Madrid
1363	2	R	\N	f	13	455	session_8O4moRK9	f	1988-05-15 00:00:00+00	Europe/Monaco
1364	1	QB	\N	f	1	455	session_NBckKdCU	f	1988-05-12 00:00:00+00	Europe/Monaco
1365	\N	QB	\N	f	1	455	session_kp4vqsk7	f	1988-05-14 00:00:00+00	Europe/Monaco
1375	2	R	\N	f	13	459	session_93YFdnDG	f	1988-07-03 00:00:00+00	Europe/Paris
1376	1	QB	\N	f	1	459	session_Xz4I65v7	f	1988-07-01 00:00:00+00	Europe/Paris
1377	\N	QB	\N	f	1	459	session_Z7CIVPaX	f	1988-07-02 00:00:00+00	Europe/Paris
1423	2	R	\N	f	13	475	session_p9klDebU	f	1989-07-09 00:00:00+00	Europe/Paris
1424	1	QB	\N	f	1	475	session_cPb3KvSV	f	1989-07-07 00:00:00+00	Europe/Paris
1425	\N	QB	\N	f	1	475	session_PwygYJlg	f	1989-07-08 00:00:00+00	Europe/Paris
1360	2	R	\N	f	13	454	session_3hov4T2X	f	1988-05-01 00:00:00+00	Europe/Rome
1361	1	QB	\N	f	1	454	session_mZG8arjn	f	1988-04-29 00:00:00+00	Europe/Rome
1362	\N	QB	\N	f	1	454	session_sX0ZuMCr	f	1988-04-30 00:00:00+00	Europe/Rome
1390	2	R	\N	f	13	464	session_oqxESq0Z	f	1988-09-11 00:00:00+00	Europe/Rome
1391	1	QB	\N	f	1	464	session_BrRxwEc6	f	1988-09-09 00:00:00+00	Europe/Rome
1366	2	R	\N	f	13	456	session_K7ZqIARG	f	1988-05-29 00:00:00+00	America/Mexico_City
1367	1	QB	\N	f	1	456	session_gzzPyc1u	f	1988-05-27 00:00:00+00	America/Mexico_City
1368	\N	QB	\N	f	1	456	session_Mp7h8lTr	f	1988-05-28 00:00:00+00	America/Mexico_City
1420	2	R	\N	f	13	474	session_YmQbIcZf	f	1989-06-18 00:00:00+00	America/Montreal
1421	1	QB	\N	f	1	474	session_Yh0ARlU0	f	1989-06-16 00:00:00+00	America/Montreal
1401	\N	QB	\N	f	1	467	session_JFo19peG	f	1988-10-29 00:00:00+00	Asia/Tokyo
1465	2	R	\N	f	13	489	session_wUS6Pic6	f	1990-06-10 00:00:00+00	America/Montreal
1466	1	QB	\N	f	1	489	session_1CPRlojo	f	1990-06-08 00:00:00+00	America/Montreal
1456	2	R	\N	f	13	486	session_0O5D1oW0	f	1990-03-25 00:00:00+00	America/Sao_Paulo
1457	1	QB	\N	f	1	486	session_L1K8s3uo	f	1990-03-23 00:00:00+00	America/Sao_Paulo
1458	\N	QB	\N	f	1	486	session_4ASlS5c0	f	1990-03-24 00:00:00+00	America/Sao_Paulo
1447	2	R	\N	f	13	483	session_IK344iB4	f	1989-10-22 00:00:00+00	Asia/Tokyo
1448	1	QB	\N	f	1	483	session_Yt0zIQx5	f	1989-10-20 00:00:00+00	Asia/Tokyo
1450	2	R	\N	f	13	484	session_SJjoLdVV	f	1989-11-05 00:00:00+00	Australia/Adelaide
1451	1	QB	\N	f	1	484	session_qqVHpyME	f	1989-11-03 00:00:00+00	Australia/Adelaide
1452	\N	QB	\N	f	1	484	session_ywbnfgNt	f	1989-11-04 00:00:00+00	Australia/Adelaide
1429	2	R	\N	f	13	477	session_o4uHJwY6	f	1989-07-30 00:00:00+00	Europe/Berlin
1430	1	QB	\N	f	1	477	session_N0po6YgH	f	1989-07-28 00:00:00+00	Europe/Berlin
1431	\N	QB	\N	f	1	477	session_6bwDS92h	f	1989-07-29 00:00:00+00	Europe/Berlin
1477	2	R	\N	f	13	493	session_kgJIsV98	f	1990-07-29 00:00:00+00	Europe/Berlin
1478	1	QB	\N	f	1	493	session_blhVFy4N	f	1990-07-27 00:00:00+00	Europe/Berlin
1435	2	R	\N	f	13	479	session_6ST9IdHd	f	1989-08-27 00:00:00+00	Europe/Brussels
1436	1	QB	\N	f	1	479	session_a62S0twQ	f	1989-08-25 00:00:00+00	Europe/Brussels
1437	\N	QB	\N	f	1	479	session_d84XaTQJ	f	1989-08-26 00:00:00+00	Europe/Brussels
1483	2	R	\N	f	13	495	session_JBBSV2OF	f	1990-08-26 00:00:00+00	Europe/Brussels
1484	1	QB	\N	f	1	495	session_YhUOYJrZ	f	1990-08-24 00:00:00+00	Europe/Brussels
1432	2	R	\N	f	13	478	session_jTw7wRcA	f	1989-08-13 00:00:00+00	Europe/Budapest
1433	1	QB	\N	f	1	478	session_6cE59gKP	f	1989-08-11 00:00:00+00	Europe/Budapest
1434	\N	QB	\N	f	1	478	session_ij0wOIi3	f	1989-08-12 00:00:00+00	Europe/Budapest
1480	2	R	\N	f	13	494	session_n0llafWv	f	1990-08-12 00:00:00+00	Europe/Budapest
1481	1	QB	\N	f	1	494	session_FImkAIdr	f	1990-08-10 00:00:00+00	Europe/Budapest
1441	2	R	\N	f	13	481	session_gAEniRPP	f	1989-09-24 00:00:00+00	Europe/Lisbon
1442	1	QB	\N	f	1	481	session_AI88tUj6	f	1989-09-22 00:00:00+00	Europe/Lisbon
1443	\N	QB	\N	f	1	481	session_fbSez5MP	f	1989-09-23 00:00:00+00	Europe/Lisbon
1489	2	R	\N	f	13	497	session_Jhwya7bl	f	1990-09-23 00:00:00+00	Europe/Lisbon
1490	1	QB	\N	f	1	497	session_j3e86Xg4	f	1990-09-21 00:00:00+00	Europe/Lisbon
1491	\N	QB	\N	f	1	497	session_ui2aA41E	f	1990-09-22 00:00:00+00	Europe/Lisbon
1426	2	R	\N	f	13	476	session_5Fw491vg	f	1989-07-16 00:00:00+00	Europe/London
1427	1	QB	\N	f	1	476	session_NTZpbJi9	f	1989-07-14 00:00:00+00	Europe/London
1428	\N	QB	\N	f	1	476	session_me4StdcS	f	1989-07-15 00:00:00+00	Europe/London
1474	2	R	\N	f	13	492	session_HaRj9o5a	f	1990-07-15 00:00:00+00	Europe/London
1475	1	QB	\N	f	1	492	session_dUkRxA5T	f	1990-07-13 00:00:00+00	Europe/London
1444	2	R	\N	f	13	482	session_afAK4aFB	f	1989-10-01 00:00:00+00	Europe/Madrid
1445	1	QB	\N	f	1	482	session_uLxEqlb7	f	1989-09-29 00:00:00+00	Europe/Madrid
1446	\N	QB	\N	f	1	482	session_nckgoQIv	f	1989-09-30 00:00:00+00	Europe/Madrid
1492	2	R	\N	f	13	498	session_qHoaz8Wf	f	1990-09-30 00:00:00+00	Europe/Madrid
1493	1	QB	\N	f	1	498	session_lucbH1vZ	f	1990-09-28 00:00:00+00	Europe/Madrid
1494	\N	QB	\N	f	1	498	session_F4rltBnU	f	1990-09-29 00:00:00+00	Europe/Madrid
1462	2	R	\N	f	13	488	session_yd86V0lj	f	1990-05-27 00:00:00+00	Europe/Monaco
1463	1	QB	\N	f	1	488	session_q6yyWbZV	f	1990-05-24 00:00:00+00	Europe/Monaco
1464	\N	QB	\N	f	1	488	session_vuxfK7Ds	f	1990-05-26 00:00:00+00	Europe/Monaco
1471	2	R	\N	f	13	491	session_T16mH7bv	f	1990-07-08 00:00:00+00	Europe/Paris
1472	1	QB	\N	f	1	491	session_9YLwcWjT	f	1990-07-06 00:00:00+00	Europe/Paris
1473	\N	QB	\N	f	1	491	session_DqiArVA7	f	1990-07-07 00:00:00+00	Europe/Paris
1438	2	R	\N	f	13	480	session_Jrgh8dsu	f	1989-09-10 00:00:00+00	Europe/Rome
1439	1	QB	\N	f	1	480	session_O3FtIV4c	f	1989-09-08 00:00:00+00	Europe/Rome
1440	\N	QB	\N	f	1	480	session_bBSJmdZC	f	1989-09-09 00:00:00+00	Europe/Rome
1459	2	R	\N	f	13	487	session_dFmgBkiT	f	1990-05-13 00:00:00+00	Europe/Rome
1468	2	R	\N	f	13	490	session_yeRWWLq7	f	1990-06-24 00:00:00+00	America/Mexico_City
1469	1	QB	\N	f	1	490	session_xTcGGqxB	f	1990-06-22 00:00:00+00	America/Mexico_City
1470	\N	QB	\N	f	1	490	session_ElYkVlXU	f	1990-06-23 00:00:00+00	America/Mexico_City
1498	2	R	\N	f	13	500	session_WK71pCO8	f	1990-11-04 00:00:00+00	Australia/Adelaide
1499	1	QB	\N	f	1	500	session_ku3nxz2x	f	1990-11-02 00:00:00+00	Australia/Adelaide
1479	\N	QB	\N	f	1	493	session_bO56Guxc	f	1990-07-28 00:00:00+00	Europe/Berlin
1516	2	R	\N	f	14	506	session_3z9DM6DB	f	1991-06-16 00:00:00+00	America/Mexico_City
1517	1	QB	\N	f	1	506	session_eoNWek3m	f	1991-06-14 00:00:00+00	America/Mexico_City
1513	2	R	\N	f	14	505	session_L2Za2a4a	f	1991-06-02 00:00:00+00	America/Montreal
1514	1	QB	\N	f	1	505	session_DCtKfNGq	f	1991-05-31 00:00:00+00	America/Montreal
1515	\N	QB	\N	f	1	505	session_AVZ2Hwtb	f	1991-06-01 00:00:00+00	America/Montreal
1504	2	R	\N	f	14	502	session_H7Q0inh5	f	1991-03-24 00:00:00+00	America/Sao_Paulo
1505	1	QB	\N	f	1	502	session_1l3lhvs6	f	1991-03-22 00:00:00+00	America/Sao_Paulo
1506	\N	QB	\N	f	1	502	session_X0G8eKZx	f	1991-03-23 00:00:00+00	America/Sao_Paulo
1555	2	R	\N	f	14	519	session_hWMmrHt2	f	1992-04-05 00:00:00+00	America/Sao_Paulo
1556	1	QB	\N	f	1	519	session_sqmaXabW	f	1992-04-03 00:00:00+00	America/Sao_Paulo
1543	2	R	\N	f	14	515	session_jHpPA2OE	f	1991-10-20 00:00:00+00	Asia/Tokyo
1544	1	QB	\N	f	1	515	session_D6eG35M8	f	1991-10-18 00:00:00+00	Asia/Tokyo
1545	\N	QB	\N	f	1	515	session_TtbFKfOs	f	1991-10-19 00:00:00+00	Asia/Tokyo
1546	2	R	\N	f	14	516	session_hscRVY6n	f	1991-11-03 00:00:00+00	Australia/Adelaide
1547	1	QB	\N	f	1	516	session_vJ91Recw	f	1991-11-01 00:00:00+00	Australia/Adelaide
1548	\N	QB	\N	f	1	516	session_kIops5NJ	f	1991-11-02 00:00:00+00	Australia/Adelaide
1525	2	R	\N	f	14	509	session_G38ThWQE	f	1991-07-28 00:00:00+00	Europe/Berlin
1526	1	QB	\N	f	1	509	session_zyKDAQ3N	f	1991-07-26 00:00:00+00	Europe/Berlin
1527	\N	QB	\N	f	1	509	session_LAXpZE7C	f	1991-07-27 00:00:00+00	Europe/Berlin
1531	2	R	\N	f	14	511	session_NMOEdxe9	f	1991-08-25 00:00:00+00	Europe/Brussels
1532	1	QB	\N	f	1	511	session_OUHHk8Si	f	1991-08-23 00:00:00+00	Europe/Brussels
1533	\N	QB	\N	f	1	511	session_PLBNo1Vc	f	1991-08-24 00:00:00+00	Europe/Brussels
1528	2	R	\N	f	14	510	session_udjDI8JT	f	1991-08-11 00:00:00+00	Europe/Budapest
1529	1	QB	\N	f	1	510	session_u48uil0I	f	1991-08-09 00:00:00+00	Europe/Budapest
1530	\N	QB	\N	f	1	510	session_jJpL0oe8	f	1991-08-10 00:00:00+00	Europe/Budapest
1537	2	R	\N	f	14	513	session_ykUBaggx	f	1991-09-22 00:00:00+00	Europe/Lisbon
1538	1	QB	\N	f	1	513	session_rWD11zfd	f	1991-09-20 00:00:00+00	Europe/Lisbon
1539	\N	QB	\N	f	1	513	session_dsEo17cr	f	1991-09-21 00:00:00+00	Europe/Lisbon
1522	2	R	\N	f	14	508	session_a8q7M5eL	f	1991-07-14 00:00:00+00	Europe/London
1523	1	QB	\N	f	1	508	session_4fJBpncn	f	1991-07-12 00:00:00+00	Europe/London
1524	\N	QB	\N	f	1	508	session_G2qhXgs3	f	1991-07-13 00:00:00+00	Europe/London
1573	2	R	\N	f	14	525	session_Ksff7PyQ	f	1992-07-12 00:00:00+00	Europe/London
1540	2	R	\N	f	14	514	session_buxJB1gy	f	1991-09-29 00:00:00+00	Europe/Madrid
1541	1	QB	\N	f	1	514	session_BGLhD2XJ	f	1991-09-27 00:00:00+00	Europe/Madrid
1542	\N	QB	\N	f	1	514	session_78dcNjrz	f	1991-09-28 00:00:00+00	Europe/Madrid
1558	2	R	\N	f	14	520	session_8dUWvnO0	f	1992-05-03 00:00:00+00	Europe/Madrid
1559	1	QB	\N	f	1	520	session_DsPHRa68	f	1992-05-01 00:00:00+00	Europe/Madrid
1510	2	R	\N	f	14	504	session_feH10TOR	f	1991-05-12 00:00:00+00	Europe/Monaco
1511	1	QB	\N	f	1	504	session_hGlJaZG2	f	1991-05-09 00:00:00+00	Europe/Monaco
1512	\N	QB	\N	f	1	504	session_80a0absm	f	1991-05-11 00:00:00+00	Europe/Monaco
1564	2	R	\N	f	14	522	session_7i8RDFYA	f	1992-05-31 00:00:00+00	Europe/Monaco
1565	1	QB	\N	f	1	522	session_UTXGQyjs	f	1992-05-28 00:00:00+00	Europe/Monaco
1519	2	R	\N	f	14	507	session_6aUEfYKU	f	1991-07-07 00:00:00+00	Europe/Paris
1520	1	QB	\N	f	1	507	session_rnhmXSiL	f	1991-07-05 00:00:00+00	Europe/Paris
1521	\N	QB	\N	f	1	507	session_9eHsI26X	f	1991-07-06 00:00:00+00	Europe/Paris
1570	2	R	\N	f	14	524	session_EuIsvh0G	f	1992-07-05 00:00:00+00	Europe/Paris
1571	1	QB	\N	f	1	524	session_DuVbnI7a	f	1992-07-03 00:00:00+00	Europe/Paris
1507	2	R	\N	f	14	503	session_nrRLRQIY	f	1991-04-28 00:00:00+00	Europe/Rome
1508	1	QB	\N	f	1	503	session_LSYkjhpX	f	1991-04-26 00:00:00+00	Europe/Rome
1509	\N	QB	\N	f	1	503	session_nFfottsN	f	1991-04-27 00:00:00+00	Europe/Rome
1534	2	R	\N	f	14	512	session_toEwKktW	f	1991-09-08 00:00:00+00	Europe/Rome
1535	1	QB	\N	f	1	512	session_doBGYA2x	f	1991-09-06 00:00:00+00	Europe/Rome
1501	2	R	\N	f	14	501	session_hUfn0YKs	f	1991-03-10 00:00:00+00	America/Los_Angeles
1502	1	QB	\N	f	1	501	session_pi9V1fx4	f	1991-03-08 00:00:00+00	America/Los_Angeles
1503	\N	QB	\N	f	1	501	session_guzHNnSe	f	1991-03-09 00:00:00+00	America/Los_Angeles
1567	2	R	\N	f	14	523	session_jSXwOLQ0	f	1992-06-14 00:00:00+00	America/Montreal
1568	1	QB	\N	f	1	523	session_T7pQcdPH	f	1992-06-12 00:00:00+00	America/Montreal
1572	\N	QB	\N	f	1	524	session_ZJFNa0oI	f	1992-07-04 00:00:00+00	Europe/Paris
1600	2	R	\N	f	14	534	session_tDa8Fuz1	f	1993-03-28 00:00:00+00	America/Sao_Paulo
1601	1	QB	\N	f	1	534	session_r8rIs1vT	f	1993-03-26 00:00:00+00	America/Sao_Paulo
1591	2	R	\N	f	14	531	session_DxR7O4eJ	f	1992-10-25 00:00:00+00	Asia/Tokyo
1592	1	QB	\N	f	1	531	session_qcWGl3T0	f	1992-10-23 00:00:00+00	Asia/Tokyo
1593	\N	QB	\N	f	1	531	session_HXNhKuLT	f	1992-10-24 00:00:00+00	Asia/Tokyo
1594	2	R	\N	f	14	532	session_zGNRCfmE	f	1992-11-08 00:00:00+00	Australia/Adelaide
1595	1	QB	\N	f	1	532	session_aVY7afJ7	f	1992-11-06 00:00:00+00	Australia/Adelaide
1596	\N	QB	\N	f	1	532	session_Cc2ltGQF	f	1992-11-07 00:00:00+00	Australia/Adelaide
1642	2	R	\N	f	14	548	session_tNoFRiAK	f	1993-11-07 00:00:00+00	Australia/Adelaide
1643	1	QB	\N	f	1	548	session_l7DGA331	f	1993-11-05 00:00:00+00	Australia/Adelaide
1644	\N	QB	\N	f	1	548	session_OSEYOXDG	f	1993-11-06 00:00:00+00	Australia/Adelaide
1576	2	R	\N	f	14	526	session_xYYtjFnm	f	1992-07-26 00:00:00+00	Europe/Berlin
1577	1	QB	\N	f	1	526	session_3qdZ5aMN	f	1992-07-24 00:00:00+00	Europe/Berlin
1578	\N	QB	\N	f	1	526	session_k8Dxfptl	f	1992-07-25 00:00:00+00	Europe/Berlin
1624	2	R	\N	f	14	542	session_6KpZFuTK	f	1993-07-25 00:00:00+00	Europe/Berlin
1625	1	QB	\N	f	1	542	session_cXeMQclZ	f	1993-07-23 00:00:00+00	Europe/Berlin
1626	\N	QB	\N	f	1	542	session_BEfc7hCS	f	1993-07-24 00:00:00+00	Europe/Berlin
1582	2	R	\N	f	14	528	session_ahVK44yB	f	1992-08-30 00:00:00+00	Europe/Brussels
1583	1	QB	\N	f	1	528	session_8DXng4GD	f	1992-08-28 00:00:00+00	Europe/Brussels
1584	\N	QB	\N	f	1	528	session_xo5Isq41	f	1992-08-29 00:00:00+00	Europe/Brussels
1630	2	R	\N	f	14	544	session_4azX06xd	f	1993-08-29 00:00:00+00	Europe/Brussels
1631	1	QB	\N	f	1	544	session_PiywILbw	f	1993-08-27 00:00:00+00	Europe/Brussels
1632	\N	QB	\N	f	1	544	session_UYwUSXBs	f	1993-08-28 00:00:00+00	Europe/Brussels
1579	2	R	\N	f	14	527	session_bmQGKRay	f	1992-08-16 00:00:00+00	Europe/Budapest
1580	1	QB	\N	f	1	527	session_7bOfZcyQ	f	1992-08-14 00:00:00+00	Europe/Budapest
1581	\N	QB	\N	f	1	527	session_aFAnZlYJ	f	1992-08-15 00:00:00+00	Europe/Budapest
1627	2	R	\N	f	14	543	session_Ok17KC6W	f	1993-08-15 00:00:00+00	Europe/Budapest
1628	1	QB	\N	f	1	543	session_SpsRLIrw	f	1993-08-13 00:00:00+00	Europe/Budapest
1588	2	R	\N	f	14	530	session_i5Plcm0D	f	1992-09-27 00:00:00+00	Europe/Lisbon
1589	1	QB	\N	f	1	530	session_n1a6zY8r	f	1992-09-25 00:00:00+00	Europe/Lisbon
1590	\N	QB	\N	f	1	530	session_LzOR4zlw	f	1992-09-26 00:00:00+00	Europe/Lisbon
1636	2	R	\N	f	14	546	session_YNvPkEiS	f	1993-09-26 00:00:00+00	Europe/Lisbon
1637	1	QB	\N	f	1	546	session_y2McaQjV	f	1993-09-24 00:00:00+00	Europe/Lisbon
1638	\N	QB	\N	f	1	546	session_OPJiP6PD	f	1993-09-25 00:00:00+00	Europe/Lisbon
1603	2	R	\N	f	14	535	session_UgaAMXnM	f	1993-04-11 00:00:00+00	Europe/London
1604	1	QB	\N	f	1	535	session_PodU5XFU	f	1993-04-09 00:00:00+00	Europe/London
1605	\N	QB	\N	f	1	535	session_DlTDML3w	f	1993-04-10 00:00:00+00	Europe/London
1621	2	R	\N	f	14	541	session_EWLHeysT	f	1993-07-11 00:00:00+00	Europe/London
1622	1	QB	\N	f	1	541	session_TFkDY2dt	f	1993-07-09 00:00:00+00	Europe/London
1609	2	R	\N	f	14	537	session_erZQxIfD	f	1993-05-09 00:00:00+00	Europe/Madrid
1610	1	QB	\N	f	1	537	session_UpFflnhb	f	1993-05-07 00:00:00+00	Europe/Madrid
1611	\N	QB	\N	f	1	537	session_KzaoC1OE	f	1993-05-08 00:00:00+00	Europe/Madrid
1612	2	R	\N	f	14	538	session_GZIG1xo2	f	1993-05-23 00:00:00+00	Europe/Monaco
1613	1	QB	\N	f	1	538	session_xDD4T0CO	f	1993-05-20 00:00:00+00	Europe/Monaco
1614	\N	QB	\N	f	1	538	session_68EBaNSm	f	1993-05-22 00:00:00+00	Europe/Monaco
1618	2	R	\N	f	14	540	session_nmSvZwP1	f	1993-07-04 00:00:00+00	Europe/Paris
1619	1	QB	\N	f	1	540	session_kvdUvicd	f	1993-07-02 00:00:00+00	Europe/Paris
1620	\N	QB	\N	f	1	540	session_Pp4RGI3C	f	1993-07-03 00:00:00+00	Europe/Paris
1585	2	R	\N	f	14	529	session_aiSTWaDM	f	1992-09-13 00:00:00+00	Europe/Rome
1586	1	QB	\N	f	1	529	session_wJ3dAwe6	f	1992-09-11 00:00:00+00	Europe/Rome
1587	\N	QB	\N	f	1	529	session_5Hoqu35o	f	1992-09-12 00:00:00+00	Europe/Rome
1606	2	R	\N	f	14	536	session_zeUpBfYC	f	1993-04-25 00:00:00+00	Europe/Rome
1607	1	QB	\N	f	1	536	session_mAKkpkRj	f	1993-04-23 00:00:00+00	Europe/Rome
1615	2	R	\N	f	14	539	session_nXbm8Wge	f	1993-06-13 00:00:00+00	America/Montreal
1616	1	QB	\N	f	1	539	session_lMEOWODp	f	1993-06-11 00:00:00+00	America/Montreal
1617	\N	QB	\N	f	1	539	session_kPx3w5ud	f	1993-06-12 00:00:00+00	America/Montreal
1639	2	R	\N	f	14	547	session_zHrN7kWT	f	1993-10-24 00:00:00+00	Asia/Tokyo
1640	1	QB	\N	f	1	547	session_ATrbifCo	f	1993-10-22 00:00:00+00	Asia/Tokyo
1641	\N	QB	\N	f	1	547	session_1jdukA39	f	1993-10-23 00:00:00+00	Asia/Tokyo
1693	2	R	\N	f	14	565	session_HcFD1n5r	f	1995-03-26 00:00:00+00	America/Sao_Paulo
1694	1	QB	\N	f	1	565	session_4E2LDbvb	f	1995-03-24 00:00:00+00	America/Sao_Paulo
1695	\N	QB	\N	f	1	565	session_XvxCtbB0	f	1995-03-25 00:00:00+00	America/Sao_Paulo
1687	2	R	\N	f	14	563	session_wSY1Ufy7	f	1994-11-06 00:00:00+00	Asia/Tokyo
1688	1	QB	\N	f	1	563	session_L9I2zw3d	f	1994-11-04 00:00:00+00	Asia/Tokyo
1689	\N	QB	\N	f	1	563	session_R6icztEp	f	1994-11-05 00:00:00+00	Asia/Tokyo
1690	2	R	\N	f	14	564	session_fH4J0EtY	f	1994-11-13 00:00:00+00	Australia/Adelaide
1691	1	QB	\N	f	1	564	session_k0kLhT6W	f	1994-11-11 00:00:00+00	Australia/Adelaide
1692	\N	QB	\N	f	1	564	session_ycSbK0z9	f	1994-11-12 00:00:00+00	Australia/Adelaide
1669	2	R	\N	f	14	557	session_2wKeVh1b	f	1994-07-31 00:00:00+00	Europe/Berlin
1670	1	QB	\N	f	1	557	session_Em4c4tIV	f	1994-07-29 00:00:00+00	Europe/Berlin
1671	\N	QB	\N	f	1	557	session_AdTRgCxE	f	1994-07-30 00:00:00+00	Europe/Berlin
1675	2	R	\N	f	14	559	session_KWlfbzEO	f	1994-08-28 00:00:00+00	Europe/Brussels
1676	1	QB	\N	f	1	559	session_FCWa2vSP	f	1994-08-26 00:00:00+00	Europe/Brussels
1677	\N	QB	\N	f	1	559	session_i06qZLcF	f	1994-08-27 00:00:00+00	Europe/Brussels
1723	2	R	\N	f	14	575	session_W5jgth79	f	1995-08-27 00:00:00+00	Europe/Brussels
1672	2	R	\N	f	14	558	session_NoEw3BXJ	f	1994-08-14 00:00:00+00	Europe/Budapest
1673	1	QB	\N	f	1	558	session_byf5HBL6	f	1994-08-12 00:00:00+00	Europe/Budapest
1674	\N	QB	\N	f	1	558	session_xiMnZ0CE	f	1994-08-13 00:00:00+00	Europe/Budapest
1720	2	R	\N	f	14	574	session_qgg1C65M	f	1995-08-13 00:00:00+00	Europe/Budapest
1721	1	QB	\N	f	1	574	session_bLbzWQTA	f	1995-08-11 00:00:00+00	Europe/Budapest
1681	2	R	\N	f	14	561	session_oVv0BJAX	f	1994-09-25 00:00:00+00	Europe/Lisbon
1682	1	QB	\N	f	1	561	session_1MSRQSod	f	1994-09-23 00:00:00+00	Europe/Lisbon
1683	\N	QB	\N	f	1	561	session_ZptZl8RB	f	1994-09-24 00:00:00+00	Europe/Lisbon
1666	2	R	\N	f	14	556	session_qqrsTgzg	f	1994-07-10 00:00:00+00	Europe/London
1667	1	QB	\N	f	1	556	session_eEbxS5gY	f	1994-07-08 00:00:00+00	Europe/London
1668	\N	QB	\N	f	1	556	session_rSX92kMc	f	1994-07-09 00:00:00+00	Europe/London
1714	2	R	\N	f	14	572	session_2ruFSvdb	f	1995-07-16 00:00:00+00	Europe/London
1715	1	QB	\N	f	1	572	session_xaHOk5pc	f	1995-07-14 00:00:00+00	Europe/London
1657	2	R	\N	f	14	553	session_Rlx6n5lh	f	1994-05-29 00:00:00+00	Europe/Madrid
1658	1	QB	\N	f	1	553	session_YDFxJz1G	f	1994-05-27 00:00:00+00	Europe/Madrid
1659	\N	QB	\N	f	1	553	session_8EuYthlK	f	1994-05-28 00:00:00+00	Europe/Madrid
1684	2	R	\N	f	14	562	session_2xZd9wdT	f	1994-10-16 00:00:00+00	Europe/Madrid
1685	1	QB	\N	f	1	562	session_NGz2KL38	f	1994-10-14 00:00:00+00	Europe/Madrid
1654	2	R	\N	f	14	552	session_yp9dimV5	f	1994-05-15 00:00:00+00	Europe/Monaco
1655	1	QB	\N	f	1	552	session_sBH1Lbru	f	1994-05-12 00:00:00+00	Europe/Monaco
1656	\N	QB	\N	f	1	552	session_5f9HN7NU	f	1994-05-14 00:00:00+00	Europe/Monaco
1705	2	R	\N	f	14	569	session_EoiLM0Go	f	1995-05-28 00:00:00+00	Europe/Monaco
1706	1	QB	\N	f	1	569	session_pborhlkx	f	1995-05-25 00:00:00+00	Europe/Monaco
1707	\N	QB	\N	f	1	569	session_ebvdugFp	f	1995-05-27 00:00:00+00	Europe/Monaco
1663	2	R	\N	f	14	555	session_gL1wkCt0	f	1994-07-03 00:00:00+00	Europe/Paris
1664	1	QB	\N	f	1	555	session_JbqdKbg4	f	1994-07-01 00:00:00+00	Europe/Paris
1665	\N	QB	\N	f	1	555	session_AVU5dBoM	f	1994-07-02 00:00:00+00	Europe/Paris
1711	2	R	\N	f	14	571	session_bmsViKaY	f	1995-07-02 00:00:00+00	Europe/Paris
1712	1	QB	\N	f	1	571	session_lFMNbJ41	f	1995-06-30 00:00:00+00	Europe/Paris
1713	\N	QB	\N	f	1	571	session_sgaEW6BZ	f	1995-07-01 00:00:00+00	Europe/Paris
1651	2	R	\N	f	14	551	session_rr9wFKdO	f	1994-05-01 00:00:00+00	Europe/Rome
1652	1	QB	\N	f	1	551	session_UO5ORSYI	f	1994-04-29 00:00:00+00	Europe/Rome
1653	\N	QB	\N	f	1	551	session_XBWUu9FF	f	1994-04-30 00:00:00+00	Europe/Rome
1678	2	R	\N	f	14	560	session_5BYGJkll	f	1994-09-11 00:00:00+00	Europe/Rome
1679	1	QB	\N	f	1	560	session_2KvLL6EO	f	1994-09-09 00:00:00+00	Europe/Rome
1680	\N	QB	\N	f	1	560	session_v6Sh3w0l	f	1994-09-10 00:00:00+00	Europe/Rome
1660	2	R	\N	f	14	554	session_Rn1Bb2DE	f	1994-06-12 00:00:00+00	America/Montreal
1661	1	QB	\N	f	1	554	session_f30wms7o	f	1994-06-10 00:00:00+00	America/Montreal
1662	\N	QB	\N	f	1	554	session_Yno5Ofap	f	1994-06-11 00:00:00+00	America/Montreal
1717	2	R	\N	f	14	573	session_Dv12Eh7s	f	1995-07-30 00:00:00+00	Europe/Berlin
1724	1	QB	\N	f	1	575	session_E2Xlss3N	f	1995-08-25 00:00:00+00	Europe/Brussels
1686	\N	QB	\N	f	1	562	session_SoNN6AZx	f	1994-10-15 00:00:00+00	Europe/Madrid
1699	2	R	\N	f	14	567	session_YKx9UV25	f	1995-04-30 00:00:00+00	Europe/Rome
1746	2	R	\N	f	14	583	session_gShiwTPb	f	1996-03-31 00:00:00+00	America/Sao_Paulo
1747	1	QB	\N	f	1	583	session_lWn5CELP	f	1996-03-30 00:00:00+00	America/Sao_Paulo
1778	2	R	\N	f	14	599	session_dUf7d8UI	f	1997-03-30 00:00:00+00	America/Sao_Paulo
1735	2	R	\N	f	14	579	session_IteCVZ8O	f	1995-10-22 00:00:00+00	Asia/Tokyo
1736	1	QB	\N	f	1	579	session_i0PdLQOB	f	1995-10-20 00:00:00+00	Asia/Tokyo
1737	\N	QB	\N	f	1	579	session_DXu8ofuq	f	1995-10-21 00:00:00+00	Asia/Tokyo
1741	2	R	\N	f	14	581	session_zUWBqZDM	f	1995-11-12 00:00:00+00	Australia/Adelaide
1742	1	QB	\N	f	1	581	session_76hDsIcm	f	1995-11-10 00:00:00+00	Australia/Adelaide
1743	\N	QB	\N	f	1	581	session_1ZvuhDJ7	f	1995-11-11 00:00:00+00	Australia/Adelaide
1744	2	R	\N	f	14	582	session_llb72bOh	f	1996-03-10 00:00:00+00	Australia/Melbourne
1745	1	QB	\N	f	1	582	session_UgUWuo3h	f	1996-03-09 00:00:00+00	Australia/Melbourne
1776	2	R	\N	f	14	598	session_9M4U5Vg4	f	1997-03-09 00:00:00+00	Australia/Melbourne
1777	1	QB	\N	f	1	598	session_6rlgbAdv	f	1997-03-08 00:00:00+00	Australia/Melbourne
1732	2	R	\N	f	14	578	session_wx9D1SPt	f	1995-10-01 00:00:00+00	Europe/Berlin
1733	1	QB	\N	f	1	578	session_4dxfu6iu	f	1995-09-29 00:00:00+00	Europe/Berlin
1734	\N	QB	\N	f	1	578	session_5jUbeq2w	f	1995-09-30 00:00:00+00	Europe/Berlin
1750	2	R	\N	f	14	585	session_ryVWNJVU	f	1996-04-28 00:00:00+00	Europe/Berlin
1768	2	R	\N	f	14	594	session_PYzXwVfJ	f	1996-08-25 00:00:00+00	Europe/Brussels
1769	1	QB	\N	f	1	594	session_u2xkBT5X	f	1996-08-24 00:00:00+00	Europe/Brussels
1798	2	R	\N	f	14	609	session_qkeTx8QL	f	1997-08-24 00:00:00+00	Europe/Brussels
1799	1	QB	\N	f	1	609	session_JWnP6V03	f	1997-08-23 00:00:00+00	Europe/Brussels
1766	2	R	\N	f	14	593	session_e7osfi5e	f	1996-08-11 00:00:00+00	Europe/Budapest
1767	1	QB	\N	f	1	593	session_AosDrNPS	f	1996-08-10 00:00:00+00	Europe/Budapest
1796	2	R	\N	f	14	608	session_G0uXIGFo	f	1997-08-10 00:00:00+00	Europe/Budapest
1797	1	QB	\N	f	1	608	session_1ce9kd4A	f	1997-08-09 00:00:00+00	Europe/Budapest
1729	2	R	\N	f	14	577	session_0MtK5nse	f	1995-09-24 00:00:00+00	Europe/Lisbon
1730	1	QB	\N	f	1	577	session_WFIIqj2T	f	1995-09-22 00:00:00+00	Europe/Lisbon
1731	\N	QB	\N	f	1	577	session_4wfWXb9X	f	1995-09-23 00:00:00+00	Europe/Lisbon
1772	2	R	\N	f	14	596	session_mSihiMuI	f	1996-09-22 00:00:00+00	Europe/Lisbon
1773	1	QB	\N	f	1	596	session_kRt4oudh	f	1996-09-21 00:00:00+00	Europe/Lisbon
1762	2	R	\N	f	14	591	session_HaljznbW	f	1996-07-14 00:00:00+00	Europe/London
1763	1	QB	\N	f	1	591	session_N1Xjze3L	f	1996-07-13 00:00:00+00	Europe/London
1792	2	R	\N	f	14	606	session_13OH1rT7	f	1997-07-13 00:00:00+00	Europe/London
1793	1	QB	\N	f	1	606	session_aawU4Y4L	f	1997-07-12 00:00:00+00	Europe/London
1756	2	R	\N	f	14	588	session_apjS89LI	f	1996-06-02 00:00:00+00	Europe/Madrid
1757	1	QB	\N	f	1	588	session_TgHCILR8	f	1996-06-01 00:00:00+00	Europe/Madrid
1786	2	R	\N	f	14	603	session_hqXiuMd8	f	1997-05-25 00:00:00+00	Europe/Madrid
1787	1	QB	\N	f	1	603	session_CD3mGnLH	f	1997-05-24 00:00:00+00	Europe/Madrid
1754	2	R	\N	f	14	587	session_1qBCzRsh	f	1996-05-19 00:00:00+00	Europe/Monaco
1755	1	QB	\N	f	1	587	session_ODJzWuPA	f	1996-05-18 00:00:00+00	Europe/Monaco
1784	2	R	\N	f	14	602	session_YfzcndD3	f	1997-05-11 00:00:00+00	Europe/Monaco
1785	1	QB	\N	f	1	602	session_OfJ2UXKM	f	1997-05-10 00:00:00+00	Europe/Monaco
1760	2	R	\N	f	14	590	session_NIYjgpFG	f	1996-06-30 00:00:00+00	Europe/Paris
1761	1	QB	\N	f	1	590	session_K1cmF6ZS	f	1996-06-29 00:00:00+00	Europe/Paris
1790	2	R	\N	f	14	605	session_cVxsCuOQ	f	1997-06-29 00:00:00+00	Europe/Paris
1791	1	QB	\N	f	1	605	session_pFUPGwmk	f	1997-06-28 00:00:00+00	Europe/Paris
1726	2	R	\N	f	14	576	session_2IYpYFON	f	1995-09-10 00:00:00+00	Europe/Rome
1727	1	QB	\N	f	1	576	session_Ojw1QbPH	f	1995-09-08 00:00:00+00	Europe/Rome
1728	\N	QB	\N	f	1	576	session_w8t9eXaF	f	1995-09-09 00:00:00+00	Europe/Rome
1752	2	R	\N	f	14	586	session_yQq8xst6	f	1996-05-05 00:00:00+00	Europe/Rome
1753	1	QB	\N	f	1	586	session_KmhrVZJv	f	1996-05-04 00:00:00+00	Europe/Rome
1758	2	R	\N	f	14	589	session_OIrzIZat	f	1996-06-16 00:00:00+00	America/Montreal
1759	1	QB	\N	f	1	589	session_pooLL7iL	f	1996-06-15 00:00:00+00	America/Montreal
1788	2	R	\N	f	14	604	session_NmEMO3UL	f	1997-06-15 00:00:00+00	America/Montreal
1779	1	QB	\N	f	1	599	session_pgXDWXkj	f	1997-03-29 00:00:00+00	America/Sao_Paulo
1751	1	QB	\N	f	1	585	session_8rHFtHb7	f	1996-04-27 00:00:00+00	Europe/Berlin
1764	2	R	\N	f	14	592	session_39ExFP0h	f	1996-07-28 00:00:00+00	Europe/Berlin
1812	2	R	\N	f	14	616	session_FMv8mOol	f	1998-03-29 00:00:00+00	America/Sao_Paulo
1813	1	QB	\N	f	1	616	session_AQgk0LeL	f	1998-03-28 00:00:00+00	America/Sao_Paulo
1870	2	R	\N	f	14	645	session_5qlWlBMA	f	1999-10-17 00:00:00+00	Asia/Kuala_Lumpur
1871	1	QB	\N	f	1	645	session_6jSyu05R	f	1999-10-16 00:00:00+00	Asia/Kuala_Lumpur
1806	2	R	\N	f	14	613	session_vmnbEAaT	f	1997-10-12 00:00:00+00	Asia/Tokyo
1807	1	QB	\N	f	1	613	session_clMPq8pK	f	1997-10-11 00:00:00+00	Asia/Tokyo
1840	2	R	\N	f	14	630	session_7dvJWjFg	f	1998-11-01 00:00:00+00	Asia/Tokyo
1810	2	R	\N	f	14	615	session_4S1tcxcL	f	1998-03-08 00:00:00+00	Australia/Melbourne
1811	1	QB	\N	f	1	615	session_AJCDfw5a	f	1998-03-07 00:00:00+00	Australia/Melbourne
1842	2	R	\N	f	14	631	session_xJp7r8cv	f	1999-03-07 00:00:00+00	Australia/Melbourne
1804	2	R	\N	f	14	612	session_2POgtsNf	f	1997-09-28 00:00:00+00	Europe/Berlin
1805	1	QB	\N	f	1	612	session_yYWhYxIv	f	1997-09-27 00:00:00+00	Europe/Berlin
1830	2	R	\N	f	14	625	session_J4c6zGic	f	1998-08-02 00:00:00+00	Europe/Berlin
1831	1	QB	\N	f	1	625	session_jhYAPzfm	f	1998-08-01 00:00:00+00	Europe/Berlin
1838	2	R	\N	f	14	629	session_v9v7WEc8	f	1998-09-27 00:00:00+00	Europe/Berlin
1834	2	R	\N	f	14	627	session_31beNZyJ	f	1998-08-30 00:00:00+00	Europe/Brussels
1835	1	QB	\N	f	1	627	session_GeQsAcvn	f	1998-08-29 00:00:00+00	Europe/Brussels
1864	2	R	\N	f	14	642	session_vhQje7Nu	f	1999-08-29 00:00:00+00	Europe/Brussels
1865	1	QB	\N	f	1	642	session_BywQxVcX	f	1999-08-28 00:00:00+00	Europe/Brussels
1832	2	R	\N	f	14	626	session_TZTeQcrB	f	1998-08-16 00:00:00+00	Europe/Budapest
1833	1	QB	\N	f	1	626	session_LytILKkv	f	1998-08-15 00:00:00+00	Europe/Budapest
1862	2	R	\N	f	14	641	session_kNGRZzh9	f	1999-08-15 00:00:00+00	Europe/Budapest
1863	1	QB	\N	f	1	641	session_LjsKdqSY	f	1999-08-14 00:00:00+00	Europe/Budapest
1826	2	R	\N	f	14	623	session_yUlh8cJo	f	1998-07-12 00:00:00+00	Europe/London
1827	1	QB	\N	f	1	623	session_eHu7oZwk	f	1998-07-11 00:00:00+00	Europe/London
1856	2	R	\N	f	14	638	session_4gXVFpIu	f	1999-07-11 00:00:00+00	Europe/London
1857	1	QB	\N	f	1	638	session_cCtNoH86	f	1999-07-10 00:00:00+00	Europe/London
1808	2	R	\N	f	14	614	session_tpj2dzN2	f	1997-10-26 00:00:00+00	Europe/Madrid
1809	1	QB	\N	f	1	614	session_afoTGbWA	f	1997-10-25 00:00:00+00	Europe/Madrid
1818	2	R	\N	f	14	619	session_bOlJX2lZ	f	1998-05-10 00:00:00+00	Europe/Madrid
1819	1	QB	\N	f	1	619	session_9SqJqLPE	f	1998-05-09 00:00:00+00	Europe/Madrid
1850	2	R	\N	f	14	635	session_hCcLWQkT	f	1999-05-30 00:00:00+00	Europe/Madrid
1851	1	QB	\N	f	1	635	session_pmDchLR7	f	1999-05-29 00:00:00+00	Europe/Madrid
1820	2	R	\N	f	14	620	session_kObB0xqM	f	1998-05-24 00:00:00+00	Europe/Monaco
1821	1	QB	\N	f	1	620	session_iyXtjXb5	f	1998-05-23 00:00:00+00	Europe/Monaco
1848	2	R	\N	f	14	634	session_ZSDClK97	f	1999-05-16 00:00:00+00	Europe/Monaco
1849	1	QB	\N	f	1	634	session_BP3zvyTY	f	1999-05-15 00:00:00+00	Europe/Monaco
1824	2	R	\N	f	14	622	session_QbyYdIiV	f	1998-06-28 00:00:00+00	Europe/Paris
1825	1	QB	\N	f	1	622	session_OOI9LopN	f	1998-06-27 00:00:00+00	Europe/Paris
1854	2	R	\N	f	14	637	session_ApEJFzF7	f	1999-06-27 00:00:00+00	Europe/Paris
1855	1	QB	\N	f	1	637	session_z78qjJxi	f	1999-06-26 00:00:00+00	Europe/Paris
1801	1	QB	\N	f	1	610	session_J8LUt81C	f	1997-09-06 00:00:00+00	Europe/Rome
1816	2	R	\N	f	14	618	session_hblDE4GP	f	1998-04-26 00:00:00+00	Europe/Rome
1817	1	QB	\N	f	1	618	session_iGqEKxOV	f	1998-04-25 00:00:00+00	Europe/Rome
1836	2	R	\N	f	14	628	session_RuKkS5ld	f	1998-09-13 00:00:00+00	Europe/Rome
1837	1	QB	\N	f	1	628	session_9j2nqP9R	f	1998-09-12 00:00:00+00	Europe/Rome
1846	2	R	\N	f	14	633	session_h2cvQTZ8	f	1999-05-02 00:00:00+00	Europe/Rome
1802	2	R	\N	f	14	611	session_nsFP3abU	f	1997-09-21 00:00:00+00	Europe/Vienna
1803	1	QB	\N	f	1	611	session_JqMe6IC3	f	1997-09-20 00:00:00+00	Europe/Vienna
1828	2	R	\N	f	14	624	session_wYxFaMXQ	f	1998-07-26 00:00:00+00	Europe/Vienna
1829	1	QB	\N	f	1	624	session_cxMG7PVn	f	1998-07-25 00:00:00+00	Europe/Vienna
1858	2	R	\N	f	14	639	session_MJqng93f	f	1999-07-25 00:00:00+00	Europe/Vienna
1859	1	QB	\N	f	1	639	session_e9QsM6i4	f	1999-07-24 00:00:00+00	Europe/Vienna
1822	2	R	\N	f	14	621	session_AqiRUTKg	f	1998-06-07 00:00:00+00	America/Montreal
1823	1	QB	\N	f	1	621	session_FrpGR61b	f	1998-06-06 00:00:00+00	America/Montreal
1844	2	R	\N	f	14	632	session_uoHhqMxz	f	1999-04-11 00:00:00+00	America/Sao_Paulo
1843	1	QB	\N	f	1	631	session_9yLXHf1f	f	1999-03-06 00:00:00+00	Australia/Melbourne
1874	2	R	\N	f	14	647	session_As4VZprz	f	2000-03-12 00:00:00+00	Australia/Melbourne
1839	1	QB	\N	f	1	629	session_iPEBUPhq	f	1998-09-26 00:00:00+00	Europe/Berlin
1876	2	R	\N	f	14	648	session_Twcz0GqP	f	2000-03-26 00:00:00+00	America/Sao_Paulo
1877	1	QB	\N	f	1	648	session_nNXceLUj	f	2000-03-25 00:00:00+00	America/Sao_Paulo
1912	2	R	\N	f	14	666	session_DCtlwOd5	f	2001-04-01 00:00:00+00	America/Sao_Paulo
1906	2	R	\N	f	14	663	session_JBfSPB2w	f	2000-10-22 00:00:00+00	Asia/Kuala_Lumpur
1907	1	QB	\N	f	1	663	session_M0lEE994	f	2000-10-21 00:00:00+00	Asia/Kuala_Lumpur
1910	2	R	\N	f	14	665	session_pLB7j6FJ	f	2001-03-18 00:00:00+00	Asia/Kuala_Lumpur
1911	1	QB	\N	f	1	665	session_enXlO61G	f	2001-03-17 00:00:00+00	Asia/Kuala_Lumpur
1904	2	R	\N	f	14	662	session_jWbD8Xug	f	2000-10-08 00:00:00+00	Asia/Tokyo
1905	1	QB	\N	f	1	662	session_7ODLl9zH	f	2000-10-07 00:00:00+00	Asia/Tokyo
1940	2	R	\N	f	14	680	session_G7PMCFf8	f	2001-10-14 00:00:00+00	Asia/Tokyo
1941	1	QB	\N	f	1	680	session_MUPERFXi	f	2001-10-13 00:00:00+00	Asia/Tokyo
1908	2	R	\N	f	14	664	session_eWigyqnR	f	2001-03-04 00:00:00+00	Australia/Melbourne
1909	1	QB	\N	f	1	664	session_Ld1Rqn5k	f	2001-03-03 00:00:00+00	Australia/Melbourne
1942	2	R	\N	f	14	681	session_fY8leThy	f	2002-03-03 00:00:00+00	Australia/Melbourne
1943	1	QB	\N	f	1	681	session_SNU4MusV	f	2002-03-02 00:00:00+00	Australia/Melbourne
1884	2	R	\N	f	14	652	session_GZavEiom	f	2000-05-21 00:00:00+00	Europe/Berlin
1885	1	QB	\N	f	1	652	session_NrYAef8R	f	2000-05-20 00:00:00+00	Europe/Berlin
1894	2	R	\N	f	14	657	session_Vy3x9C3D	f	2000-07-30 00:00:00+00	Europe/Berlin
1895	1	QB	\N	f	1	657	session_YclxJH0h	f	2000-07-29 00:00:00+00	Europe/Berlin
1898	2	R	\N	f	14	659	session_HIOwh9JB	f	2000-08-27 00:00:00+00	Europe/Brussels
1899	1	QB	\N	f	1	659	session_6FpbQgqO	f	2000-08-26 00:00:00+00	Europe/Brussels
1934	2	R	\N	f	14	677	session_zTAApkak	f	2001-09-02 00:00:00+00	Europe/Brussels
1935	1	QB	\N	f	1	677	session_zfrDuzSQ	f	2001-09-01 00:00:00+00	Europe/Brussels
1896	2	R	\N	f	14	658	session_JWtVZgKn	f	2000-08-13 00:00:00+00	Europe/Budapest
1897	1	QB	\N	f	1	658	session_klUbbYq9	f	2000-08-12 00:00:00+00	Europe/Budapest
1932	2	R	\N	f	14	676	session_vg3sep2i	f	2001-08-19 00:00:00+00	Europe/Budapest
1933	1	QB	\N	f	1	676	session_PDeYuEmN	f	2001-08-18 00:00:00+00	Europe/Budapest
1880	2	R	\N	f	14	650	session_DlkYHM5R	f	2000-04-23 00:00:00+00	Europe/London
1881	1	QB	\N	f	1	650	session_9b8BTt4S	f	2000-04-22 00:00:00+00	Europe/London
1928	2	R	\N	f	14	674	session_o18XjPFR	f	2001-07-15 00:00:00+00	Europe/London
1929	1	QB	\N	f	1	674	session_WdUCRRxB	f	2001-07-14 00:00:00+00	Europe/London
1882	2	R	\N	f	14	651	session_Yp55dKkx	f	2000-05-07 00:00:00+00	Europe/Madrid
1883	1	QB	\N	f	1	651	session_k398mPjW	f	2000-05-06 00:00:00+00	Europe/Madrid
1916	2	R	\N	f	14	668	session_DyOBlmzw	f	2001-04-29 00:00:00+00	Europe/Madrid
1917	1	QB	\N	f	1	668	session_NyaazsDV	f	2001-04-28 00:00:00+00	Europe/Madrid
1950	2	R	\N	f	14	685	session_9ADnEfJ6	f	2002-04-28 00:00:00+00	Europe/Madrid
1886	2	R	\N	f	14	653	session_DHU8XE1E	f	2000-06-04 00:00:00+00	Europe/Monaco
1887	1	QB	\N	f	1	653	session_he5b7GOS	f	2000-06-03 00:00:00+00	Europe/Monaco
1920	2	R	\N	f	14	670	session_jLRcsgOZ	f	2001-05-27 00:00:00+00	Europe/Monaco
1921	1	QB	\N	f	1	670	session_DUSLu7rG	f	2001-05-26 00:00:00+00	Europe/Monaco
1890	2	R	\N	f	14	655	session_IepQcgiZ	f	2000-07-02 00:00:00+00	Europe/Paris
1891	1	QB	\N	f	1	655	session_5jyYuGLp	f	2000-07-01 00:00:00+00	Europe/Paris
1926	2	R	\N	f	14	673	session_nQX5r3Zi	f	2001-07-01 00:00:00+00	Europe/Paris
1927	1	QB	\N	f	1	673	session_O1LOrqil	f	2001-06-30 00:00:00+00	Europe/Paris
1878	2	R	\N	f	14	649	session_fvMEHnl4	f	2000-04-09 00:00:00+00	Europe/Rome
1879	1	QB	\N	f	1	649	session_DNndcaou	f	2000-04-08 00:00:00+00	Europe/Rome
1900	2	R	\N	f	14	660	session_YtfiYta5	f	2000-09-10 00:00:00+00	Europe/Rome
1901	1	QB	\N	f	1	660	session_hfiP6Zpd	f	2000-09-09 00:00:00+00	Europe/Rome
1914	2	R	\N	f	14	667	session_T7en0niz	f	2001-04-15 00:00:00+00	Europe/Rome
1892	2	R	\N	f	14	656	session_C5rlRxML	f	2000-07-16 00:00:00+00	Europe/Vienna
1893	1	QB	\N	f	1	656	session_VfNtBMWu	f	2000-07-15 00:00:00+00	Europe/Vienna
1918	2	R	\N	f	14	669	session_jSzuuPUl	f	2001-05-13 00:00:00+00	Europe/Vienna
1919	1	QB	\N	f	1	669	session_sk8i33t8	f	2001-05-12 00:00:00+00	Europe/Vienna
1888	2	R	\N	f	14	654	session_B2GtkOTi	f	2000-06-18 00:00:00+00	America/Montreal
1889	1	QB	\N	f	1	654	session_XDJ1H0G7	f	2000-06-17 00:00:00+00	America/Montreal
1922	2	R	\N	f	14	671	session_2PRFP4wH	f	2001-06-10 00:00:00+00	America/Montreal
1913	1	QB	\N	f	1	666	session_Z1d95gkN	f	2001-03-31 00:00:00+00	America/Sao_Paulo
1944	2	R	\N	f	14	682	session_rdDyvgQR	f	2002-03-17 00:00:00+00	Asia/Kuala_Lumpur
1982	3	R	\N	f	15	700	session_yW81YaSj	f	2003-04-06 00:00:00+00	America/Sao_Paulo
1983	1	QO	\N	f	1	700	session_1qeFBoRM	f	2003-04-04 00:00:00+00	America/Sao_Paulo
1984	2	QB	\N	f	1	700	session_FKBIhbpq	f	2003-04-05 00:00:00+00	America/Sao_Paulo
1979	3	R	\N	f	15	699	session_nQKHw8Ub	f	2003-03-23 00:00:00+00	Asia/Kuala_Lumpur
1980	1	QO	\N	f	1	699	session_AKVhIj18	f	2003-03-21 00:00:00+00	Asia/Kuala_Lumpur
1981	2	QB	\N	f	1	699	session_En4J0Rth	f	2003-03-22 00:00:00+00	Asia/Kuala_Lumpur
1974	2	R	\N	f	14	697	session_TpTEJ3wt	f	2002-10-13 00:00:00+00	Asia/Tokyo
1975	1	QB	\N	f	1	697	session_MMAc0U5Z	f	2002-10-12 00:00:00+00	Asia/Tokyo
2021	3	R	\N	f	15	713	session_SjSc4bI5	f	2003-10-12 00:00:00+00	Asia/Tokyo
2022	1	QO	\N	f	1	713	session_M4CH3MFF	f	2003-10-10 00:00:00+00	Asia/Tokyo
1976	3	R	\N	f	15	698	session_f10xoiZC	f	2003-03-09 00:00:00+00	Australia/Melbourne
1977	1	QO	\N	f	1	698	session_ucLZSQnv	f	2003-03-07 00:00:00+00	Australia/Melbourne
1978	2	QB	\N	f	1	698	session_uuGw9Bqs	f	2003-03-08 00:00:00+00	Australia/Melbourne
2024	3	R	\N	f	15	714	session_A0bB2u3i	f	2004-03-07 00:00:00+00	Australia/Melbourne
1958	2	R	\N	f	14	689	session_U0b7Rqhv	f	2002-06-23 00:00:00+00	Europe/Berlin
1959	1	QB	\N	f	1	689	session_pLVA7zf6	f	2002-06-22 00:00:00+00	Europe/Berlin
1964	2	R	\N	f	14	692	session_Mrf3HoZU	f	2002-07-28 00:00:00+00	Europe/Berlin
1965	1	QB	\N	f	1	692	session_JQt4qlci	f	2002-07-27 00:00:00+00	Europe/Berlin
1968	2	R	\N	f	14	694	session_RcbNhfY2	f	2002-09-01 00:00:00+00	Europe/Brussels
1969	1	QB	\N	f	1	694	session_wnxdQxUp	f	2002-08-31 00:00:00+00	Europe/Brussels
1966	2	R	\N	f	14	693	session_eNUXS8PA	f	2002-08-18 00:00:00+00	Europe/Budapest
1967	1	QB	\N	f	1	693	session_JGwLH94V	f	2002-08-17 00:00:00+00	Europe/Budapest
2012	3	R	\N	f	15	710	session_iFuTkkrA	f	2003-08-24 00:00:00+00	Europe/Budapest
2013	1	QO	\N	f	1	710	session_EojorlU8	f	2003-08-22 00:00:00+00	Europe/Budapest
1960	2	R	\N	f	14	690	session_8LcvRgVA	f	2002-07-07 00:00:00+00	Europe/London
1961	1	QB	\N	f	1	690	session_O3IPHLr4	f	2002-07-06 00:00:00+00	Europe/London
2006	3	R	\N	f	15	708	session_QUupedLB	f	2003-07-20 00:00:00+00	Europe/London
2007	1	QO	\N	f	1	708	session_B9GF8ohV	f	2003-07-18 00:00:00+00	Europe/London
2008	2	QB	\N	f	1	708	session_XNMhlSgL	f	2003-07-19 00:00:00+00	Europe/London
1951	1	QB	\N	f	1	685	session_3vhD9EuD	f	2002-04-27 00:00:00+00	Europe/Madrid
1988	3	R	\N	f	15	702	session_o6dpETv0	f	2003-05-04 00:00:00+00	Europe/Madrid
1989	1	QO	\N	f	1	702	session_Nd5KhohG	f	2003-05-02 00:00:00+00	Europe/Madrid
1990	2	QB	\N	f	1	702	session_vr4DU7Vd	f	2003-05-03 00:00:00+00	Europe/Madrid
1954	2	R	\N	f	14	687	session_LWiw4QMB	f	2002-05-26 00:00:00+00	Europe/Monaco
1955	1	QB	\N	f	1	687	session_ecu9EBk0	f	2002-05-25 00:00:00+00	Europe/Monaco
1994	3	R	\N	f	15	704	session_rVWucEOS	f	2003-06-01 00:00:00+00	Europe/Monaco
1995	1	QO	\N	f	1	704	session_mtJDpw45	f	2003-05-29 00:00:00+00	Europe/Monaco
1996	2	QB	\N	f	1	704	session_QPT8Bub5	f	2003-05-31 00:00:00+00	Europe/Monaco
1962	2	R	\N	f	14	691	session_NunKHJVN	f	2002-07-21 00:00:00+00	Europe/Paris
1963	1	QB	\N	f	1	691	session_IGK54ZtO	f	2002-07-20 00:00:00+00	Europe/Paris
2003	3	R	\N	f	15	707	session_eiSjCIYP	f	2003-07-06 00:00:00+00	Europe/Paris
2004	1	QO	\N	f	1	707	session_pbvqkXxF	f	2003-07-04 00:00:00+00	Europe/Paris
2005	2	QB	\N	f	1	707	session_mTgRUc3g	f	2003-07-05 00:00:00+00	Europe/Paris
1970	2	R	\N	f	14	695	session_6JNddb7L	f	2002-09-15 00:00:00+00	Europe/Rome
1971	1	QB	\N	f	1	695	session_NzCRAdK4	f	2002-09-14 00:00:00+00	Europe/Rome
1985	3	R	\N	f	15	701	session_scf1IZTd	f	2003-04-20 00:00:00+00	Europe/Rome
1986	1	QO	\N	f	1	701	session_a93XT8GE	f	2003-04-18 00:00:00+00	Europe/Rome
1987	2	QB	\N	f	1	701	session_95xbAY4V	f	2003-04-19 00:00:00+00	Europe/Rome
1952	2	R	\N	f	14	686	session_VaufhC6d	f	2002-05-12 00:00:00+00	Europe/Vienna
1953	1	QB	\N	f	1	686	session_9P2vILey	f	2002-05-11 00:00:00+00	Europe/Vienna
1991	3	R	\N	f	15	703	session_tDqKcxvC	f	2003-05-18 00:00:00+00	Europe/Vienna
1992	1	QO	\N	f	1	703	session_yHIFOFJ4	f	2003-05-16 00:00:00+00	Europe/Vienna
1993	2	QB	\N	f	1	703	session_MPKaN5or	f	2003-05-17 00:00:00+00	Europe/Vienna
1956	2	R	\N	f	14	688	session_5VVxqJPw	f	2002-06-09 00:00:00+00	America/Montreal
1957	1	QB	\N	f	1	688	session_L3ufigYm	f	2002-06-08 00:00:00+00	America/Montreal
1997	3	R	\N	f	15	705	session_cAm15bj9	f	2003-06-15 00:00:00+00	America/Montreal
1998	1	QO	\N	f	1	705	session_5P37IMtb	f	2003-06-13 00:00:00+00	America/Montreal
2014	2	QB	\N	f	1	710	session_ZghxHVFT	f	2003-08-23 00:00:00+00	Europe/Budapest
2015	3	R	\N	f	15	711	session_4YfsBsEz	f	2003-09-14 00:00:00+00	Europe/Rome
2075	3	R	\N	f	15	731	session_0wbgat1j	f	2004-10-24 00:00:00+00	America/Sao_Paulo
2076	1	QO	\N	f	1	731	session_OmyEoY99	f	2004-10-23 00:00:00+00	America/Sao_Paulo
2077	2	QB	\N	f	1	731	session_BhuwjnJX	f	2004-10-23 00:00:00+00	America/Sao_Paulo
2030	3	R	\N	f	15	716	session_tBmEaUCC	f	2004-04-04 00:00:00+00	Asia/Bahrain
2031	1	QO	\N	f	1	716	session_HfcJvpiy	f	2004-04-03 00:00:00+00	Asia/Bahrain
2032	2	QB	\N	f	1	716	session_Y4PeXXs2	f	2004-04-03 00:00:00+00	Asia/Bahrain
2027	3	R	\N	f	15	715	session_xXYVKyf8	f	2004-03-21 00:00:00+00	Asia/Kuala_Lumpur
2028	1	QO	\N	f	1	715	session_h7CVyklM	f	2004-03-20 00:00:00+00	Asia/Kuala_Lumpur
2029	2	QB	\N	f	1	715	session_wxPrMlmi	f	2004-03-20 00:00:00+00	Asia/Kuala_Lumpur
2081	2	R	\N	f	15	733	session_yLKBv7Ng	t	2005-03-20 15:00:00+00	Asia/Kuala_Lumpur
2069	3	R	\N	f	15	729	session_wAhhfOGU	f	2004-09-26 00:00:00+00	Asia/Shanghai
2070	1	QO	\N	f	1	729	session_wxPNEFvD	f	2004-09-25 00:00:00+00	Asia/Shanghai
2071	2	QB	\N	f	1	729	session_LljkGUHR	f	2004-09-25 00:00:00+00	Asia/Shanghai
2072	3	R	\N	f	15	730	session_HloZWbS3	f	2004-10-10 00:00:00+00	Asia/Tokyo
2073	1	QO	\N	f	1	730	session_Y70mG4xt	f	2004-10-09 00:00:00+00	Asia/Tokyo
2074	2	QB	\N	f	1	730	session_Fh9YsIVr	f	2004-10-09 00:00:00+00	Asia/Tokyo
2026	2	QB	\N	f	1	714	session_M1umFWeG	f	2004-03-06 00:00:00+00	Australia/Melbourne
2078	2	R	\N	f	15	732	session_MoldpPWx	t	2005-03-06 14:00:00+00	Australia/Melbourne
2079	1	QA	\N	f	1	732	session_PqQ9Q2tn	f	2005-03-05 00:00:00+00	Australia/Melbourne
2080	3	QA	\N	f	1	732	session_VQ2fMZZ0	f	2005-03-06 00:00:00+00	Australia/Melbourne
2042	3	R	\N	f	15	720	session_QpoFsC4d	f	2004-05-30 00:00:00+00	Europe/Berlin
2043	1	QO	\N	f	1	720	session_oWSHyukg	f	2004-05-29 00:00:00+00	Europe/Berlin
2044	2	QB	\N	f	1	720	session_oZsdkizM	f	2004-05-29 00:00:00+00	Europe/Berlin
2057	3	R	\N	f	15	725	session_4FaPA1Ge	f	2004-07-25 00:00:00+00	Europe/Berlin
2063	3	R	\N	f	15	727	session_iYEgKldp	f	2004-08-29 00:00:00+00	Europe/Brussels
2064	1	QO	\N	f	1	727	session_kEV4NluC	f	2004-08-28 00:00:00+00	Europe/Brussels
2065	2	QB	\N	f	1	727	session_xyYDNQ0u	f	2004-08-28 00:00:00+00	Europe/Brussels
2060	3	R	\N	f	15	726	session_qghb7Kxg	f	2004-08-15 00:00:00+00	Europe/Budapest
2061	1	QO	\N	f	1	726	session_F1j0CMMm	f	2004-08-14 00:00:00+00	Europe/Budapest
2062	2	QB	\N	f	1	726	session_hgQcZv01	f	2004-08-14 00:00:00+00	Europe/Budapest
2054	3	R	\N	f	15	724	session_68uPa2sj	f	2004-07-11 00:00:00+00	Europe/London
2055	1	QO	\N	f	1	724	session_sL7HSnsX	f	2004-07-10 00:00:00+00	Europe/London
2056	2	QB	\N	f	1	724	session_jtpR4lLe	f	2004-07-10 00:00:00+00	Europe/London
2036	3	R	\N	f	15	718	session_jIRVDiH2	f	2004-05-09 00:00:00+00	Europe/Madrid
2037	1	QO	\N	f	1	718	session_lJ0T0pBU	f	2004-05-08 00:00:00+00	Europe/Madrid
2038	2	QB	\N	f	1	718	session_tObpTTD5	f	2004-05-08 00:00:00+00	Europe/Madrid
2090	2	R	\N	f	15	736	session_i56sLAFT	t	2005-05-08 14:00:00+00	Europe/Madrid
2091	1	QA	\N	f	1	736	session_DIuYJ1J6	f	2005-05-07 00:00:00+00	Europe/Madrid
2039	3	R	\N	f	15	719	session_A5PiUOFj	f	2004-05-23 00:00:00+00	Europe/Monaco
2040	1	QO	\N	f	1	719	session_c3bFeykm	f	2004-05-22 00:00:00+00	Europe/Monaco
2041	2	QB	\N	f	1	719	session_rX5noDaq	f	2004-05-22 00:00:00+00	Europe/Monaco
2093	2	R	\N	f	15	737	session_FfiVRL6r	t	2005-05-22 14:00:00+00	Europe/Monaco
2094	1	QA	\N	f	1	737	session_UDIOd3cJ	f	2005-05-21 00:00:00+00	Europe/Monaco
2095	3	QA	\N	f	1	737	session_SEaJD9vM	f	2005-05-22 00:00:00+00	Europe/Monaco
2051	3	R	\N	f	15	723	session_k7wa5nJL	f	2004-07-04 00:00:00+00	Europe/Paris
2052	1	QO	\N	f	1	723	session_leml563c	f	2004-07-03 00:00:00+00	Europe/Paris
2053	2	QB	\N	f	1	723	session_hr7V82nc	f	2004-07-03 00:00:00+00	Europe/Paris
2033	3	R	\N	f	15	717	session_vN7emHhp	f	2004-04-25 00:00:00+00	Europe/Rome
2034	1	QO	\N	f	1	717	session_tSJuPI7Y	f	2004-04-24 00:00:00+00	Europe/Rome
2035	2	QB	\N	f	1	717	session_jCVYtGH1	f	2004-04-24 00:00:00+00	Europe/Rome
2066	3	R	\N	f	15	728	session_GKUMMgem	f	2004-09-12 00:00:00+00	Europe/Rome
2067	1	QO	\N	f	1	728	session_qrjGY4cD	f	2004-09-11 00:00:00+00	Europe/Rome
2045	3	R	\N	f	15	721	session_ulcccaLQ	f	2004-06-13 00:00:00+00	America/Montreal
2046	1	QO	\N	f	1	721	session_33byIRXK	f	2004-06-12 00:00:00+00	America/Montreal
2047	2	QB	\N	f	1	721	session_5dhWZdqE	f	2004-06-12 00:00:00+00	America/Montreal
2084	2	R	\N	f	15	734	session_Ay0MTviJ	t	2005-04-03 14:30:00+00	Asia/Bahrain
2082	1	QA	\N	f	1	733	session_UfTuy6LB	f	2005-03-19 00:00:00+00	Asia/Kuala_Lumpur
2092	3	QA	\N	f	1	736	session_Q40eR6EE	f	2005-05-08 00:00:00+00	Europe/Madrid
2129	7	R	\N	f	15	752	session_CbWQ6v6N	t	2006-03-19 15:00:00+00	Asia/Kuala_Lumpur
2130	3	Q1	\N	f	1	752	session_B4BMU5lE	f	2006-03-18 00:00:00+00	Asia/Kuala_Lumpur
2131	4	Q2	\N	f	1	752	session_mNY8Wn4p	f	2006-03-18 00:00:00+00	Asia/Kuala_Lumpur
2120	2	R	\N	f	15	750	session_OanKLaoD	t	2005-10-16 14:00:00+00	Asia/Shanghai
2121	1	QB	\N	f	1	750	session_gXRT3Y78	f	2005-10-15 00:00:00+00	Asia/Shanghai
2118	2	R	\N	f	15	749	session_YKSVzaML	t	2005-10-09 14:00:00+00	Asia/Tokyo
2119	1	QB	\N	f	1	749	session_VZbP06Zm	f	2005-10-08 00:00:00+00	Asia/Tokyo
2136	7	R	\N	f	15	753	session_aY7MsNLE	t	2006-04-02 14:00:00+00	Australia/Melbourne
2137	3	Q1	\N	f	1	753	session_js5Cp2qq	f	2006-04-01 00:00:00+00	Australia/Melbourne
2138	4	Q2	\N	f	1	753	session_xA4h61Kh	f	2006-04-01 00:00:00+00	Australia/Melbourne
2139	5	Q3	\N	f	1	753	session_RJr6lPC7	f	2006-04-01 00:00:00+00	Australia/Melbourne
2140	1	FP1	\N	f	1	753	session_viTEa4fQ	f	2006-03-31 00:00:00+00	Australia/Melbourne
2141	2	FP2	\N	f	1	753	session_XjC28zdo	f	2006-03-31 00:00:00+00	Australia/Melbourne
2106	2	R	\N	f	15	743	session_QxiS4FpS	t	2005-07-24 14:00:00+00	Europe/Berlin
2107	1	QB	\N	f	1	743	session_Viy6f7cI	f	2005-07-23 00:00:00+00	Europe/Berlin
2150	7	R	\N	f	15	755	session_N7zTV7UM	t	2006-05-07 14:00:00+00	Europe/Berlin
2151	3	Q1	\N	f	1	755	session_HXzqHUVb	f	2006-05-06 00:00:00+00	Europe/Berlin
2152	4	Q2	\N	f	1	755	session_r7wD1uwr	f	2006-05-06 00:00:00+00	Europe/Berlin
2153	5	Q3	\N	f	1	755	session_RR0JccQp	f	2006-05-06 00:00:00+00	Europe/Berlin
2114	2	R	\N	f	15	747	session_EKzhBwxf	t	2005-09-11 14:00:00+00	Europe/Brussels
2115	1	QB	\N	f	1	747	session_DgFNzdOI	f	2005-09-10 00:00:00+00	Europe/Brussels
2108	2	R	\N	f	15	744	session_HI0bNL5b	t	2005-07-31 14:00:00+00	Europe/Budapest
2109	1	QB	\N	f	1	744	session_iBAKQlz5	f	2005-07-30 00:00:00+00	Europe/Budapest
2110	2	R	\N	f	15	745	session_GvecgpSU	t	2005-08-21 15:00:00+00	Europe/Istanbul
2111	1	QB	\N	f	1	745	session_1YYYK7mA	f	2005-08-20 00:00:00+00	Europe/Istanbul
2104	2	R	\N	f	15	742	session_cF1laKeX	t	2005-07-10 14:00:00+00	Europe/London
2105	1	QB	\N	f	1	742	session_O6Qmfnsv	f	2005-07-09 00:00:00+00	Europe/London
2171	7	R	\N	f	15	758	session_4zXjUWli	t	2006-06-11 12:00:00+00	Europe/London
2172	3	Q1	\N	f	1	758	session_nefPpWrV	f	2006-06-10 00:00:00+00	Europe/London
2173	4	Q2	\N	f	1	758	session_CiCm2nQu	f	2006-06-10 00:00:00+00	Europe/London
2157	7	R	\N	f	15	756	session_L99Qlhd2	t	2006-05-14 14:00:00+00	Europe/Madrid
2158	3	Q1	\N	f	1	756	session_NKlTmY9q	f	2006-05-13 00:00:00+00	Europe/Madrid
2159	4	Q2	\N	f	1	756	session_GZkplGj0	f	2006-05-13 00:00:00+00	Europe/Madrid
2160	5	Q3	\N	f	1	756	session_oFMbNvx6	f	2006-05-13 00:00:00+00	Europe/Madrid
2161	1	FP1	\N	f	1	756	session_XhKa2j5V	f	2006-05-12 00:00:00+00	Europe/Madrid
2162	2	FP2	\N	f	1	756	session_MK6MrQuM	f	2006-05-12 00:00:00+00	Europe/Madrid
2164	7	R	\N	f	15	757	session_sArdYxe9	t	2006-05-28 14:00:00+00	Europe/Monaco
2165	3	Q1	\N	f	1	757	session_ii0S6c8Y	f	2006-05-27 00:00:00+00	Europe/Monaco
2166	4	Q2	\N	f	1	757	session_omq4SfZx	f	2006-05-27 00:00:00+00	Europe/Monaco
2167	5	Q3	\N	f	1	757	session_eaTRsGVL	f	2006-05-27 00:00:00+00	Europe/Monaco
2168	1	FP1	\N	f	1	757	session_tkKtnODN	f	2006-05-25 00:00:00+00	Europe/Monaco
2169	2	FP2	\N	f	1	757	session_TdAJUcuv	f	2006-05-25 00:00:00+00	Europe/Monaco
2170	6	FP3	\N	f	1	757	session_IedYZvzS	f	2006-05-27 00:00:00+00	Europe/Monaco
2102	2	R	\N	f	15	741	session_MNJe6Oha	t	2005-07-03 14:00:00+00	Europe/Paris
2103	1	QB	\N	f	1	741	session_3EvHVZTX	f	2005-07-02 00:00:00+00	Europe/Paris
2112	2	R	\N	f	15	746	session_yZBBskbS	t	2005-09-04 14:00:00+00	Europe/Rome
2113	1	QB	\N	f	1	746	session_26QDATwh	f	2005-09-03 00:00:00+00	Europe/Rome
2143	7	R	\N	f	15	754	session_gihoFUYO	t	2006-04-23 14:00:00+00	Europe/Rome
2144	3	Q1	\N	f	1	754	session_qxxgSrQV	f	2006-04-22 00:00:00+00	Europe/Rome
2145	4	Q2	\N	f	1	754	session_FrXB5JcG	f	2006-04-22 00:00:00+00	Europe/Rome
2146	5	Q3	\N	f	1	754	session_8Jtq3Ver	f	2006-04-22 00:00:00+00	Europe/Rome
2116	2	R	\N	f	15	748	session_piv9a2ob	t	2005-09-25 14:00:00+00	America/Sao_Paulo
2122	7	R	\N	f	15	751	session_uiMAf6DB	t	2006-03-12 14:30:00+00	Asia/Bahrain
2123	3	Q1	\N	f	1	751	session_Uv7plpwB	f	2006-03-11 00:00:00+00	Asia/Bahrain
2132	5	Q3	\N	f	1	752	session_qJvISWLU	f	2006-03-18 00:00:00+00	Asia/Kuala_Lumpur
2133	1	FP1	\N	f	1	752	session_5vqzo1LD	f	2006-03-17 00:00:00+00	Asia/Kuala_Lumpur
2134	2	FP2	\N	f	1	752	session_VD4qzcl0	f	2006-03-17 00:00:00+00	Asia/Kuala_Lumpur
2163	6	FP3	\N	f	1	756	session_kbI2e9Y0	f	2006-05-13 00:00:00+00	Europe/Madrid
2241	7	R	\N	f	15	768	session_rL0ampea	t	2006-10-22 14:00:00+00	America/Sao_Paulo
2242	3	Q1	\N	f	1	768	session_BPp1AwEW	f	2006-10-21 00:00:00+00	America/Sao_Paulo
2243	4	Q2	\N	f	1	768	session_x8SOiBbv	f	2006-10-21 00:00:00+00	America/Sao_Paulo
2244	5	Q3	\N	f	1	768	session_c6KnVSse	f	2006-10-21 00:00:00+00	America/Sao_Paulo
2245	1	FP1	\N	f	1	768	session_TuZUNdsL	f	2006-10-20 00:00:00+00	America/Sao_Paulo
2246	2	FP2	\N	f	1	768	session_v2srCYYu	f	2006-10-20 00:00:00+00	America/Sao_Paulo
2227	7	R	\N	f	15	766	session_4ZidR33N	t	2006-10-01 14:00:00+00	Asia/Shanghai
2228	3	Q1	\N	f	1	766	session_S0bq5NLG	f	2006-09-30 00:00:00+00	Asia/Shanghai
2229	4	Q2	\N	f	1	766	session_cOh6EWUj	f	2006-09-30 00:00:00+00	Asia/Shanghai
2230	5	Q3	\N	f	1	766	session_ruRk1EjJ	f	2006-09-30 00:00:00+00	Asia/Shanghai
2231	1	FP1	\N	f	1	766	session_jVWF0fnx	f	2006-09-29 00:00:00+00	Asia/Shanghai
2232	2	FP2	\N	f	1	766	session_T8rsLWel	f	2006-09-29 00:00:00+00	Asia/Shanghai
2234	7	R	\N	f	15	767	session_5Hp7ITJD	t	2006-10-08 14:00:00+00	Asia/Tokyo
2235	3	Q1	\N	f	1	767	session_a4dNYLFp	f	2006-10-07 00:00:00+00	Asia/Tokyo
2236	4	Q2	\N	f	1	767	session_a0xL5Fz3	f	2006-10-07 00:00:00+00	Asia/Tokyo
2237	5	Q3	\N	f	1	767	session_vqrfIeNa	f	2006-10-07 00:00:00+00	Asia/Tokyo
2238	1	FP1	\N	f	1	767	session_rvwZA2R4	f	2006-10-06 00:00:00+00	Asia/Tokyo
2239	2	FP2	\N	f	1	767	session_2vkL5RzN	f	2006-10-06 00:00:00+00	Asia/Tokyo
2199	7	R	\N	f	15	762	session_MjMe5Fyd	t	2006-07-30 14:00:00+00	Europe/Berlin
2200	3	Q1	\N	f	1	762	session_hZLjUPJB	f	2006-07-29 00:00:00+00	Europe/Berlin
2201	4	Q2	\N	f	1	762	session_CoOSrU9o	f	2006-07-29 00:00:00+00	Europe/Berlin
2202	5	Q3	\N	f	1	762	session_nnU5gP96	f	2006-07-29 00:00:00+00	Europe/Berlin
2203	1	FP1	\N	f	1	762	session_kED32gFN	f	2006-07-28 00:00:00+00	Europe/Berlin
2204	2	FP2	\N	f	1	762	session_NhaeyFRJ	f	2006-07-28 00:00:00+00	Europe/Berlin
2206	7	R	\N	f	15	763	session_hz4dz3pG	t	2006-08-06 14:00:00+00	Europe/Budapest
2207	3	Q1	\N	f	1	763	session_oqshJoTI	f	2006-08-05 00:00:00+00	Europe/Budapest
2208	4	Q2	\N	f	1	763	session_RHfayxkT	f	2006-08-05 00:00:00+00	Europe/Budapest
2209	5	Q3	\N	f	1	763	session_lqgrYUwS	f	2006-08-05 00:00:00+00	Europe/Budapest
2210	1	FP1	\N	f	1	763	session_tjHvkotj	f	2006-08-04 00:00:00+00	Europe/Budapest
2211	2	FP2	\N	f	1	763	session_nQeixsfe	f	2006-08-04 00:00:00+00	Europe/Budapest
2212	6	FP3	\N	f	1	763	session_vcgP3MNj	f	2006-08-05 00:00:00+00	Europe/Budapest
2213	7	R	\N	f	15	764	session_8vVtd49j	t	2006-08-27 15:00:00+00	Europe/Istanbul
2214	3	Q1	\N	f	1	764	session_iNjs4JIu	f	2006-08-26 00:00:00+00	Europe/Istanbul
2215	4	Q2	\N	f	1	764	session_SeMGNrUP	f	2006-08-26 00:00:00+00	Europe/Istanbul
2216	5	Q3	\N	f	1	764	session_CpsQBrP2	f	2006-08-26 00:00:00+00	Europe/Istanbul
2217	1	FP1	\N	f	1	764	session_uRzcSy8H	f	2006-08-25 00:00:00+00	Europe/Istanbul
2218	2	FP2	\N	f	1	764	session_1JVTrQrJ	f	2006-08-25 00:00:00+00	Europe/Istanbul
2174	5	Q3	\N	f	1	758	session_OFvt5PhZ	f	2006-06-10 00:00:00+00	Europe/London
2175	1	FP1	\N	f	1	758	session_Npq7vAWw	f	2006-06-09 00:00:00+00	Europe/London
2176	2	FP2	\N	f	1	758	session_1ODizjwY	f	2006-06-09 00:00:00+00	Europe/London
2177	6	FP3	\N	f	1	758	session_gzGIUgTp	f	2006-06-10 00:00:00+00	Europe/London
2192	7	R	\N	f	15	761	session_MimVI9Hq	t	2006-07-16 14:00:00+00	Europe/Paris
2193	3	Q1	\N	f	1	761	session_pk2sjlBH	f	2006-07-15 00:00:00+00	Europe/Paris
2194	4	Q2	\N	f	1	761	session_0Cmx2jap	f	2006-07-15 00:00:00+00	Europe/Paris
2195	5	Q3	\N	f	1	761	session_WAzfbJgz	f	2006-07-15 00:00:00+00	Europe/Paris
2196	1	FP1	\N	f	1	761	session_L1LHaG6i	f	2006-07-14 00:00:00+00	Europe/Paris
2197	2	FP2	\N	f	1	761	session_AlNMzigL	f	2006-07-14 00:00:00+00	Europe/Paris
2220	7	R	\N	f	15	765	session_pvV3WXCZ	t	2006-09-10 14:00:00+00	Europe/Rome
2221	3	Q1	\N	f	1	765	session_5raQhIGe	f	2006-09-09 00:00:00+00	Europe/Rome
2222	4	Q2	\N	f	1	765	session_Z73heYyq	f	2006-09-09 00:00:00+00	Europe/Rome
2223	5	Q3	\N	f	1	765	session_Qn5q31lf	f	2006-09-09 00:00:00+00	Europe/Rome
2224	1	FP1	\N	f	1	765	session_6cJ90OAs	f	2006-09-08 00:00:00+00	Europe/Rome
2225	2	FP2	\N	f	1	765	session_z23PQTba	f	2006-09-08 00:00:00+00	Europe/Rome
2178	7	R	\N	f	15	759	session_fTeLqYLb	t	2006-06-25 13:00:00+00	America/Montreal
2179	3	Q1	\N	f	1	759	session_uNKChrma	f	2006-06-24 00:00:00+00	America/Montreal
2180	4	Q2	\N	f	1	759	session_SWHGkrlv	f	2006-06-24 00:00:00+00	America/Montreal
2181	5	Q3	\N	f	1	759	session_yCS5kbkQ	f	2006-06-24 00:00:00+00	America/Montreal
2182	1	FP1	\N	f	1	759	session_lvPlYwhZ	f	2006-06-23 00:00:00+00	America/Montreal
2183	2	FP2	\N	f	1	759	session_Eai3jnYi	f	2006-06-23 00:00:00+00	America/Montreal
2233	6	FP3	\N	f	1	766	session_iuPKElT8	f	2006-09-30 00:00:00+00	Asia/Shanghai
2262	7	R	\N	f	15	771	session_cTTrizeg	t	2007-04-15 11:30:00+00	Asia/Bahrain
2263	3	Q1	\N	f	1	771	session_haYD6a6d	f	2007-04-14 00:00:00+00	Asia/Bahrain
2264	4	Q2	\N	f	1	771	session_VJ5pI0QK	f	2007-04-14 00:00:00+00	Asia/Bahrain
2265	5	Q3	\N	f	1	771	session_BDHfHtep	f	2007-04-14 00:00:00+00	Asia/Bahrain
2266	1	FP1	\N	f	1	771	session_UKZN34MD	f	2007-04-13 00:00:00+00	Asia/Bahrain
2267	2	FP2	\N	f	1	771	session_rldDlu2Y	f	2007-04-13 00:00:00+00	Asia/Bahrain
2255	7	R	\N	f	15	770	session_DTJqB1c5	t	2007-04-08 07:00:00+00	Asia/Kuala_Lumpur
2256	3	Q1	\N	f	1	770	session_K6wLWXYe	f	2007-04-07 00:00:00+00	Asia/Kuala_Lumpur
2257	4	Q2	\N	f	1	770	session_dmOMxvMf	f	2007-04-07 00:00:00+00	Asia/Kuala_Lumpur
2258	5	Q3	\N	f	1	770	session_boYPwfq2	f	2007-04-07 00:00:00+00	Asia/Kuala_Lumpur
2259	1	FP1	\N	f	1	770	session_fPmnOfoP	f	2007-04-06 00:00:00+00	Asia/Kuala_Lumpur
2248	7	R	\N	f	15	769	session_7xUOuUv7	t	2007-03-18 03:00:00+00	Australia/Melbourne
2249	3	Q1	\N	f	1	769	session_jFL3hkKT	f	2007-03-17 00:00:00+00	Australia/Melbourne
2250	4	Q2	\N	f	1	769	session_D2UJJBK1	f	2007-03-17 00:00:00+00	Australia/Melbourne
2251	5	Q3	\N	f	1	769	session_ITXHhass	f	2007-03-17 00:00:00+00	Australia/Melbourne
2252	1	FP1	\N	f	1	769	session_MiMmgv1g	f	2007-03-16 00:00:00+00	Australia/Melbourne
2253	2	FP2	\N	f	1	769	session_UJ5UY44d	f	2007-03-16 00:00:00+00	Australia/Melbourne
2311	7	R	\N	f	15	778	session_lqzjD07r	t	2007-07-22 12:00:00+00	Europe/Berlin
2312	3	Q1	\N	f	1	778	session_ACUdOvMY	f	2007-07-21 00:00:00+00	Europe/Berlin
2313	4	Q2	\N	f	1	778	session_l4xJDoff	f	2007-07-21 00:00:00+00	Europe/Berlin
2314	5	Q3	\N	f	1	778	session_z6SStXRP	f	2007-07-21 00:00:00+00	Europe/Berlin
2315	1	FP1	\N	f	1	778	session_j5sXtRZU	f	2007-07-20 00:00:00+00	Europe/Berlin
2316	2	FP2	\N	f	1	778	session_RNOky4cb	f	2007-07-20 00:00:00+00	Europe/Berlin
2317	6	FP3	\N	f	1	778	session_ACrJfcJf	f	2007-07-21 00:00:00+00	Europe/Berlin
2318	7	R	\N	f	15	779	session_ER7l69Vj	t	2007-08-05 12:00:00+00	Europe/Budapest
2319	3	Q1	\N	f	1	779	session_DgoLxYJa	f	2007-08-04 00:00:00+00	Europe/Budapest
2320	4	Q2	\N	f	1	779	session_WhnZEp6P	f	2007-08-04 00:00:00+00	Europe/Budapest
2321	5	Q3	\N	f	1	779	session_JXtmL9EI	f	2007-08-04 00:00:00+00	Europe/Budapest
2304	7	R	\N	f	15	777	session_NorNsL6n	t	2007-07-08 12:00:00+00	Europe/London
2305	3	Q1	\N	f	1	777	session_EtRwaj3w	f	2007-07-07 00:00:00+00	Europe/London
2306	4	Q2	\N	f	1	777	session_bhYtNeXH	f	2007-07-07 00:00:00+00	Europe/London
2307	5	Q3	\N	f	1	777	session_xfA5R5B8	f	2007-07-07 00:00:00+00	Europe/London
2308	1	FP1	\N	f	1	777	session_rlYNRj4Y	f	2007-07-06 00:00:00+00	Europe/London
2309	2	FP2	\N	f	1	777	session_wUARKcC3	f	2007-07-06 00:00:00+00	Europe/London
2269	7	R	\N	f	15	772	session_R0Jek3qI	t	2007-05-13 12:00:00+00	Europe/Madrid
2270	3	Q1	\N	f	1	772	session_McxfuGrw	f	2007-05-12 00:00:00+00	Europe/Madrid
2271	4	Q2	\N	f	1	772	session_Y1UaZz6s	f	2007-05-12 00:00:00+00	Europe/Madrid
2272	5	Q3	\N	f	1	772	session_mMdSlOrI	f	2007-05-12 00:00:00+00	Europe/Madrid
2273	1	FP1	\N	f	1	772	session_8Jjvp2hQ	f	2007-05-11 00:00:00+00	Europe/Madrid
2274	2	FP2	\N	f	1	772	session_IzIumjw5	f	2007-05-11 00:00:00+00	Europe/Madrid
2276	7	R	\N	f	15	773	session_E4oUkwev	t	2007-05-27 12:00:00+00	Europe/Monaco
2277	3	Q1	\N	f	1	773	session_JeB8BYOr	f	2007-05-26 00:00:00+00	Europe/Monaco
2278	4	Q2	\N	f	1	773	session_NQV65lIT	f	2007-05-26 00:00:00+00	Europe/Monaco
2279	5	Q3	\N	f	1	773	session_bNH6PYky	f	2007-05-26 00:00:00+00	Europe/Monaco
2280	1	FP1	\N	f	1	773	session_5om0WUpK	f	2007-05-24 00:00:00+00	Europe/Monaco
2281	2	FP2	\N	f	1	773	session_pSdZ46Oy	f	2007-05-24 00:00:00+00	Europe/Monaco
2282	6	FP3	\N	f	1	773	session_5p6uDk80	f	2007-05-26 00:00:00+00	Europe/Monaco
2297	7	R	\N	f	15	776	session_VzEf09Q0	t	2007-07-01 12:00:00+00	Europe/Paris
2298	3	Q1	\N	f	1	776	session_6IdOlNGW	f	2007-06-30 00:00:00+00	Europe/Paris
2299	4	Q2	\N	f	1	776	session_6IFCkY43	f	2007-06-30 00:00:00+00	Europe/Paris
2300	5	Q3	\N	f	1	776	session_jmcZk77v	f	2007-06-30 00:00:00+00	Europe/Paris
2301	1	FP1	\N	f	1	776	session_uopbGsrt	f	2007-06-29 00:00:00+00	Europe/Paris
2302	2	FP2	\N	f	1	776	session_jV3oyCQo	f	2007-06-29 00:00:00+00	Europe/Paris
2283	7	R	\N	f	15	774	session_cdtc8xLj	t	2007-06-10 17:00:00+00	America/Montreal
2284	3	Q1	\N	f	1	774	session_TPZOqMNR	f	2007-06-09 00:00:00+00	America/Montreal
2285	4	Q2	\N	f	1	774	session_JlcTGbPp	f	2007-06-09 00:00:00+00	America/Montreal
2286	5	Q3	\N	f	1	774	session_trYGBdVg	f	2007-06-09 00:00:00+00	America/Montreal
2287	1	FP1	\N	f	1	774	session_f44IENZe	f	2007-06-08 00:00:00+00	America/Montreal
2288	2	FP2	\N	f	1	774	session_iT695JoQ	f	2007-06-08 00:00:00+00	America/Montreal
2374	7	R	\N	f	15	787	session_3eleXRWL	t	2008-03-23 07:00:00+00	Asia/Kuala_Lumpur
2375	3	Q1	\N	f	1	787	session_XKAc6tSX	f	2008-03-22 00:00:00+00	Asia/Kuala_Lumpur
2376	4	Q2	\N	f	1	787	session_Ep8O3vBt	f	2008-03-22 00:00:00+00	Asia/Kuala_Lumpur
2377	5	Q3	\N	f	1	787	session_JUunnG5n	f	2008-03-22 00:00:00+00	Asia/Kuala_Lumpur
2378	1	FP1	\N	f	1	787	session_iFWRUSDd	f	2008-03-21 00:00:00+00	Asia/Kuala_Lumpur
2379	2	FP2	\N	f	1	787	session_3M5agDOZ	f	2008-03-21 00:00:00+00	Asia/Kuala_Lumpur
2353	7	R	\N	f	15	784	session_yasfeBq5	t	2007-10-07 06:00:00+00	Asia/Shanghai
2354	3	Q1	\N	f	1	784	session_LNOZAPEM	f	2007-10-06 00:00:00+00	Asia/Shanghai
2355	4	Q2	\N	f	1	784	session_UDrcyczu	f	2007-10-06 00:00:00+00	Asia/Shanghai
2356	5	Q3	\N	f	1	784	session_5ElJGrwe	f	2007-10-06 00:00:00+00	Asia/Shanghai
2357	1	FP1	\N	f	1	784	session_s8x9ySg9	f	2007-10-05 00:00:00+00	Asia/Shanghai
2358	2	FP2	\N	f	1	784	session_MBaZEbfC	f	2007-10-05 00:00:00+00	Asia/Shanghai
2346	7	R	\N	f	15	783	session_dlfSTHDo	t	2007-09-30 04:30:00+00	Asia/Tokyo
2347	3	Q1	\N	f	1	783	session_InLbvT6d	f	2007-09-29 00:00:00+00	Asia/Tokyo
2348	4	Q2	\N	f	1	783	session_uIJO3Ker	f	2007-09-29 00:00:00+00	Asia/Tokyo
2349	5	Q3	\N	f	1	783	session_eCEzCnoI	f	2007-09-29 00:00:00+00	Asia/Tokyo
2350	1	FP1	\N	f	1	783	session_V0smJxkg	f	2007-09-28 00:00:00+00	Asia/Tokyo
2351	2	FP2	\N	f	1	783	session_9DXMrZk9	f	2007-09-28 00:00:00+00	Asia/Tokyo
2367	7	R	\N	f	15	786	session_eJ1MrwpM	t	2008-03-16 04:30:00+00	Australia/Melbourne
2368	3	Q1	\N	f	1	786	session_MpnoE0nF	f	2008-03-15 00:00:00+00	Australia/Melbourne
2369	4	Q2	\N	f	1	786	session_EoD73EKW	f	2008-03-15 00:00:00+00	Australia/Melbourne
2370	5	Q3	\N	f	1	786	session_reBsrDrL	f	2008-03-15 00:00:00+00	Australia/Melbourne
2371	1	FP1	\N	f	1	786	session_fih4SRnz	f	2008-03-14 00:00:00+00	Australia/Melbourne
2372	2	FP2	\N	f	1	786	session_45mNiN8a	f	2008-03-14 00:00:00+00	Australia/Melbourne
2339	7	R	\N	f	15	782	session_2TmsOJKl	t	2007-09-16 12:00:00+00	Europe/Brussels
2340	3	Q1	\N	f	1	782	session_FISROGey	f	2007-09-15 00:00:00+00	Europe/Brussels
2341	4	Q2	\N	f	1	782	session_WIKbFzsr	f	2007-09-15 00:00:00+00	Europe/Brussels
2342	5	Q3	\N	f	1	782	session_dFRIF5JM	f	2007-09-15 00:00:00+00	Europe/Brussels
2343	1	FP1	\N	f	1	782	session_osCLfw7M	f	2007-09-14 00:00:00+00	Europe/Brussels
2344	2	FP2	\N	f	1	782	session_YRmAtEi0	f	2007-09-14 00:00:00+00	Europe/Brussels
2345	6	FP3	\N	f	1	782	session_KmUXApet	f	2007-09-15 00:00:00+00	Europe/Brussels
2322	1	FP1	\N	f	1	779	session_oBJ2sp12	f	2007-08-03 00:00:00+00	Europe/Budapest
2323	2	FP2	\N	f	1	779	session_9auKCE4f	f	2007-08-03 00:00:00+00	Europe/Budapest
2324	6	FP3	\N	f	1	779	session_dpNwAlhd	f	2007-08-04 00:00:00+00	Europe/Budapest
2325	7	R	\N	f	15	780	session_X6cVnN4C	t	2007-08-26 12:00:00+00	Europe/Istanbul
2326	3	Q1	\N	f	1	780	session_emjifx4o	f	2007-08-25 00:00:00+00	Europe/Istanbul
2327	4	Q2	\N	f	1	780	session_VqkD4kJM	f	2007-08-25 00:00:00+00	Europe/Istanbul
2328	5	Q3	\N	f	1	780	session_EQiLrhpq	f	2007-08-25 00:00:00+00	Europe/Istanbul
2329	1	FP1	\N	f	1	780	session_Vs5yk7vJ	f	2007-08-24 00:00:00+00	Europe/Istanbul
2330	2	FP2	\N	f	1	780	session_tQTaWvft	f	2007-08-24 00:00:00+00	Europe/Istanbul
2388	7	R	\N	f	15	789	session_a1JnwboW	t	2008-04-27 12:00:00+00	Europe/Madrid
2389	3	Q1	\N	f	1	789	session_doPwOx0y	f	2008-04-26 00:00:00+00	Europe/Madrid
2390	4	Q2	\N	f	1	789	session_0o0lgUQL	f	2008-04-26 00:00:00+00	Europe/Madrid
2391	5	Q3	\N	f	1	789	session_NxEu1iXp	f	2008-04-26 00:00:00+00	Europe/Madrid
2392	1	FP1	\N	f	1	789	session_f6Pydsbp	f	2008-04-25 00:00:00+00	Europe/Madrid
2393	2	FP2	\N	f	1	789	session_t8oKrPCZ	f	2008-04-25 00:00:00+00	Europe/Madrid
2394	6	FP3	\N	f	1	789	session_rSMvAPky	f	2008-04-26 00:00:00+00	Europe/Madrid
2332	7	R	\N	f	15	781	session_IlRXZWPE	t	2007-09-09 12:00:00+00	Europe/Rome
2333	3	Q1	\N	f	1	781	session_lU7qobvt	f	2007-09-08 00:00:00+00	Europe/Rome
2334	4	Q2	\N	f	1	781	session_WstupfDY	f	2007-09-08 00:00:00+00	Europe/Rome
2335	5	Q3	\N	f	1	781	session_nclqE42J	f	2007-09-08 00:00:00+00	Europe/Rome
2336	1	FP1	\N	f	1	781	session_Zr45O0t8	f	2007-09-07 00:00:00+00	Europe/Rome
2337	2	FP2	\N	f	1	781	session_CO8endhx	f	2007-09-07 00:00:00+00	Europe/Rome
2381	7	R	\N	f	15	788	session_Zp9nGQyD	t	2008-04-06 11:30:00+00	Asia/Bahrain
2382	3	Q1	\N	f	1	788	session_j2hhq30k	f	2008-04-05 00:00:00+00	Asia/Bahrain
2383	4	Q2	\N	f	1	788	session_goagNQAj	f	2008-04-05 00:00:00+00	Asia/Bahrain
2384	5	Q3	\N	f	1	788	session_mW6DyCYZ	f	2008-04-05 00:00:00+00	Asia/Bahrain
2385	1	FP1	\N	f	1	788	session_h9c2Yhaf	f	2008-04-04 00:00:00+00	Asia/Bahrain
2386	2	FP2	\N	f	1	788	session_6tqB7QLp	f	2008-04-04 00:00:00+00	Asia/Bahrain
2387	6	FP3	\N	f	1	788	session_KEeXPGY4	f	2008-04-05 00:00:00+00	Asia/Bahrain
2430	7	R	\N	f	15	795	session_KAlpiptc	t	2008-07-20 12:00:00+00	Europe/Berlin
2431	3	Q1	\N	f	1	795	session_y4gL2MTU	f	2008-07-19 00:00:00+00	Europe/Berlin
2432	4	Q2	\N	f	1	795	session_CgDdKGna	f	2008-07-19 00:00:00+00	Europe/Berlin
2433	5	Q3	\N	f	1	795	session_rjqe3gZd	f	2008-07-19 00:00:00+00	Europe/Berlin
2434	1	FP1	\N	f	1	795	session_96K8WIWL	f	2008-07-18 00:00:00+00	Europe/Berlin
2451	7	R	\N	f	15	798	session_mCM3epE0	t	2008-09-07 12:00:00+00	Europe/Brussels
2452	3	Q1	\N	f	1	798	session_CboPz2Lo	f	2008-09-06 00:00:00+00	Europe/Brussels
2453	4	Q2	\N	f	1	798	session_WOs0S8Zc	f	2008-09-06 00:00:00+00	Europe/Brussels
2454	5	Q3	\N	f	1	798	session_sKIAlS0e	f	2008-09-06 00:00:00+00	Europe/Brussels
2455	1	FP1	\N	f	1	798	session_RgeLg77X	f	2008-09-05 00:00:00+00	Europe/Brussels
2456	2	FP2	\N	f	1	798	session_6Bkzcyea	f	2008-09-05 00:00:00+00	Europe/Brussels
2437	7	R	\N	f	15	796	session_oikKkKty	t	2008-08-03 12:00:00+00	Europe/Budapest
2438	3	Q1	\N	f	1	796	session_duVhVFU0	f	2008-08-02 00:00:00+00	Europe/Budapest
2439	4	Q2	\N	f	1	796	session_0u5nH7hs	f	2008-08-02 00:00:00+00	Europe/Budapest
2440	5	Q3	\N	f	1	796	session_cUCDxYCu	f	2008-08-02 00:00:00+00	Europe/Budapest
2441	1	FP1	\N	f	1	796	session_fTuo5bkJ	f	2008-08-01 00:00:00+00	Europe/Budapest
2442	2	FP2	\N	f	1	796	session_Tgi8MpGL	f	2008-08-01 00:00:00+00	Europe/Budapest
2396	3	Q1	\N	f	1	790	session_q4va6d9k	f	2008-05-10 00:00:00+00	Europe/Istanbul
2397	4	Q2	\N	f	1	790	session_hjGx1bx3	f	2008-05-10 00:00:00+00	Europe/Istanbul
2398	5	Q3	\N	f	1	790	session_Lg4gkm4m	f	2008-05-10 00:00:00+00	Europe/Istanbul
2399	1	FP1	\N	f	1	790	session_EpJzMMou	f	2008-05-09 00:00:00+00	Europe/Istanbul
2400	2	FP2	\N	f	1	790	session_3j18FfpK	f	2008-05-09 00:00:00+00	Europe/Istanbul
2401	6	FP3	\N	f	1	790	session_eXMrBeFh	f	2008-05-10 00:00:00+00	Europe/Istanbul
2423	7	R	\N	f	15	794	session_QYmwtnYa	t	2008-07-06 12:00:00+00	Europe/London
2424	3	Q1	\N	f	1	794	session_BQqo0T6y	f	2008-07-05 00:00:00+00	Europe/London
2425	4	Q2	\N	f	1	794	session_nGrZU5La	f	2008-07-05 00:00:00+00	Europe/London
2426	5	Q3	\N	f	1	794	session_S7bPLzA9	f	2008-07-05 00:00:00+00	Europe/London
2427	1	FP1	\N	f	1	794	session_MspKagp9	f	2008-07-04 00:00:00+00	Europe/London
2428	2	FP2	\N	f	1	794	session_bt4TxE0P	f	2008-07-04 00:00:00+00	Europe/London
2444	7	R	\N	f	15	797	session_IKimu7V4	t	2008-08-24 12:00:00+00	Europe/Madrid
2445	3	Q1	\N	f	1	797	session_1QusCK7n	f	2008-08-23 00:00:00+00	Europe/Madrid
2446	4	Q2	\N	f	1	797	session_FnRpcwAW	f	2008-08-23 00:00:00+00	Europe/Madrid
2447	5	Q3	\N	f	1	797	session_CCLp4goU	f	2008-08-23 00:00:00+00	Europe/Madrid
2448	1	FP1	\N	f	1	797	session_R7HOQrpH	f	2008-08-22 00:00:00+00	Europe/Madrid
2449	2	FP2	\N	f	1	797	session_jwTL2k1z	f	2008-08-22 00:00:00+00	Europe/Madrid
2402	7	R	\N	f	15	791	session_UxetT8iZ	t	2008-05-25 12:00:00+00	Europe/Monaco
2403	3	Q1	\N	f	1	791	session_pd8xGYOq	f	2008-05-24 00:00:00+00	Europe/Monaco
2404	4	Q2	\N	f	1	791	session_gxQC90pA	f	2008-05-24 00:00:00+00	Europe/Monaco
2405	5	Q3	\N	f	1	791	session_Jvrrc6xQ	f	2008-05-24 00:00:00+00	Europe/Monaco
2406	1	FP1	\N	f	1	791	session_CTyAp7mK	f	2008-05-22 00:00:00+00	Europe/Monaco
2407	2	FP2	\N	f	1	791	session_7MURAEC0	f	2008-05-22 00:00:00+00	Europe/Monaco
2416	7	R	\N	f	15	793	session_AYluR8di	t	2008-06-22 12:00:00+00	Europe/Paris
2417	3	Q1	\N	f	1	793	session_rR8xQn50	f	2008-06-21 00:00:00+00	Europe/Paris
2418	4	Q2	\N	f	1	793	session_WxBbFHKp	f	2008-06-21 00:00:00+00	Europe/Paris
2419	5	Q3	\N	f	1	793	session_Re2LECWm	f	2008-06-21 00:00:00+00	Europe/Paris
2420	1	FP1	\N	f	1	793	session_8qshIS7m	f	2008-06-20 00:00:00+00	Europe/Paris
2421	2	FP2	\N	f	1	793	session_MJQgjBf0	f	2008-06-20 00:00:00+00	Europe/Paris
2422	6	FP3	\N	f	1	793	session_9HrBqUWN	f	2008-06-21 00:00:00+00	Europe/Paris
2458	7	R	\N	f	15	799	session_Iy2trtwz	t	2008-09-14 12:00:00+00	Europe/Rome
2459	3	Q1	\N	f	1	799	session_WEWi3j0w	f	2008-09-13 00:00:00+00	Europe/Rome
2460	4	Q2	\N	f	1	799	session_xoH1M4xG	f	2008-09-13 00:00:00+00	Europe/Rome
2461	5	Q3	\N	f	1	799	session_INhCHgxC	f	2008-09-13 00:00:00+00	Europe/Rome
2462	1	FP1	\N	f	1	799	session_oTlqWTjZ	f	2008-09-12 00:00:00+00	Europe/Rome
2463	2	FP2	\N	f	1	799	session_5kpUfaJG	f	2008-09-12 00:00:00+00	Europe/Rome
2465	7	R	\N	f	15	800	session_bpco48Dy	t	2008-09-28 12:00:00+00	Asia/Singapore
2466	3	Q1	\N	f	1	800	session_SGlgGe82	f	2008-09-27 00:00:00+00	Asia/Singapore
2467	4	Q2	\N	f	1	800	session_XJvrG395	f	2008-09-27 00:00:00+00	Asia/Singapore
2468	5	Q3	\N	f	1	800	session_JuNtanCo	f	2008-09-27 00:00:00+00	Asia/Singapore
2469	1	FP1	\N	f	1	800	session_kiGlhLQG	f	2008-09-26 00:00:00+00	Asia/Singapore
2435	2	FP2	\N	f	1	795	session_VAk6aFGZ	f	2008-07-18 00:00:00+00	Europe/Berlin
2500	7	R	\N	f	15	805	session_31YAOeyH	t	2009-04-05 09:00:00+00	Asia/Kuala_Lumpur
2501	3	Q1	\N	f	1	805	session_z6GBNKlf	f	2009-04-04 00:00:00+00	Asia/Kuala_Lumpur
2502	4	Q2	\N	f	1	805	session_ujnnCQ3j	f	2009-04-04 00:00:00+00	Asia/Kuala_Lumpur
2503	5	Q3	\N	f	1	805	session_v0ZNtv4H	f	2009-04-04 00:00:00+00	Asia/Kuala_Lumpur
2504	1	FP1	\N	f	1	805	session_jPr6OtD1	f	2009-04-03 00:00:00+00	Asia/Kuala_Lumpur
2505	2	FP2	\N	f	1	805	session_tmzoFBcq	f	2009-04-03 00:00:00+00	Asia/Kuala_Lumpur
2479	7	R	\N	f	15	802	session_be8N5VpF	t	2008-10-19 07:00:00+00	Asia/Shanghai
2480	3	Q1	\N	f	1	802	session_ZQOSOGdh	f	2008-10-18 00:00:00+00	Asia/Shanghai
2481	4	Q2	\N	f	1	802	session_apUiuLRa	f	2008-10-18 00:00:00+00	Asia/Shanghai
2482	5	Q3	\N	f	1	802	session_vOszgy3E	f	2008-10-18 00:00:00+00	Asia/Shanghai
2483	1	FP1	\N	f	1	802	session_W5oGQWXb	f	2008-10-17 00:00:00+00	Asia/Shanghai
2484	2	FP2	\N	f	1	802	session_yu6eDLv8	f	2008-10-17 00:00:00+00	Asia/Shanghai
2470	2	FP2	\N	f	1	800	session_A1WYWQzl	f	2008-09-26 00:00:00+00	Asia/Singapore
2471	6	FP3	\N	f	1	800	session_YRD8sxSw	f	2008-09-27 00:00:00+00	Asia/Singapore
2472	7	R	\N	f	15	801	session_GO5Sb3FQ	t	2008-10-12 04:30:00+00	Asia/Tokyo
2473	3	Q1	\N	f	1	801	session_Kb3DJJh3	f	2008-10-11 00:00:00+00	Asia/Tokyo
2474	4	Q2	\N	f	1	801	session_vLlROXaO	f	2008-10-11 00:00:00+00	Asia/Tokyo
2475	5	Q3	\N	f	1	801	session_iiErK0C0	f	2008-10-11 00:00:00+00	Asia/Tokyo
2476	1	FP1	\N	f	1	801	session_VOvKr2Ys	f	2008-10-10 00:00:00+00	Asia/Tokyo
2477	2	FP2	\N	f	1	801	session_dByX8CrX	f	2008-10-10 00:00:00+00	Asia/Tokyo
2478	6	FP3	\N	f	1	801	session_DrKvW75J	f	2008-10-11 00:00:00+00	Asia/Tokyo
2493	7	R	\N	f	15	804	session_47u7RtBV	t	2009-03-29 06:00:00+00	Australia/Melbourne
2494	3	Q1	\N	f	1	804	session_iB5cug1F	f	2009-03-28 00:00:00+00	Australia/Melbourne
2495	4	Q2	\N	f	1	804	session_TP2n5Gil	f	2009-03-28 00:00:00+00	Australia/Melbourne
2496	5	Q3	\N	f	1	804	session_PZrKfV8D	f	2009-03-28 00:00:00+00	Australia/Melbourne
2497	1	FP1	\N	f	1	804	session_qP7wu4Oa	f	2009-03-27 00:00:00+00	Australia/Melbourne
2498	2	FP2	\N	f	1	804	session_mL1H4syj	f	2009-03-27 00:00:00+00	Australia/Melbourne
2499	6	FP3	\N	f	1	804	session_AQNdPJYh	f	2009-03-28 00:00:00+00	Australia/Melbourne
2535	7	R	\N	f	15	810	session_qF6fMVCC	t	2009-06-07 12:00:00+00	Europe/Istanbul
2536	3	Q1	\N	f	1	810	session_05JRFYTd	f	2009-06-06 00:00:00+00	Europe/Istanbul
2537	4	Q2	\N	f	1	810	session_QZVcFUoL	f	2009-06-06 00:00:00+00	Europe/Istanbul
2538	5	Q3	\N	f	1	810	session_kcIojXoy	f	2009-06-06 00:00:00+00	Europe/Istanbul
2539	1	FP1	\N	f	1	810	session_eLKWBR6o	f	2009-06-05 00:00:00+00	Europe/Istanbul
2540	2	FP2	\N	f	1	810	session_pRNJTI3p	f	2009-06-05 00:00:00+00	Europe/Istanbul
2541	6	FP3	\N	f	1	810	session_WYLPy5Ok	f	2009-06-06 00:00:00+00	Europe/Istanbul
2542	7	R	\N	f	15	811	session_yYTJmPsS	t	2009-06-21 12:00:00+00	Europe/London
2543	3	Q1	\N	f	1	811	session_otLJL21a	f	2009-06-20 00:00:00+00	Europe/London
2521	7	R	\N	f	15	808	session_3N6MO20B	t	2009-05-10 12:00:00+00	Europe/Madrid
2522	3	Q1	\N	f	1	808	session_kaoQluV0	f	2009-05-09 00:00:00+00	Europe/Madrid
2523	4	Q2	\N	f	1	808	session_6kL07ZrN	f	2009-05-09 00:00:00+00	Europe/Madrid
2524	5	Q3	\N	f	1	808	session_qAPfw58i	f	2009-05-09 00:00:00+00	Europe/Madrid
2525	1	FP1	\N	f	1	808	session_IIhmZWRO	f	2009-05-08 00:00:00+00	Europe/Madrid
2526	2	FP2	\N	f	1	808	session_EgvsGmy9	f	2009-05-08 00:00:00+00	Europe/Madrid
2527	6	FP3	\N	f	1	808	session_9rX8FO79	f	2009-05-09 00:00:00+00	Europe/Madrid
2528	7	R	\N	f	15	809	session_WUV1ggXD	t	2009-05-24 12:00:00+00	Europe/Monaco
2529	3	Q1	\N	f	1	809	session_YRZrcJtR	f	2009-05-23 00:00:00+00	Europe/Monaco
2530	4	Q2	\N	f	1	809	session_1u7Va0rX	f	2009-05-23 00:00:00+00	Europe/Monaco
2531	5	Q3	\N	f	1	809	session_GKOVvFOo	f	2009-05-23 00:00:00+00	Europe/Monaco
2532	1	FP1	\N	f	1	809	session_FYUR4I4s	f	2009-05-21 00:00:00+00	Europe/Monaco
2533	2	FP2	\N	f	1	809	session_cYydwfZ4	f	2009-05-21 00:00:00+00	Europe/Monaco
2534	6	FP3	\N	f	1	809	session_D1mQzwcQ	f	2009-05-23 00:00:00+00	Europe/Monaco
2514	7	R	\N	f	15	807	session_w8fQoUfK	t	2009-04-26 12:00:00+00	Asia/Bahrain
2515	3	Q1	\N	f	1	807	session_FmycS9rg	f	2009-04-25 00:00:00+00	Asia/Bahrain
2516	4	Q2	\N	f	1	807	session_dVIHsZ9i	f	2009-04-25 00:00:00+00	Asia/Bahrain
2517	5	Q3	\N	f	1	807	session_uAXFrKdg	f	2009-04-25 00:00:00+00	Asia/Bahrain
2518	1	FP1	\N	f	1	807	session_eh6fuUOI	f	2009-04-24 00:00:00+00	Asia/Bahrain
2519	2	FP2	\N	f	1	807	session_7p5VdKhN	f	2009-04-24 00:00:00+00	Asia/Bahrain
2520	6	FP3	\N	f	1	807	session_6SlZDvp7	f	2009-04-25 00:00:00+00	Asia/Bahrain
2605	7	R	\N	f	15	820	session_AMLpCTWS	t	2009-11-01 11:00:00+00	Asia/Dubai
2606	3	Q1	\N	f	1	820	session_LWkkO1CV	f	2009-10-31 00:00:00+00	Asia/Dubai
2607	4	Q2	\N	f	1	820	session_GzYF6Y46	f	2009-10-31 00:00:00+00	Asia/Dubai
2608	5	Q3	\N	f	1	820	session_SHcEEcB6	f	2009-10-31 00:00:00+00	Asia/Dubai
2609	1	FP1	\N	f	1	820	session_0rce7MfP	f	2009-10-30 00:00:00+00	Asia/Dubai
2610	2	FP2	\N	f	1	820	session_JwoI48vW	f	2009-10-30 00:00:00+00	Asia/Dubai
2584	7	R	\N	f	15	817	session_F6uK6L5y	t	2009-09-27 12:00:00+00	Asia/Singapore
2585	3	Q1	\N	f	1	817	session_FWTj2doc	f	2009-09-26 00:00:00+00	Asia/Singapore
2586	4	Q2	\N	f	1	817	session_lqeNEFZ3	f	2009-09-26 00:00:00+00	Asia/Singapore
2587	5	Q3	\N	f	1	817	session_zVUnafPm	f	2009-09-26 00:00:00+00	Asia/Singapore
2588	1	FP1	\N	f	1	817	session_m1VrECZN	f	2009-09-25 00:00:00+00	Asia/Singapore
2589	2	FP2	\N	f	1	817	session_PrvhvJTi	f	2009-09-25 00:00:00+00	Asia/Singapore
2591	7	R	\N	f	15	818	session_rXV1SpOb	t	2009-10-04 05:00:00+00	Asia/Tokyo
2592	3	Q1	\N	f	1	818	session_Q7DdcnQj	f	2009-10-03 00:00:00+00	Asia/Tokyo
2593	4	Q2	\N	f	1	818	session_SozwIlbR	f	2009-10-03 00:00:00+00	Asia/Tokyo
2594	5	Q3	\N	f	1	818	session_367bAASU	f	2009-10-03 00:00:00+00	Asia/Tokyo
2595	1	FP1	\N	f	1	818	session_jNqcmx6X	f	2009-10-02 00:00:00+00	Asia/Tokyo
2596	2	FP2	\N	f	1	818	session_Ofb6RIrG	f	2009-10-02 00:00:00+00	Asia/Tokyo
2549	7	R	\N	f	15	812	session_WmYq9g34	t	2009-07-12 12:00:00+00	Europe/Berlin
2550	3	Q1	\N	f	1	812	session_kbRi7kYQ	f	2009-07-11 00:00:00+00	Europe/Berlin
2551	4	Q2	\N	f	1	812	session_vbB2legG	f	2009-07-11 00:00:00+00	Europe/Berlin
2552	5	Q3	\N	f	1	812	session_IDRtciOG	f	2009-07-11 00:00:00+00	Europe/Berlin
2553	1	FP1	\N	f	1	812	session_yIqJ0e3W	f	2009-07-10 00:00:00+00	Europe/Berlin
2554	2	FP2	\N	f	1	812	session_3WPwIGsB	f	2009-07-10 00:00:00+00	Europe/Berlin
2570	7	R	\N	f	15	815	session_JcUbyLqG	t	2009-08-30 12:00:00+00	Europe/Brussels
2571	3	Q1	\N	f	1	815	session_YipjH2B0	f	2009-08-29 00:00:00+00	Europe/Brussels
2572	4	Q2	\N	f	1	815	session_jdknoJtr	f	2009-08-29 00:00:00+00	Europe/Brussels
2573	5	Q3	\N	f	1	815	session_A0f53Zsw	f	2009-08-29 00:00:00+00	Europe/Brussels
2574	1	FP1	\N	f	1	815	session_8Aj8ou8H	f	2009-08-28 00:00:00+00	Europe/Brussels
2575	2	FP2	\N	f	1	815	session_ZcNSfPSk	f	2009-08-28 00:00:00+00	Europe/Brussels
2576	6	FP3	\N	f	1	815	session_sTWBQoqP	f	2009-08-29 00:00:00+00	Europe/Brussels
2556	7	R	\N	f	15	813	session_EmgxM0Il	t	2009-07-26 12:00:00+00	Europe/Budapest
2557	3	Q1	\N	f	1	813	session_t6ynqy3J	f	2009-07-25 00:00:00+00	Europe/Budapest
2558	4	Q2	\N	f	1	813	session_7ju4Xyti	f	2009-07-25 00:00:00+00	Europe/Budapest
2559	5	Q3	\N	f	1	813	session_smFjH0Or	f	2009-07-25 00:00:00+00	Europe/Budapest
2560	1	FP1	\N	f	1	813	session_POYOsjHb	f	2009-07-24 00:00:00+00	Europe/Budapest
2561	2	FP2	\N	f	1	813	session_8WTMk9kE	f	2009-07-24 00:00:00+00	Europe/Budapest
2544	4	Q2	\N	f	1	811	session_gZv4DwXG	f	2009-06-20 00:00:00+00	Europe/London
2545	5	Q3	\N	f	1	811	session_yhIcWRYW	f	2009-06-20 00:00:00+00	Europe/London
2546	1	FP1	\N	f	1	811	session_arEB7JCF	f	2009-06-19 00:00:00+00	Europe/London
2547	2	FP2	\N	f	1	811	session_MpSJd8I9	f	2009-06-19 00:00:00+00	Europe/London
2548	6	FP3	\N	f	1	811	session_fiYiM7If	f	2009-06-20 00:00:00+00	Europe/London
2563	7	R	\N	f	15	814	session_53EQlJqd	t	2009-08-23 12:00:00+00	Europe/Madrid
2564	3	Q1	\N	f	1	814	session_l5wKwsdU	f	2009-08-22 00:00:00+00	Europe/Madrid
2565	4	Q2	\N	f	1	814	session_308saJ79	f	2009-08-22 00:00:00+00	Europe/Madrid
2566	5	Q3	\N	f	1	814	session_HO20IWG7	f	2009-08-22 00:00:00+00	Europe/Madrid
2567	1	FP1	\N	f	1	814	session_8aUF4QkA	f	2009-08-21 00:00:00+00	Europe/Madrid
2568	2	FP2	\N	f	1	814	session_K0jpChiG	f	2009-08-21 00:00:00+00	Europe/Madrid
2577	7	R	\N	f	15	816	session_BkU9IBj5	t	2009-09-13 12:00:00+00	Europe/Rome
2578	3	Q1	\N	f	1	816	session_VLzJbnFq	f	2009-09-12 00:00:00+00	Europe/Rome
2579	4	Q2	\N	f	1	816	session_rMwuTyqc	f	2009-09-12 00:00:00+00	Europe/Rome
2580	5	Q3	\N	f	1	816	session_Nb90KMze	f	2009-09-12 00:00:00+00	Europe/Rome
2581	1	FP1	\N	f	1	816	session_iYbr4EE7	f	2009-09-11 00:00:00+00	Europe/Rome
2582	2	FP2	\N	f	1	816	session_f9Jr4WTT	f	2009-09-11 00:00:00+00	Europe/Rome
2612	7	R	\N	f	16	821	session_oKBHd474	t	2010-03-14 12:00:00+00	Asia/Bahrain
2613	3	Q1	\N	f	1	821	session_p0NjZKkE	f	2010-03-13 00:00:00+00	Asia/Bahrain
2614	4	Q2	\N	f	1	821	session_cjC2Am8e	f	2010-03-13 00:00:00+00	Asia/Bahrain
2615	5	Q3	\N	f	1	821	session_l2hsPSl8	f	2010-03-13 00:00:00+00	Asia/Bahrain
2616	1	FP1	\N	f	1	821	session_jpYu1MXC	f	2010-03-12 00:00:00+00	Asia/Bahrain
2617	2	FP2	\N	f	1	821	session_VJTuu4jj	f	2010-03-12 00:00:00+00	Asia/Bahrain
2633	7	R	\N	f	16	824	session_ZFqbUfeq	t	2010-04-18 06:00:00+00	Asia/Shanghai
2634	3	Q1	\N	f	1	824	session_qyt05OEL	f	2010-04-17 00:00:00+00	Asia/Shanghai
2635	4	Q2	\N	f	1	824	session_Hshw8Gvc	f	2010-04-17 00:00:00+00	Asia/Shanghai
2636	5	Q3	\N	f	1	824	session_bdu9hoRH	f	2010-04-17 00:00:00+00	Asia/Shanghai
2637	1	FP1	\N	f	1	824	session_O2CCxwTn	f	2010-04-16 00:00:00+00	Asia/Shanghai
2638	2	FP2	\N	f	1	824	session_wyobEwbw	f	2010-04-16 00:00:00+00	Asia/Shanghai
2619	7	R	\N	f	16	822	session_NxypGgut	t	2010-03-28 06:00:00+00	Australia/Melbourne
2620	3	Q1	\N	f	1	822	session_vYeF2Ama	f	2010-03-27 00:00:00+00	Australia/Melbourne
2621	4	Q2	\N	f	1	822	session_8T4rBx2i	f	2010-03-27 00:00:00+00	Australia/Melbourne
2622	5	Q3	\N	f	1	822	session_P6QtAi9j	f	2010-03-27 00:00:00+00	Australia/Melbourne
2623	1	FP1	\N	f	1	822	session_N9V0DkY9	f	2010-03-26 00:00:00+00	Australia/Melbourne
2624	2	FP2	\N	f	1	822	session_UZGoPIZq	f	2010-03-26 00:00:00+00	Australia/Melbourne
2682	7	R	\N	f	16	831	session_2i0VVHKW	t	2010-07-25 12:00:00+00	Europe/Berlin
2683	3	Q1	\N	f	1	831	session_yrNhWhlb	f	2010-07-24 00:00:00+00	Europe/Berlin
2684	4	Q2	\N	f	1	831	session_xYbnZK9R	f	2010-07-24 00:00:00+00	Europe/Berlin
2685	5	Q3	\N	f	1	831	session_f9MSlth3	f	2010-07-24 00:00:00+00	Europe/Berlin
2686	1	FP1	\N	f	1	831	session_Oa9QpfbV	f	2010-07-23 00:00:00+00	Europe/Berlin
2687	2	FP2	\N	f	1	831	session_sJD5vBa5	f	2010-07-23 00:00:00+00	Europe/Berlin
2688	6	FP3	\N	f	1	831	session_wZEGZflS	f	2010-07-24 00:00:00+00	Europe/Berlin
2689	7	R	\N	f	16	832	session_Oee1qRCB	t	2010-08-01 12:00:00+00	Europe/Budapest
2690	3	Q1	\N	f	1	832	session_J2M71PRu	f	2010-07-31 00:00:00+00	Europe/Budapest
2691	4	Q2	\N	f	1	832	session_TEeUqMtZ	f	2010-07-31 00:00:00+00	Europe/Budapest
2654	7	R	\N	f	16	827	session_Ja8kWv8e	t	2010-05-30 11:00:00+00	Europe/Istanbul
2655	3	Q1	\N	f	1	827	session_Wbx2882p	f	2010-05-29 00:00:00+00	Europe/Istanbul
2656	4	Q2	\N	f	1	827	session_0rI56aUH	f	2010-05-29 00:00:00+00	Europe/Istanbul
2657	5	Q3	\N	f	1	827	session_yRqp3JSn	f	2010-05-29 00:00:00+00	Europe/Istanbul
2675	7	R	\N	f	16	830	session_aueyT2hV	t	2010-07-11 12:00:00+00	Europe/London
2676	3	Q1	\N	f	1	830	session_78wSVgZI	f	2010-07-10 00:00:00+00	Europe/London
2677	4	Q2	\N	f	1	830	session_6b5ayNRU	f	2010-07-10 00:00:00+00	Europe/London
2678	5	Q3	\N	f	1	830	session_jQtZKIWv	f	2010-07-10 00:00:00+00	Europe/London
2679	1	FP1	\N	f	1	830	session_YNMRmNIq	f	2010-07-09 00:00:00+00	Europe/London
2680	2	FP2	\N	f	1	830	session_3UOsR449	f	2010-07-09 00:00:00+00	Europe/London
2640	7	R	\N	f	16	825	session_8L1hY8HL	t	2010-05-09 12:00:00+00	Europe/Madrid
2641	3	Q1	\N	f	1	825	session_3ZPTtHZP	f	2010-05-08 00:00:00+00	Europe/Madrid
2642	4	Q2	\N	f	1	825	session_fYwz3QxZ	f	2010-05-08 00:00:00+00	Europe/Madrid
2643	5	Q3	\N	f	1	825	session_5vdCP5Ew	f	2010-05-08 00:00:00+00	Europe/Madrid
2644	1	FP1	\N	f	1	825	session_i5qLlBih	f	2010-05-07 00:00:00+00	Europe/Madrid
2645	2	FP2	\N	f	1	825	session_2RsU2V8o	f	2010-05-07 00:00:00+00	Europe/Madrid
2646	6	FP3	\N	f	1	825	session_aeivMZEQ	f	2010-05-08 00:00:00+00	Europe/Madrid
2647	7	R	\N	f	16	826	session_uK1sBsiZ	t	2010-05-16 12:00:00+00	Europe/Monaco
2648	3	Q1	\N	f	1	826	session_blm8esI9	f	2010-05-15 00:00:00+00	Europe/Monaco
2649	4	Q2	\N	f	1	826	session_6UKFG9fT	f	2010-05-15 00:00:00+00	Europe/Monaco
2650	5	Q3	\N	f	1	826	session_9nED8h7S	f	2010-05-15 00:00:00+00	Europe/Monaco
2651	1	FP1	\N	f	1	826	session_IBfVfafv	f	2010-05-13 00:00:00+00	Europe/Monaco
2652	2	FP2	\N	f	1	826	session_Jx8bXaIz	f	2010-05-13 00:00:00+00	Europe/Monaco
2653	6	FP3	\N	f	1	826	session_hgOog5aJ	f	2010-05-15 00:00:00+00	Europe/Monaco
2618	6	FP3	\N	f	1	821	session_OxuvoUxd	f	2010-03-13 00:00:00+00	Asia/Bahrain
2626	7	R	\N	f	16	823	session_D8AsSPvf	t	2010-04-04 08:00:00+00	Asia/Kuala_Lumpur
2627	3	Q1	\N	f	1	823	session_HrzVtWVF	f	2010-04-03 00:00:00+00	Asia/Kuala_Lumpur
2628	4	Q2	\N	f	1	823	session_nIfIUdnW	f	2010-04-03 00:00:00+00	Asia/Kuala_Lumpur
2629	5	Q3	\N	f	1	823	session_oI2YpzVB	f	2010-04-03 00:00:00+00	Asia/Kuala_Lumpur
2630	1	FP1	\N	f	1	823	session_Q8tgkXpr	f	2010-04-02 00:00:00+00	Asia/Kuala_Lumpur
2631	2	FP2	\N	f	1	823	session_7ZmtaNZ0	f	2010-04-02 00:00:00+00	Asia/Kuala_Lumpur
2658	1	FP1	\N	f	1	827	session_Ns0Fn455	f	2010-05-28 00:00:00+00	Europe/Istanbul
2659	2	FP2	\N	f	1	827	session_TenmH7fc	f	2010-05-28 00:00:00+00	Europe/Istanbul
2752	7	R	\N	f	16	841	session_ToW13J4m	t	2011-04-10 08:00:00+00	Asia/Kuala_Lumpur
2753	3	Q1	\N	f	1	841	session_D4YMti8J	f	2011-04-09 00:00:00+00	Asia/Kuala_Lumpur
2754	4	Q2	\N	f	1	841	session_55uHqJpK	f	2011-04-09 00:00:00+00	Asia/Kuala_Lumpur
2755	5	Q3	\N	f	1	841	session_bar4WRtX	f	2011-04-09 00:00:00+00	Asia/Kuala_Lumpur
2756	1	FP1	\N	f	1	841	session_7nx3FzSb	f	2011-04-08 00:00:00+00	Asia/Kuala_Lumpur
2757	2	FP2	\N	f	1	841	session_ao3S0ElN	f	2011-04-08 00:00:00+00	Asia/Kuala_Lumpur
2724	7	R	\N	f	16	837	session_jCqfOsWQ	t	2010-10-24 05:00:00+00	Asia/Seoul
2725	3	Q1	\N	f	1	837	session_KXGiU11W	f	2010-10-23 00:00:00+00	Asia/Seoul
2726	4	Q2	\N	f	1	837	session_M5ubbXsR	f	2010-10-23 00:00:00+00	Asia/Seoul
2727	5	Q3	\N	f	1	837	session_OuIPPRkv	f	2010-10-23 00:00:00+00	Asia/Seoul
2728	1	FP1	\N	f	1	837	session_dIbtIlXd	f	2010-10-22 00:00:00+00	Asia/Seoul
2729	2	FP2	\N	f	1	837	session_6M7KgCDd	f	2010-10-22 00:00:00+00	Asia/Seoul
2759	7	R	\N	f	16	842	session_9qVqu8QY	t	2011-04-17 07:00:00+00	Asia/Shanghai
2760	3	Q1	\N	f	1	842	session_fNQLEOti	f	2011-04-16 00:00:00+00	Asia/Shanghai
2761	4	Q2	\N	f	1	842	session_8H6fUAb6	f	2011-04-16 00:00:00+00	Asia/Shanghai
2762	5	Q3	\N	f	1	842	session_GpTxQhBo	f	2011-04-16 00:00:00+00	Asia/Shanghai
2763	1	FP1	\N	f	1	842	session_1HEjeD5F	f	2011-04-15 00:00:00+00	Asia/Shanghai
2764	2	FP2	\N	f	1	842	session_LKoLxYo8	f	2011-04-15 00:00:00+00	Asia/Shanghai
2710	7	R	\N	f	16	835	session_iPIqF20z	t	2010-09-26 12:00:00+00	Asia/Singapore
2711	3	Q1	\N	f	1	835	session_nLrobkp0	f	2010-09-25 00:00:00+00	Asia/Singapore
2712	4	Q2	\N	f	1	835	session_V0CeytIU	f	2010-09-25 00:00:00+00	Asia/Singapore
2713	5	Q3	\N	f	1	835	session_tdBtBOpN	f	2010-09-25 00:00:00+00	Asia/Singapore
2714	1	FP1	\N	f	1	835	session_GMNgxuKI	f	2010-09-24 00:00:00+00	Asia/Singapore
2715	2	FP2	\N	f	1	835	session_Jnu02iSZ	f	2010-09-24 00:00:00+00	Asia/Singapore
2716	6	FP3	\N	f	1	835	session_Yrkzb3vq	f	2010-09-25 00:00:00+00	Asia/Singapore
2717	7	R	\N	f	16	836	session_KGRNRLKP	t	2010-10-10 06:00:00+00	Asia/Tokyo
2718	3	Q1	\N	f	1	836	session_ALDJ2rek	f	2010-10-09 00:00:00+00	Asia/Tokyo
2719	4	Q2	\N	f	1	836	session_5kaMINpB	f	2010-10-09 00:00:00+00	Asia/Tokyo
2720	5	Q3	\N	f	1	836	session_eUPivMdt	f	2010-10-09 00:00:00+00	Asia/Tokyo
2721	1	FP1	\N	f	1	836	session_Ygmqa1na	f	2010-10-08 00:00:00+00	Asia/Tokyo
2722	2	FP2	\N	f	1	836	session_I0KhVART	f	2010-10-08 00:00:00+00	Asia/Tokyo
2745	7	R	\N	f	16	840	session_uIDCiqGa	t	2011-03-27 06:00:00+00	Australia/Melbourne
2746	3	Q1	\N	f	1	840	session_Blgy9A0W	f	2011-03-26 00:00:00+00	Australia/Melbourne
2747	4	Q2	\N	f	1	840	session_KtRgT8r4	f	2011-03-26 00:00:00+00	Australia/Melbourne
2748	5	Q3	\N	f	1	840	session_z88dkfCm	f	2011-03-26 00:00:00+00	Australia/Melbourne
2749	1	FP1	\N	f	1	840	session_CIjfJyXy	f	2011-03-25 00:00:00+00	Australia/Melbourne
2750	2	FP2	\N	f	1	840	session_aUTNHJXj	f	2011-03-25 00:00:00+00	Australia/Melbourne
2696	7	R	\N	f	16	833	session_26YKlbE1	t	2010-08-29 12:00:00+00	Europe/Brussels
2697	3	Q1	\N	f	1	833	session_Y0ECOyeS	f	2010-08-28 00:00:00+00	Europe/Brussels
2698	4	Q2	\N	f	1	833	session_8UUfT4LT	f	2010-08-28 00:00:00+00	Europe/Brussels
2699	5	Q3	\N	f	1	833	session_pVfFmy7l	f	2010-08-28 00:00:00+00	Europe/Brussels
2700	1	FP1	\N	f	1	833	session_tybwwWyx	f	2010-08-27 00:00:00+00	Europe/Brussels
2701	2	FP2	\N	f	1	833	session_YXbjiKjz	f	2010-08-27 00:00:00+00	Europe/Brussels
2692	5	Q3	\N	f	1	832	session_8nwubcWR	f	2010-07-31 00:00:00+00	Europe/Budapest
2693	1	FP1	\N	f	1	832	session_PxsLpO3N	f	2010-07-30 00:00:00+00	Europe/Budapest
2694	2	FP2	\N	f	1	832	session_uVjszx7P	f	2010-07-30 00:00:00+00	Europe/Budapest
2695	6	FP3	\N	f	1	832	session_ERgRL3KJ	f	2010-07-31 00:00:00+00	Europe/Budapest
2703	7	R	\N	f	16	834	session_kPN34gAz	t	2010-09-12 12:00:00+00	Europe/Rome
2704	3	Q1	\N	f	1	834	session_auulKdmR	f	2010-09-11 00:00:00+00	Europe/Rome
2705	4	Q2	\N	f	1	834	session_kUWmUDiu	f	2010-09-11 00:00:00+00	Europe/Rome
2706	5	Q3	\N	f	1	834	session_mdeJf0JV	f	2010-09-11 00:00:00+00	Europe/Rome
2707	1	FP1	\N	f	1	834	session_ckkE1AHI	f	2010-09-10 00:00:00+00	Europe/Rome
2708	2	FP2	\N	f	1	834	session_IMpVHr31	f	2010-09-10 00:00:00+00	Europe/Rome
2738	7	R	\N	f	16	839	session_NpxCHbO6	t	2010-11-14 13:00:00+00	Asia/Dubai
2739	3	Q1	\N	f	1	839	session_VonJVev5	f	2010-11-13 00:00:00+00	Asia/Dubai
2740	4	Q2	\N	f	1	839	session_JOgktpFi	f	2010-11-13 00:00:00+00	Asia/Dubai
2741	5	Q3	\N	f	1	839	session_6xjGDEuz	f	2010-11-13 00:00:00+00	Asia/Dubai
2742	1	FP1	\N	f	1	839	session_OOjPHRCp	f	2010-11-12 00:00:00+00	Asia/Dubai
2743	2	FP2	\N	f	1	839	session_jlqH0mbZ	f	2010-11-12 00:00:00+00	Asia/Dubai
2744	6	FP3	\N	f	1	839	session_s0xmINk8	f	2010-11-13 00:00:00+00	Asia/Dubai
2822	7	R	\N	f	16	851	session_lNru72le	t	2011-08-28 12:00:00+00	Europe/Brussels
2823	3	Q1	\N	f	1	851	session_LHvysquS	f	2011-08-27 00:00:00+00	Europe/Brussels
2824	4	Q2	\N	f	1	851	session_TLwzdHxF	f	2011-08-27 00:00:00+00	Europe/Brussels
2825	5	Q3	\N	f	1	851	session_e74xUVpK	f	2011-08-27 00:00:00+00	Europe/Brussels
2826	1	FP1	\N	f	1	851	session_rWhs7xH0	f	2011-08-26 00:00:00+00	Europe/Brussels
2827	2	FP2	\N	f	1	851	session_hJqYRX1d	f	2011-08-26 00:00:00+00	Europe/Brussels
2828	6	FP3	\N	f	1	851	session_umQf18gR	f	2011-08-27 00:00:00+00	Europe/Brussels
2815	7	R	\N	f	16	850	session_6AH2pu1u	t	2011-07-31 12:00:00+00	Europe/Budapest
2816	3	Q1	\N	f	1	850	session_wQ46j9qU	f	2011-07-30 00:00:00+00	Europe/Budapest
2817	4	Q2	\N	f	1	850	session_5tILtMa9	f	2011-07-30 00:00:00+00	Europe/Budapest
2818	5	Q3	\N	f	1	850	session_Qkjo9u64	f	2011-07-30 00:00:00+00	Europe/Budapest
2819	1	FP1	\N	f	1	850	session_KcbGfjyv	f	2011-07-29 00:00:00+00	Europe/Budapest
2820	2	FP2	\N	f	1	850	session_cNV9jjS0	f	2011-07-29 00:00:00+00	Europe/Budapest
2766	7	R	\N	f	16	843	session_cLKYVpjT	t	2011-05-08 12:00:00+00	Europe/Istanbul
2767	3	Q1	\N	f	1	843	session_uG9fl7Uy	f	2011-05-07 00:00:00+00	Europe/Istanbul
2768	4	Q2	\N	f	1	843	session_pALYt8qf	f	2011-05-07 00:00:00+00	Europe/Istanbul
2769	5	Q3	\N	f	1	843	session_HaUa5ogQ	f	2011-05-07 00:00:00+00	Europe/Istanbul
2770	1	FP1	\N	f	1	843	session_MRZdR80y	f	2011-05-06 00:00:00+00	Europe/Istanbul
2771	2	FP2	\N	f	1	843	session_TwLkZLXK	f	2011-05-06 00:00:00+00	Europe/Istanbul
2801	7	R	\N	f	16	848	session_HVdILIfB	t	2011-07-10 12:00:00+00	Europe/London
2802	3	Q1	\N	f	1	848	session_PFonqbao	f	2011-07-09 00:00:00+00	Europe/London
2803	4	Q2	\N	f	1	848	session_MshdLJz6	f	2011-07-09 00:00:00+00	Europe/London
2804	5	Q3	\N	f	1	848	session_QIcRVrfO	f	2011-07-09 00:00:00+00	Europe/London
2805	1	FP1	\N	f	1	848	session_Y9s0xq4O	f	2011-07-08 00:00:00+00	Europe/London
2806	2	FP2	\N	f	1	848	session_sqDMPfDv	f	2011-07-08 00:00:00+00	Europe/London
2807	6	FP3	\N	f	1	848	session_R2G1zlun	f	2011-07-09 00:00:00+00	Europe/London
2773	7	R	\N	f	16	844	session_sM124o8F	t	2011-05-22 12:00:00+00	Europe/Madrid
2774	3	Q1	\N	f	1	844	session_lVPz1qI8	f	2011-05-21 00:00:00+00	Europe/Madrid
2775	4	Q2	\N	f	1	844	session_xMLN1MaK	f	2011-05-21 00:00:00+00	Europe/Madrid
2776	5	Q3	\N	f	1	844	session_PyzdQMlC	f	2011-05-21 00:00:00+00	Europe/Madrid
2777	1	FP1	\N	f	1	844	session_GxQFYhJV	f	2011-05-20 00:00:00+00	Europe/Madrid
2778	2	FP2	\N	f	1	844	session_dlGh48lk	f	2011-05-20 00:00:00+00	Europe/Madrid
2780	7	R	\N	f	16	845	session_2fz2ZRU6	t	2011-05-29 12:00:00+00	Europe/Monaco
2781	3	Q1	\N	f	1	845	session_RDBVrexV	f	2011-05-28 00:00:00+00	Europe/Monaco
2782	4	Q2	\N	f	1	845	session_dCghUBtg	f	2011-05-28 00:00:00+00	Europe/Monaco
2783	5	Q3	\N	f	1	845	session_91EZ7Xvk	f	2011-05-28 00:00:00+00	Europe/Monaco
2784	1	FP1	\N	f	1	845	session_CSIsDPGs	f	2011-05-26 00:00:00+00	Europe/Monaco
2785	2	FP2	\N	f	1	845	session_Y6s8eprY	f	2011-05-26 00:00:00+00	Europe/Monaco
2786	6	FP3	\N	f	1	845	session_FMQenkPX	f	2011-05-28 00:00:00+00	Europe/Monaco
2829	7	R	\N	f	16	852	session_lHthL6PS	t	2011-09-11 12:00:00+00	Europe/Rome
2830	3	Q1	\N	f	1	852	session_U9sLGxqw	f	2011-09-10 00:00:00+00	Europe/Rome
2831	4	Q2	\N	f	1	852	session_C0AjtiqR	f	2011-09-10 00:00:00+00	Europe/Rome
2832	5	Q3	\N	f	1	852	session_oXqo3PpF	f	2011-09-10 00:00:00+00	Europe/Rome
2833	1	FP1	\N	f	1	852	session_NF2zkyFz	f	2011-09-09 00:00:00+00	Europe/Rome
2834	2	FP2	\N	f	1	852	session_2rmTDvsl	f	2011-09-09 00:00:00+00	Europe/Rome
2835	6	FP3	\N	f	1	852	session_C8i49XKb	f	2011-09-10 00:00:00+00	Europe/Rome
2836	7	R	\N	f	16	853	session_94lWuIXl	t	2011-09-25 12:00:00+00	Asia/Singapore
2837	3	Q1	\N	f	1	853	session_KknY8s7J	f	2011-09-24 00:00:00+00	Asia/Singapore
2838	4	Q2	\N	f	1	853	session_9qXr5i3g	f	2011-09-24 00:00:00+00	Asia/Singapore
2839	5	Q3	\N	f	1	853	session_vhqN7lAi	f	2011-09-24 00:00:00+00	Asia/Singapore
2808	7	R	\N	f	16	849	session_dFbz2ZqR	t	2011-07-24 12:00:00+00	Europe/Berlin
2809	3	Q1	\N	f	1	849	session_FpqrSskg	f	2011-07-23 00:00:00+00	Europe/Berlin
2810	4	Q2	\N	f	1	849	session_3hgUKF5S	f	2011-07-23 00:00:00+00	Europe/Berlin
2811	5	Q3	\N	f	1	849	session_zjZ1eOsw	f	2011-07-23 00:00:00+00	Europe/Berlin
2812	1	FP1	\N	f	1	849	session_Ryd3whou	f	2011-07-22 00:00:00+00	Europe/Berlin
2813	2	FP2	\N	f	1	849	session_LSZNMxm8	f	2011-07-22 00:00:00+00	Europe/Berlin
2864	7	R	\N	f	16	857	session_soXmet4o	t	2011-11-13 13:00:00+00	Asia/Dubai
2865	3	Q1	\N	f	1	857	session_U7xfV5q1	f	2011-11-12 00:00:00+00	Asia/Dubai
2866	4	Q2	\N	f	1	857	session_K5JIQtSh	f	2011-11-12 00:00:00+00	Asia/Dubai
2867	5	Q3	\N	f	1	857	session_zEcjDW0z	f	2011-11-12 00:00:00+00	Asia/Dubai
2868	1	FP1	\N	f	1	857	session_a1tdy1HX	f	2011-11-11 00:00:00+00	Asia/Dubai
2869	2	FP2	\N	f	1	857	session_EkRXxsOK	f	2011-11-11 00:00:00+00	Asia/Dubai
2857	7	R	\N	f	16	856	session_HSCe4QXT	t	2011-10-30 09:30:00+00	Asia/Kolkata
2858	3	Q1	\N	f	1	856	session_cVOWxKWF	f	2011-10-29 00:00:00+00	Asia/Kolkata
2859	4	Q2	\N	f	1	856	session_HnQApofg	f	2011-10-29 00:00:00+00	Asia/Kolkata
2860	5	Q3	\N	f	1	856	session_7jKUdmyM	f	2011-10-29 00:00:00+00	Asia/Kolkata
2861	1	FP1	\N	f	1	856	session_DtpmgB7R	f	2011-10-28 00:00:00+00	Asia/Kolkata
2862	2	FP2	\N	f	1	856	session_SR3bwbwD	f	2011-10-28 00:00:00+00	Asia/Kolkata
2885	7	R	\N	f	16	860	session_BJkGkVBs	t	2012-03-25 08:00:00+00	Asia/Kuala_Lumpur
2886	3	Q1	\N	f	1	860	session_e94sa2bt	f	2012-03-24 00:00:00+00	Asia/Kuala_Lumpur
2887	4	Q2	\N	f	1	860	session_R2zXhn0I	f	2012-03-24 00:00:00+00	Asia/Kuala_Lumpur
2888	5	Q3	\N	f	1	860	session_6ElRP8a5	f	2012-03-24 00:00:00+00	Asia/Kuala_Lumpur
2889	1	FP1	\N	f	1	860	session_sd7emoBw	f	2012-03-23 00:00:00+00	Asia/Kuala_Lumpur
2890	2	FP2	\N	f	1	860	session_R156Vx8g	f	2012-03-23 00:00:00+00	Asia/Kuala_Lumpur
2850	7	R	\N	f	16	855	session_Kyw8vHR6	t	2011-10-16 06:00:00+00	Asia/Seoul
2851	3	Q1	\N	f	1	855	session_JPtFadWf	f	2011-10-15 00:00:00+00	Asia/Seoul
2852	4	Q2	\N	f	1	855	session_Z8f91UHW	f	2011-10-15 00:00:00+00	Asia/Seoul
2853	5	Q3	\N	f	1	855	session_0snzFnls	f	2011-10-15 00:00:00+00	Asia/Seoul
2854	1	FP1	\N	f	1	855	session_ACbCY869	f	2011-10-14 00:00:00+00	Asia/Seoul
2855	2	FP2	\N	f	1	855	session_JnppgCtK	f	2011-10-14 00:00:00+00	Asia/Seoul
2856	6	FP3	\N	f	1	855	session_htozJgbz	f	2011-10-15 00:00:00+00	Asia/Seoul
2892	7	R	\N	f	16	861	session_EREBDEof	t	2012-04-15 07:00:00+00	Asia/Shanghai
2893	3	Q1	\N	f	1	861	session_eVDhP6rX	f	2012-04-14 00:00:00+00	Asia/Shanghai
2894	4	Q2	\N	f	1	861	session_4ZAgEkdG	f	2012-04-14 00:00:00+00	Asia/Shanghai
2895	5	Q3	\N	f	1	861	session_Nvl03SvH	f	2012-04-14 00:00:00+00	Asia/Shanghai
2896	1	FP1	\N	f	1	861	session_yjnJAjZ1	f	2012-04-13 00:00:00+00	Asia/Shanghai
2897	2	FP2	\N	f	1	861	session_0Z9regJx	f	2012-04-13 00:00:00+00	Asia/Shanghai
2840	1	FP1	\N	f	1	853	session_zQRVB0m1	f	2011-09-23 00:00:00+00	Asia/Singapore
2841	2	FP2	\N	f	1	853	session_BpvvLjGD	f	2011-09-23 00:00:00+00	Asia/Singapore
2842	6	FP3	\N	f	1	853	session_IKqxovbf	f	2011-09-24 00:00:00+00	Asia/Singapore
2843	7	R	\N	f	16	854	session_5f8hxjpL	t	2011-10-09 06:00:00+00	Asia/Tokyo
2844	3	Q1	\N	f	1	854	session_1ogLpNvy	f	2011-10-08 00:00:00+00	Asia/Tokyo
2845	4	Q2	\N	f	1	854	session_449uSvKs	f	2011-10-08 00:00:00+00	Asia/Tokyo
2846	5	Q3	\N	f	1	854	session_7gZF1bSa	f	2011-10-08 00:00:00+00	Asia/Tokyo
2847	1	FP1	\N	f	1	854	session_0qrivXu2	f	2011-10-07 00:00:00+00	Asia/Tokyo
2848	2	FP2	\N	f	1	854	session_340XA6C8	f	2011-10-07 00:00:00+00	Asia/Tokyo
2878	7	R	\N	f	16	859	session_LRCeeLKm	t	2012-03-18 06:00:00+00	Australia/Melbourne
2879	3	Q1	\N	f	1	859	session_rDBjpusK	f	2012-03-17 00:00:00+00	Australia/Melbourne
2880	4	Q2	\N	f	1	859	session_bfIdgIDt	f	2012-03-17 00:00:00+00	Australia/Melbourne
2881	5	Q3	\N	f	1	859	session_ncR6XqDc	f	2012-03-17 00:00:00+00	Australia/Melbourne
2882	1	FP1	\N	f	1	859	session_z7i99G8C	f	2012-03-16 00:00:00+00	Australia/Melbourne
2883	2	FP2	\N	f	1	859	session_Uc5lOz23	f	2012-03-16 00:00:00+00	Australia/Melbourne
2906	7	R	\N	f	16	863	session_nEMB2Cig	t	2012-05-13 12:00:00+00	Europe/Madrid
2907	3	Q1	\N	f	1	863	session_yChN7QE8	f	2012-05-12 00:00:00+00	Europe/Madrid
2908	4	Q2	\N	f	1	863	session_99Z8OJ4B	f	2012-05-12 00:00:00+00	Europe/Madrid
2909	5	Q3	\N	f	1	863	session_VHvZgvTe	f	2012-05-12 00:00:00+00	Europe/Madrid
2910	1	FP1	\N	f	1	863	session_F1V28xGf	f	2012-05-11 00:00:00+00	Europe/Madrid
2911	2	FP2	\N	f	1	863	session_ht60vm7F	f	2012-05-11 00:00:00+00	Europe/Madrid
2913	7	R	\N	f	16	864	session_zacLItcO	t	2012-05-27 12:00:00+00	Europe/Monaco
2899	7	R	\N	f	16	862	session_IcQTy2av	t	2012-04-22 12:00:00+00	Asia/Bahrain
2900	3	Q1	\N	f	1	862	session_t7dXiJdF	f	2012-04-21 00:00:00+00	Asia/Bahrain
2901	4	Q2	\N	f	1	862	session_Ygw00l8l	f	2012-04-21 00:00:00+00	Asia/Bahrain
2902	5	Q3	\N	f	1	862	session_FhXnbbun	f	2012-04-21 00:00:00+00	Asia/Bahrain
2903	1	FP1	\N	f	1	862	session_pljXYdoV	f	2012-04-20 00:00:00+00	Asia/Bahrain
2904	2	FP2	\N	f	1	862	session_j1WsspxG	f	2012-04-20 00:00:00+00	Asia/Bahrain
2905	6	FP3	\N	f	1	862	session_rMxlXXNx	f	2012-04-21 00:00:00+00	Asia/Bahrain
2969	7	R	\N	f	16	872	session_oYAG8Wof	t	2012-09-23 12:00:00+00	Asia/Singapore
2970	3	Q1	\N	f	1	872	session_1mBfmc1b	f	2012-09-22 00:00:00+00	Asia/Singapore
2971	4	Q2	\N	f	1	872	session_dOdmQEZF	f	2012-09-22 00:00:00+00	Asia/Singapore
2972	5	Q3	\N	f	1	872	session_xWhxS3O3	f	2012-09-22 00:00:00+00	Asia/Singapore
2973	1	FP1	\N	f	1	872	session_gxODBH8s	f	2012-09-21 00:00:00+00	Asia/Singapore
2976	7	R	\N	f	16	873	session_O6kM60XY	t	2012-10-07 06:00:00+00	Asia/Tokyo
2977	3	Q1	\N	f	1	873	session_vXQNhVlB	f	2012-10-06 00:00:00+00	Asia/Tokyo
2978	4	Q2	\N	f	1	873	session_Qb1xh1a4	f	2012-10-06 00:00:00+00	Asia/Tokyo
2979	5	Q3	\N	f	1	873	session_UOKAc9SU	f	2012-10-06 00:00:00+00	Asia/Tokyo
2980	1	FP1	\N	f	1	873	session_OibspSHe	f	2012-10-05 00:00:00+00	Asia/Tokyo
2981	2	FP2	\N	f	1	873	session_r9acUMC9	f	2012-10-05 00:00:00+00	Asia/Tokyo
2941	7	R	\N	f	16	868	session_rRtAgjEP	t	2012-07-22 12:00:00+00	Europe/Berlin
2942	3	Q1	\N	f	1	868	session_x9B7MY0W	f	2012-07-21 00:00:00+00	Europe/Berlin
2943	4	Q2	\N	f	1	868	session_tjzczyXL	f	2012-07-21 00:00:00+00	Europe/Berlin
2944	5	Q3	\N	f	1	868	session_5U6Nbjyu	f	2012-07-21 00:00:00+00	Europe/Berlin
2945	1	FP1	\N	f	1	868	session_b2VUJHAz	f	2012-07-20 00:00:00+00	Europe/Berlin
2946	2	FP2	\N	f	1	868	session_9KouEmWG	f	2012-07-20 00:00:00+00	Europe/Berlin
2955	7	R	\N	f	16	870	session_qDukz8xC	t	2012-09-02 12:00:00+00	Europe/Brussels
2956	3	Q1	\N	f	1	870	session_21B5Qgdr	f	2012-09-01 00:00:00+00	Europe/Brussels
2957	4	Q2	\N	f	1	870	session_vGKdCHD0	f	2012-09-01 00:00:00+00	Europe/Brussels
2958	5	Q3	\N	f	1	870	session_hVZmLguM	f	2012-09-01 00:00:00+00	Europe/Brussels
2959	1	FP1	\N	f	1	870	session_D7DLU04x	f	2012-08-31 00:00:00+00	Europe/Brussels
2960	2	FP2	\N	f	1	870	session_4DO82rWe	f	2012-08-31 00:00:00+00	Europe/Brussels
2948	7	R	\N	f	16	869	session_EM5QKEfa	t	2012-07-29 12:00:00+00	Europe/Budapest
2949	3	Q1	\N	f	1	869	session_NGw1tn8S	f	2012-07-28 00:00:00+00	Europe/Budapest
2950	4	Q2	\N	f	1	869	session_hSFLViOm	f	2012-07-28 00:00:00+00	Europe/Budapest
2951	5	Q3	\N	f	1	869	session_I62ydGNG	f	2012-07-28 00:00:00+00	Europe/Budapest
2952	1	FP1	\N	f	1	869	session_VJu5xAim	f	2012-07-27 00:00:00+00	Europe/Budapest
2953	2	FP2	\N	f	1	869	session_lWyuwys0	f	2012-07-27 00:00:00+00	Europe/Budapest
2954	6	FP3	\N	f	1	869	session_JPQs4ewv	f	2012-07-28 00:00:00+00	Europe/Budapest
2934	7	R	\N	f	16	867	session_iCB8UEKB	t	2012-07-08 12:00:00+00	Europe/London
2935	3	Q1	\N	f	1	867	session_ea4lEjG5	f	2012-07-07 00:00:00+00	Europe/London
2936	4	Q2	\N	f	1	867	session_ZTlNsODq	f	2012-07-07 00:00:00+00	Europe/London
2937	5	Q3	\N	f	1	867	session_6VV0U8jO	f	2012-07-07 00:00:00+00	Europe/London
2938	1	FP1	\N	f	1	867	session_BNcjNfa6	f	2012-07-06 00:00:00+00	Europe/London
2939	2	FP2	\N	f	1	867	session_unlJoU9h	f	2012-07-06 00:00:00+00	Europe/London
2927	7	R	\N	f	16	866	session_Vae2u2vG	t	2012-06-24 12:00:00+00	Europe/Madrid
2928	3	Q1	\N	f	1	866	session_R28oWdvp	f	2012-06-23 00:00:00+00	Europe/Madrid
2929	4	Q2	\N	f	1	866	session_VnHTzGkA	f	2012-06-23 00:00:00+00	Europe/Madrid
2930	5	Q3	\N	f	1	866	session_LlKtw3FF	f	2012-06-23 00:00:00+00	Europe/Madrid
2931	1	FP1	\N	f	1	866	session_fG0HQALG	f	2012-06-22 00:00:00+00	Europe/Madrid
2932	2	FP2	\N	f	1	866	session_3lwMPY1K	f	2012-06-22 00:00:00+00	Europe/Madrid
2914	3	Q1	\N	f	1	864	session_3Ogf2eK4	f	2012-05-26 00:00:00+00	Europe/Monaco
2915	4	Q2	\N	f	1	864	session_b7zPckGe	f	2012-05-26 00:00:00+00	Europe/Monaco
2916	5	Q3	\N	f	1	864	session_xhAdDMKS	f	2012-05-26 00:00:00+00	Europe/Monaco
2917	1	FP1	\N	f	1	864	session_alSVWwRO	f	2012-05-24 00:00:00+00	Europe/Monaco
2918	2	FP2	\N	f	1	864	session_x1tVMmpN	f	2012-05-24 00:00:00+00	Europe/Monaco
2919	6	FP3	\N	f	1	864	session_RwE0QjsF	f	2012-05-26 00:00:00+00	Europe/Monaco
2962	7	R	\N	f	16	871	session_nDI8zOpQ	t	2012-09-09 12:00:00+00	Europe/Rome
2963	3	Q1	\N	f	1	871	session_cz7ymJS5	f	2012-09-08 00:00:00+00	Europe/Rome
2964	4	Q2	\N	f	1	871	session_Q6Weu2V2	f	2012-09-08 00:00:00+00	Europe/Rome
2965	5	Q3	\N	f	1	871	session_SBReTdsJ	f	2012-09-08 00:00:00+00	Europe/Rome
2966	1	FP1	\N	f	1	871	session_nd6gStQy	f	2012-09-07 00:00:00+00	Europe/Rome
2967	2	FP2	\N	f	1	871	session_gNBm0Aw2	f	2012-09-07 00:00:00+00	Europe/Rome
2983	7	R	\N	f	16	874	session_jP3hVTGu	t	2012-10-14 06:00:00+00	Asia/Seoul
2984	3	Q1	\N	f	1	874	session_Z4Kh3I8O	f	2012-10-13 00:00:00+00	Asia/Seoul
2985	4	Q2	\N	f	1	874	session_xEnyZTlr	f	2012-10-13 00:00:00+00	Asia/Seoul
2986	5	Q3	\N	f	1	874	session_xEYyyv4E	f	2012-10-13 00:00:00+00	Asia/Seoul
2987	1	FP1	\N	f	1	874	session_9tukvs7l	f	2012-10-12 00:00:00+00	Asia/Seoul
2974	2	FP2	\N	f	1	872	session_fX3ae58k	f	2012-09-21 00:00:00+00	Asia/Singapore
3011	7	R	\N	f	16	878	session_MejpPVV8	t	2012-11-25 16:00:00+00	America/Sao_Paulo
3012	3	Q1	\N	f	1	878	session_aC6HchlW	f	2012-11-24 00:00:00+00	America/Sao_Paulo
3039	7	R	\N	f	16	882	session_fe3gXGCp	t	2013-04-21 12:00:00+00	Asia/Bahrain
3040	3	Q1	\N	f	1	882	session_4TakY4Qu	f	2013-04-20 00:00:00+00	Asia/Bahrain
3041	4	Q2	\N	f	1	882	session_6ChXUDZ3	f	2013-04-20 00:00:00+00	Asia/Bahrain
3042	5	Q3	\N	f	1	882	session_XXernH42	f	2013-04-20 00:00:00+00	Asia/Bahrain
3043	1	FP1	\N	f	1	882	session_5soLAiS2	f	2013-04-19 00:00:00+00	Asia/Bahrain
3044	2	FP2	\N	f	1	882	session_LRUSbgdG	f	2013-04-19 00:00:00+00	Asia/Bahrain
2997	7	R	\N	f	16	876	session_48Yf9rMU	t	2012-11-04 13:00:00+00	Asia/Dubai
2998	3	Q1	\N	f	1	876	session_fUiTtWOl	f	2012-11-03 00:00:00+00	Asia/Dubai
2999	4	Q2	\N	f	1	876	session_abTaiQ7j	f	2012-11-03 00:00:00+00	Asia/Dubai
3000	5	Q3	\N	f	1	876	session_wEgONST7	f	2012-11-03 00:00:00+00	Asia/Dubai
3001	1	FP1	\N	f	1	876	session_zD8MC4Xg	f	2012-11-02 00:00:00+00	Asia/Dubai
3002	2	FP2	\N	f	1	876	session_iANtQO8E	f	2012-11-02 00:00:00+00	Asia/Dubai
2990	7	R	\N	f	16	875	session_80EQzzZ8	t	2012-10-28 09:30:00+00	Asia/Kolkata
2991	3	Q1	\N	f	1	875	session_7aD6Ghrx	f	2012-10-27 00:00:00+00	Asia/Kolkata
2992	4	Q2	\N	f	1	875	session_PKsGHlxY	f	2012-10-27 00:00:00+00	Asia/Kolkata
2993	5	Q3	\N	f	1	875	session_1Oo7IQ5l	f	2012-10-27 00:00:00+00	Asia/Kolkata
2994	1	FP1	\N	f	1	875	session_xrtVnIMv	f	2012-10-26 00:00:00+00	Asia/Kolkata
2995	2	FP2	\N	f	1	875	session_9J4aF9vX	f	2012-10-26 00:00:00+00	Asia/Kolkata
3025	7	R	\N	f	16	880	session_Ccz3Y8n8	t	2013-03-24 08:00:00+00	Asia/Kuala_Lumpur
3026	3	Q1	\N	f	1	880	session_J0WfCMEt	f	2013-03-23 00:00:00+00	Asia/Kuala_Lumpur
3027	4	Q2	\N	f	1	880	session_8t6RoGdz	f	2013-03-23 00:00:00+00	Asia/Kuala_Lumpur
3028	5	Q3	\N	f	1	880	session_VygD52ZU	f	2013-03-23 00:00:00+00	Asia/Kuala_Lumpur
3029	1	FP1	\N	f	1	880	session_bnQyLxp5	f	2013-03-22 00:00:00+00	Asia/Kuala_Lumpur
3030	2	FP2	\N	f	1	880	session_LmYYj6tO	f	2013-03-22 00:00:00+00	Asia/Kuala_Lumpur
2988	2	FP2	\N	f	1	874	session_GxU2TymC	f	2012-10-12 00:00:00+00	Asia/Seoul
2989	6	FP3	\N	f	1	874	session_dL60aUzk	f	2012-10-13 00:00:00+00	Asia/Seoul
3032	7	R	\N	f	16	881	session_4SL75OMe	t	2013-04-14 07:00:00+00	Asia/Shanghai
3033	3	Q1	\N	f	1	881	session_8F8v0Aid	f	2013-04-13 00:00:00+00	Asia/Shanghai
3034	4	Q2	\N	f	1	881	session_gN8NgFDB	f	2013-04-13 00:00:00+00	Asia/Shanghai
3035	5	Q3	\N	f	1	881	session_mgfWxbK1	f	2013-04-13 00:00:00+00	Asia/Shanghai
3036	1	FP1	\N	f	1	881	session_jTdOca7V	f	2013-04-12 00:00:00+00	Asia/Shanghai
3037	2	FP2	\N	f	1	881	session_FtaAxQeT	f	2013-04-12 00:00:00+00	Asia/Shanghai
3018	7	R	\N	f	16	879	session_cV67Ease	t	2013-03-17 06:00:00+00	Australia/Melbourne
3019	3	Q1	\N	f	1	879	session_HEZCs54w	f	2013-03-16 00:00:00+00	Australia/Melbourne
3020	4	Q2	\N	f	1	879	session_dYADqDjq	f	2013-03-16 00:00:00+00	Australia/Melbourne
3021	5	Q3	\N	f	1	879	session_DqIu5dAx	f	2013-03-16 00:00:00+00	Australia/Melbourne
3022	1	FP1	\N	f	1	879	session_xuMRelJe	f	2013-03-15 00:00:00+00	Australia/Melbourne
3023	2	FP2	\N	f	1	879	session_K2miZc6H	f	2013-03-15 00:00:00+00	Australia/Melbourne
3046	7	R	\N	f	16	883	session_tgC1WOiM	t	2013-05-12 12:00:00+00	Europe/Madrid
3047	3	Q1	\N	f	1	883	session_63WfDViI	f	2013-05-11 00:00:00+00	Europe/Madrid
3048	4	Q2	\N	f	1	883	session_Jff9yZQV	f	2013-05-11 00:00:00+00	Europe/Madrid
3049	5	Q3	\N	f	1	883	session_411GIoUW	f	2013-05-11 00:00:00+00	Europe/Madrid
3050	1	FP1	\N	f	1	883	session_N398DDIZ	f	2013-05-10 00:00:00+00	Europe/Madrid
3051	2	FP2	\N	f	1	883	session_fgxP1CSt	f	2013-05-10 00:00:00+00	Europe/Madrid
3053	7	R	\N	f	16	884	session_qZM2XLrM	t	2013-05-26 12:00:00+00	Europe/Monaco
3054	3	Q1	\N	f	1	884	session_2ZSN25Jx	f	2013-05-25 00:00:00+00	Europe/Monaco
3055	4	Q2	\N	f	1	884	session_EYOpX2Mc	f	2013-05-25 00:00:00+00	Europe/Monaco
3056	5	Q3	\N	f	1	884	session_BxqNegYV	f	2013-05-25 00:00:00+00	Europe/Monaco
3057	1	FP1	\N	f	1	884	session_nbEqfsCA	f	2013-05-23 00:00:00+00	Europe/Monaco
3058	2	FP2	\N	f	1	884	session_awnemfSQ	f	2013-05-23 00:00:00+00	Europe/Monaco
3059	6	FP3	\N	f	1	884	session_qHYJIloz	f	2013-05-25 00:00:00+00	Europe/Monaco
3060	7	R	\N	f	16	885	session_mry0TmAw	t	2013-06-09 18:00:00+00	America/Montreal
3061	3	Q1	\N	f	1	885	session_TXQREbrh	f	2013-06-08 00:00:00+00	America/Montreal
3013	4	Q2	\N	f	1	878	session_vS3hxCa5	f	2012-11-24 00:00:00+00	America/Sao_Paulo
3014	5	Q3	\N	f	1	878	session_MvjFdJy4	f	2012-11-24 00:00:00+00	America/Sao_Paulo
3015	1	FP1	\N	f	1	878	session_lUuVeGzh	f	2012-11-23 00:00:00+00	America/Sao_Paulo
3016	2	FP2	\N	f	1	878	session_gh0F22D8	f	2012-11-23 00:00:00+00	America/Sao_Paulo
3123	7	R	\N	f	16	894	session_6CfOnbaj	t	2013-10-27 09:30:00+00	Asia/Kolkata
3124	3	Q1	\N	f	1	894	session_r2kXqWsK	f	2013-10-26 00:00:00+00	Asia/Kolkata
3125	4	Q2	\N	f	1	894	session_8esbX3jI	f	2013-10-26 00:00:00+00	Asia/Kolkata
3126	5	Q3	\N	f	1	894	session_XYov2OlZ	f	2013-10-26 00:00:00+00	Asia/Kolkata
3127	1	FP1	\N	f	1	894	session_rxXSqLIb	f	2013-10-25 00:00:00+00	Asia/Kolkata
3109	7	R	\N	f	16	892	session_KQ8AIl0O	t	2013-10-06 06:00:00+00	Asia/Seoul
3110	3	Q1	\N	f	1	892	session_XNXVy5lG	f	2013-10-05 00:00:00+00	Asia/Seoul
3111	4	Q2	\N	f	1	892	session_KQ2sQ66e	f	2013-10-05 00:00:00+00	Asia/Seoul
3112	5	Q3	\N	f	1	892	session_AMjYGlKZ	f	2013-10-05 00:00:00+00	Asia/Seoul
3113	1	FP1	\N	f	1	892	session_6LatyPLL	f	2013-10-04 00:00:00+00	Asia/Seoul
3102	7	R	\N	f	16	891	session_AZwZ0Kkr	t	2013-09-22 12:00:00+00	Asia/Singapore
3103	3	Q1	\N	f	1	891	session_VKSD2mFW	f	2013-09-21 00:00:00+00	Asia/Singapore
3104	4	Q2	\N	f	1	891	session_BM3C5AG7	f	2013-09-21 00:00:00+00	Asia/Singapore
3105	5	Q3	\N	f	1	891	session_IyKwHbJX	f	2013-09-21 00:00:00+00	Asia/Singapore
3106	1	FP1	\N	f	1	891	session_HB1fhEGE	f	2013-09-20 00:00:00+00	Asia/Singapore
3107	2	FP2	\N	f	1	891	session_NVVMJcRd	f	2013-09-20 00:00:00+00	Asia/Singapore
3116	7	R	\N	f	16	893	session_Yjuy56Lz	t	2013-10-13 06:00:00+00	Asia/Tokyo
3117	3	Q1	\N	f	1	893	session_fy2TPRfh	f	2013-10-12 00:00:00+00	Asia/Tokyo
3118	4	Q2	\N	f	1	893	session_4sw6uDQe	f	2013-10-12 00:00:00+00	Asia/Tokyo
3119	5	Q3	\N	f	1	893	session_ZX2296L3	f	2013-10-12 00:00:00+00	Asia/Tokyo
3120	1	FP1	\N	f	1	893	session_ssNCgKH1	f	2013-10-11 00:00:00+00	Asia/Tokyo
3121	2	FP2	\N	f	1	893	session_rxMWzmay	f	2013-10-11 00:00:00+00	Asia/Tokyo
3074	7	R	\N	f	16	887	session_y3ofe7bw	t	2013-07-07 12:00:00+00	Europe/Berlin
3075	3	Q1	\N	f	1	887	session_j39MjUTk	f	2013-07-06 00:00:00+00	Europe/Berlin
3076	4	Q2	\N	f	1	887	session_2V7TXnQI	f	2013-07-06 00:00:00+00	Europe/Berlin
3077	5	Q3	\N	f	1	887	session_t7KYXPez	f	2013-07-06 00:00:00+00	Europe/Berlin
3078	1	FP1	\N	f	1	887	session_II1dZSvm	f	2013-07-05 00:00:00+00	Europe/Berlin
3079	2	FP2	\N	f	1	887	session_gumboLLB	f	2013-07-05 00:00:00+00	Europe/Berlin
3080	6	FP3	\N	f	1	887	session_zaoTu1ff	f	2013-07-06 00:00:00+00	Europe/Berlin
3088	7	R	\N	f	16	889	session_nJLH53XR	t	2013-08-25 12:00:00+00	Europe/Brussels
3089	3	Q1	\N	f	1	889	session_4RjcfG0a	f	2013-08-24 00:00:00+00	Europe/Brussels
3090	4	Q2	\N	f	1	889	session_Qt1Ql4RY	f	2013-08-24 00:00:00+00	Europe/Brussels
3091	5	Q3	\N	f	1	889	session_SsD9vBps	f	2013-08-24 00:00:00+00	Europe/Brussels
3092	1	FP1	\N	f	1	889	session_2ggXZUD7	f	2013-08-23 00:00:00+00	Europe/Brussels
3093	2	FP2	\N	f	1	889	session_JjRG489n	f	2013-08-23 00:00:00+00	Europe/Brussels
3081	7	R	\N	f	16	888	session_sYO1c3y5	t	2013-07-28 12:00:00+00	Europe/Budapest
3082	3	Q1	\N	f	1	888	session_dxGqYftA	f	2013-07-27 00:00:00+00	Europe/Budapest
3083	4	Q2	\N	f	1	888	session_5ZUAH1VT	f	2013-07-27 00:00:00+00	Europe/Budapest
3084	5	Q3	\N	f	1	888	session_nxRug88f	f	2013-07-27 00:00:00+00	Europe/Budapest
3085	1	FP1	\N	f	1	888	session_gbmxQPZN	f	2013-07-26 00:00:00+00	Europe/Budapest
3086	2	FP2	\N	f	1	888	session_AY4mJCB2	f	2013-07-26 00:00:00+00	Europe/Budapest
3067	7	R	\N	f	16	886	session_iGY2NVIL	t	2013-06-30 12:00:00+00	Europe/London
3068	3	Q1	\N	f	1	886	session_0N9ZlBL1	f	2013-06-29 00:00:00+00	Europe/London
3069	4	Q2	\N	f	1	886	session_NAlbWwyc	f	2013-06-29 00:00:00+00	Europe/London
3070	5	Q3	\N	f	1	886	session_X9IMeBUZ	f	2013-06-29 00:00:00+00	Europe/London
3071	1	FP1	\N	f	1	886	session_vVnPI6Xp	f	2013-06-28 00:00:00+00	Europe/London
3072	2	FP2	\N	f	1	886	session_glkXPAng	f	2013-06-28 00:00:00+00	Europe/London
3073	6	FP3	\N	f	1	886	session_6fTaTYDA	f	2013-06-29 00:00:00+00	Europe/London
3095	7	R	\N	f	16	890	session_gReoTWpt	t	2013-09-08 12:00:00+00	Europe/Rome
3096	3	Q1	\N	f	1	890	session_oxm62V1r	f	2013-09-07 00:00:00+00	Europe/Rome
3097	4	Q2	\N	f	1	890	session_EaGiYT9J	f	2013-09-07 00:00:00+00	Europe/Rome
3098	5	Q3	\N	f	1	890	session_Lbc8BvXx	f	2013-09-07 00:00:00+00	Europe/Rome
3099	1	FP1	\N	f	1	890	session_kcE3gxiE	f	2013-09-06 00:00:00+00	Europe/Rome
3100	2	FP2	\N	f	1	890	session_R7ObgRel	f	2013-09-06 00:00:00+00	Europe/Rome
3130	7	R	\N	f	16	895	session_fbo1X1fF	t	2013-11-03 13:00:00+00	Asia/Dubai
3131	3	Q1	\N	f	1	895	session_aaIyH1WO	f	2013-11-02 00:00:00+00	Asia/Dubai
3132	4	Q2	\N	f	1	895	session_7oL60VTA	f	2013-11-02 00:00:00+00	Asia/Dubai
3133	5	Q3	\N	f	1	895	session_oSGWCVmB	f	2013-11-02 00:00:00+00	Asia/Dubai
3134	1	FP1	\N	f	1	895	session_OYLirzc5	f	2013-11-01 00:00:00+00	Asia/Dubai
3114	2	FP2	\N	f	1	892	session_7QeYlJnY	f	2013-10-04 00:00:00+00	Asia/Seoul
3144	7	R	\N	f	16	897	session_MWajbaLQ	t	2013-11-24 16:00:00+00	America/Sao_Paulo
3145	3	Q1	\N	f	1	897	session_W962uFAG	f	2013-11-23 00:00:00+00	America/Sao_Paulo
3146	4	Q2	\N	f	1	897	session_oF7efYn1	f	2013-11-23 00:00:00+00	America/Sao_Paulo
3147	5	Q3	\N	f	1	897	session_j0IdqpTU	f	2013-11-23 00:00:00+00	America/Sao_Paulo
3148	1	FP1	\N	f	1	897	session_VQjcfjjE	f	2013-11-22 00:00:00+00	America/Sao_Paulo
3149	2	FP2	\N	f	1	897	session_cTxnGpZA	f	2013-11-22 00:00:00+00	America/Sao_Paulo
3165	7	R	\N	f	16	900	session_tVZcUkqA	t	2014-04-06 15:00:00+00	Asia/Bahrain
3166	3	Q1	\N	f	1	900	session_uInUmeXa	f	2014-04-05 00:00:00+00	Asia/Bahrain
3167	4	Q2	\N	f	1	900	session_KXkSbdux	f	2014-04-05 00:00:00+00	Asia/Bahrain
3168	5	Q3	\N	f	1	900	session_TfbHSnxU	f	2014-04-05 00:00:00+00	Asia/Bahrain
3169	1	FP1	\N	f	1	900	session_o7hqUeNU	f	2014-04-04 00:00:00+00	Asia/Bahrain
3170	2	FP2	\N	f	1	900	session_sBorH0v9	f	2014-04-04 00:00:00+00	Asia/Bahrain
3136	6	FP3	\N	f	1	895	session_V2P4PYo1	f	2013-11-02 00:00:00+00	Asia/Dubai
3158	7	R	\N	f	16	899	session_rYBPRp65	t	2014-03-30 08:00:00+00	Asia/Kuala_Lumpur
3159	3	Q1	\N	f	1	899	session_YRrCmFqW	f	2014-03-29 00:00:00+00	Asia/Kuala_Lumpur
3160	4	Q2	\N	f	1	899	session_CaNcRk65	f	2014-03-29 00:00:00+00	Asia/Kuala_Lumpur
3161	5	Q3	\N	f	1	899	session_MkOxkoVX	f	2014-03-29 00:00:00+00	Asia/Kuala_Lumpur
3162	1	FP1	\N	f	1	899	session_QwWOZeKa	f	2014-03-28 00:00:00+00	Asia/Kuala_Lumpur
3163	2	FP2	\N	f	1	899	session_sBNMmNiS	f	2014-03-28 00:00:00+00	Asia/Kuala_Lumpur
3172	7	R	\N	f	16	901	session_BoeMYoqp	t	2014-04-20 07:00:00+00	Asia/Shanghai
3173	3	Q1	\N	f	1	901	session_12eMY1zb	f	2014-04-19 00:00:00+00	Asia/Shanghai
3174	4	Q2	\N	f	1	901	session_k9ysofs6	f	2014-04-19 00:00:00+00	Asia/Shanghai
3175	5	Q3	\N	f	1	901	session_Nl3XWagb	f	2014-04-19 00:00:00+00	Asia/Shanghai
3176	1	FP1	\N	f	1	901	session_E6wRawHY	f	2014-04-18 00:00:00+00	Asia/Shanghai
3177	2	FP2	\N	f	1	901	session_gXLowUb1	f	2014-04-18 00:00:00+00	Asia/Shanghai
3151	7	R	\N	f	16	898	session_ibaZACdd	t	2014-03-16 06:00:00+00	Australia/Melbourne
3152	3	Q1	\N	f	1	898	session_IOTb4tN9	f	2014-03-15 00:00:00+00	Australia/Melbourne
3153	4	Q2	\N	f	1	898	session_FVN4VCf6	f	2014-03-15 00:00:00+00	Australia/Melbourne
3154	5	Q3	\N	f	1	898	session_NHluh8Px	f	2014-03-15 00:00:00+00	Australia/Melbourne
3155	1	FP1	\N	f	1	898	session_XXDgy7EY	f	2014-03-14 00:00:00+00	Australia/Melbourne
3156	2	FP2	\N	f	1	898	session_bIZZozKb	f	2014-03-14 00:00:00+00	Australia/Melbourne
3207	7	R	\N	f	16	906	session_RouPbdon	t	2014-07-06 12:00:00+00	Europe/London
3208	3	Q1	\N	f	1	906	session_r8VShVsw	f	2014-07-05 00:00:00+00	Europe/London
3209	4	Q2	\N	f	1	906	session_QvvzTEqZ	f	2014-07-05 00:00:00+00	Europe/London
3179	7	R	\N	f	16	902	session_SNSjYmO8	t	2014-05-11 12:00:00+00	Europe/Madrid
3180	3	Q1	\N	f	1	902	session_MllYmAUm	f	2014-05-10 00:00:00+00	Europe/Madrid
3181	4	Q2	\N	f	1	902	session_bfEXDIFo	f	2014-05-10 00:00:00+00	Europe/Madrid
3182	5	Q3	\N	f	1	902	session_v5h2rtGa	f	2014-05-10 00:00:00+00	Europe/Madrid
3183	1	FP1	\N	f	1	902	session_XW5Wp8Tc	f	2014-05-09 00:00:00+00	Europe/Madrid
3184	2	FP2	\N	f	1	902	session_QcVJLPfS	f	2014-05-09 00:00:00+00	Europe/Madrid
3186	7	R	\N	f	16	903	session_RK28JEpB	t	2014-05-25 12:00:00+00	Europe/Monaco
3187	3	Q1	\N	f	1	903	session_GLAGd1yB	f	2014-05-24 00:00:00+00	Europe/Monaco
3188	4	Q2	\N	f	1	903	session_IEGqfBmX	f	2014-05-24 00:00:00+00	Europe/Monaco
3189	5	Q3	\N	f	1	903	session_lg93ejpd	f	2014-05-24 00:00:00+00	Europe/Monaco
3190	1	FP1	\N	f	1	903	session_nfJPKESm	f	2014-05-22 00:00:00+00	Europe/Monaco
3191	2	FP2	\N	f	1	903	session_0uXb76yD	f	2014-05-22 00:00:00+00	Europe/Monaco
3200	7	R	\N	f	16	905	session_rVyrCGjB	t	2014-06-22 12:00:00+00	Europe/Vienna
3201	3	Q1	\N	f	1	905	session_EoBLytii	f	2014-06-21 00:00:00+00	Europe/Vienna
3202	4	Q2	\N	f	1	905	session_VUiM0XXe	f	2014-06-21 00:00:00+00	Europe/Vienna
3203	5	Q3	\N	f	1	905	session_a862B2lR	f	2014-06-21 00:00:00+00	Europe/Vienna
3204	1	FP1	\N	f	1	905	session_GhXfgTdo	f	2014-06-20 00:00:00+00	Europe/Vienna
3205	2	FP2	\N	f	1	905	session_cOm4ddob	f	2014-06-20 00:00:00+00	Europe/Vienna
3193	7	R	\N	f	16	904	session_VJMPgT0Q	t	2014-06-08 18:00:00+00	America/Montreal
3194	3	Q1	\N	f	1	904	session_IGVD6mF9	f	2014-06-07 00:00:00+00	America/Montreal
3195	4	Q2	\N	f	1	904	session_AAsk6h05	f	2014-06-07 00:00:00+00	America/Montreal
3196	5	Q3	\N	f	1	904	session_X9hlacAX	f	2014-06-07 00:00:00+00	America/Montreal
3197	1	FP1	\N	f	1	904	session_eDG0WJdg	f	2014-06-06 00:00:00+00	America/Montreal
3198	2	FP2	\N	f	1	904	session_kz99EVAS	f	2014-06-06 00:00:00+00	America/Montreal
3178	6	FP3	\N	f	1	901	session_zhtY7YYG	f	2014-04-19 00:00:00+00	Asia/Shanghai
3277	7	R	\N	f	16	916	session_lcw60767	t	2014-11-23 13:00:00+00	Asia/Dubai
3278	3	Q1	\N	f	1	916	session_iwf4jL1u	f	2014-11-22 00:00:00+00	Asia/Dubai
3279	4	Q2	\N	f	1	916	session_uUdL2CmF	f	2014-11-22 00:00:00+00	Asia/Dubai
3280	5	Q3	\N	f	1	916	session_m5abYY9H	f	2014-11-22 00:00:00+00	Asia/Dubai
3281	1	FP1	\N	f	1	916	session_IxNWIRoC	f	2014-11-21 00:00:00+00	Asia/Dubai
3282	2	FP2	\N	f	1	916	session_mE0Lml3G	f	2014-11-21 00:00:00+00	Asia/Dubai
3242	7	R	\N	f	16	911	session_bPZrQkh6	t	2014-09-21 12:00:00+00	Asia/Singapore
3243	3	Q1	\N	f	1	911	session_KtAhU2T0	f	2014-09-20 00:00:00+00	Asia/Singapore
3244	4	Q2	\N	f	1	911	session_vIaTtWOr	f	2014-09-20 00:00:00+00	Asia/Singapore
3245	5	Q3	\N	f	1	911	session_82WQM8sG	f	2014-09-20 00:00:00+00	Asia/Singapore
3246	1	FP1	\N	f	1	911	session_jo2PxgUc	f	2014-09-19 00:00:00+00	Asia/Singapore
3247	2	FP2	\N	f	1	911	session_k8vDBpdt	f	2014-09-19 00:00:00+00	Asia/Singapore
3249	7	R	\N	f	16	912	session_UB0Pr7Ek	t	2014-10-05 06:00:00+00	Asia/Tokyo
3250	3	Q1	\N	f	1	912	session_XSHyIpPK	f	2014-10-04 00:00:00+00	Asia/Tokyo
3251	4	Q2	\N	f	1	912	session_ncsNRJfS	f	2014-10-04 00:00:00+00	Asia/Tokyo
3252	5	Q3	\N	f	1	912	session_8c2qdp6t	f	2014-10-04 00:00:00+00	Asia/Tokyo
3253	1	FP1	\N	f	1	912	session_yXhE6hLR	f	2014-10-03 00:00:00+00	Asia/Tokyo
3254	2	FP2	\N	f	1	912	session_2LNBFbXI	f	2014-10-03 00:00:00+00	Asia/Tokyo
3214	7	R	\N	f	16	907	session_QomsT5si	t	2014-07-20 12:00:00+00	Europe/Berlin
3215	3	Q1	\N	f	1	907	session_CxV5UApb	f	2014-07-19 00:00:00+00	Europe/Berlin
3216	4	Q2	\N	f	1	907	session_yfnusRRG	f	2014-07-19 00:00:00+00	Europe/Berlin
3217	5	Q3	\N	f	1	907	session_tW9ChfTh	f	2014-07-19 00:00:00+00	Europe/Berlin
3218	1	FP1	\N	f	1	907	session_W0ibvcPl	f	2014-07-18 00:00:00+00	Europe/Berlin
3219	2	FP2	\N	f	1	907	session_SjIuV5fd	f	2014-07-18 00:00:00+00	Europe/Berlin
3220	6	FP3	\N	f	1	907	session_UNQntM1Q	f	2014-07-19 00:00:00+00	Europe/Berlin
3228	7	R	\N	f	16	909	session_LJPY7JvN	t	2014-08-24 12:00:00+00	Europe/Brussels
3229	3	Q1	\N	f	1	909	session_vhpejDSe	f	2014-08-23 00:00:00+00	Europe/Brussels
3230	4	Q2	\N	f	1	909	session_Mlg1nUmd	f	2014-08-23 00:00:00+00	Europe/Brussels
3231	5	Q3	\N	f	1	909	session_X93adcvt	f	2014-08-23 00:00:00+00	Europe/Brussels
3232	1	FP1	\N	f	1	909	session_Bw63D1Ob	f	2014-08-22 00:00:00+00	Europe/Brussels
3233	2	FP2	\N	f	1	909	session_LXhclGXX	f	2014-08-22 00:00:00+00	Europe/Brussels
3221	7	R	\N	f	16	908	session_ev0PGsQS	t	2014-07-27 12:00:00+00	Europe/Budapest
3222	3	Q1	\N	f	1	908	session_4EiXb1Ae	f	2014-07-26 00:00:00+00	Europe/Budapest
3223	4	Q2	\N	f	1	908	session_X00tDgrX	f	2014-07-26 00:00:00+00	Europe/Budapest
3224	5	Q3	\N	f	1	908	session_q8chNJZi	f	2014-07-26 00:00:00+00	Europe/Budapest
3225	1	FP1	\N	f	1	908	session_7KcqBv6x	f	2014-07-25 00:00:00+00	Europe/Budapest
3226	2	FP2	\N	f	1	908	session_VGLqCiu0	f	2014-07-25 00:00:00+00	Europe/Budapest
3210	5	Q3	\N	f	1	906	session_ElONobmv	f	2014-07-05 00:00:00+00	Europe/London
3211	1	FP1	\N	f	1	906	session_TQxRENpR	f	2014-07-04 00:00:00+00	Europe/London
3212	2	FP2	\N	f	1	906	session_UVa2thQm	f	2014-07-04 00:00:00+00	Europe/London
3213	6	FP3	\N	f	1	906	session_f4STpBiV	f	2014-07-05 00:00:00+00	Europe/London
3256	7	R	\N	f	16	913	session_zcPU0lGa	t	2014-10-12 11:00:00+00	Europe/Moscow
3257	3	Q1	\N	f	1	913	session_qpbdGWy4	f	2014-10-11 00:00:00+00	Europe/Moscow
3258	4	Q2	\N	f	1	913	session_GZF3Qmzg	f	2014-10-11 00:00:00+00	Europe/Moscow
3259	5	Q3	\N	f	1	913	session_dEyiIMA2	f	2014-10-11 00:00:00+00	Europe/Moscow
3260	1	FP1	\N	f	1	913	session_TPFmk36c	f	2014-10-10 00:00:00+00	Europe/Moscow
3261	2	FP2	\N	f	1	913	session_CTDte2u8	f	2014-10-10 00:00:00+00	Europe/Moscow
3235	7	R	\N	f	16	910	session_Im2vdhzy	t	2014-09-07 12:00:00+00	Europe/Rome
3236	3	Q1	\N	f	1	910	session_gpckSjrZ	f	2014-09-06 00:00:00+00	Europe/Rome
3237	4	Q2	\N	f	1	910	session_tPkPJkSb	f	2014-09-06 00:00:00+00	Europe/Rome
3238	5	Q3	\N	f	1	910	session_bApGLxEw	f	2014-09-06 00:00:00+00	Europe/Rome
3239	1	FP1	\N	f	1	910	session_0Zg4jWrB	f	2014-09-05 00:00:00+00	Europe/Rome
3240	2	FP2	\N	f	1	910	session_Zimuu0XJ	f	2014-09-05 00:00:00+00	Europe/Rome
3241	6	FP3	\N	f	1	910	session_sn7qRhVT	f	2014-09-06 00:00:00+00	Europe/Rome
3270	7	R	\N	f	16	915	session_mqqgTc1M	t	2014-11-09 16:00:00+00	America/Sao_Paulo
3271	3	Q1	\N	f	1	915	session_1JUUmqiS	f	2014-11-08 00:00:00+00	America/Sao_Paulo
3272	4	Q2	\N	f	1	915	session_0tw6M8rf	f	2014-11-08 00:00:00+00	America/Sao_Paulo
3273	5	Q3	\N	f	1	915	session_JWrGqRCJ	f	2014-11-08 00:00:00+00	America/Sao_Paulo
3274	1	FP1	\N	f	1	915	session_5o7V0Uyn	f	2014-11-07 00:00:00+00	America/Sao_Paulo
3275	2	FP2	\N	f	1	915	session_ZSK6hDGe	f	2014-11-07 00:00:00+00	America/Sao_Paulo
3291	7	R	\N	f	16	918	session_kLKkNo6c	t	2015-03-29 07:00:00+00	Asia/Kuala_Lumpur
3292	3	Q1	\N	f	1	918	session_iWzCoMYD	f	2015-03-28 00:00:00+00	Asia/Kuala_Lumpur
3293	4	Q2	\N	f	1	918	session_cv2nDIRR	f	2015-03-28 00:00:00+00	Asia/Kuala_Lumpur
3294	5	Q3	\N	f	1	918	session_GQvTp8eq	f	2015-03-28 00:00:00+00	Asia/Kuala_Lumpur
3295	1	FP1	\N	f	1	918	session_ItxDiyNp	f	2015-03-27 00:00:00+00	Asia/Kuala_Lumpur
3296	2	FP2	\N	f	1	918	session_4ZFYNfjW	f	2015-03-27 00:00:00+00	Asia/Kuala_Lumpur
3298	7	R	\N	f	16	919	session_J8k1JQt7	t	2015-04-12 06:00:00+00	Asia/Shanghai
3299	3	Q1	\N	f	1	919	session_RMSY4F0N	f	2015-04-11 00:00:00+00	Asia/Shanghai
3300	4	Q2	\N	f	1	919	session_u7e6NM7J	f	2015-04-11 00:00:00+00	Asia/Shanghai
3301	5	Q3	\N	f	1	919	session_2zOpQ8iY	f	2015-04-11 00:00:00+00	Asia/Shanghai
3302	1	FP1	\N	f	1	919	session_U61pBPeA	f	2015-04-10 00:00:00+00	Asia/Shanghai
3303	2	FP2	\N	f	1	919	session_UW62ZSwZ	f	2015-04-10 00:00:00+00	Asia/Shanghai
3284	7	R	\N	f	16	917	session_rPU8qTPR	t	2015-03-15 05:00:00+00	Australia/Melbourne
3285	3	Q1	\N	f	1	917	session_9zI9b7e3	f	2015-03-14 00:00:00+00	Australia/Melbourne
3286	4	Q2	\N	f	1	917	session_BAcOmDKh	f	2015-03-14 00:00:00+00	Australia/Melbourne
3287	5	Q3	\N	f	1	917	session_egpDnrOe	f	2015-03-14 00:00:00+00	Australia/Melbourne
3288	1	FP1	\N	f	1	917	session_gAQ6n0Z0	f	2015-03-13 00:00:00+00	Australia/Melbourne
3289	2	FP2	\N	f	1	917	session_TyD0pU1L	f	2015-03-13 00:00:00+00	Australia/Melbourne
3354	7	R	\N	f	16	927	session_UIaVOy5r	t	2015-08-23 12:00:00+00	Europe/Brussels
3355	3	Q1	\N	f	1	927	session_xwD01oTl	f	2015-08-22 00:00:00+00	Europe/Brussels
3356	4	Q2	\N	f	1	927	session_YPMHAdzG	f	2015-08-22 00:00:00+00	Europe/Brussels
3357	5	Q3	\N	f	1	927	session_WqT2UtJj	f	2015-08-22 00:00:00+00	Europe/Brussels
3347	7	R	\N	f	16	926	session_HhEn9U0t	t	2015-07-26 12:00:00+00	Europe/Budapest
3348	3	Q1	\N	f	1	926	session_uAF8JBrA	f	2015-07-25 00:00:00+00	Europe/Budapest
3349	4	Q2	\N	f	1	926	session_E3wm0BEZ	f	2015-07-25 00:00:00+00	Europe/Budapest
3350	5	Q3	\N	f	1	926	session_em7JZRBM	f	2015-07-25 00:00:00+00	Europe/Budapest
3351	1	FP1	\N	f	1	926	session_AUZEjbPN	f	2015-07-24 00:00:00+00	Europe/Budapest
3352	2	FP2	\N	f	1	926	session_4t8K3aa7	f	2015-07-24 00:00:00+00	Europe/Budapest
3340	7	R	\N	f	16	925	session_JLgDsdQY	t	2015-07-05 12:00:00+00	Europe/London
3341	3	Q1	\N	f	1	925	session_OWFy5hXH	f	2015-07-04 00:00:00+00	Europe/London
3342	4	Q2	\N	f	1	925	session_vQWhiklA	f	2015-07-04 00:00:00+00	Europe/London
3343	5	Q3	\N	f	1	925	session_Fb2mmcay	f	2015-07-04 00:00:00+00	Europe/London
3344	1	FP1	\N	f	1	925	session_hv3TnoRS	f	2015-07-03 00:00:00+00	Europe/London
3345	2	FP2	\N	f	1	925	session_DQUchDcM	f	2015-07-03 00:00:00+00	Europe/London
3312	7	R	\N	f	16	921	session_2xJFmLTz	t	2015-05-10 12:00:00+00	Europe/Madrid
3313	3	Q1	\N	f	1	921	session_jqnBYrNk	f	2015-05-09 00:00:00+00	Europe/Madrid
3314	4	Q2	\N	f	1	921	session_KMsaWa5m	f	2015-05-09 00:00:00+00	Europe/Madrid
3315	5	Q3	\N	f	1	921	session_k9IR7S4y	f	2015-05-09 00:00:00+00	Europe/Madrid
3316	1	FP1	\N	f	1	921	session_i0DSC0qb	f	2015-05-08 00:00:00+00	Europe/Madrid
3317	2	FP2	\N	f	1	921	session_2wnTuGR1	f	2015-05-08 00:00:00+00	Europe/Madrid
3318	6	FP3	\N	f	1	921	session_ARfVWar4	f	2015-05-09 00:00:00+00	Europe/Madrid
3319	7	R	\N	f	16	922	session_wt6SKy1p	t	2015-05-24 12:00:00+00	Europe/Monaco
3320	3	Q1	\N	f	1	922	session_ZEzXk097	f	2015-05-23 00:00:00+00	Europe/Monaco
3321	4	Q2	\N	f	1	922	session_3qYINsko	f	2015-05-23 00:00:00+00	Europe/Monaco
3322	5	Q3	\N	f	1	922	session_7vMhO9Zl	f	2015-05-23 00:00:00+00	Europe/Monaco
3323	1	FP1	\N	f	1	922	session_YYvbF9gJ	f	2015-05-21 00:00:00+00	Europe/Monaco
3324	2	FP2	\N	f	1	922	session_9kkrf8xC	f	2015-05-21 00:00:00+00	Europe/Monaco
3333	7	R	\N	f	16	924	session_Fsoey7Np	t	2015-06-21 12:00:00+00	Europe/Vienna
3334	3	Q1	\N	f	1	924	session_loduoPpW	f	2015-06-20 00:00:00+00	Europe/Vienna
3335	4	Q2	\N	f	1	924	session_PmHc8aJP	f	2015-06-20 00:00:00+00	Europe/Vienna
3336	5	Q3	\N	f	1	924	session_3cSMALba	f	2015-06-20 00:00:00+00	Europe/Vienna
3337	1	FP1	\N	f	1	924	session_gJxcRiie	f	2015-06-19 00:00:00+00	Europe/Vienna
3338	2	FP2	\N	f	1	924	session_eNbKukfg	f	2015-06-19 00:00:00+00	Europe/Vienna
3305	7	R	\N	f	16	920	session_XrOHMMOk	t	2015-04-19 15:00:00+00	Asia/Bahrain
3306	3	Q1	\N	f	1	920	session_eGQ25Ayc	f	2015-04-18 00:00:00+00	Asia/Bahrain
3307	4	Q2	\N	f	1	920	session_BWypciLi	f	2015-04-18 00:00:00+00	Asia/Bahrain
3308	5	Q3	\N	f	1	920	session_pATkXgxO	f	2015-04-18 00:00:00+00	Asia/Bahrain
3309	1	FP1	\N	f	1	920	session_L66ELHaj	f	2015-04-17 00:00:00+00	Asia/Bahrain
3310	2	FP2	\N	f	1	920	session_I4mdlP9x	f	2015-04-17 00:00:00+00	Asia/Bahrain
3311	6	FP3	\N	f	1	920	session_yXqNIhTS	f	2015-04-18 00:00:00+00	Asia/Bahrain
3403	7	R	\N	f	16	934	session_K5xU80vl	t	2015-11-15 16:00:00+00	America/Sao_Paulo
3404	3	Q1	\N	f	1	934	session_en3ElMyT	f	2015-11-14 00:00:00+00	America/Sao_Paulo
3405	4	Q2	\N	f	1	934	session_tn7ahOqw	f	2015-11-14 00:00:00+00	America/Sao_Paulo
3406	5	Q3	\N	f	1	934	session_xBFklqRU	f	2015-11-14 00:00:00+00	America/Sao_Paulo
3407	1	FP1	\N	f	1	934	session_EaZozT4P	f	2015-11-13 00:00:00+00	America/Sao_Paulo
3408	2	FP2	\N	f	1	934	session_kPgCCp2L	f	2015-11-13 00:00:00+00	America/Sao_Paulo
3424	7	R	\N	f	16	937	session_7S3rdrhy	t	2016-04-03 15:00:00+00	Asia/Bahrain
3425	3	Q1	\N	f	1	937	session_OEYruKFL	f	2016-04-02 00:00:00+00	Asia/Bahrain
3426	4	Q2	\N	f	1	937	session_NcINk01N	f	2016-04-02 00:00:00+00	Asia/Bahrain
3427	5	Q3	\N	f	1	937	session_OKxGryxi	f	2016-04-02 00:00:00+00	Asia/Bahrain
3428	1	FP1	\N	f	1	937	session_A38AbRhS	f	2016-04-01 00:00:00+00	Asia/Bahrain
3429	2	FP2	\N	f	1	937	session_dYX78B7G	f	2016-04-01 00:00:00+00	Asia/Bahrain
3410	7	R	\N	f	16	935	session_vF2MtQZJ	t	2015-11-29 13:00:00+00	Asia/Dubai
3411	3	Q1	\N	f	1	935	session_f4OIw5w2	f	2015-11-28 00:00:00+00	Asia/Dubai
3412	4	Q2	\N	f	1	935	session_9Pga3SR7	f	2015-11-28 00:00:00+00	Asia/Dubai
3413	5	Q3	\N	f	1	935	session_biaYFvBg	f	2015-11-28 00:00:00+00	Asia/Dubai
3414	1	FP1	\N	f	1	935	session_FajHVo3p	f	2015-11-27 00:00:00+00	Asia/Dubai
3415	2	FP2	\N	f	1	935	session_P8NLQfWF	f	2015-11-27 00:00:00+00	Asia/Dubai
3431	7	R	\N	f	16	938	session_HIkS9GXw	t	2016-04-17 06:00:00+00	Asia/Shanghai
3368	7	R	\N	f	16	929	session_vyExGt0G	t	2015-09-20 12:00:00+00	Asia/Singapore
3369	3	Q1	\N	f	1	929	session_0JelEC8k	f	2015-09-19 00:00:00+00	Asia/Singapore
3370	4	Q2	\N	f	1	929	session_izKPtvRB	f	2015-09-19 00:00:00+00	Asia/Singapore
3371	5	Q3	\N	f	1	929	session_mSTqqgNz	f	2015-09-19 00:00:00+00	Asia/Singapore
3372	1	FP1	\N	f	1	929	session_VBhQLBa7	f	2015-09-18 00:00:00+00	Asia/Singapore
3373	2	FP2	\N	f	1	929	session_ahTlusQj	f	2015-09-18 00:00:00+00	Asia/Singapore
3375	7	R	\N	f	16	930	session_sSpR0Af2	t	2015-09-27 05:00:00+00	Asia/Tokyo
3376	3	Q1	\N	f	1	930	session_Vawf6TLt	f	2015-09-26 00:00:00+00	Asia/Tokyo
3377	4	Q2	\N	f	1	930	session_w4lGLGwf	f	2015-09-26 00:00:00+00	Asia/Tokyo
3378	5	Q3	\N	f	1	930	session_w3w3K5MU	f	2015-09-26 00:00:00+00	Asia/Tokyo
3379	1	FP1	\N	f	1	930	session_Z7bbLk3x	f	2015-09-25 00:00:00+00	Asia/Tokyo
3380	2	FP2	\N	f	1	930	session_7SVBZfaQ	f	2015-09-25 00:00:00+00	Asia/Tokyo
3417	7	R	\N	f	16	936	session_RtRLo1jq	t	2016-03-20 05:00:00+00	Australia/Melbourne
3418	3	Q1	\N	f	1	936	session_7np4XyYN	f	2016-03-19 00:00:00+00	Australia/Melbourne
3419	4	Q2	\N	f	1	936	session_0jjBUgpI	f	2016-03-19 00:00:00+00	Australia/Melbourne
3420	5	Q3	\N	f	1	936	session_3s3DCfiQ	f	2016-03-19 00:00:00+00	Australia/Melbourne
3421	1	FP1	\N	f	1	936	session_vOzwrAn3	f	2016-03-18 00:00:00+00	Australia/Melbourne
3422	2	FP2	\N	f	1	936	session_rqSQyfeV	f	2016-03-18 00:00:00+00	Australia/Melbourne
3358	1	FP1	\N	f	1	927	session_EQ63Svag	f	2015-08-21 00:00:00+00	Europe/Brussels
3359	2	FP2	\N	f	1	927	session_4UXZyKAc	f	2015-08-21 00:00:00+00	Europe/Brussels
3360	6	FP3	\N	f	1	927	session_yu3HtUsV	f	2015-08-22 00:00:00+00	Europe/Brussels
3382	7	R	\N	f	16	931	session_gZedYgWj	t	2015-10-11 11:00:00+00	Europe/Moscow
3383	3	Q1	\N	f	1	931	session_dWsoLed5	f	2015-10-10 00:00:00+00	Europe/Moscow
3384	4	Q2	\N	f	1	931	session_pacMU9zS	f	2015-10-10 00:00:00+00	Europe/Moscow
3385	5	Q3	\N	f	1	931	session_8hEvNQsX	f	2015-10-10 00:00:00+00	Europe/Moscow
3386	1	FP1	\N	f	1	931	session_zHXAll5X	f	2015-10-09 00:00:00+00	Europe/Moscow
3387	2	FP2	\N	f	1	931	session_iCsmROgF	f	2015-10-09 00:00:00+00	Europe/Moscow
3361	7	R	\N	f	16	928	session_ETJfXgWW	t	2015-09-06 12:00:00+00	Europe/Rome
3362	3	Q1	\N	f	1	928	session_OUf2EFxu	f	2015-09-05 00:00:00+00	Europe/Rome
3363	4	Q2	\N	f	1	928	session_G6yiYxSQ	f	2015-09-05 00:00:00+00	Europe/Rome
3364	5	Q3	\N	f	1	928	session_fFGTTUcF	f	2015-09-05 00:00:00+00	Europe/Rome
3365	1	FP1	\N	f	1	928	session_dnpjl4kQ	f	2015-09-04 00:00:00+00	Europe/Rome
3366	2	FP2	\N	f	1	928	session_9iSO6lv9	f	2015-09-04 00:00:00+00	Europe/Rome
3367	6	FP3	\N	f	1	928	session_d1Oxe5C9	f	2015-09-05 00:00:00+00	Europe/Rome
3396	7	R	\N	f	16	933	session_YSLEm4su	t	2015-11-01 19:00:00+00	America/Mexico_City
3397	3	Q1	\N	f	1	933	session_FHumtO3x	f	2015-10-31 00:00:00+00	America/Mexico_City
3398	4	Q2	\N	f	1	933	session_K5Qkq4xx	f	2015-10-31 00:00:00+00	America/Mexico_City
3399	5	Q3	\N	f	1	933	session_9jtmWkVE	f	2015-10-31 00:00:00+00	America/Mexico_City
3400	1	FP1	\N	f	1	933	session_VU6uicdv	f	2015-10-30 00:00:00+00	America/Mexico_City
3401	2	FP2	\N	f	1	933	session_ph8nlo8A	f	2015-10-30 00:00:00+00	America/Mexico_City
3432	3	Q1	\N	f	1	938	session_LYIBBEwo	f	2016-04-16 00:00:00+00	Asia/Shanghai
3433	4	Q2	\N	f	1	938	session_lM7kM3iR	f	2016-04-16 00:00:00+00	Asia/Shanghai
3434	5	Q3	\N	f	1	938	session_M60eyT2F	f	2016-04-16 00:00:00+00	Asia/Shanghai
3435	1	FP1	\N	f	1	938	session_zdGuGwaY	f	2016-04-15 00:00:00+00	Asia/Shanghai
3436	2	FP2	\N	f	1	938	session_ny8Hv2ku	f	2016-04-15 00:00:00+00	Asia/Shanghai
3437	6	FP3	\N	f	1	938	session_WmcCrjPn	f	2016-04-16 00:00:00+00	Asia/Shanghai
3494	7	R	\N	f	16	947	session_S1RWNqrm	t	2016-07-31 12:00:00+00	Europe/Berlin
3495	3	Q1	\N	f	1	947	session_WghZynHh	f	2016-07-30 00:00:00+00	Europe/Berlin
3496	4	Q2	\N	f	1	947	session_wX6wGxpd	f	2016-07-30 00:00:00+00	Europe/Berlin
3497	5	Q3	\N	f	1	947	session_hR9xqclm	f	2016-07-30 00:00:00+00	Europe/Berlin
3498	1	FP1	\N	f	1	947	session_SoFUspg9	f	2016-07-29 00:00:00+00	Europe/Berlin
3501	7	R	\N	f	16	948	session_MCc0UpET	t	2016-08-28 12:00:00+00	Europe/Brussels
3502	3	Q1	\N	f	1	948	session_yawR5eft	f	2016-08-27 00:00:00+00	Europe/Brussels
3503	4	Q2	\N	f	1	948	session_58zllHrR	f	2016-08-27 00:00:00+00	Europe/Brussels
3504	5	Q3	\N	f	1	948	session_XIxHdpiy	f	2016-08-27 00:00:00+00	Europe/Brussels
3505	1	FP1	\N	f	1	948	session_OyNZNjQF	f	2016-08-26 00:00:00+00	Europe/Brussels
3487	7	R	\N	f	16	946	session_hB6EP6kE	t	2016-07-24 12:00:00+00	Europe/Budapest
3488	3	Q1	\N	f	1	946	session_8EZPrCVc	f	2016-07-23 00:00:00+00	Europe/Budapest
3489	4	Q2	\N	f	1	946	session_zxUnoNZ7	f	2016-07-23 00:00:00+00	Europe/Budapest
3490	5	Q3	\N	f	1	946	session_9W1iWLqQ	f	2016-07-23 00:00:00+00	Europe/Budapest
3491	1	FP1	\N	f	1	946	session_1FBS3o0A	f	2016-07-22 00:00:00+00	Europe/Budapest
3492	2	FP2	\N	f	1	946	session_lZxRyEK0	f	2016-07-22 00:00:00+00	Europe/Budapest
3480	7	R	\N	f	16	945	session_QOqgpQOy	t	2016-07-10 12:00:00+00	Europe/London
3481	3	Q1	\N	f	1	945	session_v1gSSQFz	f	2016-07-09 00:00:00+00	Europe/London
3482	4	Q2	\N	f	1	945	session_iGhF49cA	f	2016-07-09 00:00:00+00	Europe/London
3483	5	Q3	\N	f	1	945	session_rLqqG4yG	f	2016-07-09 00:00:00+00	Europe/London
3484	1	FP1	\N	f	1	945	session_Fgl2FmeJ	f	2016-07-08 00:00:00+00	Europe/London
3485	2	FP2	\N	f	1	945	session_iB0jqRP7	f	2016-07-08 00:00:00+00	Europe/London
3486	6	FP3	\N	f	1	945	session_kVgnDvTO	f	2016-07-09 00:00:00+00	Europe/London
3445	7	R	\N	f	16	940	session_7dVRv3gd	t	2016-05-15 12:00:00+00	Europe/Madrid
3446	3	Q1	\N	f	1	940	session_cjVCFqeZ	f	2016-05-14 00:00:00+00	Europe/Madrid
3447	4	Q2	\N	f	1	940	session_rdeMV4b0	f	2016-05-14 00:00:00+00	Europe/Madrid
3448	5	Q3	\N	f	1	940	session_acXBH5My	f	2016-05-14 00:00:00+00	Europe/Madrid
3449	1	FP1	\N	f	1	940	session_r5EkHuNN	f	2016-05-13 00:00:00+00	Europe/Madrid
3450	2	FP2	\N	f	1	940	session_ALXJpKqo	f	2016-05-13 00:00:00+00	Europe/Madrid
3452	7	R	\N	f	16	941	session_93cbRjCR	t	2016-05-29 12:00:00+00	Europe/Monaco
3453	3	Q1	\N	f	1	941	session_XODaxXTa	f	2016-05-28 00:00:00+00	Europe/Monaco
3454	4	Q2	\N	f	1	941	session_UERpMs0p	f	2016-05-28 00:00:00+00	Europe/Monaco
3455	5	Q3	\N	f	1	941	session_ASEWT4Pb	f	2016-05-28 00:00:00+00	Europe/Monaco
3456	1	FP1	\N	f	1	941	session_z1Xxnx9M	f	2016-05-26 00:00:00+00	Europe/Monaco
3457	2	FP2	\N	f	1	941	session_UN6L1DPc	f	2016-05-26 00:00:00+00	Europe/Monaco
3438	7	R	\N	f	16	939	session_fr2BZdjm	t	2016-05-01 12:00:00+00	Europe/Moscow
3439	3	Q1	\N	f	1	939	session_xEVtzn9y	f	2016-04-30 00:00:00+00	Europe/Moscow
3440	4	Q2	\N	f	1	939	session_gmw1bOup	f	2016-04-30 00:00:00+00	Europe/Moscow
3441	5	Q3	\N	f	1	939	session_C3HDy8lz	f	2016-04-30 00:00:00+00	Europe/Moscow
3442	1	FP1	\N	f	1	939	session_BhxQ84zE	f	2016-04-29 00:00:00+00	Europe/Moscow
3443	2	FP2	\N	f	1	939	session_SuEPJZCQ	f	2016-04-29 00:00:00+00	Europe/Moscow
3444	6	FP3	\N	f	1	939	session_q0NW15Yr	f	2016-04-30 00:00:00+00	Europe/Moscow
3473	7	R	\N	f	16	944	session_kXsttCcu	t	2016-07-03 12:00:00+00	Europe/Vienna
3474	3	Q1	\N	f	1	944	session_DbD6ymbM	f	2016-07-02 00:00:00+00	Europe/Vienna
3475	4	Q2	\N	f	1	944	session_3heF0Pwf	f	2016-07-02 00:00:00+00	Europe/Vienna
3476	5	Q3	\N	f	1	944	session_FCxIaTWt	f	2016-07-02 00:00:00+00	Europe/Vienna
3477	1	FP1	\N	f	1	944	session_Eye0goqB	f	2016-07-01 00:00:00+00	Europe/Vienna
3478	2	FP2	\N	f	1	944	session_3chTwprC	f	2016-07-01 00:00:00+00	Europe/Vienna
3466	7	R	\N	f	16	943	session_SfAYhRES	t	2016-06-19 13:00:00+00	Asia/Baku
3467	3	Q1	\N	f	1	943	session_kV405Mrw	f	2016-06-18 00:00:00+00	Asia/Baku
3468	4	Q2	\N	f	1	943	session_Wg7rAHf9	f	2016-06-18 00:00:00+00	Asia/Baku
3469	5	Q3	\N	f	1	943	session_fceWIQC2	f	2016-06-18 00:00:00+00	Asia/Baku
3470	1	FP1	\N	f	1	943	session_DEhmE90O	f	2016-06-17 00:00:00+00	Asia/Baku
3471	2	FP2	\N	f	1	943	session_vSIcDk7d	f	2016-06-17 00:00:00+00	Asia/Baku
3550	7	R	\N	f	16	955	session_fKK5GrTu	t	2016-11-13 16:00:00+00	America/Sao_Paulo
3551	3	Q1	\N	f	1	955	session_VEmIFMAU	f	2016-11-12 00:00:00+00	America/Sao_Paulo
3552	4	Q2	\N	f	1	955	session_2LJqyK1c	f	2016-11-12 00:00:00+00	America/Sao_Paulo
3553	5	Q3	\N	f	1	955	session_CGvo1Em0	f	2016-11-12 00:00:00+00	America/Sao_Paulo
3554	1	FP1	\N	f	1	955	session_cKlpW8VU	f	2016-11-11 00:00:00+00	America/Sao_Paulo
3555	2	FP2	\N	f	1	955	session_OQDSIRFG	f	2016-11-11 00:00:00+00	America/Sao_Paulo
3578	7	R	\N	f	16	959	session_cUGcFham	t	2017-04-16 15:00:00+00	Asia/Bahrain
3579	3	Q1	\N	f	1	959	session_iFNgHa2e	f	2017-04-15 00:00:00+00	Asia/Bahrain
3557	7	R	\N	f	16	956	session_PnLTMLIq	t	2016-11-27 13:00:00+00	Asia/Dubai
3558	3	Q1	\N	f	1	956	session_VyETBeY3	f	2016-11-26 00:00:00+00	Asia/Dubai
3559	4	Q2	\N	f	1	956	session_hFCyj2B4	f	2016-11-26 00:00:00+00	Asia/Dubai
3560	5	Q3	\N	f	1	956	session_iHMDMiJ9	f	2016-11-26 00:00:00+00	Asia/Dubai
3561	1	FP1	\N	f	1	956	session_Cj8V10ks	f	2016-11-25 00:00:00+00	Asia/Dubai
3562	2	FP2	\N	f	1	956	session_JsryFZck	f	2016-11-25 00:00:00+00	Asia/Dubai
3522	7	R	\N	f	16	951	session_AsqXTdq0	t	2016-10-02 07:00:00+00	Asia/Kuala_Lumpur
3523	3	Q1	\N	f	1	951	session_5ok1zfsM	f	2016-10-01 00:00:00+00	Asia/Kuala_Lumpur
3524	4	Q2	\N	f	1	951	session_67pgQ35U	f	2016-10-01 00:00:00+00	Asia/Kuala_Lumpur
3525	5	Q3	\N	f	1	951	session_aiBkj8p4	f	2016-10-01 00:00:00+00	Asia/Kuala_Lumpur
3526	1	FP1	\N	f	1	951	session_34PfIsnj	f	2016-09-30 00:00:00+00	Asia/Kuala_Lumpur
3527	2	FP2	\N	f	1	951	session_vTYHZYKA	f	2016-09-30 00:00:00+00	Asia/Kuala_Lumpur
3571	7	R	\N	f	16	958	session_BkbBN2uN	t	2017-04-09 06:00:00+00	Asia/Shanghai
3572	3	Q1	\N	f	1	958	session_GgKcyJGQ	f	2017-04-08 00:00:00+00	Asia/Shanghai
3573	4	Q2	\N	f	1	958	session_o1DL6XTz	f	2017-04-08 00:00:00+00	Asia/Shanghai
3574	5	Q3	\N	f	1	958	session_lTYtOvHR	f	2017-04-08 00:00:00+00	Asia/Shanghai
3575	1	FP1	\N	f	1	958	session_b87TijAl	f	2017-04-07 00:00:00+00	Asia/Shanghai
3576	2	FP2	\N	f	1	958	session_TT9hXpsz	f	2017-04-07 00:00:00+00	Asia/Shanghai
3515	7	R	\N	f	16	950	session_USnhHXUR	t	2016-09-18 12:00:00+00	Asia/Singapore
3516	3	Q1	\N	f	1	950	session_AQqfJ4Is	f	2016-09-17 00:00:00+00	Asia/Singapore
3517	4	Q2	\N	f	1	950	session_JpqlYDe1	f	2016-09-17 00:00:00+00	Asia/Singapore
3518	5	Q3	\N	f	1	950	session_4fTS8CgJ	f	2016-09-17 00:00:00+00	Asia/Singapore
3519	1	FP1	\N	f	1	950	session_K9Kqn1Zt	f	2016-09-16 00:00:00+00	Asia/Singapore
3520	2	FP2	\N	f	1	950	session_5ofdWpzB	f	2016-09-16 00:00:00+00	Asia/Singapore
3529	7	R	\N	f	16	952	session_Nqu4JshC	t	2016-10-09 05:00:00+00	Asia/Tokyo
3530	3	Q1	\N	f	1	952	session_QDrh7nEj	f	2016-10-08 00:00:00+00	Asia/Tokyo
3531	4	Q2	\N	f	1	952	session_ECjHKLt5	f	2016-10-08 00:00:00+00	Asia/Tokyo
3532	5	Q3	\N	f	1	952	session_FUwGT1CB	f	2016-10-08 00:00:00+00	Asia/Tokyo
3533	1	FP1	\N	f	1	952	session_D5gvweLQ	f	2016-10-07 00:00:00+00	Asia/Tokyo
3534	2	FP2	\N	f	1	952	session_S60EDrAq	f	2016-10-07 00:00:00+00	Asia/Tokyo
3564	7	R	\N	f	16	957	session_YEWxIkQr	t	2017-03-26 05:00:00+00	Australia/Melbourne
3565	3	Q1	\N	f	1	957	session_dXGa0Ogg	f	2017-03-25 00:00:00+00	Australia/Melbourne
3566	4	Q2	\N	f	1	957	session_1EeRAe1N	f	2017-03-25 00:00:00+00	Australia/Melbourne
3567	5	Q3	\N	f	1	957	session_SDY3YswB	f	2017-03-25 00:00:00+00	Australia/Melbourne
3568	1	FP1	\N	f	1	957	session_kRygBpnF	f	2017-03-24 00:00:00+00	Australia/Melbourne
3569	2	FP2	\N	f	1	957	session_bnQscz7P	f	2017-03-24 00:00:00+00	Australia/Melbourne
3506	2	FP2	\N	f	1	948	session_RH90zIop	f	2016-08-26 00:00:00+00	Europe/Brussels
3507	6	FP3	\N	f	1	948	session_QWo80TvB	f	2016-08-27 00:00:00+00	Europe/Brussels
3508	7	R	\N	f	16	949	session_nBLvclDO	t	2016-09-04 12:00:00+00	Europe/Rome
3509	3	Q1	\N	f	1	949	session_4sBDeBVD	f	2016-09-03 00:00:00+00	Europe/Rome
3510	4	Q2	\N	f	1	949	session_Ke4puwF8	f	2016-09-03 00:00:00+00	Europe/Rome
3511	5	Q3	\N	f	1	949	session_WLm9hXET	f	2016-09-03 00:00:00+00	Europe/Rome
3512	1	FP1	\N	f	1	949	session_UuchKQgF	f	2016-09-02 00:00:00+00	Europe/Rome
3513	2	FP2	\N	f	1	949	session_8NaH5Elf	f	2016-09-02 00:00:00+00	Europe/Rome
3543	7	R	\N	f	16	954	session_tP1YXWmL	t	2016-10-30 19:00:00+00	America/Mexico_City
3544	3	Q1	\N	f	1	954	session_dlhFMVGR	f	2016-10-29 00:00:00+00	America/Mexico_City
3545	4	Q2	\N	f	1	954	session_0Q5uADZp	f	2016-10-29 00:00:00+00	America/Mexico_City
3546	5	Q3	\N	f	1	954	session_l2qynAxp	f	2016-10-29 00:00:00+00	America/Mexico_City
3547	1	FP1	\N	f	1	954	session_pGg7cuCb	f	2016-10-28 00:00:00+00	America/Mexico_City
3548	2	FP2	\N	f	1	954	session_NLClxiWx	f	2016-10-28 00:00:00+00	America/Mexico_City
3577	6	FP3	\N	f	1	958	session_wu3JDqwQ	f	2017-04-08 00:00:00+00	Asia/Shanghai
3613	7	R	\N	f	16	964	session_ZuCoV22y	t	2017-06-25 13:00:00+00	Asia/Baku
3614	3	Q1	\N	f	1	964	session_xSBfDnd9	f	2017-06-24 00:00:00+00	Asia/Baku
3615	4	Q2	\N	f	1	964	session_ZdIFRsdg	f	2017-06-24 00:00:00+00	Asia/Baku
3616	5	Q3	\N	f	1	964	session_FXCGDxkn	f	2017-06-24 00:00:00+00	Asia/Baku
3617	1	FP1	\N	f	1	964	session_G15DQ8cN	f	2017-06-23 00:00:00+00	Asia/Baku
3641	7	R	\N	f	16	968	session_aBY7K6kb	t	2017-08-27 12:00:00+00	Europe/Brussels
3642	3	Q1	\N	f	1	968	session_fRHPuMBU	f	2017-08-26 00:00:00+00	Europe/Brussels
3643	4	Q2	\N	f	1	968	session_cBf2p5nC	f	2017-08-26 00:00:00+00	Europe/Brussels
3644	5	Q3	\N	f	1	968	session_fcgseXIi	f	2017-08-26 00:00:00+00	Europe/Brussels
3645	1	FP1	\N	f	1	968	session_wgMhEBGx	f	2017-08-25 00:00:00+00	Europe/Brussels
3646	2	FP2	\N	f	1	968	session_sxwgbGwQ	f	2017-08-25 00:00:00+00	Europe/Brussels
3634	7	R	\N	f	16	967	session_aH76sWiD	t	2017-07-30 12:00:00+00	Europe/Budapest
3635	3	Q1	\N	f	1	967	session_3sYUGLJI	f	2017-07-29 00:00:00+00	Europe/Budapest
3636	4	Q2	\N	f	1	967	session_U6bTxLSP	f	2017-07-29 00:00:00+00	Europe/Budapest
3637	5	Q3	\N	f	1	967	session_6FvoJzre	f	2017-07-29 00:00:00+00	Europe/Budapest
3638	1	FP1	\N	f	1	967	session_AQF6Mvsb	f	2017-07-28 00:00:00+00	Europe/Budapest
3639	2	FP2	\N	f	1	967	session_CUcpAYua	f	2017-07-28 00:00:00+00	Europe/Budapest
3627	7	R	\N	f	16	966	session_dKh0F9Ch	t	2017-07-16 12:00:00+00	Europe/London
3628	3	Q1	\N	f	1	966	session_vltooeu2	f	2017-07-15 00:00:00+00	Europe/London
3629	4	Q2	\N	f	1	966	session_kTSh0ZoY	f	2017-07-15 00:00:00+00	Europe/London
3630	5	Q3	\N	f	1	966	session_QqEW5Rq7	f	2017-07-15 00:00:00+00	Europe/London
3631	1	FP1	\N	f	1	966	session_g0IFl3lN	f	2017-07-14 00:00:00+00	Europe/London
3632	2	FP2	\N	f	1	966	session_WXf5j2D4	f	2017-07-14 00:00:00+00	Europe/London
3592	7	R	\N	f	16	961	session_19layugs	t	2017-05-14 12:00:00+00	Europe/Madrid
3593	3	Q1	\N	f	1	961	session_yZt0qfwr	f	2017-05-13 00:00:00+00	Europe/Madrid
3594	4	Q2	\N	f	1	961	session_ddwo69pJ	f	2017-05-13 00:00:00+00	Europe/Madrid
3595	5	Q3	\N	f	1	961	session_Lw6qvCxH	f	2017-05-13 00:00:00+00	Europe/Madrid
3596	1	FP1	\N	f	1	961	session_YuiASuiJ	f	2017-05-12 00:00:00+00	Europe/Madrid
3597	2	FP2	\N	f	1	961	session_De8XsGI1	f	2017-05-12 00:00:00+00	Europe/Madrid
3598	6	FP3	\N	f	1	961	session_9T2xeDjr	f	2017-05-13 00:00:00+00	Europe/Madrid
3599	7	R	\N	f	16	962	session_TeKzdL1t	t	2017-05-28 12:00:00+00	Europe/Monaco
3600	3	Q1	\N	f	1	962	session_pV1WLruQ	f	2017-05-27 00:00:00+00	Europe/Monaco
3601	4	Q2	\N	f	1	962	session_AlSkdlwN	f	2017-05-27 00:00:00+00	Europe/Monaco
3602	5	Q3	\N	f	1	962	session_AvYLji5m	f	2017-05-27 00:00:00+00	Europe/Monaco
3603	1	FP1	\N	f	1	962	session_6Z97dOiy	f	2017-05-25 00:00:00+00	Europe/Monaco
3604	2	FP2	\N	f	1	962	session_bBCmEjwM	f	2017-05-25 00:00:00+00	Europe/Monaco
3585	7	R	\N	f	16	960	session_5Wdlw3fD	t	2017-04-30 12:00:00+00	Europe/Moscow
3586	3	Q1	\N	f	1	960	session_trCfjzPf	f	2017-04-29 00:00:00+00	Europe/Moscow
3587	4	Q2	\N	f	1	960	session_RRrULIlr	f	2017-04-29 00:00:00+00	Europe/Moscow
3588	5	Q3	\N	f	1	960	session_nbJuCLPw	f	2017-04-29 00:00:00+00	Europe/Moscow
3589	1	FP1	\N	f	1	960	session_SFxZy5Sk	f	2017-04-28 00:00:00+00	Europe/Moscow
3590	2	FP2	\N	f	1	960	session_Q3ESkYU5	f	2017-04-28 00:00:00+00	Europe/Moscow
3648	7	R	\N	f	16	969	session_8cTOuQ9k	t	2017-09-03 12:00:00+00	Europe/Rome
3649	3	Q1	\N	f	1	969	session_KKyl42fl	f	2017-09-02 00:00:00+00	Europe/Rome
3650	4	Q2	\N	f	1	969	session_dX9Jn6UN	f	2017-09-02 00:00:00+00	Europe/Rome
3651	5	Q3	\N	f	1	969	session_p8tJTsgq	f	2017-09-02 00:00:00+00	Europe/Rome
3652	1	FP1	\N	f	1	969	session_3ygAiv6y	f	2017-09-01 00:00:00+00	Europe/Rome
3653	2	FP2	\N	f	1	969	session_rVC64I9S	f	2017-09-01 00:00:00+00	Europe/Rome
3620	7	R	\N	f	16	965	session_bWK42ErU	t	2017-07-09 12:00:00+00	Europe/Vienna
3621	3	Q1	\N	f	1	965	session_3gmujl03	f	2017-07-08 00:00:00+00	Europe/Vienna
3622	4	Q2	\N	f	1	965	session_IOliadN6	f	2017-07-08 00:00:00+00	Europe/Vienna
3623	5	Q3	\N	f	1	965	session_uH74cMKx	f	2017-07-08 00:00:00+00	Europe/Vienna
3624	1	FP1	\N	f	1	965	session_KcI4Kt8Q	f	2017-07-07 00:00:00+00	Europe/Vienna
3625	2	FP2	\N	f	1	965	session_vlan0IDN	f	2017-07-07 00:00:00+00	Europe/Vienna
3580	4	Q2	\N	f	1	959	session_dMPML4y1	f	2017-04-15 00:00:00+00	Asia/Bahrain
3581	5	Q3	\N	f	1	959	session_YIdSPHM6	f	2017-04-15 00:00:00+00	Asia/Bahrain
3582	1	FP1	\N	f	1	959	session_OcuOjWpJ	f	2017-04-14 00:00:00+00	Asia/Bahrain
3583	2	FP2	\N	f	1	959	session_Zdm7Yicr	f	2017-04-14 00:00:00+00	Asia/Bahrain
3584	6	FP3	\N	f	1	959	session_agQ5j1AP	f	2017-04-15 00:00:00+00	Asia/Bahrain
3618	2	FP2	\N	f	1	964	session_esvy1hvf	f	2017-06-23 00:00:00+00	Asia/Baku
3690	7	R	\N	f	16	975	session_tJdJsgqN	t	2017-11-12 16:00:00+00	America/Sao_Paulo
3691	3	Q1	\N	f	1	975	session_mhitI8AO	f	2017-11-11 00:00:00+00	America/Sao_Paulo
3692	4	Q2	\N	f	1	975	session_fTKVd6R8	f	2017-11-11 00:00:00+00	America/Sao_Paulo
3693	5	Q3	\N	f	1	975	session_W4wMmyty	f	2017-11-11 00:00:00+00	America/Sao_Paulo
3694	1	FP1	\N	f	1	975	session_xg8nMjhi	f	2017-11-10 00:00:00+00	America/Sao_Paulo
3695	2	FP2	\N	f	1	975	session_277wrDXT	f	2017-11-10 00:00:00+00	America/Sao_Paulo
3711	7	R	\N	f	16	978	session_5eUuNNjX	t	2018-04-08 15:10:00+00	Asia/Bahrain
3712	3	Q1	\N	f	1	978	session_RqpJpCpV	f	2018-04-07 00:00:00+00	Asia/Bahrain
3713	4	Q2	\N	f	1	978	session_WHoS7vgg	f	2018-04-07 00:00:00+00	Asia/Bahrain
3714	5	Q3	\N	f	1	978	session_hQf3xpr9	f	2018-04-07 00:00:00+00	Asia/Bahrain
3715	1	FP1	\N	f	1	978	session_O19o6gjb	f	2018-04-06 00:00:00+00	Asia/Bahrain
3716	2	FP2	\N	f	1	978	session_x6EUVVCq	f	2018-04-06 00:00:00+00	Asia/Bahrain
3725	7	R	\N	f	16	980	session_qVHAufit	t	2018-04-29 12:10:00+00	Asia/Baku
3726	3	Q1	\N	f	1	980	session_IXB7GdFS	f	2018-04-28 00:00:00+00	Asia/Baku
3727	4	Q2	\N	f	1	980	session_uOlW3u5r	f	2018-04-28 00:00:00+00	Asia/Baku
3697	7	R	\N	f	16	976	session_QQHwwzJd	t	2017-11-26 13:00:00+00	Asia/Dubai
3698	3	Q1	\N	f	1	976	session_fQtKHVpu	f	2017-11-25 00:00:00+00	Asia/Dubai
3699	4	Q2	\N	f	1	976	session_Q4LoIPXJ	f	2017-11-25 00:00:00+00	Asia/Dubai
3700	5	Q3	\N	f	1	976	session_fYBEXpMU	f	2017-11-25 00:00:00+00	Asia/Dubai
3701	1	FP1	\N	f	1	976	session_4IXhqwLB	f	2017-11-24 00:00:00+00	Asia/Dubai
3702	2	FP2	\N	f	1	976	session_oynmE1nA	f	2017-11-24 00:00:00+00	Asia/Dubai
3662	7	R	\N	f	16	971	session_LDu5mru2	t	2017-10-01 07:00:00+00	Asia/Kuala_Lumpur
3663	3	Q1	\N	f	1	971	session_igTQMALq	f	2017-09-30 00:00:00+00	Asia/Kuala_Lumpur
3664	4	Q2	\N	f	1	971	session_wbo6Wl72	f	2017-09-30 00:00:00+00	Asia/Kuala_Lumpur
3665	5	Q3	\N	f	1	971	session_LeORQjYd	f	2017-09-30 00:00:00+00	Asia/Kuala_Lumpur
3666	1	FP1	\N	f	1	971	session_qh6RRLkb	f	2017-09-29 00:00:00+00	Asia/Kuala_Lumpur
3667	2	FP2	\N	f	1	971	session_CyN3lYcF	f	2017-09-29 00:00:00+00	Asia/Kuala_Lumpur
3718	7	R	\N	f	16	979	session_ydfqgR69	t	2018-04-15 06:10:00+00	Asia/Shanghai
3719	3	Q1	\N	f	1	979	session_yNvfc1RV	f	2018-04-14 00:00:00+00	Asia/Shanghai
3720	4	Q2	\N	f	1	979	session_Sdse9v1f	f	2018-04-14 00:00:00+00	Asia/Shanghai
3721	5	Q3	\N	f	1	979	session_CiVtMayn	f	2018-04-14 00:00:00+00	Asia/Shanghai
3722	1	FP1	\N	f	1	979	session_FpLnrZZY	f	2018-04-13 00:00:00+00	Asia/Shanghai
3723	2	FP2	\N	f	1	979	session_VfroRmKF	f	2018-04-13 00:00:00+00	Asia/Shanghai
3655	7	R	\N	f	16	970	session_OJ9hawhd	t	2017-09-17 12:00:00+00	Asia/Singapore
3656	3	Q1	\N	f	1	970	session_9JFjKyCa	f	2017-09-16 00:00:00+00	Asia/Singapore
3657	4	Q2	\N	f	1	970	session_yYvaWOLE	f	2017-09-16 00:00:00+00	Asia/Singapore
3658	5	Q3	\N	f	1	970	session_7elxwTe3	f	2017-09-16 00:00:00+00	Asia/Singapore
3659	1	FP1	\N	f	1	970	session_DVjMcpJJ	f	2017-09-15 00:00:00+00	Asia/Singapore
3660	2	FP2	\N	f	1	970	session_KAS9iXCD	f	2017-09-15 00:00:00+00	Asia/Singapore
3669	7	R	\N	f	16	972	session_FldNLVI4	t	2017-10-08 05:00:00+00	Asia/Tokyo
3670	3	Q1	\N	f	1	972	session_youHdZmJ	f	2017-10-07 00:00:00+00	Asia/Tokyo
3671	4	Q2	\N	f	1	972	session_J88s1Wn4	f	2017-10-07 00:00:00+00	Asia/Tokyo
3672	5	Q3	\N	f	1	972	session_oneULscC	f	2017-10-07 00:00:00+00	Asia/Tokyo
3673	1	FP1	\N	f	1	972	session_ivtcIXnO	f	2017-10-06 00:00:00+00	Asia/Tokyo
3674	2	FP2	\N	f	1	972	session_C9Q2TS5r	f	2017-10-06 00:00:00+00	Asia/Tokyo
3675	6	FP3	\N	f	1	972	session_aOduKBJL	f	2017-10-07 00:00:00+00	Asia/Tokyo
3704	7	R	\N	f	16	977	session_NpcSJeoX	t	2018-03-25 05:10:00+00	Australia/Melbourne
3705	3	Q1	\N	f	1	977	session_6JGq3jWS	f	2018-03-24 00:00:00+00	Australia/Melbourne
3706	4	Q2	\N	f	1	977	session_Xz0Qz6Ra	f	2018-03-24 00:00:00+00	Australia/Melbourne
3707	5	Q3	\N	f	1	977	session_BuHwNFFp	f	2018-03-24 00:00:00+00	Australia/Melbourne
3708	1	FP1	\N	f	1	977	session_2UAtrUzd	f	2018-03-23 00:00:00+00	Australia/Melbourne
3654	6	FP3	\N	f	1	969	session_YDTDTH9J	f	2017-09-02 00:00:00+00	Europe/Rome
3683	7	R	\N	f	16	974	session_YdO9lI0Y	t	2017-10-29 19:00:00+00	America/Mexico_City
3684	3	Q1	\N	f	1	974	session_OI1a8t5o	f	2017-10-28 00:00:00+00	America/Mexico_City
3685	4	Q2	\N	f	1	974	session_SEx7Lykf	f	2017-10-28 00:00:00+00	America/Mexico_City
3686	5	Q3	\N	f	1	974	session_95APgUPw	f	2017-10-28 00:00:00+00	America/Mexico_City
3687	1	FP1	\N	f	1	974	session_p7wVPmUH	f	2017-10-27 00:00:00+00	America/Mexico_City
3688	2	FP2	\N	f	1	974	session_Q9UjPwxu	f	2017-10-27 00:00:00+00	America/Mexico_City
3703	6	FP3	\N	f	1	976	session_JRGYeZBe	f	2017-11-25 00:00:00+00	Asia/Dubai
3774	7	R	\N	f	16	987	session_FRZ3Kwu0	t	2018-07-22 13:10:00+00	Europe/Berlin
3775	3	Q1	\N	f	1	987	session_qaGBo3it	f	2018-07-21 00:00:00+00	Europe/Berlin
3776	4	Q2	\N	f	1	987	session_7fe1RcjJ	f	2018-07-21 00:00:00+00	Europe/Berlin
3777	5	Q3	\N	f	1	987	session_IX6Ysna6	f	2018-07-21 00:00:00+00	Europe/Berlin
3788	7	R	\N	f	16	989	session_4OcbVhYS	t	2018-08-26 13:10:00+00	Europe/Brussels
3789	3	Q1	\N	f	1	989	session_sdcHimZd	f	2018-08-25 00:00:00+00	Europe/Brussels
3790	4	Q2	\N	f	1	989	session_GIVXX1wc	f	2018-08-25 00:00:00+00	Europe/Brussels
3791	5	Q3	\N	f	1	989	session_3IVIxhgf	f	2018-08-25 00:00:00+00	Europe/Brussels
3792	1	FP1	\N	f	1	989	session_1Cjw475m	f	2018-08-24 00:00:00+00	Europe/Brussels
3793	2	FP2	\N	f	1	989	session_4lJD7a0o	f	2018-08-24 00:00:00+00	Europe/Brussels
3781	7	R	\N	f	16	988	session_c8w4Hc3D	t	2018-07-29 13:10:00+00	Europe/Budapest
3782	3	Q1	\N	f	1	988	session_JYvqE9kY	f	2018-07-28 00:00:00+00	Europe/Budapest
3783	4	Q2	\N	f	1	988	session_QWDaJ1ko	f	2018-07-28 00:00:00+00	Europe/Budapest
3784	5	Q3	\N	f	1	988	session_7x5fEYSk	f	2018-07-28 00:00:00+00	Europe/Budapest
3785	1	FP1	\N	f	1	988	session_8EaDOOZe	f	2018-07-27 00:00:00+00	Europe/Budapest
3786	2	FP2	\N	f	1	988	session_pPtrLSmm	f	2018-07-27 00:00:00+00	Europe/Budapest
3767	7	R	\N	f	16	986	session_2yppbRBt	t	2018-07-08 13:10:00+00	Europe/London
3768	3	Q1	\N	f	1	986	session_HJ0ikDMJ	f	2018-07-07 00:00:00+00	Europe/London
3769	4	Q2	\N	f	1	986	session_jqf9TbrX	f	2018-07-07 00:00:00+00	Europe/London
3770	5	Q3	\N	f	1	986	session_YG94Mr68	f	2018-07-07 00:00:00+00	Europe/London
3771	1	FP1	\N	f	1	986	session_VjagA5CX	f	2018-07-06 00:00:00+00	Europe/London
3772	2	FP2	\N	f	1	986	session_Q6y6rc6g	f	2018-07-06 00:00:00+00	Europe/London
3732	7	R	\N	f	16	981	session_gF6UaxOI	t	2018-05-13 13:10:00+00	Europe/Madrid
3733	3	Q1	\N	f	1	981	session_VwQHxCqf	f	2018-05-12 00:00:00+00	Europe/Madrid
3734	4	Q2	\N	f	1	981	session_NMSGwmwR	f	2018-05-12 00:00:00+00	Europe/Madrid
3735	5	Q3	\N	f	1	981	session_t5dRpiiK	f	2018-05-12 00:00:00+00	Europe/Madrid
3736	1	FP1	\N	f	1	981	session_J5rsM9WI	f	2018-05-11 00:00:00+00	Europe/Madrid
3737	2	FP2	\N	f	1	981	session_5DyFOqdS	f	2018-05-11 00:00:00+00	Europe/Madrid
3738	6	FP3	\N	f	1	981	session_kRIOajoc	f	2018-05-12 00:00:00+00	Europe/Madrid
3739	7	R	\N	f	16	982	session_NdWLinXy	t	2018-05-27 13:10:00+00	Europe/Monaco
3740	3	Q1	\N	f	1	982	session_a3RINrrp	f	2018-05-26 00:00:00+00	Europe/Monaco
3741	4	Q2	\N	f	1	982	session_6siQUHgK	f	2018-05-26 00:00:00+00	Europe/Monaco
3742	5	Q3	\N	f	1	982	session_iIXGhsZa	f	2018-05-26 00:00:00+00	Europe/Monaco
3743	1	FP1	\N	f	1	982	session_0XjaPaJ3	f	2018-05-24 00:00:00+00	Europe/Monaco
3744	2	FP2	\N	f	1	982	session_F7vBymHh	f	2018-05-24 00:00:00+00	Europe/Monaco
3753	7	R	\N	f	16	984	session_0poaoJtj	t	2018-06-24 14:10:00+00	Europe/Paris
3754	3	Q1	\N	f	1	984	session_ZJ8KSCn8	f	2018-06-23 00:00:00+00	Europe/Paris
3755	4	Q2	\N	f	1	984	session_IzsIQKSs	f	2018-06-23 00:00:00+00	Europe/Paris
3756	5	Q3	\N	f	1	984	session_IXnbUh6x	f	2018-06-23 00:00:00+00	Europe/Paris
3757	1	FP1	\N	f	1	984	session_I1ysprHB	f	2018-06-22 00:00:00+00	Europe/Paris
3758	2	FP2	\N	f	1	984	session_VU35WeAG	f	2018-06-22 00:00:00+00	Europe/Paris
3795	7	R	\N	f	16	990	session_aQHic4Li	t	2018-09-02 13:10:00+00	Europe/Rome
3796	3	Q1	\N	f	1	990	session_bNla32GA	f	2018-09-01 00:00:00+00	Europe/Rome
3797	4	Q2	\N	f	1	990	session_lc9O6LxU	f	2018-09-01 00:00:00+00	Europe/Rome
3798	5	Q3	\N	f	1	990	session_pCt8H81M	f	2018-09-01 00:00:00+00	Europe/Rome
3799	1	FP1	\N	f	1	990	session_CJB325Je	f	2018-08-31 00:00:00+00	Europe/Rome
3800	2	FP2	\N	f	1	990	session_Q3wEJkgd	f	2018-08-31 00:00:00+00	Europe/Rome
3801	6	FP3	\N	f	1	990	session_0HPdK6Ni	f	2018-09-01 00:00:00+00	Europe/Rome
3760	7	R	\N	f	16	985	session_tUfsVr9l	t	2018-07-01 13:10:00+00	Europe/Vienna
3761	3	Q1	\N	f	1	985	session_nTwCWMt5	f	2018-06-30 00:00:00+00	Europe/Vienna
3762	4	Q2	\N	f	1	985	session_ag91EQbM	f	2018-06-30 00:00:00+00	Europe/Vienna
3763	5	Q3	\N	f	1	985	session_ie7eYC85	f	2018-06-30 00:00:00+00	Europe/Vienna
3764	1	FP1	\N	f	1	985	session_gIajlUUe	f	2018-06-29 00:00:00+00	Europe/Vienna
3765	2	FP2	\N	f	1	985	session_9GAeFSXO	f	2018-06-29 00:00:00+00	Europe/Vienna
3728	5	Q3	\N	f	1	980	session_2vclDMoq	f	2018-04-28 00:00:00+00	Asia/Baku
3729	1	FP1	\N	f	1	980	session_iADCiBHd	f	2018-04-27 00:00:00+00	Asia/Baku
3730	2	FP2	\N	f	1	980	session_GOYJF0FW	f	2018-04-27 00:00:00+00	Asia/Baku
3731	6	FP3	\N	f	1	980	session_87QqHFiI	f	2018-04-28 00:00:00+00	Asia/Baku
3778	1	FP1	\N	f	1	987	session_EUNXPCV2	f	2018-07-20 00:00:00+00	Europe/Berlin
3779	2	FP2	\N	f	1	987	session_hyJQ7BuP	f	2018-07-20 00:00:00+00	Europe/Berlin
3837	7	R	\N	f	16	996	session_w7TAKqpj	t	2018-11-11 17:10:00+00	America/Sao_Paulo
3838	3	Q1	\N	f	1	996	session_3zYSPHhs	f	2018-11-10 00:00:00+00	America/Sao_Paulo
3839	4	Q2	\N	f	1	996	session_g833DGrt	f	2018-11-10 00:00:00+00	America/Sao_Paulo
3840	5	Q3	\N	f	1	996	session_2mFWrtLk	f	2018-11-10 00:00:00+00	America/Sao_Paulo
3841	1	FP1	\N	f	1	996	session_z7xasauS	f	2018-11-09 00:00:00+00	America/Sao_Paulo
3842	2	FP2	\N	f	1	996	session_eLXGdH39	f	2018-11-09 00:00:00+00	America/Sao_Paulo
3858	7	R	\N	f	18	999	session_UMxhO53d	t	2019-03-31 15:10:00+00	Asia/Bahrain
3859	3	Q1	\N	f	1	999	session_er3oZh7z	f	2019-03-30 00:00:00+00	Asia/Bahrain
3860	4	Q2	\N	f	1	999	session_JqMuWXAP	f	2019-03-30 00:00:00+00	Asia/Bahrain
3861	5	Q3	\N	f	1	999	session_It7FtIY9	f	2019-03-30 00:00:00+00	Asia/Bahrain
3862	1	FP1	\N	f	1	999	session_m5DAGRRi	f	2019-03-29 00:00:00+00	Asia/Bahrain
3863	2	FP2	\N	f	1	999	session_ea4gjtaB	f	2019-03-29 00:00:00+00	Asia/Bahrain
3872	7	R	\N	f	18	1001	session_P3GEXjAJ	t	2019-04-28 12:10:00+00	Asia/Baku
3873	3	Q1	\N	f	1	1001	session_urltliiy	f	2019-04-27 00:00:00+00	Asia/Baku
3874	4	Q2	\N	f	1	1001	session_TOKyfBsM	f	2019-04-27 00:00:00+00	Asia/Baku
3875	5	Q3	\N	f	1	1001	session_AQYWCTaw	f	2019-04-27 00:00:00+00	Asia/Baku
3844	7	R	\N	f	16	997	session_dCGWNgu5	t	2018-11-25 13:10:00+00	Asia/Dubai
3845	3	Q1	\N	f	1	997	session_ibcUZ1GH	f	2018-11-24 00:00:00+00	Asia/Dubai
3846	4	Q2	\N	f	1	997	session_YxEmBQQq	f	2018-11-24 00:00:00+00	Asia/Dubai
3847	5	Q3	\N	f	1	997	session_JqN3G5fX	f	2018-11-24 00:00:00+00	Asia/Dubai
3848	1	FP1	\N	f	1	997	session_CYtLcfz3	f	2018-11-23 00:00:00+00	Asia/Dubai
3849	2	FP2	\N	f	1	997	session_MYv31OmJ	f	2018-11-23 00:00:00+00	Asia/Dubai
3865	7	R	\N	f	18	1000	session_0JXSEpXy	t	2019-04-14 06:10:00+00	Asia/Shanghai
3866	3	Q1	\N	f	1	1000	session_oSDsdwUr	f	2019-04-13 00:00:00+00	Asia/Shanghai
3867	4	Q2	\N	f	1	1000	session_f228DHsD	f	2019-04-13 00:00:00+00	Asia/Shanghai
3868	5	Q3	\N	f	1	1000	session_RnolMFxw	f	2019-04-13 00:00:00+00	Asia/Shanghai
3869	1	FP1	\N	f	1	1000	session_PmQZo0IP	f	2019-04-12 00:00:00+00	Asia/Shanghai
3870	2	FP2	\N	f	1	1000	session_vOIaYmW1	f	2019-04-12 00:00:00+00	Asia/Shanghai
3802	7	R	\N	f	16	991	session_5f0G0ak7	t	2018-09-16 12:10:00+00	Asia/Singapore
3803	3	Q1	\N	f	1	991	session_72BbeOGe	f	2018-09-15 00:00:00+00	Asia/Singapore
3804	4	Q2	\N	f	1	991	session_zhXQFeuW	f	2018-09-15 00:00:00+00	Asia/Singapore
3805	5	Q3	\N	f	1	991	session_cd4NFpg7	f	2018-09-15 00:00:00+00	Asia/Singapore
3806	1	FP1	\N	f	1	991	session_ftKYraxd	f	2018-09-14 00:00:00+00	Asia/Singapore
3807	2	FP2	\N	f	1	991	session_ZxxEp4cl	f	2018-09-14 00:00:00+00	Asia/Singapore
3816	7	R	\N	f	16	993	session_JH5grwYk	t	2018-10-07 05:10:00+00	Asia/Tokyo
3817	3	Q1	\N	f	1	993	session_6nmYx2E4	f	2018-10-06 00:00:00+00	Asia/Tokyo
3818	4	Q2	\N	f	1	993	session_cFyLTodH	f	2018-10-06 00:00:00+00	Asia/Tokyo
3819	5	Q3	\N	f	1	993	session_yqQUSV7i	f	2018-10-06 00:00:00+00	Asia/Tokyo
3820	1	FP1	\N	f	1	993	session_v4Gu26AW	f	2018-10-05 00:00:00+00	Asia/Tokyo
3821	2	FP2	\N	f	1	993	session_kMaKfwlM	f	2018-10-05 00:00:00+00	Asia/Tokyo
3822	6	FP3	\N	f	1	993	session_B7axqOPe	f	2018-10-06 00:00:00+00	Asia/Tokyo
3851	7	R	\N	f	18	998	session_tYRQTW0A	t	2019-03-17 05:10:00+00	Australia/Melbourne
3852	3	Q1	\N	f	1	998	session_ZH0R9aNO	f	2019-03-16 00:00:00+00	Australia/Melbourne
3853	4	Q2	\N	f	1	998	session_9CEwOhXT	f	2019-03-16 00:00:00+00	Australia/Melbourne
3854	5	Q3	\N	f	1	998	session_j51GI5nT	f	2019-03-16 00:00:00+00	Australia/Melbourne
3855	1	FP1	\N	f	1	998	session_qsguKps7	f	2019-03-15 00:00:00+00	Australia/Melbourne
3809	7	R	\N	f	16	992	session_uGrX6nS2	t	2018-09-30 11:10:00+00	Europe/Moscow
3810	3	Q1	\N	f	1	992	session_N01WoldL	f	2018-09-29 00:00:00+00	Europe/Moscow
3811	4	Q2	\N	f	1	992	session_hVxZtWiS	f	2018-09-29 00:00:00+00	Europe/Moscow
3812	5	Q3	\N	f	1	992	session_Gqm4zc48	f	2018-09-29 00:00:00+00	Europe/Moscow
3813	1	FP1	\N	f	1	992	session_UrIPxCOD	f	2018-09-28 00:00:00+00	Europe/Moscow
3814	2	FP2	\N	f	1	992	session_d5IyZBQm	f	2018-09-28 00:00:00+00	Europe/Moscow
3815	6	FP3	\N	f	1	992	session_sVDH2GSh	f	2018-09-29 00:00:00+00	Europe/Moscow
3830	7	R	\N	f	16	995	session_R7koDouU	t	2018-10-28 19:10:00+00	America/Mexico_City
3831	3	Q1	\N	f	1	995	session_XOzcRnvL	f	2018-10-27 00:00:00+00	America/Mexico_City
3832	4	Q2	\N	f	1	995	session_EK1btdRa	f	2018-10-27 00:00:00+00	America/Mexico_City
3833	5	Q3	\N	f	1	995	session_RQsqFE3Z	f	2018-10-27 00:00:00+00	America/Mexico_City
3834	1	FP1	\N	f	1	995	session_tmWa7JjA	f	2018-10-26 00:00:00+00	America/Mexico_City
3835	2	FP2	\N	f	1	995	session_oJcsKQzP	f	2018-10-26 00:00:00+00	America/Mexico_City
3949	7	R	\N	f	18	1012	session_HXNcjIvs	t	2019-09-22 12:10:00+00	Asia/Singapore
3921	7	R	\N	f	18	1008	session_NJd4qIdT	t	2019-07-28 13:10:00+00	Europe/Berlin
3922	3	Q1	\N	f	1	1008	session_cMRVSlRy	f	2019-07-27 00:00:00+00	Europe/Berlin
3923	4	Q2	\N	f	1	1008	session_7znbPs1K	f	2019-07-27 00:00:00+00	Europe/Berlin
3935	7	R	\N	f	18	1010	session_X8hdf8zh	t	2019-09-01 13:10:00+00	Europe/Brussels
3936	3	Q1	\N	f	1	1010	session_hQRH4zeR	f	2019-08-31 00:00:00+00	Europe/Brussels
3937	4	Q2	\N	f	1	1010	session_e2tpcEKb	f	2019-08-31 00:00:00+00	Europe/Brussels
3938	5	Q3	\N	f	1	1010	session_M3ReIIWX	f	2019-08-31 00:00:00+00	Europe/Brussels
3939	1	FP1	\N	f	1	1010	session_MwDXzdrP	f	2019-08-30 00:00:00+00	Europe/Brussels
3940	2	FP2	\N	f	1	1010	session_F4tHqKKx	f	2019-08-30 00:00:00+00	Europe/Brussels
3928	7	R	\N	f	18	1009	session_ijRsi0zl	t	2019-08-04 13:10:00+00	Europe/Budapest
3929	3	Q1	\N	f	1	1009	session_7hIEMPBF	f	2019-08-03 00:00:00+00	Europe/Budapest
3930	4	Q2	\N	f	1	1009	session_BR9tz14Z	f	2019-08-03 00:00:00+00	Europe/Budapest
3931	5	Q3	\N	f	1	1009	session_fDh2Bv2L	f	2019-08-03 00:00:00+00	Europe/Budapest
3932	1	FP1	\N	f	1	1009	session_j6YSnR1w	f	2019-08-02 00:00:00+00	Europe/Budapest
3933	2	FP2	\N	f	1	1009	session_Oiiko2sZ	f	2019-08-02 00:00:00+00	Europe/Budapest
3914	7	R	\N	f	18	1007	session_AGakvqjW	t	2019-07-14 13:10:00+00	Europe/London
3915	3	Q1	\N	f	1	1007	session_S9axPdYR	f	2019-07-13 00:00:00+00	Europe/London
3916	4	Q2	\N	f	1	1007	session_u982lgit	f	2019-07-13 00:00:00+00	Europe/London
3917	5	Q3	\N	f	1	1007	session_6WhuoVZP	f	2019-07-13 00:00:00+00	Europe/London
3918	1	FP1	\N	f	1	1007	session_f4z2mBhm	f	2019-07-12 00:00:00+00	Europe/London
3919	2	FP2	\N	f	1	1007	session_8aDL5Tv5	f	2019-07-12 00:00:00+00	Europe/London
3879	7	R	\N	f	18	1002	session_qFQg1yuo	t	2019-05-12 13:10:00+00	Europe/Madrid
3880	3	Q1	\N	f	1	1002	session_ueGpZWAs	f	2019-05-11 00:00:00+00	Europe/Madrid
3881	4	Q2	\N	f	1	1002	session_diclpi9X	f	2019-05-11 00:00:00+00	Europe/Madrid
3882	5	Q3	\N	f	1	1002	session_wiw4fH23	f	2019-05-11 00:00:00+00	Europe/Madrid
3883	1	FP1	\N	f	1	1002	session_lIdNsyfv	f	2019-05-10 00:00:00+00	Europe/Madrid
3884	2	FP2	\N	f	1	1002	session_iDGAivuY	f	2019-05-10 00:00:00+00	Europe/Madrid
3885	6	FP3	\N	f	1	1002	session_9y3APRB2	f	2019-05-11 00:00:00+00	Europe/Madrid
3886	7	R	\N	f	18	1003	session_wkuvnd00	t	2019-05-26 13:10:00+00	Europe/Monaco
3887	3	Q1	\N	f	1	1003	session_2tPRhVF7	f	2019-05-25 00:00:00+00	Europe/Monaco
3888	4	Q2	\N	f	1	1003	session_qLUpGxAw	f	2019-05-25 00:00:00+00	Europe/Monaco
3889	5	Q3	\N	f	1	1003	session_GLmKJYKY	f	2019-05-25 00:00:00+00	Europe/Monaco
3890	1	FP1	\N	f	1	1003	session_EibUwyS1	f	2019-05-23 00:00:00+00	Europe/Monaco
3891	2	FP2	\N	f	1	1003	session_ArAgmS9I	f	2019-05-23 00:00:00+00	Europe/Monaco
3900	7	R	\N	f	18	1005	session_Ut3hr9ea	t	2019-06-23 13:10:00+00	Europe/Paris
3901	3	Q1	\N	f	1	1005	session_4GfqQjTU	f	2019-06-22 00:00:00+00	Europe/Paris
3902	4	Q2	\N	f	1	1005	session_0RFUea4w	f	2019-06-22 00:00:00+00	Europe/Paris
3903	5	Q3	\N	f	1	1005	session_NUlTIoPZ	f	2019-06-22 00:00:00+00	Europe/Paris
3904	1	FP1	\N	f	1	1005	session_4ScqMhK8	f	2019-06-21 00:00:00+00	Europe/Paris
3905	2	FP2	\N	f	1	1005	session_yHeD8PRU	f	2019-06-21 00:00:00+00	Europe/Paris
3942	7	R	\N	f	18	1011	session_lg4zF9NG	t	2019-09-08 13:10:00+00	Europe/Rome
3943	3	Q1	\N	f	1	1011	session_Fsr4UXKN	f	2019-09-07 00:00:00+00	Europe/Rome
3944	4	Q2	\N	f	1	1011	session_8IsF27km	f	2019-09-07 00:00:00+00	Europe/Rome
3945	5	Q3	\N	f	1	1011	session_vIpeMpuL	f	2019-09-07 00:00:00+00	Europe/Rome
3946	1	FP1	\N	f	1	1011	session_tL2GYQsc	f	2019-09-06 00:00:00+00	Europe/Rome
3947	2	FP2	\N	f	1	1011	session_IxviJ5m0	f	2019-09-06 00:00:00+00	Europe/Rome
3948	6	FP3	\N	f	1	1011	session_36uUk6Jn	f	2019-09-07 00:00:00+00	Europe/Rome
3907	7	R	\N	f	18	1006	session_8Pv8Xq69	t	2019-06-30 13:10:00+00	Europe/Vienna
3908	3	Q1	\N	f	1	1006	session_vGFB4CW9	f	2019-06-29 00:00:00+00	Europe/Vienna
3909	4	Q2	\N	f	1	1006	session_uwtNgb9V	f	2019-06-29 00:00:00+00	Europe/Vienna
3910	5	Q3	\N	f	1	1006	session_qNe7jSTd	f	2019-06-29 00:00:00+00	Europe/Vienna
3911	1	FP1	\N	f	1	1006	session_u3VaJFrT	f	2019-06-28 00:00:00+00	Europe/Vienna
3912	2	FP2	\N	f	1	1006	session_IHtpVWKu	f	2019-06-28 00:00:00+00	Europe/Vienna
3876	1	FP1	\N	f	1	1001	session_VcjwQLSb	f	2019-04-26 00:00:00+00	Asia/Baku
3877	2	FP2	\N	f	1	1001	session_5NN6Cr0z	f	2019-04-26 00:00:00+00	Asia/Baku
3878	6	FP3	\N	f	1	1001	session_dOjzrG30	f	2019-04-27 00:00:00+00	Asia/Baku
3924	5	Q3	\N	f	1	1008	session_Jtzmq3wo	f	2019-07-27 00:00:00+00	Europe/Berlin
3925	1	FP1	\N	f	1	1008	session_npfvr272	f	2019-07-26 00:00:00+00	Europe/Berlin
3926	2	FP2	\N	f	1	1008	session_vNkTTSL5	f	2019-07-26 00:00:00+00	Europe/Berlin
3984	7	R	\N	f	18	1017	session_1OwgYsO9	t	2019-11-17 17:10:00+00	America/Sao_Paulo
3985	3	Q1	\N	f	1	1017	session_3Q4pgav4	f	2019-11-16 00:00:00+00	America/Sao_Paulo
3986	4	Q2	\N	f	1	1017	session_XgIBFX6e	f	2019-11-16 00:00:00+00	America/Sao_Paulo
3987	5	Q3	\N	f	1	1017	session_wDu4ZOWW	f	2019-11-16 00:00:00+00	America/Sao_Paulo
3988	1	FP1	\N	f	1	1017	session_lzpiCpUD	f	2019-11-15 00:00:00+00	America/Sao_Paulo
3989	2	FP2	\N	f	1	1017	session_F6lyB6HU	f	2019-11-15 00:00:00+00	America/Sao_Paulo
3991	7	R	\N	f	18	1018	session_ZFu8ilof	t	2019-12-01 13:10:00+00	Asia/Dubai
3992	3	Q1	\N	f	1	1018	session_enl4k5Ec	f	2019-11-30 00:00:00+00	Asia/Dubai
3993	4	Q2	\N	f	1	1018	session_Nsp40vY1	f	2019-11-30 00:00:00+00	Asia/Dubai
3994	5	Q3	\N	f	1	1018	session_isI17oqK	f	2019-11-30 00:00:00+00	Asia/Dubai
3995	1	FP1	\N	f	1	1018	session_4rvC2XfR	f	2019-11-29 00:00:00+00	Asia/Dubai
3996	2	FP2	\N	f	1	1018	session_fyOXxURZ	f	2019-11-29 00:00:00+00	Asia/Dubai
3950	3	Q1	\N	f	1	1012	session_J3Gs8BC1	f	2019-09-21 00:00:00+00	Asia/Singapore
3951	4	Q2	\N	f	1	1012	session_INKDpqVX	f	2019-09-21 00:00:00+00	Asia/Singapore
3952	5	Q3	\N	f	1	1012	session_UCfVajNn	f	2019-09-21 00:00:00+00	Asia/Singapore
3953	1	FP1	\N	f	1	1012	session_8QfhPhUu	f	2019-09-20 00:00:00+00	Asia/Singapore
3954	2	FP2	\N	f	1	1012	session_lNd5FaPE	f	2019-09-20 00:00:00+00	Asia/Singapore
3955	6	FP3	\N	f	1	1012	session_VOhmoew9	f	2019-09-21 00:00:00+00	Asia/Singapore
3963	7	R	\N	f	18	1014	session_itWsCffr	t	2019-10-13 05:10:00+00	Asia/Tokyo
3964	3	Q1	\N	f	1	1014	session_RXpgWDqw	f	2019-10-12 00:00:00+00	Asia/Tokyo
3965	4	Q2	\N	f	1	1014	session_S9rMu8cQ	f	2019-10-12 00:00:00+00	Asia/Tokyo
3966	5	Q3	\N	f	1	1014	session_BxnE7mol	f	2019-10-12 00:00:00+00	Asia/Tokyo
3967	1	FP1	\N	f	1	1014	session_hCpxdgJe	f	2019-10-11 00:00:00+00	Asia/Tokyo
4012	7	R	\N	f	18	1021	session_cvEBvUiq	t	2020-07-19 13:10:00+00	Europe/Budapest
4013	3	Q1	\N	f	1	1021	session_bE0GoMdJ	f	2020-07-18 00:00:00+00	Europe/Budapest
4019	7	R	\N	f	18	1022	session_jBDZNQQf	t	2020-08-02 13:10:00+00	Europe/London
4020	3	Q1	\N	f	1	1022	session_aBcf4NAr	f	2020-08-01 00:00:00+00	Europe/London
4021	4	Q2	\N	f	1	1022	session_Q5XcMEEn	f	2020-08-01 00:00:00+00	Europe/London
4022	5	Q3	\N	f	1	1022	session_nS6dBljK	f	2020-08-01 00:00:00+00	Europe/London
4023	1	FP1	\N	f	1	1022	session_XtEDT6eQ	f	2020-07-31 00:00:00+00	Europe/London
3956	7	R	\N	f	18	1013	session_90SpDrmI	t	2019-09-29 11:10:00+00	Europe/Moscow
3957	3	Q1	\N	f	1	1013	session_Lma4TgXB	f	2019-09-28 00:00:00+00	Europe/Moscow
3958	4	Q2	\N	f	1	1013	session_rmGIg3j5	f	2019-09-28 00:00:00+00	Europe/Moscow
3959	5	Q3	\N	f	1	1013	session_T7vjDEl3	f	2019-09-28 00:00:00+00	Europe/Moscow
3960	1	FP1	\N	f	1	1013	session_owfQANEg	f	2019-09-27 00:00:00+00	Europe/Moscow
3961	2	FP2	\N	f	1	1013	session_mqIRpTWf	f	2019-09-27 00:00:00+00	Europe/Moscow
3998	7	R	\N	f	18	1019	session_XSUo98E3	t	2020-07-05 13:10:00+00	Europe/Vienna
3999	3	Q1	\N	f	1	1019	session_CPVCHF3R	f	2020-07-04 00:00:00+00	Europe/Vienna
4000	4	Q2	\N	f	1	1019	session_lhcDsaS0	f	2020-07-04 00:00:00+00	Europe/Vienna
4001	5	Q3	\N	f	1	1019	session_aprzgxuI	f	2020-07-04 00:00:00+00	Europe/Vienna
4002	1	FP1	\N	f	1	1019	session_euqQMVoS	f	2020-07-03 00:00:00+00	Europe/Vienna
4003	2	FP2	\N	f	1	1019	session_f4DrEQJM	f	2020-07-03 00:00:00+00	Europe/Vienna
3970	7	R	\N	f	18	1015	session_LeDxYgFk	t	2019-10-27 19:10:00+00	America/Mexico_City
3971	3	Q1	\N	f	1	1015	session_UMFkYXRV	f	2019-10-26 00:00:00+00	America/Mexico_City
3972	4	Q2	\N	f	1	1015	session_ktiUAZlq	f	2019-10-26 00:00:00+00	America/Mexico_City
3973	5	Q3	\N	f	1	1015	session_vxhlHg3a	f	2019-10-26 00:00:00+00	America/Mexico_City
3974	1	FP1	\N	f	1	1015	session_Th0yDwlu	f	2019-10-25 00:00:00+00	America/Mexico_City
3975	2	FP2	\N	f	1	1015	session_ftwc6GBH	f	2019-10-25 00:00:00+00	America/Mexico_City
3997	6	FP3	\N	f	1	1018	session_Nj9OQDiS	f	2019-11-30 00:00:00+00	Asia/Dubai
4014	4	Q2	\N	f	1	1021	session_WKfsGyF5	f	2020-07-18 00:00:00+00	Europe/Budapest
4015	5	Q3	\N	f	1	1021	session_1ybEwIFu	f	2020-07-18 00:00:00+00	Europe/Budapest
4016	1	FP1	\N	f	1	1021	session_4Jjc8NT0	f	2020-07-17 00:00:00+00	Europe/Budapest
4017	2	FP2	\N	f	1	1021	session_Kxpqln6n	f	2020-07-17 00:00:00+00	Europe/Budapest
4018	6	FP3	\N	f	1	1021	session_caNtjEgT	f	2020-07-18 00:00:00+00	Europe/Budapest
4075	7	R	\N	f	18	1030	session_k9l5uND5	t	2020-10-25 12:10:00+00	Europe/Lisbon
4076	3	Q1	\N	f	1	1030	session_G8O00Hkt	f	2020-10-24 00:00:00+00	Europe/Lisbon
4077	4	Q2	\N	f	1	1030	session_ILQsAQpk	f	2020-10-24 00:00:00+00	Europe/Lisbon
4078	5	Q3	\N	f	1	1030	session_RGJ6aG0C	f	2020-10-24 00:00:00+00	Europe/Lisbon
4079	1	FP1	\N	f	1	1030	session_UuEPCUgV	f	2020-10-23 00:00:00+00	Europe/Lisbon
4080	2	FP2	\N	f	1	1030	session_wOxyyqUw	f	2020-10-23 00:00:00+00	Europe/Lisbon
4024	2	FP2	\N	f	1	1022	session_2cAFHJam	f	2020-07-31 00:00:00+00	Europe/London
4025	6	FP3	\N	f	1	1022	session_U0z6veF2	f	2020-08-01 00:00:00+00	Europe/London
4026	7	R	\N	f	18	1023	session_TsFZLxX5	t	2020-08-09 13:10:00+00	Europe/London
4027	3	Q1	\N	f	1	1023	session_At7biA1q	f	2020-08-08 00:00:00+00	Europe/London
4028	4	Q2	\N	f	1	1023	session_Kv88MPJD	f	2020-08-08 00:00:00+00	Europe/London
4029	5	Q3	\N	f	1	1023	session_HBiNmr6i	f	2020-08-08 00:00:00+00	Europe/London
4030	1	FP1	\N	f	1	1023	session_bogbiLZn	f	2020-08-07 00:00:00+00	Europe/London
4033	7	R	\N	f	18	1024	session_qLnJJ1S3	t	2020-08-16 13:10:00+00	Europe/Madrid
4034	3	Q1	\N	f	1	1024	session_4kRkZ4bW	f	2020-08-15 00:00:00+00	Europe/Madrid
4035	4	Q2	\N	f	1	1024	session_4a5PVpqn	f	2020-08-15 00:00:00+00	Europe/Madrid
4036	5	Q3	\N	f	1	1024	session_fH9vjoY5	f	2020-08-15 00:00:00+00	Europe/Madrid
4037	1	FP1	\N	f	1	1024	session_cx2t9WeY	f	2020-08-14 00:00:00+00	Europe/Madrid
4038	2	FP2	\N	f	1	1024	session_7MqNse3D	f	2020-08-14 00:00:00+00	Europe/Madrid
4039	6	FP3	\N	f	1	1024	session_BRN54OtA	f	2020-08-15 00:00:00+00	Europe/Madrid
4061	7	R	\N	f	18	1028	session_BDZO0c7E	t	2020-09-27 11:10:00+00	Europe/Moscow
4062	3	Q1	\N	f	1	1028	session_O3Ima9y7	f	2020-09-26 00:00:00+00	Europe/Moscow
4063	4	Q2	\N	f	1	1028	session_x73jUJ6I	f	2020-09-26 00:00:00+00	Europe/Moscow
4064	5	Q3	\N	f	1	1028	session_GzR5YXVd	f	2020-09-26 00:00:00+00	Europe/Moscow
4065	1	FP1	\N	f	1	1028	session_Ozx8cHVA	f	2020-09-25 00:00:00+00	Europe/Moscow
4066	2	FP2	\N	f	1	1028	session_OStWmu2t	f	2020-09-25 00:00:00+00	Europe/Moscow
4067	6	FP3	\N	f	1	1028	session_uJmpxkWw	f	2020-09-26 00:00:00+00	Europe/Moscow
4047	7	R	\N	f	18	1026	session_chkaRmzr	t	2020-09-06 13:10:00+00	Europe/Rome
4048	3	Q1	\N	f	1	1026	session_TazbYNwT	f	2020-09-05 00:00:00+00	Europe/Rome
4049	4	Q2	\N	f	1	1026	session_hxQvCv0d	f	2020-09-05 00:00:00+00	Europe/Rome
4050	5	Q3	\N	f	1	1026	session_9XTV5ilO	f	2020-09-05 00:00:00+00	Europe/Rome
4051	1	FP1	\N	f	1	1026	session_TeVIB0BU	f	2020-09-04 00:00:00+00	Europe/Rome
4052	2	FP2	\N	f	1	1026	session_37lZXGVa	f	2020-09-04 00:00:00+00	Europe/Rome
4068	7	R	\N	f	18	1029	session_NZCSnSpe	t	2020-10-11 13:10:00+00	Europe/Berlin
4069	3	Q1	\N	f	1	1029	session_BvccTw9R	f	2020-10-10 00:00:00+00	Europe/Berlin
4040	7	R	\N	f	18	1025	session_2raitQvf	t	2020-08-30 13:10:00+00	Europe/Brussels
4041	3	Q1	\N	f	1	1025	session_Jy6URC4o	f	2020-08-29 00:00:00+00	Europe/Brussels
4042	4	Q2	\N	f	1	1025	session_ul1x2jdM	f	2020-08-29 00:00:00+00	Europe/Brussels
4043	5	Q3	\N	f	1	1025	session_RjedVNmv	f	2020-08-29 00:00:00+00	Europe/Brussels
4044	1	FP1	\N	f	1	1025	session_qTNkg5ym	f	2020-08-28 00:00:00+00	Europe/Brussels
4045	2	FP2	\N	f	1	1025	session_IHL8phdi	f	2020-08-28 00:00:00+00	Europe/Brussels
4089	7	R	\N	f	18	1032	session_BBSkY0fY	t	2020-11-15 10:10:00+00	Europe/Istanbul
4090	3	Q1	\N	f	1	1032	session_CrBUWvzA	f	2020-11-14 00:00:00+00	Europe/Istanbul
4091	4	Q2	\N	f	1	1032	session_fsW6YcU7	f	2020-11-14 00:00:00+00	Europe/Istanbul
4092	5	Q3	\N	f	1	1032	session_fTFyHGPC	f	2020-11-14 00:00:00+00	Europe/Istanbul
4093	1	FP1	\N	f	1	1032	session_EsAO1Dg5	f	2020-11-13 00:00:00+00	Europe/Istanbul
4094	2	FP2	\N	f	1	1032	session_J4SnepfT	f	2020-11-13 00:00:00+00	Europe/Istanbul
4095	6	FP3	\N	f	1	1032	session_pkAznBJB	f	2020-11-14 00:00:00+00	Europe/Istanbul
4110	7	R	\N	f	18	1035	session_6a8Q3o0T	t	2020-12-13 13:10:00+00	Asia/Dubai
4111	3	Q1	\N	f	1	1035	session_RijnaeUf	f	2020-12-12 00:00:00+00	Asia/Dubai
4112	4	Q2	\N	f	1	1035	session_oVw3oW8f	f	2020-12-12 00:00:00+00	Asia/Dubai
4113	5	Q3	\N	f	1	1035	session_ydAHpHDH	f	2020-12-12 00:00:00+00	Asia/Dubai
4114	1	FP1	\N	f	1	1035	session_MV1WvzLs	f	2020-12-11 00:00:00+00	Asia/Dubai
4115	2	FP2	\N	f	1	1035	session_TqA8wHIP	f	2020-12-11 00:00:00+00	Asia/Dubai
4116	6	FP3	\N	f	1	1035	session_rrfM6Cza	f	2020-12-12 00:00:00+00	Asia/Dubai
4131	7	R	\N	f	18	1038	session_AJKQH8LF	t	2021-05-02 14:00:00+00	Europe/Lisbon
4132	3	Q1	\N	f	1	1038	session_UaHQbdjM	f	2021-05-01 00:00:00+00	Europe/Lisbon
4133	4	Q2	\N	f	1	1038	session_YRuWbmEc	f	2021-05-01 00:00:00+00	Europe/Lisbon
4134	5	Q3	\N	f	1	1038	session_JTMu087d	f	2021-05-01 00:00:00+00	Europe/Lisbon
4135	1	FP1	\N	f	1	1038	session_yZdACB8v	f	2021-04-30 00:00:00+00	Europe/Lisbon
4136	2	FP2	\N	f	1	1038	session_TPRrflkg	f	2021-04-30 00:00:00+00	Europe/Lisbon
4137	6	FP3	\N	f	1	1038	session_3g7cCE0s	f	2021-05-01 00:00:00+00	Europe/Lisbon
4138	7	R	\N	f	18	1039	session_idvk1yj9	t	2021-05-09 13:00:00+00	Europe/Madrid
4139	3	Q1	\N	f	1	1039	session_UHSPGVZa	f	2021-05-08 00:00:00+00	Europe/Madrid
4140	4	Q2	\N	f	1	1039	session_9cIJNQnl	f	2021-05-08 00:00:00+00	Europe/Madrid
4141	5	Q3	\N	f	1	1039	session_Gg9kwMdm	f	2021-05-08 00:00:00+00	Europe/Madrid
4142	1	FP1	\N	f	1	1039	session_Q2aiVIvo	f	2021-05-07 00:00:00+00	Europe/Madrid
4143	2	FP2	\N	f	1	1039	session_uxFmgpGH	f	2021-05-07 00:00:00+00	Europe/Madrid
4144	6	FP3	\N	f	1	1039	session_j4MBxCok	f	2021-05-08 00:00:00+00	Europe/Madrid
4145	7	R	\N	f	18	1040	session_XnaBmgra	t	2021-05-23 13:00:00+00	Europe/Monaco
4146	3	Q1	\N	f	1	1040	session_pUl6WOc5	f	2021-05-22 00:00:00+00	Europe/Monaco
4147	4	Q2	\N	f	1	1040	session_Ex71s2PN	f	2021-05-22 00:00:00+00	Europe/Monaco
4148	5	Q3	\N	f	1	1040	session_hZQpH1xj	f	2021-05-22 00:00:00+00	Europe/Monaco
4149	1	FP1	\N	f	1	1040	session_F8aDbiqQ	f	2021-05-21 00:00:00+00	Europe/Monaco
4150	2	FP2	\N	f	1	1040	session_SPByuQ1e	f	2021-05-21 00:00:00+00	Europe/Monaco
4151	6	FP3	\N	f	1	1040	session_xt1ZrP8T	f	2021-05-22 00:00:00+00	Europe/Monaco
4159	7	R	\N	f	18	1042	session_E64EFrXo	t	2021-06-20 13:00:00+00	Europe/Paris
4160	3	Q1	\N	f	1	1042	session_lnUVJKrE	f	2021-06-19 00:00:00+00	Europe/Paris
4161	4	Q2	\N	f	1	1042	session_IyA8OFhG	f	2021-06-19 00:00:00+00	Europe/Paris
4162	5	Q3	\N	f	1	1042	session_n8IJYGjU	f	2021-06-19 00:00:00+00	Europe/Paris
4163	1	FP1	\N	f	1	1042	session_LpRgVMND	f	2021-06-18 00:00:00+00	Europe/Paris
4164	2	FP2	\N	f	1	1042	session_0H1jOzhA	f	2021-06-18 00:00:00+00	Europe/Paris
4165	6	FP3	\N	f	1	1042	session_xYaQ27Kq	f	2021-06-19 00:00:00+00	Europe/Paris
4124	7	R	\N	f	18	1037	session_TyA5xiba	t	2021-04-18 13:00:00+00	Europe/Rome
4125	3	Q1	\N	f	1	1037	session_ihOQ6mEF	f	2021-04-17 00:00:00+00	Europe/Rome
4126	4	Q2	\N	f	1	1037	session_hmMxvm4U	f	2021-04-17 00:00:00+00	Europe/Rome
4127	5	Q3	\N	f	1	1037	session_d4H5B4Yh	f	2021-04-17 00:00:00+00	Europe/Rome
4128	1	FP1	\N	f	1	1037	session_QKn5BFW2	f	2021-04-16 00:00:00+00	Europe/Rome
4129	2	FP2	\N	f	1	1037	session_Za0mLz5B	f	2021-04-16 00:00:00+00	Europe/Rome
4130	6	FP3	\N	f	1	1037	session_dwRYqV1F	f	2021-04-17 00:00:00+00	Europe/Rome
4166	7	R	\N	f	18	1043	session_iqu2Uy1L	t	2021-06-27 13:00:00+00	Europe/Vienna
4167	3	Q1	\N	f	1	1043	session_x9c9iMI0	f	2021-06-26 00:00:00+00	Europe/Vienna
4168	4	Q2	\N	f	1	1043	session_5VXqopR7	f	2021-06-26 00:00:00+00	Europe/Vienna
4169	5	Q3	\N	f	1	1043	session_dXcgUeLa	f	2021-06-26 00:00:00+00	Europe/Vienna
4170	1	FP1	\N	f	1	1043	session_EFUqPq3g	f	2021-06-25 00:00:00+00	Europe/Vienna
4171	2	FP2	\N	f	1	1043	session_HsbbrNqm	f	2021-06-25 00:00:00+00	Europe/Vienna
4152	7	R	\N	f	18	1041	session_qKgWocSl	t	2021-06-06 12:00:00+00	Asia/Baku
4153	3	Q1	\N	f	1	1041	session_ZglwemtD	f	2021-06-05 00:00:00+00	Asia/Baku
4154	4	Q2	\N	f	1	1041	session_GdMEE0YF	f	2021-06-05 00:00:00+00	Asia/Baku
4155	5	Q3	\N	f	1	1041	session_kTKX1HLQ	f	2021-06-05 00:00:00+00	Asia/Baku
4156	1	FP1	\N	f	1	1041	session_aKto1Tcf	f	2021-06-04 00:00:00+00	Asia/Baku
4157	2	FP2	\N	f	1	1041	session_CqWZvcHi	f	2021-06-04 00:00:00+00	Asia/Baku
4158	6	FP3	\N	f	1	1041	session_Q9OgzaDC	f	2021-06-05 00:00:00+00	Asia/Baku
4243	7	R	\N	f	18	1054	session_AhtE7LPV	t	2021-11-14 17:00:00+00	America/Sao_Paulo
4244	1	Q1	\N	f	1	1054	session_TzUULswU	f	2021-11-12 00:00:00+00	America/Sao_Paulo
4245	2	Q2	\N	f	1	1054	session_ayskypTt	f	2021-11-12 00:00:00+00	America/Sao_Paulo
4201	7	R	\N	f	18	1048	session_VZAJlw3y	t	2021-09-05 13:00:00+00	Europe/Amsterdam
4202	3	Q1	\N	f	1	1048	session_2LgIqzfb	f	2021-09-04 00:00:00+00	Europe/Amsterdam
4203	4	Q2	\N	f	1	1048	session_KfTAlQXU	f	2021-09-04 00:00:00+00	Europe/Amsterdam
4204	5	Q3	\N	f	1	1048	session_pIkfyDXX	f	2021-09-04 00:00:00+00	Europe/Amsterdam
4205	1	FP1	\N	f	1	1048	session_rzQvSVnE	f	2021-09-03 00:00:00+00	Europe/Amsterdam
4206	2	FP2	\N	f	1	1048	session_611leTLZ	f	2021-09-03 00:00:00+00	Europe/Amsterdam
4194	7	R	\N	f	18	1047	session_EDTISQmc	t	2021-08-29 13:00:00+00	Europe/Brussels
4195	3	Q1	\N	f	1	1047	session_M66anhBN	f	2021-08-28 00:00:00+00	Europe/Brussels
4196	4	Q2	\N	f	1	1047	session_ct06Klkg	f	2021-08-28 00:00:00+00	Europe/Brussels
4197	5	Q3	\N	f	1	1047	session_IoRY2wXW	f	2021-08-28 00:00:00+00	Europe/Brussels
4198	1	FP1	\N	f	1	1047	session_ltBMAJ78	f	2021-08-27 00:00:00+00	Europe/Brussels
4199	2	FP2	\N	f	1	1047	session_iQWsZPhx	f	2021-08-27 00:00:00+00	Europe/Brussels
4187	7	R	\N	f	18	1046	session_2TmxnUp2	t	2021-08-01 13:00:00+00	Europe/Budapest
4188	3	Q1	\N	f	1	1046	session_0RnMHY1m	f	2021-07-31 00:00:00+00	Europe/Budapest
4189	4	Q2	\N	f	1	1046	session_v8MkLmXw	f	2021-07-31 00:00:00+00	Europe/Budapest
4190	5	Q3	\N	f	1	1046	session_gwA9bRkx	f	2021-07-31 00:00:00+00	Europe/Budapest
4191	1	FP1	\N	f	1	1046	session_747mWocV	f	2021-07-30 00:00:00+00	Europe/Budapest
4192	2	FP2	\N	f	1	1046	session_HtuLzTqF	f	2021-07-30 00:00:00+00	Europe/Budapest
4222	7	R	\N	f	18	1051	session_UnVYMaYw	t	2021-10-10 12:00:00+00	Europe/Istanbul
4223	3	Q1	\N	f	1	1051	session_F0Vsb81U	f	2021-10-09 00:00:00+00	Europe/Istanbul
4224	4	Q2	\N	f	1	1051	session_2bFKPlcE	f	2021-10-09 00:00:00+00	Europe/Istanbul
4225	5	Q3	\N	f	1	1051	session_wvnY36E0	f	2021-10-09 00:00:00+00	Europe/Istanbul
4226	1	FP1	\N	f	1	1051	session_0Q4oDHh4	f	2021-10-08 00:00:00+00	Europe/Istanbul
4227	2	FP2	\N	f	1	1051	session_sjavIAIr	f	2021-10-08 00:00:00+00	Europe/Istanbul
4180	7	R	\N	f	18	1045	session_4Nfij6ck	t	2021-07-18 14:00:00+00	Europe/London
4181	1	Q1	\N	f	1	1045	session_UW4h88sJ	f	2021-07-16 00:00:00+00	Europe/London
4182	2	Q2	\N	f	1	1045	session_3W30fsgE	f	2021-07-16 00:00:00+00	Europe/London
4183	3	Q3	\N	f	1	1045	session_xZWteRXu	f	2021-07-16 00:00:00+00	Europe/London
4184	4	FP1	\N	f	1	1045	session_Q9ZEbaZS	f	2021-07-16 00:00:00+00	Europe/London
4185	5	FP2	\N	f	1	1045	session_7yHAEkjX	f	2021-07-17 00:00:00+00	Europe/London
4215	7	R	\N	f	18	1050	session_cM3JoE3R	t	2021-09-26 12:00:00+00	Europe/Moscow
4216	3	Q1	\N	f	1	1050	session_70H84est	f	2021-09-25 00:00:00+00	Europe/Moscow
4217	4	Q2	\N	f	1	1050	session_iCVF5USD	f	2021-09-25 00:00:00+00	Europe/Moscow
4218	5	Q3	\N	f	1	1050	session_aCIkP1nI	f	2021-09-25 00:00:00+00	Europe/Moscow
4219	1	FP1	\N	f	1	1050	session_PTjfTHhh	f	2021-09-24 00:00:00+00	Europe/Moscow
4220	2	FP2	\N	f	1	1050	session_l1YpTFWO	f	2021-09-24 00:00:00+00	Europe/Moscow
4208	7	R	\N	f	18	1049	session_FUqPpugO	t	2021-09-12 13:00:00+00	Europe/Rome
4209	1	Q1	\N	f	1	1049	session_pz8ww3YQ	f	2021-09-10 00:00:00+00	Europe/Rome
4210	2	Q2	\N	f	1	1049	session_KbqFI13P	f	2021-09-10 00:00:00+00	Europe/Rome
4211	3	Q3	\N	f	1	1049	session_IJEqsAL4	f	2021-09-10 00:00:00+00	Europe/Rome
4212	4	FP1	\N	f	1	1049	session_THJlohhc	f	2021-09-10 00:00:00+00	Europe/Rome
4213	5	FP2	\N	f	1	1049	session_CsWyA7SF	f	2021-09-11 00:00:00+00	Europe/Rome
4214	6	SR	\N	f	19	1049	session_HV3yLR23	f	2021-09-11 00:00:00+00	Europe/Rome
4172	6	FP3	\N	f	1	1043	session_PDaAqovy	f	2021-06-26 00:00:00+00	Europe/Vienna
4173	7	R	\N	f	18	1044	session_9xuEBKZ2	t	2021-07-04 13:00:00+00	Europe/Vienna
4174	3	Q1	\N	f	1	1044	session_jvSyb4gf	f	2021-07-03 00:00:00+00	Europe/Vienna
4175	4	Q2	\N	f	1	1044	session_CIB6TX0g	f	2021-07-03 00:00:00+00	Europe/Vienna
4176	5	Q3	\N	f	1	1044	session_0SJyROhB	f	2021-07-03 00:00:00+00	Europe/Vienna
4177	1	FP1	\N	f	1	1044	session_snO5FmLn	f	2021-07-02 00:00:00+00	Europe/Vienna
4236	7	R	\N	f	18	1053	session_uKnDbgrh	t	2021-11-07 19:00:00+00	America/Mexico_City
4237	3	Q1	\N	f	1	1053	session_McCEO1W8	f	2021-11-06 00:00:00+00	America/Mexico_City
4238	4	Q2	\N	f	1	1053	session_Y4mwDsUR	f	2021-11-06 00:00:00+00	America/Mexico_City
4239	5	Q3	\N	f	1	1053	session_UZAFxIDk	f	2021-11-06 00:00:00+00	America/Mexico_City
4240	1	FP1	\N	f	1	1053	session_2VrnYS3x	f	2021-11-05 00:00:00+00	America/Mexico_City
4241	2	FP2	\N	f	1	1053	session_Cx5fnbn4	f	2021-11-05 00:00:00+00	America/Mexico_City
4228	6	FP3	\N	f	1	1051	session_NtCvDhfH	f	2021-10-09 00:00:00+00	Europe/Istanbul
4264	7	R	\N	f	18	1057	session_CCRKWVbB	t	2021-12-12 13:00:00+00	Asia/Dubai
4265	3	Q1	\N	f	1	1057	session_4sXOmbqe	f	2021-12-11 00:00:00+00	Asia/Dubai
4266	4	Q2	\N	f	1	1057	session_fl94b6Yk	f	2021-12-11 00:00:00+00	Asia/Dubai
4267	5	Q3	\N	f	1	1057	session_xzW7mbFC	f	2021-12-11 00:00:00+00	Asia/Dubai
4268	1	FP1	\N	f	1	1057	session_ais5ySHv	f	2021-12-10 00:00:00+00	Asia/Dubai
4269	2	FP2	\N	f	1	1057	session_eGrtDmZ3	f	2021-12-10 00:00:00+00	Asia/Dubai
4270	6	FP3	\N	f	1	1057	session_zKg4yeqi	f	2021-12-11 00:00:00+00	Asia/Dubai
4250	7	R	\N	f	18	1055	session_hByFnb6j	t	2021-11-21 14:00:00+00	Asia/Qatar
4251	3	Q1	\N	f	1	1055	session_Xvr5aXGq	f	2021-11-20 00:00:00+00	Asia/Qatar
4252	4	Q2	\N	f	1	1055	session_vjETOZoL	f	2021-11-20 00:00:00+00	Asia/Qatar
4257	7	R	\N	f	18	1056	session_3czlaart	t	2021-12-05 17:30:00+00	Asia/Riyadh
4258	3	Q1	\N	f	1	1056	session_VlDcdWlf	f	2021-12-04 00:00:00+00	Asia/Riyadh
4259	4	Q2	\N	f	1	1056	session_vKbohpYV	f	2021-12-04 00:00:00+00	Asia/Riyadh
4260	5	Q3	\N	f	1	1056	session_E6yJ9eag	f	2021-12-04 00:00:00+00	Asia/Riyadh
4261	1	FP1	\N	f	1	1056	session_fRUzPzDT	f	2021-12-03 00:00:00+00	Asia/Riyadh
4262	2	FP2	\N	f	1	1056	session_XlQyxHTk	f	2021-12-03 00:00:00+00	Asia/Riyadh
4285	7	R	\N	f	20	1060	session_YI64yexk	t	2022-04-10 05:00:00+00	Australia/Melbourne
4286	4	Q1	\N	f	1	1060	session_lWs60vqs	t	2022-04-09 06:00:00+00	Australia/Melbourne
4287	5	Q2	\N	f	1	1060	session_yIgA56c0	t	2022-04-09 06:00:00+00	Australia/Melbourne
4288	6	Q3	\N	f	1	1060	session_iOWZcbf2	t	2022-04-09 06:00:00+00	Australia/Melbourne
4289	1	FP1	\N	f	1	1060	session_OKLiBk6f	t	2022-04-08 03:00:00+00	Australia/Melbourne
4290	2	FP2	\N	f	1	1060	session_X1tdaF8B	t	2022-04-08 06:00:00+00	Australia/Melbourne
4291	3	FP3	\N	f	1	1060	session_ltIgXwh2	t	2022-04-09 03:00:00+00	Australia/Melbourne
4306	7	R	\N	f	20	1063	session_ocKQJHtd	t	2022-05-22 13:00:00+00	Europe/Madrid
4307	4	Q1	\N	f	1	1063	session_jzkmWvZV	t	2022-05-21 14:00:00+00	Europe/Madrid
4308	5	Q2	\N	f	1	1063	session_cNsp0N4i	t	2022-05-21 14:00:00+00	Europe/Madrid
4309	6	Q3	\N	f	1	1063	session_DuVWDDkI	t	2022-05-21 14:00:00+00	Europe/Madrid
4310	1	FP1	\N	f	1	1063	session_AOtaQBGa	t	2022-05-20 12:00:00+00	Europe/Madrid
4311	2	FP2	\N	f	1	1063	session_cAP8IZ0J	t	2022-05-20 15:00:00+00	Europe/Madrid
4312	3	FP3	\N	f	1	1063	session_33vo4hWS	t	2022-05-21 11:00:00+00	Europe/Madrid
4313	7	R	\N	f	20	1064	session_n5Zo1WdK	t	2022-05-29 13:00:00+00	Europe/Monaco
4314	4	Q1	\N	f	1	1064	session_H6kGk7qv	t	2022-05-28 14:00:00+00	Europe/Monaco
4292	7	R	\N	f	20	1061	session_YebSWNsS	t	2022-04-24 13:00:00+00	Europe/Rome
4293	2	Q1	\N	f	1	1061	session_uZhAuvEX	t	2022-04-22 15:00:00+00	Europe/Rome
4294	3	Q2	\N	f	1	1061	session_ZrfeRTUB	t	2022-04-22 15:00:00+00	Europe/Rome
4295	4	Q3	\N	f	1	1061	session_xX2m6R9j	t	2022-04-22 15:00:00+00	Europe/Rome
4296	1	FP1	\N	f	1	1061	session_qb2YuarV	t	2022-04-22 11:30:00+00	Europe/Rome
4297	5	FP2	\N	f	1	1061	session_HfLNLnbU	t	2022-04-23 10:30:00+00	Europe/Rome
4298	6	SR	\N	f	21	1061	session_qZKzuMFv	t	2022-04-23 14:30:00+00	Europe/Rome
4246	3	Q3	\N	f	1	1054	session_LIAp7Ipj	f	2021-11-12 00:00:00+00	America/Sao_Paulo
4247	4	FP1	\N	f	1	1054	session_g9w5KK0M	f	2021-11-12 00:00:00+00	America/Sao_Paulo
4248	5	FP2	\N	f	1	1054	session_NRPZwcqp	f	2021-11-13 00:00:00+00	America/Sao_Paulo
4249	6	SR	\N	f	19	1054	session_gOfCM393	f	2021-11-13 00:00:00+00	America/Sao_Paulo
4271	7	R	\N	f	20	1058	session_eEMwlen8	t	2022-03-20 15:00:00+00	Asia/Bahrain
4272	4	Q1	\N	f	1	1058	session_M5I5fQDp	t	2022-03-19 15:00:00+00	Asia/Bahrain
4273	5	Q2	\N	f	1	1058	session_1O8v5IDu	t	2022-03-19 15:00:00+00	Asia/Bahrain
4274	6	Q3	\N	f	1	1058	session_TODqK2LD	t	2022-03-19 15:00:00+00	Asia/Bahrain
4275	1	FP1	\N	f	1	1058	session_BEngdigM	t	2022-03-18 12:00:00+00	Asia/Bahrain
4276	2	FP2	\N	f	1	1058	session_31VZRqqc	t	2022-03-18 15:00:00+00	Asia/Bahrain
4253	5	Q3	\N	f	1	1055	session_8QwfmMT5	f	2021-11-20 00:00:00+00	Asia/Qatar
4254	1	FP1	\N	f	1	1055	session_BNWb2wMy	f	2021-11-19 00:00:00+00	Asia/Qatar
4255	2	FP2	\N	f	1	1055	session_16AeIOfG	f	2021-11-19 00:00:00+00	Asia/Qatar
4256	6	FP3	\N	f	1	1055	session_AlxRNGdH	f	2021-11-20 00:00:00+00	Asia/Qatar
4369	7	R	\N	f	20	1072	session_T4tWxQd7	t	2022-09-04 13:00:00+00	Europe/Amsterdam
4370	4	Q1	\N	f	1	1072	session_wLfajeNH	t	2022-09-03 13:00:00+00	Europe/Amsterdam
4371	5	Q2	\N	f	1	1072	session_5PMUKA5W	t	2022-09-03 13:00:00+00	Europe/Amsterdam
4372	6	Q3	\N	f	1	1072	session_LB0eWctg	t	2022-09-03 13:00:00+00	Europe/Amsterdam
4373	1	FP1	\N	f	1	1072	session_Tkkk2hwe	t	2022-09-02 10:30:00+00	Europe/Amsterdam
4374	2	FP2	\N	f	1	1072	session_NKYyRnov	t	2022-09-02 14:00:00+00	Europe/Amsterdam
4375	3	FP3	\N	f	1	1072	session_Tn5oz2li	t	2022-09-03 10:00:00+00	Europe/Amsterdam
4362	7	R	\N	f	20	1071	session_vJlvHFj9	t	2022-08-28 13:00:00+00	Europe/Brussels
4363	4	Q1	\N	f	1	1071	session_bL3tZyM2	t	2022-08-27 14:00:00+00	Europe/Brussels
4364	5	Q2	\N	f	1	1071	session_ojKtqMx3	t	2022-08-27 14:00:00+00	Europe/Brussels
4365	6	Q3	\N	f	1	1071	session_UnoVHukP	t	2022-08-27 14:00:00+00	Europe/Brussels
4366	1	FP1	\N	f	1	1071	session_zYO9FKl4	t	2022-08-26 12:00:00+00	Europe/Brussels
4367	2	FP2	\N	f	1	1071	session_RS1soLjS	t	2022-08-26 15:00:00+00	Europe/Brussels
4368	3	FP3	\N	f	1	1071	session_XSLYkQsM	t	2022-08-27 11:00:00+00	Europe/Brussels
4355	7	R	\N	f	20	1070	session_kgs9y0nU	t	2022-07-31 13:00:00+00	Europe/Budapest
4356	4	Q1	\N	f	1	1070	session_jdUxm014	t	2022-07-30 14:00:00+00	Europe/Budapest
4357	5	Q2	\N	f	1	1070	session_WdWhnDO3	t	2022-07-30 14:00:00+00	Europe/Budapest
4358	6	Q3	\N	f	1	1070	session_8rNHo5Z3	t	2022-07-30 14:00:00+00	Europe/Budapest
4359	1	FP1	\N	f	1	1070	session_PUfyOnN9	t	2022-07-29 12:00:00+00	Europe/Budapest
4360	2	FP2	\N	f	1	1070	session_0je3X84s	t	2022-07-29 15:00:00+00	Europe/Budapest
4361	3	FP3	\N	f	1	1070	session_r1wht4iC	t	2022-07-30 11:00:00+00	Europe/Budapest
4334	7	R	\N	f	20	1067	session_7TrH50Pi	t	2022-07-03 14:00:00+00	Europe/London
4335	4	Q1	\N	f	1	1067	session_lqJGRwNY	t	2022-07-02 14:00:00+00	Europe/London
4336	5	Q2	\N	f	1	1067	session_g8TjCmYt	t	2022-07-02 14:00:00+00	Europe/London
4337	6	Q3	\N	f	1	1067	session_2RjfpDHh	t	2022-07-02 14:00:00+00	Europe/London
4338	1	FP1	\N	f	1	1067	session_cFA2ZEt0	t	2022-07-01 12:00:00+00	Europe/London
4339	2	FP2	\N	f	1	1067	session_VSmFzn5d	t	2022-07-01 15:00:00+00	Europe/London
4340	3	FP3	\N	f	1	1067	session_O6D8M81t	t	2022-07-02 11:00:00+00	Europe/London
4315	5	Q2	\N	f	1	1064	session_MKqaRB7A	t	2022-05-28 14:00:00+00	Europe/Monaco
4316	6	Q3	\N	f	1	1064	session_hqrtsfvq	t	2022-05-28 14:00:00+00	Europe/Monaco
4317	1	FP1	\N	f	1	1064	session_lG6dzAWD	t	2022-05-27 12:00:00+00	Europe/Monaco
4318	2	FP2	\N	f	1	1064	session_WSSD3nR0	t	2022-05-27 15:00:00+00	Europe/Monaco
4319	3	FP3	\N	f	1	1064	session_o5aMcBUi	t	2022-05-28 11:00:00+00	Europe/Monaco
4348	7	R	\N	f	20	1069	session_ssbBFn6O	t	2022-07-24 13:00:00+00	Europe/Paris
4349	4	Q1	\N	f	1	1069	session_tcIiYiuB	t	2022-07-23 14:00:00+00	Europe/Paris
4350	5	Q2	\N	f	1	1069	session_wOPwUZWL	t	2022-07-23 14:00:00+00	Europe/Paris
4351	6	Q3	\N	f	1	1069	session_nGcjGw0t	t	2022-07-23 14:00:00+00	Europe/Paris
4352	1	FP1	\N	f	1	1069	session_IS6ywkRc	t	2022-07-22 12:00:00+00	Europe/Paris
4353	2	FP2	\N	f	1	1069	session_y5l3gx7c	t	2022-07-22 15:00:00+00	Europe/Paris
4354	3	FP3	\N	f	1	1069	session_eWUI6wex	t	2022-07-23 11:00:00+00	Europe/Paris
4376	7	R	\N	f	20	1073	session_qwUKgXMe	t	2022-09-11 13:00:00+00	Europe/Rome
4377	4	Q1	\N	f	1	1073	session_LDysqbK5	t	2022-09-10 14:00:00+00	Europe/Rome
4378	5	Q2	\N	f	1	1073	session_y0S0XVdZ	t	2022-09-10 14:00:00+00	Europe/Rome
4379	6	Q3	\N	f	1	1073	session_vq7ugkxg	t	2022-09-10 14:00:00+00	Europe/Rome
4380	1	FP1	\N	f	1	1073	session_HPwJmuvA	t	2022-09-09 12:00:00+00	Europe/Rome
4341	7	R	\N	f	20	1068	session_6EVobO7W	t	2022-07-10 13:00:00+00	Europe/Vienna
4342	2	Q1	\N	f	1	1068	session_z2914Vxx	t	2022-07-08 15:00:00+00	Europe/Vienna
4343	3	Q2	\N	f	1	1068	session_9AZgBTn2	t	2022-07-08 15:00:00+00	Europe/Vienna
4344	4	Q3	\N	f	1	1068	session_o0RURYVl	t	2022-07-08 15:00:00+00	Europe/Vienna
4345	1	FP1	\N	f	1	1068	session_hiy97Mj9	t	2022-07-08 11:30:00+00	Europe/Vienna
4346	5	FP2	\N	f	1	1068	session_wPbIdF2C	t	2022-07-09 10:30:00+00	Europe/Vienna
4347	6	SR	\N	f	21	1068	session_fOrUX7hT	t	2022-07-09 14:30:00+00	Europe/Vienna
4320	7	R	\N	f	20	1065	session_t9xAvnw5	t	2022-06-12 11:00:00+00	Asia/Baku
4321	4	Q1	\N	f	1	1065	session_tcD9HQiP	t	2022-06-11 14:00:00+00	Asia/Baku
4322	5	Q2	\N	f	1	1065	session_CO4z3tws	t	2022-06-11 14:00:00+00	Asia/Baku
4323	6	Q3	\N	f	1	1065	session_wW0SmPMw	t	2022-06-11 14:00:00+00	Asia/Baku
4324	1	FP1	\N	f	1	1065	session_5XCqnETV	t	2022-06-10 11:00:00+00	Asia/Baku
4325	2	FP2	\N	f	1	1065	session_xbIk2Xdq	t	2022-06-10 14:00:00+00	Asia/Baku
4326	3	FP3	\N	f	1	1065	session_C7ZrR8MI	t	2022-06-11 11:00:00+00	Asia/Baku
4411	7	R	\N	f	20	1078	session_PVzIBExw	t	2022-11-13 18:00:00+00	America/Sao_Paulo
4412	2	Q1	\N	f	1	1078	session_vxpkwxBU	t	2022-11-11 19:00:00+00	America/Sao_Paulo
4413	3	Q2	\N	f	1	1078	session_Aob1EeXb	t	2022-11-11 19:00:00+00	America/Sao_Paulo
4414	4	Q3	\N	f	1	1078	session_tyiD9WLX	t	2022-11-11 19:00:00+00	America/Sao_Paulo
4415	1	FP1	\N	f	1	1078	session_sKnucAXu	t	2022-11-11 15:30:00+00	America/Sao_Paulo
4416	5	FP2	\N	f	1	1078	session_p9DnnY75	t	2022-11-12 15:30:00+00	America/Sao_Paulo
4425	7	R	\N	f	22	1080	session_WYhvrtIE	t	2023-03-05 15:00:00+00	Asia/Bahrain
4426	4	Q1	\N	f	1	1080	session_g3A58yis	t	2023-03-04 15:00:00+00	Asia/Bahrain
4427	5	Q2	\N	f	1	1080	session_uN4RdDpI	t	2023-03-04 15:00:00+00	Asia/Bahrain
4428	6	Q3	\N	f	1	1080	session_5zJsRXIF	t	2023-03-04 15:00:00+00	Asia/Bahrain
4429	1	FP1	\N	f	1	1080	session_LTaFEjdi	t	2023-03-03 11:30:00+00	Asia/Bahrain
4430	2	FP2	\N	f	1	1080	session_1eNHxRRN	t	2023-03-03 15:00:00+00	Asia/Bahrain
4431	3	FP3	\N	f	1	1080	session_kQSVykvt	t	2023-03-04 11:30:00+00	Asia/Bahrain
4446	9	R	\N	f	22	1083	session_Gf0xTZUH	t	2023-04-30 11:00:00+00	Asia/Baku
4418	7	R	\N	f	20	1079	session_pPmqZu5O	t	2022-11-20 13:00:00+00	Asia/Dubai
4419	4	Q1	\N	f	1	1079	session_bUeM6FKj	t	2022-11-19 14:00:00+00	Asia/Dubai
4420	5	Q2	\N	f	1	1079	session_Sc9fmlDj	t	2022-11-19 14:00:00+00	Asia/Dubai
4421	6	Q3	\N	f	1	1079	session_Oh6tKXep	t	2022-11-19 14:00:00+00	Asia/Dubai
4422	1	FP1	\N	f	1	1079	session_Nz3oQ2Fw	t	2022-11-18 10:00:00+00	Asia/Dubai
4423	2	FP2	\N	f	1	1079	session_XbUEpCnq	t	2022-11-18 13:00:00+00	Asia/Dubai
4432	7	R	\N	f	22	1081	session_lzt77ScV	t	2023-03-19 17:00:00+00	Asia/Riyadh
4433	4	Q1	\N	f	1	1081	session_ej6JO5ek	t	2023-03-18 17:00:00+00	Asia/Riyadh
4434	5	Q2	\N	f	1	1081	session_XRHIHDQS	t	2023-03-18 17:00:00+00	Asia/Riyadh
4435	6	Q3	\N	f	1	1081	session_5Y3jvAjU	t	2023-03-18 17:00:00+00	Asia/Riyadh
4436	1	FP1	\N	f	1	1081	session_uG1XxSTW	t	2023-03-17 13:30:00+00	Asia/Riyadh
4437	2	FP2	\N	f	1	1081	session_gQFichYB	t	2023-03-17 17:00:00+00	Asia/Riyadh
4438	3	FP3	\N	f	1	1081	session_5y3mItaw	t	2023-03-18 13:30:00+00	Asia/Riyadh
4383	7	R	\N	f	20	1074	session_rBzbriuz	t	2022-10-02 12:00:00+00	Asia/Singapore
4384	4	Q1	\N	f	1	1074	session_ciQNBwTB	t	2022-10-01 13:00:00+00	Asia/Singapore
4385	5	Q2	\N	f	1	1074	session_Hom7NKdB	t	2022-10-01 13:00:00+00	Asia/Singapore
4386	6	Q3	\N	f	1	1074	session_9kaaZHXk	t	2022-10-01 13:00:00+00	Asia/Singapore
4387	1	FP1	\N	f	1	1074	session_ckQwQYbe	t	2022-09-30 10:00:00+00	Asia/Singapore
4388	2	FP2	\N	f	1	1074	session_CC2V0Q6l	t	2022-09-30 13:00:00+00	Asia/Singapore
4389	3	FP3	\N	f	1	1074	session_1NJXZm4p	t	2022-10-01 10:00:00+00	Asia/Singapore
4390	7	R	\N	f	20	1075	session_ye20dkvC	t	2022-10-09 05:00:00+00	Asia/Tokyo
4391	4	Q1	\N	f	1	1075	session_ElKBfyX4	t	2022-10-08 06:00:00+00	Asia/Tokyo
4392	5	Q2	\N	f	1	1075	session_eUCuoAF2	t	2022-10-08 06:00:00+00	Asia/Tokyo
4393	6	Q3	\N	f	1	1075	session_GR6ROFzG	t	2022-10-08 06:00:00+00	Asia/Tokyo
4394	1	FP1	\N	f	1	1075	session_LxX6EgG3	t	2022-10-07 03:00:00+00	Asia/Tokyo
4395	2	FP2	\N	f	1	1075	session_QSKrFp6T	t	2022-10-07 06:00:00+00	Asia/Tokyo
4396	3	FP3	\N	f	1	1075	session_Bucliya3	t	2022-10-08 03:00:00+00	Asia/Tokyo
4439	7	R	\N	f	22	1082	session_7TM22CvK	t	2023-04-02 05:00:00+00	Australia/Melbourne
4440	4	Q1	\N	f	1	1082	session_4D3mFWBD	t	2023-04-01 05:00:00+00	Australia/Melbourne
4441	5	Q2	\N	f	1	1082	session_bcpRBtkA	t	2023-04-01 05:00:00+00	Australia/Melbourne
4442	6	Q3	\N	f	1	1082	session_MNajdWow	t	2023-04-01 05:00:00+00	Australia/Melbourne
4443	1	FP1	\N	f	1	1082	session_Ry4rx5r7	t	2023-03-31 01:30:00+00	Australia/Melbourne
4444	2	FP2	\N	f	1	1082	session_cdbl0T70	t	2023-03-31 05:00:00+00	Australia/Melbourne
4445	3	FP3	\N	f	1	1082	session_A3Srq9zb	t	2023-04-01 01:30:00+00	Australia/Melbourne
4381	2	FP2	\N	f	1	1073	session_HjoZEwFk	t	2022-09-09 15:00:00+00	Europe/Rome
4382	3	FP3	\N	f	1	1073	session_ZmykvlsG	t	2022-09-10 11:00:00+00	Europe/Rome
4404	7	R	\N	f	20	1077	session_ndwEvrOM	t	2022-10-30 20:00:00+00	America/Mexico_City
4405	4	Q1	\N	f	1	1077	session_d17tcxDa	t	2022-10-29 20:00:00+00	America/Mexico_City
4406	5	Q2	\N	f	1	1077	session_ftd1DLIo	t	2022-10-29 20:00:00+00	America/Mexico_City
4407	6	Q3	\N	f	1	1077	session_Pnxk6J3J	t	2022-10-29 20:00:00+00	America/Mexico_City
4408	1	FP1	\N	f	1	1077	session_ewCFq6Pf	t	2022-10-28 18:00:00+00	America/Mexico_City
4409	2	FP2	\N	f	1	1077	session_JBbVKGAj	t	2022-10-28 21:00:00+00	America/Mexico_City
4410	3	FP3	\N	f	1	1077	session_G6P8wVXW	t	2022-10-29 17:00:00+00	America/Mexico_City
4424	3	FP3	\N	f	1	1079	session_9DX6TuNX	t	2022-11-19 11:00:00+00	Asia/Dubai
4447	2	Q1	\N	f	1	1083	session_1LHJRAq7	t	2023-04-28 13:00:00+00	Asia/Baku
4448	3	Q2	\N	f	1	1083	session_7LdKfjCK	t	2023-04-28 13:00:00+00	Asia/Baku
4449	4	Q3	\N	f	1	1083	session_QXErBbRK	t	2023-04-28 13:00:00+00	Asia/Baku
4450	1	FP1	\N	f	1	1083	session_KrqT3TPQ	t	2023-04-28 09:30:00+00	Asia/Baku
4451	5	SQ1	\N	f	1	1083	session_MG0GXiBP	t	2023-04-29 09:30:00+00	Asia/Baku
4452	6	SQ2	\N	f	1	1083	session_4jfCRyeI	t	2023-04-29 09:30:00+00	Asia/Baku
4453	7	SQ3	\N	f	1	1083	session_15h4pwhu	t	2023-04-29 09:30:00+00	Asia/Baku
4506	9	R	\N	f	22	1091	session_5T0ZO7v0	t	2023-07-30 13:00:00+00	Europe/Brussels
4507	2	Q1	\N	f	1	1091	session_zg06bGu3	t	2023-07-28 15:00:00+00	Europe/Brussels
4508	3	Q2	\N	f	1	1091	session_Ykmf2IBr	t	2023-07-28 15:00:00+00	Europe/Brussels
4509	4	Q3	\N	f	1	1091	session_ZQF3ghVb	t	2023-07-28 15:00:00+00	Europe/Brussels
4510	1	FP1	\N	f	1	1091	session_6YG9cfEK	t	2023-07-28 11:30:00+00	Europe/Brussels
4511	5	SQ1	\N	f	1	1091	session_AXOgKRoX	t	2023-07-29 10:30:00+00	Europe/Brussels
4512	6	SQ2	\N	f	1	1091	session_x9NJzFTZ	t	2023-07-29 10:30:00+00	Europe/Brussels
4499	7	R	\N	f	22	1090	session_oOHkhBcN	t	2023-07-23 13:00:00+00	Europe/Budapest
4500	4	Q1	\N	f	1	1090	session_5vSeChjN	t	2023-07-22 14:00:00+00	Europe/Budapest
4501	5	Q2	\N	f	1	1090	session_3h96Enbh	t	2023-07-22 14:00:00+00	Europe/Budapest
4502	6	Q3	\N	f	1	1090	session_iWEgYtrK	t	2023-07-22 14:00:00+00	Europe/Budapest
4503	1	FP1	\N	f	1	1090	session_6rE4JfVl	t	2023-07-21 11:30:00+00	Europe/Budapest
4504	2	FP2	\N	f	1	1090	session_uYzHN7kE	t	2023-07-21 15:00:00+00	Europe/Budapest
4505	3	FP3	\N	f	1	1090	session_sKQ7zOwG	t	2023-07-22 10:30:00+00	Europe/Budapest
4492	7	R	\N	f	22	1089	session_UNKptQNV	t	2023-07-09 14:00:00+00	Europe/London
4493	4	Q1	\N	f	1	1089	session_sypcoEYn	t	2023-07-08 14:00:00+00	Europe/London
4494	5	Q2	\N	f	1	1089	session_JMSBoO4O	t	2023-07-08 14:00:00+00	Europe/London
4495	6	Q3	\N	f	1	1089	session_m1NcJHmG	t	2023-07-08 14:00:00+00	Europe/London
4496	1	FP1	\N	f	1	1089	session_9WtbInEu	t	2023-07-07 11:30:00+00	Europe/London
4497	2	FP2	\N	f	1	1089	session_6DiXRxk8	t	2023-07-07 15:00:00+00	Europe/London
4498	3	FP3	\N	f	1	1089	session_mluwq7NW	t	2023-07-08 10:30:00+00	Europe/London
4469	7	R	\N	f	22	1086	session_7KcHwC8Q	t	2023-06-04 13:00:00+00	Europe/Madrid
4470	4	Q1	\N	f	1	1086	session_9jDkPgZM	t	2023-06-03 14:00:00+00	Europe/Madrid
4471	5	Q2	\N	f	1	1086	session_2WJmcVyN	t	2023-06-03 14:00:00+00	Europe/Madrid
4472	6	Q3	\N	f	1	1086	session_I3n3ujaN	t	2023-06-03 14:00:00+00	Europe/Madrid
4473	1	FP1	\N	f	1	1086	session_ZDJHkPK3	t	2023-06-02 11:30:00+00	Europe/Madrid
4474	2	FP2	\N	f	1	1086	session_sV3RTx1A	t	2023-06-02 15:00:00+00	Europe/Madrid
4475	3	FP3	\N	f	1	1086	session_BkfB9SWR	t	2023-06-03 10:30:00+00	Europe/Madrid
4462	7	R	\N	f	22	1085	session_A4y4IyKd	t	2023-05-28 13:00:00+00	Europe/Monaco
4463	4	Q1	\N	f	1	1085	session_BAnMMwl8	t	2023-05-27 14:00:00+00	Europe/Monaco
4464	5	Q2	\N	f	1	1085	session_S70Huz3P	t	2023-05-27 14:00:00+00	Europe/Monaco
4465	6	Q3	\N	f	1	1085	session_YrqihnT6	t	2023-05-27 14:00:00+00	Europe/Monaco
4466	1	FP1	\N	f	1	1085	session_kzEzydkW	t	2023-05-26 11:30:00+00	Europe/Monaco
4467	2	FP2	\N	f	1	1085	session_LWpSYz6O	t	2023-05-26 15:00:00+00	Europe/Monaco
4468	3	FP3	\N	f	1	1085	session_hSPzGvBD	t	2023-05-27 10:30:00+00	Europe/Monaco
4483	9	R	\N	f	22	1088	session_T3yoSaSy	t	2023-07-02 13:00:00+00	Europe/Vienna
4484	2	Q1	\N	f	1	1088	session_jwLOH7PJ	t	2023-06-30 15:00:00+00	Europe/Vienna
4485	3	Q2	\N	f	1	1088	session_RyvABdhO	t	2023-06-30 15:00:00+00	Europe/Vienna
4486	4	Q3	\N	f	1	1088	session_SxaoRnyo	t	2023-06-30 15:00:00+00	Europe/Vienna
4487	1	FP1	\N	f	1	1088	session_yTc7Brh1	t	2023-06-30 11:30:00+00	Europe/Vienna
4488	5	SQ1	\N	f	1	1088	session_T021ad4p	t	2023-07-01 10:30:00+00	Europe/Vienna
4489	6	SQ2	\N	f	1	1088	session_0IrGSGqe	t	2023-07-01 10:30:00+00	Europe/Vienna
4455	7	R	\N	f	22	1084	session_xcODoFvt	t	2023-05-07 19:30:00+00	America/New_York
4456	4	Q1	\N	f	1	1084	session_TfAlBzWg	t	2023-05-06 20:00:00+00	America/New_York
4457	5	Q2	\N	f	1	1084	session_iaYkV3kK	t	2023-05-06 20:00:00+00	America/New_York
4458	6	Q3	\N	f	1	1084	session_KsR8LVfI	t	2023-05-06 20:00:00+00	America/New_York
4459	1	FP1	\N	f	1	1084	session_NpjCXG13	t	2023-05-05 18:00:00+00	America/New_York
4460	2	FP2	\N	f	1	1084	session_yMFpbad6	t	2023-05-05 21:30:00+00	America/New_York
4461	3	FP3	\N	f	1	1084	session_qSHZAsva	t	2023-05-06 16:30:00+00	America/New_York
4490	7	SQ3	\N	f	1	1088	session_cKUBro80	t	2023-07-01 10:30:00+00	Europe/Vienna
4491	8	SR	\N	f	23	1088	session_2L5ICjjo	t	2023-07-01 14:30:00+00	Europe/Vienna
4568	9	R	\N	f	22	1099	session_UkFWsywu	t	2023-11-05 17:00:00+00	America/Sao_Paulo
4569	2	Q1	\N	f	1	1099	session_CyxkCRr5	t	2023-11-03 18:00:00+00	America/Sao_Paulo
4570	3	Q2	\N	f	1	1099	session_4MhNZmcL	t	2023-11-03 18:00:00+00	America/Sao_Paulo
4571	4	Q3	\N	f	1	1099	session_8K9pzw64	t	2023-11-03 18:00:00+00	America/Sao_Paulo
4572	1	FP1	\N	f	1	1099	session_AFG8kxJU	t	2023-11-03 14:30:00+00	America/Sao_Paulo
4573	5	SQ1	\N	f	1	1099	session_414FIgSM	t	2023-11-04 14:30:00+00	America/Sao_Paulo
4574	6	SQ2	\N	f	1	1099	session_Q6KIQWa3	t	2023-11-04 14:30:00+00	America/Sao_Paulo
4575	7	SQ3	\N	f	1	1099	session_7J4KRemg	t	2023-11-04 14:30:00+00	America/Sao_Paulo
4543	9	R	\N	f	22	1096	session_pJ6EE9Jy	t	2023-10-08 17:00:00+00	Asia/Qatar
4544	2	Q1	\N	f	1	1096	session_D4Goem8X	t	2023-10-06 17:00:00+00	Asia/Qatar
4545	3	Q2	\N	f	1	1096	session_VixSyqQt	t	2023-10-06 17:00:00+00	Asia/Qatar
4546	4	Q3	\N	f	1	1096	session_7bJjDqzg	t	2023-10-06 17:00:00+00	Asia/Qatar
4547	1	FP1	\N	f	1	1096	session_RCtPCYre	t	2023-10-06 13:30:00+00	Asia/Qatar
4548	5	SQ1	\N	f	1	1096	session_H8UWVRHm	t	2023-10-07 13:00:00+00	Asia/Qatar
4549	6	SQ2	\N	f	1	1096	session_KCcdf9hk	t	2023-10-07 13:00:00+00	Asia/Qatar
4550	7	SQ3	\N	f	1	1096	session_leIfyxLL	t	2023-10-07 13:00:00+00	Asia/Qatar
4551	8	SR	\N	f	23	1096	session_SCXWCIoq	t	2023-10-07 17:30:00+00	Asia/Qatar
4529	7	R	\N	f	22	1094	session_3jqDb092	t	2023-09-17 12:00:00+00	Asia/Singapore
4530	4	Q1	\N	f	1	1094	session_sIaGOM5z	t	2023-09-16 13:00:00+00	Asia/Singapore
4531	5	Q2	\N	f	1	1094	session_JM9jH03K	t	2023-09-16 13:00:00+00	Asia/Singapore
4532	6	Q3	\N	f	1	1094	session_hMH6BwJo	t	2023-09-16 13:00:00+00	Asia/Singapore
4533	1	FP1	\N	f	1	1094	session_w7Rm8bGS	t	2023-09-15 09:30:00+00	Asia/Singapore
4534	2	FP2	\N	f	1	1094	session_Dy8u6Waj	t	2023-09-15 13:00:00+00	Asia/Singapore
4535	3	FP3	\N	f	1	1094	session_8nhb2kDW	t	2023-09-16 09:30:00+00	Asia/Singapore
4536	7	R	\N	f	22	1095	session_MYoLmiRh	t	2023-09-24 05:00:00+00	Asia/Tokyo
4537	4	Q1	\N	f	1	1095	session_ADNXWEki	t	2023-09-23 06:00:00+00	Asia/Tokyo
4538	5	Q2	\N	f	1	1095	session_zuxrMUrv	t	2023-09-23 06:00:00+00	Asia/Tokyo
4539	6	Q3	\N	f	1	1095	session_Hg3AJH5O	t	2023-09-23 06:00:00+00	Asia/Tokyo
4540	1	FP1	\N	f	1	1095	session_cxDAhWBE	t	2023-09-22 02:30:00+00	Asia/Tokyo
4541	2	FP2	\N	f	1	1095	session_cF2L7Dja	t	2023-09-22 06:00:00+00	Asia/Tokyo
4542	3	FP3	\N	f	1	1095	session_SkxW2WPI	t	2023-09-23 02:30:00+00	Asia/Tokyo
4515	7	R	\N	f	22	1092	session_7avOZJEq	t	2023-08-27 13:00:00+00	Europe/Amsterdam
4516	4	Q1	\N	f	1	1092	session_2efRka0k	t	2023-08-26 13:00:00+00	Europe/Amsterdam
4517	5	Q2	\N	f	1	1092	session_DE1FeAmj	t	2023-08-26 13:00:00+00	Europe/Amsterdam
4518	6	Q3	\N	f	1	1092	session_3TNI3Emv	t	2023-08-26 13:00:00+00	Europe/Amsterdam
4519	1	FP1	\N	f	1	1092	session_xCVfHSqd	t	2023-08-25 10:30:00+00	Europe/Amsterdam
4520	2	FP2	\N	f	1	1092	session_n5e69aBy	t	2023-08-25 14:00:00+00	Europe/Amsterdam
4521	3	FP3	\N	f	1	1092	session_bvDnbYWG	t	2023-08-26 09:30:00+00	Europe/Amsterdam
4513	7	SQ3	\N	f	1	1091	session_heNS8rwI	t	2023-07-29 10:30:00+00	Europe/Brussels
4514	8	SR	\N	f	23	1091	session_w4oPv3q6	t	2023-07-29 14:30:00+00	Europe/Brussels
4522	7	R	\N	f	22	1093	session_8ZfgfXZP	t	2023-09-03 13:00:00+00	Europe/Rome
4523	4	Q1	\N	f	1	1093	session_iYFDlg7h	t	2023-09-02 14:00:00+00	Europe/Rome
4524	5	Q2	\N	f	1	1093	session_ve6tfpbn	t	2023-09-02 14:00:00+00	Europe/Rome
4525	6	Q3	\N	f	1	1093	session_0AkitEOv	t	2023-09-02 14:00:00+00	Europe/Rome
4526	1	FP1	\N	f	1	1093	session_nbdLHACG	t	2023-09-01 11:30:00+00	Europe/Rome
4527	2	FP2	\N	f	1	1093	session_4aBAeStT	t	2023-09-01 15:00:00+00	Europe/Rome
4528	3	FP3	\N	f	1	1093	session_oAY5k3Vn	t	2023-09-02 10:30:00+00	Europe/Rome
4577	7	R	\N	f	22	1100	session_GssSnIcL	t	2023-11-19 06:00:00+00	America/Los_Angeles
4578	4	Q1	\N	f	1	1100	session_HQ2rROy9	t	2023-11-17 08:00:00+00	America/Los_Angeles
4561	7	R	\N	f	22	1098	session_Qk0QSPp7	t	2023-10-29 20:00:00+00	America/Mexico_City
4562	4	Q1	\N	f	1	1098	session_T2tz1Sk9	t	2023-10-28 21:00:00+00	America/Mexico_City
4563	5	Q2	\N	f	1	1098	session_H5B5oqOc	t	2023-10-28 21:00:00+00	America/Mexico_City
4564	6	Q3	\N	f	1	1098	session_Qjt2CcwF	t	2023-10-28 21:00:00+00	America/Mexico_City
4565	1	FP1	\N	f	1	1098	session_A9VNjI9U	t	2023-10-27 18:30:00+00	America/Mexico_City
4566	2	FP2	\N	f	1	1098	session_xTo1ElJ2	t	2023-10-27 22:00:00+00	America/Mexico_City
4567	3	FP3	\N	f	1	1098	session_vFYqhOyS	t	2023-10-28 17:30:00+00	America/Mexico_City
4591	7	R	\N	f	22	1102	session_TAmdOOz5	t	2024-03-02 15:00:00+00	Asia/Bahrain
4592	4	Q1	\N	f	1	1102	session_2HCrzVCV	t	2024-03-01 16:00:00+00	Asia/Bahrain
4593	5	Q2	\N	f	1	1102	session_uGRAULzs	t	2024-03-01 16:00:00+00	Asia/Bahrain
4594	6	Q3	\N	f	1	1102	session_05ODp9EX	t	2024-03-01 16:00:00+00	Asia/Bahrain
4595	1	FP1	\N	f	1	1102	session_hmmsSTb1	t	2024-02-29 11:30:00+00	Asia/Bahrain
4584	7	R	\N	f	22	1101	session_y5d8RPan	t	2023-11-26 13:00:00+00	Asia/Dubai
4585	4	Q1	\N	f	1	1101	session_2qxXR6o6	t	2023-11-25 14:00:00+00	Asia/Dubai
4586	5	Q2	\N	f	1	1101	session_4j5XPe5Y	t	2023-11-25 14:00:00+00	Asia/Dubai
4587	6	Q3	\N	f	1	1101	session_rjbgiG49	t	2023-11-25 14:00:00+00	Asia/Dubai
4588	1	FP1	\N	f	1	1101	session_YnL5Ub2f	t	2023-11-24 09:30:00+00	Asia/Dubai
4589	2	FP2	\N	f	1	1101	session_94GfbSw8	t	2023-11-24 13:00:00+00	Asia/Dubai
4590	3	FP3	\N	f	1	1101	session_Q1H9xTgC	t	2023-11-25 10:30:00+00	Asia/Dubai
4598	7	R	\N	f	22	1103	session_WLl6Sf18	t	2024-03-09 17:00:00+00	Asia/Riyadh
4599	4	Q1	\N	f	1	1103	session_KZ2WAKxE	t	2024-03-08 17:00:00+00	Asia/Riyadh
4600	5	Q2	\N	f	1	1103	session_R0nDe0TK	t	2024-03-08 17:00:00+00	Asia/Riyadh
4601	6	Q3	\N	f	1	1103	session_X9EnP0p4	t	2024-03-08 17:00:00+00	Asia/Riyadh
4602	1	FP1	\N	f	1	1103	session_GUD0uN6L	t	2024-03-07 13:30:00+00	Asia/Riyadh
4603	2	FP2	\N	f	1	1103	session_WdgDKgZf	t	2024-03-07 17:00:00+00	Asia/Riyadh
4604	3	FP3	\N	f	1	1103	session_tgymc8af	t	2024-03-08 13:30:00+00	Asia/Riyadh
4619	9	R	\N	f	22	1106	session_MyYzQgij	t	2024-04-21 07:00:00+00	Asia/Shanghai
4620	6	Q1	\N	f	1	1106	session_JGFVEY9D	t	2024-04-20 07:00:00+00	Asia/Shanghai
4621	7	Q2	\N	f	1	1106	session_p9SAUyZZ	t	2024-04-20 07:00:00+00	Asia/Shanghai
4622	8	Q3	\N	f	1	1106	session_ebOa46hn	t	2024-04-20 07:00:00+00	Asia/Shanghai
4623	1	FP1	\N	f	1	1106	session_5iQ006Ph	t	2024-04-19 03:30:00+00	Asia/Shanghai
4624	2	SQ1	\N	f	1	1106	session_wWXQ8VoT	t	2024-04-19 07:30:00+00	Asia/Shanghai
4625	3	SQ2	\N	f	1	1106	session_MdBYOOeQ	t	2024-04-19 07:30:00+00	Asia/Shanghai
4612	7	R	\N	f	22	1105	session_XsFZNOnA	t	2024-04-07 05:00:00+00	Asia/Tokyo
4613	4	Q1	\N	f	1	1105	session_Ex1pVP1R	t	2024-04-06 06:00:00+00	Asia/Tokyo
4614	5	Q2	\N	f	1	1105	session_5qv9Js92	t	2024-04-06 06:00:00+00	Asia/Tokyo
4615	6	Q3	\N	f	1	1105	session_AbtlhBCq	t	2024-04-06 06:00:00+00	Asia/Tokyo
4616	1	FP1	\N	f	1	1105	session_eKH5AKKe	t	2024-04-05 02:30:00+00	Asia/Tokyo
4617	2	FP2	\N	f	1	1105	session_5acULPCk	t	2024-04-05 06:00:00+00	Asia/Tokyo
4618	3	FP3	\N	f	1	1105	session_kQ4QbfFn	t	2024-04-06 02:30:00+00	Asia/Tokyo
4605	7	R	\N	f	22	1104	session_V3M4XCXM	t	2024-03-24 04:00:00+00	Australia/Melbourne
4606	4	Q1	\N	f	1	1104	session_7yk9wrAZ	t	2024-03-23 05:00:00+00	Australia/Melbourne
4607	5	Q2	\N	f	1	1104	session_9KnBI02M	t	2024-03-23 05:00:00+00	Australia/Melbourne
4608	6	Q3	\N	f	1	1104	session_pWaUCFwQ	t	2024-03-23 05:00:00+00	Australia/Melbourne
4609	1	FP1	\N	f	1	1104	session_sQlyzoMt	t	2024-03-22 01:30:00+00	Australia/Melbourne
4610	2	FP2	\N	f	1	1104	session_V3QvH5XG	t	2024-03-22 05:00:00+00	Australia/Melbourne
4611	3	FP3	\N	f	1	1104	session_8aBHq0aV	t	2024-03-23 01:30:00+00	Australia/Melbourne
4644	7	R	\N	f	22	1109	session_onuzzJR0	t	2024-05-26 13:00:00+00	Europe/Monaco
4637	7	R	\N	f	22	1108	session_VdFMYcbi	t	2024-05-19 13:00:00+00	Europe/Rome
4638	4	Q1	\N	f	1	1108	session_L7jtAtPh	t	2024-05-18 14:00:00+00	Europe/Rome
4639	5	Q2	\N	f	1	1108	session_4HthBVVB	t	2024-05-18 14:00:00+00	Europe/Rome
4640	6	Q3	\N	f	1	1108	session_kfGUAnFW	t	2024-05-18 14:00:00+00	Europe/Rome
4641	1	FP1	\N	f	1	1108	session_qXGrUcTi	t	2024-05-17 11:30:00+00	Europe/Rome
4642	2	FP2	\N	f	1	1108	session_bOtlmEBW	t	2024-05-17 15:00:00+00	Europe/Rome
4643	3	FP3	\N	f	1	1108	session_LDcwH851	t	2024-05-18 10:30:00+00	Europe/Rome
4628	9	R	\N	f	22	1107	session_18pZ7zgF	t	2024-05-05 20:00:00+00	America/New_York
4629	6	Q1	\N	f	1	1107	session_wsCT1M5E	t	2024-05-04 20:00:00+00	America/New_York
4630	7	Q2	\N	f	1	1107	session_zZ2RJjeV	t	2024-05-04 20:00:00+00	America/New_York
4631	8	Q3	\N	f	1	1107	session_1vLD2IW7	t	2024-05-04 20:00:00+00	America/New_York
4632	1	FP1	\N	f	1	1107	session_kljaYKNz	t	2024-05-03 16:30:00+00	America/New_York
4596	2	FP2	\N	f	1	1102	session_MdP4UBZ5	t	2024-02-29 15:00:00+00	Asia/Bahrain
4597	3	FP3	\N	f	1	1102	session_E6Fimw7v	t	2024-03-01 12:30:00+00	Asia/Bahrain
4626	4	SQ3	\N	f	1	1106	session_4UD3pPdR	t	2024-04-19 07:30:00+00	Asia/Shanghai
4627	5	SR	\N	f	23	1106	session_qR66TVES	t	2024-04-20 03:00:00+00	Asia/Shanghai
4688	7	R	\N	f	22	1115	session_u8779gmx	t	2024-07-28 13:00:00+00	Europe/Brussels
4689	4	Q1	\N	f	1	1115	session_JWbxjsXQ	t	2024-07-27 14:00:00+00	Europe/Brussels
4690	5	Q2	\N	f	1	1115	session_CVwMlopf	t	2024-07-27 14:00:00+00	Europe/Brussels
4691	6	Q3	\N	f	1	1115	session_xYxCXtBL	t	2024-07-27 14:00:00+00	Europe/Brussels
4692	1	FP1	\N	f	1	1115	session_Js8wFIvK	t	2024-07-26 11:30:00+00	Europe/Brussels
4693	2	FP2	\N	f	1	1115	session_z25kczxA	t	2024-07-26 15:00:00+00	Europe/Brussels
4694	3	FP3	\N	f	1	1115	session_7819VBEQ	t	2024-07-27 10:30:00+00	Europe/Brussels
4681	7	R	\N	f	22	1114	session_wQEoAaCE	t	2024-07-21 13:00:00+00	Europe/Budapest
4682	4	Q1	\N	f	1	1114	session_CyxBFwP2	t	2024-07-20 14:00:00+00	Europe/Budapest
4683	5	Q2	\N	f	1	1114	session_AXnFikHM	t	2024-07-20 14:00:00+00	Europe/Budapest
4684	6	Q3	\N	f	1	1114	session_cKDzqii6	t	2024-07-20 14:00:00+00	Europe/Budapest
4685	1	FP1	\N	f	1	1114	session_hX6f39qL	t	2024-07-19 11:30:00+00	Europe/Budapest
4686	2	FP2	\N	f	1	1114	session_AJBF3B7j	t	2024-07-19 15:00:00+00	Europe/Budapest
4687	3	FP3	\N	f	1	1114	session_DT1hAMHr	t	2024-07-20 10:30:00+00	Europe/Budapest
4674	7	R	\N	f	22	1113	session_jCKdIIHM	t	2024-07-07 14:00:00+00	Europe/London
4675	4	Q1	\N	f	1	1113	session_4J3dy71w	t	2024-07-06 14:00:00+00	Europe/London
4676	5	Q2	\N	f	1	1113	session_5CrqwT0i	t	2024-07-06 14:00:00+00	Europe/London
4677	6	Q3	\N	f	1	1113	session_r4Z23FRd	t	2024-07-06 14:00:00+00	Europe/London
4678	1	FP1	\N	f	1	1113	session_eh23MVFK	t	2024-07-05 11:30:00+00	Europe/London
4679	2	FP2	\N	f	1	1113	session_CoBzKwJU	t	2024-07-05 15:00:00+00	Europe/London
4680	3	FP3	\N	f	1	1113	session_Wlq98mZm	t	2024-07-06 10:30:00+00	Europe/London
4658	7	R	\N	f	22	1111	session_zjCahpun	t	2024-06-23 13:00:00+00	Europe/Madrid
4659	4	Q1	\N	f	1	1111	session_LSsKNcdR	t	2024-06-22 14:00:00+00	Europe/Madrid
4660	5	Q2	\N	f	1	1111	session_IVaY1q68	t	2024-06-22 14:00:00+00	Europe/Madrid
4661	6	Q3	\N	f	1	1111	session_JkSv0ebv	t	2024-06-22 14:00:00+00	Europe/Madrid
4662	1	FP1	\N	f	1	1111	session_lmNTr6d2	t	2024-06-21 11:30:00+00	Europe/Madrid
4663	2	FP2	\N	f	1	1111	session_OlPHuAgx	t	2024-06-21 15:00:00+00	Europe/Madrid
4664	3	FP3	\N	f	1	1111	session_Zm5JfI7C	t	2024-06-22 10:30:00+00	Europe/Madrid
4645	4	Q1	\N	f	1	1109	session_jWPDJ1S7	t	2024-05-25 14:00:00+00	Europe/Monaco
4646	5	Q2	\N	f	1	1109	session_s4U9JY5j	t	2024-05-25 14:00:00+00	Europe/Monaco
4647	6	Q3	\N	f	1	1109	session_Xe21yZcF	t	2024-05-25 14:00:00+00	Europe/Monaco
4648	1	FP1	\N	f	1	1109	session_ZV3I8syI	t	2024-05-24 11:30:00+00	Europe/Monaco
4649	2	FP2	\N	f	1	1109	session_jTDOBNdx	t	2024-05-24 15:00:00+00	Europe/Monaco
4650	3	FP3	\N	f	1	1109	session_eLaPFlFn	t	2024-05-25 10:30:00+00	Europe/Monaco
4702	7	R	\N	f	22	1117	session_yhk1ZcZ3	t	2024-09-01 13:00:00+00	Europe/Rome
4703	4	Q1	\N	f	1	1117	session_hyX0ZLUa	t	2024-08-31 14:00:00+00	Europe/Rome
4704	5	Q2	\N	f	1	1117	session_snK6hRWc	t	2024-08-31 14:00:00+00	Europe/Rome
4705	6	Q3	\N	f	1	1117	session_EJMe25YI	t	2024-08-31 14:00:00+00	Europe/Rome
4706	1	FP1	\N	f	1	1117	session_Iez1r0Xq	t	2024-08-30 11:30:00+00	Europe/Rome
4707	2	FP2	\N	f	1	1117	session_pystorYu	t	2024-08-30 15:00:00+00	Europe/Rome
4708	3	FP3	\N	f	1	1117	session_TXRvTjFU	t	2024-08-31 10:30:00+00	Europe/Rome
4665	9	R	\N	f	22	1112	session_9Zb4ZOo3	t	2024-06-30 13:00:00+00	Europe/Vienna
4666	6	Q1	\N	f	1	1112	session_X4kDrNlS	t	2024-06-29 14:00:00+00	Europe/Vienna
4667	7	Q2	\N	f	1	1112	session_GvkKZRut	t	2024-06-29 14:00:00+00	Europe/Vienna
4668	8	Q3	\N	f	1	1112	session_YuqxGHMV	t	2024-06-29 14:00:00+00	Europe/Vienna
4669	1	FP1	\N	f	1	1112	session_EEAlZnuK	t	2024-06-28 10:30:00+00	Europe/Vienna
4670	2	SQ1	\N	f	1	1112	session_dbLhlqwf	t	2024-06-28 14:30:00+00	Europe/Vienna
4671	3	SQ2	\N	f	1	1112	session_XQE09qQM	t	2024-06-28 14:30:00+00	Europe/Vienna
4672	4	SQ3	\N	f	1	1112	session_EmrdzoAz	t	2024-06-28 14:30:00+00	Europe/Vienna
4709	7	R	\N	f	22	1118	session_qkOlhVQZ	t	2024-09-15 11:00:00+00	Asia/Baku
4710	4	Q1	\N	f	1	1118	session_IGRrLGcg	t	2024-09-14 12:00:00+00	Asia/Baku
4695	7	R	\N	f	22	1116	session_VeC6n5LT	t	2024-08-25 13:00:00+00	Europe/Amsterdam
4696	4	Q1	\N	f	1	1116	session_sDAqWXNC	t	2024-08-24 13:00:00+00	Europe/Amsterdam
4697	5	Q2	\N	f	1	1116	session_ydhV4gHa	t	2024-08-24 13:00:00+00	Europe/Amsterdam
4698	6	Q3	\N	f	1	1116	session_UttX7XLM	t	2024-08-24 13:00:00+00	Europe/Amsterdam
4699	1	FP1	\N	f	1	1116	session_ieNkhXzU	t	2024-08-23 10:30:00+00	Europe/Amsterdam
4700	2	FP2	\N	f	1	1116	session_etCzrvlF	t	2024-08-23 14:00:00+00	Europe/Amsterdam
4701	3	FP3	\N	f	1	1116	session_xhZkUWAM	t	2024-08-24 09:30:00+00	Europe/Amsterdam
4723	9	R	\N	f	22	1120	session_g0arYCNV	t	2024-10-20 19:00:00+00	America/Chicago
4732	7	R	\N	f	22	1121	session_h33v1VjK	t	2024-10-27 20:00:00+00	America/Mexico_City
4733	4	Q1	\N	f	1	1121	session_zgqxGSg8	t	2024-10-26 21:00:00+00	America/Mexico_City
4734	5	Q2	\N	f	1	1121	session_9iFp4aZ3	t	2024-10-26 21:00:00+00	America/Mexico_City
4735	6	Q3	\N	f	1	1121	session_t6t9Tngt	t	2024-10-26 21:00:00+00	America/Mexico_City
4736	1	FP1	\N	f	1	1121	session_jozdvOZC	t	2024-10-25 18:30:00+00	America/Mexico_City
4737	2	FP2	\N	f	1	1121	session_tp28yobx	t	2024-10-25 22:00:00+00	America/Mexico_City
4738	3	FP3	\N	f	1	1121	session_nBFmIIoa	t	2024-10-26 17:30:00+00	America/Mexico_City
4739	9	R	\N	f	22	1122	session_hfUuBIal	t	2024-11-03 17:00:00+00	America/Sao_Paulo
4740	6	Q1	\N	f	1	1122	session_Cv0OE7R1	t	2024-11-02 18:00:00+00	America/Sao_Paulo
4741	7	Q2	\N	f	1	1122	session_oJui4vKO	t	2024-11-02 18:00:00+00	America/Sao_Paulo
4742	8	Q3	\N	f	1	1122	session_rIaaHjiV	t	2024-11-02 18:00:00+00	America/Sao_Paulo
4743	1	FP1	\N	f	1	1122	session_cquZq3YX	t	2024-11-01 14:30:00+00	America/Sao_Paulo
4744	2	SQ1	\N	f	1	1122	session_Hh7uYY6x	t	2024-11-01 18:30:00+00	America/Sao_Paulo
4745	3	SQ2	\N	f	1	1122	session_7GyY37Xo	t	2024-11-01 18:30:00+00	America/Sao_Paulo
4746	4	SQ3	\N	f	1	1122	session_rMJUaEae	t	2024-11-01 18:30:00+00	America/Sao_Paulo
4711	5	Q2	\N	f	1	1118	session_VbDv7wOn	t	2024-09-14 12:00:00+00	Asia/Baku
4712	6	Q3	\N	f	1	1118	session_EyIlxy1G	t	2024-09-14 12:00:00+00	Asia/Baku
4713	1	FP1	\N	f	1	1118	session_Dh8tHTdW	t	2024-09-13 09:30:00+00	Asia/Baku
4714	2	FP2	\N	f	1	1118	session_m7Jz2Bph	t	2024-09-13 13:00:00+00	Asia/Baku
4715	3	FP3	\N	f	1	1118	session_idO9x4ER	t	2024-09-14 08:30:00+00	Asia/Baku
4764	7	R	\N	f	22	1125	session_fcgTHu2i	t	2024-12-08 13:00:00+00	Asia/Dubai
4765	4	Q1	\N	f	1	1125	session_23fqNnOr	t	2024-12-07 14:00:00+00	Asia/Dubai
4766	5	Q2	\N	f	1	1125	session_bkmM9DLy	t	2024-12-07 14:00:00+00	Asia/Dubai
4767	6	Q3	\N	f	1	1125	session_6zQ6LLFC	t	2024-12-07 14:00:00+00	Asia/Dubai
4768	1	FP1	\N	f	1	1125	session_i07CLWiH	t	2024-12-06 09:30:00+00	Asia/Dubai
4769	2	FP2	\N	f	1	1125	session_eeCzbLUh	t	2024-12-06 13:00:00+00	Asia/Dubai
4770	3	FP3	\N	f	1	1125	session_qeYJdl5L	t	2024-12-07 10:30:00+00	Asia/Dubai
4755	9	R	\N	f	22	1124	session_TgrQTekG	t	2024-12-01 16:00:00+00	Asia/Qatar
4756	6	Q1	\N	f	1	1124	session_a7Jm1ZyP	t	2024-11-30 18:00:00+00	Asia/Qatar
4757	7	Q2	\N	f	1	1124	session_0LG3ercS	t	2024-11-30 18:00:00+00	Asia/Qatar
4758	8	Q3	\N	f	1	1124	session_3j2NcyzN	t	2024-11-30 18:00:00+00	Asia/Qatar
4759	1	FP1	\N	f	1	1124	session_JYxsaiEy	t	2024-11-29 13:30:00+00	Asia/Qatar
4760	2	SQ1	\N	f	1	1124	session_5S1Gdm6b	t	2024-11-29 17:30:00+00	Asia/Qatar
4761	3	SQ2	\N	f	1	1124	session_eI9RH2vZ	t	2024-11-29 17:30:00+00	Asia/Qatar
4762	4	SQ3	\N	f	1	1124	session_yX80BzvL	t	2024-11-29 17:30:00+00	Asia/Qatar
4716	7	R	\N	f	22	1119	session_mtQ0FSmy	t	2024-09-22 12:00:00+00	Asia/Singapore
4717	4	Q1	\N	f	1	1119	session_QBEJcehz	t	2024-09-21 13:00:00+00	Asia/Singapore
4718	5	Q2	\N	f	1	1119	session_9L0uvC93	t	2024-09-21 13:00:00+00	Asia/Singapore
4719	6	Q3	\N	f	1	1119	session_Z4zNndl9	t	2024-09-21 13:00:00+00	Asia/Singapore
4720	1	FP1	\N	f	1	1119	session_FJF1v8s6	t	2024-09-20 09:30:00+00	Asia/Singapore
4721	2	FP2	\N	f	1	1119	session_JEWEezLt	t	2024-09-20 13:00:00+00	Asia/Singapore
4722	3	FP3	\N	f	1	1119	session_1A7GgWJo	t	2024-09-21 09:30:00+00	Asia/Singapore
4771	1	FP1	\N	f	1	1126	session_s5C5LCb1	t	2025-03-14 01:30:00+00	Australia/Melbourne
4772	2	FP2	\N	f	1	1126	session_pULmYKSo	t	2025-03-14 05:00:00+00	Australia/Melbourne
4773	3	FP3	\N	f	1	1126	session_oGRuY94G	t	2025-03-15 01:30:00+00	Australia/Melbourne
4774	4	Q1	\N	f	1	1126	session_gO1Z1iEq	t	2025-03-15 05:00:00+00	Australia/Melbourne
4775	5	Q2	\N	f	1	1126	session_hWngrlUY	t	2025-03-15 05:00:00+00	Australia/Melbourne
4748	7	R	\N	f	22	1123	session_MsJCLkca	t	2024-11-23 06:00:00+00	America/Los_Angeles
4749	4	Q1	\N	f	1	1123	session_ZX0z42xB	t	2024-11-22 06:00:00+00	America/Los_Angeles
4750	5	Q2	\N	f	1	1123	session_ix9hjWLd	t	2024-11-22 06:00:00+00	America/Los_Angeles
4751	6	Q3	\N	f	1	1123	session_zbPwf9Ih	t	2024-11-22 06:00:00+00	America/Los_Angeles
4752	1	FP1	\N	f	1	1123	session_boP7ZLXj	t	2024-11-21 02:30:00+00	America/Los_Angeles
4753	2	FP2	\N	f	1	1123	session_h5lBziga	t	2024-11-21 06:00:00+00	America/Los_Angeles
4754	3	FP3	\N	f	1	1123	session_k9gPni9M	t	2024-11-22 02:30:00+00	America/Los_Angeles
4763	5	SR	\N	f	23	1124	session_qyKRxYMU	t	2024-11-30 14:00:00+00	Asia/Qatar
4794	1	FP1	\N	f	1	1129	session_NpNz3cLL	t	2025-04-11 11:30:00+00	Asia/Bahrain
4795	2	FP2	\N	f	1	1129	session_tJtzVwFE	t	2025-04-11 15:00:00+00	Asia/Bahrain
4796	3	FP3	\N	f	1	1129	session_oXCyez98	t	2025-04-12 12:30:00+00	Asia/Bahrain
4797	4	Q1	\N	f	1	1129	session_n23uXp5C	t	2025-04-12 16:00:00+00	Asia/Bahrain
4798	5	Q2	\N	f	1	1129	session_0oZaqfDm	t	2025-04-12 16:00:00+00	Asia/Bahrain
4799	6	Q3	\N	f	1	1129	session_RivAuxNi	t	2025-04-12 16:00:00+00	Asia/Bahrain
4801	1	FP1	\N	f	1	1130	session_3zjl4YsZ	t	2025-04-18 13:30:00+00	Asia/Riyadh
4802	2	FP2	\N	f	1	1130	session_rHI2GhiI	t	2025-04-18 17:00:00+00	Asia/Riyadh
4803	3	FP3	\N	f	1	1130	session_3zO538O1	t	2025-04-19 13:30:00+00	Asia/Riyadh
4804	4	Q1	\N	f	1	1130	session_4zk03DYU	t	2025-04-19 17:00:00+00	Asia/Riyadh
4805	5	Q2	\N	f	1	1130	session_dAMUK0i1	t	2025-04-19 17:00:00+00	Asia/Riyadh
4806	6	Q3	\N	f	1	1130	session_s5oui9AQ	t	2025-04-19 17:00:00+00	Asia/Riyadh
4807	7	R	50	f	24	1130	session_pIHOXrxQ	t	2025-04-20 17:00:00+00	Asia/Riyadh
4778	1	FP1	\N	f	1	1127	session_X1sv7FSq	t	2025-03-21 03:30:00+00	Asia/Shanghai
4779	2	SQ1	\N	f	1	1127	session_vsXcRch7	t	2025-03-21 07:30:00+00	Asia/Shanghai
4780	3	SQ2	\N	f	1	1127	session_Kn8MweuQ	t	2025-03-21 07:30:00+00	Asia/Shanghai
4781	4	SQ3	\N	f	1	1127	session_NOqAJ1B3	t	2025-03-21 07:30:00+00	Asia/Shanghai
4782	5	SR	\N	f	23	1127	session_tJE3ebSO	t	2025-03-22 03:00:00+00	Asia/Shanghai
4783	6	Q1	\N	f	1	1127	session_MAGicxn3	t	2025-03-22 07:00:00+00	Asia/Shanghai
4784	7	Q2	\N	f	1	1127	session_GiqF2Yig	t	2025-03-22 07:00:00+00	Asia/Shanghai
4787	1	FP1	\N	f	1	1128	session_oBd8NFLw	t	2025-04-04 02:30:00+00	Asia/Tokyo
4788	2	FP2	\N	f	1	1128	session_A7sIwH1u	t	2025-04-04 06:00:00+00	Asia/Tokyo
4789	3	FP3	\N	f	1	1128	session_UP8dO4FA	t	2025-04-05 02:30:00+00	Asia/Tokyo
4790	4	Q1	\N	f	1	1128	session_M8FzzzXS	t	2025-04-05 06:00:00+00	Asia/Tokyo
4791	5	Q2	\N	f	1	1128	session_IkZyyKqP	t	2025-04-05 06:00:00+00	Asia/Tokyo
4792	6	Q3	\N	f	1	1128	session_28r5UY97	t	2025-04-05 06:00:00+00	Asia/Tokyo
4793	7	R	53	f	24	1128	session_eOj1pxYB	t	2025-04-06 05:00:00+00	Asia/Tokyo
4831	1	FP1	\N	f	1	1134	session_gaThBqQD	t	2025-05-30 11:30:00+00	Europe/Madrid
4832	2	FP2	\N	f	1	1134	session_3iWofwRf	t	2025-05-30 15:00:00+00	Europe/Madrid
4833	3	FP3	\N	f	1	1134	session_iEy1FAmt	t	2025-05-31 10:30:00+00	Europe/Madrid
4834	4	Q1	\N	f	1	1134	session_0xWmMlna	t	2025-05-31 14:00:00+00	Europe/Madrid
4835	5	Q2	\N	f	1	1134	session_YiBSZKlH	t	2025-05-31 14:00:00+00	Europe/Madrid
4836	6	Q3	\N	f	1	1134	session_ZN0paCCH	t	2025-05-31 14:00:00+00	Europe/Madrid
4837	7	R	66	f	24	1134	session_GKcjbcwP	t	2025-06-01 13:00:00+00	Europe/Madrid
4824	1	FP1	\N	f	1	1133	session_PRHTO4SI	t	2025-05-23 11:30:00+00	Europe/Monaco
4825	2	FP2	\N	f	1	1133	session_Lsf88Noq	t	2025-05-23 15:00:00+00	Europe/Monaco
4826	3	FP3	\N	f	1	1133	session_Qxz5h8Ah	t	2025-05-24 10:30:00+00	Europe/Monaco
4827	4	Q1	\N	f	1	1133	session_1P8oCKS0	t	2025-05-24 14:00:00+00	Europe/Monaco
4828	5	Q2	\N	f	1	1133	session_8WBQis7K	t	2025-05-24 14:00:00+00	Europe/Monaco
4829	6	Q3	\N	f	1	1133	session_mEdzOf6e	t	2025-05-24 14:00:00+00	Europe/Monaco
4830	7	R	78	f	24	1133	session_Cu2SE7zy	t	2025-05-25 13:00:00+00	Europe/Monaco
4817	1	FP1	\N	f	1	1132	session_O3wIskxV	t	2025-05-16 11:30:00+00	Europe/Rome
4818	2	FP2	\N	f	1	1132	session_La8tYfG5	t	2025-05-16 15:00:00+00	Europe/Rome
4819	3	FP3	\N	f	1	1132	session_h7SyASdx	t	2025-05-17 10:30:00+00	Europe/Rome
4820	4	Q1	\N	f	1	1132	session_1f9S2t6r	t	2025-05-17 14:00:00+00	Europe/Rome
4821	5	Q2	\N	f	1	1132	session_LU2cC9MO	t	2025-05-17 14:00:00+00	Europe/Rome
4822	6	Q3	\N	f	1	1132	session_694fHZJG	t	2025-05-17 14:00:00+00	Europe/Rome
4823	7	R	63	f	24	1132	session_2mpFx9b5	t	2025-05-18 13:00:00+00	Europe/Rome
4838	1	FP1	\N	f	1	1135	session_JVfb1UfV	t	2025-06-13 17:30:00+00	America/Montreal
4808	1	FP1	\N	f	1	1131	session_2R5BbCUB	t	2025-05-02 16:30:00+00	America/New_York
4809	2	SQ1	\N	f	1	1131	session_SvdzGFpk	t	2025-05-02 20:30:00+00	America/New_York
4810	3	SQ2	\N	f	1	1131	session_fSTTEL8M	t	2025-05-02 20:30:00+00	America/New_York
4811	4	SQ3	\N	f	1	1131	session_m14eXLWK	t	2025-05-02 20:30:00+00	America/New_York
4812	5	SR	\N	f	23	1131	session_3tRW19Fq	t	2025-05-03 16:00:00+00	America/New_York
4800	7	R	57	f	24	1129	session_KLlrgjAC	t	2025-04-13 15:00:00+00	Asia/Bahrain
4785	8	Q3	\N	f	1	1127	session_JtuiXd4e	t	2025-03-22 07:00:00+00	Asia/Shanghai
4786	9	R	56	f	24	1127	session_niuOeI9X	t	2025-03-23 07:00:00+00	Asia/Shanghai
4889	1	FP1	\N	f	1	1142	session_sJ3gQkqy	t	2025-09-19 08:30:00+00	Asia/Baku
4890	2	FP2	\N	f	1	1142	session_5BVrzWfR	t	2025-09-19 12:00:00+00	Asia/Baku
4891	3	FP3	\N	f	1	1142	session_4cpexxqT	t	2025-09-20 08:30:00+00	Asia/Baku
4892	4	Q1	\N	f	1	1142	session_OV3ORx4w	t	2025-09-20 12:00:00+00	Asia/Baku
4896	1	FP1	\N	f	1	1143	session_DlEXOC6n	t	2025-10-03 09:30:00+00	Asia/Singapore
4897	2	FP2	\N	f	1	1143	session_lyQjzi00	t	2025-10-03 13:00:00+00	Asia/Singapore
4898	3	FP3	\N	f	1	1143	session_9l0sezvu	t	2025-10-04 09:30:00+00	Asia/Singapore
4899	4	Q1	\N	f	1	1143	session_qC03Ewq1	t	2025-10-04 13:00:00+00	Asia/Singapore
4875	1	FP1	\N	f	1	1140	session_I5BIZuX6	t	2025-08-29 10:30:00+00	Europe/Amsterdam
4876	2	FP2	\N	f	1	1140	session_YvhcQEef	t	2025-08-29 14:00:00+00	Europe/Amsterdam
4877	3	FP3	\N	f	1	1140	session_zqVuCWr3	t	2025-08-30 09:30:00+00	Europe/Amsterdam
4878	4	Q1	\N	f	1	1140	session_kAGS5ufz	t	2025-08-30 13:00:00+00	Europe/Amsterdam
4879	5	Q2	\N	f	1	1140	session_ghxa79NH	t	2025-08-30 13:00:00+00	Europe/Amsterdam
4880	6	Q3	\N	f	1	1140	session_jCK5z62t	t	2025-08-30 13:00:00+00	Europe/Amsterdam
4881	7	R	72	f	24	1140	session_Yy4ISWvr	t	2025-08-31 13:00:00+00	Europe/Amsterdam
4859	1	FP1	\N	f	1	1138	session_Jd3eQ3um	t	2025-07-25 10:30:00+00	Europe/Brussels
4860	2	SQ1	\N	f	1	1138	session_SWfwGRXQ	t	2025-07-25 14:30:00+00	Europe/Brussels
4861	3	SQ2	\N	f	1	1138	session_yQdK7nTT	t	2025-07-25 14:30:00+00	Europe/Brussels
4862	4	SQ3	\N	f	1	1138	session_6J1qliyS	t	2025-07-25 14:30:00+00	Europe/Brussels
4863	5	SR	\N	f	23	1138	session_2tCooKIG	t	2025-07-26 10:00:00+00	Europe/Brussels
4864	6	Q1	\N	f	1	1138	session_pgdgWbHd	t	2025-07-26 14:00:00+00	Europe/Brussels
4865	7	Q2	\N	f	1	1138	session_WTMaywHX	t	2025-07-26 14:00:00+00	Europe/Brussels
4868	1	FP1	\N	f	1	1139	session_7Gxnvv80	t	2025-08-01 11:30:00+00	Europe/Budapest
4869	2	FP2	\N	f	1	1139	session_wFqwRSzu	t	2025-08-01 15:00:00+00	Europe/Budapest
4870	3	FP3	\N	f	1	1139	session_FB0d2SYI	t	2025-08-02 10:30:00+00	Europe/Budapest
4871	4	Q1	\N	f	1	1139	session_FoJRJ6sP	t	2025-08-02 14:00:00+00	Europe/Budapest
4872	5	Q2	\N	f	1	1139	session_e8Rbitmy	t	2025-08-02 14:00:00+00	Europe/Budapest
4873	6	Q3	\N	f	1	1139	session_YCfdmw1X	t	2025-08-02 14:00:00+00	Europe/Budapest
4874	7	R	70	f	24	1139	session_HzaPRbOV	t	2025-08-03 13:00:00+00	Europe/Budapest
4852	1	FP1	\N	f	1	1137	session_WIqxVT7I	t	2025-07-04 11:30:00+00	Europe/London
4853	2	FP2	\N	f	1	1137	session_mwmKnrcM	t	2025-07-04 15:00:00+00	Europe/London
4854	3	FP3	\N	f	1	1137	session_XpRxUCqS	t	2025-07-05 10:30:00+00	Europe/London
4855	4	Q1	\N	f	1	1137	session_ufi1WgGb	t	2025-07-05 14:00:00+00	Europe/London
4856	5	Q2	\N	f	1	1137	session_ZJtBE2E7	t	2025-07-05 14:00:00+00	Europe/London
4857	6	Q3	\N	f	1	1137	session_GqJH6Zir	t	2025-07-05 14:00:00+00	Europe/London
4858	7	R	52	f	24	1137	session_Tqc6midw	t	2025-07-06 14:00:00+00	Europe/London
4882	1	FP1	\N	f	1	1141	session_wUyRJ7oW	t	2025-09-05 11:30:00+00	Europe/Rome
4883	2	FP2	\N	f	1	1141	session_gLu5GvYP	t	2025-09-05 15:00:00+00	Europe/Rome
4884	3	FP3	\N	f	1	1141	session_ymgKYmnW	t	2025-09-06 10:30:00+00	Europe/Rome
4885	4	Q1	\N	f	1	1141	session_DMxcfia0	t	2025-09-06 14:00:00+00	Europe/Rome
4886	5	Q2	\N	f	1	1141	session_vxqd1B9k	t	2025-09-06 14:00:00+00	Europe/Rome
4887	6	Q3	\N	f	1	1141	session_Q31ObWGT	t	2025-09-06 14:00:00+00	Europe/Rome
4888	7	R	53	f	24	1141	session_avG88vHu	t	2025-09-07 13:00:00+00	Europe/Rome
4845	1	FP1	\N	f	1	1136	session_B0SV0meR	t	2025-06-27 11:30:00+00	Europe/Vienna
4846	2	FP2	\N	f	1	1136	session_LyyfmcNO	t	2025-06-27 15:00:00+00	Europe/Vienna
4847	3	FP3	\N	f	1	1136	session_41sZvmaS	t	2025-06-28 10:30:00+00	Europe/Vienna
4848	4	Q1	\N	f	1	1136	session_OOjt9Kmn	t	2025-06-28 14:00:00+00	Europe/Vienna
4849	5	Q2	\N	f	1	1136	session_1ddgEhi2	t	2025-06-28 14:00:00+00	Europe/Vienna
4850	6	Q3	\N	f	1	1136	session_CLEIfhGd	t	2025-06-28 14:00:00+00	Europe/Vienna
4851	7	R	71	f	24	1136	session_EUOU3b7h	t	2025-06-29 13:00:00+00	Europe/Vienna
4928	3	FP3	\N	f	1	1147	session_q69492P5	t	2025-11-22 00:30:00+00	America/Los_Angeles
4929	4	Q1	\N	f	1	1147	session_0JeaMTb9	t	2025-11-22 04:00:00+00	America/Los_Angeles
4843	6	Q3	\N	f	1	1135	session_W0aIxg2c	t	2025-06-14 20:00:00+00	America/Montreal
4844	7	R	70	f	24	1135	session_V9pGDdC2	t	2025-06-15 18:00:00+00	America/Montreal
4900	5	Q2	\N	f	1	1143	session_7WsS87j3	t	2025-10-04 13:00:00+00	Asia/Singapore
4901	6	Q3	\N	f	1	1143	session_kw5oCidU	t	2025-10-04 13:00:00+00	Asia/Singapore
4902	7	R	62	f	24	1143	session_qLIn1RAu	t	2025-10-05 12:00:00+00	Asia/Singapore
4949	8	Q3	\N	f	1	1144	session_anVq99Cm	t	2025-10-18 21:00:00+00	America/Chicago
4950	9	R	56	f	24	1144	session_wAeaTFVC	t	2025-10-19 19:00:00+00	America/Chicago
4932	7	R	50	f	24	1147	session_IfMtHa40	t	2025-11-23 04:00:00+00	America/Los_Angeles
4942	1	FP1	\N	f	1	1149	session_xX7dvATL	t	2025-12-05 09:30:00+00	Asia/Dubai
4943	2	FP2	\N	f	1	1149	session_sfx4KBjX	t	2025-12-05 13:00:00+00	Asia/Dubai
4944	3	FP3	\N	f	1	1149	session_UsWB229Q	t	2025-12-06 10:30:00+00	Asia/Dubai
4945	4	Q1	\N	f	1	1149	session_Vm9J9Uxn	t	2025-12-06 14:00:00+00	Asia/Dubai
4946	5	Q2	\N	f	1	1149	session_HPxgtbZE	t	2025-12-06 14:00:00+00	Asia/Dubai
4947	6	Q3	\N	f	1	1149	session_kGYIX8C9	t	2025-12-06 14:00:00+00	Asia/Dubai
4948	7	R	58	f	24	1149	session_s6Mp2pAB	t	2025-12-07 13:00:00+00	Asia/Dubai
4933	1	FP1	\N	f	1	1148	session_ejwvI1m2	t	2025-11-28 13:30:00+00	Asia/Qatar
4934	2	SQ1	\N	f	1	1148	session_sd4DBaxU	t	2025-11-28 17:30:00+00	Asia/Qatar
4935	3	SQ2	\N	f	1	1148	session_3U9A9GPY	t	2025-11-28 17:30:00+00	Asia/Qatar
4936	4	SQ3	\N	f	1	1148	session_AUvU3bQl	t	2025-11-28 17:30:00+00	Asia/Qatar
4937	5	SR	\N	f	23	1148	session_Rkwf3qxl	t	2025-11-29 14:00:00+00	Asia/Qatar
4938	6	Q1	\N	f	1	1148	session_BHtLDi3j	t	2025-11-29 18:00:00+00	Asia/Qatar
4939	7	Q2	\N	f	1	1148	session_h9TlJYPA	t	2025-11-29 18:00:00+00	Asia/Qatar
4940	8	Q3	\N	f	1	1148	session_EuhGibYe	t	2025-11-29 18:00:00+00	Asia/Qatar
4941	9	R	57	f	24	1148	session_72HE0gPk	t	2025-11-30 16:00:00+00	Asia/Qatar
\.


--
-- Data for Name: formula_one_teamdriver; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_teamdriver (id, role, driver_id, season_id, team_id, api_id) FROM stdin;
1	\N	1	1	1	teamdriver_LSox06Od
2	\N	2	1	1	teamdriver_bLowFOCJ
3	\N	3	1	1	teamdriver_d8PF1G74
4	\N	4	1	5	teamdriver_DuMzxcI2
5	\N	5	1	5	teamdriver_0BTCGA9I
6	\N	6	1	4	teamdriver_WLosNKTu
7	\N	7	1	4	teamdriver_eefZHC4n
8	\N	8	1	5	teamdriver_KALDUuy4
9	\N	9	1	2	teamdriver_pzWRMI8C
10	\N	11	1	2	teamdriver_1jgFtLvp
11	\N	10	1	2	teamdriver_F8LVjLq6
12	\N	12	1	5	teamdriver_WWZsjTLo
13	\N	13	1	1	teamdriver_9REtc3GO
14	\N	14	1	3	teamdriver_06fr2NkS
15	\N	15	1	2	teamdriver_UHIvUOEl
16	\N	16	1	2	teamdriver_L2FZYdaA
17	\N	17	1	3	teamdriver_mKGZOfak
18	\N	18	1	2	teamdriver_lnnqpzOv
19	\N	19	1	2	teamdriver_yr9A1oVC
20	\N	20	1	5	teamdriver_hOJAK4ps
21	\N	22	1	4	teamdriver_qABP443J
22	\N	21	1	4	teamdriver_DDSxDVPf
23	\N	23	1	4	teamdriver_52akUMcm
24	\N	24	1	6	teamdriver_3G2SACp0
25	\N	25	1	6	teamdriver_l0P4UPj4
26	\N	26	1	6	teamdriver_W3ncdwhj
27	\N	27	1	2	teamdriver_lVSPL9wh
28	\N	28	1	8	teamdriver_dP7Hxcrb
29	\N	29	1	8	teamdriver_j2uW4shr
30	\N	30	1	2	teamdriver_8oBhUk5G
31	\N	31	1	7	teamdriver_AuoxG1jy
32	\N	32	1	6	teamdriver_BhxOkl14
33	\N	33	1	2	teamdriver_mS5e4svS
34	\N	34	1	10	teamdriver_VuHXDPqF
35	\N	35	1	11	teamdriver_1BTbGdkA
36	\N	36	1	11	teamdriver_cUz5AOzF
37	\N	37	1	10	teamdriver_rXrmQCdn
38	\N	38	1	10	teamdriver_coPtOZQN
39	\N	39	1	10	teamdriver_mTrAi6I7
40	\N	40	1	23	teamdriver_4kwTJ4t5
41	\N	41	1	10	teamdriver_7hFuRKGi
42	\N	42	1	19	teamdriver_EtJ2ZjtF
43	\N	43	1	22	teamdriver_LFXZgtCZ
44	\N	44	1	10	teamdriver_zEOsJbQP
45	\N	45	1	21	teamdriver_TVFSmmT8
46	\N	46	1	20	teamdriver_zPU59IGm
47	\N	47	1	10	teamdriver_gOf2tpPp
48	\N	48	1	10	teamdriver_VdUdoMhl
49	\N	49	1	19	teamdriver_AlCLvhDc
50	\N	50	1	18	teamdriver_ctnzjR4t
51	\N	51	1	17	teamdriver_wRcy7qel
52	\N	52	1	10	teamdriver_1Uhe5xL2
53	\N	53	1	10	teamdriver_jDA5NcRb
54	\N	54	1	2	teamdriver_tix6Ecqt
55	\N	55	1	10	teamdriver_rSBKdsQr
56	\N	56	1	16	teamdriver_jcSADLav
57	\N	57	1	15	teamdriver_B11k7OFP
58	\N	58	1	14	teamdriver_xdTW11Ga
59	\N	59	1	2	teamdriver_wh8MrsaO
60	\N	60	1	13	teamdriver_NBcGyCsz
61	\N	61	1	12	teamdriver_QaXU0Yu0
62	\N	62	1	12	teamdriver_VsFhBsal
63	\N	63	1	10	teamdriver_2GTnCaR2
64	\N	64	1	10	teamdriver_Dc8GzgIg
65	\N	65	1	10	teamdriver_3PWBemne
66	\N	38	1	11	teamdriver_KvFkF3B1
67	\N	66	1	9	teamdriver_rNKqSyok
68	\N	67	1	10	teamdriver_s7QPab92
69	\N	68	1	2	teamdriver_BFjyo6EZ
70	\N	69	1	2	teamdriver_b1NFmK4x
71	\N	31	1	5	teamdriver_GqgMXKqa
72	\N	70	1	2	teamdriver_1y2vLNGY
73	\N	71	1	5	teamdriver_lYdLwp7e
74	\N	72	1	5	teamdriver_slsar9ly
75	\N	25	1	5	teamdriver_6CRQinFN
76	\N	73	1	5	teamdriver_wYA3ZVh7
77	\N	3	1	2	teamdriver_EXVQUZTc
78	\N	74	1	6	teamdriver_C0TgqXrR
79	\N	75	1	5	teamdriver_pFaKCRS5
80	\N	76	1	1	teamdriver_M37Z9ril
81	\N	77	1	6	teamdriver_8sWPg6zS
82	\N	78	1	5	teamdriver_gDJj3mGY
83	\N	79	1	2	teamdriver_CkFANWDX
84	\N	80	1	1	teamdriver_6tTxcpbX
85	\N	81	1	2	teamdriver_tPhRanbo
86	\N	68	1	24	teamdriver_TmjVtn2G
87	\N	13	2	1	teamdriver_MB1lFsO8
88	\N	76	2	6	teamdriver_LTIPOpxX
89	\N	1	2	1	teamdriver_5mr8Ege6
90	\N	80	2	1	teamdriver_VW9ZaN8n
91	\N	18	2	1	teamdriver_9fG0pT58
92	\N	24	2	6	teamdriver_v348hl2P
93	\N	19	2	2	teamdriver_q2mefRE8
94	\N	82	2	25	teamdriver_MLo9oSuo
95	\N	5	2	5	teamdriver_OBKbzfZy
96	\N	8	2	5	teamdriver_rlrD0kER
97	\N	83	2	6	teamdriver_f44NqjRT
98	\N	31	2	2	teamdriver_lrz4pjLx
99	\N	12	2	5	teamdriver_7Gz77Y7s
100	\N	75	2	5	teamdriver_d6D5qT6r
101	\N	32	2	6	teamdriver_DwY2efWc
102	\N	78	2	5	teamdriver_tHguoU3W
103	\N	84	2	25	teamdriver_qttsjYgG
104	\N	4	2	5	teamdriver_iQqZS2kY
105	\N	26	2	6	teamdriver_ilUMiGZu
106	\N	27	2	5	teamdriver_SNMHwhSj
107	\N	85	2	26	teamdriver_PY9ut7GJ
108	\N	40	2	10	teamdriver_gYMWAxrT
109	\N	86	2	10	teamdriver_Vt9cZeKW
110	\N	48	2	10	teamdriver_YesWBjUI
111	\N	87	2	10	teamdriver_i4Butflu
112	\N	88	2	33	teamdriver_O6Zz3bxO
113	\N	89	2	29	teamdriver_5k3yL4Tp
114	\N	59	2	23	teamdriver_BZ7nK5Dd
115	\N	90	2	10	teamdriver_xKbIJ4fG
116	\N	46	2	11	teamdriver_bRbZIp7T
117	\N	38	2	11	teamdriver_KrZGN5RR
118	\N	91	2	10	teamdriver_DHGfRjra
119	\N	92	2	10	teamdriver_zCzPVyrI
120	\N	65	2	10	teamdriver_NU8Wjw8t
121	\N	60	2	10	teamdriver_720zlaKt
122	\N	36	2	11	teamdriver_a618KXaV
123	\N	41	2	28	teamdriver_wqUuE6HV
124	\N	51	2	30	teamdriver_Z57Muzcy
125	\N	63	2	10	teamdriver_U6SMvmO0
126	\N	93	2	10	teamdriver_LZGPifIw
127	\N	94	2	32	teamdriver_2PRn7OAT
128	\N	95	2	21	teamdriver_6paML5UD
129	\N	34	2	10	teamdriver_xr7agqP3
130	\N	37	2	10	teamdriver_zURw8jTc
131	\N	49	2	10	teamdriver_uDcm39HE
132	\N	67	2	29	teamdriver_3dHVj66u
133	\N	96	2	10	teamdriver_aVzgl8z7
134	\N	53	2	10	teamdriver_yQDfBmfd
135	\N	97	2	31	teamdriver_tsnPICJn
136	\N	98	2	10	teamdriver_WMWFuwoG
137	\N	99	2	27	teamdriver_DWbMLw3w
138	\N	42	2	19	teamdriver_ZzmeHV02
139	\N	47	2	11	teamdriver_dqlcHrI1
140	\N	52	2	2	teamdriver_vfCmV2D3
141	\N	100	2	9	teamdriver_WCNReaJE
142	\N	101	2	5	teamdriver_OdgEw8v0
143	\N	71	2	5	teamdriver_uH0jy32d
144	\N	19	2	5	teamdriver_QoezlveD
145	\N	2	2	1	teamdriver_Jqsw2t3D
146	\N	27	2	6	teamdriver_wfsVObvs
147	\N	3	2	6	teamdriver_vV2tbvpJ
148	\N	72	2	5	teamdriver_i8BC3eSD
149	\N	102	2	8	teamdriver_I8EDdmIN
150	\N	29	2	8	teamdriver_hLpr1ofK
151	\N	103	2	8	teamdriver_x5Er3bpT
152	\N	28	2	8	teamdriver_WnERPG8g
153	\N	104	2	2	teamdriver_c466Q6uu
154	\N	18	2	2	teamdriver_TWquNDUq
155	\N	68	2	1	teamdriver_ABfNCcTV
156	\N	3	2	34	teamdriver_IeNwGR1e
157	\N	21	2	34	teamdriver_fPxxvd4i
158	\N	10	2	4	teamdriver_CZTdfuIP
159	\N	6	2	4	teamdriver_6Tm9UEKy
160	\N	105	2	5	teamdriver_Yip1nc4p
161	\N	14	2	3	teamdriver_WgM6YGLP
162	\N	106	2	2	teamdriver_6Ch5Hniv
163	\N	16	2	2	teamdriver_ATEFDtfR
164	\N	107	2	2	teamdriver_jpeTttWB
165	\N	108	2	5	teamdriver_f03QHGby
166	\N	81	2	1	teamdriver_eBNp7k42
167	\N	70	2	2	teamdriver_GO6jLY9F
168	\N	30	2	35	teamdriver_FtGgfF0m
169	\N	109	2	6	teamdriver_espZYMJ8
170	\N	110	2	34	teamdriver_VXAJTzbS
171	\N	111	2	2	teamdriver_xlbyVyJl
172	\N	112	2	5	teamdriver_l511kGCK
173	\N	15	2	2	teamdriver_qg9mXpyJ
174	\N	113	2	2	teamdriver_YXl63RC1
175	\N	76	3	6	teamdriver_VehAlpko
176	\N	83	3	6	teamdriver_n8GIpNws
177	\N	114	3	36	teamdriver_ebJi4S2S
178	\N	115	3	38	teamdriver_L9sdcvt0
179	\N	116	3	7	teamdriver_lpwuDX0k
180	\N	18	3	2	teamdriver_6Xueh1cm
181	\N	85	3	6	teamdriver_RWwvDhYK
182	\N	117	3	7	teamdriver_vb4IMVP3
183	\N	15	3	8	teamdriver_fvDgDzu5
184	\N	1	3	6	teamdriver_vSwW38ub
185	\N	103	3	6	teamdriver_2a0UXlAb
186	\N	31	3	2	teamdriver_XA7lMSN2
187	\N	82	3	25	teamdriver_ZMLg1jHm
188	\N	118	3	25	teamdriver_vNNN7jE7
189	\N	28	3	36	teamdriver_hLQm1Jr5
190	\N	119	3	25	teamdriver_H6rUUzkM
191	\N	84	3	25	teamdriver_EXJpqDHM
192	\N	120	3	37	teamdriver_YFak76On
193	\N	121	3	26	teamdriver_luUek0fT
194	\N	5	3	6	teamdriver_ckrSsUBx
195	\N	122	3	8	teamdriver_ktWqi5Ge
196	\N	49	3	28	teamdriver_HCGxhBFf
197	\N	58	3	10	teamdriver_IfYvOkah
198	\N	65	3	10	teamdriver_fSjn6wh8
199	\N	46	3	19	teamdriver_MIW5CuEK
200	\N	123	3	10	teamdriver_HTm8QKYd
201	\N	124	3	10	teamdriver_BlWJySSh
202	\N	125	3	10	teamdriver_4nqArq22
203	\N	42	3	10	teamdriver_CvsqaItG
204	\N	98	3	10	teamdriver_laNyb3JQ
205	\N	34	3	10	teamdriver_bnlcEwyo
206	\N	48	3	10	teamdriver_6kCst30c
207	\N	126	3	9	teamdriver_vLBhXMGu
208	\N	100	3	10	teamdriver_nEmgFg5N
209	\N	60	3	20	teamdriver_1ktHVZpp
210	\N	127	3	33	teamdriver_4gd7dYvh
211	\N	128	3	27	teamdriver_8ICRKRoQ
212	\N	99	3	10	teamdriver_xducGjj4
213	\N	95	3	10	teamdriver_Bf6WdwrS
214	\N	59	3	19	teamdriver_h4PboYqv
215	\N	87	3	19	teamdriver_HjNDzLGR
216	\N	52	3	10	teamdriver_66rmfllU
217	\N	54	3	31	teamdriver_8Aap0ITe
218	\N	97	3	10	teamdriver_GKlcj13L
219	\N	38	3	11	teamdriver_MaeKjxjI
220	\N	91	3	10	teamdriver_VNaAuxKT
221	\N	129	3	10	teamdriver_Ail8Pkil
222	\N	63	3	10	teamdriver_iURtIlZD
223	\N	50	3	10	teamdriver_QWjKlUE1
224	\N	130	3	10	teamdriver_WtIsnLvU
225	\N	96	3	10	teamdriver_7lIuHGxk
226	\N	24	3	6	teamdriver_vunRjFzS
227	\N	89	3	20	teamdriver_kbyXTrgf
228	\N	88	3	10	teamdriver_oAiMQVjE
229	\N	131	3	7	teamdriver_87Xxc11q
230	\N	132	3	25	teamdriver_HCYvUHjL
231	\N	133	3	6	teamdriver_BRHc4Nxv
232	\N	12	3	36	teamdriver_rpCKX5Uc
233	\N	134	3	25	teamdriver_n9318BSD
234	\N	135	3	26	teamdriver_Lh0UnAU6
235	\N	136	3	8	teamdriver_LpONleWk
236	\N	137	3	25	teamdriver_XjH0T6Vk
237	\N	138	3	39	teamdriver_zHLPkEWN
238	\N	82	3	4	teamdriver_numEYfa2
239	\N	29	3	8	teamdriver_cJjPKbIL
240	\N	8	3	2	teamdriver_NN8ST14V
241	\N	4	3	25	teamdriver_YxTM0UQc
242	\N	79	3	6	teamdriver_mBNudSOV
243	\N	15	3	36	teamdriver_HVzgcRrb
244	\N	32	3	3	teamdriver_CH6eR0PD
245	\N	12	3	8	teamdriver_3scG1tOm
246	\N	139	3	6	teamdriver_BiMzdT3H
247	\N	140	3	40	teamdriver_juchLgX9
248	\N	141	3	40	teamdriver_ns4j9sve
249	\N	3	3	7	teamdriver_Mf5PpH4K
250	\N	142	3	6	teamdriver_gP4RjAA8
251	\N	143	3	40	teamdriver_HkV28kf6
252	\N	32	3	6	teamdriver_PdNC8IkF
253	\N	144	3	3	teamdriver_GMauEcSE
254	\N	145	3	40	teamdriver_2Jy3Bcin
255	\N	146	3	2	teamdriver_dYeHvAig
256	\N	147	3	38	teamdriver_7OMroKyE
257	\N	105	3	25	teamdriver_jvie5Whb
258	\N	29	3	36	teamdriver_jGFMKy57
259	\N	16	3	7	teamdriver_t56lWK2v
260	\N	148	3	2	teamdriver_WPNmOfDf
261	\N	149	3	39	teamdriver_QyUDx2nK
262	\N	134	3	6	teamdriver_yQN4HN2u
263	\N	150	3	26	teamdriver_khibvgkN
264	\N	151	3	37	teamdriver_mNWGIPXv
265	\N	12	3	25	teamdriver_xjP7tMmF
266	\N	152	3	26	teamdriver_UyafkiKA
267	\N	153	3	41	teamdriver_lCGWDDuv
268	\N	154	3	37	teamdriver_jEhLDlcn
269	\N	155	3	26	teamdriver_gRfJQdWR
270	\N	156	3	41	teamdriver_0kG8aXKV
271	\N	157	3	41	teamdriver_y1LJFSro
272	\N	158	3	41	teamdriver_g7dchpes
273	\N	159	3	6	teamdriver_QcbhCNk0
274	\N	81	3	26	teamdriver_mbUjhIG9
275	\N	68	3	2	teamdriver_j9sSpIU1
276	\N	160	3	26	teamdriver_xwgDAXlY
277	\N	161	3	26	teamdriver_NcEmVeuj
278	\N	26	3	6	teamdriver_XZtt2xX1
279	\N	109	3	2	teamdriver_E5gGsqD8
280	\N	162	3	2	teamdriver_3QyG2Ucy
281	\N	163	3	25	teamdriver_DeM8Xy5N
282	\N	132	3	8	teamdriver_actT9W0s
283	\N	27	3	2	teamdriver_wwbiazfc
284	\N	115	3	7	teamdriver_jnDa7B16
285	\N	82	3	40	teamdriver_ZqhJBBIe
286	\N	30	3	2	teamdriver_T9sNkMRw
287	\N	164	3	35	teamdriver_YnPaWppy
288	\N	165	3	2	teamdriver_O4BinCdm
289	\N	120	3	6	teamdriver_gru2IKN3
290	\N	166	3	42	teamdriver_FgnfZC9y
291	\N	24	4	6	teamdriver_HIjxb4ZR
292	\N	26	4	6	teamdriver_Dqgti1RV
293	\N	27	4	2	teamdriver_eoOtt05m
294	\N	131	4	6	teamdriver_tV7NRTLD
295	\N	167	4	2	teamdriver_cB1DdIrS
296	\N	114	4	36	teamdriver_Or0iZv8C
297	\N	31	4	36	teamdriver_rr519UOv
298	\N	29	4	36	teamdriver_Jetj6uHZ
299	\N	168	4	7	teamdriver_MYG318R4
300	\N	116	4	7	teamdriver_P7dBJi86
301	\N	28	4	36	teamdriver_2FPrO4sG
302	\N	13	4	2	teamdriver_Me0TWR7m
303	\N	68	4	2	teamdriver_wYDdmS5T
304	\N	1	4	6	teamdriver_oJfiwvWX
305	\N	169	4	36	teamdriver_QOkh75hz
306	\N	170	4	8	teamdriver_yAsY8s4c
307	\N	171	4	7	teamdriver_xtGecFtb
308	\N	99	4	10	teamdriver_YomLzIi1
309	\N	123	4	10	teamdriver_16vHcBip
310	\N	46	4	10	teamdriver_zg114Jia
311	\N	65	4	10	teamdriver_R4JnO6OX
312	\N	63	4	10	teamdriver_DuSh8r9p
313	\N	43	4	10	teamdriver_GvbNFGOG
314	\N	48	4	10	teamdriver_3KiOx6Dn
315	\N	172	4	10	teamdriver_kR5aMEwH
316	\N	58	4	10	teamdriver_5pzFYkBf
317	\N	128	4	10	teamdriver_IItLLBqC
318	\N	173	4	20	teamdriver_twALzoqh
319	\N	38	4	28	teamdriver_Oodrnimq
320	\N	95	4	28	teamdriver_6VHqY2An
321	\N	50	4	28	teamdriver_uAn5MmYN
322	\N	51	4	10	teamdriver_NCz2JuTN
323	\N	91	4	10	teamdriver_eJ1iEoWJ
324	\N	130	4	10	teamdriver_1IuA3aIG
325	\N	93	4	10	teamdriver_8D3uYZHI
326	\N	87	4	28	teamdriver_zPtMXPZn
327	\N	124	4	29	teamdriver_iWX7cCJc
328	\N	35	4	10	teamdriver_a9Slaa0O
329	\N	97	4	10	teamdriver_LwImdGiy
330	\N	88	4	10	teamdriver_QvEfCLvh
331	\N	67	4	10	teamdriver_3mEZQNSt
332	\N	41	4	10	teamdriver_Wm9bo2UX
333	\N	174	4	10	teamdriver_pdm4Xdcf
334	\N	175	4	10	teamdriver_8Uf4gu7U
335	\N	176	4	10	teamdriver_LJrRDAiQ
336	\N	57	4	10	teamdriver_S0HaE7rQ
337	\N	54	4	10	teamdriver_KFidCBRM
338	\N	129	4	28	teamdriver_Bd1CcbnE
339	\N	86	4	43	teamdriver_uX5ABfNE
340	\N	44	4	28	teamdriver_e8U4mGqO
341	\N	55	4	10	teamdriver_whxKYjH6
342	\N	95	4	10	teamdriver_SYCibq8S
343	\N	46	4	19	teamdriver_LnAqTcDg
344	\N	34	4	10	teamdriver_IAEyIPpY
345	\N	177	4	9	teamdriver_0hTSdlFJ
346	\N	50	4	10	teamdriver_VPXPcGIH
347	\N	178	4	10	teamdriver_hrvBTLPd
348	\N	130	4	31	teamdriver_TfUQPNIP
349	\N	176	4	44	teamdriver_XlXUeEWM
350	\N	88	4	20	teamdriver_qcEVd0r0
351	\N	18	4	2	teamdriver_O64RTF84
352	\N	5	4	6	teamdriver_52hPrxWp
353	\N	119	4	25	teamdriver_vm8dygoz
354	\N	82	4	40	teamdriver_Ag5K4vQl
355	\N	145	4	40	teamdriver_RV8PCjYh
356	\N	12	4	40	teamdriver_EccAhhfe
357	\N	179	4	36	teamdriver_S8HidJqZ
358	\N	115	4	7	teamdriver_TIscNdlr
359	\N	142	4	40	teamdriver_glR327t9
360	\N	118	4	25	teamdriver_qJguohbv
361	\N	104	4	2	teamdriver_DbkscUdu
362	\N	180	4	36	teamdriver_B73d1ELF
363	\N	132	4	25	teamdriver_uExkUkZg
364	\N	101	4	40	teamdriver_JAKw6h0o
365	\N	12	4	2	teamdriver_FXRhJeUI
366	\N	181	4	8	teamdriver_Q9IPbh2Y
367	\N	135	4	26	teamdriver_dtPUp8IJ
368	\N	6	4	7	teamdriver_3iFv4hl4
369	\N	4	4	25	teamdriver_Vt0E1xf9
370	\N	19	4	35	teamdriver_lhzSes4X
371	\N	82	4	7	teamdriver_dbq4LFMi
372	\N	15	4	40	teamdriver_f8Uu7SpO
373	\N	164	4	35	teamdriver_a5n7qQQg
374	\N	32	4	7	teamdriver_x9a5stup
375	\N	182	4	7	teamdriver_27ux4MJi
376	\N	22	4	40	teamdriver_3D1zaqk1
377	\N	183	4	25	teamdriver_HeFSTKTy
378	\N	184	4	40	teamdriver_8lTE3erc
379	\N	105	4	25	teamdriver_WQTAGm1V
380	\N	147	4	7	teamdriver_hzXtrDrj
381	\N	108	4	6	teamdriver_0cy1LfrO
382	\N	185	4	26	teamdriver_YL8EHzLi
383	\N	186	4	7	teamdriver_oo5LtLs8
384	\N	160	4	26	teamdriver_Lblz6HJw
385	\N	158	4	41	teamdriver_MC9qMfI4
386	\N	153	4	41	teamdriver_9ruF9BX8
387	\N	187	4	26	teamdriver_utWbo1ZU
388	\N	188	4	45	teamdriver_pDzTU86e
389	\N	189	4	26	teamdriver_zBGsagDU
390	\N	154	4	26	teamdriver_JGZypkhX
391	\N	190	4	37	teamdriver_fEILSTgQ
392	\N	191	4	6	teamdriver_41BzxkCV
393	\N	157	4	37	teamdriver_QGzBXCGY
394	\N	192	4	26	teamdriver_ln2bJ0t7
395	\N	120	4	37	teamdriver_gD25EBzy
396	\N	193	4	26	teamdriver_e7JrqZB5
397	\N	194	4	2	teamdriver_mWwZWc5v
398	\N	122	4	6	teamdriver_LXcKCii7
399	\N	195	4	25	teamdriver_FvPL3d0C
400	\N	109	4	2	teamdriver_ih8rKsAv
401	\N	85	4	6	teamdriver_kSVAphyP
402	\N	196	4	2	teamdriver_jabTADqw
403	\N	197	4	2	teamdriver_iqNCpMP6
404	\N	198	4	6	teamdriver_1Dcbj143
405	\N	15	4	2	teamdriver_pvxabrP5
406	\N	183	4	40	teamdriver_RL0lAdSJ
407	\N	139	4	6	teamdriver_nGYt092w
408	\N	199	4	25	teamdriver_bYSvwloc
409	\N	13	5	2	teamdriver_CwfZMUlS
410	\N	1	5	6	teamdriver_5DXJ1jBc
411	\N	27	5	6	teamdriver_ee6oaEeW
412	\N	29	5	6	teamdriver_lZaKDGM1
413	\N	164	5	36	teamdriver_PLWYS08x
414	\N	31	5	2	teamdriver_I7OKOIZs
415	\N	15	5	2	teamdriver_2A0eyXn3
416	\N	18	5	2	teamdriver_3O4U7Kgf
417	\N	198	5	6	teamdriver_HibQTNUH
418	\N	114	5	36	teamdriver_6FH3RbYI
419	\N	131	5	6	teamdriver_r25SqoF7
420	\N	104	5	2	teamdriver_OYFVxZAG
421	\N	179	5	2	teamdriver_jyScT9al
422	\N	200	5	36	teamdriver_i0UHiLWu
423	\N	201	5	2	teamdriver_FhNwerLj
424	\N	5	5	6	teamdriver_bt6lPC0P
425	\N	196	5	2	teamdriver_HRTeqxuO
426	\N	169	5	2	teamdriver_641ikLov
427	\N	99	5	10	teamdriver_GHJBESG0
428	\N	124	5	28	teamdriver_h1kCiRXx
429	\N	48	5	10	teamdriver_llZyID95
430	\N	49	5	10	teamdriver_3Oib6U8r
431	\N	46	5	10	teamdriver_1IZ4e65n
432	\N	86	5	10	teamdriver_Opa5dP7i
433	\N	63	5	10	teamdriver_aIpb9RNV
434	\N	177	5	47	teamdriver_ZBX4hvLt
435	\N	55	5	10	teamdriver_WoEhNnG4
436	\N	43	5	10	teamdriver_7TX4YzwA
437	\N	202	5	10	teamdriver_hCZnzdS4
438	\N	178	5	20	teamdriver_pMP6Qrq2
439	\N	51	5	10	teamdriver_pJQCvUYo
440	\N	123	5	10	teamdriver_bJ9hQaxX
441	\N	34	5	10	teamdriver_sO4Mfv40
442	\N	65	5	10	teamdriver_UvO2WBkq
443	\N	88	5	10	teamdriver_bcxi2tvk
444	\N	95	5	28	teamdriver_dA7fuUj7
445	\N	41	5	28	teamdriver_Tuv2CA4A
446	\N	87	5	28	teamdriver_ayHda1WT
447	\N	129	5	10	teamdriver_Otx1cUjQ
448	\N	38	5	10	teamdriver_voYnw0Fd
449	\N	64	5	10	teamdriver_53oTA9dx
450	\N	175	5	10	teamdriver_zXwsQVkd
451	\N	173	5	10	teamdriver_TDGEonFn
452	\N	125	5	46	teamdriver_IJd8uOz8
453	\N	203	5	20	teamdriver_ZU3e5Gqz
454	\N	130	5	20	teamdriver_rgy5CHYf
455	\N	204	5	10	teamdriver_5M8jGpM6
456	\N	127	5	10	teamdriver_tpdl6O5S
457	\N	58	5	10	teamdriver_hwnt5s20
458	\N	205	5	10	teamdriver_4TTsDPwK
459	\N	97	5	30	teamdriver_HXzA84ys
460	\N	128	5	30	teamdriver_jPYqqgPk
461	\N	50	5	10	teamdriver_ddjbh4pe
462	\N	88	5	22	teamdriver_O9SsP0O2
463	\N	172	5	22	teamdriver_Z3dcbkoH
464	\N	176	5	22	teamdriver_OoWirWEL
465	\N	88	5	29	teamdriver_YM5baNFa
466	\N	130	5	29	teamdriver_9hycq2Z9
467	\N	172	5	10	teamdriver_Q35eY4UO
468	\N	44	5	10	teamdriver_gBmvktzV
469	\N	54	5	31	teamdriver_0TvkNbLD
470	\N	206	5	31	teamdriver_SHHmhIEq
471	\N	207	5	29	teamdriver_j0cbEZCL
472	\N	127	5	29	teamdriver_5orD0SOC
473	\N	208	5	10	teamdriver_QEUsgbdT
474	\N	82	5	2	teamdriver_K7Y7T0Ph
475	\N	101	5	36	teamdriver_jtHLATTO
476	\N	197	5	2	teamdriver_CAf15Tg6
477	\N	132	5	36	teamdriver_N5HUJYo7
478	\N	108	5	6	teamdriver_vUlPWJUW
479	\N	13	5	48	teamdriver_NwXke0KQ
480	\N	209	5	48	teamdriver_goL2gRrV
481	\N	28	5	6	teamdriver_VgExL5X6
482	\N	26	5	2	teamdriver_jsYiEFTl
483	\N	115	5	2	teamdriver_T3ES6Yot
484	\N	185	5	48	teamdriver_kjMtiPsE
485	\N	142	5	2	teamdriver_geeSrIQX
486	\N	118	5	25	teamdriver_I3hXevvu
487	\N	181	5	36	teamdriver_18x0ntB5
488	\N	210	5	36	teamdriver_d9kksU0C
489	\N	24	5	2	teamdriver_xOGiiuCy
490	\N	6	5	7	teamdriver_0aemzrfc
491	\N	211	5	40	teamdriver_9cJKzYLl
492	\N	212	5	40	teamdriver_hJSSwsd1
493	\N	213	5	40	teamdriver_7NeMepoZ
494	\N	214	5	7	teamdriver_El47nxDG
495	\N	215	5	40	teamdriver_65D3YGkf
496	\N	216	5	2	teamdriver_YqME3c01
497	\N	217	5	40	teamdriver_WgF1ucxL
498	\N	3	5	6	teamdriver_0ouoEvk1
499	\N	218	5	36	teamdriver_IF3GF1cU
500	\N	119	5	49	teamdriver_hH7J3cGV
501	\N	32	5	7	teamdriver_JPg6a9sM
502	\N	117	5	7	teamdriver_2vfHaUSh
503	\N	116	5	7	teamdriver_EWQEKV9a
504	\N	186	5	7	teamdriver_IGuL2Hsh
505	\N	76	5	6	teamdriver_FjBhMa28
506	\N	194	5	48	teamdriver_dpTG5IDv
507	\N	160	5	50	teamdriver_04n9G2hw
508	\N	180	5	36	teamdriver_8kV1cJ8g
509	\N	5	5	2	teamdriver_9LYCQmrP
510	\N	24	5	6	teamdriver_dQ7X4Fl0
511	\N	219	5	2	teamdriver_HzJtMPta
512	\N	111	5	2	teamdriver_66ByMkD5
513	\N	220	5	2	teamdriver_8BgDUxCy
514	\N	24	5	51	teamdriver_doKf4koh
515	\N	26	5	51	teamdriver_HyCccGwE
516	\N	13	6	48	teamdriver_BqnZUgVw
517	\N	1	6	6	teamdriver_1utSxmTV
518	\N	27	6	6	teamdriver_8O3nGag6
519	\N	29	6	6	teamdriver_SJC20wbH
520	\N	198	6	6	teamdriver_Mnrf9ezl
521	\N	185	6	48	teamdriver_RfgoLE6x
522	\N	82	6	48	teamdriver_C8VnUyb1
523	\N	209	6	48	teamdriver_qobwI9No
524	\N	179	6	2	teamdriver_fFpuQgUE
525	\N	31	6	2	teamdriver_Z30TLwSF
526	\N	114	6	2	teamdriver_Gj4dpTR3
527	\N	196	6	2	teamdriver_dcz4XZHc
528	\N	197	6	2	teamdriver_9iziW3gN
529	\N	169	6	2	teamdriver_PBL39VpT
530	\N	218	6	2	teamdriver_JU25foVn
531	\N	221	6	36	teamdriver_0BupO1of
532	\N	222	6	51	teamdriver_fBiKAc3M
533	\N	26	6	51	teamdriver_QeSq6iVR
534	\N	223	6	2	teamdriver_36vgKnDZ
535	\N	24	6	51	teamdriver_yWxeMRKc
536	\N	164	6	36	teamdriver_7dmz74B2
537	\N	170	6	36	teamdriver_EvPPIKmo
538	\N	224	6	2	teamdriver_hBWp4JmO
539	\N	19	6	51	teamdriver_nn1sTRWf
540	\N	210	6	36	teamdriver_A7VLQTmi
541	\N	132	6	6	teamdriver_wB4Kn7AA
542	\N	76	6	6	teamdriver_VtiMuzdS
543	\N	31	6	6	teamdriver_XUkLRlYc
544	\N	28	6	36	teamdriver_yOi9OsmS
545	\N	103	6	48	teamdriver_TbeBVhsL
546	\N	131	6	49	teamdriver_TIBzToP7
547	\N	5	6	2	teamdriver_jm0ymT2A
548	\N	118	6	2	teamdriver_ieiZZY1e
549	\N	225	6	25	teamdriver_VuwjacFJ
550	\N	129	6	10	teamdriver_Est7oEJs
551	\N	43	6	10	teamdriver_JKkEiOon
552	\N	38	6	10	teamdriver_4Ou4YtnJ
553	\N	51	6	10	teamdriver_N0RtWDVS
554	\N	176	6	28	teamdriver_wMDlCYqy
555	\N	41	6	10	teamdriver_gkbOkdaW
556	\N	208	6	10	teamdriver_EZ9JOX4D
557	\N	88	6	10	teamdriver_hBFk9YOh
558	\N	226	6	10	teamdriver_VnGhyRu9
559	\N	205	6	10	teamdriver_Qsp3PYFb
560	\N	172	6	10	teamdriver_nsX2EkEv
561	\N	44	6	10	teamdriver_9P2cxoaH
562	\N	46	6	28	teamdriver_hr7INvYv
563	\N	227	6	10	teamdriver_STzK2TqI
564	\N	128	6	27	teamdriver_OAyfAFmI
565	\N	58	6	52	teamdriver_dYJT5IVC
566	\N	177	6	47	teamdriver_OjYhg2rB
567	\N	178	6	10	teamdriver_N6w7sX15
568	\N	123	6	10	teamdriver_5hcFhEBr
569	\N	228	6	27	teamdriver_ax4zpoda
570	\N	65	6	10	teamdriver_RcHF0S9P
571	\N	229	6	29	teamdriver_WIiEKNJN
572	\N	34	6	10	teamdriver_u4sJhjO7
573	\N	230	6	30	teamdriver_7Vhhje87
574	\N	231	6	10	teamdriver_yujveU4s
575	\N	124	6	28	teamdriver_9vurR02l
576	\N	99	6	10	teamdriver_nlEuCZAa
577	\N	48	6	10	teamdriver_Q27QLF0m
578	\N	232	6	10	teamdriver_bi4j3i21
579	\N	97	6	28	teamdriver_iBS6afQF
580	\N	233	6	10	teamdriver_QhLbl2PH
581	\N	203	6	10	teamdriver_wYUTuma3
582	\N	55	6	20	teamdriver_XfOUOU1V
583	\N	63	6	10	teamdriver_UkCCMPEF
584	\N	125	6	46	teamdriver_wszoN8he
585	\N	12	6	2	teamdriver_2h9JgZUJ
586	\N	222	6	6	teamdriver_KLQLJl8q
587	\N	131	6	6	teamdriver_TFPk1gLp
588	\N	234	6	36	teamdriver_AQXhbHpe
589	\N	12	6	6	teamdriver_LVjkqLD8
590	\N	214	6	2	teamdriver_4PzK3j7o
591	\N	21	6	2	teamdriver_toR5gvLT
592	\N	76	6	48	teamdriver_FwtWWOjd
593	\N	235	6	36	teamdriver_40Py5mMm
594	\N	31	6	49	teamdriver_YzKjxQDA
595	\N	115	6	49	teamdriver_xjue8x4j
596	\N	236	6	7	teamdriver_WuPGTecw
597	\N	145	6	40	teamdriver_kfYkVUf1
598	\N	119	6	2	teamdriver_HiVjPlAY
599	\N	142	6	2	teamdriver_XpBXg1j4
600	\N	21	6	40	teamdriver_0WHWZyBz
601	\N	22	6	40	teamdriver_G6iA6kqF
602	\N	212	6	40	teamdriver_Ixs8EKzI
603	\N	103	6	2	teamdriver_7RQXmndu
604	\N	183	6	40	teamdriver_xuL1Ibcg
605	\N	199	6	2	teamdriver_oc6de6Ma
606	\N	237	6	36	teamdriver_yLPjIYYb
607	\N	26	6	6	teamdriver_SzMkzT2q
608	\N	238	6	53	teamdriver_vIsYFSpk
609	\N	13	7	6	teamdriver_tBphMpaM
610	\N	196	7	6	teamdriver_vBPczwhf
611	\N	114	7	2	teamdriver_LMp9h8lv
612	\N	131	7	2	teamdriver_GFIe36ul
613	\N	109	7	2	teamdriver_sfVRlBJs
614	\N	239	7	2	teamdriver_IO0ai6G4
615	\N	240	7	6	teamdriver_wQUkNwjL
616	\N	241	7	2	teamdriver_5J4AWbDU
617	\N	223	7	2	teamdriver_vyURL8RZ
618	\N	82	7	2	teamdriver_r3bfI8pw
619	\N	119	7	6	teamdriver_0GxqbtfP
620	\N	238	7	2	teamdriver_SY72qJTc
621	\N	169	7	2	teamdriver_dcSMd8aQ
622	\N	222	7	6	teamdriver_kUhUNL7y
623	\N	27	7	2	teamdriver_kTiO3rev
624	\N	234	7	36	teamdriver_rrHPiUhj
625	\N	164	7	36	teamdriver_IT4FWDZ5
626	\N	101	7	36	teamdriver_cDIHknxj
627	\N	224	7	2	teamdriver_QFu4diIY
628	\N	214	7	2	teamdriver_b7UpFSdr
629	\N	28	7	36	teamdriver_7LfWktG5
630	\N	5	7	2	teamdriver_RXkmSd0c
631	\N	29	7	49	teamdriver_va44NCUJ
632	\N	31	7	49	teamdriver_u77VZ8Mc
633	\N	242	7	6	teamdriver_TBgdOX94
634	\N	131	7	34	teamdriver_QSbjMpSP
635	\N	243	7	34	teamdriver_jvjZUImo
636	\N	19	7	2	teamdriver_8sglfVLM
637	\N	44	7	9	teamdriver_DGpcl6fZ
638	\N	65	7	10	teamdriver_MlJ7aZpN
639	\N	177	7	47	teamdriver_0KVxVR3o
640	\N	34	7	10	teamdriver_3bgAqyPn
641	\N	66	7	10	teamdriver_tYloSoGd
642	\N	129	7	28	teamdriver_ar5UTWwn
643	\N	244	7	10	teamdriver_fSegDwZU
644	\N	97	7	10	teamdriver_pQavAlRU
645	\N	125	7	19	teamdriver_6xfhnUhO
646	\N	98	7	20	teamdriver_oXjRSnRK
647	\N	50	7	28	teamdriver_yWnQmaze
648	\N	63	7	10	teamdriver_xk70mbbp
649	\N	245	7	10	teamdriver_b0tQaK8H
650	\N	232	7	10	teamdriver_QbPNIvGo
651	\N	128	7	28	teamdriver_CqDx4dII
652	\N	246	7	28	teamdriver_YBmcQgiM
653	\N	67	7	10	teamdriver_8SfPHXEu
654	\N	205	7	10	teamdriver_IUKcx3L4
655	\N	124	7	28	teamdriver_VGCZGaVZ
656	\N	58	7	10	teamdriver_P1BZxmkC
657	\N	247	7	10	teamdriver_mdl51K7X
658	\N	38	7	10	teamdriver_aa0L3uCA
659	\N	203	7	10	teamdriver_BtDHk0BO
660	\N	230	7	10	teamdriver_CnHm0ZKX
661	\N	172	7	10	teamdriver_aYMMSRxV
662	\N	248	7	10	teamdriver_kcnSsiRA
663	\N	229	7	10	teamdriver_H1AWMieG
664	\N	88	7	10	teamdriver_jyJBSDKr
665	\N	226	7	10	teamdriver_JV20kBZ3
666	\N	231	7	10	teamdriver_ebCZZN2l
667	\N	233	7	10	teamdriver_4xi3l3qi
668	\N	49	7	10	teamdriver_EMliZwti
669	\N	176	7	28	teamdriver_h6zPCpz0
670	\N	43	7	10	teamdriver_lORGKalU
671	\N	132	7	6	teamdriver_wRMJeUcc
672	\N	26	7	2	teamdriver_Eo1kN5FF
673	\N	101	7	6	teamdriver_Hd6z1n60
674	\N	249	7	40	teamdriver_FTlTEcyV
675	\N	111	7	2	teamdriver_15pKLy4h
676	\N	131	7	49	teamdriver_wzGAGwzz
677	\N	103	7	2	teamdriver_XopWTeyX
678	\N	234	7	2	teamdriver_qe3o1hMJ
679	\N	250	7	6	teamdriver_udMDbmx9
680	\N	29	7	54	teamdriver_MMhNvn0W
681	\N	251	7	49	teamdriver_m6s2t8mn
682	\N	183	7	40	teamdriver_FMEOBVCY
683	\N	6	7	7	teamdriver_oHVe5kez
684	\N	252	7	40	teamdriver_7T79kArs
685	\N	142	7	2	teamdriver_ufPct7AX
686	\N	253	7	2	teamdriver_Xm7o2oug
687	\N	198	7	2	teamdriver_Hjmis5On
688	\N	254	7	40	teamdriver_MYtQZfzj
689	\N	255	7	55	teamdriver_AFF12iJW
690	\N	236	7	2	teamdriver_jV0rhFC8
691	\N	216	7	34	teamdriver_edsLtucq
692	\N	27	7	49	teamdriver_66yGZI1B
693	\N	220	7	2	teamdriver_AOiAyL05
694	\N	256	7	36	teamdriver_V6u2qlfb
695	\N	31	7	2	teamdriver_gRfoNs09
696	\N	216	7	40	teamdriver_nFFvmTkb
697	\N	18	7	2	teamdriver_4JayeT9C
698	\N	103	7	36	teamdriver_tofpvu9H
699	\N	76	7	49	teamdriver_Nsd75i0s
700	\N	257	7	2	teamdriver_eJkKfTpR
701	\N	258	7	40	teamdriver_ymg00ckL
702	\N	259	7	6	teamdriver_pFLiE9Kx
703	\N	13	8	2	teamdriver_IWXfP6N1
704	\N	114	8	2	teamdriver_uRpLtDXA
705	\N	169	8	2	teamdriver_gLoTSmKS
706	\N	31	8	2	teamdriver_2EE8aZJl
707	\N	250	8	6	teamdriver_LmxnurOk
708	\N	27	8	6	teamdriver_FuRSLVD2
709	\N	259	8	6	teamdriver_wk8jOJQH
710	\N	119	8	6	teamdriver_MO1OMJSL
711	\N	224	8	6	teamdriver_HcgEizjd
712	\N	257	8	2	teamdriver_ZN9ai1XN
713	\N	82	8	2	teamdriver_wJL6Rzmh
714	\N	260	8	6	teamdriver_D0NmC7nQ
715	\N	238	8	2	teamdriver_tCIdfZYb
716	\N	222	8	6	teamdriver_7Kf7m1Ll
717	\N	131	8	6	teamdriver_9HuNL9zz
718	\N	196	8	6	teamdriver_RjI1gelq
719	\N	243	8	49	teamdriver_yC1UKsn0
720	\N	261	8	2	teamdriver_CSuvWcA2
721	\N	262	8	40	teamdriver_NlvBNgKH
722	\N	29	8	6	teamdriver_VziONaJ3
723	\N	236	8	7	teamdriver_CFRaCgTr
724	\N	242	8	2	teamdriver_W99YNjfQ
725	\N	216	8	34	teamdriver_lfTFSbxa
726	\N	263	8	40	teamdriver_qNfDpXeI
727	\N	214	8	2	teamdriver_l1UvLZ1T
728	\N	82	8	49	teamdriver_WbiPR4vD
729	\N	142	8	34	teamdriver_NYx7Upev
730	\N	185	8	2	teamdriver_NxtIKyff
731	\N	103	8	2	teamdriver_pIEZ59Uz
732	\N	258	8	7	teamdriver_BLggupzR
733	\N	65	8	52	teamdriver_64mRWfR0
734	\N	58	8	52	teamdriver_4O0J7OKf
735	\N	124	8	28	teamdriver_QMkuaDV2
736	\N	43	8	10	teamdriver_1ttXE1c0
737	\N	88	8	10	teamdriver_wthpXt2N
738	\N	233	8	10	teamdriver_dzyaK5jq
739	\N	175	8	10	teamdriver_v1NsJKTH
740	\N	205	8	10	teamdriver_Md4Akns7
741	\N	244	8	47	teamdriver_kVt0cEUN
742	\N	50	8	19	teamdriver_cDvt4z4p
743	\N	248	8	10	teamdriver_5S0OciW4
744	\N	176	8	28	teamdriver_plPcJPGJ
745	\N	245	8	10	teamdriver_C5TBrULP
746	\N	227	8	28	teamdriver_hqXlUJVf
747	\N	38	8	10	teamdriver_VDQi0dxz
748	\N	34	8	10	teamdriver_7tzgC3BZ
749	\N	177	8	10	teamdriver_PXDroPVR
750	\N	125	8	10	teamdriver_yXbKlLUQ
751	\N	264	8	10	teamdriver_fXN3cldb
752	\N	247	8	10	teamdriver_H7oQ5Leu
753	\N	226	8	56	teamdriver_ttkXYGJW
754	\N	63	8	10	teamdriver_zjQhsuQM
755	\N	265	8	28	teamdriver_AI3iXVL2
756	\N	266	8	10	teamdriver_LBJMiJWW
757	\N	128	8	10	teamdriver_QAcxXMdt
758	\N	267	8	10	teamdriver_75TQPBOO
759	\N	232	8	10	teamdriver_yVoYr0cB
760	\N	172	8	10	teamdriver_HYdDfUhw
761	\N	203	8	10	teamdriver_U9HtJ3JA
762	\N	97	8	19	teamdriver_TdSBctxo
763	\N	49	8	9	teamdriver_pcIcL0Cy
764	\N	230	8	10	teamdriver_I6SaVOix
765	\N	268	8	10	teamdriver_zBVeUtHH
766	\N	269	8	7	teamdriver_waVQT7Cy
767	\N	262	8	49	teamdriver_vqEKjB5T
768	\N	142	8	49	teamdriver_xLH1kbyD
769	\N	270	8	34	teamdriver_xHaFsCpg
770	\N	142	8	7	teamdriver_DMEJovWK
771	\N	6	8	7	teamdriver_aalILf2r
772	\N	263	8	2	teamdriver_Wyg5Y1Dn
773	\N	183	8	34	teamdriver_SpUKhtVJ
774	\N	258	8	34	teamdriver_NuHtMu52
775	\N	253	8	2	teamdriver_bkDicoI5
776	\N	188	8	57	teamdriver_rdUZ5gLb
777	\N	271	8	7	teamdriver_wye87e0d
778	\N	272	8	57	teamdriver_OBFdxbql
779	\N	273	8	7	teamdriver_Rfv3Hrln
780	\N	198	8	57	teamdriver_vaiE5Eaw
781	\N	111	8	2	teamdriver_PjIHbiZ0
782	\N	274	8	7	teamdriver_tsmXVHom
783	\N	275	8	7	teamdriver_MhwIl4Dc
784	\N	220	8	2	teamdriver_4nFuMHne
785	\N	82	9	7	teamdriver_ahNyEVTe
786	\N	196	9	6	teamdriver_davoWKip
787	\N	131	9	6	teamdriver_cEioffyr
788	\N	13	9	2	teamdriver_ZqiQYa8i
789	\N	114	9	2	teamdriver_q7AHu8Cu
790	\N	31	9	2	teamdriver_k6IvQmZK
791	\N	169	9	2	teamdriver_Ash1VKqy
792	\N	111	9	2	teamdriver_L53ouebI
793	\N	214	9	2	teamdriver_gvLkDjHz
794	\N	119	9	6	teamdriver_adm7tGjj
795	\N	29	9	7	teamdriver_lDB1fONj
796	\N	236	9	7	teamdriver_BfgF4zLW
797	\N	31	9	34	teamdriver_kCMoKWzR
798	\N	276	9	58	teamdriver_Z3LmcwIC
799	\N	259	9	6	teamdriver_lhoguWPS
800	\N	257	9	2	teamdriver_rqgzxJ6G
801	\N	277	9	58	teamdriver_UkhdDs2T
802	\N	142	9	7	teamdriver_ftEIn9l5
803	\N	82	9	49	teamdriver_mzGDwayq
804	\N	114	9	34	teamdriver_s2pVv90A
805	\N	242	9	2	teamdriver_w3IkLlG3
806	\N	243	9	49	teamdriver_aCRTOcVF
807	\N	262	9	49	teamdriver_mKDH7Mg4
808	\N	216	9	7	teamdriver_YvcMsBC7
809	\N	278	9	2	teamdriver_cXJyiZkF
810	\N	239	9	2	teamdriver_HIC9Vjln
811	\N	279	9	40	teamdriver_DxWFQZE5
812	\N	255	9	40	teamdriver_qXd5DOwa
813	\N	280	9	2	teamdriver_VHyetgLd
814	\N	281	9	2	teamdriver_y0e5Wc7Q
815	\N	282	9	35	teamdriver_0p1MLUT2
816	\N	238	9	35	teamdriver_pNa4uZX6
817	\N	216	9	34	teamdriver_WxLKaLdd
818	\N	283	9	40	teamdriver_s9evKMXx
819	\N	284	9	2	teamdriver_PURFfK6b
820	\N	19	9	2	teamdriver_9Ah3sHvv
821	\N	272	9	57	teamdriver_wVXBwDcZ
822	\N	261	9	2	teamdriver_gq6qXLtP
823	\N	124	9	52	teamdriver_fWIK2tgX
824	\N	285	9	52	teamdriver_GJBwd0fN
825	\N	233	9	10	teamdriver_r5cp6Wvb
826	\N	38	9	52	teamdriver_KI2Jo4yO
827	\N	58	9	52	teamdriver_x2LPRf5I
828	\N	125	9	9	teamdriver_sRVAniKw
829	\N	177	9	47	teamdriver_xLmIvFaz
830	\N	286	9	9	teamdriver_8CjUKEiB
831	\N	128	9	10	teamdriver_sJXypYES
832	\N	267	9	10	teamdriver_QiOzXwyP
833	\N	232	9	10	teamdriver_SaoLYSQW
834	\N	34	9	10	teamdriver_ku1LcKaf
835	\N	247	9	28	teamdriver_9eOiA7BW
836	\N	245	9	10	teamdriver_8UoOfoI5
837	\N	287	9	28	teamdriver_1hLAFl3L
838	\N	288	9	28	teamdriver_5jkopeXR
839	\N	266	9	10	teamdriver_w5rMhDun
840	\N	43	9	10	teamdriver_qdsK69f2
841	\N	228	9	10	teamdriver_gGuLbeag
842	\N	97	9	19	teamdriver_urb7NSJv
843	\N	246	9	10	teamdriver_Zi5W0Bf4
844	\N	265	9	28	teamdriver_KcmXBUdd
845	\N	176	9	10	teamdriver_JZBLQqAn
846	\N	227	9	56	teamdriver_XFzfFtq1
847	\N	248	9	19	teamdriver_gF2Tt0la
848	\N	244	9	10	teamdriver_zY7p90Ez
849	\N	66	9	9	teamdriver_PlMSIi5q
850	\N	203	9	9	teamdriver_fud55qvU
851	\N	205	9	10	teamdriver_55BmQHjl
852	\N	289	9	10	teamdriver_6ZyFKhj3
853	\N	290	9	10	teamdriver_UYyGAPDi
854	\N	291	9	10	teamdriver_kLJIEOrz
855	\N	292	9	28	teamdriver_OiClvrhd
856	\N	240	9	6	teamdriver_cZfceHc0
857	\N	29	9	2	teamdriver_ORiQlGlg
858	\N	187	9	2	teamdriver_tHbQEEJM
859	\N	293	9	2	teamdriver_OqFYcHDr
860	\N	49	9	2	teamdriver_0GNzsJKu
861	\N	29	9	34	teamdriver_Q18WJjRB
862	\N	294	9	2	teamdriver_JHvitcke
863	\N	295	9	7	teamdriver_ccje6XbR
864	\N	263	9	40	teamdriver_tsV74iJo
865	\N	296	9	58	teamdriver_fMk4QU2r
866	\N	183	9	40	teamdriver_KAKVVacg
867	\N	297	9	7	teamdriver_rNxgZzt1
868	\N	188	9	57	teamdriver_lcY2sY78
869	\N	273	9	7	teamdriver_B8HiZtzJ
870	\N	293	9	6	teamdriver_zIPIOqhi
871	\N	263	9	58	teamdriver_R8uRi41I
872	\N	187	9	7	teamdriver_oQ1nSBKh
873	\N	298	9	7	teamdriver_5kbjpctv
874	\N	185	9	2	teamdriver_TwQx1umQ
875	\N	275	9	7	teamdriver_0vpwpm2B
876	\N	271	9	7	teamdriver_8WhXilwQ
877	\N	276	9	2	teamdriver_8J2jtVbu
878	\N	282	9	2	teamdriver_ins7MbMw
879	\N	257	9	34	teamdriver_4DDgEIQ6
880	\N	183	9	7	teamdriver_dV0gPW3u
881	\N	299	9	7	teamdriver_7Zvy1kR4
882	\N	300	9	7	teamdriver_ZcQ2uIPE
883	\N	301	9	7	teamdriver_pHe0xbac
884	\N	302	9	7	teamdriver_IXAvsfth
885	\N	236	10	59	teamdriver_4hzqm7lC
886	\N	243	10	6	teamdriver_XUmyRjWM
887	\N	29	10	59	teamdriver_SOHCF4wj
888	\N	293	10	6	teamdriver_uCTLxEJw
889	\N	297	10	59	teamdriver_CTt2zIe9
890	\N	142	10	60	teamdriver_gV2bFUYW
891	\N	82	10	59	teamdriver_u2JlaF0o
892	\N	216	10	34	teamdriver_2QekSrw2
893	\N	31	10	34	teamdriver_6KP9NfmG
894	\N	257	10	34	teamdriver_1AI80EuP
895	\N	114	10	6	teamdriver_Hh4kHRnS
896	\N	277	10	58	teamdriver_gwA4EOya
897	\N	261	10	59	teamdriver_njmwZF0s
898	\N	259	10	57	teamdriver_tXhNzz2P
899	\N	276	10	6	teamdriver_qYD3l2Rb
900	\N	253	10	58	teamdriver_FA7a6BQu
901	\N	263	10	59	teamdriver_OvjNuYTz
902	\N	242	10	2	teamdriver_1ZdHmj9W
903	\N	303	10	59	teamdriver_9V9vpl3f
904	\N	304	10	59	teamdriver_XmLisSWr
905	\N	280	10	57	teamdriver_EDueJJSh
906	\N	305	10	58	teamdriver_YrwSUHNF
907	\N	306	10	59	teamdriver_i0h2KqSd
908	\N	281	10	2	teamdriver_FhDNIFYC
909	\N	97	10	9	teamdriver_kL2EKx3G
910	\N	58	10	9	teamdriver_4FiqW7H3
911	\N	176	10	19	teamdriver_ZJm4lglU
912	\N	38	10	52	teamdriver_7EjCRcG8
913	\N	289	10	52	teamdriver_wnsJ0F3R
914	\N	233	10	52	teamdriver_jHLMamDN
915	\N	46	10	10	teamdriver_vY9nxHqO
916	\N	128	10	10	teamdriver_92eqJT0F
917	\N	43	10	10	teamdriver_hcgSgLll
918	\N	288	10	28	teamdriver_yaW1aZql
919	\N	50	10	28	teamdriver_ssdgRF4V
920	\N	244	10	23	teamdriver_Duk4B13G
921	\N	226	10	56	teamdriver_V2Htu1xA
922	\N	172	10	10	teamdriver_97OtSZDI
923	\N	307	10	10	teamdriver_5tu4bgZv
924	\N	308	10	10	teamdriver_K03tJ5ba
925	\N	265	10	28	teamdriver_7WK5HUpQ
926	\N	232	10	28	teamdriver_hr5SSmjG
927	\N	44	10	9	teamdriver_lU8nQJsX
928	\N	66	10	9	teamdriver_TdEFSXgN
929	\N	267	10	28	teamdriver_ccByvbjL
930	\N	177	10	10	teamdriver_t6OSzxy7
931	\N	231	10	62	teamdriver_x0GLyFL1
932	\N	309	10	47	teamdriver_2cGs0vf4
933	\N	245	10	10	teamdriver_lxQGwkyu
934	\N	310	10	10	teamdriver_xWS4BrYr
935	\N	248	10	61	teamdriver_BvXiXuRf
936	\N	227	10	10	teamdriver_BWmxqwKs
937	\N	286	10	10	teamdriver_ht8vWCDa
938	\N	266	10	63	teamdriver_V15wOtXl
939	\N	311	10	10	teamdriver_4dCRDNII
940	\N	291	10	19	teamdriver_lNMeVqmW
941	\N	124	10	52	teamdriver_LRV9YbKU
942	\N	312	10	58	teamdriver_i27XM9Gw
943	\N	272	10	57	teamdriver_wu1h0GsE
944	\N	294	10	64	teamdriver_Q3QMm2lY
945	\N	142	10	64	teamdriver_3NSYQbLl
946	\N	240	10	6	teamdriver_OFcVXrfQ
947	\N	272	10	2	teamdriver_yrwIjwde
948	\N	313	10	2	teamdriver_iSTWBziQ
949	\N	82	10	34	teamdriver_hEd8N0Uc
950	\N	314	10	6	teamdriver_USYGdNuc
951	\N	295	10	60	teamdriver_6aZzqsDs
952	\N	315	10	60	teamdriver_AbmFJG5e
953	\N	316	10	2	teamdriver_uKjTs8JG
954	\N	296	10	58	teamdriver_GxFgWY0B
955	\N	317	10	67	teamdriver_O5nwv6r9
956	\N	318	10	59	teamdriver_oLBXHhG7
957	\N	319	10	59	teamdriver_B1Zy60QY
958	\N	263	10	67	teamdriver_MIlHvcab
959	\N	183	10	59	teamdriver_hrxLAgrQ
960	\N	185	10	60	teamdriver_d4AIqMjx
961	\N	320	10	58	teamdriver_DlwK7CCq
962	\N	271	10	65	teamdriver_3fqtlc79
963	\N	321	10	59	teamdriver_usTurJMF
964	\N	243	10	49	teamdriver_Y1KdU556
965	\N	322	10	59	teamdriver_WSG8lS9K
966	\N	323	10	59	teamdriver_I2m3QSyj
967	\N	324	10	66	teamdriver_S9e8YpSe
968	\N	325	10	58	teamdriver_LgajGul6
969	\N	326	10	59	teamdriver_3yardtok
970	\N	327	10	59	teamdriver_9wQ80mL0
971	\N	185	10	34	teamdriver_6cNQggjB
972	\N	328	10	60	teamdriver_VAoOkOOH
973	\N	242	10	59	teamdriver_Uonbmrnw
974	\N	282	10	2	teamdriver_WLweru68
975	\N	183	10	60	teamdriver_YRmEBlKy
976	\N	259	10	6	teamdriver_XEnEOz8d
977	\N	329	10	57	teamdriver_rPTsYsPD
978	\N	97	10	10	teamdriver_w1MXesrk
979	\N	260	10	69	teamdriver_aEgkUXrJ
980	\N	313	10	68	teamdriver_LbwZWcEP
981	\N	31	10	59	teamdriver_JNpOzhEV
982	\N	330	10	67	teamdriver_3F8OSymg
983	\N	331	10	40	teamdriver_rSL6ciT6
984	\N	332	10	2	teamdriver_8QbNuYDl
985	\N	297	11	59	teamdriver_jGtdytnl
986	\N	276	11	6	teamdriver_FEeh7uLv
987	\N	82	11	59	teamdriver_Cop2JjDW
988	\N	29	11	59	teamdriver_O1EfFDIz
989	\N	169	11	60	teamdriver_h1wN417S
990	\N	259	11	6	teamdriver_X3d4di09
991	\N	312	11	58	teamdriver_gpIzrCdZ
992	\N	257	11	34	teamdriver_ag7KfmUU
993	\N	293	11	6	teamdriver_DdnRioE5
994	\N	333	11	58	teamdriver_zGDGFKLT
995	\N	27	11	6	teamdriver_kMvkbENH
996	\N	334	11	60	teamdriver_gdjzNfWO
997	\N	261	11	70	teamdriver_edSMRDv9
998	\N	335	11	2	teamdriver_t3i0ewCk
999	\N	336	11	2	teamdriver_aUPSEERc
1000	\N	31	11	59	teamdriver_AtDIRmvL
1001	\N	236	11	59	teamdriver_OtZWBC0k
1002	\N	277	11	34	teamdriver_jSof2r2G
1003	\N	296	11	58	teamdriver_YkmadBm4
1004	\N	337	11	2	teamdriver_BhQjsGGu
1005	\N	338	11	2	teamdriver_38rdkXsf
1006	\N	242	11	2	teamdriver_QwhCzoGC
1007	\N	82	11	58	teamdriver_JOqdpky6
1008	\N	243	11	59	teamdriver_CgUZB1ld
1009	\N	339	11	6	teamdriver_Fytc45VK
1010	\N	314	11	34	teamdriver_JCAWXbHl
1011	\N	142	11	59	teamdriver_Aklq2AqV
1012	\N	317	11	59	teamdriver_R5Em6AsM
1013	\N	340	11	58	teamdriver_OgQ7JawW
1014	\N	29	11	60	teamdriver_AzCwUZs6
1015	\N	253	11	59	teamdriver_xLE5vvhk
1016	\N	271	11	65	teamdriver_28fySZDs
1017	\N	261	11	60	teamdriver_gFbGfvp2
1018	\N	341	11	71	teamdriver_LByJG6bC
1019	\N	242	11	72	teamdriver_MbbZtz0j
1020	\N	342	11	71	teamdriver_g6vVca0V
1021	\N	295	11	60	teamdriver_hZBmSKVZ
1022	\N	58	11	9	teamdriver_CjJ1ACmB
1023	\N	97	11	9	teamdriver_axt6Yak1
1024	\N	289	11	52	teamdriver_oThNv7Wq
1025	\N	309	11	47	teamdriver_gIcl8Mf7
1026	\N	176	11	19	teamdriver_OPZQ1gOR
1027	\N	128	11	27	teamdriver_SMclduXY
1028	\N	343	11	9	teamdriver_aD4ZVQoU
1029	\N	244	11	73	teamdriver_Pjibu838
1030	\N	344	11	27	teamdriver_PH0KD5P4
1031	\N	245	11	10	teamdriver_vqtTuI07
1032	\N	311	11	52	teamdriver_WQrO4W6e
1033	\N	46	11	28	teamdriver_cJ8OA83d
1034	\N	208	11	28	teamdriver_5kfCLs70
1035	\N	50	11	10	teamdriver_VBIKkUQI
1036	\N	95	11	9	teamdriver_Eug9zZFd
1037	\N	310	11	73	teamdriver_dqj7gmfd
1038	\N	228	11	10	teamdriver_Xv3kD37G
1039	\N	345	11	61	teamdriver_IHTqCrlw
1040	\N	124	11	52	teamdriver_rZF6MbAF
1041	\N	49	11	9	teamdriver_nO93KGW5
1042	\N	265	11	17	teamdriver_FaRZigVq
1043	\N	177	11	10	teamdriver_ppO2LAJI
1044	\N	38	11	9	teamdriver_msvhWoDV
1045	\N	346	11	52	teamdriver_sRroisn5
1046	\N	288	11	10	teamdriver_oUqBbOgF
1047	\N	230	11	10	teamdriver_nstQKAst
1048	\N	233	11	52	teamdriver_eNvVaCrr
1049	\N	92	11	10	teamdriver_WmtW3ATB
1050	\N	308	11	52	teamdriver_xttnuFu5
1051	\N	291	11	9	teamdriver_SRB0gMBY
1052	\N	66	11	9	teamdriver_HOJf9va0
1053	\N	226	11	17	teamdriver_68FFBVz0
1054	\N	287	11	10	teamdriver_LFdsxJZr
1055	\N	318	11	59	teamdriver_iOSsdSgL
1056	\N	272	11	59	teamdriver_wiE0q0ZN
1057	\N	347	11	58	teamdriver_f5dFWZOS
1058	\N	142	11	64	teamdriver_fVm4ZIc1
1059	\N	240	11	59	teamdriver_8ukGidJF
1060	\N	304	11	59	teamdriver_e9xzGUUq
1061	\N	348	11	6	teamdriver_M4cPsmqY
1062	\N	321	11	58	teamdriver_awwXgic3
1063	\N	216	11	58	teamdriver_FyjhVq2e
1064	\N	335	11	72	teamdriver_tbbgsNMb
1065	\N	243	11	49	teamdriver_iI27k9nX
1066	\N	339	11	71	teamdriver_LHXtEpQ4
1067	\N	320	11	58	teamdriver_sH49cvSJ
1068	\N	29	11	64	teamdriver_TDEhEhkW
1069	\N	341	11	59	teamdriver_WVdzos3a
1070	\N	183	11	59	teamdriver_VqWRDm0A
1071	\N	322	11	60	teamdriver_OxX2dpnA
1072	\N	342	11	59	teamdriver_KMfGDW8k
1073	\N	328	11	60	teamdriver_GoQPZbBr
1074	\N	282	11	72	teamdriver_oXI75zC0
1075	\N	185	11	57	teamdriver_lAmprk2F
1076	\N	188	11	57	teamdriver_OhpEwXjl
1077	\N	349	11	59	teamdriver_qg0ICVAc
1078	\N	187	11	59	teamdriver_FJmA2ppR
1079	\N	350	11	70	teamdriver_ODdMacZZ
1080	\N	351	11	60	teamdriver_DMh6MJSL
1081	\N	242	11	60	teamdriver_U0zQZDrx
1082	\N	352	11	59	teamdriver_GnPzscuO
1083	\N	353	11	59	teamdriver_4N5MMtXt
1084	\N	214	11	2	teamdriver_86MI5tuZ
1085	\N	293	11	59	teamdriver_Q5fdQTVx
1086	\N	354	11	58	teamdriver_wylFFwvi
1087	\N	259	11	60	teamdriver_7lFW6nmv
1088	\N	305	11	72	teamdriver_QBF8xUD1
1089	\N	355	11	2	teamdriver_3dDHRrla
1090	\N	271	11	60	teamdriver_FH5Zv1NG
1091	\N	216	11	59	teamdriver_PIWJEuwV
1092	\N	82	12	74	teamdriver_mWhoaINg
1093	\N	339	12	6	teamdriver_lqNRnZG5
1094	\N	293	12	6	teamdriver_kKgPG0LJ
1095	\N	259	12	6	teamdriver_mefJ0pT4
1096	\N	314	12	57	teamdriver_pwQ3S0RG
1097	\N	297	12	59	teamdriver_ltIn17Gt
1098	\N	29	12	60	teamdriver_awpRW5pU
1099	\N	276	12	74	teamdriver_5AOtxS3n
1100	\N	185	12	57	teamdriver_pNMHd3i6
1101	\N	347	12	74	teamdriver_O1tf8rBe
1102	\N	340	12	59	teamdriver_gLK1HmMt
1103	\N	257	12	57	teamdriver_G7F4t46g
1104	\N	243	12	34	teamdriver_eWH3IGHK
1105	\N	356	12	74	teamdriver_2HOKFaNi
1106	\N	236	12	59	teamdriver_aLje2PPb
1107	\N	277	12	34	teamdriver_YT5D4xgd
1108	\N	312	12	74	teamdriver_vPempVST
1109	\N	318	12	74	teamdriver_GR5Gt7h8
1110	\N	261	12	59	teamdriver_dWZZSHvM
1111	\N	304	12	55	teamdriver_4tfuCugE
1112	\N	240	12	55	teamdriver_MFNZD9bq
1113	\N	326	12	74	teamdriver_VvAggvC7
1114	\N	272	12	57	teamdriver_tFrvLxkD
1115	\N	295	12	74	teamdriver_wFREdBwk
1116	\N	240	12	6	teamdriver_7mTzpmeB
1117	\N	357	12	59	teamdriver_Z9FJGuyI
1118	\N	358	12	60	teamdriver_5Of9H88d
1119	\N	304	12	74	teamdriver_3CsyjbQk
1120	\N	348	12	74	teamdriver_fhT8cRoa
1121	\N	273	12	74	teamdriver_ILDc83Dj
1122	\N	187	12	74	teamdriver_H3gySLGP
1123	\N	359	12	6	teamdriver_C5M449gQ
1124	\N	142	12	59	teamdriver_GIL9SGon
1125	\N	242	12	75	teamdriver_dHY5xPd7
1126	\N	360	12	59	teamdriver_n8lTAOxE
1127	\N	361	12	74	teamdriver_nfilwaT0
1128	\N	271	12	65	teamdriver_J6GOdW4g
1129	\N	362	12	74	teamdriver_XhToo7kp
1130	\N	322	12	77	teamdriver_Cs1vR2Qg
1131	\N	82	12	76	teamdriver_3AfaqssR
1132	\N	183	12	76	teamdriver_c9nFxy49
1133	\N	327	12	74	teamdriver_GZ8fUUNt
1134	\N	363	12	74	teamdriver_k1O7T2oH
1135	\N	364	12	60	teamdriver_wSf6s2yf
1136	\N	295	12	59	teamdriver_eXq8rP7J
1137	\N	348	12	6	teamdriver_j0aZbaEB
1138	\N	188	12	57	teamdriver_wQYekk52
1139	\N	365	12	78	teamdriver_CW14bWqz
1140	\N	366	12	59	teamdriver_8XKd97Fj
1141	\N	367	12	59	teamdriver_GN6EF1Gd
1142	\N	368	12	59	teamdriver_IJtjkbjA
1143	\N	366	12	60	teamdriver_6JrdR0ZS
1144	\N	369	12	79	teamdriver_ScNziy1f
1145	\N	370	12	6	teamdriver_7sGAP4w1
1146	\N	371	12	80	teamdriver_ZhD7OjTF
1147	\N	261	12	74	teamdriver_Kveylfvs
1148	\N	183	12	59	teamdriver_GoCTKrGG
1149	\N	372	12	80	teamdriver_fCO0sJwR
1150	\N	373	12	75	teamdriver_2ghx4wdW
1151	\N	101	12	55	teamdriver_kHuW0tA9
1152	\N	351	12	59	teamdriver_kyDTCuks
1153	\N	374	12	74	teamdriver_3wCAAy1s
1154	\N	375	12	59	teamdriver_JC7GIY2H
1155	\N	376	12	59	teamdriver_2J7LYB94
1156	\N	377	12	74	teamdriver_H7XfGI58
1157	\N	378	12	59	teamdriver_cBbKhwLt
1158	\N	240	12	74	teamdriver_Ave0bEP7
1159	\N	354	12	74	teamdriver_Ypg5Zyza
1160	\N	343	12	74	teamdriver_CTk9SfZn
1161	\N	379	12	59	teamdriver_0DNsGBTZ
1162	\N	380	12	74	teamdriver_CbAgML3c
1163	\N	277	13	34	teamdriver_3AxFeors
1164	\N	326	13	74	teamdriver_N3DSrwPa
1165	\N	293	13	6	teamdriver_PVHBnfRM
1166	\N	359	13	6	teamdriver_ElYVdrkM
1167	\N	362	13	59	teamdriver_rieHXgxq
1168	\N	272	13	57	teamdriver_m08CIUEb
1169	\N	257	13	57	teamdriver_SBdtiH48
1170	\N	357	13	59	teamdriver_3v6XGQOP
1171	\N	347	13	74	teamdriver_XFPgywUS
1172	\N	370	13	6	teamdriver_U2me49iW
1173	\N	339	13	34	teamdriver_ORMDyUYu
1174	\N	312	13	74	teamdriver_GhaVEp86
1175	\N	261	13	74	teamdriver_C7lmvHaV
1176	\N	187	13	55	teamdriver_baZjxYLv
1177	\N	314	13	57	teamdriver_AIcuYv8f
1178	\N	297	13	59	teamdriver_nlFWoUGM
1179	\N	142	13	81	teamdriver_RceEPRIw
1180	\N	340	13	81	teamdriver_K9l6LvsQ
1181	\N	236	13	74	teamdriver_BGqLmeME
1182	\N	381	13	57	teamdriver_DzHRPEPb
1183	\N	382	13	57	teamdriver_sxEZt5XS
1184	\N	29	13	74	teamdriver_PwYrcGg1
1185	\N	358	13	6	teamdriver_4grTb740
1186	\N	348	13	6	teamdriver_IBKofeRj
1187	\N	383	13	74	teamdriver_cooh7wiB
1188	\N	357	13	34	teamdriver_O6rq8LO3
1189	\N	261	13	82	teamdriver_eObuiDRi
1190	\N	371	13	74	teamdriver_qG7fPu31
1191	\N	372	13	80	teamdriver_ttOYCpNX
1192	\N	273	13	34	teamdriver_N7h6DOBR
1193	\N	304	13	74	teamdriver_zeesuk1B
1194	\N	368	13	74	teamdriver_7WWfCEbT
1195	\N	314	13	82	teamdriver_rd5FD7lB
1196	\N	363	13	34	teamdriver_FOQvfYYJ
1197	\N	384	13	57	teamdriver_DbTgRpMI
1198	\N	357	13	7	teamdriver_xxdYgxYM
1199	\N	383	13	82	teamdriver_BzpoIWLP
1200	\N	385	13	58	teamdriver_g3i51ElF
1201	\N	315	13	57	teamdriver_Arzs4Ny2
1202	\N	386	13	74	teamdriver_4SFFItYh
1203	\N	295	13	59	teamdriver_2rWQmdSZ
1204	\N	387	13	55	teamdriver_QjYRm0R7
1205	\N	388	13	74	teamdriver_kUE69ADp
1206	\N	187	13	82	teamdriver_X5zxzmRz
1207	\N	389	13	74	teamdriver_Z7Et3yjE
1208	\N	322	13	74	teamdriver_tCgDQG51
1209	\N	368	13	55	teamdriver_tkbS9aPQ
1210	\N	322	13	77	teamdriver_D6VeONmf
1211	\N	390	13	57	teamdriver_DhvmwOkp
1212	\N	371	13	57	teamdriver_WHXTNmsw
1213	\N	304	13	84	teamdriver_IjWdWgJn
1214	\N	236	13	83	teamdriver_by1amTFd
1215	\N	384	13	82	teamdriver_8sIZHsks
1216	\N	360	13	59	teamdriver_3F9410Un
1217	\N	391	13	82	teamdriver_OwaQByhQ
1218	\N	389	13	82	teamdriver_HKiHehK5
1219	\N	363	13	74	teamdriver_cGSOmL7r
1220	\N	374	13	74	teamdriver_adi4XI9T
1221	\N	373	13	75	teamdriver_FGZpXDwm
1222	\N	336	13	85	teamdriver_ZAdTm6iw
1223	\N	392	13	86	teamdriver_Cz5PKXPO
1224	\N	376	13	74	teamdriver_BU8xHi9h
1225	\N	393	13	74	teamdriver_ZNTYtctg
1226	\N	378	13	59	teamdriver_sUED6GdE
1227	\N	394	13	59	teamdriver_k9LYML3u
1228	\N	354	13	74	teamdriver_Jy1vscW5
1229	\N	395	13	74	teamdriver_tHmIJ8ko
1230	\N	396	13	59	teamdriver_9uU7MQ5s
1231	\N	397	13	34	teamdriver_ABxTSobQ
1232	\N	398	13	74	teamdriver_x0ZRXsCU
1233	\N	399	13	87	teamdriver_BzUAAlVi
1234	\N	400	13	88	teamdriver_qzey4Ov2
1235	\N	401	13	74	teamdriver_N1uNnulY
1236	\N	402	13	74	teamdriver_JkZBB9pT
1237	\N	403	13	74	teamdriver_G0Hf1Szt
1238	\N	277	14	34	teamdriver_WUCxcPKO
1239	\N	339	14	34	teamdriver_twIiBRrQ
1240	\N	297	14	59	teamdriver_9U5dLCVn
1241	\N	340	14	6	teamdriver_o8poYSXT
1242	\N	362	14	59	teamdriver_JkPxEaHB
1243	\N	326	14	74	teamdriver_XFfEh1Jy
1244	\N	257	14	59	teamdriver_rVtXdn8H
1245	\N	347	14	74	teamdriver_dJ8DfoL6
1246	\N	236	14	74	teamdriver_ggGlSWkl
1247	\N	312	14	82	teamdriver_iyWKgq4s
1248	\N	348	14	6	teamdriver_zZZGKgrs
1249	\N	29	14	81	teamdriver_SBXPoanE
1250	\N	314	14	83	teamdriver_71Boi7Ks
1251	\N	354	14	82	teamdriver_yjGNxgLm
1252	\N	383	14	82	teamdriver_xwrQU117
1253	\N	404	14	81	teamdriver_HWYG1TJv
1254	\N	360	14	74	teamdriver_baaZogfL
1255	\N	293	14	89	teamdriver_vqFsrVUf
1256	\N	359	14	89	teamdriver_Ld7SNRZk
1257	\N	368	14	82	teamdriver_KxskZhHA
1258	\N	295	14	90	teamdriver_a5EmauSF
1259	\N	387	14	90	teamdriver_SBA57UNw
1260	\N	336	14	85	teamdriver_z69IiYmL
1261	\N	358	14	34	teamdriver_s5AqSX9F
1262	\N	272	14	57	teamdriver_W2HUTbzH
1263	\N	304	14	81	teamdriver_xOZhGma9
1264	\N	236	14	83	teamdriver_K7ufg9FL
1265	\N	312	14	91	teamdriver_uTq4D3m4
1266	\N	385	14	74	teamdriver_iEPkUuTM
1267	\N	405	14	6	teamdriver_2dVgzkpN
1268	\N	406	14	57	teamdriver_FXLJTEBt
1269	\N	29	14	74	teamdriver_cGmeMBQx
1270	\N	293	14	82	teamdriver_nrxviunG
1271	\N	261	14	82	teamdriver_10x80txK
1272	\N	407	14	74	teamdriver_CsGt8cYn
1273	\N	408	14	81	teamdriver_jCduOmFO
1274	\N	368	14	81	teamdriver_T5ogSMsk
1275	\N	409	14	77	teamdriver_11U0EoCx
1276	\N	328	14	59	teamdriver_FD0uriN7
1277	\N	101	14	74	teamdriver_txv0rCw0
1278	\N	327	14	74	teamdriver_7QVSZg8B
1279	\N	392	14	86	teamdriver_XebRP9GV
1280	\N	29	14	34	teamdriver_MJnvsOby
1281	\N	407	14	81	teamdriver_E9MT3Y6d
1282	\N	410	14	74	teamdriver_MunCw7q1
1283	\N	358	14	6	teamdriver_B2WrIzpw
1284	\N	411	14	60	teamdriver_pkVSRKeL
1285	\N	373	14	92	teamdriver_oLQuz0JX
1286	\N	391	14	82	teamdriver_n11WGhLE
1287	\N	386	14	57	teamdriver_e1mJS0ok
1288	\N	369	14	79	teamdriver_LrKTpr68
1289	\N	412	14	93	teamdriver_KzRqPiN4
1290	\N	97	14	82	teamdriver_LKO0ELdv
1291	\N	413	14	74	teamdriver_HQRpeLBj
1292	\N	261	14	81	teamdriver_SkJ805If
1293	\N	378	14	82	teamdriver_kwpXD1Dj
1294	\N	379	14	74	teamdriver_eBHIiG0U
1295	\N	414	14	93	teamdriver_gwQpPZfw
1296	\N	415	14	34	teamdriver_hO4n9NIP
1297	\N	404	14	82	teamdriver_mCkTJfos
1298	\N	416	14	59	teamdriver_BZL2NUqI
1299	\N	379	14	58	teamdriver_V2TuBT5p
1300	\N	417	14	74	teamdriver_WYnXdRtg
1301	\N	396	14	59	teamdriver_EGxwm5H4
1302	\N	399	14	87	teamdriver_ev3XJPhp
1303	\N	418	14	60	teamdriver_8gBNNMQT
1304	\N	419	14	94	teamdriver_YJ5MyvQv
1305	\N	420	14	1	teamdriver_4KdpBekg
1306	\N	421	14	83	teamdriver_aqv4nd9P
1307	\N	398	14	74	teamdriver_n038J21d
1308	\N	403	14	87	teamdriver_Lxbaa2Dg
1309	\N	422	14	82	teamdriver_Rw2eovAR
1310	\N	395	14	74	teamdriver_qXmHPsbA
1311	\N	277	15	34	teamdriver_HsCboELc
1312	\N	339	15	34	teamdriver_R43xpXuy
1313	\N	385	15	74	teamdriver_68Uho9Fz
1314	\N	347	15	74	teamdriver_GHJorNET
1315	\N	257	15	59	teamdriver_crQHLpHo
1316	\N	407	15	82	teamdriver_TaWY7syE
1317	\N	408	15	95	teamdriver_f5W8jbWk
1318	\N	383	15	82	teamdriver_89ZYauQv
1319	\N	293	15	59	teamdriver_FmKfwnAp
1320	\N	358	15	6	teamdriver_hwAoNRo3
1321	\N	314	15	95	teamdriver_Lk3dETsN
1322	\N	29	15	34	teamdriver_WANtqz72
1323	\N	236	15	95	teamdriver_R9pgvDD0
1324	\N	297	15	59	teamdriver_RxexvE8m
1325	\N	340	15	6	teamdriver_QBZXmZbH
1326	\N	326	15	91	teamdriver_H7KWXfwK
1327	\N	404	15	82	teamdriver_7S47IbCz
1328	\N	423	15	82	teamdriver_0xQH5Vy7
1329	\N	360	15	82	teamdriver_ApdgQe6e
1330	\N	312	15	82	teamdriver_ZNy3idp3
1331	\N	101	15	90	teamdriver_gtXNRQ8z
1332	\N	359	15	34	teamdriver_nf5epO2X
1333	\N	362	15	34	teamdriver_Tpe5in6i
1334	\N	257	15	96	teamdriver_2j2ZpZ1v
1335	\N	383	15	96	teamdriver_68yYFM5P
1336	\N	272	15	57	teamdriver_jggATmsQ
1337	\N	312	15	91	teamdriver_PpC7o9Ax
1338	\N	423	15	74	teamdriver_HktDE8Xb
1339	\N	383	15	95	teamdriver_hNuI4aC9
1340	\N	257	15	95	teamdriver_ZWPOvMYT
1341	\N	410	15	74	teamdriver_FsXWBj8X
1342	\N	424	15	59	teamdriver_S1B9Aewq
1343	\N	409	15	96	teamdriver_pTtPIqwK
1344	\N	326	15	82	teamdriver_6B7TRbaM
1345	\N	425	15	97	teamdriver_cuNL0jYj
1346	\N	426	15	34	teamdriver_ccgwZZG3
1347	\N	406	15	74	teamdriver_XiAn5CQq
1348	\N	427	15	98	teamdriver_unKPjj9h
1349	\N	188	15	59	teamdriver_qjDmJYhd
1350	\N	428	15	96	teamdriver_B97LSxWw
1351	\N	404	15	74	teamdriver_io9i9ap4
1352	\N	405	15	6	teamdriver_P9LtRieb
1353	\N	328	15	99	teamdriver_AvcsITjC
1354	\N	429	15	96	teamdriver_030UkGwx
1355	\N	396	15	59	teamdriver_GZN3n790
1356	\N	379	15	74	teamdriver_162lMdje
1357	\N	378	15	96	teamdriver_6RQ5IWyB
1358	\N	413	15	6	teamdriver_8QvTt0WO
1359	\N	415	15	74	teamdriver_n4sSoOWt
1360	\N	347	16	74	teamdriver_XI2gvKj0
1361	\N	340	16	6	teamdriver_TCRiRmCB
1362	\N	277	16	34	teamdriver_wDp4YKNY
1363	\N	410	16	74	teamdriver_zv0L79Fc
1364	\N	297	16	59	teamdriver_MSalV4LW
1365	\N	430	16	34	teamdriver_DsFlxSMm
1366	\N	383	16	96	teamdriver_N7NNJQ0o
1367	\N	236	16	95	teamdriver_eoaUsLPK
1368	\N	431	16	97	teamdriver_gwD5Rrl6
1369	\N	420	16	1	teamdriver_DvQIktWg
1370	\N	362	16	82	teamdriver_Ugpwx7Mo
1371	\N	425	16	96	teamdriver_HGo8QjlU
1372	\N	403	16	102	teamdriver_2pll10Jd
1373	\N	421	16	97	teamdriver_CEXcYbSv
1374	\N	358	16	6	teamdriver_j2xKqm7n
1375	\N	408	16	95	teamdriver_T18XH703
1376	\N	257	16	95	teamdriver_yIdEMTYF
1377	\N	428	16	59	teamdriver_O94YdE7m
1378	\N	396	16	59	teamdriver_D8LLeIaW
1379	\N	314	16	95	teamdriver_k6DkrtQj
1380	\N	418	16	103	teamdriver_oQIrt5Vr
1381	\N	395	16	74	teamdriver_UXoVOUAA
1382	\N	399	16	101	teamdriver_1PB2h46C
1383	\N	419	16	94	teamdriver_1jlEFnN5
1384	\N	398	16	74	teamdriver_V4OKBbao
1385	\N	432	16	74	teamdriver_2NpB90c5
1386	\N	433	16	102	teamdriver_CZfLfpk3
1387	\N	434	16	94	teamdriver_eMpUyo72
1388	\N	435	16	100	teamdriver_tVJ2i8VU
1389	\N	436	16	60	teamdriver_R8ccCjAK
1390	\N	437	16	59	teamdriver_kBFi7vMF
1391	\N	438	16	95	teamdriver_6MKlGJYl
1392	\N	431	16	74	teamdriver_0RnqVic1
1393	\N	426	16	82	teamdriver_FFrUorV3
1394	\N	427	16	98	teamdriver_PV7uWxhR
1395	\N	407	16	82	teamdriver_Dkl31Rpg
1396	\N	339	16	98	teamdriver_TnNf1pJM
1397	\N	304	16	34	teamdriver_5A98Sdtm
1398	\N	312	16	82	teamdriver_j5aGfw1Y
1399	\N	261	16	34	teamdriver_Zs1NB0G8
1400	\N	404	16	82	teamdriver_gE533K0L
1401	\N	409	16	96	teamdriver_pNXJ5klh
1402	\N	439	16	59	teamdriver_mwxn1FsC
1403	\N	440	16	103	teamdriver_ER1i75iM
1404	\N	441	16	74	teamdriver_PRWuwLED
1405	\N	406	16	74	teamdriver_qOE87ilT
1406	\N	372	16	34	teamdriver_SZ63rRn7
1407	\N	409	16	95	teamdriver_Lu1kpR2n
1408	\N	371	16	6	teamdriver_LAFE0uQE
1409	\N	429	16	74	teamdriver_Gw9f6n7y
1410	\N	359	16	95	teamdriver_Ou6VZjaK
1411	\N	442	16	34	teamdriver_OKEaU8lg
1412	\N	413	16	6	teamdriver_MmQb6ybC
1413	\N	443	16	6	teamdriver_svL8HHg7
1414	\N	415	16	74	teamdriver_iGmXL6qk
1415	\N	443	16	82	teamdriver_4lqKkf0D
1416	\N	405	16	6	teamdriver_okGKX68d
1417	\N	430	17	34	teamdriver_19Oneulz
1418	\N	358	17	6	teamdriver_TEOUROrn
1419	\N	277	17	34	teamdriver_gEvVGvAF
1420	\N	443	17	34	teamdriver_Aq6A2ySj
1421	\N	339	17	60	teamdriver_Rae4hYO8
1422	\N	444	17	60	teamdriver_da6VwVME
1423	\N	257	17	60	teamdriver_OwQkOgfx
1424	\N	347	17	74	teamdriver_aczLO07S
1425	\N	428	17	60	teamdriver_g61ss6I7
1426	\N	383	17	96	teamdriver_AUNGbpZD
1427	\N	410	17	82	teamdriver_3yHN862I
1428	\N	236	17	105	teamdriver_xsBhLmHa
1429	\N	340	17	6	teamdriver_dqA8R5BI
1430	\N	438	17	95	teamdriver_E7v6ErDy
1431	\N	297	17	104	teamdriver_SVnbH20y
1432	\N	408	17	95	teamdriver_GpfONHgO
1433	\N	314	17	107	teamdriver_PoxBvaWR
1434	\N	383	17	60	teamdriver_ZOveYhYo
1435	\N	297	17	106	teamdriver_LWcvgoG4
1436	\N	385	17	82	teamdriver_WbzNTWmH
1437	\N	352	17	34	teamdriver_bzsARTKA
1438	\N	324	17	6	teamdriver_MmfKHPfl
1439	\N	438	17	105	teamdriver_1G8evKPq
1440	\N	424	17	96	teamdriver_OFcwIcV7
1441	\N	404	17	60	teamdriver_Wim70j5s
1442	\N	413	17	74	teamdriver_ON4jmxmh
1443	\N	257	17	95	teamdriver_cwg2OLC7
1444	\N	340	17	60	teamdriver_Lb59GPIN
1445	\N	445	17	95	teamdriver_TDrRxhrv
1446	\N	446	17	109	teamdriver_n2PuJD1F
1447	\N	326	17	108	teamdriver_WcUGZN7S
1448	\N	405	17	6	teamdriver_m8ow2v4s
1449	\N	429	17	74	teamdriver_huYPB3pZ
1450	\N	359	17	6	teamdriver_XPWyPmt1
1451	\N	347	17	82	teamdriver_NozBCiX8
1452	\N	339	17	98	teamdriver_YUBlFMhd
1453	\N	314	17	110	teamdriver_4qDj30OX
1454	\N	293	17	107	teamdriver_U337BZ1O
1455	\N	404	17	96	teamdriver_9aOTjyzU
1456	\N	385	17	74	teamdriver_OmYxG8Ei
1457	\N	312	17	34	teamdriver_ux6lSjWS
1458	\N	427	17	98	teamdriver_j76Jpnqy
1459	\N	413	17	82	teamdriver_QKE50b1c
1460	\N	443	17	107	teamdriver_rrUA8Rcl
1461	\N	443	17	110	teamdriver_2Gz4yl4C
1462	\N	415	17	60	teamdriver_GCAachIA
1463	\N	413	18	60	teamdriver_TsHLqXoY
1464	\N	396	18	59	teamdriver_093RYTpc
1465	\N	340	18	98	teamdriver_zZAM6OQu
1466	\N	438	18	105	teamdriver_km6cEmc0
1467	\N	408	18	95	teamdriver_n6g7qEnJ
1468	\N	236	18	105	teamdriver_HdNuZq11
1469	\N	434	18	95	teamdriver_XuKyhq0Y
1470	\N	447	18	95	teamdriver_PxBjgj5G
1471	\N	403	18	101	teamdriver_eCytHsr7
1472	\N	448	18	82	teamdriver_RfmbK6Qg
1473	\N	314	18	107	teamdriver_4q08l3sC
1474	\N	383	18	60	teamdriver_h3p5fbmN
1475	\N	428	18	60	teamdriver_ToAaLV7l
1476	\N	410	18	34	teamdriver_k0b3I3Hs
1477	\N	257	18	60	teamdriver_7hF5ILmx
1478	\N	347	18	82	teamdriver_46ClojzT
1479	\N	277	18	82	teamdriver_BXFdIXCH
1480	\N	430	18	34	teamdriver_dholFDeF
1481	\N	404	18	6	teamdriver_DjSpYVkY
1482	\N	297	18	112	teamdriver_jnlh8xbm
1483	\N	358	18	6	teamdriver_QCuoBjzD
1484	\N	448	18	34	teamdriver_u3CyKuxs
1485	\N	347	18	74	teamdriver_1JbuhNF6
1486	\N	314	18	110	teamdriver_IR3HQQds
1487	\N	449	18	111	teamdriver_iVQ00ehg
1488	\N	450	18	111	teamdriver_TJ5Qtn66
1489	\N	339	18	107	teamdriver_vqywCsLK
1490	\N	347	18	94	teamdriver_jflj2rzc
1491	\N	324	18	6	teamdriver_oRMaact3
1492	\N	405	18	6	teamdriver_mRP0dWbN
1493	\N	445	18	82	teamdriver_xToM1lYs
1494	\N	277	18	94	teamdriver_7ECqt6b6
1495	\N	444	18	60	teamdriver_qEM4hhvH
1496	\N	445	18	34	teamdriver_fViwXUbW
1497	\N	297	18	110	teamdriver_PB26XatL
1498	\N	451	18	34	teamdriver_FOSecYcD
1499	\N	452	18	60	teamdriver_G01lQIOB
1500	\N	444	18	105	teamdriver_PG92bhIN
1501	\N	453	18	113	teamdriver_L7MzJI2G
1502	\N	454	18	94	teamdriver_QbzR0jvX
1503	\N	452	18	97	teamdriver_MVBw2Rsp
1504	\N	451	18	81	teamdriver_zCIbipSc
1505	\N	455	18	111	teamdriver_fdEaMhOT
1506	\N	456	18	114	teamdriver_VG3yuzCm
1507	\N	457	18	81	teamdriver_frzilSk0
1508	\N	458	18	114	teamdriver_ebv9z5kS
1509	\N	459	18	111	teamdriver_jCJ87yQM
1510	\N	426	18	60	teamdriver_BZjQSyYH
1511	\N	460	18	82	teamdriver_qy1upksH
1512	\N	461	18	94	teamdriver_FUUTxgd1
1513	\N	462	18	107	teamdriver_K1IQGBve
1514	\N	463	18	59	teamdriver_5Ka7BXbw
1515	\N	455	18	60	teamdriver_3ptbBQwv
1516	\N	359	18	94	teamdriver_4KAXIcM6
1517	\N	405	18	110	teamdriver_5IKYDQuy
1518	\N	450	18	104	teamdriver_55oWOTTG
1519	\N	415	18	94	teamdriver_Gu4zlmRm
1520	\N	464	18	6	teamdriver_I7yuAGSq
1521	\N	415	18	82	teamdriver_nFQ3Bn5H
1522	\N	347	19	94	teamdriver_6aQIqmGH
1523	\N	277	19	94	teamdriver_5Dgp3aBa
1524	\N	428	19	105	teamdriver_nwJSqB7P
1525	\N	404	19	6	teamdriver_VVMeTFIS
1526	\N	438	19	112	teamdriver_UYhDZMQ2
1527	\N	450	19	116	teamdriver_P8l2AZYs
1528	\N	383	19	60	teamdriver_gEuVnP5e
1529	\N	340	19	98	teamdriver_dNUBS2uD
1530	\N	396	19	105	teamdriver_t1phBjqt
1531	\N	433	19	95	teamdriver_VoQf1JLh
1532	\N	314	19	110	teamdriver_HUqVsX7O
1533	\N	455	19	6	teamdriver_v2Zp8gyW
1534	\N	257	19	60	teamdriver_yVY6QmM6
1535	\N	430	19	116	teamdriver_uEGriWv5
1536	\N	403	19	87	teamdriver_OlmdClW0
1537	\N	465	19	59	teamdriver_ncai40HL
1538	\N	413	19	34	teamdriver_uHjj778h
1539	\N	236	19	105	teamdriver_ijEOjiY3
1540	\N	466	19	6	teamdriver_0qj95N84
1541	\N	410	19	34	teamdriver_hoszXxtM
1542	\N	467	19	60	teamdriver_peP1Qc4T
1543	\N	434	19	105	teamdriver_haaa0S09
1544	\N	405	19	115	teamdriver_bkN7LGqe
1545	\N	438	19	104	teamdriver_tQaqcKQ4
1546	\N	467	19	115	teamdriver_e4mz5rpx
1547	\N	297	19	104	teamdriver_mrSRzdMG
1548	\N	383	19	94	teamdriver_xgJaAYCP
1549	\N	448	19	34	teamdriver_SocrUtXG
1550	\N	426	19	34	teamdriver_idUCqk8w
1551	\N	304	19	115	teamdriver_A2lhiX6V
1552	\N	450	19	111	teamdriver_OBYb28Zx
1553	\N	449	19	116	teamdriver_FZVUhrTt
1554	\N	454	19	94	teamdriver_Kgq5V0Tj
1555	\N	257	19	112	teamdriver_qFf5ZuTU
1556	\N	453	19	105	teamdriver_8jfgy9Kk
1557	\N	314	19	105	teamdriver_krXfG8Jb
1558	\N	468	19	115	teamdriver_dCgseo0X
1559	\N	449	19	115	teamdriver_LeURBWET
1560	\N	459	19	98	teamdriver_ewuD4BLz
1561	\N	469	19	115	teamdriver_X8wD7Cxt
1562	\N	457	19	81	teamdriver_feb0jc9j
1563	\N	458	19	105	teamdriver_0cMLxQBE
1564	\N	297	19	117	teamdriver_UK7j7C5f
1565	\N	451	19	98	teamdriver_D49YrsNw
1566	\N	470	19	6	teamdriver_gpgj5IF3
1567	\N	425	19	34	teamdriver_h2gHxghX
1568	\N	471	19	111	teamdriver_TbJ29KZR
1569	\N	314	19	104	teamdriver_PHVj9PjL
1570	\N	472	19	94	teamdriver_xZZoVDpt
1571	\N	438	19	117	teamdriver_jBdURiTv
1572	\N	473	19	34	teamdriver_vl8u3qAY
1573	\N	474	19	94	teamdriver_p5wrAY4p
1574	\N	257	19	98	teamdriver_PxYUf5Zr
1575	\N	415	19	94	teamdriver_M1ohGejF
1576	\N	430	20	116	teamdriver_sAUxMLwl
1577	\N	277	20	94	teamdriver_P0Nk20bz
1578	\N	438	20	104	teamdriver_JDa7wU4J
1579	\N	383	20	94	teamdriver_z1o1XY3j
1580	\N	297	20	104	teamdriver_sIH6hy8A
1581	\N	450	20	116	teamdriver_ScvxpjFW
1582	\N	454	20	34	teamdriver_NjBY1anq
1583	\N	403	20	105	teamdriver_UQ4EgjYC
1584	\N	420	20	105	teamdriver_Az7GFWDF
1585	\N	428	20	94	teamdriver_xbGlrllV
1586	\N	340	20	34	teamdriver_J3MWAJus
1587	\N	413	20	34	teamdriver_i2vFnUZA
1588	\N	404	20	6	teamdriver_rartmipU
1589	\N	236	20	97	teamdriver_V0b2j8z5
1590	\N	474	20	94	teamdriver_yQN915Kr
1591	\N	396	20	94	teamdriver_HKuBCzGM
1592	\N	455	20	97	teamdriver_wjhCsc9J
1593	\N	465	20	104	teamdriver_35MtR97N
1594	\N	448	20	97	teamdriver_XmePllzA
1595	\N	426	20	94	teamdriver_sdEWCwB3
1596	\N	468	20	60	teamdriver_F6ZpuBZL
1597	\N	453	20	97	teamdriver_ZuY11gL7
1598	\N	450	20	104	teamdriver_afXcRc0T
1599	\N	468	20	104	teamdriver_gAbaJljU
1600	\N	475	20	94	teamdriver_XBPWA8y0
1601	\N	413	20	6	teamdriver_snn3CjFx
1602	\N	257	20	94	teamdriver_wpseBlP0
1603	\N	470	20	104	teamdriver_5JskIRVQ
1604	\N	454	20	118	teamdriver_1vTmGxiS
1605	\N	449	20	116	teamdriver_sQO1XYqE
1606	\N	305	20	94	teamdriver_tiyBORxi
1607	\N	472	20	34	teamdriver_ZCHZU56q
1608	\N	462	20	107	teamdriver_ZMa69byI
1609	\N	476	20	95	teamdriver_MykQoK83
1610	\N	477	20	34	teamdriver_milwTDnK
1611	\N	236	21	83	teamdriver_ALkB4ZQM
1612	\N	438	21	104	teamdriver_SvZw7N8P
1613	\N	430	21	119	teamdriver_xoRkixW3
1614	\N	450	21	111	teamdriver_e6u9N5sn
1615	\N	475	21	58	teamdriver_Pp8i9tNc
1616	\N	277	21	58	teamdriver_kgVQ4KmZ
1617	\N	471	21	111	teamdriver_XRWOtEpE
1618	\N	396	21	58	teamdriver_NGzK4p9F
1619	\N	413	21	34	teamdriver_CsIX1Nor
1620	\N	383	21	119	teamdriver_OCL3zlBM
1621	\N	420	21	83	teamdriver_t2PMgNHi
1622	\N	434	21	58	teamdriver_sJy5KndO
1623	\N	428	21	58	teamdriver_WXURXxQm
1624	\N	455	21	6	teamdriver_T4DvfK5B
1625	\N	340	21	104	teamdriver_L69Ii6UF
1626	\N	477	21	34	teamdriver_qtNpwGuY
1627	\N	449	21	119	teamdriver_MPUDHgzU
1628	\N	297	21	104	teamdriver_kKZ6Uq11
1629	\N	448	21	85	teamdriver_hDYFSU6d
1630	\N	474	21	119	teamdriver_WFH7uUkS
1631	\N	478	21	83	teamdriver_hoffqFC6
1632	\N	454	21	34	teamdriver_27uF3QQz
1633	\N	404	21	119	teamdriver_epEkOE2c
1634	\N	466	21	120	teamdriver_jBcCg1Pk
1635	\N	479	21	58	teamdriver_AlyM13DH
1636	\N	480	21	119	teamdriver_h0EW5Qnu
1637	\N	481	21	6	teamdriver_V8c8jCdC
1638	\N	470	21	83	teamdriver_sJVeaiL4
1639	\N	482	21	6	teamdriver_sZykatyw
1640	\N	483	21	119	teamdriver_aNH2INKe
1641	\N	484	21	104	teamdriver_c6KQcAka
1642	\N	314	21	104	teamdriver_YqMkN0R8
1643	\N	305	21	58	teamdriver_LOLVYScu
1644	\N	453	21	121	teamdriver_Khkhp7eT
1645	\N	485	21	58	teamdriver_kEM9QoHl
1646	\N	340	21	122	teamdriver_qXOHcO27
1647	\N	467	21	85	teamdriver_QbtSEVJ6
1648	\N	457	21	119	teamdriver_my3EcWPH
1649	\N	486	21	85	teamdriver_q2KF1FOW
1650	\N	257	21	104	teamdriver_GtGyvnV4
1651	\N	487	21	120	teamdriver_skEegfuA
1652	\N	430	21	123	teamdriver_Fd72Ksff
1653	\N	488	21	58	teamdriver_4RcjnjoE
1654	\N	470	21	122	teamdriver_MpoheH9v
1655	\N	489	21	83	teamdriver_e3h12K5R
1656	\N	490	21	34	teamdriver_AjYtMV9q
1657	\N	474	22	6	teamdriver_TnHhKZRJ
1658	\N	430	22	123	teamdriver_Sbrw6s5a
1659	\N	482	22	6	teamdriver_E0ZQkLUl
1660	\N	488	22	94	teamdriver_E1Sjye0G
1661	\N	404	22	111	teamdriver_trNzY1hx
1662	\N	438	22	117	teamdriver_OCZDhvmT
1663	\N	467	22	122	teamdriver_bMv0aVFV
1664	\N	455	22	6	teamdriver_CqtfXL1T
1665	\N	277	22	83	teamdriver_h7CyLLWE
1666	\N	480	22	124	teamdriver_6mIxuhB5
1667	\N	471	22	124	teamdriver_aHK87DoN
1668	\N	478	22	122	teamdriver_23JzDnvw
1669	\N	466	22	125	teamdriver_l9okjwnp
1670	\N	485	22	94	teamdriver_GYZpiR3J
1671	\N	340	22	122	teamdriver_gFQO4BNd
1672	\N	483	22	123	teamdriver_FNscgqBw
1673	\N	491	22	34	teamdriver_mpv1x0hk
1674	\N	413	22	34	teamdriver_wkZol5wp
1675	\N	434	22	83	teamdriver_rSZLvbzS
1676	\N	383	22	34	teamdriver_KIao5o4x
1677	\N	396	22	124	teamdriver_5Mlkpajh
1678	\N	433	22	83	teamdriver_wJKq0WL5
1679	\N	484	22	117	teamdriver_JJXdMGs0
1680	\N	257	22	117	teamdriver_1fziyLI5
1681	\N	479	22	124	teamdriver_XkCrzo5f
1682	\N	450	22	111	teamdriver_fUyKU7wj
1683	\N	486	22	83	teamdriver_KwBl6PaU
1684	\N	492	22	124	teamdriver_NDLn3coE
1685	\N	493	22	122	teamdriver_wNQegapq
1686	\N	494	22	126	teamdriver_S77iG9ea
1687	\N	495	22	124	teamdriver_2FT7eulu
1688	\N	496	22	124	teamdriver_lvFiqUAk
1689	\N	480	22	125	teamdriver_IIKH5w17
1690	\N	487	22	124	teamdriver_6rPgWj1h
1691	\N	488	22	126	teamdriver_XslVWPAE
1692	\N	470	22	122	teamdriver_3QgG7F1z
1693	\N	497	22	124	teamdriver_45p9XyvY
1694	\N	434	22	94	teamdriver_ilShoS1W
1695	\N	454	22	117	teamdriver_FwPuoqhv
1696	\N	468	22	34	teamdriver_s9p2AbCo
1697	\N	487	22	125	teamdriver_xvwsyVjv
1698	\N	484	22	34	teamdriver_OIoezuuv
1699	\N	498	22	34	teamdriver_O4jKjwhp
1700	\N	499	22	124	teamdriver_d7GcNt7W
1701	\N	407	22	122	teamdriver_oLvKyk4R
1702	\N	485	22	126	teamdriver_Q3oRa79o
1703	\N	500	22	124	teamdriver_lqRKGHj6
1704	\N	453	22	121	teamdriver_ycLRyFy3
1705	\N	501	22	117	teamdriver_TjEGITat
1706	\N	477	22	34	teamdriver_BWuSJgte
1707	\N	305	22	94	teamdriver_OOEO5El6
1708	\N	502	22	83	teamdriver_9nHK1u4m
1709	\N	451	22	117	teamdriver_Rv6rm06f
1710	\N	503	22	34	teamdriver_RyKiY4qX
1711	\N	504	22	122	teamdriver_Y0XS18Jg
1712	\N	423	22	123	teamdriver_L76b5YQi
1713	\N	430	23	123	teamdriver_fe2e1oFI
1714	\N	438	23	117	teamdriver_qZC8eHwx
1715	\N	455	23	6	teamdriver_2VzLJgXx
1716	\N	482	23	6	teamdriver_LvyqhEL4
1717	\N	486	23	122	teamdriver_5tIhSXES
1718	\N	480	23	119	teamdriver_u0qvQ5mO
1719	\N	505	23	83	teamdriver_DI61686e
1720	\N	471	23	119	teamdriver_fnU6YymJ
1721	\N	491	23	34	teamdriver_SaE6bXPl
1722	\N	498	23	34	teamdriver_46Gkgcy0
1723	\N	499	23	119	teamdriver_u098U02Z
1724	\N	485	23	58	teamdriver_9sdRZkJH
1725	\N	483	23	123	teamdriver_yp6Csnh2
1726	\N	488	23	34	teamdriver_vNZFYomv
1727	\N	423	23	117	teamdriver_N3soLyET
1728	\N	474	23	6	teamdriver_p1S2XX4E
1729	\N	466	23	122	teamdriver_VINHgs0Y
1730	\N	277	23	83	teamdriver_AWErqsWb
1731	\N	494	23	58	teamdriver_JmPVQQqA
1732	\N	484	23	34	teamdriver_K4O2IVbZ
1733	\N	479	23	34	teamdriver_0AMMLlcZ
1734	\N	404	23	111	teamdriver_MnceJyXO
1735	\N	478	23	119	teamdriver_ns4Shdyl
1736	\N	396	23	122	teamdriver_vrLd7WjT
1737	\N	506	23	119	teamdriver_ZyUCpvH8
1738	\N	450	23	34	teamdriver_AceiN97c
1739	\N	407	23	122	teamdriver_Ns2lb5BV
1740	\N	434	23	58	teamdriver_rbrBniIm
1741	\N	507	23	83	teamdriver_uTsGeq6F
1742	\N	497	23	119	teamdriver_6jU4HXrJ
1743	\N	467	23	117	teamdriver_CwV9pUn6
1744	\N	487	23	127	teamdriver_fIoEh6xE
1745	\N	487	23	6	teamdriver_VOrkR3dl
1746	\N	508	23	123	teamdriver_4ouf47LK
1747	\N	509	23	6	teamdriver_wt6m4LVe
1748	\N	454	23	34	teamdriver_pbj7oCsF
1749	\N	471	23	128	teamdriver_u7lF9KK3
1750	\N	470	23	127	teamdriver_06Bf2sbt
1751	\N	510	23	129	teamdriver_yT1wlrdM
1752	\N	340	23	122	teamdriver_c4n7qGGT
1753	\N	488	23	58	teamdriver_O2eVrtoB
1754	\N	492	23	119	teamdriver_UIXCMbRl
1755	\N	472	23	34	teamdriver_7DHc1KcJ
1756	\N	511	23	117	teamdriver_XcFgKF79
1757	\N	504	23	122	teamdriver_BezVgkaY
1758	\N	467	23	34	teamdriver_X8hmcA6H
1759	\N	485	24	58	teamdriver_fZBfbuzU
1760	\N	483	24	123	teamdriver_cR319W2d
1761	\N	430	24	123	teamdriver_vh4TPMuy
1762	\N	455	24	6	teamdriver_Gb9di1sZ
1763	\N	438	24	117	teamdriver_Lv9ga9yn
1764	\N	507	24	83	teamdriver_TpARiGxC
1765	\N	482	24	34	teamdriver_I02RgiZ4
1766	\N	423	24	117	teamdriver_EOyXOAhM
1767	\N	509	24	6	teamdriver_dHVo5N1V
1768	\N	497	24	119	teamdriver_i3JFWOPW
1769	\N	500	24	119	teamdriver_ZLph7guA
1770	\N	450	24	34	teamdriver_sKSkHGGg
1771	\N	491	24	130	teamdriver_37lDSPQ9
1772	\N	480	24	58	teamdriver_eA6BpFlL
1773	\N	499	24	34	teamdriver_a1FUH7aH
1774	\N	505	24	83	teamdriver_cJVi2bzm
1775	\N	407	24	122	teamdriver_Jmetudhp
1776	\N	506	24	122	teamdriver_TMLmCWLQ
1777	\N	487	24	130	teamdriver_7XXDNkj6
1778	\N	512	24	122	teamdriver_8d65H17h
1779	\N	513	24	131	teamdriver_66i0qaJj
1780	\N	466	24	122	teamdriver_Ojm2qMXQ
1781	\N	511	24	117	teamdriver_PBHmM5rq
1782	\N	514	24	123	teamdriver_G1awcQTX
1783	\N	433	24	130	teamdriver_9wpAUV6t
1784	\N	454	24	131	teamdriver_R5GTtsAz
1785	\N	434	24	58	teamdriver_Uyfwew0o
1786	\N	471	24	119	teamdriver_yju6Ds2p
1787	\N	277	24	131	teamdriver_0LwCRBDO
1788	\N	466	24	83	teamdriver_Iod1yJFe
1789	\N	404	24	127	teamdriver_GsIwexlD
1790	\N	515	24	119	teamdriver_3EUVvgov
1791	\N	516	24	119	teamdriver_hNnQX94d
1792	\N	488	24	119	teamdriver_LqLCzgfo
1793	\N	517	24	132	teamdriver_8tX8eAEw
1794	\N	471	24	130	teamdriver_SNRY6W27
1795	\N	518	24	83	teamdriver_EfB86jhQ
1796	\N	519	24	122	teamdriver_jUrSUG26
1797	\N	520	24	119	teamdriver_d5jU365E
1798	\N	521	24	130	teamdriver_uPb8BCF4
1799	\N	493	24	130	teamdriver_6YvUMbdJ
1800	\N	455	24	117	teamdriver_L1QS0Z3W
1801	\N	478	24	83	teamdriver_JlvF7Gpy
1802	\N	404	24	123	teamdriver_lrFqYYdF
1803	\N	486	24	130	teamdriver_6msFaQ92
1804	\N	484	24	34	teamdriver_ULCKDwLH
1805	\N	455	24	130	teamdriver_3wj9IXth
1806	\N	467	24	131	teamdriver_vcn3uu7N
1807	\N	438	25	117	teamdriver_lNXkTFAI
1808	\N	499	25	6	teamdriver_pYuD61en
1809	\N	482	25	6	teamdriver_7cvVxtQK
1810	\N	407	25	117	teamdriver_IMt7fpTT
1811	\N	450	25	34	teamdriver_WIBEu22q
1812	\N	508	25	123	teamdriver_JqIQnRRI
1813	\N	505	25	83	teamdriver_5YFK22kD
1814	\N	491	25	119	teamdriver_7l4nMpQc
1815	\N	471	25	34	teamdriver_ZOijz4dY
1816	\N	485	25	117	teamdriver_W19THXNF
1817	\N	522	25	81	teamdriver_h6upI3qz
1818	\N	518	25	83	teamdriver_59r2awlb
1819	\N	480	25	58	teamdriver_Grm8gXMu
1820	\N	277	25	81	teamdriver_08PpVRd2
1821	\N	455	25	58	teamdriver_1sbZxlPO
1822	\N	523	25	83	teamdriver_xI9PfvWE
1823	\N	524	25	119	teamdriver_mZvHFdis
1824	\N	510	25	34	teamdriver_dEnNoNF0
1825	\N	511	25	123	teamdriver_TciPnMjz
1826	\N	506	25	122	teamdriver_73x2dJ8y
1827	\N	509	25	130	teamdriver_pQXYqMKV
1828	\N	515	25	119	teamdriver_duLvrTWa
1829	\N	519	25	122	teamdriver_mVzInr5q
1830	\N	423	25	131	teamdriver_rx9lXoOO
1831	\N	500	25	131	teamdriver_NODg1otj
1832	\N	525	25	119	teamdriver_KEw6kOmc
1833	\N	526	25	58	teamdriver_lx9K739J
1834	\N	514	25	123	teamdriver_iUu3Gwge
1835	\N	434	25	117	teamdriver_Dvzak4Uu
1836	\N	515	25	133	teamdriver_Wa22cW4t
1837	\N	422	25	58	teamdriver_8OcFSQJK
1838	\N	527	25	130	teamdriver_W3yL0lBA
1839	\N	467	25	131	teamdriver_yTiKwq3c
1840	\N	486	25	135	teamdriver_YQP7MU0r
1841	\N	404	25	134	teamdriver_9BtzoqqY
1842	\N	517	25	83	teamdriver_n5pKtUvZ
1843	\N	493	25	130	teamdriver_qM9qdZcV
1844	\N	528	25	132	teamdriver_umnhWuCc
1845	\N	529	25	83	teamdriver_Y14ETRXD
1846	\N	530	25	136	teamdriver_Nyi2Z8UR
1847	\N	531	25	83	teamdriver_KwBz7yf9
1848	\N	532	25	122	teamdriver_s3LQy8US
1849	\N	488	25	119	teamdriver_DkJgNisx
1850	\N	533	25	131	teamdriver_tiuft8xh
1851	\N	523	25	130	teamdriver_67kfkjAG
1852	\N	530	25	131	teamdriver_zjAGns36
1853	\N	506	25	83	teamdriver_U1YnI6FK
1854	\N	534	25	130	teamdriver_6q6Wg8vN
1855	\N	535	25	122	teamdriver_Ec8irPd1
1856	\N	484	25	81	teamdriver_Fbqb3GsP
1857	\N	516	25	136	teamdriver_1gTMGQkc
1858	\N	470	25	122	teamdriver_RNswtm06
1859	\N	536	25	83	teamdriver_dcCtSSgR
1860	\N	537	25	138	teamdriver_oezGbt0F
1861	\N	491	25	137	teamdriver_KrF8u2Oj
1862	\N	538	25	119	teamdriver_rbpd8eJw
1863	\N	539	25	136	teamdriver_mQziWQIg
1864	\N	540	25	130	teamdriver_3OP00RqG
1865	\N	541	25	134	teamdriver_OC7DvaEi
1866	\N	451	25	117	teamdriver_mEIGZfsZ
1867	\N	542	25	122	teamdriver_c8xRNjnJ
1868	\N	478	25	81	teamdriver_GGuGHVWj
1869	\N	526	25	133	teamdriver_ngl41d34
1870	\N	538	25	132	teamdriver_IvvRUQfM
1871	\N	534	25	122	teamdriver_xxeg81dx
1872	\N	543	25	83	teamdriver_wEByMatt
1873	\N	544	25	83	teamdriver_v8EbkHML
1874	\N	474	25	140	teamdriver_Osdf7opo
1875	\N	543	25	122	teamdriver_2ebz1v2m
1876	\N	501	25	139	teamdriver_Qbu1rHuS
1877	\N	519	25	117	teamdriver_NrqJlw3X
1878	\N	404	25	34	teamdriver_4cFtEtQq
1879	\N	461	25	83	teamdriver_wMoXNhj1
1880	\N	539	25	83	teamdriver_qIsDzK0n
1881	\N	486	25	58	teamdriver_rFkePvv8
1882	\N	485	26	117	teamdriver_nYPw4ZmN
1883	\N	515	26	133	teamdriver_nNbpdLdE
1884	\N	505	26	83	teamdriver_pNLj16U2
1885	\N	482	26	6	teamdriver_DTRbMh52
1886	\N	508	26	123	teamdriver_9fwUvojn
1887	\N	499	26	6	teamdriver_wjCJWPSA
1888	\N	501	26	139	teamdriver_R4vO4c4O
1889	\N	455	26	58	teamdriver_bWWNHwcf
1890	\N	525	26	119	teamdriver_55TFKHe8
1891	\N	277	26	81	teamdriver_MkSyPFWy
1892	\N	511	26	123	teamdriver_5EYmCXXs
1893	\N	530	26	143	teamdriver_EqQgUwlf
1894	\N	478	26	81	teamdriver_m9L3fy1o
1895	\N	519	26	117	teamdriver_YuGxnJbm
1896	\N	506	26	83	teamdriver_1fqp9nhi
1897	\N	509	26	141	teamdriver_PlUuWO1U
1898	\N	474	26	140	teamdriver_FTBw9W80
1899	\N	538	26	34	teamdriver_LHh8jRDT
1900	\N	480	26	58	teamdriver_4Ewj5A2P
1901	\N	540	26	141	teamdriver_k0VtczgN
1902	\N	507	26	142	teamdriver_2WkUSflm
1903	\N	518	26	122	teamdriver_5HUNSkfg
1904	\N	500	26	143	teamdriver_zLBCxayT
1905	\N	478	26	144	teamdriver_BEULnAUC
1906	\N	545	26	58	teamdriver_uGrhGD0w
1907	\N	514	26	58	teamdriver_SCTifGTz
1908	\N	434	26	117	teamdriver_uozwlH4r
1909	\N	546	26	34	teamdriver_VwNwOOCx
1910	\N	526	26	123	teamdriver_c2LPrqNG
1911	\N	536	26	119	teamdriver_GFvG7CHG
1912	\N	547	26	141	teamdriver_fMXiW3zG
1913	\N	548	26	132	teamdriver_t8DiGF3W
1914	\N	510	26	81	teamdriver_cQkAd7PH
1915	\N	549	26	133	teamdriver_gfmkjmzl
1916	\N	277	26	144	teamdriver_mDCMkMne
1917	\N	550	26	133	teamdriver_5Jy67EAL
1918	\N	510	26	144	teamdriver_P6itcGvF
1919	\N	547	26	144	teamdriver_K1kzDjuI
1920	\N	551	26	141	teamdriver_ATgISAgS
1921	\N	526	26	141	teamdriver_6Bxq0tjE
1922	\N	528	26	144	teamdriver_DdHLsRtX
1923	\N	493	26	132	teamdriver_0oxZMULG
1924	\N	549	26	144	teamdriver_aSkH4BJ1
1925	\N	552	26	137	teamdriver_dI6lUCv4
1926	\N	534	26	123	teamdriver_NpaPqZAU
1927	\N	510	26	141	teamdriver_qGqm4CZQ
1928	\N	501	26	119	teamdriver_4mtTjnCg
1929	\N	553	26	58	teamdriver_sPPZgLxr
1930	\N	537	26	138	teamdriver_67R5wjty
1931	\N	554	26	122	teamdriver_DQ6H6qnb
1932	\N	524	26	119	teamdriver_E3kXFPWj
1933	\N	555	26	58	teamdriver_W2BCEvTR
1934	\N	556	26	133	teamdriver_0ukgOpvQ
1935	\N	518	26	58	teamdriver_67d2gxzI
1936	\N	539	26	141	teamdriver_BTx9NUuB
1937	\N	557	26	137	teamdriver_jTlbyU8U
1938	\N	404	26	132	teamdriver_dvw9cGAO
1939	\N	558	26	133	teamdriver_xe5ZjM86
1940	\N	559	26	141	teamdriver_5VyV1FDb
1941	\N	500	26	145	teamdriver_0nAJf2dj
1942	\N	509	26	142	teamdriver_M3oq3VK7
1943	\N	560	26	141	teamdriver_GMx9xey4
1944	\N	518	26	139	teamdriver_RDRAjBYB
1945	\N	561	26	123	teamdriver_fbIVxJy4
1946	\N	536	26	141	teamdriver_p4M0ZrLH
1947	\N	499	27	6	teamdriver_zVEIod8T
1948	\N	508	27	123	teamdriver_vtqPS5tA
1949	\N	530	27	131	teamdriver_zHTSVG72
1950	\N	524	27	119	teamdriver_Q2HMobeW
1951	\N	511	27	123	teamdriver_ErLVbMQe
1952	\N	519	27	117	teamdriver_S8mtWMMV
1953	\N	482	27	6	teamdriver_6znnMrRZ
1954	\N	455	27	148	teamdriver_frp0huRU
1955	\N	560	27	141	teamdriver_ohLWwdun
1956	\N	506	27	147	teamdriver_peSVQsNL
1957	\N	562	27	142	teamdriver_97IbZSHS
1958	\N	505	27	147	teamdriver_TrwilNEk
1959	\N	485	27	142	teamdriver_KjEi2J0w
1960	\N	536	27	119	teamdriver_osfLp6jI
1961	\N	500	27	131	teamdriver_02sin2Ca
1962	\N	515	27	117	teamdriver_V7NJ6gHR
1963	\N	525	27	119	teamdriver_Vs2RNhN4
1964	\N	540	27	146	teamdriver_wtEOOfBu
1965	\N	480	27	58	teamdriver_gQyPdrmL
1966	\N	474	27	58	teamdriver_7tD3pMh7
1967	\N	518	27	139	teamdriver_y8Da2UEl
1968	\N	539	27	34	teamdriver_LNswlc8A
1969	\N	474	27	140	teamdriver_w6pLU00x
1970	\N	546	27	58	teamdriver_fJSwSzrg
1971	\N	558	27	122	teamdriver_XKxqzgrU
1972	\N	561	27	148	teamdriver_VTkE161Y
1973	\N	404	27	132	teamdriver_lSzw3t0q
1974	\N	556	27	133	teamdriver_Zq5owsQ2
1975	\N	563	27	58	teamdriver_PH9gho8D
1976	\N	480	27	119	teamdriver_3ZuWlHsa
1977	\N	526	27	123	teamdriver_3aFs0cAK
1978	\N	549	27	122	teamdriver_za97rqlI
1979	\N	509	27	119	teamdriver_3qrqN91B
1980	\N	541	27	149	teamdriver_2imo22iu
1981	\N	564	27	97	teamdriver_MeoiWOW2
1982	\N	565	27	141	teamdriver_sx3snKqT
1983	\N	566	27	97	teamdriver_0iAAq4c2
1984	\N	567	27	97	teamdriver_vajwDhdN
1985	\N	522	27	133	teamdriver_HneQqt06
1986	\N	471	27	122	teamdriver_yx74rBdS
1987	\N	568	27	97	teamdriver_Ah1hiACj
1988	\N	567	27	132	teamdriver_TEqCv20a
1989	\N	551	27	97	teamdriver_EHbeMZye
1990	\N	546	27	97	teamdriver_vlrakjfx
1991	\N	569	27	122	teamdriver_5laPOiuK
1992	\N	538	27	131	teamdriver_dmRq6VGA
1993	\N	536	27	97	teamdriver_HbB33SKL
1994	\N	478	27	147	teamdriver_TnNbVXCE
1995	\N	570	27	123	teamdriver_c9UTv9J9
1996	\N	509	27	148	teamdriver_lt2i6jf1
1997	\N	571	27	132	teamdriver_zLdsRMyJ
1998	\N	478	27	133	teamdriver_O2QT2Fre
1999	\N	455	27	132	teamdriver_El2GUSbz
2000	\N	572	27	139	teamdriver_hPf3QprB
2001	\N	573	27	122	teamdriver_mB0OeBR4
2002	\N	505	27	6	teamdriver_GLShMzwF
2003	\N	574	27	123	teamdriver_eNMblNKx
2004	\N	541	27	147	teamdriver_3lGwmGPD
2005	\N	404	27	148	teamdriver_RUrVIWhj
2006	\N	575	27	133	teamdriver_g6i7gLoe
2007	\N	576	27	148	teamdriver_WBlVgx77
2008	\N	577	27	122	teamdriver_Hq8PhE1D
2009	\N	578	27	150	teamdriver_eDzETozz
2010	\N	571	27	148	teamdriver_d1fb3eDy
2011	\N	579	27	123	teamdriver_1SqMzIp1
2012	\N	557	27	137	teamdriver_B40vIjSs
2013	\N	511	28	148	teamdriver_EGLR5sHw
2014	\N	506	28	83	teamdriver_CiC3BBVB
2015	\N	505	28	6	teamdriver_0Ake3Hww
2016	\N	485	28	142	teamdriver_b8JXBhz5
2017	\N	474	28	58	teamdriver_lKhT3s0Z
2018	\N	482	28	132	teamdriver_sUt8pRbb
2019	\N	525	28	122	teamdriver_pJXoMcg1
2020	\N	526	28	119	teamdriver_BYf1hsXp
2021	\N	530	28	131	teamdriver_be8jAkEi
2022	\N	518	28	83	teamdriver_hgM4OJCB
2023	\N	575	28	119	teamdriver_JJ88TDZp
2024	\N	540	28	146	teamdriver_MxqQYV7Y
2025	\N	508	28	123	teamdriver_IlFIL3tb
2026	\N	515	28	117	teamdriver_TSuQh8nf
2027	\N	519	28	117	teamdriver_W4wti31d
2028	\N	480	28	123	teamdriver_k4r3SSsL
2029	\N	562	28	142	teamdriver_6xFT67El
2030	\N	499	28	6	teamdriver_izGy8KeJ
2031	\N	571	28	122	teamdriver_zaScGBNP
2032	\N	560	28	131	teamdriver_DovUiH6x
2033	\N	563	28	58	teamdriver_ZDbHU6Ln
2034	\N	541	28	34	teamdriver_llDMp4pW
2035	\N	558	28	119	teamdriver_CEYTwOgQ
2036	\N	524	28	119	teamdriver_FLX55hGq
2037	\N	572	28	119	teamdriver_l1qb2phl
2038	\N	500	28	139	teamdriver_nuJKhsW3
2039	\N	553	28	119	teamdriver_VfLYokFv
2040	\N	524	28	83	teamdriver_aYYHnExl
2041	\N	549	28	131	teamdriver_TGICkbXr
2042	\N	567	28	119	teamdriver_dR3WmJhm
2043	\N	566	28	117	teamdriver_JqkYn8sj
2044	\N	580	28	133	teamdriver_5hPbPsvf
2045	\N	556	28	133	teamdriver_BhiabbfT
2046	\N	509	28	119	teamdriver_6V9xWvGs
2047	\N	516	28	151	teamdriver_gO5mzzh0
2048	\N	573	28	34	teamdriver_DTh11tSV
2049	\N	581	28	131	teamdriver_ePio6rwU
2050	\N	455	28	132	teamdriver_Ft5ZONqN
2051	\N	541	28	122	teamdriver_9ygSOMni
2052	\N	582	28	119	teamdriver_DuBWsA7Z
2053	\N	583	28	133	teamdriver_zyOyYc7x
2054	\N	454	28	131	teamdriver_DBANLez9
2055	\N	558	28	117	teamdriver_GUgZdrR4
2056	\N	584	28	119	teamdriver_cxk3NmX3
2057	\N	585	28	122	teamdriver_1KEUJbri
2058	\N	586	28	117	teamdriver_hnQGJO7Y
2059	\N	528	28	122	teamdriver_hNErwLsW
2060	\N	534	28	152	teamdriver_FE9keb63
2061	\N	585	28	132	teamdriver_5AgeLRDQ
2062	\N	587	28	119	teamdriver_SCV47gWo
2063	\N	522	28	34	teamdriver_5SVxmeUA
2064	\N	557	28	122	teamdriver_XxtM3ZWi
2065	\N	588	28	153	teamdriver_epkbSEic
2066	\N	589	28	139	teamdriver_dqjCgcIa
2067	\N	529	28	34	teamdriver_mRY6Ms2Y
2068	\N	571	28	139	teamdriver_rL964zRb
2069	\N	509	28	131	teamdriver_TOp1m5Ct
2070	\N	539	28	133	teamdriver_5ckYQIRn
2071	\N	553	28	149	teamdriver_eP3ZaHBL
2072	\N	590	28	119	teamdriver_IkwRSsIQ
2073	\N	591	28	117	teamdriver_RDoxqplq
2074	\N	592	28	122	teamdriver_SPabxIQo
2075	\N	564	28	154	teamdriver_vNnmbJDW
2076	\N	593	28	83	teamdriver_gsMQcCDP
2077	\N	500	28	131	teamdriver_Yue2Ds1g
2078	\N	594	28	139	teamdriver_jXAp9lXm
2079	\N	586	28	6	teamdriver_lXSVirP6
2080	\N	595	28	123	teamdriver_JtZFKm4g
2081	\N	579	28	150	teamdriver_P2RdUXKU
2082	\N	500	28	146	teamdriver_RKG6rQkX
2083	\N	577	28	150	teamdriver_yFy4QbmD
2084	\N	474	29	58	teamdriver_FFAi8q9A
2085	\N	499	29	83	teamdriver_hhDhmiWl
2086	\N	508	29	123	teamdriver_yfIXuXAK
2087	\N	515	29	117	teamdriver_5Nkvakyr
2088	\N	480	29	58	teamdriver_jJsWX7t6
2089	\N	585	29	117	teamdriver_1bI2uoOv
2090	\N	505	29	6	teamdriver_cY7znXbC
2091	\N	586	29	6	teamdriver_iXKv0G14
2092	\N	485	29	142	teamdriver_Q00YPHlC
2093	\N	511	29	148	teamdriver_zUFKOVRF
2094	\N	519	29	89	teamdriver_SDqZwihU
2095	\N	500	29	89	teamdriver_wTkWnqd1
2096	\N	558	29	117	teamdriver_MRJiolaa
2097	\N	596	29	123	teamdriver_BKTUjSgD
2098	\N	482	29	131	teamdriver_mYCGKGwU
2099	\N	540	29	146	teamdriver_hAtHUWN7
2100	\N	524	29	131	teamdriver_EPfCm5KS
2101	\N	525	29	122	teamdriver_ijj0eTO8
2102	\N	518	29	83	teamdriver_KlUewvSl
2103	\N	549	29	141	teamdriver_E332AooJ
2104	\N	594	29	132	teamdriver_1pV5bkZw
2105	\N	592	29	132	teamdriver_QfhHA9g0
2106	\N	509	29	156	teamdriver_v7NNbiDp
2107	\N	580	29	122	teamdriver_R6ofNwoh
2108	\N	583	29	58	teamdriver_DJUIzuqW
2109	\N	597	29	155	teamdriver_T4evGxyu
2110	\N	569	29	133	teamdriver_dPXGanJI
2111	\N	581	29	157	teamdriver_7ZsEFfg2
2112	\N	478	29	157	teamdriver_BHkp7VNN
2113	\N	534	29	152	teamdriver_IPFcghfM
2114	\N	598	29	155	teamdriver_AeRrGmXS
2115	\N	597	29	133	teamdriver_xVJ9amEv
2116	\N	599	29	158	teamdriver_TixK8LqO
2117	\N	594	29	131	teamdriver_4E6SPBJD
2118	\N	600	29	133	teamdriver_7JynyDaT
2119	\N	455	29	132	teamdriver_FgaUim8S
2120	\N	591	29	117	teamdriver_n0tS1LIh
2121	\N	601	29	89	teamdriver_SzCrHyuu
2122	\N	566	29	117	teamdriver_IJ35aTBJ
2123	\N	598	29	89	teamdriver_TGrUdFot
2124	\N	600	29	132	teamdriver_gxlnwzyl
2125	\N	602	29	132	teamdriver_SXBZpIWW
2126	\N	557	29	117	teamdriver_RUTFzpre
2127	\N	598	29	148	teamdriver_EzSvWuEZ
2128	\N	556	29	132	teamdriver_deW8Pgy2
2129	\N	603	29	132	teamdriver_cmLQHVX3
2130	\N	603	29	117	teamdriver_R2JLzib9
2131	\N	571	29	89	teamdriver_mScRek0G
2132	\N	590	29	89	teamdriver_ytnnf6Kq
2133	\N	556	29	89	teamdriver_6cD9BDxV
2134	\N	604	29	122	teamdriver_TViR0z0Q
2135	\N	601	29	156	teamdriver_W0IGEX8E
2136	\N	605	29	148	teamdriver_VTeQ31BB
2137	\N	558	29	132	teamdriver_reGWgmL8
2138	\N	500	29	58	teamdriver_ELoWJWWl
2139	\N	606	29	122	teamdriver_zXOrOCML
2140	\N	603	29	83	teamdriver_cHxLuBRY
2141	\N	599	29	122	teamdriver_4s7B7Gj6
2142	\N	540	30	146	teamdriver_toCVWRTO
2143	\N	505	30	58	teamdriver_OEqLK3d6
2144	\N	518	30	117	teamdriver_qUXVGkPv
2145	\N	508	30	146	teamdriver_rr9yQPPt
2146	\N	474	30	58	teamdriver_SsrjqoRL
2147	\N	485	30	142	teamdriver_0642VKYb
2148	\N	607	30	131	teamdriver_tRDGomTw
2149	\N	519	30	157	teamdriver_uXyFkMc6
2150	\N	549	30	141	teamdriver_IjEQhnQX
2151	\N	482	30	141	teamdriver_AaCMdBbb
2152	\N	600	30	132	teamdriver_LVJpeY8R
2153	\N	586	30	6	teamdriver_tKkQyvNN
2154	\N	583	30	58	teamdriver_bBmO7kVP
2155	\N	608	30	131	teamdriver_bFn4LZov
2156	\N	515	30	148	teamdriver_7cp9Sjrz
2157	\N	500	30	123	teamdriver_OKqqOABa
2158	\N	534	30	152	teamdriver_YXfZXFDV
2159	\N	499	30	147	teamdriver_yNn0svMH
2160	\N	599	30	152	teamdriver_cCfZQMxM
2161	\N	511	30	6	teamdriver_dNOL5A7k
2162	\N	596	30	123	teamdriver_W8EphS3z
2163	\N	585	30	117	teamdriver_He4gqF3o
2164	\N	603	30	147	teamdriver_GirWtfsY
2165	\N	509	30	156	teamdriver_zL5ResP9
2166	\N	581	30	157	teamdriver_Br5j0hZA
2167	\N	524	30	89	teamdriver_Uib3c6bw
2168	\N	609	30	159	teamdriver_kQW5iDtq
2169	\N	591	30	1	teamdriver_OgY4NTFQ
2170	\N	609	30	156	teamdriver_tz7NlDLI
2171	\N	598	30	148	teamdriver_y9KlTo1O
2172	\N	455	30	146	teamdriver_NT9lljqA
2173	\N	610	30	132	teamdriver_5xBlkRqo
2174	\N	602	30	123	teamdriver_0XvGef4G
2175	\N	600	30	123	teamdriver_mawY99zJ
2176	\N	525	30	1	teamdriver_B822zGnn
2177	\N	611	30	132	teamdriver_q8INTGuj
2178	\N	583	30	160	teamdriver_GpCgtkqT
2179	\N	612	30	97	teamdriver_LCYyDaBZ
2180	\N	603	30	97	teamdriver_Ni7QqPdH
2181	\N	575	30	142	teamdriver_MOK0jTRL
2182	\N	499	30	97	teamdriver_gFbgUWxl
2183	\N	549	31	141	teamdriver_wyoDw3GX
2184	\N	603	31	83	teamdriver_I2i0xlbe
2185	\N	598	31	142	teamdriver_2ucoyUYb
2186	\N	600	31	123	teamdriver_5bxFwEwB
2187	\N	591	31	1	teamdriver_OLXHawjF
2188	\N	613	31	117	teamdriver_IVOxNTmR
2189	\N	612	31	83	teamdriver_D43a99gY
2190	\N	508	31	1	teamdriver_CTKHhYrn
2191	\N	511	31	6	teamdriver_1muXTiS8
2192	\N	482	31	132	teamdriver_h56A4NaV
2193	\N	485	31	142	teamdriver_KFkJ2fB5
2194	\N	586	31	6	teamdriver_eI1oRemL
2195	\N	540	31	146	teamdriver_mVWilm9O
2196	\N	581	31	157	teamdriver_dKDMioxR
2197	\N	611	31	89	teamdriver_gJ7ZINMG
2198	\N	474	31	58	teamdriver_BzJh3FTi
2199	\N	519	31	157	teamdriver_XjFdgi1e
2200	\N	505	31	141	teamdriver_dPHS9aFs
2201	\N	607	31	58	teamdriver_dVjDWB4y
2202	\N	518	31	117	teamdriver_rTv2X4Vq
2203	\N	534	31	152	teamdriver_s7rRMZQp
2204	\N	599	31	152	teamdriver_Fdj4Lc8B
2205	\N	596	31	146	teamdriver_HXbgUZ4t
2206	\N	500	31	123	teamdriver_myCW8RlT
2207	\N	614	31	131	teamdriver_JeHjna1C
2208	\N	615	31	131	teamdriver_cXPHEjK3
2209	\N	608	31	89	teamdriver_pQAfexaV
2210	\N	597	31	161	teamdriver_6KmRkTlV
2211	\N	602	31	131	teamdriver_m631DEXP
2212	\N	616	31	117	teamdriver_ZZwg4FPU
2213	\N	617	31	132	teamdriver_to2mkpv9
2214	\N	608	31	132	teamdriver_Gw3zRttK
2215	\N	583	31	83	teamdriver_rhOPnfAr
2216	\N	580	31	141	teamdriver_JQDuvaIc
2217	\N	618	31	141	teamdriver_a5GRF2uv
2218	\N	556	31	89	teamdriver_4IS9yXfq
2219	\N	619	31	58	teamdriver_ApTzoLg2
2220	\N	525	31	1	teamdriver_3H6ri6mi
2221	\N	602	31	132	teamdriver_4dZYP9K0
2222	\N	620	31	157	teamdriver_0Xq8wLaW
2223	\N	621	31	157	teamdriver_sWBScgia
2224	\N	622	31	1	teamdriver_zRYCBEgG
2225	\N	620	31	123	teamdriver_eKJvAVKJ
2226	\N	623	31	141	teamdriver_NsWXQiVO
2227	\N	602	31	141	teamdriver_HmqfQAtT
2228	\N	549	32	141	teamdriver_AXiuYvEi
2229	\N	505	32	141	teamdriver_f3I7VqwD
2230	\N	603	32	83	teamdriver_cCEBwcuh
2231	\N	474	32	1	teamdriver_jzxxiOoE
2232	\N	597	32	123	teamdriver_AK59WKyr
2233	\N	585	32	155	teamdriver_hvw413dg
2234	\N	624	32	142	teamdriver_tmSpAR5B
2235	\N	599	32	152	teamdriver_oZtwZZRi
2236	\N	611	32	132	teamdriver_13iVNcOv
2237	\N	596	32	6	teamdriver_jvE3Gb0Y
2238	\N	500	32	146	teamdriver_genZ5fVr
2239	\N	583	32	83	teamdriver_F8jdD4WE
2240	\N	591	32	1	teamdriver_WDdueOJu
2241	\N	540	32	146	teamdriver_yaM96cbY
2242	\N	598	32	142	teamdriver_xF7fOArU
2243	\N	608	32	89	teamdriver_HR91P1UT
2244	\N	581	32	157	teamdriver_p2IlS10k
2245	\N	606	32	161	teamdriver_5ALfjlD1
2246	\N	619	32	58	teamdriver_LUaXlOae
2247	\N	586	32	6	teamdriver_hP1IxVQc
2248	\N	518	32	117	teamdriver_Orfx23Bb
2249	\N	607	32	58	teamdriver_YJeaTDny
2250	\N	613	32	152	teamdriver_xwEcZvuZ
2251	\N	622	32	117	teamdriver_YjvG415T
2252	\N	623	32	123	teamdriver_F5ENsQ90
2253	\N	600	32	119	teamdriver_Zpo2vnaP
2254	\N	625	32	161	teamdriver_v4QEuF9T
2255	\N	626	32	157	teamdriver_NHQJRH6J
2256	\N	627	32	119	teamdriver_7G1DYgQz
2257	\N	612	32	123	teamdriver_JbLUQRVZ
2258	\N	627	32	161	teamdriver_ThstdLBx
2259	\N	628	32	132	teamdriver_lgb2Rny1
2260	\N	534	32	146	teamdriver_T1Qn6aSE
2261	\N	629	32	89	teamdriver_6DY83TWR
2262	\N	630	32	123	teamdriver_2tMvlqnO
2263	\N	631	32	162	teamdriver_2JCWNrnb
2264	\N	553	32	162	teamdriver_rm7KjkwM
2265	\N	632	32	161	teamdriver_DbyWYOmK
2266	\N	627	32	132	teamdriver_kILA49nW
2267	\N	593	32	161	teamdriver_M3337hfL
2268	\N	611	32	155	teamdriver_ZDrbyWDj
2269	\N	585	32	146	teamdriver_cm1RBLqx
2270	\N	500	32	161	teamdriver_8AGwbCld
2271	\N	633	32	157	teamdriver_B4DbsIrp
2272	\N	613	33	152	teamdriver_wlQUOKZX
2273	\N	505	33	141	teamdriver_26OcRX57
2274	\N	599	33	152	teamdriver_E2eBzMaE
2275	\N	499	33	117	teamdriver_jZPGjkeA
2276	\N	598	33	141	teamdriver_f8K1kuO9
2277	\N	518	33	117	teamdriver_XxEF2yoJ
2278	\N	630	33	123	teamdriver_SVaAy74J
2279	\N	607	33	58	teamdriver_6yi3O9x7
2280	\N	627	33	89	teamdriver_Gg2yVdN6
2281	\N	621	33	89	teamdriver_g6BBrmTe
2282	\N	591	33	1	teamdriver_xXiTObE6
2283	\N	519	33	119	teamdriver_XHa56bUS
2284	\N	622	33	1	teamdriver_iVEcNjBy
2285	\N	600	33	155	teamdriver_9q0MRYYV
2286	\N	634	33	119	teamdriver_OB4J4uEC
2287	\N	629	33	123	teamdriver_pQqKwwvJ
2288	\N	624	33	142	teamdriver_sqNsuYrv
2289	\N	596	33	6	teamdriver_U0Ij7sQa
2290	\N	540	33	146	teamdriver_R3W471gi
2291	\N	631	33	162	teamdriver_dNAljBtL
2292	\N	581	33	83	teamdriver_5Z4mpjWM
2293	\N	597	33	146	teamdriver_60y9vHO0
2294	\N	586	33	6	teamdriver_hBLft4HW
2295	\N	603	33	83	teamdriver_0JDauaZg
2296	\N	619	33	58	teamdriver_qIrliupy
2297	\N	500	33	161	teamdriver_DdQ32uTK
2298	\N	635	33	157	teamdriver_nhmBLTVf
2299	\N	636	33	161	teamdriver_6fIoXGd7
2300	\N	553	33	157	teamdriver_4pjfwNpp
2301	\N	637	33	132	teamdriver_bbjJmpW7
2302	\N	638	33	162	teamdriver_XHI4u6ZX
2303	\N	474	33	141	teamdriver_TVoMJloX
2304	\N	553	33	123	teamdriver_zMEEqJl8
2305	\N	611	33	157	teamdriver_Ohftueil
2306	\N	600	33	141	teamdriver_SpBDG24y
2307	\N	608	33	155	teamdriver_a5Mke0Cl
2308	\N	566	33	119	teamdriver_5CVFqVHN
2309	\N	602	33	155	teamdriver_uezQeMPy
2310	\N	585	33	6	teamdriver_0U1mbi4k
2311	\N	639	33	58	teamdriver_LbRmZvup
2312	\N	602	33	58	teamdriver_yGg0fGIO
2313	\N	640	33	155	teamdriver_XU9Dz9SL
2314	\N	580	33	119	teamdriver_N1CQ3y5X
2315	\N	474	33	6	teamdriver_1QSLZr2T
2316	\N	603	34	83	teamdriver_91vOBoSF
2317	\N	499	34	117	teamdriver_k7qbKZME
2318	\N	540	34	141	teamdriver_ujx85WbL
2319	\N	585	34	6	teamdriver_HEdlI3Cy
2320	\N	611	34	157	teamdriver_dW0AjT6Q
2321	\N	613	34	152	teamdriver_1kzPiEig
2322	\N	631	34	162	teamdriver_CzIjVyrd
2323	\N	624	34	157	teamdriver_hcwbyiJ5
2324	\N	599	34	6	teamdriver_45GaXXHU
2325	\N	641	34	123	teamdriver_lO3LTlQO
2326	\N	619	34	58	teamdriver_3KUsDVvp
2327	\N	642	34	155	teamdriver_cvb9xXqc
2328	\N	627	34	163	teamdriver_gir76IJy
2329	\N	621	34	89	teamdriver_t36aj6oR
2330	\N	598	34	141	teamdriver_0NR178YF
2331	\N	607	34	58	teamdriver_0dvTwMbI
2332	\N	637	34	155	teamdriver_W6I3VoPA
2333	\N	597	34	152	teamdriver_Q9YXwNuY
2334	\N	518	34	117	teamdriver_rs9bsp8y
2335	\N	634	34	146	teamdriver_6vX2et3r
2336	\N	635	34	1	teamdriver_0gAe4Q1c
2337	\N	500	34	146	teamdriver_MPooPYRq
2338	\N	581	34	83	teamdriver_JvsUxPxb
2339	\N	643	34	161	teamdriver_EnLz4fim
2340	\N	591	34	162	teamdriver_nj5Pfu4z
2341	\N	630	34	123	teamdriver_DSgWoehA
2342	\N	622	34	1	teamdriver_eGYVMHrf
2343	\N	632	34	161	teamdriver_oOIo9g3R
2344	\N	549	34	157	teamdriver_EVBs22cR
2345	\N	644	34	163	teamdriver_Qzo4KMdK
2346	\N	645	34	157	teamdriver_sPmzIULh
2347	\N	633	34	163	teamdriver_5Gcq1ITn
2348	\N	615	34	164	teamdriver_5TVbKXtY
2349	\N	646	34	163	teamdriver_FGJGXhjk
2350	\N	647	34	141	teamdriver_NFXolOpQ
2351	\N	613	35	117	teamdriver_JzONdwqM
2352	\N	598	35	141	teamdriver_XSTRW8Rd
2353	\N	607	35	58	teamdriver_nX0chiLy
2354	\N	597	35	1	teamdriver_DYegfDC2
2355	\N	585	35	152	teamdriver_DU9LM840
2356	\N	645	35	157	teamdriver_O7iZE51T
2357	\N	611	35	157	teamdriver_tvndZE3c
2358	\N	647	35	163	teamdriver_osnl766h
2359	\N	648	35	123	teamdriver_QVIMdksm
2360	\N	631	35	152	teamdriver_UK6FCzK8
2361	\N	622	35	146	teamdriver_ozC5zPWs
2362	\N	581	35	1	teamdriver_ZlCoLPpn
2363	\N	499	35	117	teamdriver_lE50QVvg
2364	\N	619	35	58	teamdriver_1ZtvJdYO
2365	\N	603	35	83	teamdriver_iMHUDYlY
2366	\N	638	35	83	teamdriver_seONrSPA
2367	\N	599	35	6	teamdriver_6b6TyWRR
2368	\N	632	35	161	teamdriver_8aaO4k7y
2369	\N	649	35	146	teamdriver_yFx0M9uD
2370	\N	650	35	163	teamdriver_VxJAmGa5
2371	\N	642	35	162	teamdriver_PfrIuPhs
2372	\N	540	35	141	teamdriver_sJAaeWvs
2373	\N	630	35	6	teamdriver_AgQDjJk7
2374	\N	635	35	164	teamdriver_C00j0Rka
2375	\N	651	35	123	teamdriver_y5TjE9Ir
2376	\N	652	35	162	teamdriver_hnyXpq2w
2377	\N	621	35	89	teamdriver_4LHs0OsS
2378	\N	653	35	161	teamdriver_mnphFPdb
2379	\N	643	35	83	teamdriver_rznc81S6
2380	\N	654	35	164	teamdriver_kX1uHRCX
2381	\N	620	35	163	teamdriver_KcLM1OIn
2382	\N	615	35	123	teamdriver_NHrQsixZ
2383	\N	620	35	123	teamdriver_AU0xDPN3
2384	\N	655	35	89	teamdriver_nmolSPAr
2385	\N	615	35	162	teamdriver_3iXCBYtF
2386	\N	656	35	162	teamdriver_5pfJBZEY
2387	\N	621	35	83	teamdriver_6EOeSV9p
2388	\N	657	35	152	teamdriver_s6SfZVDi
2389	\N	613	36	117	teamdriver_oQioEB3V
2390	\N	630	36	6	teamdriver_Ka7ryCMk
2391	\N	607	36	58	teamdriver_lY0PnWJE
2392	\N	599	36	6	teamdriver_WFPWVLyM
2393	\N	585	36	152	teamdriver_6IjdQFMj
2394	\N	540	36	146	teamdriver_0J5qMEae
2395	\N	615	36	123	teamdriver_A2pJxnKd
2396	\N	648	36	123	teamdriver_IX3ZfRAZ
2397	\N	650	36	163	teamdriver_44VCFpUW
2398	\N	631	36	152	teamdriver_J1Nlcaqe
2399	\N	645	36	157	teamdriver_XvlMRtpu
2400	\N	632	36	161	teamdriver_4Ua4P5ZK
2401	\N	621	36	163	teamdriver_qLtG74I1
2402	\N	655	36	157	teamdriver_gjHBBqW0
2403	\N	652	36	58	teamdriver_8H2zt8k1
2404	\N	597	36	1	teamdriver_TngWrOXd
2405	\N	656	36	165	teamdriver_yBkDECV5
2406	\N	499	36	117	teamdriver_pNG7ChRM
2407	\N	622	36	146	teamdriver_OTsSLyC2
2408	\N	581	36	1	teamdriver_sfrZ7RXX
2409	\N	598	36	141	teamdriver_uZpxz6JN
2410	\N	649	36	83	teamdriver_kaQkPDRq
2411	\N	619	36	141	teamdriver_TUiQrvZO
2412	\N	635	36	164	teamdriver_RlTcHoTI
2413	\N	603	36	83	teamdriver_cDwsjccI
2414	\N	651	36	123	teamdriver_Y53DcIg4
2415	\N	615	36	6	teamdriver_PIw6t3u9
2416	\N	647	36	166	teamdriver_9Y5UmnUw
2417	\N	638	36	162	teamdriver_ycKMMbBy
2418	\N	611	36	83	teamdriver_RXu49TXU
2419	\N	654	36	161	teamdriver_nZu9jZlz
2420	\N	649	36	152	teamdriver_ZzcwrJ8m
2421	\N	646	36	163	teamdriver_e5A64uda
2422	\N	632	36	162	teamdriver_7whpcTS5
2423	\N	657	36	146	teamdriver_Gtb4g7Ye
2424	\N	549	36	81	teamdriver_6ViwULUF
2425	\N	658	36	166	teamdriver_gv0ZKnS9
2426	\N	518	36	117	teamdriver_tpZRWW0s
2427	\N	659	36	123	teamdriver_oRNtpj0N
2428	\N	657	36	123	teamdriver_Wa4d1c8O
2429	\N	603	37	141	teamdriver_yPZF7mdE
2430	\N	652	37	58	teamdriver_Hxu8fkNW
2431	\N	540	37	146	teamdriver_iiiDy68g
2432	\N	599	37	146	teamdriver_8yn6llU2
2433	\N	648	37	123	teamdriver_Yd2i0yvT
2434	\N	655	37	167	teamdriver_9LMiC7rs
2435	\N	657	37	123	teamdriver_CD9GAW0Y
2436	\N	607	37	83	teamdriver_YCVuyyUt
2437	\N	660	37	58	teamdriver_METq9gxX
2438	\N	638	37	167	teamdriver_dJMNpaes
2439	\N	645	37	157	teamdriver_9LAjgiVr
2440	\N	630	37	6	teamdriver_QTDw40Pd
2441	\N	613	37	117	teamdriver_uScxjmFW
2442	\N	658	37	161	teamdriver_sST4Vbsq
2443	\N	615	37	6	teamdriver_dqhiP6uQ
2444	\N	585	37	81	teamdriver_QhhpSgBQ
2445	\N	581	37	83	teamdriver_6bhipMub
2446	\N	647	37	166	teamdriver_8c5m6FMK
2447	\N	611	37	157	teamdriver_e97X8p7e
2448	\N	661	37	165	teamdriver_Nlq49Ils
2449	\N	622	37	165	teamdriver_VaqQEee0
2450	\N	632	37	161	teamdriver_ZUfBVnuk
2451	\N	598	37	117	teamdriver_YVvekvfr
2452	\N	549	37	81	teamdriver_YTjC8j4w
2453	\N	619	37	141	teamdriver_AxxuKsXs
2454	\N	654	37	166	teamdriver_fLs0ntdp
2455	\N	631	37	83	teamdriver_lzldpDiA
2456	\N	658	37	157	teamdriver_yf56Iqwt
2457	\N	597	37	81	teamdriver_aamalUjF
2458	\N	662	37	161	teamdriver_zTuoCuDc
2459	\N	650	37	146	teamdriver_pEKyuNlz
2460	\N	663	37	161	teamdriver_ogr3uLEE
2461	\N	659	37	168	teamdriver_lghqjqB1
2462	\N	613	38	117	teamdriver_qh8XTlex
2463	\N	603	38	141	teamdriver_FFsJ9MYx
2464	\N	615	38	117	teamdriver_HLKWJedB
2465	\N	655	38	6	teamdriver_l9wZFPGG
2466	\N	645	38	167	teamdriver_WzxBZ5cR
2467	\N	619	38	141	teamdriver_NBza7jC8
2468	\N	664	38	58	teamdriver_773cyhi0
2469	\N	630	38	6	teamdriver_WyQvRU2l
2470	\N	658	38	166	teamdriver_tyvQS6IF
2471	\N	647	38	123	teamdriver_8mMqXmk7
2472	\N	657	38	123	teamdriver_rR1mnqMp
2473	\N	665	38	168	teamdriver_vL4LLBbn
2474	\N	597	38	157	teamdriver_f98hTi4K
2475	\N	652	38	58	teamdriver_OFVTjRVp
2476	\N	581	38	83	teamdriver_v9jTUTPU
2477	\N	622	38	83	teamdriver_nnqSn9Zj
2478	\N	631	38	157	teamdriver_s9Z8mib4
2479	\N	663	38	161	teamdriver_u0RUZh3o
2480	\N	661	38	165	teamdriver_RcwFXc57
2481	\N	648	38	166	teamdriver_K5lkVTHU
2482	\N	638	38	167	teamdriver_vH1AwhtJ
2483	\N	666	38	165	teamdriver_nGayt3Br
2484	\N	659	38	119	teamdriver_GdRRb70Y
2485	\N	650	38	169	teamdriver_6HrJ1MK8
2486	\N	667	38	161	teamdriver_Ruyca9zR
2487	\N	632	38	146	teamdriver_WZrhqHRs
2488	\N	599	38	146	teamdriver_6Ugtz1pD
2489	\N	668	38	161	teamdriver_N8y2LaN2
2490	\N	669	38	170	teamdriver_j2zePhOW
2491	\N	670	38	169	teamdriver_QXfvakgT
2492	\N	639	38	168	teamdriver_LAOQdduu
2493	\N	581	38	141	teamdriver_XdFa8Nl8
2494	\N	671	38	83	teamdriver_vkaAkbRv
2495	\N	613	39	117	teamdriver_yMIPtP44
2496	\N	655	39	6	teamdriver_Jm0ebY06
2497	\N	603	39	58	teamdriver_OM8VoUyW
2498	\N	631	39	157	teamdriver_wB5X0o8V
2499	\N	630	39	6	teamdriver_UdFyGvLE
2500	\N	664	39	58	teamdriver_b8dIVwAj
2501	\N	645	39	167	teamdriver_B51Iddt5
2502	\N	597	39	157	teamdriver_SZ6FUs6Q
2503	\N	615	39	146	teamdriver_UhgMEwY6
2504	\N	622	39	173	teamdriver_Mn05xvZu
2505	\N	647	39	123	teamdriver_deG9oAwS
2506	\N	672	39	165	teamdriver_yVeCGT24
2507	\N	650	39	169	teamdriver_6hUCAzXo
2508	\N	667	39	170	teamdriver_BVl3X9zW
2509	\N	657	39	168	teamdriver_aOou40X4
2510	\N	670	39	169	teamdriver_g8eXmSv8
2511	\N	652	39	117	teamdriver_HkxeLvaJ
2512	\N	599	39	146	teamdriver_GX9WQC4H
2513	\N	671	39	172	teamdriver_Do8pRIcc
2514	\N	619	39	141	teamdriver_1ujtnolc
2515	\N	661	39	167	teamdriver_BBSfq1qo
2516	\N	581	39	141	teamdriver_VAlNuv8O
2517	\N	659	39	119	teamdriver_owZFBJCU
2518	\N	666	39	165	teamdriver_RLvAoBVj
2519	\N	673	39	119	teamdriver_82QelqzH
2520	\N	674	39	172	teamdriver_hvg1Mz0w
2521	\N	675	39	123	teamdriver_Jwl4CwAF
2522	\N	632	39	166	teamdriver_JJkEdB2G
2523	\N	669	39	161	teamdriver_8ByGeNyC
2524	\N	676	39	166	teamdriver_He5aqSBS
2525	\N	663	39	171	teamdriver_CvPcecEY
2526	\N	656	39	165	teamdriver_gOgHjmOH
2527	\N	648	39	141	teamdriver_MEPHlLtY
2528	\N	644	39	141	teamdriver_inyDJSXO
2529	\N	677	39	169	teamdriver_hz0n7rr9
2530	\N	678	39	169	teamdriver_whr4nzop
2531	\N	619	40	6	teamdriver_qfNV9Wgw
2532	\N	613	40	117	teamdriver_8dDxt0Oh
2533	\N	673	40	119	teamdriver_pHOvElJK
2534	\N	679	40	167	teamdriver_kUTLtghT
2535	\N	631	40	157	teamdriver_c2A0Jk2C
2536	\N	661	40	167	teamdriver_0Zi8Nfpb
2537	\N	647	40	123	teamdriver_DKKa1puj
2538	\N	664	40	58	teamdriver_z5YxvlMs
2539	\N	680	40	146	teamdriver_YZNvw5zX
2540	\N	630	40	123	teamdriver_Rlpg8E9q
2541	\N	652	40	117	teamdriver_KkpGuepA
2542	\N	650	40	169	teamdriver_oeacgWym
2543	\N	622	40	171	teamdriver_BsNjGOYo
2544	\N	658	40	173	teamdriver_702BanDt
2545	\N	581	40	141	teamdriver_tIyOEiD1
2546	\N	597	40	157	teamdriver_mEykOjSE
2547	\N	676	40	166	teamdriver_9BUtQC68
2548	\N	648	40	83	teamdriver_H06TM4hk
2549	\N	659	40	119	teamdriver_cWX65OAu
2550	\N	603	40	58	teamdriver_AYcmyX0i
2551	\N	669	40	161	teamdriver_uBQ1D22g
2552	\N	671	40	83	teamdriver_rysKuchI
2553	\N	645	40	141	teamdriver_3KbeTCgU
2554	\N	656	40	165	teamdriver_rc7aHCvZ
2555	\N	655	40	6	teamdriver_mGqY6iDQ
2556	\N	672	40	165	teamdriver_mAnAG1ok
2557	\N	670	40	169	teamdriver_LqtM4cBp
2558	\N	599	40	146	teamdriver_EouHDGJX
2559	\N	681	40	172	teamdriver_Ln3rrKNz
2560	\N	639	40	170	teamdriver_5rj1ngS7
2561	\N	663	40	171	teamdriver_80oUM3bB
2562	\N	632	40	161	teamdriver_s2EYXTLb
2563	\N	682	40	173	teamdriver_InhBGf5P
2564	\N	678	40	170	teamdriver_OimVNAK3
2565	\N	683	40	168	teamdriver_ysGhhTPD
2566	\N	677	40	166	teamdriver_lSUkBpZq
2567	\N	615	40	174	teamdriver_e2UmCVQQ
2568	\N	684	40	174	teamdriver_z3EQ9Ho2
2569	\N	667	40	168	teamdriver_7Fy6jQBp
2570	\N	685	40	123	teamdriver_HbIxo7rU
2571	\N	686	40	167	teamdriver_Z35e83nK
2572	\N	687	40	169	teamdriver_5c2351ku
2573	\N	688	40	157	teamdriver_24shQtgA
2574	\N	670	40	168	teamdriver_eIWXM77a
2575	\N	630	40	169	teamdriver_HgcHuj13
2576	\N	679	40	123	teamdriver_FdwCCLqN
2577	\N	678	40	173	teamdriver_aY5Ss9bg
2578	\N	689	40	170	teamdriver_a9p2i3mD
2579	\N	674	40	172	teamdriver_mC1fvKbz
2580	\N	690	40	174	teamdriver_5vzariDx
2581	\N	681	40	173	teamdriver_SRpvP2AD
2582	\N	691	40	165	teamdriver_ZmKmsjKO
2583	\N	684	40	173	teamdriver_p9YkcfgQ
2584	\N	652	41	117	teamdriver_myXcL9XX
2585	\N	685	41	123	teamdriver_hwgYrQfP
2586	\N	645	41	141	teamdriver_5Sj8uwf5
2587	\N	603	41	167	teamdriver_l4dYGt7v
2588	\N	671	41	83	teamdriver_qcnNp38o
2589	\N	664	41	123	teamdriver_nz2QHk0I
2590	\N	656	41	165	teamdriver_babOyfRJ
2591	\N	687	41	169	teamdriver_LSJcEwfE
2592	\N	581	41	141	teamdriver_8CpnnbNY
2593	\N	630	41	157	teamdriver_MubgUKDy
2594	\N	661	41	167	teamdriver_fP8Ye45J
2595	\N	676	41	157	teamdriver_OaW9V5q6
2596	\N	639	41	172	teamdriver_InUxJhun
2597	\N	673	41	175	teamdriver_2K6Ix5wT
2598	\N	691	41	165	teamdriver_zRdnBluA
2599	\N	677	41	169	teamdriver_OvBcBvkN
2600	\N	619	41	6	teamdriver_XbMk3rq1
2601	\N	655	41	117	teamdriver_hYultHnE
2602	\N	681	41	83	teamdriver_Fjmk1HyA
2603	\N	680	41	161	teamdriver_UaE0CqfN
2604	\N	622	41	171	teamdriver_q0dyLPyX
2605	\N	613	41	6	teamdriver_IDLdrF3j
2606	\N	659	41	175	teamdriver_kqfM8XPE
2607	\N	631	41	58	teamdriver_5u4HhyBj
2608	\N	669	41	146	teamdriver_i45aF90F
2609	\N	688	41	58	teamdriver_ZfG5GbDr
2610	\N	650	41	146	teamdriver_wZSBDYoM
2611	\N	615	41	174	teamdriver_i3ehFvqr
2612	\N	692	41	171	teamdriver_lzIO3trp
2613	\N	690	41	174	teamdriver_0LSgjR2b
2614	\N	667	41	168	teamdriver_z7kF00Dp
2615	\N	670	41	168	teamdriver_eXzZItBh
2616	\N	693	41	172	teamdriver_P7qvambV
2617	\N	694	41	176	teamdriver_H04ylVDg
2618	\N	684	41	170	teamdriver_w3ggd4ou
2619	\N	663	41	157	teamdriver_zC3DNYN2
2620	\N	681	41	174	teamdriver_dMnQM5Sq
2621	\N	686	41	171	teamdriver_tflpxeFa
2622	\N	695	41	83	teamdriver_tHmzfKCt
2623	\N	591	41	176	teamdriver_7Yz9z378
2624	\N	639	41	167	teamdriver_QwJ4SsTO
2625	\N	679	41	58	teamdriver_LnZWR5nC
2626	\N	692	41	165	teamdriver_VIec8ACG
2627	\N	652	42	117	teamdriver_MsePwAMx
2628	\N	613	42	6	teamdriver_KbprZrQ7
2629	\N	603	42	167	teamdriver_sjonl4vr
2630	\N	671	42	123	teamdriver_Varqvngh
2631	\N	664	42	123	teamdriver_R022nKsb
2632	\N	677	42	169	teamdriver_aDe3KuSj
2633	\N	669	42	180	teamdriver_ThKVQOQl
2634	\N	667	42	168	teamdriver_m9PcMsIr
2635	\N	656	42	165	teamdriver_4XHmFqbc
2636	\N	684	42	177	teamdriver_dsmfATCB
2637	\N	648	42	83	teamdriver_9dhtC4Rr
2638	\N	685	42	6	teamdriver_DJAeokPD
2639	\N	696	42	58	teamdriver_qXQbxoUp
2640	\N	581	42	141	teamdriver_TlbQ73rl
2641	\N	639	42	167	teamdriver_VNNLRAe9
2642	\N	630	42	178	teamdriver_CO5cp7OQ
2643	\N	659	42	175	teamdriver_idvZPUji
2644	\N	645	42	146	teamdriver_miXyFoOb
2645	\N	655	42	117	teamdriver_rbS8zdO6
2646	\N	619	42	141	teamdriver_fnrbAZla
2647	\N	673	42	175	teamdriver_OZQ27vg5
2648	\N	697	42	83	teamdriver_QtYbV3x9
2649	\N	686	42	171	teamdriver_Cy3eVWYk
2650	\N	692	42	165	teamdriver_cpbEECiy
2651	\N	690	42	171	teamdriver_qC9tkt4j
2652	\N	687	42	169	teamdriver_ByNgsjUB
2653	\N	663	42	178	teamdriver_yVMwovVm
2654	\N	615	42	168	teamdriver_mfMpMT1e
2655	\N	698	42	146	teamdriver_dlEyALac
2656	\N	675	42	58	teamdriver_Fr3jpMCK
2657	\N	622	42	177	teamdriver_dfviaaRP
2658	\N	699	42	170	teamdriver_jiJfYmDl
2659	\N	680	42	179	teamdriver_xoRU2UVc
2660	\N	700	42	180	teamdriver_s8WcPaBX
2661	\N	687	42	81	teamdriver_ZAShNUua
2662	\N	677	42	81	teamdriver_L3Y4ZqlU
2663	\N	701	42	168	teamdriver_sDs7HMP9
2664	\N	615	42	178	teamdriver_fHb0spBp
2665	\N	679	42	58	teamdriver_J6K8nhUC
2666	\N	702	42	58	teamdriver_1OuJUlP8
2667	\N	703	42	177	teamdriver_46HyqYR5
2668	\N	703	42	167	teamdriver_IVhUTC6g
2669	\N	639	42	177	teamdriver_aFroB5hW
2670	\N	704	42	177	teamdriver_NgyQ5C4Z
2671	\N	667	42	179	teamdriver_9vW1alAO
2672	\N	680	42	168	teamdriver_SlH5b8c7
2673	\N	705	42	175	teamdriver_TuaBlshe
2674	\N	706	42	170	teamdriver_QQrHjJAG
2675	\N	692	42	6	teamdriver_xPowCQn5
2676	\N	639	42	165	teamdriver_gOfb8XFu
2677	\N	684	42	169	teamdriver_tXjF6oUu
2678	\N	619	43	141	teamdriver_7sFui7Ya
2679	\N	581	43	141	teamdriver_XmYhdhrf
2680	\N	652	43	117	teamdriver_XzplypsY
2681	\N	703	43	167	teamdriver_0zVNHRwE
2682	\N	655	43	117	teamdriver_lMZY5xeU
2683	\N	679	43	58	teamdriver_SbOzuzYJ
2684	\N	698	43	146	teamdriver_om7UW3iJ
2685	\N	677	43	178	teamdriver_WtTYLd5M
2686	\N	696	43	58	teamdriver_4eC6Ojxg
2687	\N	630	43	178	teamdriver_nUlKcCCk
2688	\N	673	43	177	teamdriver_tI8IOXyZ
2689	\N	707	43	169	teamdriver_DlxhD3c7
2690	\N	700	43	83	teamdriver_TeGxGLn8
2691	\N	680	43	123	teamdriver_V3DnFYNh
2692	\N	645	43	146	teamdriver_df7PYI8N
2693	\N	656	43	171	teamdriver_MtTIpcIO
2694	\N	692	43	165	teamdriver_VxvsvlFZ
2695	\N	690	43	171	teamdriver_zIKnAuF5
2696	\N	708	43	165	teamdriver_8YRdRlDt
2697	\N	622	43	123	teamdriver_c3WXcDcy
2698	\N	685	43	6	teamdriver_nsw19IRD
2699	\N	659	43	6	teamdriver_vuRgTuo6
2700	\N	667	43	179	teamdriver_cMrdwuku
2701	\N	705	43	119	teamdriver_FZ143W89
2702	\N	684	43	169	teamdriver_pVWVpx3v
2703	\N	648	43	167	teamdriver_nQQCeOic
2704	\N	709	43	119	teamdriver_bHTWaIPB
2705	\N	710	43	179	teamdriver_bYC225pj
2706	\N	671	43	177	teamdriver_TZJGT6NY
2707	\N	711	43	83	teamdriver_a7hr7XIk
2708	\N	712	43	83	teamdriver_e3jhbtgE
2709	\N	639	43	181	teamdriver_XYcp8z38
2710	\N	713	43	181	teamdriver_WTOee4Zw
2711	\N	704	43	165	teamdriver_iueLQGYe
2712	\N	700	43	179	teamdriver_gDZDijJI
2713	\N	714	43	119	teamdriver_0DBsFQPk
2714	\N	669	43	6	teamdriver_IteVtcug
2715	\N	608	43	119	teamdriver_wYzeWyxq
2716	\N	613	44	141	teamdriver_nZBz9Yo0
2717	\N	652	44	117	teamdriver_ML8l48XQ
2718	\N	697	44	146	teamdriver_qBC9psrh
2719	\N	708	44	165	teamdriver_wP4sXNU6
2720	\N	690	44	182	teamdriver_Mhf75NEX
2721	\N	655	44	6	teamdriver_UK7O0oyp
2722	\N	631	44	178	teamdriver_Z75yAka2
2723	\N	648	44	146	teamdriver_tv10xAAL
2724	\N	630	44	81	teamdriver_k0QGT083
2725	\N	698	44	169	teamdriver_zHN9cWlt
2726	\N	581	44	167	teamdriver_Jqr7J89k
2727	\N	703	44	167	teamdriver_CNSFNmaW
2728	\N	679	44	58	teamdriver_JBybBlq5
2729	\N	705	44	182	teamdriver_CWb7k8ea
2730	\N	715	44	177	teamdriver_yvmNCB8C
2731	\N	685	44	6	teamdriver_sfii4woP
2732	\N	650	44	169	teamdriver_RdYdZDkQ
2733	\N	701	44	165	teamdriver_pJjvvEQI
2734	\N	677	44	178	teamdriver_n2epvFOa
2735	\N	716	44	81	teamdriver_zJ1tuNxW
2736	\N	712	44	141	teamdriver_6VA2lIY1
2737	\N	704	44	58	teamdriver_yMN0GiG5
2738	\N	717	44	117	teamdriver_slDbzWoi
2739	\N	659	44	177	teamdriver_iSZQp0Pr
2740	\N	707	44	123	teamdriver_scWvYLwk
2741	\N	622	44	123	teamdriver_0SVp9apA
2742	\N	645	44	177	teamdriver_aq5nlmiz
2743	\N	656	44	165	teamdriver_JkiNbSoF
2744	\N	718	44	58	teamdriver_WrhSfXRA
2745	\N	719	44	177	teamdriver_eQ8oyBDX
2746	\N	696	44	117	teamdriver_4ySVqvqm
2747	\N	714	44	177	teamdriver_AgoiLriF
2748	\N	720	44	177	teamdriver_VzHK4shc
2749	\N	721	44	169	teamdriver_69y4KbF5
2750	\N	722	44	165	teamdriver_XCtL82mt
2751	\N	703	45	167	teamdriver_U2PGB1q8
2752	\N	712	45	141	teamdriver_oWKuHM1i
2753	\N	685	45	6	teamdriver_UyPj5iqK
2754	\N	715	45	177	teamdriver_ccW2rkeS
2755	\N	707	45	123	teamdriver_hyMgFuLG
2756	\N	705	45	182	teamdriver_9psQH8iN
2757	\N	679	45	58	teamdriver_03HLMtMk
2758	\N	656	45	165	teamdriver_oKsHm4hF
2759	\N	698	45	169	teamdriver_VUlcXWvl
2760	\N	718	45	58	teamdriver_d0UZKF6a
2761	\N	723	45	146	teamdriver_DUX6DX1o
2762	\N	695	45	184	teamdriver_rvkg35jf
2763	\N	652	45	141	teamdriver_kQ5R4b38
2764	\N	648	45	117	teamdriver_jsZwS46X
2765	\N	720	45	177	teamdriver_mtxFIkG8
2766	\N	724	45	167	teamdriver_PpQZHeSZ
2767	\N	687	45	146	teamdriver_SwUBGJJA
2768	\N	697	45	123	teamdriver_jzyUIJwr
2769	\N	708	45	178	teamdriver_dmkxw38t
2770	\N	725	45	182	teamdriver_7xF1D0wo
2771	\N	696	45	117	teamdriver_bJRMTymC
2772	\N	630	45	165	teamdriver_v6uz8FHT
2773	\N	692	45	178	teamdriver_yQMTIHyM
2774	\N	655	45	6	teamdriver_mfKDU4wd
2775	\N	726	45	169	teamdriver_4I6KFtBO
2776	\N	684	45	183	teamdriver_XXAlbbcZ
2777	\N	727	45	184	teamdriver_QuLMJCxq
2778	\N	709	45	183	teamdriver_ReREE6yK
2779	\N	677	45	177	teamdriver_VD4ti9vQ
2780	\N	669	45	6	teamdriver_scyj0d6b
2781	\N	622	45	177	teamdriver_O237xBSS
2782	\N	690	45	167	teamdriver_yzATxT4F
2783	\N	704	45	58	teamdriver_S9P61lY2
2784	\N	728	45	141	teamdriver_WDSmltPN
2785	\N	729	45	184	teamdriver_3GsPcV5n
2786	\N	622	45	182	teamdriver_00Nu5m8h
2787	\N	722	45	184	teamdriver_cIg2bjMi
2788	\N	619	45	141	teamdriver_zmkMOT7i
2789	\N	650	45	117	teamdriver_cSKoH72t
2790	\N	730	45	58	teamdriver_ayJDdF0A
2791	\N	650	45	169	teamdriver_mpCNVBmR
2792	\N	670	45	169	teamdriver_4X9jfQm4
2793	\N	679	45	146	teamdriver_cY73TZpC
2794	\N	687	45	58	teamdriver_yiZq6MSl
2795	\N	731	45	184	teamdriver_x5QjP79A
2796	\N	732	45	169	teamdriver_gSGVbgE0
2797	\N	733	45	58	teamdriver_A5lFf97n
2798	\N	734	45	146	teamdriver_FPj2hpsK
2799	\N	679	45	167	teamdriver_qTVeYdgC
2800	\N	735	45	184	teamdriver_ZZHIeewR
2801	\N	690	45	182	teamdriver_KdknmFnK
2802	\N	736	45	169	teamdriver_RcT8Mrnn
2803	\N	703	46	167	teamdriver_wvufm2uS
2804	\N	728	46	141	teamdriver_rxGd7Ruz
2805	\N	655	46	6	teamdriver_UVRvfVPm
2806	\N	696	46	117	teamdriver_oPhR192K
2807	\N	685	46	6	teamdriver_DgaN9zT3
2808	\N	697	46	117	teamdriver_lTjc63Pe
2809	\N	733	46	123	teamdriver_Yequ5FIw
2810	\N	677	46	146	teamdriver_WFpN49XQ
2811	\N	729	46	183	teamdriver_6dS8sy1h
2812	\N	737	46	185	teamdriver_Uwm7l3Xc
2813	\N	692	46	178	teamdriver_sIzlhfhf
2814	\N	735	46	178	teamdriver_OX4zjeaE
2815	\N	716	46	165	teamdriver_NHMVh5i3
2816	\N	639	46	185	teamdriver_69yLN1vU
2817	\N	705	46	182	teamdriver_mA32b92n
2818	\N	712	46	141	teamdriver_0XicgbPO
2819	\N	679	46	167	teamdriver_XKF1XfA5
2820	\N	684	46	183	teamdriver_0kpnxz5t
2821	\N	715	46	177	teamdriver_6TFyH3kd
2822	\N	724	46	184	teamdriver_kRGRO6t4
2823	\N	707	46	123	teamdriver_x1o3986n
2824	\N	720	46	177	teamdriver_h3m6q22k
2825	\N	731	46	184	teamdriver_olG6zkb0
2826	\N	725	46	182	teamdriver_E2rcYYSR
2827	\N	723	46	146	teamdriver_GgY91K0a
2828	\N	656	46	165	teamdriver_mk4H9K1u
2829	\N	619	46	117	teamdriver_4lkrdOtO
2830	\N	648	46	146	teamdriver_erm7vTQ6
2831	\N	738	46	182	teamdriver_dtMHFuR0
2832	\N	739	46	178	teamdriver_PrTKyw0G
2833	\N	740	46	183	teamdriver_mXv91Q81
2834	\N	718	46	165	teamdriver_5SdImmss
2835	\N	736	46	183	teamdriver_jKSpwLrh
2836	\N	667	46	123	teamdriver_Bg4NodBL
2837	\N	741	46	117	teamdriver_Y0TVa8jR
2838	\N	712	47	141	teamdriver_1dSPBmhC
2839	\N	742	47	141	teamdriver_fmY44VJH
2840	\N	720	47	6	teamdriver_3kZB5xx9
2841	\N	655	47	167	teamdriver_JHiJWupt
2842	\N	696	47	117	teamdriver_J7jLqfoc
2843	\N	733	47	123	teamdriver_Iy7N4en3
2844	\N	723	47	146	teamdriver_pFXco3Lu
2845	\N	725	47	182	teamdriver_UUOna9Ia
2846	\N	743	47	178	teamdriver_BXldmwjH
2847	\N	737	47	146	teamdriver_KvDn2wGK
2848	\N	707	47	123	teamdriver_FdLTXMSA
2849	\N	718	47	165	teamdriver_cgSi9gbI
2850	\N	703	47	6	teamdriver_AYpq4OLE
2851	\N	744	47	165	teamdriver_7wGZknBU
2852	\N	715	47	177	teamdriver_JsGbwtTj
2853	\N	728	47	117	teamdriver_GmJyn5Fr
2854	\N	724	47	178	teamdriver_iLnNvmdc
2855	\N	685	47	167	teamdriver_X1TeZDbv
2856	\N	648	47	177	teamdriver_b8tWNkwt
2857	\N	679	47	182	teamdriver_jYwQUoV5
2858	\N	716	47	185	teamdriver_YdlyDoeo
2859	\N	729	47	185	teamdriver_UlGPqoN6
2860	\N	745	47	165	teamdriver_YnOZMawx
2861	\N	740	47	165	teamdriver_RjsnSSvv
2862	\N	728	48	117	teamdriver_Pf8Lyk8f
2863	\N	703	48	6	teamdriver_cusqAx89
2864	\N	696	48	117	teamdriver_ML5xel6B
2865	\N	655	48	167	teamdriver_ahqCZPXc
2866	\N	723	48	187	teamdriver_bEZs89AQ
2867	\N	669	48	182	teamdriver_VdhjhR4B
2868	\N	746	48	187	teamdriver_bKTZYqgF
2869	\N	725	48	141	teamdriver_jA6qkZfp
2870	\N	747	48	165	teamdriver_G7CLvebD
2871	\N	737	48	157	teamdriver_0CMsXJlK
2872	\N	715	48	186	teamdriver_oCq4WYWb
2873	\N	733	48	123	teamdriver_GQgX9GC5
2874	\N	741	48	186	teamdriver_DBjK5dHS
2875	\N	685	48	167	teamdriver_OSNdSMtq
2876	\N	707	48	165	teamdriver_nQhYCb57
2877	\N	744	48	177	teamdriver_akX8sgNX
2878	\N	724	48	123	teamdriver_29ueRLE2
2879	\N	748	48	177	teamdriver_K4S2N4YD
2880	\N	742	48	141	teamdriver_TlRHF9AN
2881	\N	720	48	6	teamdriver_PE6Gi07a
2882	\N	679	48	182	teamdriver_aBkDWrZo
2883	\N	712	48	157	teamdriver_p0azAsIq
2884	\N	749	48	81	teamdriver_4uXi3BoQ
2885	\N	743	48	81	teamdriver_UJ0AM2dL
2886	\N	692	48	182	teamdriver_H8zTKVVv
2887	\N	750	48	167	teamdriver_QXzt8Aau
2888	\N	747	48	187	teamdriver_TKW02kSU
2889	\N	751	48	182	teamdriver_aSH9W7fd
2890	\N	745	48	165	teamdriver_oltdHMt8
2891	\N	696	49	117	teamdriver_ztfKfA6o
2892	\N	728	49	117	teamdriver_u675ukxk
2893	\N	725	49	141	teamdriver_kN5uQE4X
2894	\N	720	49	6	teamdriver_0ByGkxZ4
2895	\N	742	49	141	teamdriver_DOy2h1P9
2896	\N	679	49	182	teamdriver_j1SbSoY0
2897	\N	750	49	167	teamdriver_pxAauAu8
2898	\N	712	49	177	teamdriver_Cyl3guT4
2899	\N	723	49	187	teamdriver_OnTB5nqb
2900	\N	744	49	167	teamdriver_C9iWgVcb
2901	\N	685	49	182	teamdriver_oyG5vVdh
2902	\N	747	49	187	teamdriver_qh7vR3gx
2903	\N	743	49	123	teamdriver_QjH4W1z6
2904	\N	733	49	157	teamdriver_13hluMI3
2905	\N	752	49	165	teamdriver_epJLr86t
2906	\N	746	49	165	teamdriver_amnhNQ8G
2907	\N	703	49	6	teamdriver_YzWx6P8e
2908	\N	737	49	157	teamdriver_C7P4aVrx
2909	\N	748	49	177	teamdriver_a7HEHoHb
2910	\N	741	49	186	teamdriver_Hh7cDE5p
2911	\N	753	49	123	teamdriver_QYGYLCfu
2912	\N	715	49	186	teamdriver_51shROwm
2913	\N	724	49	186	teamdriver_GhaRUM0v
2914	\N	720	50	6	teamdriver_82oOuSF8
2915	\N	725	50	177	teamdriver_nJyQ3OnT
2916	\N	748	50	141	teamdriver_fZS23afd
2917	\N	744	50	167	teamdriver_vebxZz5Q
2918	\N	715	50	186	teamdriver_sh5IIy6W
2919	\N	754	50	157	teamdriver_d8kSabxo
2920	\N	753	50	157	teamdriver_BiU02Tf1
2921	\N	703	50	6	teamdriver_BGhnyJvm
2922	\N	755	50	188	teamdriver_vqX2W4IQ
2923	\N	716	50	165	teamdriver_N2jnkSt8
2924	\N	750	50	167	teamdriver_2Ah2JcBi
2925	\N	737	50	182	teamdriver_Kmo3wypv
2926	\N	756	50	165	teamdriver_do3xUV3r
2927	\N	747	50	187	teamdriver_Dh4RnuY4
2928	\N	723	50	187	teamdriver_JdTEe6Rm
2929	\N	696	50	117	teamdriver_BncNvHNJ
2930	\N	704	50	141	teamdriver_cynGOcyN
2931	\N	728	50	117	teamdriver_ogTbuqGr
2932	\N	742	50	188	teamdriver_zQIGuwKW
2933	\N	712	50	177	teamdriver_7EJ0ieg2
2934	\N	685	50	182	teamdriver_AIHpl45I
2935	\N	679	50	186	teamdriver_xfIeIS0w
2936	\N	757	50	165	teamdriver_qpSRjStY
2937	\N	733	50	188	teamdriver_SCOTdHIS
2938	\N	733	50	6	teamdriver_jBcm941q
2939	\N	703	51	6	teamdriver_qUOQypHy
2940	\N	715	51	6	teamdriver_onxFewUQ
2941	\N	748	51	141	teamdriver_QBj060o7
2942	\N	742	51	188	teamdriver_2cJc63p7
2943	\N	744	51	167	teamdriver_IJmgbjio
2944	\N	755	51	188	teamdriver_37scU6Kq
2945	\N	750	51	167	teamdriver_SOhS83Dz
2946	\N	756	51	165	teamdriver_OcNYqgHY
2947	\N	758	51	187	teamdriver_GWADUlLm
2948	\N	733	51	182	teamdriver_d8DC68Uv
2949	\N	759	51	141	teamdriver_9829iZdh
2950	\N	737	51	182	teamdriver_d6Qcc1zO
2951	\N	760	51	165	teamdriver_64O6piGn
2952	\N	725	51	177	teamdriver_LrCYT1Jz
2953	\N	747	51	177	teamdriver_PXmtVCCT
2954	\N	685	51	187	teamdriver_0TtYEanO
2955	\N	696	51	117	teamdriver_r7HEZ6HN
2956	\N	724	51	157	teamdriver_LyoGTqlD
2957	\N	728	51	117	teamdriver_MrvZqL1f
2958	\N	754	51	157	teamdriver_tskXsQ8M
2959	\N	720	51	189	teamdriver_5KXCTZgp
2960	\N	679	51	189	teamdriver_VG6ycvEr
2961	\N	761	51	189	teamdriver_dnSo6yii
2962	\N	703	52	6	teamdriver_kbaMuX6p
2963	\N	728	52	117	teamdriver_0Obr5QNb
2964	\N	715	52	6	teamdriver_tvXbo7Ud
2965	\N	758	52	182	teamdriver_Ml1qRJaK
2966	\N	725	52	177	teamdriver_Am6pphDw
2967	\N	762	52	182	teamdriver_5q0u7CF7
2968	\N	723	52	188	teamdriver_MLXsQKQH
2969	\N	761	52	189	teamdriver_xTs9biV1
2970	\N	685	52	187	teamdriver_OFuOYV8Y
2971	\N	724	52	157	teamdriver_pGm07iEB
2972	\N	720	52	189	teamdriver_8pQUpbs1
2973	\N	763	52	165	teamdriver_QDvHOOfi
2974	\N	744	52	167	teamdriver_yYCCoRTb
2975	\N	759	52	167	teamdriver_XqpiDznk
2976	\N	764	52	141	teamdriver_TruRWhhe
2977	\N	747	52	177	teamdriver_VACBVBiD
2978	\N	696	52	117	teamdriver_0mriWtAQ
2979	\N	748	52	141	teamdriver_hNbvVSoM
2980	\N	742	52	188	teamdriver_e6KTsiFl
2981	\N	745	52	165	teamdriver_7DgDrxCn
2982	\N	765	52	157	teamdriver_7j2uSB5k
2983	\N	760	52	187	teamdriver_gvhsiCcv
2984	\N	761	52	187	teamdriver_e8Y0T4sf
2985	\N	754	52	189	teamdriver_wP0RutFD
2986	\N	755	52	177	teamdriver_B6bH4eZM
2987	\N	685	52	177	teamdriver_dNYUL5Eq
2988	\N	725	52	187	teamdriver_yXUU0WuS
2989	\N	766	52	187	teamdriver_MefuKvvl
2990	\N	767	52	165	teamdriver_8tJQ0wYY
2991	\N	703	53	6	teamdriver_4gok59MI
2992	\N	764	53	141	teamdriver_ycvN5f5R
2993	\N	762	53	117	teamdriver_6ehdSrcX
2994	\N	720	53	189	teamdriver_fYH6rJuN
2995	\N	768	53	165	teamdriver_DpyQjsMT
2996	\N	733	53	190	teamdriver_eVXvVazb
2997	\N	767	53	165	teamdriver_m52OvB8P
2998	\N	754	53	189	teamdriver_sEhfPteM
2999	\N	728	53	117	teamdriver_GNIX2Gqm
3000	\N	742	53	188	teamdriver_rExCAspi
3001	\N	725	53	157	teamdriver_7ohcTaHC
3002	\N	765	53	157	teamdriver_XrL3cawb
3003	\N	769	53	177	teamdriver_Aks0aHlf
3004	\N	747	53	152	teamdriver_SCkIUxCZ
3005	\N	715	53	6	teamdriver_Uh56K29s
3006	\N	748	53	141	teamdriver_6O3HPJiF
3007	\N	744	53	177	teamdriver_itfOkyd1
3008	\N	770	53	182	teamdriver_NA3WlWO6
3009	\N	758	53	182	teamdriver_jIAISfSr
3010	\N	759	53	152	teamdriver_1v6H9OV9
3011	\N	723	53	188	teamdriver_Lvs77VqP
3012	\N	771	53	190	teamdriver_fjXKZHFf
3013	\N	772	53	165	teamdriver_ofBX8VsX
3014	\N	725	53	182	teamdriver_3jdV0SWl
3015	\N	728	54	117	teamdriver_PYQoKF3Q
3016	\N	764	54	141	teamdriver_YCcYFu8D
3017	\N	762	54	117	teamdriver_WvnLT7hF
3018	\N	703	54	6	teamdriver_5OORFUbP
3019	\N	747	54	152	teamdriver_ZscO0q3V
3020	\N	725	54	182	teamdriver_XqgbmFWW
3021	\N	763	54	152	teamdriver_7A1sCXtH
3022	\N	748	54	141	teamdriver_wX2bq2Wa
3023	\N	742	54	188	teamdriver_mvxg9qAE
3024	\N	759	54	188	teamdriver_oSOWIt5n
3025	\N	724	54	165	teamdriver_bWYpZXxI
3026	\N	744	54	177	teamdriver_Jca20MEi
3027	\N	773	54	189	teamdriver_Vp2wARS5
3028	\N	723	54	190	teamdriver_tvMpB9NR
3029	\N	758	54	182	teamdriver_U2D1FBnQ
3030	\N	774	54	165	teamdriver_kjv499MD
3031	\N	768	54	189	teamdriver_OA4HeSP6
3032	\N	775	54	190	teamdriver_VdAQBqDh
3033	\N	776	54	177	teamdriver_8EI2RBOz
3034	\N	715	54	6	teamdriver_uDAM9pZP
3035	\N	777	54	165	teamdriver_jXoF2nqv
3036	\N	774	54	189	teamdriver_FpJYSeRw
3037	\N	778	54	177	teamdriver_d8RaILle
3038	\N	756	54	141	teamdriver_061EIw2M
3039	\N	769	54	188	teamdriver_18bEp9ei
3040	\N	703	55	6	teamdriver_OsrKdYcb
3041	\N	715	55	6	teamdriver_0FiXxie2
3042	\N	763	55	152	teamdriver_YXIsdVd3
3043	\N	748	55	141	teamdriver_IGCghbti
3044	\N	764	55	141	teamdriver_F5W08vSC
3045	\N	759	55	188	teamdriver_E8lTJYyW
3046	\N	747	55	152	teamdriver_IundMpAi
3047	\N	728	55	117	teamdriver_eWidZk7r
3048	\N	769	55	188	teamdriver_zWQXAsMI
3049	\N	744	55	182	teamdriver_ZyTUBAei
3050	\N	779	55	189	teamdriver_tEYrEtQn
3051	\N	775	55	190	teamdriver_EoWruxuZ
3052	\N	723	55	190	teamdriver_Ui0Bsthq
3053	\N	780	55	177	teamdriver_fk0DcF4c
3054	\N	770	55	182	teamdriver_sNxPb5p8
3055	\N	758	55	177	teamdriver_bXOifz9w
3056	\N	781	55	165	teamdriver_liReliZq
3057	\N	768	55	189	teamdriver_Y5VfcR81
3058	\N	778	55	165	teamdriver_KilNiVQW
3059	\N	762	55	117	teamdriver_BCO6w7Eb
3060	\N	782	55	177	teamdriver_C1a3AUGP
3061	\N	756	55	141	teamdriver_i3Oeo882
3062	\N	773	55	141	teamdriver_Qn00uus4
3063	\N	755	55	190	teamdriver_Pea9Pk6k
3064	\N	742	55	152	teamdriver_paze9Xv2
3065	\N	747	55	190	teamdriver_s1Z81IvX
3066	\N	744	56	152	teamdriver_Q3nNNraH
3067	\N	715	56	6	teamdriver_7SiHJSBs
3068	\N	763	56	152	teamdriver_OR2m6AcN
3069	\N	728	56	191	teamdriver_Vr3AP6RP
3070	\N	768	56	141	teamdriver_k1UvdSQ0
3071	\N	764	56	117	teamdriver_8Xo6QdIV
3072	\N	779	56	191	teamdriver_PSQtHtWn
3073	\N	762	56	117	teamdriver_i2OyCZCU
3074	\N	747	56	190	teamdriver_luDTTfnx
3075	\N	770	56	182	teamdriver_xhZJ8e35
3076	\N	759	56	188	teamdriver_KFG0A8th
3077	\N	748	56	190	teamdriver_MSfAlrPX
3078	\N	742	56	182	teamdriver_kTPjJy4U
3079	\N	769	56	188	teamdriver_5xE9XYdM
3080	\N	783	56	177	teamdriver_wzU5ulUc
3081	\N	784	56	177	teamdriver_1Ce1fZ63
3082	\N	785	56	165	teamdriver_FffPZKUw
3083	\N	703	56	6	teamdriver_jRXePo8G
3084	\N	758	56	141	teamdriver_t0UO8FaE
3085	\N	786	56	165	teamdriver_AxP2iGe9
3086	\N	772	56	188	teamdriver_n2znFjF5
3087	\N	754	56	117	teamdriver_ryhgjmnx
3088	\N	750	56	117	teamdriver_8ZlSqOqy
3089	\N	787	56	191	teamdriver_GdmE2KrW
3090	\N	755	56	190	teamdriver_O10RJo0i
3091	\N	788	56	165	teamdriver_UidLXuaK
3092	\N	773	56	141	teamdriver_vEAWgkcP
3093	\N	763	57	152	teamdriver_GMHynGMS
3094	\N	703	57	6	teamdriver_biCjfFg0
3095	\N	762	57	117	teamdriver_XS8s370I
3096	\N	759	57	98	teamdriver_8YTpMKXR
3097	\N	764	57	117	teamdriver_UmsoO8CR
3098	\N	768	57	141	teamdriver_cZmmCFp1
3099	\N	789	57	141	teamdriver_U8MyPqL5
3100	\N	779	57	191	teamdriver_BeJ9vlDE
3101	\N	770	57	6	teamdriver_Q7BhWVCj
3102	\N	728	57	191	teamdriver_HNep7PVl
3103	\N	787	57	195	teamdriver_tLMFfnGP
3104	\N	758	57	192	teamdriver_k1K3qrIL
3105	\N	790	57	195	teamdriver_KL4Wh4LE
3106	\N	748	57	190	teamdriver_FHdayIVZ
3107	\N	715	57	98	teamdriver_9QOGMckM
3108	\N	747	57	190	teamdriver_IpBpuMl0
3109	\N	784	57	194	teamdriver_CWkjX1Tf
3110	\N	769	57	193	teamdriver_0Ks98mz5
3111	\N	791	57	193	teamdriver_TjFq4k0N
3112	\N	742	57	192	teamdriver_GPVCvTgx
3113	\N	744	57	152	teamdriver_GSGEWroI
3114	\N	786	57	194	teamdriver_gY6EofdB
3115	\N	792	57	193	teamdriver_lIseXIHz
3116	\N	754	57	117	teamdriver_Ga7WAYWT
3117	\N	793	57	193	teamdriver_RlCH17ck
3118	\N	794	57	192	teamdriver_BeLIDZxW
3119	\N	786	57	196	teamdriver_wDu4dMZu
3120	\N	784	57	196	teamdriver_iMtgWWnG
3121	\N	788	57	191	teamdriver_bVDJugb4
3122	\N	762	58	6	teamdriver_vhLaRVdt
3123	\N	763	58	117	teamdriver_i7xHV6HB
3124	\N	795	58	117	teamdriver_4kJQO5o0
3125	\N	758	58	192	teamdriver_KpfVN7ID
3126	\N	744	58	152	teamdriver_G2wD5d7k
3127	\N	770	58	6	teamdriver_hqtdx9QP
3128	\N	789	58	141	teamdriver_8q3LTG3V
3129	\N	748	58	190	teamdriver_qZn8cBax
3130	\N	747	58	190	teamdriver_BSHFnk4c
3131	\N	796	58	152	teamdriver_lCLZmGaD
3132	\N	715	58	98	teamdriver_jKQidore
3133	\N	769	58	193	teamdriver_xgFc5VdF
3134	\N	768	58	191	teamdriver_OAdjFWLH
3135	\N	787	58	195	teamdriver_RbziHn7x
3136	\N	759	58	98	teamdriver_dwQDDpDI
3137	\N	772	58	193	teamdriver_6IJz0mQi
3138	\N	797	58	197	teamdriver_Biodxih5
3139	\N	750	58	141	teamdriver_rXGg2MQq
3140	\N	728	58	191	teamdriver_bqLTZi6P
3141	\N	794	58	192	teamdriver_ksyyBnHA
3142	\N	790	58	195	teamdriver_nwiTcFCy
3143	\N	786	58	197	teamdriver_WRg0YqBa
3144	\N	798	58	192	teamdriver_NKD2qjpA
3145	\N	799	58	197	teamdriver_8F05JF53
3146	\N	798	58	195	teamdriver_NSsXwefJ
3147	\N	793	58	197	teamdriver_ZDFt3l70
3148	\N	800	58	141	teamdriver_d4r6V4jl
3149	\N	795	59	117	teamdriver_POiUO6SN
3150	\N	758	59	192	teamdriver_1grmtxPk
3151	\N	789	59	141	teamdriver_ENjuBXt9
3152	\N	763	59	152	teamdriver_IYhDj6Go
3153	\N	796	59	117	teamdriver_TILmx098
3154	\N	800	59	141	teamdriver_nYDaPa15
3155	\N	801	59	195	teamdriver_3ApDM03m
3156	\N	762	59	6	teamdriver_MO75evgh
3157	\N	794	59	192	teamdriver_7yVJhVqx
3158	\N	782	59	190	teamdriver_AvdSkmVH
3159	\N	769	59	193	teamdriver_gyNP9dRu
3160	\N	802	59	152	teamdriver_NbPeSg9t
3161	\N	770	59	6	teamdriver_rZFXs162
3162	\N	728	59	191	teamdriver_rw7osDAy
3163	\N	747	59	190	teamdriver_J5OwAvH8
3164	\N	797	59	198	teamdriver_z2kqpDpe
3165	\N	768	59	191	teamdriver_evy5Nz8v
3166	\N	759	59	98	teamdriver_IO4fuVko
3167	\N	772	59	193	teamdriver_KEPowW5d
3168	\N	798	59	195	teamdriver_715TxUtn
3169	\N	744	59	198	teamdriver_xa4UqebQ
3170	\N	715	59	98	teamdriver_FDBWE2FC
3171	\N	759	60	199	teamdriver_tmAEe5zc
3172	\N	715	60	199	teamdriver_hmOYrm6K
3173	\N	747	60	190	teamdriver_pwTlMAXE
3174	\N	782	60	190	teamdriver_8Fu8JSPv
3175	\N	763	60	152	teamdriver_la6Jgbng
3176	\N	789	60	141	teamdriver_aDIMXcFT
3177	\N	803	60	195	teamdriver_BTXGIGYp
3178	\N	801	60	195	teamdriver_vZLP6Xtm
3179	\N	797	60	198	teamdriver_btp57HmS
3180	\N	758	60	192	teamdriver_byrVn4af
3181	\N	744	60	198	teamdriver_gEtnkCU7
3182	\N	768	60	191	teamdriver_3H8cECOR
3183	\N	798	60	191	teamdriver_JRP9XKkm
3184	\N	794	60	192	teamdriver_ee2eRCym
3185	\N	762	60	6	teamdriver_U9wXa8LB
3186	\N	770	60	6	teamdriver_FBgwEoWn
3187	\N	802	60	152	teamdriver_gvotvIaS
3188	\N	800	60	141	teamdriver_kruSuWNR
3189	\N	796	60	117	teamdriver_XnAVhyvC
3190	\N	795	60	117	teamdriver_Jp2z1Q2H
3191	\N	804	60	195	teamdriver_kw6m0snK
3192	\N	805	60	152	teamdriver_Fn03IUoF
3193	\N	716	60	6	teamdriver_DliNUBvr
3194	\N	744	60	6	teamdriver_AtoQkZpJ
3195	\N	787	60	198	teamdriver_5dk31NP0
3196	\N	806	60	190	teamdriver_acyregc2
3197	\N	763	61	6	teamdriver_QymPZSfF
3198	\N	770	61	6	teamdriver_vonERKi7
3199	\N	795	61	117	teamdriver_e8xynzDW
3200	\N	798	61	191	teamdriver_NyyMJxNQ
3201	\N	789	61	48	teamdriver_qoeW4xQJ
3202	\N	703	61	48	teamdriver_G6ny2Y9F
3203	\N	759	61	117	teamdriver_Qoq9e2Zu
3204	\N	768	61	191	teamdriver_4W2LSrFA
3205	\N	787	61	198	teamdriver_nxO1iL7D
3206	\N	715	61	141	teamdriver_tQ9zuzJP
3207	\N	794	61	152	teamdriver_eeipSrJa
3208	\N	797	61	198	teamdriver_jbhK3HNf
3209	\N	804	61	195	teamdriver_8wqOt7OH
3210	\N	807	61	141	teamdriver_EtnWOFTL
3211	\N	796	61	202	teamdriver_oJGwnwQP
3212	\N	803	61	195	teamdriver_D0ju6PH6
3213	\N	747	61	202	teamdriver_3dDej8FY
3214	\N	754	61	182	teamdriver_ocJyNP1r
3215	\N	808	61	200	teamdriver_xSTCXJtD
3216	\N	782	61	201	teamdriver_1aL0SbbT
3217	\N	809	61	152	teamdriver_0yfNqXa2
3218	\N	806	61	182	teamdriver_gERrtlMu
3219	\N	810	61	201	teamdriver_xE4zE96l
3220	\N	811	61	200	teamdriver_8x6y7EYn
3221	\N	793	61	200	teamdriver_RygPC5lZ
3222	\N	758	61	182	teamdriver_k8qmAGtw
3223	\N	779	61	200	teamdriver_lFmSRgLm
3224	\N	798	62	191	teamdriver_f3FC2GOu
3225	\N	795	62	117	teamdriver_3iip8fOI
3226	\N	809	62	152	teamdriver_fm43mO7E
3227	\N	763	62	6	teamdriver_IZie4WJp
3228	\N	768	62	191	teamdriver_2fpPfUyF
3229	\N	759	62	117	teamdriver_HYJQLnP0
3230	\N	770	62	6	teamdriver_cGWuO7xY
3231	\N	803	62	195	teamdriver_pIwpFWeH
3232	\N	797	62	198	teamdriver_O5pO7I11
3233	\N	812	62	198	teamdriver_y1IKC0bN
3234	\N	804	62	195	teamdriver_JKaS9Cke
3235	\N	758	62	152	teamdriver_fF8bX10p
3236	\N	747	62	202	teamdriver_aENPS2nm
3237	\N	813	62	201	teamdriver_hoyufjiD
3238	\N	782	62	201	teamdriver_VRCOQEAu
3239	\N	715	62	141	teamdriver_xO0ayQfp
3240	\N	789	62	48	teamdriver_f3r4I8sh
3241	\N	796	62	202	teamdriver_ldxydomI
3242	\N	703	62	48	teamdriver_DRNF3XWY
3243	\N	814	62	141	teamdriver_KEvDLv7S
3244	\N	806	62	182	teamdriver_Jwq4XzyH
3245	\N	815	62	182	teamdriver_oizc3f8V
3246	\N	787	62	200	teamdriver_SdWlhco9
3247	\N	783	62	200	teamdriver_vuy1gpny
3248	\N	754	62	182	teamdriver_c0QAZHdR
3249	\N	816	62	200	teamdriver_s5g8EEqF
3250	\N	811	62	202	teamdriver_80eqNN5w
3251	\N	808	62	152	teamdriver_RQI7oEE1
3252	\N	759	63	117	teamdriver_Agc2HOET
3253	\N	798	63	191	teamdriver_uhRRVxvS
3254	\N	795	63	117	teamdriver_GxndXfaW
3255	\N	768	63	191	teamdriver_dOAaXlrj
3256	\N	763	63	6	teamdriver_Rav4CwYj
3257	\N	806	63	182	teamdriver_QrH8TrDy
3258	\N	762	63	204	teamdriver_XdfYeEW6
3259	\N	815	63	182	teamdriver_GrfwTusQ
3260	\N	816	63	195	teamdriver_DeXQ1sCH
3261	\N	812	63	198	teamdriver_CATc9Dq5
3262	\N	817	63	195	teamdriver_5biScCXk
3263	\N	789	63	48	teamdriver_uBnfhxFj
3264	\N	814	63	141	teamdriver_uAosbiHQ
3265	\N	782	63	205	teamdriver_qQi9sJ3U
3266	\N	818	63	205	teamdriver_NPPpdmvU
3267	\N	808	63	141	teamdriver_Fk8mNgxY
3268	\N	770	63	6	teamdriver_3Yjm56yw
3269	\N	796	63	203	teamdriver_8RL2yIqP
3270	\N	809	63	203	teamdriver_uV358ylw
3271	\N	703	63	48	teamdriver_ZiE6G53E
3272	\N	805	63	204	teamdriver_aTauo0Lb
3273	\N	807	63	198	teamdriver_r37uknsg
3274	\N	754	63	200	teamdriver_p4ulASE7
3275	\N	783	63	200	teamdriver_UjHXGvMm
3276	\N	813	63	204	teamdriver_VOHVeGhg
3277	\N	762	64	204	teamdriver_NzL5mEtc
3278	\N	763	64	6	teamdriver_mZiY1aZG
3279	\N	798	64	191	teamdriver_vC5lITsl
3280	\N	770	64	6	teamdriver_Odt1XkWr
3281	\N	795	64	48	teamdriver_imsT5tNe
3282	\N	768	64	191	teamdriver_2eeLtxRR
3283	\N	797	64	198	teamdriver_HB0Jz7VV
3284	\N	812	64	198	teamdriver_ULkX8IcL
3285	\N	759	64	117	teamdriver_qqJOvHdq
3286	\N	805	64	204	teamdriver_ljeFmj52
3287	\N	815	64	117	teamdriver_BvYDvJ5y
3288	\N	817	64	195	teamdriver_lVPLGhnx
3289	\N	819	64	182	teamdriver_Qv41BFLO
3290	\N	820	64	141	teamdriver_K9fTYLB0
3291	\N	821	64	205	teamdriver_IHHx9sPQ
3292	\N	818	64	203	teamdriver_laIkUTjs
3293	\N	822	64	205	teamdriver_65g1dywz
3294	\N	823	64	203	teamdriver_AOM8yKUI
3295	\N	816	64	195	teamdriver_Ka7Uinmg
3296	\N	789	64	48	teamdriver_je1eJ0pt
3297	\N	814	64	141	teamdriver_XsPAAYgx
3298	\N	807	64	182	teamdriver_7uoFHWq0
3299	\N	796	64	204	teamdriver_FCqJ0OC6
3300	\N	789	65	48	teamdriver_tMcHnbdQ
3301	\N	824	65	117	teamdriver_hBHDLoBe
3302	\N	759	65	117	teamdriver_kYUbOB12
3303	\N	763	65	6	teamdriver_viPBlVGh
3304	\N	820	65	141	teamdriver_xWBe5kXF
3305	\N	807	65	198	teamdriver_TJl0ovO7
3306	\N	762	65	6	teamdriver_S5A4BTFF
3307	\N	817	65	195	teamdriver_yLj0pHrk
3308	\N	825	65	195	teamdriver_Bz7PphVa
3309	\N	815	65	198	teamdriver_qravvzU2
3310	\N	797	65	182	teamdriver_wAbhL2GG
3311	\N	819	65	182	teamdriver_woujzkbc
3312	\N	822	65	205	teamdriver_QEYBrVnU
3313	\N	821	65	205	teamdriver_meavodgD
3314	\N	805	65	204	teamdriver_EdfnvgCc
3315	\N	814	65	204	teamdriver_e3uouUwN
3316	\N	826	65	203	teamdriver_N6jPGlVx
3317	\N	798	65	191	teamdriver_WmTEuqLf
3318	\N	795	65	48	teamdriver_BVPRQbRZ
3319	\N	770	65	141	teamdriver_UFtXpCcb
3320	\N	806	65	203	teamdriver_jUFPQiYh
3321	\N	816	65	191	teamdriver_Db7msCEi
3322	\N	827	65	203	teamdriver_9EwhPbYd
3323	\N	828	65	203	teamdriver_TKeFJVWb
3324	\N	795	66	48	teamdriver_XaYBor7y
3325	\N	789	66	48	teamdriver_4dAwb6vI
3326	\N	798	66	6	teamdriver_YU1wIVct
3327	\N	770	66	141	teamdriver_slpGMMWf
3328	\N	829	66	182	teamdriver_2QL4nOfP
3329	\N	816	66	191	teamdriver_hccFnek7
3330	\N	807	66	198	teamdriver_FcnRW2xN
3331	\N	826	66	182	teamdriver_pgf9ZeKg
3332	\N	830	66	195	teamdriver_wXGPLO6v
3333	\N	815	66	198	teamdriver_FQt5zPbS
3334	\N	759	66	117	teamdriver_VhEecAbY
3335	\N	762	66	6	teamdriver_NDMMBTha
3336	\N	831	66	195	teamdriver_UxrByMhP
3337	\N	805	66	204	teamdriver_ycip3Yee
3338	\N	814	66	204	teamdriver_UJRpWOIh
3339	\N	825	66	191	teamdriver_F4BNuZys
3340	\N	824	66	117	teamdriver_aEIEYP1x
3341	\N	820	66	141	teamdriver_hUYKpadX
3342	\N	832	66	206	teamdriver_h7Zs0wVw
3343	\N	763	66	117	teamdriver_8VnBHilh
3344	\N	828	66	206	teamdriver_8EXlaUle
3345	\N	833	66	206	teamdriver_ZB1zmYdv
3346	\N	789	67	48	teamdriver_QjySCiYO
3347	\N	795	67	48	teamdriver_EXRBXNZe
3348	\N	798	67	6	teamdriver_lgTCZdKK
3349	\N	816	67	191	teamdriver_yynyW5x3
3350	\N	770	67	141	teamdriver_NraUnDhi
3351	\N	805	67	207	teamdriver_Zpl4wpEH
3352	\N	807	67	198	teamdriver_vytmp56d
3353	\N	820	67	141	teamdriver_zObtG9a5
3354	\N	830	67	195	teamdriver_7Cv6D3gm
3355	\N	831	67	195	teamdriver_1TKZfLmo
3356	\N	834	67	152	teamdriver_N7HhNyOh
3357	\N	824	67	152	teamdriver_ShsosGNS
3358	\N	815	67	198	teamdriver_hEDny3oM
3359	\N	759	67	117	teamdriver_fLirF3ms
3360	\N	829	67	182	teamdriver_K5os1SwE
3361	\N	835	67	206	teamdriver_0118cU5l
3362	\N	826	67	182	teamdriver_mw13ir5T
3363	\N	762	67	6	teamdriver_rgSnucrW
3364	\N	836	67	206	teamdriver_8kx4yQb4
3365	\N	819	67	207	teamdriver_c2twkosJ
3366	\N	763	67	117	teamdriver_Ytdwtab8
3367	\N	825	67	191	teamdriver_jnWeaReV
3368	\N	837	67	117	teamdriver_WhHE5KjY
3369	\N	831	67	191	teamdriver_IxAtphED
3370	\N	825	67	195	teamdriver_7PpxVpMW
3371	\N	838	67	206	teamdriver_GBYKNeVJ
3372	\N	798	68	6	teamdriver_FmicAE5F
3373	\N	795	68	48	teamdriver_p0n4jDs6
3374	\N	820	68	48	teamdriver_TdHhAyvd
3375	\N	762	68	6	teamdriver_3SczT7oP
3376	\N	831	68	191	teamdriver_Gnt3r6Mt
3377	\N	770	68	141	teamdriver_NOFT2Lqn
3378	\N	815	68	198	teamdriver_O33e5vwS
3379	\N	830	68	195	teamdriver_EvMW0Zb1
3380	\N	825	68	195	teamdriver_bP0gyXPR
3381	\N	838	68	198	teamdriver_wpYNZNrn
3382	\N	807	68	152	teamdriver_lFLVpjkc
3383	\N	839	68	182	teamdriver_5rbFo7AO
3384	\N	837	68	117	teamdriver_Hu1IMCuK
3385	\N	763	68	117	teamdriver_es0pug8J
3386	\N	824	68	207	teamdriver_poKT6aYa
3387	\N	840	68	141	teamdriver_PD0o6QM2
3388	\N	816	68	191	teamdriver_Rpv9Ss67
3389	\N	826	68	182	teamdriver_BXIKY6RS
3390	\N	834	68	152	teamdriver_pu5m5LUo
3391	\N	805	68	207	teamdriver_4aqbkUpd
3392	\N	835	68	182	teamdriver_LIeMpOZs
3393	\N	759	68	117	teamdriver_1B5CbB6D
3394	\N	812	68	141	teamdriver_hFQpJr9G
3395	\N	841	68	195	teamdriver_K0ePJXJ2
3396	\N	830	68	152	teamdriver_2ljaWtO9
3397	\N	842	68	195	teamdriver_CaGQFI7u
3398	\N	798	69	6	teamdriver_TEhJIoM4
3399	\N	795	69	48	teamdriver_OcsXisU9
3400	\N	762	69	6	teamdriver_sVSlgVeb
3401	\N	816	69	191	teamdriver_8cJsdInj
3402	\N	763	69	117	teamdriver_shPXXdN2
3403	\N	831	69	191	teamdriver_UauUAejf
3404	\N	807	69	152	teamdriver_U2LQhsbn
3405	\N	820	69	48	teamdriver_7SJ4xZG2
3406	\N	837	69	117	teamdriver_fEjesC1T
3407	\N	830	69	152	teamdriver_zsOWouG8
3408	\N	815	69	198	teamdriver_FCtC8SWb
3409	\N	838	69	198	teamdriver_aqZlPe3j
3410	\N	843	69	182	teamdriver_dy2NX7qu
3411	\N	840	69	141	teamdriver_2ckVFhHV
3412	\N	842	69	195	teamdriver_3V0h92Q1
3413	\N	805	69	207	teamdriver_HwrOPoKc
3414	\N	824	69	207	teamdriver_ahLGABVT
3415	\N	841	69	195	teamdriver_zC0fgaaN
3416	\N	826	69	182	teamdriver_8H2ty9IS
3417	\N	844	69	141	teamdriver_QWHDFVcC
3418	\N	820	70	48	teamdriver_UbOn9RkW
3419	\N	795	70	48	teamdriver_77sM4Bnv
3420	\N	831	70	191	teamdriver_8dnr63Y9
3421	\N	798	70	6	teamdriver_thqLHtlP
3422	\N	843	70	6	teamdriver_GtoCJzy0
3423	\N	824	70	207	teamdriver_ZOYsvwjw
3424	\N	807	70	152	teamdriver_yq9grsoe
3425	\N	762	70	1	teamdriver_BDv6R7Kh
3426	\N	840	70	208	teamdriver_AAdRqWoq
3427	\N	825	70	195	teamdriver_9yJov3XN
3428	\N	841	70	191	teamdriver_O4upvo6S
3429	\N	845	70	117	teamdriver_5uaKbDOq
3430	\N	815	70	208	teamdriver_BIGmyVrL
3431	\N	846	70	195	teamdriver_cnWDUICY
3432	\N	839	70	1	teamdriver_23TT7vtM
3433	\N	847	70	141	teamdriver_z7O94Rrz
3434	\N	794	70	141	teamdriver_qyZqhGKL
3435	\N	805	70	207	teamdriver_qsR8Y9Ji
3436	\N	816	70	152	teamdriver_98sc9BeN
3437	\N	830	70	117	teamdriver_Xkuk85Ed
3438	\N	846	70	191	teamdriver_NN3k5caP
3439	\N	841	70	195	teamdriver_kdZsUVLP
3440	\N	820	71	48	teamdriver_GUqYUVXy
3441	\N	843	71	6	teamdriver_zE5R4YWE
3442	\N	845	71	117	teamdriver_PntJQCY4
3443	\N	795	71	48	teamdriver_nLQMPJfY
3444	\N	830	71	117	teamdriver_psokLwBK
3445	\N	815	71	208	teamdriver_IH4oNyDJ
3446	\N	841	71	209	teamdriver_SuC1G0JB
3447	\N	838	71	152	teamdriver_WLtjoHmd
3448	\N	839	71	1	teamdriver_YADoNqaW
3449	\N	798	71	6	teamdriver_jVxZMgwE
3450	\N	848	71	141	teamdriver_jDBRjJU1
3451	\N	825	71	209	teamdriver_5UTN2d9s
3452	\N	846	71	191	teamdriver_iouUNIRj
3453	\N	762	71	1	teamdriver_eo3spmZx
3454	\N	847	71	141	teamdriver_da7BJKok
3455	\N	805	71	207	teamdriver_chvCYfog
3456	\N	824	71	207	teamdriver_HwbTVyHY
3457	\N	840	71	208	teamdriver_z1A7n3qe
3458	\N	816	71	152	teamdriver_EnZxsj4S
3459	\N	831	71	191	teamdriver_UugirWmI
3460	\N	807	71	208	teamdriver_dhJxM2Gg
3461	\N	847	71	48	teamdriver_0KtrqZbP
3462	\N	849	71	141	teamdriver_9jH2xtwH
3463	\N	850	71	207	teamdriver_A9jKdr0P
3464	\N	795	72	48	teamdriver_zyGrjI96
3465	\N	831	72	191	teamdriver_yOTWI9PR
3466	\N	820	72	48	teamdriver_0yAg7FtB
3467	\N	845	72	117	teamdriver_HeV7eMEV
3468	\N	815	72	191	teamdriver_p8LAmq92
3469	\N	843	72	6	teamdriver_DYejXWtU
3470	\N	816	72	117	teamdriver_GKqqggJW
3471	\N	830	72	6	teamdriver_T78k3rqR
3472	\N	851	72	209	teamdriver_apHwBtg3
3473	\N	840	72	64	teamdriver_8KlF2RsB
3474	\N	762	72	1	teamdriver_MeX9eIbq
3475	\N	839	72	1	teamdriver_kKqzmDGJ
3476	\N	838	72	210	teamdriver_AnXjQFNa
3477	\N	847	72	141	teamdriver_8znWM2b4
3478	\N	798	72	64	teamdriver_UaKl0KDk
3479	\N	852	72	207	teamdriver_UNIUUbnn
3480	\N	841	72	209	teamdriver_lMTdzWzy
3481	\N	848	72	141	teamdriver_54fEiSd1
3482	\N	763	72	210	teamdriver_GBKZehUN
3483	\N	853	72	207	teamdriver_meCcqqTI
3484	\N	794	72	1	teamdriver_hStDdvkh
3485	\N	843	73	6	teamdriver_n9eX5wmr
3486	\N	830	73	6	teamdriver_G5DCGhI6
3487	\N	795	73	48	teamdriver_GYxD5hyE
3488	\N	847	73	48	teamdriver_txIsIuZH
3489	\N	824	73	207	teamdriver_xxtWKZdJ
3490	\N	820	73	1	teamdriver_uJjJ7PJg
3491	\N	838	73	210	teamdriver_z8RHbR3P
3492	\N	851	73	209	teamdriver_IaS4vDma
3493	\N	763	73	210	teamdriver_AjbrTP75
3494	\N	854	73	1	teamdriver_angaBBn6
3495	\N	852	73	207	teamdriver_myD8qETB
3496	\N	840	73	64	teamdriver_oOjbEbaM
3497	\N	846	73	141	teamdriver_arqAG7cz
3498	\N	816	73	117	teamdriver_aZqoitYb
3499	\N	845	73	117	teamdriver_rZYGr0Jj
3500	\N	848	73	141	teamdriver_BhOBxNHZ
3501	\N	807	73	64	teamdriver_FRbbKzrB
3502	\N	815	73	191	teamdriver_S29EpogU
3503	\N	831	73	191	teamdriver_K6Tgbwm7
3504	\N	841	73	209	teamdriver_abIrtU5W
3505	\N	798	73	64	teamdriver_Bc0iR4Av
3506	\N	855	73	141	teamdriver_WD0jm1Hy
3507	\N	831	74	191	teamdriver_eNv4ML8i
3508	\N	815	74	191	teamdriver_0yXvp3ef
3509	\N	763	74	64	teamdriver_rex6hD8b
3510	\N	830	74	6	teamdriver_hleVehSh
3511	\N	795	74	48	teamdriver_GcxNJvc2
3512	\N	840	74	64	teamdriver_dkjQIBLC
3513	\N	847	74	48	teamdriver_czmCbMOr
3514	\N	820	74	1	teamdriver_rUd1av8i
3515	\N	841	74	210	teamdriver_chf2i7lc
3516	\N	846	74	141	teamdriver_jIq3bgMa
3517	\N	851	74	209	teamdriver_6llNjPIo
3518	\N	856	74	141	teamdriver_CtzwHqV3
3519	\N	824	74	207	teamdriver_SmqhmDh7
3520	\N	855	74	209	teamdriver_OOz6HjfT
3521	\N	807	74	207	teamdriver_GJ3FCumI
3522	\N	854	74	1	teamdriver_HeDxvFTa
3523	\N	845	74	117	teamdriver_QR1IFhYJ
3524	\N	838	74	210	teamdriver_ztQIOHXj
3525	\N	843	74	6	teamdriver_87ImLN0O
3526	\N	857	74	117	teamdriver_Ry4cKImL
3527	\N	816	74	209	teamdriver_SGwmS31g
3528	\N	858	74	209	teamdriver_WOWaNdpZ
3529	\N	831	75	191	teamdriver_W9nAunHi
3530	\N	815	75	191	teamdriver_kI1mryta
3531	\N	830	75	6	teamdriver_tBigaEPW
3532	\N	843	75	6	teamdriver_psocdaqq
3533	\N	847	75	48	teamdriver_rVn1HHtF
3534	\N	845	75	117	teamdriver_9ihRpA3Z
3535	\N	795	75	48	teamdriver_Knz1hePN
3536	\N	857	75	117	teamdriver_dvvQyfZ5
3537	\N	763	75	64	teamdriver_wfp9dPTO
3538	\N	840	75	64	teamdriver_07IrGslb
3539	\N	854	75	182	teamdriver_JtVr8BC0
3540	\N	824	75	207	teamdriver_eX9DMy6D
3541	\N	816	75	211	teamdriver_OfO399GA
3542	\N	851	75	211	teamdriver_Tk98zVW7
3543	\N	846	75	141	teamdriver_M9pm6UZc
3544	\N	807	75	207	teamdriver_7AhsCczz
3545	\N	838	75	210	teamdriver_9DTY4Glo
3546	\N	841	75	210	teamdriver_eWf947ME
3547	\N	820	75	182	teamdriver_jX3zvwYy
3548	\N	856	75	141	teamdriver_msetx9qf
3549	\N	859	75	6	teamdriver_OkQ24zvK
3550	\N	860	75	141	teamdriver_r9o0ZcKj
3551	\N	859	75	207	teamdriver_Lime31uK
3552	\N	858	75	211	teamdriver_aGXHzsbJ
3553	\N	861	75	210	teamdriver_SJofRJ9Q
3554	0	861	76	210	teamdriver_eG12eotI
3555	0	841	76	210	teamdriver_W56dlYpS
3556	0	763	76	64	teamdriver_qop74r85
3557	0	840	76	64	teamdriver_Qci2UHID
3558	0	843	76	6	teamdriver_3FB68JDa
3559	0	795	76	6	teamdriver_1iyfecyA
3560	0	838	76	207	teamdriver_BMGttGJr
3561	0	859	76	207	teamdriver_ZXfMMkXa
3562	0	862	76	182	teamdriver_hsxVqY2O
3563	0	845	76	117	teamdriver_N2xgOfLz
3564	0	857	76	117	teamdriver_EWEqxPte
3565	0	863	76	48	teamdriver_LXmc6Pk3
3566	0	847	76	48	teamdriver_PiSBuZKA
3567	0	864	76	211	teamdriver_b1jkM37F
3568	0	851	76	211	teamdriver_Mhp3BV5t
3569	0	831	76	191	teamdriver_tIpZEAW5
3570	0	858	76	191	teamdriver_EQXzjxhJ
3571	0	846	76	141	teamdriver_GfUsJdBi
3572	0	830	76	141	teamdriver_3l5hqdNR
3573	0	807	76	182	teamdriver_jmTO67VT
3574	2	863	75	48	teamdriver_siTJI30W
3577	\N	858	76	211	teamdriver_XNM1hAG1
3578	\N	851	76	191	teamdriver_uocu2mhF
3613	\N	860	76	210	teamdriver_xejHlx4R
\.


--
-- Name: formula_one_baseteam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_one_baseteam_id_seq', 1, true);


--
-- Name: formula_one_championshipadjustment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_one_championshipadjustment_id_seq', 3, true);


--
-- Name: formula_one_championshipsystem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_one_championshipsystem_id_seq', 10, true);


--
-- Name: formula_one_circuit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_one_circuit_id_seq', 77, true);


--
-- Name: formula_one_driver_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_one_driver_id_seq', 864, true);


--
-- Name: formula_one_penalty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_one_penalty_id_seq', 1, true);


--
-- Name: formula_one_pointsystem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_one_pointsystem_id_seq', 24, true);


--
-- Name: formula_one_round_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_one_round_id_seq', 1149, true);


--
-- Name: formula_one_season_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_one_season_id_seq', 76, true);


--
-- Name: formula_one_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_one_session_id_seq', 4950, true);


--
-- Name: formula_one_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_one_team_id_seq', 212, true);


--
-- Name: formula_one_teamdriver_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_one_teamdriver_id_seq', 3613, true);


--
-- PostgreSQL database dump complete
--

\unrestrict sVBQj7W2uuKxl3pXM05YefRqF0Jbhn4obqDtDcIFiyGOHL6e4el7gCMza54IDPj

