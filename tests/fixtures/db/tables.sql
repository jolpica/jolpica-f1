--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg110+1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1.pgdg110+1)

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
-- Data for Name: ergast_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ergast_status ("statusId", status) FROM stdin;
1	Finished
2	Disqualified
3	Accident
4	Collision
5	Engine
6	Gearbox
7	Transmission
8	Clutch
9	Hydraulics
10	Electrical
11	+1 Lap
12	+2 Laps
13	+3 Laps
14	+4 Laps
15	+5 Laps
16	+6 Laps
17	+7 Laps
18	+8 Laps
19	+9 Laps
20	Spun off
21	Radiator
22	Suspension
23	Brakes
24	Differential
25	Overheating
26	Mechanical
27	Tyre
28	Driver Seat
29	Puncture
30	Driveshaft
31	Retired
32	Fuel pressure
33	Front wing
34	Water pressure
35	Refuelling
36	Wheel
37	Throttle
38	Steering
39	Technical
40	Electronics
41	Broken wing
42	Heat shield fire
43	Exhaust
44	Oil leak
45	+11 Laps
46	Wheel rim
47	Water leak
48	Fuel pump
49	Track rod
50	+17 Laps
51	Oil pressure
128	+42 Laps
53	+13 Laps
54	Withdrew
55	+12 Laps
56	Engine fire
129	Engine misfire
58	+26 Laps
59	Tyre puncture
60	Out of fuel
61	Wheel nut
62	Not classified
63	Pneumatics
64	Handling
65	Rear wing
66	Fire
67	Wheel bearing
68	Physical
69	Fuel system
70	Oil line
71	Fuel rig
72	Launch control
73	Injured
74	Fuel
75	Power loss
76	Vibrations
77	107% Rule
78	Safety
79	Drivetrain
80	Ignition
81	Did not qualify
82	Injury
83	Chassis
84	Battery
85	Stalled
86	Halfshaft
87	Crankshaft
88	+10 Laps
89	Safety concerns
90	Not restarted
91	Alternator
92	Underweight
93	Safety belt
94	Oil pump
95	Fuel leak
96	Excluded
97	Did not prequalify
98	Injection
99	Distributor
100	Driver unwell
101	Turbo
102	CV joint
103	Water pump
104	Fatal accident
105	Spark plugs
106	Fuel pipe
107	Eye injury
108	Oil pipe
109	Axle
110	Water pipe
111	+14 Laps
112	+15 Laps
113	+25 Laps
114	+18 Laps
115	+22 Laps
116	+16 Laps
117	+24 Laps
118	+29 Laps
119	+23 Laps
120	+21 Laps
121	Magneto
122	+44 Laps
123	+30 Laps
124	+19 Laps
125	+46 Laps
126	Supercharger
127	+20 Laps
130	Collision damage
131	Power Unit
132	ERS
133	+49 Laps
134	+38 Laps
135	Brake duct
136	Seat
137	Damage
138	Debris
139	Illness
140	Undertray
141	Cooling system
\.


--
-- Data for Name: formula_one_baseteam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_baseteam (id, name) FROM stdin;
\.


--
-- Data for Name: formula_one_championshipsystem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_championshipsystem (id, reference, name, eligibility, driver_season_split, driver_best_results, team_season_split, team_best_results) FROM stdin;
1	s1950	1950 - 1953 Championship	1	0	4	0	0
2	s1954	1954 - 1957 Championship	1	0	5	0	0
3	s1958	1958, 1960, 1963-1965\tChampionship	1	0	6	0	6
4	s1959	1959, 1961, 1962, 1966 Championship	1	0	5	0	5
5	s1967	1967 - 1978 Championship	1	2	-2	2	-2
6	s1979	1979 Championship	1	3	4	0	-1
7	s1980	1980 Championship	1	3	5	0	-1
8	s1981	1981-1990 Championship	1	0	11	0	-1
9	s1991	1991 - 2001 Championship	1	0	-1	0	-1
10	s2002	2002 - Present Championship	2	0	-1	0	-1
\.


--
-- Data for Name: formula_one_driver; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_driver (id, reference, forename, surname, abbreviation, nationality, permanent_car_number, date_of_birth, wikipedia) FROM stdin;
1	farina	Nino	Farina	\N	Italian	\N	1906-10-30	http://en.wikipedia.org/wiki/Nino_Farina
2	fagioli	Luigi	Fagioli	\N	Italian	\N	1898-06-09	http://en.wikipedia.org/wiki/Luigi_Fagioli
3	reg_parnell	Reg	Parnell	\N	British	\N	1911-07-02	http://en.wikipedia.org/wiki/Reg_Parnell
4	cabantous	Yves	Cabantous	\N	French	\N	1904-10-08	http://en.wikipedia.org/wiki/Yves_Giraud_Cabantous
5	rosier	Louis	Rosier	\N	French	\N	1905-11-05	http://en.wikipedia.org/wiki/Louis_Rosier
6	gerard	Bob	Gerard	\N	British	\N	1914-01-19	http://en.wikipedia.org/wiki/Bob_Gerard
7	harrison	Cuth	Harrison	\N	British	\N	1906-07-06	http://en.wikipedia.org/wiki/Cuth_Harrison
8	etancelin	Philippe	Étancelin	\N	French	\N	1896-12-28	http://en.wikipedia.org/wiki/Philippe_%C3%89tancelin
9	hampshire	David	Hampshire	\N	British	\N	1917-12-29	http://en.wikipedia.org/wiki/David_Hampshire
10	shawe_taylor	Brian	Shawe Taylor	\N	British	\N	1915-01-28	http://en.wikipedia.org/wiki/Brian_Shawe_Taylor
11	fry	Joe	Fry	\N	British	\N	1915-10-26	http://en.wikipedia.org/wiki/Joe_Fry
12	claes	Johnny	Claes	\N	Belgian	\N	1916-08-11	http://en.wikipedia.org/wiki/Johnny_Claes
13	fangio	Juan	Fangio	\N	Argentine	\N	1911-06-24	http://en.wikipedia.org/wiki/Juan_Manuel_Fangio
14	kelly	Joe	Kelly	\N	Irish	\N	1913-03-13	http://en.wikipedia.org/wiki/Joe_Kelly_(Formula_One)
15	bira	Prince	Bira	\N	Thai	\N	1914-07-15	http://en.wikipedia.org/wiki/Prince_Bira
16	murray	David	Murray	\N	British	\N	1909-12-28	http://en.wikipedia.org/wiki/David_Murray_(driver)
17	crossley	Geoff	Crossley	\N	British	\N	1921-05-11	http://en.wikipedia.org/wiki/Geoff_Crossley
18	graffenried	Toulo	de Graffenried	\N	Swiss	\N	1914-05-18	http://en.wikipedia.org/wiki/Toulo_de_Graffenried
19	chiron	Louis	Chiron	\N	Monegasque	\N	1899-08-03	http://en.wikipedia.org/wiki/Louis_Chiron
20	martin	Eugène	Martin	\N	French	\N	1915-03-24	http://en.wikipedia.org/wiki/Eug%C3%A8ne_Martin
21	peter_walker	Peter	Walker	\N	British	\N	1912-10-07	http://en.wikipedia.org/wiki/Peter_Walker_(driver)
22	rolt	Tony	Rolt	\N	British	\N	1918-10-16	http://en.wikipedia.org/wiki/Tony_Rolt
23	leslie_johnson	Leslie	Johnson	\N	British	\N	1912-03-22	http://en.wikipedia.org/wiki/Leslie_Johnson_(racing_driver)
24	ascari	Alberto	Ascari	\N	Italian	\N	1918-07-13	http://en.wikipedia.org/wiki/Alberto_Ascari
25	sommer	Raymond	Sommer	\N	French	\N	1906-08-31	http://en.wikipedia.org/wiki/Raymond_Sommer
26	villoresi	Luigi	Villoresi	\N	Italian	\N	1909-05-16	http://en.wikipedia.org/wiki/Luigi_Villoresi
27	gonzalez	José Froilán	González	\N	Argentine	\N	1922-10-05	http://en.wikipedia.org/wiki/Jos%C3%A9_Froil%C3%A1n_Gonz%C3%A1lez
28	manzon	Robert	Manzon	\N	French	\N	1917-04-12	http://en.wikipedia.org/wiki/Robert_Manzon
29	trintignant	Maurice	Trintignant	\N	French	\N	1917-10-30	http://en.wikipedia.org/wiki/Maurice_Trintignant
30	rol	Franco	Rol	\N	Italian	\N	1908-06-05	http://en.wikipedia.org/wiki/Franco_Rol
31	schell	Harry	Schell	\N	American	\N	1921-06-29	http://en.wikipedia.org/wiki/Harry_Schell
32	whitehead	Peter	Whitehead	\N	British	\N	1914-11-12	http://en.wikipedia.org/wiki/Peter_Whitehead_(racing_driver)
33	pian	Alfredo	Pián	\N	Argentine	\N	1912-10-21	http://en.wikipedia.org/wiki/Alfredo_Pi%C3%A0n
34	parsons	Johnnie	Parsons	\N	American	\N	1918-07-04	http://en.wikipedia.org/wiki/Johnnie_Parsons
35	holland	Bill	Holland	\N	American	\N	1907-12-18	http://en.wikipedia.org/wiki/Bill_Holland
36	rose	Mauri	Rose	\N	American	\N	1906-05-26	http://en.wikipedia.org/wiki/Mauri_Rose
37	green	Cecil	Green	\N	American	\N	1919-09-30	http://en.wikipedia.org/wiki/Cecil_Green
38	bettenhausen	Tony	Bettenhausen	\N	American	\N	1916-09-12	http://en.wikipedia.org/wiki/Tony_Bettenhausen
39	chitwood	Joie	Chitwood	\N	American	\N	1912-04-14	http://en.wikipedia.org/wiki/Joie_Chitwood
40	wallard	Lee	Wallard	\N	American	\N	1910-09-07	http://en.wikipedia.org/wiki/Lee_Wallard
41	faulkner	Walt	Faulkner	\N	American	\N	1920-02-16	http://en.wikipedia.org/wiki/Walt_Faulkner
42	george_connor	George	Connor	\N	American	\N	1906-08-16	http://en.wikipedia.org/wiki/George_Connor_(driver)
43	paul_russo	Paul	Russo	\N	American	\N	1914-04-10	http://en.wikipedia.org/wiki/Paul_Russo
44	flaherty	Pat	Flaherty	\N	American	\N	1926-01-06	http://en.wikipedia.org/wiki/Pat_Flaherty_(racing_driver)
45	fohr	Myron	Fohr	\N	American	\N	1912-06-17	http://en.wikipedia.org/wiki/Myron_Fohr
46	darter	Duane	Carter	\N	American	\N	1913-05-05	http://en.wikipedia.org/wiki/Duane_Carter
47	hellings	Mack	Hellings	\N	American	\N	1915-09-14	http://en.wikipedia.org/wiki/Mack_Hellings
48	mcgrath	Jack	McGrath	\N	American	\N	1919-10-08	http://en.wikipedia.org/wiki/Jack_McGrath_(racing_driver)
49	ruttman	Troy	Ruttman	\N	American	\N	1930-03-11	http://en.wikipedia.org/wiki/Troy_Ruttman
50	hartley	Gene	Hartley	\N	American	\N	1926-01-28	http://en.wikipedia.org/wiki/Gene_Hartley
51	davies	Jimmy	Davies	\N	American	\N	1929-08-08	http://en.wikipedia.org/wiki/Jimmy_Davies
52	mcdowell	Johnny	McDowell	\N	American	\N	1915-01-29	http://en.wikipedia.org/wiki/Johnny_McDowell
53	walt_brown	Walt	Brown	\N	American	\N	1911-12-30	http://en.wikipedia.org/wiki/Walt_Brown_(auto_racer)
54	webb	Travis	Webb	\N	American	\N	1910-10-08	http://en.wikipedia.org/wiki/Travis_Webb
55	hoyt	Jerry	Hoyt	\N	American	\N	1929-01-29	http://en.wikipedia.org/wiki/Jerry_Hoyt
56	ader	Walt	Ader	\N	American	\N	1913-12-15	http://en.wikipedia.org/wiki/Walt_Ader
57	holmes	Jackie	Holmes	\N	American	\N	1920-09-04	http://en.wikipedia.org/wiki/Jackie_Holmes
58	rathmann	Jim	Rathmann	\N	American	\N	1928-07-16	http://en.wikipedia.org/wiki/Jim_Rathmann
59	banks	Henry	Banks	\N	American	\N	1913-06-14	http://en.wikipedia.org/wiki/Henry_Banks
60	schindler	Bill	Schindler	\N	American	\N	1909-03-06	http://en.wikipedia.org/wiki/Bill_Schindler
61	levrett	Bayliss	Levrett	\N	American	\N	1914-02-14	http://en.wikipedia.org/wiki/Bayliss_Levrett
62	cantrell	Bill	Cantrell	\N	American	\N	1908-01-31	http://en.wikipedia.org/wiki/William_Cantrell
63	agabashian	Fred	Agabashian	\N	American	\N	1913-08-21	http://en.wikipedia.org/wiki/Fred_Agabashian
64	jackson	Jimmy	Jackson	\N	American	\N	1910-07-25	http://en.wikipedia.org/wiki/Jimmy_Jackson_(driver)
65	hanks	Sam	Hanks	\N	American	\N	1914-07-13	http://en.wikipedia.org/wiki/Sam_Hanks
66	dick_rathmann	Dick	Rathmann	\N	American	\N	1924-01-06	http://en.wikipedia.org/wiki/Dick_Rathmann
67	dinsmore	Duke	Dinsmore	\N	American	\N	1913-04-10	http://en.wikipedia.org/wiki/Duke_Dinsmore
68	bonetto	Felice	Bonetto	\N	Italian	\N	1903-06-09	http://en.wikipedia.org/wiki/Felice_Bonetto
69	pagani	Nello	Pagani	\N	Italian	\N	1911-10-11	http://en.wikipedia.org/wiki/Nello_Pagani
70	branca	Toni	Branca	\N	Swiss	\N	1916-09-15	http://en.wikipedia.org/wiki/Toni_Branca
71	levegh	Pierre	Levegh	\N	French	\N	1905-12-22	http://en.wikipedia.org/wiki/Pierre_Levegh
72	chaboud	Eugène	Chaboud	\N	French	\N	1907-04-12	http://en.wikipedia.org/wiki/Eug%C3%A8ne_Chaboud
73	pozzi	Charles	Pozzi	\N	French	\N	1909-08-27	http://en.wikipedia.org/wiki/Charles_Pozzi
74	serafini	Dorino	Serafini	\N	Italian	\N	1909-07-22	http://en.wikipedia.org/wiki/Dorino_Serafini
75	guy_mairesse	Guy	Mairesse	\N	French	\N	1910-08-10	http://en.wikipedia.org/wiki/Guy_Mairesse
76	taruffi	Piero	Taruffi	\N	Italian	\N	1906-10-12	http://en.wikipedia.org/wiki/Piero_Taruffi
77	biondetti	Clemente	Biondetti	\N	Italian	\N	1898-08-18	http://en.wikipedia.org/wiki/Clemente_Biondetti
78	louveau	Henri	Louveau	\N	French	\N	1910-01-25	http://en.wikipedia.org/wiki/Henri_Louveau
79	comotti	Franco	Comotti	\N	Italian	\N	1906-07-24	http://en.wikipedia.org/wiki/Franco_Comotti
80	sanesi	Consalvo	Sanesi	\N	Italian	\N	1911-03-28	http://en.wikipedia.org/wiki/Consalvo_Sanesi
81	pietsch	Paul	Pietsch	\N	German	\N	1911-06-20	http://en.wikipedia.org/wiki/Paul_Pietsch
82	moss	Stirling	Moss	\N	British	\N	1929-09-17	http://en.wikipedia.org/wiki/Stirling_Moss
83	fischer	Rudi	Fischer	\N	Swiss	\N	1912-04-19	http://en.wikipedia.org/wiki/Rudi_Fischer
84	abecassis	George	Abecassis	\N	British	\N	1913-03-21	http://en.wikipedia.org/wiki/George_Abecassis
85	hirt	Peter	Hirt	\N	Swiss	\N	1910-03-30	http://en.wikipedia.org/wiki/Peter_Hirt
86	nazaruk	Mike	Nazaruk	\N	American	\N	1921-10-02	http://en.wikipedia.org/wiki/Mike_Nazaruk
87	ayulo	Manny	Ayulo	\N	American	\N	1921-10-20	http://en.wikipedia.org/wiki/Manny_Ayulo
88	linden	Andy	Linden	\N	American	\N	1922-04-05	http://en.wikipedia.org/wiki/Andy_Linden_(racing_driver)
89	ball	Bobby	Ball	\N	American	\N	1925-08-26	http://en.wikipedia.org/wiki/Bobby_Ball_(auto_racer)
90	forberg	Carl	Forberg	\N	American	\N	1911-03-04	http://en.wikipedia.org/wiki/Carl_Forberg
91	nalon	Duke	Nalon	\N	American	\N	1913-03-02	http://en.wikipedia.org/wiki/Duke_Nalon
92	force	Gene	Force	\N	American	\N	1916-06-15	http://en.wikipedia.org/wiki/Gene_Force
93	scarborough	Carl	Scarborough	\N	American	\N	1914-07-03	http://en.wikipedia.org/wiki/Carl_Scarborough
94	mackey	Bill	Mackey	\N	American	\N	1927-12-15	http://en.wikipedia.org/wiki/Bill_Mackey
95	stevenson	Chuck	Stevenson	\N	American	\N	1919-10-15	http://en.wikipedia.org/wiki/Chuck_Stevenson
96	miller	Chet	Miller	\N	American	\N	1902-07-19	http://en.wikipedia.org/wiki/Chet_Miller
97	ward	Rodger	Ward	\N	American	\N	1921-01-10	http://en.wikipedia.org/wiki/Rodger_Ward
98	griffith	Cliff	Griffith	\N	American	\N	1916-02-06	http://en.wikipedia.org/wiki/Cliff_Griffith
99	vukovich	Bill	Vukovich	\N	American	\N	1918-12-13	http://en.wikipedia.org/wiki/Bill_Vukovich
100	james	Joe	James	\N	American	\N	1925-05-23	http://en.wikipedia.org/wiki/Joe_James_(racing_driver)
101	andre_pilette	André	Pilette	\N	Belgian	\N	1918-10-06	http://en.wikipedia.org/wiki/Andr%C3%A9_Pilette
102	gordini	Aldo	Gordini	\N	French	\N	1921-05-20	http://en.wikipedia.org/wiki/Aldo_Gordini
103	simon	André	Simon	\N	French	\N	1920-01-05	http://en.wikipedia.org/wiki/Andr%C3%A9_Simon_(racing_driver)
104	marimon	Onofre	Marimón	\N	Argentine	\N	1923-12-19	http://en.wikipedia.org/wiki/Onofre_Marim%C3%B3n
105	duncan_hamilton	Duncan	Hamilton	\N	British	\N	1920-04-30	http://en.wikipedia.org/wiki/Duncan_Hamilton_(racing_driver)
106	parker	Philip	Fotheringham-Parker	\N	British	\N	1907-09-22	http://en.wikipedia.org/wiki/Philip_Fotheringham-Parker
107	john_james	John	James	\N	British	\N	1914-05-10	http://en.wikipedia.org/wiki/John_James_(auto_racer)
108	swaters	Jacques	Swaters	\N	American	\N	1926-10-30	http://en.wikipedia.org/wiki/Jacques_Swaters
109	landi	Chico	Landi	\N	Brazilian	\N	1907-07-14	http://en.wikipedia.org/wiki/Chico_Landi
110	richardson	Ken	Richardson	\N	British	\N	1911-08-21	http://en.wikipedia.org/wiki/Ken_Richardson_(race_car_driver)
111	godia	Paco	Godia	\N	Spanish	\N	1921-03-21	http://en.wikipedia.org/wiki/Paco_Godia
112	grignard	Georges	Grignard	\N	French	\N	1905-07-25	http://en.wikipedia.org/wiki/Georges_Grignard
113	jover	Juan	Jover	\N	Spanish	\N	1903-11-23	http://en.wikipedia.org/wiki/Juan_Jover
114	behra	Jean	Behra	\N	French	\N	1921-02-16	http://en.wikipedia.org/wiki/Jean_Behra
115	wharton	Ken	Wharton	\N	British	\N	1916-03-21	http://en.wikipedia.org/wiki/Ken_Wharton
116	alan_brown	Alan	Brown	\N	British	\N	1919-11-20	http://en.wikipedia.org/wiki/Alan_Brown_(racing_driver)
117	brandon	Eric	Brandon	\N	British	\N	1920-07-18	http://en.wikipedia.org/wiki/Eric_Brandon
118	macklin	Lance	Macklin	\N	British	\N	1919-09-02	http://en.wikipedia.org/wiki/Lance_Macklin
119	collins	Peter	Collins	\N	British	\N	1931-11-06	http://en.wikipedia.org/wiki/Peter_Collins_(racing_driver)
120	hans_stuck	Hans	von Stuck	\N	German	\N	1900-12-27	http://en.wikipedia.org/wiki/Hans_Von_Stuck
121	ulmen	Toni	Ulmen	\N	German	\N	1906-01-25	http://en.wikipedia.org/wiki/Toni_Ulmen
122	terra	Max	de Terra	\N	Swiss	\N	1918-10-06	http://en.wikipedia.org/wiki/Max_de_Terra
123	cross	Art	Cross	\N	American	\N	1918-01-24	http://en.wikipedia.org/wiki/Art_Cross
124	bryan	Jimmy	Bryan	\N	American	\N	1926-01-28	http://en.wikipedia.org/wiki/Jimmy_Bryan
125	reece	Jimmy	Reece	\N	American	\N	1929-11-17	http://en.wikipedia.org/wiki/Jimmy_Reece
126	rigsby	Jim	Rigsby	\N	American	\N	1923-06-06	http://en.wikipedia.org/wiki/Jim_Rigsby
127	fonder	George	Fonder	\N	American	\N	1917-06-22	http://en.wikipedia.org/wiki/George_Fonder
128	johnson	Eddie	Johnson	\N	American	\N	1919-02-10	http://en.wikipedia.org/wiki/Eddie_Johnson_(auto_racer)
129	sweikert	Bob	Sweikert	\N	American	\N	1926-05-20	http://en.wikipedia.org/wiki/Bob_Sweikert
130	bob_scott	Bob	Scott	\N	American	\N	1928-10-04	http://en.wikipedia.org/wiki/Bob_Scott_(auto_racer)
131	hawthorn	Mike	Hawthorn	\N	British	\N	1929-04-10	http://en.wikipedia.org/wiki/Mike_Hawthorn
132	frere	Paul	Frère	\N	Belgian	\N	1917-01-30	http://en.wikipedia.org/wiki/Paul_Fr%C3%A8re
133	tornaco	Charles	de Tornaco	\N	Belgian	\N	1927-06-07	http://en.wikipedia.org/wiki/Charles_de_Tornaco
134	laurent	Roger	Laurent	\N	Belgian	\N	1913-02-21	http://en.wikipedia.org/wiki/Roger_Laurent
135	legat	Arthur	Legat	\N	Belgian	\N	1898-11-01	http://en.wikipedia.org/wiki/Arthur_Legat
136	obrien	Robert	O'Brien	\N	American	\N	1908-04-11	http://en.wikipedia.org/wiki/Robert_O%27Brien_(auto_racer)
137	gaze	Tony	Gaze	\N	Australian	\N	1920-02-03	http://en.wikipedia.org/wiki/Tony_Gaze
138	charrington	Robin	Montgomerie-Charrington	\N	British	\N	1915-06-23	http://en.wikipedia.org/wiki/Robin_Montgomerie-Charrington
139	carini	Piero	Carini	\N	Italian	\N	1921-03-06	http://en.wikipedia.org/wiki/Piero_Carini
140	poore	Dennis	Poore	\N	British	\N	1916-08-19	http://en.wikipedia.org/wiki/Dennis_Poore
141	thompson	Eric	Thompson	\N	British	\N	1919-11-04	http://en.wikipedia.org/wiki/Eric_Thompson_(racing_driver)
142	salvadori	Roy	Salvadori	\N	British	\N	1922-05-12	http://en.wikipedia.org/wiki/Roy_Salvadori
143	downing	Ken	Downing	\N	British	\N	1917-12-05	http://en.wikipedia.org/wiki/Ken_Downing
144	graham_whitehead	Graham	Whitehead	\N	British	\N	1922-04-15	http://en.wikipedia.org/wiki/Graham_Whitehead
145	mcalpine	Kenneth	McAlpine	\N	British	\N	1920-09-21	http://en.wikipedia.org/wiki/Kenneth_McAlpine
146	bianco	Gino	Bianco	\N	Brazilian	\N	1916-07-22	http://en.wikipedia.org/wiki/Gino_Bianco
147	crook	Tony	Crook	\N	British	\N	1920-02-16	http://en.wikipedia.org/wiki/Tony_Crook
148	cantoni	Eitel	Cantoni	\N	Uruguayan	\N	1906-10-04	http://en.wikipedia.org/wiki/Eitel_Cantoni
149	aston	Bill	Aston	\N	British	\N	1900-03-29	http://en.wikipedia.org/wiki/Bill_Aston
150	riess	Fritz	Riess	\N	German	\N	1922-07-11	http://en.wikipedia.org/wiki/Fritz_Riess
151	niedermayr	Helmut	Niedermayr	\N	German	\N	1915-11-29	http://en.wikipedia.org/wiki/Helmut_Niedermayr
152	klenk	Hans	Klenk	\N	German	\N	1919-10-28	http://en.wikipedia.org/wiki/Hans_Klenk
153	klodwig	Ernst	Klodwig	\N	East German	\N	1903-05-23	http://en.wikipedia.org/wiki/Ernst_Klodwig
154	heeks	Willi	Heeks	\N	German	\N	1922-02-13	http://en.wikipedia.org/wiki/Willi_Heeks
155	brudes	Adolf	Brudes	\N	German	\N	1899-10-15	http://en.wikipedia.org/wiki/Adolf_Brudes
156	balsa	Marcel	Balsa	\N	French	\N	1909-01-01	http://en.wikipedia.org/wiki/Marcel_Balsa
157	bechem	Günther	Bechem	\N	German	\N	1921-12-21	http://en.wikipedia.org/wiki/G%C3%BCnther_Bechem
158	krause	Rudolf	Krause	\N	East German	\N	1907-03-30	http://en.wikipedia.org/wiki/Rudolf_Krause
159	schoeller	Rudolf	Schoeller	\N	Swiss	\N	1902-04-27	http://en.wikipedia.org/wiki/Rudolf_Schoeller
160	helfrich	Theo	Helfrich	\N	German	\N	1913-05-13	http://en.wikipedia.org/wiki/Theo_Helfrich
161	peters	Josef	Peters	\N	German	\N	1914-09-16	http://en.wikipedia.org/wiki/Josef_Peters_(driver)
162	flinterman	Jan	Flinterman	\N	Dutch	\N	1919-10-02	http://en.wikipedia.org/wiki/Jan_Flinterman
163	lof	Dries	van der Lof	\N	Dutch	\N	1919-08-23	http://en.wikipedia.org/wiki/Dries_van_der_Lof
164	bayol	Élie	Bayol	\N	French	\N	1914-02-28	http://en.wikipedia.org/wiki/%C3%89lie_Bayol
165	crespo	Alberto	Crespo	\N	Argentine	\N	1920-01-16	http://en.wikipedia.org/wiki/Alberto_Crespo
166	dusio	Piero	Dusio	\N	Italian	\N	1899-10-13	http://en.wikipedia.org/wiki/Piero_Dusio
167	galvez	Oscar	Gálvez	\N	Argentine	\N	1913-08-17	http://en.wikipedia.org/wiki/%C3%93scar_Alfredo_G%C3%A1lvez
168	john_barber	John	Barber	\N	British	\N	1929-07-22	http://en.wikipedia.org/wiki/John_Barber_(racing_driver)
169	menditeguy	Carlos	Menditeguy	\N	Argentine	\N	1914-08-10	http://en.wikipedia.org/wiki/Carlos_Menditeguy
170	birger	Pablo	Birger	\N	Argentine	\N	1924-01-07	http://en.wikipedia.org/wiki/Pablo_Birger
171	cruz	Adolfo	Cruz	\N	Argentine	\N	1923-06-28	http://en.wikipedia.org/wiki/Adolfo_Schewelm_Cruz
172	daywalt	Jimmy	Daywalt	\N	American	\N	1924-08-28	http://en.wikipedia.org/wiki/Jimmy_Daywalt
173	mccoy	Ernie	McCoy	\N	American	\N	1921-02-19	http://en.wikipedia.org/wiki/Ernie_McCoy
174	mantz	Johnny	Mantz	\N	American	\N	1918-09-18	http://en.wikipedia.org/wiki/Johnny_Mantz
175	teague	Marshall	Teague	\N	American	\N	1921-02-22	http://en.wikipedia.org/wiki/Marshall_Teague_(racing_driver)
176	thomson	Johnny	Thomson	\N	American	\N	1922-04-09	http://en.wikipedia.org/wiki/Johnny_Thomson
177	freeland	Don	Freeland	\N	American	\N	1925-03-25	http://en.wikipedia.org/wiki/Don_Freeland
178	niday	Cal	Niday	\N	American	\N	1914-04-29	http://en.wikipedia.org/wiki/Cal_Niday
179	mieres	Roberto	Mieres	\N	Argentine	\N	1924-12-03	http://en.wikipedia.org/wiki/Roberto_Mieres
180	wacker	Fred	Wacker	\N	American	\N	1918-07-10	http://en.wikipedia.org/wiki/Fred_Wacker
181	georges_berger	Georges	Berger	\N	Belgian	\N	1918-09-14	http://en.wikipedia.org/wiki/Georges_Berger
182	jimmy_stewart	Jimmy	Stewart	\N	British	\N	1931-03-06	http://en.wikipedia.org/wiki/Jimmy_Stewart_(racing_driver)
183	fairman	Jack	Fairman	\N	British	\N	1913-03-15	http://en.wikipedia.org/wiki/Jack_Fairman
184	ian_stewart	Ian	Stewart	\N	British	\N	1929-07-15	http://en.wikipedia.org/wiki/Ian_Stewart_(racing_driver)
185	herrmann	Hans	Herrmann	\N	German	\N	1928-02-23	http://en.wikipedia.org/wiki/Hans_Herrmann
186	nuckey	Rodney	Nuckey	\N	British	\N	1929-06-26	http://en.wikipedia.org/wiki/Rodney_Nuckey
187	seidel	Wolfgang	Seidel	\N	German	\N	1926-07-04	http://en.wikipedia.org/wiki/Wolfgang_Seidel
188	barth	Edgar	Barth	\N	German	\N	1917-01-26	http://en.wikipedia.org/wiki/Edgar_Barth
189	karch	Oswald	Karch	\N	German	\N	1917-03-06	http://en.wikipedia.org/wiki/Oswald_Karch
190	fitzau	Theo	Fitzau	\N	East German	\N	1923-02-10	http://en.wikipedia.org/wiki/Theo_Fitzau
191	adolff	Kurt	Adolff	\N	German	\N	1921-11-05	http://en.wikipedia.org/wiki/Kurt_Adolff
192	bauer	Erwin	Bauer	\N	German	\N	1912-07-17	http://en.wikipedia.org/wiki/Erwin_Bauer
193	loof	Ernst	Loof	\N	German	\N	1907-07-04	http://en.wikipedia.org/wiki/Ernst_Loof
194	lang	Hermann	Lang	\N	German	\N	1909-04-06	http://en.wikipedia.org/wiki/Hermann_Lang
195	scherrer	Albert	Scherrer	\N	Swiss	\N	1908-02-28	http://en.wikipedia.org/wiki/Albert_Scherrer
196	musso	Luigi	Musso	\N	Italian	\N	1924-07-28	http://en.wikipedia.org/wiki/Luigi_Musso
197	mantovani	Sergio	Mantovani	\N	Italian	\N	1929-05-22	http://en.wikipedia.org/wiki/Sergio_Mantovani
198	maglioli	Umberto	Maglioli	\N	Italian	\N	1928-06-05	http://en.wikipedia.org/wiki/Umberto_Maglioli
199	fitch	John	Fitch	\N	American	\N	1917-08-04	http://en.wikipedia.org/wiki/John_Fitch_(driver)
200	loyer	Roger	Loyer	\N	French	\N	1907-08-05	http://en.wikipedia.org/wiki/Roger_Loyer
201	daponte	Jorge	Daponte	\N	Argentine	\N	1923-06-05	http://en.wikipedia.org/wiki/Jorge_Daponte
202	crockett	Larry	Crockett	\N	American	\N	1926-10-23	http://en.wikipedia.org/wiki/Larry_Crockett
203	elisian	Ed	Elisian	\N	American	\N	1926-12-09	http://en.wikipedia.org/wiki/Ed_Elisian
204	armi	Frank	Armi	\N	American	\N	1918-10-12	http://en.wikipedia.org/wiki/Frank_Armi
205	connor	Pat	O'Connor	\N	American	\N	1928-10-09	http://en.wikipedia.org/wiki/Pat_O%27Connor_(auto_racer)
206	kladis	Danny	Kladis	\N	American	\N	1917-02-10	http://en.wikipedia.org/wiki/Danny_Kladis
207	duncan	Len	Duncan	\N	American	\N	1911-07-25	http://en.wikipedia.org/wiki/Len_Duncan
208	homeier	Bill	Homeier	\N	American	\N	1918-08-31	http://en.wikipedia.org/wiki/Bill_Homeier
209	kling	Karl	Kling	\N	German	\N	1910-09-16	http://en.wikipedia.org/wiki/Karl_Kling
210	pollet	Jacques	Pollet	\N	French	\N	1922-07-02	http://en.wikipedia.org/wiki/Jacques_Pollet
211	beauman	Don	Beauman	\N	British	\N	1928-07-26	http://en.wikipedia.org/wiki/Don_Beauman
212	marr	Leslie	Marr	\N	British	\N	1922-08-14	http://en.wikipedia.org/wiki/Leslie_Marr
213	thorne	Leslie	Thorne	\N	British	\N	1916-06-23	http://en.wikipedia.org/wiki/Leslie_Thorne
214	gould	Horace	Gould	\N	British	\N	1918-09-20	http://en.wikipedia.org/wiki/Horace_Gould
215	whitehouse	Bill	Whitehouse	\N	British	\N	1909-04-01	http://en.wikipedia.org/wiki/Bill_Whitehouse
216	flockhart	Ron	Flockhart	\N	British	\N	1923-06-16	http://en.wikipedia.org/wiki/Ron_Flockhart_(auto_racing)
217	riseley_prichard	John	Riseley-Prichard	\N	British	\N	1924-01-17	http://en.wikipedia.org/wiki/John_Riseley-Prichard
218	bucci	Clemar	Bucci	\N	Argentine	\N	1920-09-04	http://en.wikipedia.org/wiki/Clemar_Bucci
219	riu	Giovanni	de Riu	\N	Italian	\N	1925-03-10	http://en.wikipedia.org/wiki/Giovanni_de_Riu
220	volonterio	Ottorino	Volonterio	\N	Swiss	\N	1917-12-07	http://en.wikipedia.org/wiki/Ottorino_Volonterio
221	iglesias	Jesús	Iglesias	\N	Argentine	\N	1922-02-22	http://en.wikipedia.org/wiki/Jes%C3%BAs_Iglesias
222	castellotti	Eugenio	Castellotti	\N	Italian	\N	1930-10-10	http://en.wikipedia.org/wiki/Eugenio_Castellotti
223	uria	Alberto	Uria	\N	Uruguayan	\N	1924-07-11	http://en.wikipedia.org/wiki/Alberto_Uria
224	perdisa	Cesare	Perdisa	\N	Italian	\N	1932-10-21	http://en.wikipedia.org/wiki/Cesare_Perdisa
225	whiteaway	Ted	Whiteaway	\N	British	\N	1928-11-01	http://en.wikipedia.org/wiki/Ted_Whiteaway
226	herman	Al	Herman	\N	American	\N	1927-03-15	http://en.wikipedia.org/wiki/Al_Herman
227	weyant	Chuck	Weyant	\N	American	\N	1923-04-03	http://en.wikipedia.org/wiki/Chuck_Weyant
228	templeman	Shorty	Templeman	\N	American	\N	1919-08-12	http://en.wikipedia.org/wiki/Shorty_Templeman
229	andrews	Keith	Andrews	\N	American	\N	1920-06-15	http://en.wikipedia.org/wiki/Keith_Andrews_(driver)
230	russo	Eddie	Russo	\N	American	\N	1925-11-19	http://en.wikipedia.org/wiki/Eddie_Russo
231	ray_crawford	Ray	Crawford	\N	American	\N	1915-10-26	http://en.wikipedia.org/wiki/Ray_Crawford
232	keller	Al	Keller	\N	American	\N	1920-04-11	http://en.wikipedia.org/wiki/Al_Keller
233	boyd	Johnny	Boyd	\N	American	\N	1926-08-19	http://en.wikipedia.org/wiki/Johnny_Boyd
234	ramos	Hernando	da Silva Ramos	\N	Brazilian	\N	1925-12-07	http://en.wikipedia.org/wiki/Hernando_da_Silva_Ramos
235	sparken	Mike	Sparken	\N	French	\N	1930-06-16	http://en.wikipedia.org/wiki/Mike_Sparken
236	jack_brabham	Jack	Brabham	\N	Australian	\N	1926-04-02	http://en.wikipedia.org/wiki/Jack_Brabham
237	lucas	Jean	Lucas	\N	French	\N	1917-04-25	http://en.wikipedia.org/wiki/Jean_Lucas
238	piotti	Luigi	Piotti	\N	Italian	\N	1913-10-27	http://en.wikipedia.org/wiki/Luigi_Piotti
239	gerini	Gerino	Gerini	\N	Italian	\N	1928-08-10	http://en.wikipedia.org/wiki/Gerino_Gerini_(racing_driver)
240	gendebien	Olivier	Gendebien	\N	Belgian	\N	1924-01-12	http://en.wikipedia.org/wiki/Olivier_Gendebien
241	oscar_gonzalez	Óscar	González	\N	Uruguayan	\N	1923-11-10	http://en.wikipedia.org/wiki/%C3%93scar_Gonz%C3%A1lez_(racing_driver)
242	scarlatti	Giorgio	Scarlatti	\N	Italian	\N	1921-10-02	http://en.wikipedia.org/wiki/Giorgio_Scarlatti
243	brooks	Tony	Brooks	\N	British	\N	1932-02-25	http://en.wikipedia.org/wiki/Tony_Brooks
244	veith	Bob	Veith	\N	American	\N	1926-11-01	http://en.wikipedia.org/wiki/Bob_Veith
245	christie	Bob	Christie	\N	American	\N	1924-04-04	http://en.wikipedia.org/wiki/Bob_Christie_(racing_driver)
246	garrett	Billy	Garrett	\N	American	\N	1933-04-24	http://en.wikipedia.org/wiki/Billy_Garrett
247	tolan	Johnnie	Tolan	\N	American	\N	1917-10-22	http://en.wikipedia.org/wiki/Johnnie_Tolan
248	turner	Jack	Turner	\N	American	\N	1920-02-12	http://en.wikipedia.org/wiki/Jack_Turner_(driver)
249	scotti	Piero	Scotti	\N	Italian	\N	1909-11-11	http://en.wikipedia.org/wiki/Piero_Scotti
250	portago	Alfonso	de Portago	\N	Spanish	\N	1928-10-11	http://en.wikipedia.org/wiki/Alfonso_de_Portago
251	chapman	Colin	Chapman	\N	British	\N	1928-05-19	http://en.wikipedia.org/wiki/Colin_Chapman
252	titterington	Desmond	Titterington	\N	British	\N	1928-05-01	http://en.wikipedia.org/wiki/Desmond_Titterington
253	halford	Bruce	Halford	\N	British	\N	1931-05-18	http://en.wikipedia.org/wiki/Bruce_Halford
254	scott_Brown	Archie	Scott Brown	\N	British	\N	1927-05-13	http://en.wikipedia.org/wiki/Archie_Scott_Brown
255	emery	Paul	Emery	\N	British	\N	1916-11-12	http://en.wikipedia.org/wiki/Paul_Emery
256	milhoux	André	Milhoux	\N	Belgian	\N	1928-12-09	http://en.wikipedia.org/wiki/Andr%C3%A9_Milhoux
257	bonnier	Jo	Bonnier	\N	Swedish	\N	1930-01-31	http://en.wikipedia.org/wiki/Joakim_Bonnier
258	leston	Les	Leston	\N	British	\N	1920-12-16	http://en.wikipedia.org/wiki/Les_Leston
259	trips	Wolfgang	von Trips	\N	German	\N	1928-05-04	http://en.wikipedia.org/wiki/Wolfgang_Graf_Berghe_von_Trips
260	tomaso	Alessandro	de Tomaso	\N	Argentine-Italian	\N	1928-07-10	http://en.wikipedia.org/wiki/Alessandro_de_Tomaso
261	gregory	Masten	Gregory	\N	American	\N	1932-02-29	http://en.wikipedia.org/wiki/Masten_Gregory
262	lewis-evans	Stuart	Lewis-Evans	\N	British	\N	1930-04-20	http://en.wikipedia.org/wiki/Stuart_Lewis-Evans
263	bueb	Ivor	Bueb	\N	British	\N	1923-06-06	http://en.wikipedia.org/wiki/Ivor_Bueb
264	edmunds	Don	Edmunds	\N	American	\N	1930-09-23	http://en.wikipedia.org/wiki/Don_Edmunds
265	sachs	Eddie	Sachs	\N	American	\N	1927-05-28	http://en.wikipedia.org/wiki/Eddie_Sachs
266	magill	Mike	Magill	\N	American	\N	1920-02-08	http://en.wikipedia.org/wiki/Mike_Magill
267	cheesbourg	Bill	Cheesbourg	\N	American	\N	1927-06-12	http://en.wikipedia.org/wiki/Bill_Cheesbourg
268	george	Elmer	George	\N	American	\N	1928-07-15	http://en.wikipedia.org/wiki/Elmer_George
269	macdowel	Mike	MacDowel	\N	British	\N	1932-09-13	http://en.wikipedia.org/wiki/Mike_MacDowel
270	mackay-fraser	Herbert	MacKay-Fraser	\N	American	\N	1927-06-23	http://en.wikipedia.org/wiki/Herbert_MacKay-Fraser
271	naylor	Brian	Naylor	\N	British	\N	1923-03-24	http://en.wikipedia.org/wiki/Brian_Naylor
272	beaufort	Carel Godin	de Beaufort	\N	Dutch	\N	1934-04-10	http://en.wikipedia.org/wiki/Carel_Godin_de_Beaufort
273	marsh	Tony	Marsh	\N	British	\N	1931-07-20	http://en.wikipedia.org/wiki/Tony_Marsh_(racing_driver)
274	england	Paul	England	\N	Australian	\N	1929-03-28	http://en.wikipedia.org/wiki/Paul_England
275	gibson	Dick	Gibson	\N	British	\N	1918-04-16	http://en.wikipedia.org/wiki/Dick_Gibson
276	allison	Cliff	Allison	\N	British	\N	1932-02-08	http://en.wikipedia.org/wiki/Cliff_Allison
277	hill	Graham	Hill	\N	British	\N	1929-02-15	http://en.wikipedia.org/wiki/Graham_Hill
278	kavanagh	Ken	Kavanagh	\N	Australian	\N	1923-12-12	http://en.wikipedia.org/wiki/Ken_Kavanagh
279	kessler	Bruce	Kessler	\N	American	\N	1936-03-23	http://en.wikipedia.org/wiki/Bruce_Kessler
280	filippis	Maria	de Filippis	\N	Italian	\N	1926-11-11	http://en.wikipedia.org/wiki/Maria_Teresa_de_Filippis
281	testut	André	Testut	\N	Monegasque	\N	1926-04-13	http://en.wikipedia.org/wiki/Andr%C3%A9_Testut
282	cabianca	Giulio	Cabianca	\N	Italian	\N	1923-02-19	http://en.wikipedia.org/wiki/Giulio_Cabianca
283	ecclestone	Bernie	Ecclestone	\N	British	\N	1930-10-28	http://en.wikipedia.org/wiki/Bernie_Ecclestone
284	taramazzo	Luigi	Taramazzo	\N	Italian	\N	1932-05-05	http://en.wikipedia.org/wiki/Luigi_Taramazzo
285	george_amick	George	Amick	\N	American	\N	1924-10-24	http://en.wikipedia.org/wiki/George_Amick
286	larson	Jud	Larson	\N	American	\N	1923-01-21	http://en.wikipedia.org/wiki/Jud_Larson
287	dempsey_wilson	Dempsey	Wilson	\N	American	\N	1927-03-11	http://en.wikipedia.org/wiki/Dempsey_Wilson
288	foyt	Anthony	Foyt	\N	American	\N	1935-01-16	http://en.wikipedia.org/wiki/A.J._Foyt
289	goldsmith	Paul	Goldsmith	\N	American	\N	1925-10-02	http://en.wikipedia.org/wiki/Paul_Goldsmith
290	jerry_unser	Jerry	Unser	\N	American	\N	1932-11-15	http://en.wikipedia.org/wiki/Jerry_Unser
291	sutton	Len	Sutton	\N	American	\N	1925-08-09	http://en.wikipedia.org/wiki/Len_Sutton
292	bisch	Art	Bisch	\N	American	\N	1926-11-10	http://en.wikipedia.org/wiki/Art_Bisch
293	phil_hill	Phil	Hill	\N	American	\N	1927-04-20	http://en.wikipedia.org/wiki/Phil_Hill
294	shelby	Carroll	Shelby	\N	American	\N	1923-01-11	http://en.wikipedia.org/wiki/Carroll_Shelby
295	burgess	Ian	Burgess	\N	British	\N	1930-07-06	http://en.wikipedia.org/wiki/Ian_Burgess
296	stacey	Alan	Stacey	\N	British	\N	1933-08-29	http://en.wikipedia.org/wiki/Alan_Stacey
297	mclaren	Bruce	McLaren	\N	New Zealander	\N	1937-08-30	http://en.wikipedia.org/wiki/Bruce_McLaren
298	goethals	Christian	Goethals	\N	Belgian	\N	1928-08-04	http://en.wikipedia.org/wiki/Christian_Goethals
299	la_caze	Robert	La Caze	\N	French	\N	1917-02-26	http://en.wikipedia.org/wiki/Robert_La_Caze
300	guelfi	André	Guelfi	\N	French	\N	1919-05-06	http://en.wikipedia.org/wiki/Andr%C3%A9_Guelfi
301	picard	François	Picard	\N	French	\N	1921-04-26	http://en.wikipedia.org/wiki/Fran%C3%A7ois_Picard
302	bridger	Tom	Bridger	\N	British	\N	1934-06-24	http://en.wikipedia.org/wiki/Tom_Bridger
303	Changy	Alain	de Changy	\N	Belgian	\N	1922-02-05	http://en.wikipedia.org/wiki/Alain_de_Changy
304	bianchi	Lucien	Bianchi	BIA	Belgian	\N	1934-11-10	http://en.wikipedia.org/wiki/Lucien_Bianchi
305	lovely	Pete	Lovely	\N	American	\N	1926-04-11	http://en.wikipedia.org/wiki/Pete_Lovely
306	lucienbonnet	Jean	Lucienbonnet	\N	French	\N	1923-01-07	http://en.wikipedia.org/wiki/Jean_Lucienbonnet
307	arnold	Chuck	Arnold	\N	American	\N	1926-05-30	http://en.wikipedia.org/wiki/Chuck_Arnold
308	mcwithey	Jim	McWithey	\N	American	\N	1927-07-04	http://en.wikipedia.org/wiki/Jim_McWithey
309	branson	Don	Branson	\N	American	\N	1920-06-02	http://en.wikipedia.org/wiki/Don_Branson
310	grim	Bobby	Grim	\N	American	\N	1924-09-04	http://en.wikipedia.org/wiki/Bobby_Grim
311	amick	Red	Amick	\N	American	\N	1929-01-19	http://en.wikipedia.org/wiki/Red_Amick
312	ireland	Innes	Ireland	\N	British	\N	1930-06-12	http://en.wikipedia.org/wiki/Innes_Ireland
313	orey	Fritz	d'Orey	\N	Brazilian	\N	1938-03-25	http://en.wikipedia.org/wiki/Fritz_d%27Orey
314	gurney	Dan	Gurney	\N	American	\N	1931-04-13	http://en.wikipedia.org/wiki/Dan_Gurney
315	davis	Colin	Davis	\N	British	\N	1933-07-29	http://en.wikipedia.org/wiki/Colin_Davis_(driver)
316	fontes	Azdrubal	Fontes	\N	Uruguayan	\N	1922-12-26	http://en.wikipedia.org/wiki/Azdrubal_Fontes
317	bristow	Chris	Bristow	\N	British	\N	1937-12-02	http://en.wikipedia.org/wiki/Chris_Bristow
318	henry_taylor	Henry	Taylor	\N	British	\N	1932-12-16	http://en.wikipedia.org/wiki/Henry_Taylor_(racing_driver)
319	ashdown	Peter	Ashdown	\N	British	\N	1934-10-16	http://en.wikipedia.org/wiki/Peter_Ashdown
320	piper	David	Piper	\N	British	\N	1930-12-02	http://en.wikipedia.org/wiki/David_Piper
321	mike_taylor	Mike	Taylor	\N	British	\N	1934-04-24	http://en.wikipedia.org/wiki/Mike_Taylor_(driver)
322	greene	Keith	Greene	\N	British	\N	1938-01-05	http://en.wikipedia.org/wiki/Keith_Greene
323	bill_moss	Bill	Moss	\N	British	\N	1933-09-04	http://en.wikipedia.org/wiki/Bill_Moss_(racing_driver)
324	parkes	Mike	Parkes	\N	British	\N	1931-09-24	http://en.wikipedia.org/wiki/Mike_Parkes
325	dennis_taylor	Dennis	Taylor	\N	British	\N	1921-06-12	http://en.wikipedia.org/wiki/Dennis_Taylor_(racing_driver)
326	trevor_taylor	Trevor	Taylor	\N	British	\N	1936-12-26	http://en.wikipedia.org/wiki/Trevor_Taylor
327	parnell	Tim	Parnell	\N	British	\N	1932-06-25	http://en.wikipedia.org/wiki/Tim_Parnell
328	cabral	Mário de Araújo	Cabral	\N	Portuguese	\N	1934-01-15	http://en.wikipedia.org/wiki/Mario_de_Araujo_Cabral
329	blanchard	Harry	Blanchard	\N	American	\N	1929-06-13	http://en.wikipedia.org/wiki/Harry_Blanchard
330	constantine	George	Constantine	\N	American	\N	1918-02-22	http://en.wikipedia.org/wiki/George_Constantine
331	said	Bob	Said	\N	American	\N	1932-05-05	http://en.wikipedia.org/wiki/Bob_Said
332	cade	Phil	Cade	\N	American	\N	1916-06-12	http://en.wikipedia.org/wiki/Phil_Cade
333	larreta	Alberto Rodriguez	Larreta	\N	Argentine	\N	1934-01-14	http://en.wikipedia.org/wiki/Alberto_Rodriguez_Larreta
334	bonomi	Roberto	Bonomi	\N	Argentine	\N	1919-09-30	http://en.wikipedia.org/wiki/Roberto_Bonomi
335	munaron	Gino	Munaron	\N	Italian	\N	1928-04-02	http://en.wikipedia.org/wiki/Gino_Munaron
336	estefano	Nasif	Estéfano	\N	Argentine	\N	1932-11-18	http://en.wikipedia.org/wiki/Nasif_Est%C3%A9fano
337	chimeri	Ettore	Chimeri	\N	Venezuelan	\N	1921-06-04	http://en.wikipedia.org/wiki/Ettore_Chimeri
338	creus	Antonio	Creus	\N	Spanish	\N	1924-10-28	http://en.wikipedia.org/wiki/Antonio_Creus
339	ginther	Richie	Ginther	\N	American	\N	1930-08-05	http://en.wikipedia.org/wiki/Richie_Ginther
340	surtees	John	Surtees	\N	British	\N	1934-02-11	http://en.wikipedia.org/wiki/John_Surtees
341	daigh	Chuck	Daigh	\N	American	\N	1923-11-29	http://en.wikipedia.org/wiki/Chuck_Daigh
342	reventlow	Lance	Reventlow	\N	American	\N	1936-02-24	http://en.wikipedia.org/wiki/Lance_Reventlow
343	ruby	Lloyd	Ruby	\N	American	\N	1928-01-12	http://en.wikipedia.org/wiki/Lloyd_Ruby
344	tingelstad	Bud	Tingelstad	\N	American	\N	1928-04-04	http://en.wikipedia.org/wiki/Bud_Tingelstad
345	hurtubise	Jim	Hurtubise	\N	American	\N	1932-12-05	http://en.wikipedia.org/wiki/Jim_Hurtubise
346	weiler	Wayne	Weiler	\N	American	\N	1934-12-09	http://en.wikipedia.org/wiki/Wayne_Weiler
347	clark	Jim	Clark	\N	British	\N	1936-03-04	http://en.wikipedia.org/wiki/Jim_Clark
348	mairesse	Willy	Mairesse	\N	Belgian	\N	1928-10-01	http://en.wikipedia.org/wiki/Willy_Mairesse
349	drogo	Piero	Drogo	\N	Italian	\N	1926-08-08	http://en.wikipedia.org/wiki/Piero_Drogo
350	gamble	Fred	Gamble	\N	American	\N	1932-03-17	http://en.wikipedia.org/wiki/Fred_Gamble_(racing_driver)
351	thiele	Alfonso	Thiele	\N	American-Italian	\N	1920-04-05	http://en.wikipedia.org/wiki/Alfonso_Thiele
352	vic_wilson	Vic	Wilson	\N	British	\N	1931-04-14	http://en.wikipedia.org/wiki/Vic_Wilson_(motor_racing_driver)
353	owen	Arthur	Owen	\N	British	\N	1915-03-23	http://en.wikipedia.org/wiki/Arthur_Owen
354	hall	Jim	Hall	\N	American	\N	1935-07-23	http://en.wikipedia.org/wiki/Jim_Hall_(race_car_driver)
355	drake	Bob	Drake	\N	American	\N	1919-12-14	http://en.wikipedia.org/wiki/Bob_Drake_(Formula_One)
356	may	Michael	May	\N	Swiss	\N	1934-08-18	http://en.wikipedia.org/wiki/Michael_May_(racing_driver)
357	lewis	Jackie	Lewis	\N	British	\N	1936-11-01	http://en.wikipedia.org/wiki/Jackie_Lewis
358	bandini	Lorenzo	Bandini	\N	Italian	\N	1935-12-21	http://en.wikipedia.org/wiki/Lorenzo_Bandini
359	baghetti	Giancarlo	Baghetti	\N	Italian	\N	1934-12-25	http://en.wikipedia.org/wiki/Giancarlo_Baghetti
360	collomb	Bernard	Collomb	\N	French	\N	1930-10-07	http://en.wikipedia.org/wiki/Bernard_Collomb
361	bordeu	Juan Manuel	Bordeu	\N	Argentine	\N	1934-01-28	http://en.wikipedia.org/wiki/Juan_Manuel_Bordeu
362	maggs	Tony	Maggs	\N	South African	\N	1937-02-09	http://en.wikipedia.org/wiki/Tony_Maggs
363	ashmore	Gerry	Ashmore	\N	British	\N	1936-07-25	http://en.wikipedia.org/wiki/Gerry_Ashmore
364	natili	Massimo	Natili	\N	Italian	\N	1935-07-28	http://en.wikipedia.org/wiki/Massimo_Natili
365	monteverdi	Peter	Monteverdi	\N	Swiss	\N	1934-06-07	http://en.wikipedia.org/wiki/Peter_Monteverdi
366	pirocchi	Renato	Pirocchi	\N	Italian	\N	1933-03-26	http://en.wikipedia.org/wiki/Renato_Pirocchi
367	duke	Geoff	Duke	\N	British	\N	1923-03-29	http://en.wikipedia.org/wiki/Geoff_Duke
368	campbell-jones	John	Campbell-Jones	\N	British	\N	1930-01-21	http://en.wikipedia.org/wiki/John_Campbell-Jones
369	starrabba	Gaetano	Starrabba	\N	Italian	\N	1932-12-03	http://en.wikipedia.org/wiki/Gaetano_Starrabba
370	ricardo_rodriguez	Ricardo	Rodríguez	\N	Mexican	\N	1942-02-14	http://en.wikipedia.org/wiki/Ricardo_Rodr%C3%ADguez_(Formula_One)
371	vaccarella	Nino	Vaccarella	\N	Italian	\N	1933-03-04	http://en.wikipedia.org/wiki/Nino_Vaccarella
372	bussinello	Roberto	Bussinello	\N	Italian	\N	1927-10-04	http://en.wikipedia.org/wiki/Roberto_Bussinello
373	lippi	Roberto	Lippi	\N	Italian	\N	1926-10-17	http://en.wikipedia.org/wiki/Roberto_Lippi
374	prinoth	Ernesto	Prinoth	\N	Italian	\N	1923-04-15	http://en.wikipedia.org/wiki/Ernesto_Prinoth
375	boffa	Menato	Boffa	\N	Italian	\N	1930-01-04	http://en.wikipedia.org/wiki/Menato_Boffa
376	penske	Roger	Penske	\N	American	\N	1937-02-20	http://en.wikipedia.org/wiki/Roger_Penske
377	ryan	Peter	Ryan	\N	Canadian	\N	1940-06-10	http://en.wikipedia.org/wiki/Peter_Ryan_(driver)
378	sharp	Hap	Sharp	\N	American	\N	1928-01-01	http://en.wikipedia.org/wiki/Hap_Sharp
379	hansgen	Walt	Hansgen	\N	American	\N	1919-10-28	http://en.wikipedia.org/wiki/Walt_Hansgen
380	ken_miles	Ken	Miles	\N	British	\N	1918-11-01	http://en.wikipedia.org/wiki/Ken_Miles
381	pon	Ben	Pon	\N	Dutch	\N	1936-12-09	http://en.wikipedia.org/wiki/Ben_Pon
382	slotemaker	Rob	Slotemaker	\N	Dutch	\N	1929-06-13	http://en.wikipedia.org/wiki/Rob_Slotemaker
383	siffert	Jo	Siffert	\N	Swiss	\N	1936-07-07	http://en.wikipedia.org/wiki/Jo_Siffert
384	schiller	Heinz	Schiller	\N	Swiss	\N	1930-01-25	http://en.wikipedia.org/wiki/Heinz_Schiller
385	arundell	Peter	Arundell	\N	British	\N	1933-11-08	http://en.wikipedia.org/wiki/Peter_Arundell
386	abate	Carlo	Abate	\N	Italian	\N	1932-07-10	http://en.wikipedia.org/wiki/Carlo_Mario_Abate
387	settember	Tony	Settember	\N	American	\N	1926-07-10	http://en.wikipedia.org/wiki/Tony_Settember
388	chamberlain	Jay	Chamberlain	\N	American	\N	1925-12-29	http://en.wikipedia.org/wiki/Jay_Chamberlain
389	shelly	Tony	Shelly	\N	New Zealander	\N	1937-02-02	http://en.wikipedia.org/wiki/Tony_Shelly
390	walter	Heini	Walter	\N	Swiss	\N	1927-07-28	http://en.wikipedia.org/wiki/Heini_Walter
391	seiffert	Günther	Seiffert	\N	German	\N	1937-10-18	http://en.wikipedia.org/wiki/G%C3%BCnther_Seiffert
392	kuhnke	Kurt	Kuhnke	\N	German	\N	1910-04-30	http://en.wikipedia.org/wiki/Kurt_Kuhnke
393	schroeder	Rob	Schroeder	\N	British	\N	1926-05-11	http://en.wikipedia.org/wiki/Rob_Schroeder
394	mayer	Timmy	Mayer	\N	American	\N	1938-02-22	http://en.wikipedia.org/wiki/Timmy_Mayer
395	lederle	Neville	Lederle	\N	South African	\N	1938-09-25	http://en.wikipedia.org/wiki/Neville_Lederle
396	love	John	Love	\N	Rhodesian	\N	1924-12-07	http://en.wikipedia.org/wiki/John_Love_(racing_driver)
397	johnstone	Bruce	Johnstone	\N	South African	\N	1937-01-30	http://en.wikipedia.org/wiki/Bruce_Johnstone_(racing_driver)
398	pieterse	Ernie	Pieterse	\N	South African	\N	1938-07-04	http://en.wikipedia.org/wiki/Ernie_Pieterse
399	serrurier	Doug	Serrurier	\N	South African	\N	1920-12-09	http://en.wikipedia.org/wiki/Doug_Serrurier
400	harris	Mike	Harris	\N	South African	\N	1939-05-25	http://en.wikipedia.org/wiki/Mike_Harris_(race_car_driver)
401	hocking	Gary	Hocking	\N	Rhodesian	\N	1937-09-30	http://en.wikipedia.org/wiki/Gary_Hocking
402	vyver	Syd	van der Vyver	\N	South African	\N	1920-06-01	http://en.wikipedia.org/wiki/Syd_van_der_Vyver
403	tingle	Sam	Tingle	\N	Rhodesian	\N	1921-08-24	http://en.wikipedia.org/wiki/Sam_Tingle
404	amon	Chris	Amon	\N	New Zealander	\N	1943-07-20	http://en.wikipedia.org/wiki/Chris_Amon
405	scarfiotti	Ludovico	Scarfiotti	\N	Italian	\N	1933-10-18	http://en.wikipedia.org/wiki/Ludovico_Scarfiotti
406	mitter	Gerhard	Mitter	\N	German	\N	1935-08-30	http://en.wikipedia.org/wiki/Gerhard_Mitter
407	hailwood	Mike	Hailwood	\N	British	\N	1940-04-02	http://en.wikipedia.org/wiki/Mike_Hailwood
408	anderson	Bob	Anderson	\N	British	\N	1931-05-19	http://en.wikipedia.org/wiki/Bob_Anderson_(racing_driver)
409	raby	Ian	Raby	\N	British	\N	1921-09-22	http://en.wikipedia.org/wiki/Ian_Raby
410	spence	Mike	Spence	\N	British	\N	1936-12-30	http://en.wikipedia.org/wiki/Mike_Spence
411	ernesto_brambilla	Ernesto	Brambilla	\N	Italian	\N	1934-01-31	http://en.wikipedia.org/wiki/Ernesto_Brambilla
412	broeker	Peter	Broeker	\N	Canadian	\N	1926-05-15	http://en.wikipedia.org/wiki/Peter_Broeker
413	rodriguez	Pedro	Rodríguez	\N	Mexican	\N	1940-01-18	http://en.wikipedia.org/wiki/Pedro_Rodr%C3%ADguez_(racing_driver)
414	vos	Ernie	de Vos	\N	Dutch	\N	1941-07-01	http://en.wikipedia.org/wiki/Ernie_de_Vos
415	solana	Moisés	Solana	\N	Mexican	\N	1935-12-26	http://en.wikipedia.org/wiki/Mois%C3%A9s_Solana
416	dochnal	Frank	Dochnal	\N	American	\N	1920-10-08	http://en.wikipedia.org/wiki/Frank_Dochnal
417	monarch	Thomas	Monarch	\N	American	\N	1945-09-03	http://en.wikipedia.org/wiki/Talk:1963_Mexican_Grand_Prix#Who_was_Thomas_Monarch.3F
418	blokdyk	Trevor	Blokdyk	\N	South African	\N	1935-11-30	http://en.wikipedia.org/wiki/Trevor_Blokdyk
419	niemann	Brausch	Niemann	\N	South African	\N	1939-01-07	http://en.wikipedia.org/wiki/Brausch_Niemann
420	klerk	Peter	de Klerk	\N	South African	\N	1935-03-16	http://en.wikipedia.org/wiki/Peter_de_Klerk
421	prophet	David	Prophet	\N	British	\N	1937-10-09	http://en.wikipedia.org/wiki/David_Prophet
422	driver	Paddy	Driver	\N	South African	\N	1934-05-13	http://en.wikipedia.org/wiki/Paddy_Driver
423	revson	Peter	Revson	\N	American	\N	1939-02-27	http://en.wikipedia.org/wiki/Peter_Revson
424	taylor	John	Taylor	\N	British	\N	1933-03-23	http://en.wikipedia.org/wiki/John_Taylor_(racer)
425	gardner	Frank	Gardner	\N	Australian	\N	1930-10-01	http://en.wikipedia.org/wiki/Frank_Gardner_(driver)
426	attwood	Richard	Attwood	\N	British	\N	1940-04-04	http://en.wikipedia.org/wiki/Richard_Attwood
427	bucknum	Ronnie	Bucknum	\N	American	\N	1936-04-05	http://en.wikipedia.org/wiki/Ronnie_Bucknum
428	rindt	Jochen	Rindt	\N	Austrian	\N	1942-04-18	http://en.wikipedia.org/wiki/Jochen_Rindt
429	geki	Giacomo	Russo	\N	Italian	\N	1937-10-23	http://en.wikipedia.org/wiki/Geki_(driver)
430	stewart	Jackie	Stewart	\N	British	\N	1939-06-11	http://en.wikipedia.org/wiki/Jackie_Stewart
431	hawkins	Paul	Hawkins	\N	Australian	\N	1937-10-12	http://en.wikipedia.org/wiki/Paul_Hawkins_(racing_driver)
432	puzey	Clive	Puzey	\N	Rhodesian	\N	1941-07-11	http://en.wikipedia.org/wiki/Clive_Puzey
433	pretorius	Jackie	Pretorius	\N	South African	\N	1934-11-22	http://en.wikipedia.org/wiki/Jackie_Pretorius
434	charlton	Dave	Charlton	\N	South African	\N	1936-10-27	http://en.wikipedia.org/wiki/Dave_Charlton
435	reed	Ray	Reed	\N	South African	\N	1932-04-30	http://en.wikipedia.org/wiki/Ray_Reed
436	clapham	David	Clapham	\N	South African	\N	1931-05-18	http://en.wikipedia.org/wiki/David_Clapham
437	blignaut	Alex	Blignaut	\N	South African	\N	1932-11-30	http://en.wikipedia.org/wiki/Alex_Blignaut
438	hulme	Denny	Hulme	\N	New Zealander	\N	1936-06-18	http://en.wikipedia.org/wiki/Denny_Hulme
439	rhodes	John	Rhodes	\N	British	\N	1927-08-18	http://en.wikipedia.org/wiki/John_Rhodes_(driver)
440	rollinson	Alan	Rollinson	\N	British	\N	1943-05-15	http://en.wikipedia.org/wiki/Alan_Rollinson
441	gubby	Brian	Gubby	\N	British	\N	1934-04-17	http://en.wikipedia.org/wiki/Brian_Gubby
442	bassi	Giorgio	Bassi	\N	Italian	\N	1934-01-20	http://en.wikipedia.org/wiki/Giorgio_Bassi
443	bondurant	Bob	Bondurant	\N	American	\N	1933-04-27	http://en.wikipedia.org/wiki/Bob_Bondurant
444	ligier	Guy	Ligier	\N	French	\N	1930-07-12	http://en.wikipedia.org/wiki/Guy_Ligier
445	irwin	Chris	Irwin	\N	British	\N	1942-06-27	http://en.wikipedia.org/wiki/Chris_Irwin
446	lawrence	Chris	Lawrence	\N	British	\N	1933-07-27	http://en.wikipedia.org/wiki/Chris_Lawrence_(racing_driver)
447	botha	Luki	Botha	\N	South African	\N	1930-01-16	http://en.wikipedia.org/wiki/Luki_Botha
448	courage	Piers	Courage	\N	British	\N	1942-05-27	http://en.wikipedia.org/wiki/Piers_Courage
449	gavin	Johnny	Servoz-Gavin	\N	French	\N	1942-01-18	http://en.wikipedia.org/wiki/Johnny_Servoz-Gavin
450	beltoise	Jean-Pierre	Beltoise	\N	French	\N	1937-04-26	http://en.wikipedia.org/wiki/Jean-Pierre_Beltoise
451	hobbs	David	Hobbs	\N	British	\N	1939-06-09	http://en.wikipedia.org/wiki/David_Hobbs_(racing_driver)
452	rees	Alan	Rees	\N	British	\N	1938-01-12	http://en.wikipedia.org/wiki/Alan_Rees_(racing_driver)
453	moser	Silvio	Moser	\N	Swiss	\N	1941-04-24	http://en.wikipedia.org/wiki/Silvio_Moser
454	oliver	Jackie	Oliver	\N	British	\N	1942-08-14	http://en.wikipedia.org/wiki/Jackie_Oliver
455	ickx	Jacky	Ickx	\N	Belgian	\N	1945-01-01	http://en.wikipedia.org/wiki/Jacky_Ickx
456	hart	Brian	Hart	\N	British	\N	1936-09-07	http://en.wikipedia.org/wiki/Brian_Hart
457	hahne	Hubert	Hahne	\N	German	\N	1935-03-28	http://en.wikipedia.org/wiki/Hubert_Hahne
458	ahrens	Kurt	Ahrens	\N	German	\N	1940-04-19	http://en.wikipedia.org/wiki/Kurt_Ahrens,_Jr.
459	jo_schlesser	Jo	Schlesser	\N	French	\N	1928-05-18	http://en.wikipedia.org/wiki/Jo_Schlesser
460	fisher	Mike	Fisher	\N	American	\N	1943-03-13	http://en.wikipedia.org/wiki/Mike_Fisher_(driver)
461	wietzes	Eppie	Wietzes	\N	Canadian	\N	1938-05-28	http://en.wikipedia.org/wiki/Eppie_Wietzes
462	pease	Al	Pease	\N	Canadian	\N	1921-10-15	http://en.wikipedia.org/wiki/Al_Pease
463	tom_jones	Tom	Jones	\N	American	\N	1943-04-26	http://en.wikipedia.org/wiki/Tom_Jones_(auto_racer)
464	williams	Jonathan	Williams	\N	British	\N	1942-10-26	http://en.wikipedia.org/wiki/Jonathan_Williams_(racing_driver)
465	rooyen	Basil	van Rooyen	\N	South African	\N	1939-04-19	http://en.wikipedia.org/wiki/Basil_van_Rooyen
466	adamich	Andrea	de Adamich	\N	Italian	\N	1941-10-03	http://en.wikipedia.org/wiki/Andrea_de_Adamich
467	redman	Brian	Redman	\N	British	\N	1937-03-09	http://en.wikipedia.org/wiki/Brian_Redman
468	elford	Vic	Elford	\N	British	\N	1935-06-10	http://en.wikipedia.org/wiki/Vic_Elford
469	widdows	Robin	Widdows	\N	British	\N	1942-05-27	http://en.wikipedia.org/wiki/Robin_Widdows
470	bell	Derek	Bell	\N	British	\N	1941-10-31	http://en.wikipedia.org/wiki/Derek_Bell_(auto_racer)
471	pescarolo	Henri	Pescarolo	\N	French	\N	1942-09-25	http://en.wikipedia.org/wiki/Henri_Pescarolo
472	brack	Bill	Brack	\N	Canadian	\N	1935-12-26	http://en.wikipedia.org/wiki/Bill_Brack
473	unser	Bobby	Unser	\N	American	\N	1934-02-20	http://en.wikipedia.org/wiki/Bobby_Unser
474	mario_andretti	Mario	Andretti	\N	American	\N	1940-02-28	http://en.wikipedia.org/wiki/Mario_Andretti
475	miles	John	Miles	\N	British	\N	1943-06-14	http://en.wikipedia.org/wiki/John_Miles_(auto_racer)
476	cordts	John	Cordts	\N	Canadian	\N	1935-07-23	http://en.wikipedia.org/wiki/John_Cordts
477	eaton	George	Eaton	\N	Canadian	\N	1945-11-12	http://en.wikipedia.org/wiki/George_Eaton
478	stommelen	Rolf	Stommelen	\N	German	\N	1943-07-11	http://en.wikipedia.org/wiki/Rolf_Stommelen
479	roig	Alex	Soler-Roig	\N	Spanish	\N	1932-10-29	http://en.wikipedia.org/wiki/Alex_Soler-Roig
480	peterson	Ronnie	Peterson	\N	Swedish	\N	1944-02-14	http://en.wikipedia.org/wiki/Ronnie_Peterson
481	giunti	Ignazio	Giunti	\N	Italian	\N	1941-08-30	http://en.wikipedia.org/wiki/Ignazio_Giunti
482	regazzoni	Clay	Regazzoni	\N	Swiss	\N	1939-09-05	http://en.wikipedia.org/wiki/Clay_Regazzoni
483	cevert	François	Cevert	\N	French	\N	1944-02-25	http://en.wikipedia.org/wiki/Fran%C3%A7ois_Cevert
484	gethin	Peter	Gethin	\N	British	\N	1940-02-21	http://en.wikipedia.org/wiki/Peter_Gethin
485	emerson_fittipaldi	Emerson	Fittipaldi	\N	Brazilian	\N	1946-12-12	http://en.wikipedia.org/wiki/Emerson_Fittipaldi
486	schenken	Tim	Schenken	\N	Australian	\N	1943-09-26	http://en.wikipedia.org/wiki/Tim_Schenken
487	galli	Nanni	Galli	\N	Italian	\N	1940-10-02	http://en.wikipedia.org/wiki/Nanni_Galli
488	wisell	Reine	Wisell	\N	Swedish	\N	1941-09-30	http://en.wikipedia.org/wiki/Reine_Wisell
489	hutchison	Gus	Hutchison	\N	American	\N	1937-04-26	http://en.wikipedia.org/wiki/Gus_Hutchison
490	westbury	Peter	Westbury	\N	British	\N	1938-05-26	http://en.wikipedia.org/wiki/Peter_Westbury
491	ganley	Howden	Ganley	\N	New Zealander	\N	1941-12-24	http://en.wikipedia.org/wiki/Howden_Ganley
492	barber	Skip	Barber	\N	American	\N	1936-11-16	http://en.wikipedia.org/wiki/Skip_Barber
493	lennep	Gijs	van Lennep	\N	Dutch	\N	1942-03-16	http://en.wikipedia.org/wiki/Gijs_Van_Lennep
494	walker	David	Walker	\N	Australian	\N	1941-06-10	http://en.wikipedia.org/wiki/David_Walker_(racing_driver)
495	mazet	François	Mazet	\N	French	\N	1943-02-24	http://en.wikipedia.org/wiki/Fran%C3%A7ois_Mazet
496	jean	Max	Jean	\N	French	\N	1943-07-27	http://en.wikipedia.org/wiki/Max_Jean
497	beuttler	Mike	Beuttler	\N	British	\N	1940-04-13	http://en.wikipedia.org/wiki/Mike_Beuttler
498	marko	Helmut	Marko	\N	Austrian	\N	1943-04-27	http://en.wikipedia.org/wiki/Helmut_Marko
499	lauda	Niki	Lauda	\N	Austrian	\N	1949-02-22	http://en.wikipedia.org/wiki/Niki_Lauda
500	jarier	Jean-Pierre	Jarier	\N	French	\N	1946-07-10	http://en.wikipedia.org/wiki/Jean-Pierre_Jarier
501	donohue	Mark	Donohue	\N	American	\N	1937-03-18	http://en.wikipedia.org/wiki/Mark_Donohue
502	craft	Chris	Craft	\N	British	\N	1939-11-17	http://en.wikipedia.org/wiki/Chris_Craft_(racing_driver)
503	Cannoc	John	Cannon	\N	Canadian	\N	1933-06-21	http://en.wikipedia.org/wiki/John_Cannon_(auto_racer)
504	posey	Sam	Posey	\N	American	\N	1944-05-26	http://en.wikipedia.org/wiki/Sam_Posey
505	reutemann	Carlos	Reutemann	\N	Argentine	\N	1942-04-12	http://en.wikipedia.org/wiki/Carlos_Reutemann
506	pace	Carlos	Pace	\N	Brazilian	\N	1944-10-06	http://en.wikipedia.org/wiki/Carlos_Pace
507	wilson_fittipaldi	Wilson	Fittipaldi	\N	Brazilian	\N	1943-12-25	http://en.wikipedia.org/wiki/Wilson_Fittipaldi
508	depailler	Patrick	Depailler	\N	French	\N	1944-08-09	http://en.wikipedia.org/wiki/Patrick_Depailler
509	merzario	Arturo	Merzario	\N	Italian	\N	1943-03-11	http://en.wikipedia.org/wiki/Arturo_Merzario
510	migault	François	Migault	\N	French	\N	1944-12-04	http://en.wikipedia.org/wiki/Fran%C3%A7ois_Migault
511	scheckter	Jody	Scheckter	\N	South African	\N	1950-01-29	http://en.wikipedia.org/wiki/Jody_Scheckter
512	bueno	Luiz	Bueno	\N	Brazilian	\N	1937-01-16	http://en.wikipedia.org/wiki/Luiz_Bueno
513	follmer	George	Follmer	\N	American	\N	1934-01-27	http://en.wikipedia.org/wiki/George_Follmer
514	keizan	Eddie	Keizan	\N	South African	\N	1944-09-12	http://en.wikipedia.org/wiki/Eddie_Keizan
515	hunt	James	Hunt	\N	British	\N	1947-08-29	http://en.wikipedia.org/wiki/James_Hunt
516	purley	David	Purley	\N	British	\N	1945-01-26	http://en.wikipedia.org/wiki/David_Purley
517	opel	Rikky	von Opel	\N	Liechtensteiner	\N	1947-10-14	http://en.wikipedia.org/wiki/Rikky_von_Opel
518	watson	John	Watson	\N	British	\N	1946-05-04	http://en.wikipedia.org/wiki/John_Watson_(racing_driver)
519	mass	Jochen	Mass	\N	German	\N	1946-09-30	http://en.wikipedia.org/wiki/Jochen_Mass
520	williamson	Roger	Williamson	\N	British	\N	1948-02-02	http://en.wikipedia.org/wiki/Roger_Williamson
521	mcrae	Graham	McRae	\N	New Zealander	\N	1940-03-05	http://en.wikipedia.org/wiki/Graham_McRae
522	edwards	Guy	Edwards	\N	British	\N	1942-12-30	http://en.wikipedia.org/wiki/Guy_Edwards
523	robarts	Richard	Robarts	\N	British	\N	1944-09-22	http://en.wikipedia.org/wiki/Richard_Robarts
524	stuck	Hans-Joachim	Stuck	\N	German	\N	1951-01-01	http://en.wikipedia.org/wiki/Hans_Joachim_Stuck
525	brambilla	Vittorio	Brambilla	\N	Italian	\N	1937-11-11	http://en.wikipedia.org/wiki/Vittorio_Brambilla
526	ian_scheckter	Ian	Scheckter	\N	South African	\N	1947-08-22	http://en.wikipedia.org/wiki/Ian_Scheckter
527	belso	Tom	Belsø	\N	Danish	\N	1942-08-27	http://en.wikipedia.org/wiki/Tom_Bels%C3%B8
528	schuppan	Vern	Schuppan	\N	Australian	\N	1943-03-19	http://en.wikipedia.org/wiki/Vern_Schuppan
529	pilette	Teddy	Pilette	\N	Belgian	\N	1942-07-26	http://en.wikipedia.org/wiki/Teddy_Pilette
530	pryce	Tom	Pryce	\N	British	\N	1949-06-11	http://en.wikipedia.org/wiki/Tom_Pryce
531	larrousse	Gérard	Larrousse	\N	French	\N	1940-05-23	http://en.wikipedia.org/wiki/G%C3%A9rard_Larrousse
532	kinnunen	Leo	Kinnunen	\N	Finnish	\N	1943-08-05	http://en.wikipedia.org/wiki/Leo_Kinnunen
533	roos	Bertil	Roos	\N	Swedish	\N	1943-10-12	http://en.wikipedia.org/wiki/Bertil_Roos
534	jabouille	Jean-Pierre	Jabouille	\N	French	\N	1942-10-01	http://en.wikipedia.org/wiki/Jean-Pierre_Jabouille
535	dolhem	José	Dolhem	\N	French	\N	1944-04-26	http://en.wikipedia.org/wiki/Jos%C3%A9_Dolhem
536	lombardi	Lella	Lombardi	\N	Italian	\N	1941-03-26	http://en.wikipedia.org/wiki/Lella_Lombardi
537	nicholson	John	Nicholson	\N	New Zealander	\N	1941-10-06	http://en.wikipedia.org/wiki/John_Nicholson_(racing_driver)
538	wilds	Mike	Wilds	\N	British	\N	1946-01-07	http://en.wikipedia.org/wiki/Mike_Wilds
539	ashley	Ian	Ashley	\N	British	\N	1947-10-26	http://en.wikipedia.org/wiki/Ian_Ashley
540	laffite	Jacques	Laffite	\N	French	\N	1943-11-21	http://en.wikipedia.org/wiki/Jacques_Laffite
541	perkins	Larry	Perkins	\N	Australian	\N	1950-03-18	http://en.wikipedia.org/wiki/Larry_Perkins
542	quester	Dieter	Quester	\N	Austrian	\N	1939-05-30	http://en.wikipedia.org/wiki/Dieter_Quester
543	koinigg	Helmuth	Koinigg	\N	Austrian	\N	1948-11-03	http://en.wikipedia.org/wiki/Helmuth_Koinigg
544	facetti	Carlo	Facetti	\N	Italian	\N	1935-06-26	http://en.wikipedia.org/wiki/Carlo_Facetti
545	tunmer	Guy	Tunmer	\N	South African	\N	1948-12-01	http://en.wikipedia.org/wiki/Guy_Tunmer
546	evans	Bob	Evans	\N	British	\N	1947-06-11	http://en.wikipedia.org/wiki/Bob_Evans_(race_driver)
547	brise	Tony	Brise	\N	British	\N	1952-03-28	http://en.wikipedia.org/wiki/Tony_Brise
548	wunderink	Roelof	Wunderink	\N	Dutch	\N	1948-12-12	http://en.wikipedia.org/wiki/Roelof_Wunderink
549	jones	Alan	Jones	\N	Australian	\N	1946-11-02	http://en.wikipedia.org/wiki/Alan_Jones_(Formula_1)
550	palm	Torsten	Palm	\N	Swedish	\N	1947-07-23	http://en.wikipedia.org/wiki/Torsten_Palm
551	magee	Damien	Magee	\N	British	\N	1945-11-17	http://en.wikipedia.org/wiki/Damien_Magee
552	fushida	Hiroshi	Fushida	\N	Japanese	\N	1946-03-10	http://en.wikipedia.org/wiki/Hiroshi_Fushida
553	henton	Brian	Henton	\N	British	\N	1946-09-19	http://en.wikipedia.org/wiki/Brian_Henton
554	morgan	Dave	Morgan	\N	British	\N	1944-08-07	http://en.wikipedia.org/wiki/Dave_Morgan_(racing_driver)
555	crawford	Jim	Crawford	\N	British	\N	1948-02-13	http://en.wikipedia.org/wiki/Jim_Crawford_(driver)
556	ertl	Harald	Ertl	\N	Austrian	\N	1948-08-31	http://en.wikipedia.org/wiki/Harald_Ertl
557	trimmer	Tony	Trimmer	\N	British	\N	1943-01-24	http://en.wikipedia.org/wiki/Tony_Trimmer
558	lunger	Brett	Lunger	\N	American	\N	1945-11-14	http://en.wikipedia.org/wiki/Brett_Lunger
559	vonlanthen	Jo	Vonlanthen	\N	Swiss	\N	1942-05-31	http://en.wikipedia.org/wiki/Jo_Vonlanthen
560	zorzi	Renzo	Zorzi	\N	Italian	\N	1946-12-12	http://en.wikipedia.org/wiki/Renzo_Zorzi
561	leclere	Michel	Leclère	\N	French	\N	1946-03-18	http://en.wikipedia.org/wiki/Michel_Lecl%C3%A8re
562	hoffmann	Ingo	Hoffmann	\N	Brazilian	\N	1953-02-28	http://en.wikipedia.org/wiki/Ingo_Hoffmann
563	nilsson	Gunnar	Nilsson	\N	Swedish	\N	1948-11-20	http://en.wikipedia.org/wiki/Gunnar_Nilsson
564	kessel	Loris	Kessel	\N	Swiss	\N	1950-04-01	http://en.wikipedia.org/wiki/Loris_Kessel
565	zapico	Emilio	Zapico	\N	Spanish	\N	1944-05-27	http://en.wikipedia.org/wiki/Emilio_Zapico
566	villota	Emilio	de Villota	\N	Spanish	\N	1946-07-26	http://en.wikipedia.org/wiki/Emilio_de_Villota
567	neve	Patrick	Nève	\N	Belgian	\N	1949-10-13	http://en.wikipedia.org/wiki/Patrick_Neve
568	nelleman	Jac	Nelleman	\N	Danish	\N	1944-04-19	http://en.wikipedia.org/wiki/Jac_Nelleman
569	galica	Divina	Galica	\N	British	\N	1944-08-13	http://en.wikipedia.org/wiki/Divina_Galica
570	pesenti_rossi	Alessandro	Pesenti-Rossi	\N	Italian	\N	1942-08-31	http://en.wikipedia.org/wiki/Alessandro_Pesenti-Rossi
571	binder	Hans	Binder	\N	Austrian	\N	1948-06-12	http://en.wikipedia.org/wiki/Hans_Binder
572	hayje	Boy	Lunger	\N	Dutch	\N	1949-05-03	http://en.wikipedia.org/wiki/Boy_Hayje
573	andersson	Conny	Andersson	\N	Swedish	\N	1939-12-28	http://en.wikipedia.org/wiki/Conny_Andersson_(racing_driver)
574	stuppacher	Otto	Stuppacher	\N	Austrian	\N	1947-03-03	http://en.wikipedia.org/wiki/Otto_Stuppacher
575	ribeiro	Alex	Ribeiro	\N	Brazilian	\N	1948-11-07	http://en.wikipedia.org/wiki/Alex_Ribeiro
576	brown	Warwick	Brown	\N	Australian	\N	1949-12-24	http://en.wikipedia.org/wiki/Warwick_Brown
577	takahara	Noritake	Takahara	\N	Japanese	\N	1951-06-06	http://en.wikipedia.org/wiki/Noritake_Takahara
578	hasemi	Masahiro	Hasemi	\N	Japanese	\N	1945-11-13	http://en.wikipedia.org/wiki/Masahiro_Hasemi
579	hoshino	Kazuyoshi	Hoshino	\N	Japanese	\N	1947-07-01	http://en.wikipedia.org/wiki/Kazuyoshi_Hoshino
580	keegan	Rupert	Keegan	\N	British	\N	1955-02-26	http://en.wikipedia.org/wiki/Rupert_Keegan
581	patrese	Riccardo	Patrese	\N	Italian	\N	1954-04-17	http://en.wikipedia.org/wiki/Riccardo_Patrese
582	dryver	Bernard	de Dryver	\N	Belgian	\N	1952-09-19	http://en.wikipedia.org/wiki/Bernard_de_Dryver
583	rebaque	Hector	Rebaque	\N	Mexican	\N	1956-02-05	http://en.wikipedia.org/wiki/Hector_Rebaque
584	kozarowitzky	Mikko	Kozarowitzky	\N	Finnish	\N	1948-05-17	http://en.wikipedia.org/wiki/Mikko_Kozarowitzky
585	tambay	Patrick	Tambay	\N	French	\N	1949-06-25	http://en.wikipedia.org/wiki/Patrick_Tambay
586	gilles_villeneuve	Gilles	Villeneuve	\N	Canadian	\N	1950-01-18	http://en.wikipedia.org/wiki/Gilles_Villeneuve
587	sutcliffe	Andy	Sutcliffe	\N	British	\N	1947-05-09	http://en.wikipedia.org/wiki/Andy_Sutcliffe
588	mcguire	Brian	McGuire	\N	Australian	\N	1945-12-13	http://en.wikipedia.org/wiki/Brian_McGuire
589	heyer	Hans	Heyer	\N	German	\N	1943-03-16	http://en.wikipedia.org/wiki/Hans_Heyer
590	bleekemolen	Michael	Bleekemolen	\N	Dutch	\N	1949-10-02	http://en.wikipedia.org/wiki/Michael_Bleekemolen
591	giacomelli	Bruno	Giacomelli	\N	Italian	\N	1952-09-10	http://en.wikipedia.org/wiki/Bruno_Giacomelli
592	leoni	Lamberto	Leoni	\N	Italian	\N	1953-05-24	http://en.wikipedia.org/wiki/Lamberto_Leoni
593	francia	Giorgio	Francia	\N	Italian	\N	1947-11-08	http://en.wikipedia.org/wiki/Giorgio_Francia
594	ongais	Danny	Ongais	\N	American	\N	1942-05-21	http://en.wikipedia.org/wiki/Danny_Ongais
595	takahashi	Kunimitsu	Takahashi	\N	Japanese	\N	1940-01-29	http://en.wikipedia.org/wiki/Kunimitsu_Takahashi
596	pironi	Didier	Pironi	\N	French	\N	1952-03-26	http://en.wikipedia.org/wiki/Didier_Pironi
597	cheever	Eddie	Cheever	\N	American	\N	1958-01-10	http://en.wikipedia.org/wiki/Eddie_Cheever
598	keke_rosberg	Keke	Rosberg	\N	Finnish	\N	1948-12-06	http://en.wikipedia.org/wiki/Keke_Rosberg
599	arnoux	René	Arnoux	\N	French	\N	1948-07-04	http://en.wikipedia.org/wiki/Ren%C3%A9_Arnoux
600	daly	Derek	Daly	\N	Irish	\N	1953-03-11	http://en.wikipedia.org/wiki/Derek_Daly
601	colombo	Alberto	Colombo	\N	Italian	\N	1946-02-23	http://en.wikipedia.org/wiki/Alberto_Colombo
602	lees	Geoff	Lees	\N	British	\N	1951-05-01	http://en.wikipedia.org/wiki/Geoff_Lees
603	piquet	Nelson	Piquet	\N	Brazilian	\N	1952-08-17	http://en.wikipedia.org/wiki/Nelson_Piquet
604	gimax	Carlo	Franchi	\N	Italian	\N	1938-01-01	http://en.wikipedia.org/wiki/Gimax
605	rahal	Bobby	Rahal	\N	American	\N	1953-01-10	http://en.wikipedia.org/wiki/Bobby_Rahal
606	gabbiani	Beppe	Gabbiani	\N	Italian	\N	1957-01-02	http://en.wikipedia.org/wiki/Beppe_Gabbiani
607	angelis	Elio	de Angelis	\N	Italian	\N	1958-03-26	http://en.wikipedia.org/wiki/Elio_de_Angelis
608	lammers	Jan	Lammers	\N	Dutch	\N	1956-06-02	http://en.wikipedia.org/wiki/Jan_Lammers
609	brancatelli	Gianfranco	Brancatelli	\N	Italian	\N	1950-01-18	http://en.wikipedia.org/wiki/Gianfranco_Brancatelli
610	gaillard	Patrick	Gaillard	\N	French	\N	1952-02-12	http://en.wikipedia.org/wiki/Patrick_Gaillard
611	surer	Marc	Surer	\N	Swiss	\N	1951-09-18	http://en.wikipedia.org/wiki/Marc_Surer
612	zunino	Ricardo	Zunino	\N	Argentine	\N	1949-04-13	http://en.wikipedia.org/wiki/Ricardo_Zunino
613	prost	Alain	Prost	\N	French	\N	1955-02-24	http://en.wikipedia.org/wiki/Alain_Prost
614	kennedy	Dave	Kennedy	\N	Irish	\N	1953-01-15	http://en.wikipedia.org/wiki/David_Kennedy_(racing_driver)
615	johansson	Stefan	Johansson	\N	Swedish	\N	1956-09-08	http://en.wikipedia.org/wiki/Stefan_Johansson
616	south	Stephen	South	\N	British	\N	1952-02-19	http://en.wikipedia.org/wiki/Stephen_South
617	needell	Tiff	Needell	\N	British	\N	1951-10-29	http://en.wikipedia.org/wiki/Tiff_Needell
618	desire_wilson	Desiré	Wilson	\N	South African	\N	1953-11-26	http://en.wikipedia.org/wiki/Desir%C3%A9_Wilson
619	mansell	Nigel	Mansell	\N	British	\N	1953-08-08	http://en.wikipedia.org/wiki/Nigel_Mansell
620	thackwell	Mike	Thackwell	\N	New Zealander	\N	1961-03-30	http://en.wikipedia.org/wiki/Mike_Thackwell
621	manfred_winkelhock	Manfred	Winkelhock	\N	German	\N	1951-10-06	http://en.wikipedia.org/wiki/Manfred_Winkelhock
622	cesaris	Andrea	de Cesaris	\N	Italian	\N	1959-05-31	http://en.wikipedia.org/wiki/Andrea_de_Cesaris
623	cogan	Kevin	Cogan	\N	American	\N	1956-03-31	http://en.wikipedia.org/wiki/Kevin_Cogan
624	serra	Chico	Serra	\N	Brazilian	\N	1957-02-03	http://en.wikipedia.org/wiki/Chico_Serra
625	guerra	Miguel Ángel	Guerra	\N	Argentine	\N	1953-08-31	http://en.wikipedia.org/wiki/Miguel_Angel_Guerra
626	stohr	Siegfried	Stohr	\N	Italian	\N	1952-10-10	http://en.wikipedia.org/wiki/Siegfried_Stohr
627	salazar	Eliseo	Salazar	\N	Chilean	\N	1954-11-14	http://en.wikipedia.org/wiki/Eliseo_Salazar
628	londono	Ricardo	Londoño	\N	Colombian	\N	1949-08-08	http://en.wikipedia.org/wiki/Ricardo_Londo%C3%B1o
629	borgudd	Slim	Borgudd	\N	Swedish	\N	1946-11-25	http://en.wikipedia.org/wiki/Slim_Borgudd
630	alboreto	Michele	Alboreto	\N	Italian	\N	1956-12-23	http://en.wikipedia.org/wiki/Michele_Alboreto
631	warwick	Derek	Warwick	\N	British	\N	1954-08-27	http://en.wikipedia.org/wiki/Derek_Warwick
632	ghinzani	Piercarlo	Ghinzani	\N	Italian	\N	1952-01-16	http://en.wikipedia.org/wiki/Piercarlo_Ghinzani
633	villeneuve_sr	Jacques	Villeneuve Sr.	\N	Canadian	\N	1953-11-04	http://en.wikipedia.org/wiki/Jacques_Villeneuve_(elder)
634	boesel	Raul	Boesel	\N	Brazilian	\N	1957-12-04	http://en.wikipedia.org/wiki/Raul_Boesel
635	baldi	Mauro	Baldi	\N	Italian	\N	1954-01-31	http://en.wikipedia.org/wiki/Mauro_Baldi
636	paletti	Riccardo	Paletti	\N	Italian	\N	1958-06-15	http://en.wikipedia.org/wiki/Riccardo_Paletti
637	guerrero	Roberto	Guerrero	\N	Colombian	\N	1958-11-16	http://en.wikipedia.org/wiki/Roberto_Guerrero
638	fabi	Teo	Fabi	\N	Italian	\N	1955-03-09	http://en.wikipedia.org/wiki/Teo_Fabi
639	moreno	Roberto	Moreno	\N	Brazilian	\N	1959-02-11	http://en.wikipedia.org/wiki/Roberto_Moreno
640	byrne	Tommy	Byrne	\N	Irish	\N	1958-05-06	http://en.wikipedia.org/wiki/Tommy_Byrne_%28racing_driver%29
641	sullivan	Danny	Sullivan	\N	American	\N	1950-03-09	http://en.wikipedia.org/wiki/Danny_Sullivan
642	cecotto	Johnny	Cecotto	\N	Venezuelan	\N	1956-01-25	http://en.wikipedia.org/wiki/Johnny_Cecotto
643	corrado_fabi	Corrado	Fabi	\N	Italian	\N	1961-04-12	http://en.wikipedia.org/wiki/Corrado_Fabi
644	schlesser	Jean-Louis	Schlesser	\N	French	\N	1948-09-12	http://en.wikipedia.org/wiki/Jean-Louis_Schlesser
645	boutsen	Thierry	Boutsen	\N	Belgian	\N	1957-07-13	http://en.wikipedia.org/wiki/Thierry_Boutsen
646	acheson	Kenny	Acheson	\N	British	\N	1957-11-27	http://en.wikipedia.org/wiki/Kenny_Acheson
647	palmer	Jonathan	Palmer	\N	British	\N	1956-11-07	http://en.wikipedia.org/wiki/Jonathan_Palmer
648	brundle	Martin	Brundle	\N	British	\N	1959-06-01	http://en.wikipedia.org/wiki/Martin_Brundle
649	hesnault	François	Hesnault	\N	French	\N	1956-12-30	http://en.wikipedia.org/wiki/Fran%C3%A7ois_Hesnault
650	alliot	Philippe	Alliot	\N	French	\N	1954-07-27	http://en.wikipedia.org/wiki/Philippe_Alliot
651	bellof	Stefan	Bellof	\N	German	\N	1957-11-20	http://en.wikipedia.org/wiki/Stefan_Bellof
652	senna	Ayrton	Senna	\N	Brazilian	\N	1960-03-21	http://en.wikipedia.org/wiki/Ayrton_Senna
653	gartner	Jo	Gartner	\N	Austrian	\N	1954-01-24	http://en.wikipedia.org/wiki/Jo_Gartner
654	rothengatter	Huub	Rothengatter	\N	Dutch	\N	1954-10-08	http://en.wikipedia.org/wiki/Huub_Rothengatter
655	berger	Gerhard	Berger	\N	Austrian	\N	1959-08-27	http://en.wikipedia.org/wiki/Gerhard_Berger
656	martini	Pierluigi	Martini	\N	Italian	\N	1961-04-23	http://en.wikipedia.org/wiki/Pierluigi_Martini
657	streiff	Philippe	Streiff	\N	French	\N	1955-06-26	http://en.wikipedia.org/wiki/Philippe_Streiff
658	danner	Christian	Danner	\N	German	\N	1958-04-04	http://en.wikipedia.org/wiki/Christian_Danner
659	capelli	Ivan	Capelli	\N	Italian	\N	1963-05-24	http://en.wikipedia.org/wiki/Ivan_Capelli
660	dumfries	Johnny	Dumfries	\N	British	\N	1958-04-26	http://en.wikipedia.org/wiki/Johnny_Dumfries
661	nannini	Alessandro	Nannini	\N	Italian	\N	1959-07-07	http://en.wikipedia.org/wiki/Alessandro_Nannini
662	berg	Allen	Berg	\N	Canadian	\N	1961-08-01	http://en.wikipedia.org/wiki/Allen_Berg
663	caffi	Alex	Caffi	\N	Italian	\N	1964-03-18	http://en.wikipedia.org/wiki/Alex_Caffi
664	satoru_nakajima	Satoru	Nakajima	\N	Japanese	\N	1953-02-23	http://en.wikipedia.org/wiki/Satoru_Nakajima
665	fabre	Pascal	Fabre	\N	French	\N	1960-01-09	http://en.wikipedia.org/wiki/Pascal_Fabre
666	campos	Adrián	Campos	\N	Spanish	\N	1960-06-17	http://en.wikipedia.org/wiki/Adri%C3%A1n_Campos
667	tarquini	Gabriele	Tarquini	\N	Italian	\N	1962-03-02	http://en.wikipedia.org/wiki/Gabriele_Tarquini
668	forini	Franco	Forini	\N	Swiss	\N	1958-09-22	http://en.wikipedia.org/wiki/Franco_Forini
669	larini	Nicola	Larini	\N	Italian	\N	1964-03-19	http://en.wikipedia.org/wiki/Nicola_Larini
670	dalmas	Yannick	Dalmas	\N	French	\N	1961-07-28	http://en.wikipedia.org/wiki/Yannick_Dalmas
671	modena	Stefano	Modena	\N	Italian	\N	1963-05-12	http://en.wikipedia.org/wiki/Stefano_Modena
672	sala	Luis	Pérez-Sala	\N	Spanish	\N	1959-05-15	http://en.wikipedia.org/wiki/Luis_Perez-Sala
673	gugelmin	Maurício	Gugelmin	\N	Brazilian	\N	1963-04-20	http://en.wikipedia.org/wiki/Maur%C3%ADcio_Gugelmin
674	larrauri	Oscar	Larrauri	\N	Argentine	\N	1954-08-19	http://en.wikipedia.org/wiki/Oscar_Larrauri
675	bailey	Julian	Bailey	\N	British	\N	1961-10-09	http://en.wikipedia.org/wiki/Julian_Bailey
676	schneider	Bernd	Schneider	\N	German	\N	1964-07-20	http://en.wikipedia.org/wiki/Bernd_Schneider_(racecar_driver)
677	suzuki	Aguri	Suzuki	\N	Japanese	\N	1960-09-08	http://en.wikipedia.org/wiki/Aguri_Suzuki
678	raphanel	Pierre-Henri	Raphanel	\N	French	\N	1961-05-27	http://en.wikipedia.org/wiki/Pierre-Henri_Raphanel
679	herbert	Johnny	Herbert	\N	British	\N	1964-06-25	http://en.wikipedia.org/wiki/Johnny_Herbert
680	grouillard	Olivier	Grouillard	\N	French	\N	1958-09-02	http://en.wikipedia.org/wiki/Olivier_Grouillard
681	foitek	Gregor	Foitek	\N	Swiss	\N	1965-03-27	http://en.wikipedia.org/wiki/Gregor_Foitek
682	weidler	Volker	Weidler	\N	German	\N	1962-03-18	http://en.wikipedia.org/wiki/Volker_Weidler
683	joachim_winkelhock	Joachim	Winkelhock	\N	German	\N	1960-10-24	http://en.wikipedia.org/wiki/Joachim_Winkelhock
684	gachot	Bertrand	Gachot	\N	Belgian	\N	1962-12-23	http://en.wikipedia.org/wiki/Bertrand_Gachot
685	alesi	Jean	Alesi	\N	French	\N	1964-06-11	http://en.wikipedia.org/wiki/Jean_Alesi
686	pirro	Emanuele	Pirro	\N	Italian	\N	1962-01-12	http://en.wikipedia.org/wiki/Emanuele_Pirro
687	bernard	Éric	Bernard	\N	French	\N	1964-08-24	http://en.wikipedia.org/wiki/%C3%89ric_Bernard
688	donnelly	Martin	Donnelly	\N	British	\N	1964-03-26	http://en.wikipedia.org/wiki/Martin_Donnelly_(racing_driver)
689	bertaggia	Enrico	Bertaggia	\N	Italian	\N	1964-09-19	http://en.wikipedia.org/wiki/Enrico_Bertaggia
690	lehto	Jyrki	Järvilehto	\N	Finnish	\N	1966-01-31	http://en.wikipedia.org/wiki/Jyrki_J%C3%A4rvilehto
691	barilla	Paolo	Barilla	\N	Italian	\N	1961-04-20	http://en.wikipedia.org/wiki/Paolo_Barilla
692	morbidelli	Gianni	Morbidelli	\N	Italian	\N	1968-01-13	http://en.wikipedia.org/wiki/Gianni_Morbidelli
693	langes	Claudio	Langes	\N	Italian	\N	1960-07-20	http://en.wikipedia.org/wiki/Claudio_Langes
694	gary_brabham	Gary	Brabham	\N	Australian	\N	1961-03-29	http://en.wikipedia.org/wiki/Gary_Brabham
695	brabham	David	Brabham	\N	Australian	\N	1965-09-05	http://en.wikipedia.org/wiki/David_Brabham
696	hakkinen	Mika	Häkkinen	\N	Finnish	\N	1968-09-28	http://en.wikipedia.org/wiki/Mika_H%C3%A4kkinen
697	blundell	Mark	Blundell	\N	British	\N	1966-04-08	http://en.wikipedia.org/wiki/Mark_Blundell
698	comas	Érik	Comas	\N	French	\N	1963-09-28	http://en.wikipedia.org/wiki/%C3%89rik_Comas
699	chaves	Pedro	Chaves	\N	Portuguese	\N	1965-02-27	http://en.wikipedia.org/wiki/Pedro_Chaves
700	poele	Eric	van de Poele	\N	Belgian	\N	1961-09-30	http://en.wikipedia.org/wiki/Eric_van_de_Poele
701	barbazza	Fabrizio	Barbazza	\N	Italian	\N	1963-04-02	http://en.wikipedia.org/wiki/Fabrizio_Barbazza
702	bartels	Michael	Bartels	\N	German	\N	1968-03-08	http://en.wikipedia.org/wiki/Michael_Bartels
703	michael_schumacher	Michael	Schumacher	MSC	German	\N	1969-01-03	http://en.wikipedia.org/wiki/Michael_Schumacher
704	zanardi	Alessandro	Zanardi	\N	Italian	\N	1966-10-23	http://en.wikipedia.org/wiki/Alex_Zanardi
705	wendlinger	Karl	Wendlinger	\N	Austrian	\N	1968-12-20	http://en.wikipedia.org/wiki/Karl_Wendlinger
706	hattori	Naoki	Hattori	\N	Japanese	\N	1966-06-13	http://en.wikipedia.org/wiki/Naoki_Hattori
707	katayama	Ukyo	Katayama	\N	Japanese	\N	1963-05-29	http://en.wikipedia.org/wiki/Ukyo_Katayama
708	fittipaldi	Christian	Fittipaldi	\N	Brazilian	\N	1971-01-18	http://en.wikipedia.org/wiki/Christian_Fittipaldi
709	belmondo	Paul	Belmondo	\N	French	\N	1963-04-23	http://en.wikipedia.org/wiki/Paul_Belmondo
710	chiesa	Andrea	Chiesa	\N	Swiss	\N	1964-05-06	http://en.wikipedia.org/wiki/Andrea_Chiesa
711	amati	Giovanna	Amati	\N	Italian	\N	1959-07-20	http://en.wikipedia.org/wiki/Giovanna_Amati
712	damon_hill	Damon	Hill	\N	British	\N	1960-09-17	http://en.wikipedia.org/wiki/Damon_Hill
713	mccarthy	Perry	McCarthy	\N	British	\N	1961-03-03	http://en.wikipedia.org/wiki/Perry_McCarthy
714	naspetti	Emanuele	Naspetti	\N	Italian	\N	1968-02-24	http://en.wikipedia.org/wiki/Emanuele_Naspetti
715	barrichello	Rubens	Barrichello	BAR	Brazilian	\N	1972-05-23	http://en.wikipedia.org/wiki/Rubens_Barrichello
716	badoer	Luca	Badoer	BAD	Italian	\N	1971-01-25	http://en.wikipedia.org/wiki/Luca_Badoer
717	andretti	Michael	Andretti	\N	American	\N	1962-10-05	http://en.wikipedia.org/wiki/Michael_Andretti
718	lamy	Pedro	Lamy	\N	Portuguese	\N	1972-03-20	http://en.wikipedia.org/wiki/Pedro_Lamy
719	apicella	Marco	Apicella	\N	Italian	\N	1965-10-07	http://en.wikipedia.org/wiki/Marco_Apicella
720	irvine	Eddie	Irvine	\N	British	\N	1965-11-10	http://en.wikipedia.org/wiki/Eddie_Irvine
721	toshio_suzuki	Toshio	Suzuki	\N	Japanese	\N	1955-03-10	http://en.wikipedia.org/wiki/Toshio_Suzuki_(driver)
722	gounon	Jean-Marc	Gounon	\N	French	\N	1963-01-01	http://en.wikipedia.org/wiki/Jean-Marc_Gounon
723	panis	Olivier	Panis	\N	French	\N	1966-09-02	http://en.wikipedia.org/wiki/Olivier_Panis
724	verstappen	Jos	Verstappen	\N	Dutch	\N	1972-03-04	http://en.wikipedia.org/wiki/Jos_Verstappen
725	frentzen	Heinz-Harald	Frentzen	\N	German	\N	1967-05-18	http://en.wikipedia.org/wiki/Heinz-Harald_Frentzen
726	beretta	Olivier	Beretta	\N	Monegasque	\N	1969-11-23	http://en.wikipedia.org/wiki/Olivier_Beretta
727	ratzenberger	Roland	Ratzenberger	\N	Austrian	\N	1960-07-04	http://en.wikipedia.org/wiki/Roland_Ratzenberger
728	coulthard	David	Coulthard	COU	British	\N	1971-03-27	http://en.wikipedia.org/wiki/David_Coulthard
729	montermini	Andrea	Montermini	\N	Italian	\N	1964-05-30	http://en.wikipedia.org/wiki/Andrea_Montermini
730	adams	Philippe	Adams	\N	Belgian	\N	1969-11-19	http://en.wikipedia.org/wiki/Philippe_Adams
731	schiattarella	Domenico	Schiattarella	\N	Italian	\N	1967-11-17	http://en.wikipedia.org/wiki/Domenico_Schiattarella
732	noda	Hideki	Noda	\N	Japanese	\N	1969-03-07	http://en.wikipedia.org/wiki/Hideki_Noda
733	salo	Mika	Salo	\N	Finnish	\N	1966-11-30	http://en.wikipedia.org/wiki/Mika_Salo
734	lagorce	Franck	Lagorce	\N	French	\N	1968-09-01	http://en.wikipedia.org/wiki/Franck_Lagorce
735	inoue	Taki	Inoue	\N	Japanese	\N	1963-09-05	http://en.wikipedia.org/wiki/Taki_Inoue
736	deletraz	Jean-Denis	Délétraz	\N	Swiss	\N	1963-10-01	http://en.wikipedia.org/wiki/Jean-Denis_Deletraz
737	diniz	Pedro	Diniz	\N	Brazilian	\N	1970-05-22	http://en.wikipedia.org/wiki/Pedro_Diniz
738	boullion	Jean-Christophe	Boullion	\N	French	\N	1969-12-27	http://en.wikipedia.org/wiki/Jean-Christophe_Boullion
739	papis	Massimiliano	Papis	\N	Italian	\N	1969-10-03	http://en.wikipedia.org/wiki/Massimiliano_Papis
740	lavaggi	Giovanni	Lavaggi	\N	Italian	\N	1958-02-18	http://en.wikipedia.org/wiki/Giovanni_Lavaggi
741	magnussen	Jan	Magnussen	MAG	Danish	\N	1973-07-04	http://en.wikipedia.org/wiki/Jan_Magnussen
742	villeneuve	Jacques	Villeneuve	VIL	Canadian	\N	1971-04-09	http://en.wikipedia.org/wiki/Jacques_Villeneuve
743	rosset	Ricardo	Rosset	\N	Brazilian	\N	1968-07-27	http://en.wikipedia.org/wiki/Ricardo_Rosset
744	fisichella	Giancarlo	Fisichella	FIS	Italian	\N	1973-01-14	http://en.wikipedia.org/wiki/Giancarlo_Fisichella
745	marques	Tarso	Marques	\N	Brazilian	\N	1976-01-19	http://en.wikipedia.org/wiki/Tarso_Marques
746	nakano	Shinji	Nakano	\N	Japanese	\N	1971-04-01	http://en.wikipedia.org/wiki/Shinji_Nakano
747	trulli	Jarno	Trulli	TRU	Italian	\N	1974-07-13	http://en.wikipedia.org/wiki/Jarno_Trulli
748	ralf_schumacher	Ralf	Schumacher	SCH	German	\N	1975-06-30	http://en.wikipedia.org/wiki/Ralf_Schumacher
749	sospiri	Vincenzo	Sospiri	\N	Italian	\N	1966-10-07	http://en.wikipedia.org/wiki/Vincenzo_Sospiri
750	wurz	Alexander	Wurz	WUR	Austrian	\N	1974-02-15	http://en.wikipedia.org/wiki/Alexander_Wurz
751	fontana	Norberto	Fontana	\N	Argentine	\N	1975-01-20	http://en.wikipedia.org/wiki/Norberto_Fontana
752	tuero	Esteban	Tuero	\N	Argentine	\N	1978-04-22	http://en.wikipedia.org/wiki/Esteban_Tuero
753	takagi	Toranosuke	Takagi	\N	Japanese	\N	1974-02-12	http://en.wikipedia.org/wiki/Toranosuke_Takagi
754	rosa	Pedro	de la Rosa	DLR	Spanish	\N	1971-02-24	http://en.wikipedia.org/wiki/Pedro_de_la_Rosa
755	zonta	Ricardo	Zonta	ZON	Brazilian	\N	1976-03-23	http://en.wikipedia.org/wiki/Ricardo_Zonta
756	gene	Marc	Gené	\N	Spanish	\N	1974-03-29	http://en.wikipedia.org/wiki/Marc_Gen%C3%A9
757	sarrazin	Stéphane	Sarrazin	\N	French	\N	1975-11-02	http://en.wikipedia.org/wiki/St%C3%A9phane_Sarrazin
758	heidfeld	Nick	Heidfeld	HEI	German	\N	1977-05-10	http://en.wikipedia.org/wiki/Nick_Heidfeld
759	button	Jenson	Button	BUT	British	22	1980-01-19	http://en.wikipedia.org/wiki/Jenson_Button
760	mazzacane	Gastón	Mazzacane	\N	Argentine	\N	1975-05-08	http://en.wikipedia.org/wiki/Gast%C3%B3n_Mazzacane
761	burti	Luciano	Burti	\N	Brazilian	\N	1975-03-05	http://en.wikipedia.org/wiki/Luciano_Burti
762	raikkonen	Kimi	Räikkönen	RAI	Finnish	7	1979-10-17	http://en.wikipedia.org/wiki/Kimi_R%C3%A4ikk%C3%B6nen
763	alonso	Fernando	Alonso	ALO	Spanish	14	1981-07-29	http://en.wikipedia.org/wiki/Fernando_Alonso
764	montoya	Juan	Pablo Montoya	MON	Colombian	\N	1975-09-20	http://en.wikipedia.org/wiki/Juan_Pablo_Montoya
765	bernoldi	Enrique	Bernoldi	\N	Brazilian	\N	1978-10-19	http://en.wikipedia.org/wiki/Enrique_Bernoldi
766	enge	Tomáš	Enge	\N	Czech	\N	1976-09-11	http://en.wikipedia.org/wiki/Tom%C3%A1%C5%A1_Enge
767	yoong	Alex	Yoong	\N	Malaysian	\N	1976-07-20	http://en.wikipedia.org/wiki/Alex_Yoong
768	webber	Mark	Webber	WEB	Australian	\N	1976-08-27	http://en.wikipedia.org/wiki/Mark_Webber_(racing_driver)
769	sato	Takuma	Sato	SAT	Japanese	\N	1977-01-28	http://en.wikipedia.org/wiki/Takuma_Sato
770	massa	Felipe	Massa	MAS	Brazilian	19	1981-04-25	http://en.wikipedia.org/wiki/Felipe_Massa
771	mcnish	Allan	McNish	\N	British	\N	1969-12-29	http://en.wikipedia.org/wiki/Allan_McNish
772	davidson	Anthony	Davidson	DAV	British	\N	1979-04-18	http://en.wikipedia.org/wiki/Anthony_Davidson
773	pizzonia	Antônio	Pizzonia	PIZ	Brazilian	\N	1980-09-11	http://en.wikipedia.org/wiki/Ant%C3%B4nio_Pizzonia
774	wilson	Justin	Wilson	\N	British	\N	1978-07-31	http://en.wikipedia.org/wiki/Justin_Wilson_(racing_driver)
775	matta	Cristiano	da Matta	\N	Brazilian	\N	1973-09-19	http://en.wikipedia.org/wiki/Cristiano_da_Matta
776	firman	Ralph	Firman	\N	Irish	\N	1975-05-20	http://en.wikipedia.org/wiki/Ralph_Firman
777	kiesa	Nicolas	Kiesa	\N	Danish	\N	1978-03-03	http://en.wikipedia.org/wiki/Nicolas_Kiesa
778	baumgartner	Zsolt	Baumgartner	\N	Hungarian	\N	1981-01-01	http://en.wikipedia.org/wiki/Zsolt_Baumgartner
779	klien	Christian	Klien	KLI	Austrian	\N	1983-02-07	http://en.wikipedia.org/wiki/Christian_Klien
780	pantano	Giorgio	Pantano	\N	Italian	\N	1979-02-04	http://en.wikipedia.org/wiki/Giorgio_Pantano
781	bruni	Gianmaria	Bruni	\N	Italian	\N	1981-05-30	http://en.wikipedia.org/wiki/Gianmaria_Bruni
782	glock	Timo	Glock	GLO	German	\N	1982-03-18	http://en.wikipedia.org/wiki/Timo_Glock
783	karthikeyan	Narain	Karthikeyan	KAR	Indian	\N	1977-01-14	http://en.wikipedia.org/wiki/Narain_Karthikeyan
784	monteiro	Tiago	Monteiro	TMO	Portuguese	\N	1976-07-24	http://en.wikipedia.org/wiki/Tiago_Monteiro
785	friesacher	Patrick	Friesacher	FRI	Austrian	\N	1980-09-26	http://en.wikipedia.org/wiki/Patrick_Friesacher
786	albers	Christijan	Albers	ALB	Dutch	\N	1979-04-16	http://en.wikipedia.org/wiki/Christijan_Albers
787	liuzzi	Vitantonio	Liuzzi	LIU	Italian	\N	1980-08-06	http://en.wikipedia.org/wiki/Vitantonio_Liuzzi
788	doornbos	Robert	Doornbos	DOO	Dutch	\N	1981-09-23	http://en.wikipedia.org/wiki/Robert_Doornbos
789	rosberg	Nico	Rosberg	ROS	German	6	1985-06-27	http://en.wikipedia.org/wiki/Nico_Rosberg
790	speed	Scott	Speed	SPE	American	\N	1983-01-24	http://en.wikipedia.org/wiki/Scott_Speed
791	ide	Yuji	Ide	IDE	Japanese	\N	1975-01-21	http://en.wikipedia.org/wiki/Yuji_Ide
792	montagny	Franck	Montagny	FMO	French	\N	1978-01-05	http://en.wikipedia.org/wiki/Franck_Montagny
793	yamamoto	Sakon	Yamamoto	YAM	Japanese	\N	1982-07-09	http://en.wikipedia.org/wiki/Sakon_Yamamoto
794	kubica	Robert	Kubica	KUB	Polish	88	1984-12-07	http://en.wikipedia.org/wiki/Robert_Kubica
795	hamilton	Lewis	Hamilton	HAM	British	44	1985-01-07	http://en.wikipedia.org/wiki/Lewis_Hamilton
796	kovalainen	Heikki	Kovalainen	KOV	Finnish	\N	1981-10-19	http://en.wikipedia.org/wiki/Heikki_Kovalainen
797	sutil	Adrian	Sutil	SUT	German	99	1983-01-11	http://en.wikipedia.org/wiki/Adrian_Sutil
798	vettel	Sebastian	Vettel	VET	German	5	1987-07-03	http://en.wikipedia.org/wiki/Sebastian_Vettel
799	markus_winkelhock	Markus	Winkelhock	WIN	German	\N	1980-06-13	http://en.wikipedia.org/wiki/Markus_Winkelhock
800	nakajima	Kazuki	Nakajima	NAK	Japanese	\N	1985-01-11	http://en.wikipedia.org/wiki/Kazuki_Nakajima
801	bourdais	Sébastien	Bourdais	BOU	French	\N	1979-02-28	http://en.wikipedia.org/wiki/S%C3%A9bastien_Bourdais
802	piquet_jr	Nelson	Piquet Jr.	PIQ	Brazilian	\N	1985-07-25	http://en.wikipedia.org/wiki/Nelson_Piquet,_Jr.
803	buemi	Sébastien	Buemi	BUE	Swiss	\N	1988-10-31	http://en.wikipedia.org/wiki/S%C3%A9bastien_Buemi
804	alguersuari	Jaime	Alguersuari	ALG	Spanish	\N	1990-03-23	http://en.wikipedia.org/wiki/Jaime_Alguersuari
805	grosjean	Romain	Grosjean	GRO	French	8	1986-04-17	http://en.wikipedia.org/wiki/Romain_Grosjean
806	kobayashi	Kamui	Kobayashi	KOB	Japanese	10	1986-09-13	http://en.wikipedia.org/wiki/Kamui_Kobayashi
807	hulkenberg	Nico	Hülkenberg	HUL	German	27	1987-08-19	http://en.wikipedia.org/wiki/Nico_H%C3%BClkenberg
808	bruno_senna	Bruno	Senna	SEN	Brazilian	\N	1983-10-15	http://en.wikipedia.org/wiki/Bruno_Senna
809	petrov	Vitaly	Petrov	PET	Russian	\N	1984-09-08	http://en.wikipedia.org/wiki/Vitaly_Petrov
810	grassi	Lucas	di Grassi	DIG	Brazilian	\N	1984-08-11	http://en.wikipedia.org/wiki/Lucas_di_Grassi
811	chandhok	Karun	Chandhok	CHA	Indian	\N	1984-01-19	http://en.wikipedia.org/wiki/Karun_Chandhok
812	resta	Paul	di Resta	DIR	British	40	1986-04-16	http://en.wikipedia.org/wiki/Paul_di_Resta
813	ambrosio	Jérôme	d'Ambrosio	DAM	Belgian	\N	1985-12-27	http://en.wikipedia.org/wiki/J%C3%A9r%C3%B4me_d%27Ambrosio
814	maldonado	Pastor	Maldonado	MAL	Venezuelan	13	1985-03-09	http://en.wikipedia.org/wiki/Pastor_Maldonado
815	perez	Sergio	Pérez	PER	Mexican	11	1990-01-26	http://en.wikipedia.org/wiki/Sergio_P%C3%A9rez
816	ricciardo	Daniel	Ricciardo	RIC	Australian	3	1989-07-01	http://en.wikipedia.org/wiki/Daniel_Ricciardo
817	vergne	Jean-Éric	Vergne	VER	French	25	1990-04-25	http://en.wikipedia.org/wiki/Jean-%C3%89ric_Vergne
818	pic	Charles	Pic	PIC	French	\N	1990-02-15	http://en.wikipedia.org/wiki/Charles_Pic
819	gutierrez	Esteban	Gutiérrez	GUT	Mexican	21	1991-08-05	http://en.wikipedia.org/wiki/Esteban_Guti%C3%A9rrez
820	bottas	Valtteri	Bottas	BOT	Finnish	77	1989-08-28	http://en.wikipedia.org/wiki/Valtteri_Bottas
821	jules_bianchi	Jules	Bianchi	BIA	French	17	1989-08-03	http://en.wikipedia.org/wiki/Jules_Bianchi
822	chilton	Max	Chilton	CHI	British	4	1991-04-21	http://en.wikipedia.org/wiki/Max_Chilton
823	garde	Giedo	van der Garde	VDG	Dutch	\N	1985-04-25	http://en.wikipedia.org/wiki/Giedo_van_der_Garde
824	kevin_magnussen	Kevin	Magnussen	MAG	Danish	20	1992-10-05	http://en.wikipedia.org/wiki/Kevin_Magnussen
825	kvyat	Daniil	Kvyat	KVY	Russian	26	1994-04-26	http://en.wikipedia.org/wiki/Daniil_Kvyat
826	ericsson	Marcus	Ericsson	ERI	Swedish	9	1990-09-02	http://en.wikipedia.org/wiki/Marcus_Ericsson
827	lotterer	André	Lotterer	LOT	German	45	1981-11-19	http://en.wikipedia.org/wiki/Andr%C3%A9_Lotterer
828	stevens	Will	Stevens	STE	British	28	1991-06-28	http://en.wikipedia.org/wiki/Will_Stevens
829	nasr	Felipe	Nasr	NAS	Brazilian	12	1992-08-21	http://en.wikipedia.org/wiki/Felipe_Nasr
830	sainz	Carlos	Sainz	SAI	Spanish	55	1994-09-01	http://en.wikipedia.org/wiki/Carlos_Sainz_Jr.
831	max_verstappen	Max	Verstappen	VER	Dutch	33	1997-09-30	http://en.wikipedia.org/wiki/Max_Verstappen
832	merhi	Roberto	Merhi	MER	Spanish	98	1991-03-22	http://en.wikipedia.org/wiki/Roberto_Merhi
833	rossi	Alexander	Rossi	RSS	American	53	1991-09-25	http://en.wikipedia.org/wiki/Alexander_Rossi_%28racing_driver%29
834	jolyon_palmer	Jolyon	Palmer	PAL	British	30	1991-01-20	http://en.wikipedia.org/wiki/Jolyon_Palmer
835	wehrlein	Pascal	Wehrlein	WEH	German	94	1994-10-18	http://en.wikipedia.org/wiki/Pascal_Wehrlein
836	haryanto	Rio	Haryanto	HAR	Indonesian	88	1993-01-22	http://en.wikipedia.org/wiki/Rio_Haryanto
837	vandoorne	Stoffel	Vandoorne	VAN	Belgian	2	1992-03-26	http://en.wikipedia.org/wiki/Stoffel_Vandoorne
838	ocon	Esteban	Ocon	OCO	French	31	1996-09-17	http://en.wikipedia.org/wiki/Esteban_Ocon
839	giovinazzi	Antonio	Giovinazzi	GIO	Italian	99	1993-12-14	http://en.wikipedia.org/wiki/Antonio_Giovinazzi
840	stroll	Lance	Stroll	STR	Canadian	18	1998-10-29	http://en.wikipedia.org/wiki/Lance_Stroll
841	gasly	Pierre	Gasly	GAS	French	10	1996-02-07	http://en.wikipedia.org/wiki/Pierre_Gasly
842	brendon_hartley	Brendon	Hartley	HAR	New Zealander	28	1989-11-10	http://en.wikipedia.org/wiki/Brendon_Hartley
843	leclerc	Charles	Leclerc	LEC	Monegasque	16	1997-10-16	http://en.wikipedia.org/wiki/Charles_Leclerc
844	sirotkin	Sergey	Sirotkin	SIR	Russian	35	1995-08-27	http://en.wikipedia.org/wiki/Sergey_Sirotkin_(racing_driver)
845	norris	Lando	Norris	NOR	British	4	1999-11-13	http://en.wikipedia.org/wiki/Lando_Norris
846	albon	Alexander	Albon	ALB	Thai	23	1996-03-23	http://en.wikipedia.org/wiki/Alexander_Albon
847	russell	George	Russell	RUS	British	63	1998-02-15	http://en.wikipedia.org/wiki/George_Russell_(racing_driver)
848	latifi	Nicholas	Latifi	LAT	Canadian	6	1995-06-29	http://en.wikipedia.org/wiki/Nicholas_Latifi
849	aitken	Jack	Aitken	AIT	British	89	1995-09-23	http://en.wikipedia.org/wiki/Jack_Aitken
850	pietro_fittipaldi	Pietro	Fittipaldi	FIT	Brazilian	51	1996-06-25	http://en.wikipedia.org/wiki/Pietro_Fittipaldi
851	tsunoda	Yuki	Tsunoda	TSU	Japanese	22	2000-05-11	http://en.wikipedia.org/wiki/Yuki_Tsunoda
852	mick_schumacher	Mick	Schumacher	MSC	German	47	1999-03-22	http://en.wikipedia.org/wiki/Mick_Schumacher
853	mazepin	Nikita	Mazepin	MAZ	Russian	9	1999-03-02	http://en.wikipedia.org/wiki/Nikita_Mazepin
854	zhou	Guanyu	Zhou	ZHO	Chinese	24	1999-05-30	http://en.wikipedia.org/wiki/Zhou_Guanyu
855	de_vries	Nyck	de Vries	DEV	Dutch	21	1995-02-06	http://en.wikipedia.org/wiki/Nyck_de_Vries
856	sargeant	Logan	Sargeant	SAR	American	2	2000-12-31	http://en.wikipedia.org/wiki/Logan_Sargeant
857	piastri	Oscar	Piastri	PIA	Australian	81	2001-04-06	http://en.wikipedia.org/wiki/Oscar_Piastri
858	lawson	Liam	Lawson	LAW	New Zealander	40	2002-02-11	http://en.wikipedia.org/wiki/Liam_Lawson
859	bearman	Oliver	Bearman	BEA	British	38	2005-05-08	http://en.wikipedia.org/wiki/Oliver_Bearman
\.


--
-- Data for Name: formula_one_season; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_season (id, year, wikipedia, championship_system_id) FROM stdin;
1	1950	http://en.wikipedia.org/wiki/1950_Formula_One_season	1
2	1951	http://en.wikipedia.org/wiki/1951_Formula_One_season	1
3	1952	http://en.wikipedia.org/wiki/1952_Formula_One_season	1
4	1953	http://en.wikipedia.org/wiki/1953_Formula_One_season	1
5	1954	http://en.wikipedia.org/wiki/1954_Formula_One_season	2
6	1955	http://en.wikipedia.org/wiki/1955_Formula_One_season	2
7	1956	http://en.wikipedia.org/wiki/1956_Formula_One_season	2
8	1957	http://en.wikipedia.org/wiki/1957_Formula_One_season	2
9	1958	http://en.wikipedia.org/wiki/1958_Formula_One_season	3
10	1959	http://en.wikipedia.org/wiki/1959_Formula_One_season	4
11	1960	http://en.wikipedia.org/wiki/1960_Formula_One_season	3
12	1961	http://en.wikipedia.org/wiki/1961_Formula_One_season	4
13	1962	http://en.wikipedia.org/wiki/1962_Formula_One_season	4
14	1963	http://en.wikipedia.org/wiki/1963_Formula_One_season	3
15	1964	http://en.wikipedia.org/wiki/1964_Formula_One_season	3
16	1965	http://en.wikipedia.org/wiki/1965_Formula_One_season	3
17	1966	http://en.wikipedia.org/wiki/1966_Formula_One_season	4
18	1967	http://en.wikipedia.org/wiki/1967_Formula_One_season	5
19	1968	http://en.wikipedia.org/wiki/1968_Formula_One_season	5
20	1969	http://en.wikipedia.org/wiki/1969_Formula_One_season	5
21	1970	http://en.wikipedia.org/wiki/1970_Formula_One_season	5
22	1971	http://en.wikipedia.org/wiki/1971_Formula_One_season	5
23	1972	http://en.wikipedia.org/wiki/1972_Formula_One_season	5
24	1973	http://en.wikipedia.org/wiki/1973_Formula_One_season	5
25	1974	http://en.wikipedia.org/wiki/1974_Formula_One_season	5
26	1975	http://en.wikipedia.org/wiki/1975_Formula_One_season	5
27	1976	http://en.wikipedia.org/wiki/1976_Formula_One_season	5
28	1977	http://en.wikipedia.org/wiki/1977_Formula_One_season	5
29	1978	http://en.wikipedia.org/wiki/1978_Formula_One_season	5
30	1979	http://en.wikipedia.org/wiki/1979_Formula_One_season	6
31	1980	http://en.wikipedia.org/wiki/1980_Formula_One_season	7
32	1981	http://en.wikipedia.org/wiki/1981_Formula_One_season	8
33	1982	http://en.wikipedia.org/wiki/1982_Formula_One_season	8
34	1983	http://en.wikipedia.org/wiki/1983_Formula_One_season	8
35	1984	http://en.wikipedia.org/wiki/1984_Formula_One_season	8
36	1985	http://en.wikipedia.org/wiki/1985_Formula_One_season	8
37	1986	http://en.wikipedia.org/wiki/1986_Formula_One_season	8
38	1987	http://en.wikipedia.org/wiki/1987_Formula_One_season	8
39	1988	http://en.wikipedia.org/wiki/1988_Formula_One_season	8
40	1989	http://en.wikipedia.org/wiki/1989_Formula_One_season	8
41	1990	http://en.wikipedia.org/wiki/1990_Formula_One_season	8
42	1991	http://en.wikipedia.org/wiki/1991_Formula_One_season	9
43	1992	http://en.wikipedia.org/wiki/1992_Formula_One_season	9
44	1993	http://en.wikipedia.org/wiki/1993_Formula_One_season	9
45	1994	http://en.wikipedia.org/wiki/1994_Formula_One_season	9
46	1995	http://en.wikipedia.org/wiki/1995_Formula_One_season	9
47	1996	http://en.wikipedia.org/wiki/1996_Formula_One_season	9
48	1997	http://en.wikipedia.org/wiki/1997_Formula_One_season	9
49	1998	http://en.wikipedia.org/wiki/1998_Formula_One_season	9
50	1999	http://en.wikipedia.org/wiki/1999_Formula_One_season	9
51	2000	http://en.wikipedia.org/wiki/2000_Formula_One_season	9
52	2001	http://en.wikipedia.org/wiki/2001_Formula_One_season	9
53	2002	http://en.wikipedia.org/wiki/2002_Formula_One_season	10
54	2003	http://en.wikipedia.org/wiki/2003_Formula_One_season	10
55	2004	http://en.wikipedia.org/wiki/2004_Formula_One_season	10
56	2005	http://en.wikipedia.org/wiki/2005_Formula_One_season	10
57	2006	http://en.wikipedia.org/wiki/2006_Formula_One_season	10
58	2007	http://en.wikipedia.org/wiki/2007_Formula_One_season	10
59	2008	http://en.wikipedia.org/wiki/2008_Formula_One_season	10
60	2009	http://en.wikipedia.org/wiki/2009_Formula_One_season	10
61	2010	http://en.wikipedia.org/wiki/2010_Formula_One_season	10
62	2011	http://en.wikipedia.org/wiki/2011_Formula_One_season	10
63	2012	http://en.wikipedia.org/wiki/2012_Formula_One_season	10
64	2013	http://en.wikipedia.org/wiki/2013_Formula_One_season	10
65	2014	http://en.wikipedia.org/wiki/2014_Formula_One_season	10
66	2015	http://en.wikipedia.org/wiki/2015_Formula_One_season	10
67	2016	http://en.wikipedia.org/wiki/2016_Formula_One_season	10
68	2017	http://en.wikipedia.org/wiki/2017_Formula_One_season	10
69	2018	http://en.wikipedia.org/wiki/2018_Formula_One_World_Championship	10
70	2019	http://en.wikipedia.org/wiki/2019_Formula_One_World_Championship	10
71	2020	http://en.wikipedia.org/wiki/2020_Formula_One_World_Championship	10
72	2021	http://en.wikipedia.org/wiki/2021_Formula_One_World_Championship	10
73	2022	http://en.wikipedia.org/wiki/2022_Formula_One_World_Championship	10
74	2023	http://en.wikipedia.org/wiki/2023_Formula_One_World_Championship	10
75	2024	https://en.wikipedia.org/wiki/2024_Formula_One_World_Championship	10
\.


--
-- Data for Name: formula_one_team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_team (id, reference, name, nationality, wikipedia, base_team_id) FROM stdin;
1	alfa	Alfa Romeo	Swiss	http://en.wikipedia.org/wiki/Alfa_Romeo_in_Formula_One	\N
2	maserati	Maserati	Italian	http://en.wikipedia.org/wiki/Maserati	\N
3	alta	Alta	British	http://en.wikipedia.org/wiki/Alta_auto_racing_team	\N
4	era	ERA	British	http://en.wikipedia.org/wiki/English_Racing_Automobiles	\N
5	lago	Talbot-Lago	French	http://en.wikipedia.org/wiki/Talbot-Lago	\N
6	ferrari	Ferrari	Italian	http://en.wikipedia.org/wiki/Scuderia_Ferrari	\N
7	cooper	Cooper	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N
8	simca	Simca	French	http://en.wikipedia.org/wiki/Simca	\N
9	watson	Watson	American	http://en.wikipedia.org/wiki/A.J._Watson	\N
10	kurtis_kraft	Kurtis Kraft	American	http://en.wikipedia.org/wiki/Kurtis_Kraft	\N
11	deidt	Deidt	American	http://en.wikipedia.org/wiki/Deidt	\N
12	adams	Adams	American	http://en.wikipedia.org/wiki/Adams_(constructor)	\N
13	snowberger	Snowberger	American	http://en.wikipedia.org/wiki/Snowberger	\N
14	wetteroth	Wetteroth	American	http://en.wikipedia.org/wiki/Wetteroth	\N
15	olson	Olson	American	http://en.wikipedia.org/wiki/Olson_(constructor)	\N
16	rae	Rae	American	http://en.wikipedia.org/wiki/Rae_(motorsport)	\N
17	ewing	Ewing	American	http://en.wikipedia.org/wiki/Ewing_(constructor)	\N
18	langley	Langley	American	http://en.wikipedia.org/wiki/Langley_(constructor)	\N
19	lesovsky	Lesovsky	American	http://en.wikipedia.org/wiki/Lesovsky	\N
20	stevens	Stevens	American	http://en.wikipedia.org/wiki/Stevens_(constructor)	\N
21	marchese	Marchese	American	http://en.wikipedia.org/wiki/Marchese_(constructor)	\N
22	nichels	Nichels	American	http://en.wikipedia.org/wiki/Nichels	\N
23	moore	Moore	American	http://en.wikipedia.org/wiki/Moore_(constructor)	\N
24	milano	Milano	Italian	http://en.wikipedia.org/wiki/Scuderia_Milano	\N
25	hwm	HWM	British	http://en.wikipedia.org/wiki/Hersham_and_Walton_Motors	\N
26	veritas	Veritas	German	http://en.wikipedia.org/wiki/Veritas_(constructor)	\N
27	trevis	Trevis	American	http://en.wikipedia.org/wiki/Trevis	\N
28	kuzma	Kuzma	American	http://en.wikipedia.org/wiki/Kuzma_(constructor)	\N
29	schroeder	Schroeder	American	http://en.wikipedia.org/wiki/Schroeder_(constructor)	\N
30	pawl	Pawl	American	http://en.wikipedia.org/wiki/Pawl_(constructor)	\N
31	bromme	Bromme	American	http://en.wikipedia.org/wiki/Bromme	\N
32	hall	Hall	American	http://en.wikipedia.org/wiki/Hall_(constructor)	\N
33	sherman	Sherman	American	http://en.wikipedia.org/wiki/Sherman_(constructor)	\N
34	brm	BRM	British	http://en.wikipedia.org/wiki/BRM	\N
35	osca	OSCA	Italian	http://en.wikipedia.org/wiki/Officine_Specializate_Costruzione_Automobili	\N
36	gordini	Gordini	French	http://en.wikipedia.org/wiki/Gordini	\N
37	afm	AFM	German	http://en.wikipedia.org/wiki/Alex_von_Falkenhausen_Motorenbau	\N
38	frazer_nash	Frazer Nash	British	http://en.wikipedia.org/wiki/Frazer_Nash	\N
39	butterworth	Aston Butterworth	British	http://en.wikipedia.org/wiki/Aston_Butterworth	\N
40	connaught	Connaught	British	http://en.wikipedia.org/wiki/Connaught_Engineering	\N
41	bmw	BMW	German	http://en.wikipedia.org/wiki/BMW	\N
42	cisitalia	Cisitalia	Italian	http://en.wikipedia.org/wiki/Cisitalia	\N
43	turner	Turner	American	http://en.wikipedia.org/wiki/Turner_(constructor)	\N
44	del_roy	Del Roy	American	http://en.wikipedia.org/wiki/Del_Roy	\N
45	emw	EMW	East German	http://en.wikipedia.org/wiki/Eisenacher_Motorenwerk	\N
46	pankratz	Pankratz	American	http://en.wikipedia.org/wiki/Pankratz	\N
47	phillips	Phillips	American	http://en.wikipedia.org/wiki/Phillips_(constructor)	\N
48	mercedes	Mercedes	German	http://en.wikipedia.org/wiki/Mercedes-Benz_in_Formula_One	\N
49	vanwall	Vanwall	British	http://en.wikipedia.org/wiki/Vanwall	\N
50	klenk	Klenk	German	http://en.wikipedia.org/wiki/Klenk	\N
51	lancia	Lancia	Italian	http://en.wikipedia.org/wiki/Lancia_in_Formula_One	\N
52	epperly	Epperly	American	http://en.wikipedia.org/wiki/Epperly	\N
53	arzani-volpini	Arzani-Volpini	Italian	http://en.wikipedia.org/wiki/Arzani-Volpini	\N
54	bugatti	Bugatti	French	http://en.wikipedia.org/wiki/Bugatti	\N
55	emeryson	Emeryson	British	http://en.wikipedia.org/wiki/Emeryson	\N
56	dunn	Dunn	American	http://en.wikipedia.org/wiki/Dunn_Engineering	\N
57	porsche	Porsche	German	http://en.wikipedia.org/wiki/Porsche_in_Formula_One	\N
58	team_lotus	Team Lotus	British	http://en.wikipedia.org/wiki/Team_Lotus	\N
59	cooper-climax	Cooper-Climax	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N
60	cooper-maserati	Cooper-Maserati	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N
61	vhristensen	Christensen	American	http://en.wikipedia.org/wiki/Christensen_(constructor)	\N
62	elder	Elder	American	http://en.wikipedia.org/wiki/Elder_(constructor)	\N
63	sutton	Sutton	American	http://en.wikipedia.org/wiki/Sutton_(constructor)	\N
64	aston_martin	Aston Martin	British	http://en.wikipedia.org/wiki/Aston_Martin_in_Formula_One	\N
65	jbw	JBW	British	http://en.wikipedia.org/wiki/JBW	\N
66	fry	Fry	British	http://en.wikipedia.org/wiki/Fry_(racing_team)	\N
67	cooper-borgward	Cooper-Borgward	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N
68	tec-mec	Tec-Mec	Italian	http://en.wikipedia.org/wiki/Tec-Mec	\N
69	cooper-osca	Cooper-OSCA	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N
70	behra-porsche	Behra-Porsche	Italian	http://en.wikipedia.org/wiki/Behra-Porsche	\N
71	scarab	Scarab	American	http://en.wikipedia.org/wiki/Scarab_(constructor)	\N
72	cooper-castellotti	Cooper-Castellotti	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N
73	meskowski	Meskowski	American	http://en.wikipedia.org/wiki/Meskowski	\N
74	lotus-climax	Lotus-Climax	British	http://en.wikipedia.org/wiki/Team_Lotus	\N
75	de_tomaso-osca	De Tomaso-Osca	Italian	http://en.wikipedia.org/wiki/De_Tomaso	\N
76	ferguson	Ferguson	British	http://en.wikipedia.org/wiki/Ferguson_Research_Ltd.	\N
77	gilby	Gilby	British	http://en.wikipedia.org/wiki/Gilby	\N
78	mbm	MBM	Swiss	http://en.wikipedia.org/wiki/Monteverdi_Basel_Motors	\N
79	lotus-maserati	Lotus-Maserati	British	http://en.wikipedia.org/wiki/Team_Lotus	\N
80	de_tomaso-alfa_romeo	De Tomaso-Alfa Romeo	Italian	http://en.wikipedia.org/wiki/De_Tomaso	\N
81	lola	Lola	British	http://en.wikipedia.org/wiki/MasterCard_Lola	\N
82	lotus-brm	Lotus-BRM	British	http://en.wikipedia.org/wiki/Team_Lotus	\N
83	brabham	Brabham	British	http://en.wikipedia.org/wiki/Brabham	\N
84	enb	ENB	Belgian	http://en.wikipedia.org/wiki/Ecurie_Nationale_Belge	\N
85	tomaso	De Tomaso	Italian	http://en.wikipedia.org/wiki/De_Tomaso	\N
86	lotus-borgward	Lotus-Borgward	British	http://en.wikipedia.org/wiki/Team_Lotus	\N
87	lds	LDS	South African	http://en.wikipedia.org/wiki/LDS_(automobile)	\N
88	cooper-alfa_romeo	Cooper-Alfa Romeo	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N
89	ats	ATS	Italian	http://en.wikipedia.org/wiki/ATS_(wheels)	\N
90	scirocco	Scirocco	British	http://en.wikipedia.org/wiki/Scirocco-Powell	\N
91	brp	BRP	British	http://en.wikipedia.org/wiki/British_Racing_Partnership	\N
92	de_tomaso-ferrari	De Tomaso-Ferrari	Italian	http://en.wikipedia.org/wiki/De_Tomaso	\N
93	stebro	Stebro	Canadian	http://en.wikipedia.org/wiki/Stebro	\N
94	lotus-ford	Lotus-Ford	British	http://en.wikipedia.org/wiki/Team_Lotus	\N
95	brabham-climax	Brabham-Climax	British	http://en.wikipedia.org/wiki/Brabham	\N
96	brabham-brm	Brabham-BRM	British	http://en.wikipedia.org/wiki/Brabham	\N
97	brabham-ford	Brabham-Ford	British	http://en.wikipedia.org/wiki/Brabham	\N
98	honda	Honda	Japanese	http://en.wikipedia.org/wiki/Honda_Racing_F1	\N
99	derrington	Derrington	British	http://en.wikipedia.org/wiki/Derrington-Francis	\N
100	re	RE	Rhodesian	http://en.wikipedia.org/wiki/RE_%28automobile%29	\N
101	lds-climax	LDS-Climax	South African	http://en.wikipedia.org/wiki/LDS_(automobile)	\N
102	lds-alfa_romeo	LDS-Alfa Romeo	South African	http://en.wikipedia.org/wiki/LDS_(automobile)	\N
103	cooper-ford	Cooper-Ford	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N
104	mclaren-ford	McLaren-Ford	British	http://en.wikipedia.org/wiki/Team_McLaren	\N
105	brabham-repco	Brabham-Repco	British	http://en.wikipedia.org/wiki/Brabham	\N
106	mclaren-seren	McLaren-Serenissima	British	http://en.wikipedia.org/wiki/Team_McLaren	\N
107	eagle-climax	Eagle-Climax	American	http://en.wikipedia.org/wiki/Anglo_American_Racers	\N
108	shannon	Shannon	British	http://en.wikipedia.org/wiki/Shannon_(Formula_One)	\N
109	cooper-ferrari	Cooper-Ferrari	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N
110	eagle-weslake	Eagle-Weslake	American	http://en.wikipedia.org/wiki/Anglo_American_Racers	\N
111	matra	Matra	French	http://en.wikipedia.org/wiki/Matra	\N
112	mclaren-brm	McLaren-BRM	British	http://en.wikipedia.org/wiki/McLaren_(racing)	\N
113	cooper-ats	Cooper-ATS	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N
114	protos	Protos	British	http://en.wikipedia.org/wiki/Protos_(constructor)	\N
115	cooper-brm	Cooper-BRM	British	http://en.wikipedia.org/wiki/Cooper_Car_Company	\N
116	matra-ford	Matra-Ford	French	http://en.wikipedia.org/wiki/Matra	\N
117	mclaren	McLaren	British	http://en.wikipedia.org/wiki/McLaren	\N
118	brm-ford	BRM-Ford	British	http://en.wikipedia.org/wiki/BRM	\N
119	march	March	British	http://en.wikipedia.org/wiki/March_Engineering	\N
120	mclaren-alfa_romeo	McLaren-Alfa Romeo	British	http://en.wikipedia.org/wiki/McLaren_(racing)	\N
121	bellasi	Bellasi	Swiss	http://en.wikipedia.org/wiki/Bellasi	\N
122	surtees	Surtees	British	http://en.wikipedia.org/wiki/Surtees	\N
123	tyrrell	Tyrrell	British	http://en.wikipedia.org/wiki/Tyrrell_Racing	\N
124	march-ford	March-Ford	British	http://en.wikipedia.org/wiki/March_Engineering	\N
125	march-alfa_romeo	March-Alfa Romeo	British	http://en.wikipedia.org/wiki/March_Engineering	\N
126	lotus-pw	Lotus-Pratt &amp; Whitney	British	http://en.wikipedia.org/wiki/Team_Lotus	\N
127	tecno	Tecno	Italian	http://en.wikipedia.org/wiki/Tecno	\N
128	politoys	Politoys	British	http://en.wikipedia.org/wiki/Frank_Williams_Racing_Cars	\N
129	connew	Connew	British	http://en.wikipedia.org/wiki/Connew	\N
130	iso_marlboro	Iso Marlboro	British	http://en.wikipedia.org/wiki/Iso_Marlboro	\N
131	shadow	Shadow	British	http://en.wikipedia.org/wiki/Shadow_Racing_Cars	\N
132	ensign	Ensign	British	http://en.wikipedia.org/wiki/Ensign_%28racing_team%29	\N
133	hesketh	Hesketh	British	http://en.wikipedia.org/wiki/Hesketh_Racing	\N
134	amon	Amon	New Zealander	http://en.wikipedia.org/wiki/Amon_(Formula_One_team)	\N
135	trojan	Trojan	British	http://en.wikipedia.org/wiki/Trojan_(Racing_team)	\N
136	token	Token	British	http://en.wikipedia.org/wiki/Token_(Racing_team)	\N
137	maki	Maki	Japanese	http://en.wikipedia.org/wiki/Maki_(cars)	\N
138	lyncar	Lyncar	British	http://en.wikipedia.org/wiki/Lyncar	\N
139	penske	Penske	American	http://en.wikipedia.org/wiki/Penske_Racing	\N
140	parnelli	Parnelli	American	http://en.wikipedia.org/wiki/Parnelli	\N
141	williams	Williams	British	http://en.wikipedia.org/wiki/Williams_Grand_Prix_Engineering	\N
142	fittipaldi	Fittipaldi	Brazilian	http://en.wikipedia.org/wiki/Fittipaldi_%28constructor%29	\N
143	shadow-ford	Shadow-Ford	British	http://en.wikipedia.org/wiki/Shadow_Racing_Cars	\N
144	hill	Embassy Hill	British	http://en.wikipedia.org/wiki/Hill_(constructor)	\N
145	shadow-matra	Shadow-Matra	British	http://en.wikipedia.org/wiki/Shadow_Racing_Cars	\N
146	ligier	Ligier	French	http://en.wikipedia.org/wiki/Ligier	\N
147	brabham-alfa_romeo	Brabham-Alfa Romeo	British	http://en.wikipedia.org/wiki/Brabham	\N
148	wolf	Wolf	Canadian	http://en.wikipedia.org/wiki/Walter_Wolf_Racing	\N
149	boro	Boro	Dutch	http://en.wikipedia.org/wiki/Boro_(Formula_One)	\N
150	kojima	Kojima	Japanese	http://en.wikipedia.org/wiki/Kojima_Engineering	\N
151	lec	LEC	British	http://en.wikipedia.org/wiki/LEC_(Formula_One)	\N
152	renault	Renault	French	http://en.wikipedia.org/wiki/Renault_in_Formula_One	\N
153	mcguire	McGuire	Australian	http://en.wikipedia.org/wiki/McGuire_(Formula_One)	\N
154	apollon	Apollon	Swiss	http://en.wikipedia.org/wiki/Apollon_(Formula_One)	\N
155	theodore	Theodore	Hong Kong	http://en.wikipedia.org/wiki/Theodore_Racing	\N
156	merzario	Merzario	Italian	http://en.wikipedia.org/wiki/Merzario	\N
157	arrows	Arrows	British	http://en.wikipedia.org/wiki/Arrows_Grand_Prix_International	\N
158	martini	Martini	French	http://en.wikipedia.org/wiki/Martini_(cars)	\N
159	kauhsen	Kauhsen	German	http://en.wikipedia.org/wiki/Kauhsen	\N
160	rebaque	Rebaque	Mexican	http://en.wikipedia.org/wiki/Rebaque	\N
161	osella	Osella	Italian	http://en.wikipedia.org/wiki/Osella	\N
162	toleman	Toleman	British	http://en.wikipedia.org/wiki/Toleman	\N
163	ram	RAM	British	http://en.wikipedia.org/wiki/RAM_Racing	\N
164	spirit	Spirit	British	http://en.wikipedia.org/wiki/Spirit_(racing_team)	\N
165	minardi	Minardi	Italian	http://en.wikipedia.org/wiki/Minardi	\N
166	zakspeed	Zakspeed	German	http://en.wikipedia.org/wiki/Zakspeed	\N
167	benetton	Benetton	Italian	http://en.wikipedia.org/wiki/Benetton_Formula	\N
168	ags	AGS	French	http://en.wikipedia.org/wiki/Automobiles_Gonfaronnaises_Sportives	\N
169	larrousse	Larrousse	French	http://en.wikipedia.org/wiki/Larrousse	\N
170	coloni	Coloni	Italian	http://en.wikipedia.org/wiki/Enzo_Coloni_Racing_Car_Systems	\N
171	dallara	Dallara	Italian	http://en.wikipedia.org/wiki/Dallara	\N
172	eurobrun	Euro Brun	Italian	http://en.wikipedia.org/wiki/Euro_Brun	\N
173	rial	Rial	German	http://en.wikipedia.org/wiki/Rial_%28racing_team%29	\N
174	onyx	Onyx	British	http://en.wikipedia.org/wiki/Onyx_(racing_team)	\N
175	leyton	Leyton House	British	http://en.wikipedia.org/wiki/Leyton_House	\N
176	life	Life	Italian	http://en.wikipedia.org/wiki/Life_(Racing_Team)	\N
177	jordan	Jordan	Irish	http://en.wikipedia.org/wiki/Jordan_Grand_Prix	\N
178	footwork	Footwork	British	http://en.wikipedia.org/wiki/Footwork_Arrows	\N
179	fondmetal	Fondmetal	Italian	http://en.wikipedia.org/wiki/Fondmetal	\N
180	lambo	Lambo	Italian	http://en.wikipedia.org/wiki/Modena_(racing_team)	\N
181	moda	Andrea Moda	Italian	http://en.wikipedia.org/wiki/Andrea_Moda_Formula	\N
182	sauber	Sauber	Swiss	http://en.wikipedia.org/wiki/Sauber_Motorsport	\N
183	pacific	Pacific	British	http://en.wikipedia.org/wiki/Pacific_Racing	\N
184	simtek	Simtek	British	http://en.wikipedia.org/wiki/Simtek	\N
185	forti	Forti	Italian	http://en.wikipedia.org/wiki/Forti	\N
186	stewart	Stewart	British	http://en.wikipedia.org/wiki/Stewart_Grand_Prix	\N
187	prost	Prost	French	http://en.wikipedia.org/wiki/Prost_Grand_Prix	\N
188	bar	BAR	British	http://en.wikipedia.org/wiki/British_American_Racing	\N
189	jaguar	Jaguar	British	http://en.wikipedia.org/wiki/Jaguar_Racing	\N
190	toyota	Toyota	Japanese	http://en.wikipedia.org/wiki/Toyota_Racing	\N
191	red_bull	Red Bull	Austrian	http://en.wikipedia.org/wiki/Red_Bull_Racing	\N
192	bmw_sauber	BMW Sauber	German	http://en.wikipedia.org/wiki/BMW_Sauber	\N
193	super_aguri	Super Aguri	Japanese	http://en.wikipedia.org/wiki/Super_Aguri_F1	\N
194	mf1	MF1	Russian	http://en.wikipedia.org/wiki/Midland_F1_Racing	\N
195	toro_rosso	Toro Rosso	Italian	http://en.wikipedia.org/wiki/Scuderia_Toro_Rosso	\N
196	spyker_mf1	Spyker MF1	Dutch	http://en.wikipedia.org/wiki/Midland_F1_Racing	\N
197	spyker	Spyker	Dutch	http://en.wikipedia.org/wiki/Spyker_F1	\N
198	force_india	Force India	Indian	http://en.wikipedia.org/wiki/Racing_Point_Force_India	\N
199	brawn	Brawn	British	http://en.wikipedia.org/wiki/Brawn_GP	\N
200	hrt	HRT	Spanish	http://en.wikipedia.org/wiki/Hispania_Racing	\N
201	virgin	Virgin	British	http://en.wikipedia.org/wiki/Virgin_Racing	\N
202	lotus_racing	Lotus	Malaysian	http://en.wikipedia.org/wiki/Lotus_Racing	\N
203	caterham	Caterham	Malaysian	http://en.wikipedia.org/wiki/Caterham_F1	\N
204	lotus_f1	Lotus F1	British	http://en.wikipedia.org/wiki/Lotus_F1	\N
205	marussia	Marussia	Russian	http://en.wikipedia.org/wiki/Marussia_F1	\N
206	manor	Manor Marussia	British	http://en.wikipedia.org/wiki/Manor_Motorsport	\N
207	haas	Haas F1 Team	American	http://en.wikipedia.org/wiki/Haas_F1_Team	\N
208	racing_point	Racing Point	British	http://en.wikipedia.org/wiki/Racing_Point_F1_Team	\N
209	alphatauri	AlphaTauri	Italian	http://en.wikipedia.org/wiki/Scuderia_AlphaTauri	\N
210	alpine	Alpine F1 Team	French	http://en.wikipedia.org/wiki/Alpine_F1_Team	\N
211	rb	RB F1 Team	Italian	http://en.wikipedia.org/wiki/RB_Formula_One_Team	\N
212	eagle	Eagle	American	http://en.wikipedia.org/wiki/Anglo_American_Racers	\N
\.


--
-- Data for Name: formula_one_championshipadjustment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_championshipadjustment (id, adjustment, points, driver_id, season_id, team_id) FROM stdin;
1	101	\N	703	48	\N
2	102	\N	\N	58	117
3	1	15	\N	71	208
\.


--
-- Data for Name: formula_one_circuit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_circuit (id, reference, name, locality, country, location, altitude, wikipedia) FROM stdin;
1	silverstone	Silverstone Circuit	Silverstone	UK	0101000020E610000068E89FE06245F0BF99BB96900F0A4A40	153	http://en.wikipedia.org/wiki/Silverstone_Circuit
2	monaco	Circuit de Monaco	Monte-Carlo	Monaco	0101000020E6100000E605D847A7AE1D40832F4CA60ADE4540	7	http://en.wikipedia.org/wiki/Circuit_de_Monaco
3	indianapolis	Indianapolis Motor Speedway	Indianapolis	USA	0101000020E6100000C2172653058F55C0F6285C8FC2E54340	223	http://en.wikipedia.org/wiki/Indianapolis_Motor_Speedway
4	bremgarten	Circuit Bremgarten	Bern	Switzerland	0101000020E610000024D1CB28969B1D403411363CBD7A4740	551	http://en.wikipedia.org/wiki/Circuit_Bremgarten
5	spa	Circuit de Spa-Francorchamps	Spa	Belgium	0101000020E610000051A5660FB4E21740D5E76A2BF6374940	401	http://en.wikipedia.org/wiki/Circuit_de_Spa-Francorchamps
6	reims	Reims-Gueux	Reims	France	0101000020E6100000DF15C1FF56720F40545227A089A04840	88	http://en.wikipedia.org/wiki/Reims-Gueux
7	monza	Autodromo Nazionale di Monza	Monza	Italy	0101000020E6100000392861A6ED8F224074B515FBCBCE4640	162	http://en.wikipedia.org/wiki/Autodromo_Nazionale_Monza
8	nurburgring	Nürburgring	Nürburg	Germany	0101000020E61000000AD7A3703DCA1B40D044D8F0F42A4940	578	http://en.wikipedia.org/wiki/N%C3%BCrburgring
9	pedralbes	Circuit de Pedralbes	Barcelona	Spain	0101000020E6100000026553AEF0EE00407DD0B359F5B14440	85	http://en.wikipedia.org/wiki/Pedralbes_Circuit
10	essarts	Rouen-Les-Essarts	Rouen	France	0101000020E61000006D73637AC212F03F5F07CE1951AA4840	81	http://en.wikipedia.org/wiki/Rouen-Les-Essarts
11	zandvoort	Circuit Park Zandvoort	Zandvoort	Netherlands	0101000020E61000006002B7EEE6291240A857CA32C4314A40	6	http://en.wikipedia.org/wiki/Circuit_Zandvoort
12	galvez	Autódromo Juan y Oscar Gálvez	Buenos Aires	Argentina	0101000020E6100000C286A757CA3A4DC070CE88D2DE5841C0	8	http://en.wikipedia.org/wiki/Aut%C3%B3dromo_Oscar_Alfredo_G%C3%A1lvez
13	aintree	Aintree	Liverpool	UK	0101000020E6100000F5673F52448607C030BB270F0BBD4A40	20	http://en.wikipedia.org/wiki/Aintree_Motor_Racing_Circuit
14	pescara	Pescara Circuit	Pescara	Italy	0101000020E61000003E7958A8354D2C40CDCCCCCCCC3C4540	129	http://en.wikipedia.org/wiki/Pescara_Circuit
15	boavista	Circuito da Boavista	Oporto	Portugal	0101000020E610000062105839B45821C0E7FBA9F1D2954440	28	http://en.wikipedia.org/wiki/Circuito_da_Boavista
16	ain-diab	Ain Diab	Casablanca	Morocco	0101000020E61000000000000000C01EC099BB96900FCA4040	19	http://en.wikipedia.org/wiki/Ain-Diab_Circuit
17	avus	AVUS	Berlin	Germany	0101000020E6100000C66D3480B7802A40933A014D843D4A40	53	http://en.wikipedia.org/wiki/AVUS
18	monsanto	Monsanto Park Circuit	Lisbon	Portugal	0101000020E61000006440F67AF76722C032772D211F5C4340	158	http://en.wikipedia.org/wiki/Monsanto_Park_Circuit
19	sebring	Sebring International Raceway	Florida	USA	0101000020E6100000984C158C4A5654C0BF7D1D3867743B40	18	http://en.wikipedia.org/wiki/Sebring_Raceway
20	riverside	Riverside International Raceway	California	USA	0101000020E6100000B6F3FDD478515DC00E2DB29DEFF74040	470	http://en.wikipedia.org/wiki/Riverside_International_Raceway
21	watkins_glen	Watkins Glen	New York State	USA	0101000020E61000007A36AB3E573B53C0DE02098A1F2B4540	485	http://en.wikipedia.org/wiki/Watkins_Glen_International
22	george	Prince George Circuit	Eastern Cape Province	South Africa	0101000020E61000001DC9E53FA4DF3B40F54A5986388640C0	15	http://en.wikipedia.org/wiki/Prince_George_Circuit
23	rodriguez	Autódromo Hermanos Rodríguez	Mexico City	Mexico	0101000020E6100000D26F5F07CEC558C00F0BB5A679673340	2227	http://en.wikipedia.org/wiki/Aut%C3%B3dromo_Hermanos_Rodr%C3%ADguez
24	brands_hatch	Brands Hatch	Kent	UK	0101000020E6100000950F41D5E8D5D03FA1F831E6AEAD4940	145	http://en.wikipedia.org/wiki/Brands_Hatch
25	zeltweg	Zeltweg	Styria	Austria	0101000020E6100000C9E53FA4DF7E2D40C3D32B65199A4740	676	http://en.wikipedia.org/wiki/Zeltweg_Airfield
26	charade	Charade Circuit	Clermont-Ferrand	France	0101000020E6100000AB21718FA54F08401DC9E53FA4DF4640	790	http://en.wikipedia.org/wiki/Charade_Circuit
27	kyalami	Kyalami	Midrand	South Africa	0101000020E61000006B9A779CA2133C4093A9825149FD39C0	1460	http://en.wikipedia.org/wiki/Kyalami
28	lemans	Le Mans	Le Mans	France	0101000020E61000008EEBDFF599B3CC3F9A99999999F94740	67	http://en.wikipedia.org/wiki/Circuit_de_la_Sarthe#Bugatti_Circuit
29	mosport	Mosport International Raceway	Ontario	Canada	0101000020E61000005E4BC8073DAB53C003780B2428064640	332	http://en.wikipedia.org/wiki/Mosport
30	jarama	Jarama	Madrid	Spain	0101000020E61000009088299144AF0CC0492EFF21FD4E4440	609	http://en.wikipedia.org/wiki/Circuito_Permanente_Del_Jarama
31	tremblant	Circuit Mont-Tremblant	Quebec	Canada	0101000020E61000002575029A08A752C0C7BAB88D06184740	214	http://en.wikipedia.org/wiki/Circuit_Mont-Tremblant
32	montjuic	Montjuïc	Barcelona	Spain	0101000020E61000004A46CEC29E36014090A0F831E6AE4440	79	http://en.wikipedia.org/wiki/Montju%C3%AFc_circuit
33	hockenheimring	Hockenheimring	Hockenheim	Germany	0101000020E6100000FD304278B42121407DD0B359F5A94840	103	http://en.wikipedia.org/wiki/Hockenheimring
34	red_bull_ring	Red Bull Ring	Spielberg	Austria	0101000020E61000009D8026C286872D4032772D211F9C4740	678	http://en.wikipedia.org/wiki/Red_Bull_Ring
35	ricard	Circuit Paul Ricard	Le Castellet	France	0101000020E6100000B4E55C8AAB2A174055302AA913A04540	432	http://en.wikipedia.org/wiki/Paul_Ricard_Circuit
36	nivelles	Nivelles-Baulers	Brussels	Belgium	0101000020E61000005704FF5BC94E1140D6C56D34804F4940	139	http://en.wikipedia.org/wiki/Nivelles-Baulers
37	interlagos	Autódromo José Carlos Pace	São Paulo	Brazil	0101000020E61000006F8104C58F5947C032772D211FB437C0	785	http://en.wikipedia.org/wiki/Aut%C3%B3dromo_Jos%C3%A9_Carlos_Pace
38	zolder	Zolder	Heusden-Zolder	Belgium	0101000020E6100000102384471B071540CA54C1A8A47E4940	36	http://en.wikipedia.org/wiki/Zolder
39	anderstorp	Scandinavian Raceway	Anderstorp	Sweden	0101000020E6100000857CD0B359352B407DD0B359F5A14C40	153	http://en.wikipedia.org/wiki/Scandinavian_Raceway
40	dijon	Dijon-Prenois	Dijon	France	0101000020E6100000F168E388B59813406666666666AE4740	484	http://en.wikipedia.org/wiki/Dijon-Prenois
41	long_beach	Long Beach	California	USA	0101000020E61000006ABC7493188C5DC0B515FBCBEEE14040	12	http://en.wikipedia.org/wiki/Long_Beach,_California
42	fuji	Fuji Speedway	Oyama	Japan	0101000020E61000008B6CE7FBA95D61402BF697DD93AF4140	583	http://en.wikipedia.org/wiki/Fuji_Speedway
43	jacarepagua	Autódromo Internacional Nelson Piquet	Rio de Janeiro	Brazil	0101000020E6100000C3F5285C8FB245C044FAEDEBC0F936C0	1126	http://en.wikipedia.org/wiki/Aut%C3%B3dromo_Internacional_Nelson_Piquet
44	villeneuve	Circuit Gilles Villeneuve	Montreal	Canada	0101000020E61000005396218E756152C00000000000C04640	13	http://en.wikipedia.org/wiki/Circuit_Gilles_Villeneuve
45	imola	Autodromo Enzo e Dino Ferrari	Imola	Italy	0101000020E61000001E166A4DF36E2740158C4AEA042C4640	37	http://en.wikipedia.org/wiki/Autodromo_Enzo_e_Dino_Ferrari
46	las_vegas	Las Vegas Street Circuit	Nevada	USA	0101000020E61000004260E5D022CB5CC0C9E53FA4DF0E4240	639	http://en.wikipedia.org/wiki/Las_Vegas_Street_Circuit
47	detroit	Detroit Street Circuit	Detroit	USA	0101000020E6100000742497FF90C254C0431CEBE2362A4540	177	http://en.wikipedia.org/wiki/Detroit_street_circuit
48	dallas	Fair Park	Dallas	USA	0101000020E61000006ADE718A8E3058C088F4DBD781634040	139	http://en.wikipedia.org/wiki/Fair_Park
49	estoril	Autódromo do Estoril	Estoril	Portugal	0101000020E6100000EF2076A6D0C922C055302AA913604340	130	http://en.wikipedia.org/wiki/Aut%C3%B3dromo_do_Estoril
50	adelaide	Adelaide Street Circuit	Adelaide	Australia	0101000020E610000039B4C876BE536140F46C567DAE7641C0	58	http://en.wikipedia.org/wiki/Adelaide_Street_Circuit
51	jerez	Circuito de Jerez	Jerez de la Frontera	Spain	0101000020E61000006C04E275FD2218C0DFE00B93A95A4240	37	http://en.wikipedia.org/wiki/Circuito_Permanente_de_Jerez
52	hungaroring	Hungaroring	Budapest	Hungary	0101000020E61000001DC9E53FA43F3340C3D32B6519CA4740	264	http://en.wikipedia.org/wiki/Hungaroring
53	suzuka	Suzuka Circuit	Suzuka	Japan	0101000020E61000005A643BDF4F116140F9A067B3EA6B4140	45	http://en.wikipedia.org/wiki/Suzuka_Circuit
54	phoenix	Phoenix street circuit	Phoenix	USA	0101000020E6100000CDCCCCCCCC045CC06FF085C954B94040	345	http://en.wikipedia.org/wiki/Phoenix_street_circuit
55	magny_cours	Circuit de Nevers Magny-Cours	Magny Cours	France	0101000020E610000073637AC2124F0940029A081B9E6E4740	228	http://en.wikipedia.org/wiki/Circuit_de_Nevers_Magny-Cours
56	catalunya	Circuit de Barcelona-Catalunya	Montmeló	Spain	0101000020E6100000BB44F5D6C0160240295C8FC2F5C84440	109	http://en.wikipedia.org/wiki/Circuit_de_Barcelona-Catalunya
57	donington	Donington Park	Castle Donington	UK	0101000020E6100000707CED992501F6BF5F07CE19516A4A40	88	http://en.wikipedia.org/wiki/Donington_Park
58	okayama	Okayama International Circuit	Okayama	Japan	0101000020E6100000508D976E12C7604085EB51B81E754140	266	http://en.wikipedia.org/wiki/TI_Circuit
59	albert_park	Albert Park Grand Prix Circuit	Melbourne	Australia	0101000020E6100000E5D022DBF91E6240A2B437F8C2EC42C0	10	http://en.wikipedia.org/wiki/Melbourne_Grand_Prix_Circuit
60	sepang	Sepang International Circuit	Kuala Lumpur	Malaysia	0101000020E6100000AC1C5A643B6F59408386FE092E160640	18	http://en.wikipedia.org/wiki/Sepang_International_Circuit
61	bahrain	Bahrain International Circuit	Sakhir	Bahrain	0101000020E610000036AB3E575B414940B81E85EB51083A40	7	http://en.wikipedia.org/wiki/Bahrain_International_Circuit
62	shanghai	Shanghai International Circuit	Shanghai	China	0101000020E6100000AE47E17A144E5E40499D8026C2563F40	5	http://en.wikipedia.org/wiki/Shanghai_International_Circuit
63	istanbul	Istanbul Park	Istanbul	Turkey	0101000020E610000048E17A14AE673D4036CD3B4ED1794440	130	http://en.wikipedia.org/wiki/Istanbul_Park
64	valencia	Valencia Street Circuit	Valencia	Spain	0101000020E610000049658A39083AD5BF3411363CBDBA4340	4	http://en.wikipedia.org/wiki/Valencia_Street_Circuit
65	marina_bay	Marina Bay Street Circuit	Marina Bay	Singapore	0101000020E61000009EEFA7C64BF75940D3DEE00B93A9F43F	18	http://en.wikipedia.org/wiki/Marina_Bay_Street_Circuit
66	yas_marina	Yas Marina Circuit	Abu Dhabi	UAE	0101000020E6100000DA1B7C61324D4B40F2B0506B9A773840	3	http://en.wikipedia.org/wiki/Yas_Marina_Circuit
67	yeongam	Korean International Circuit	Yeongam County	Korea	0101000020E6100000A69BC420B09A5F4012143FC6DC5D4140	0	http://en.wikipedia.org/wiki/Korean_International_Circuit
68	buddh	Buddh International Circuit	Uttar Pradesh	India	0101000020E6100000D95F764F1E6253407E1D386744593C40	194	http://en.wikipedia.org/wiki/Buddh_International_Circuit
69	americas	Circuit of the Americas	Austin	USA	0101000020E6100000CC5D4BC8076958C0A7E8482EFF213E40	161	http://en.wikipedia.org/wiki/Circuit_of_the_Americas
70	sochi	Sochi Autodrom	Sochi	Russia	0101000020E6100000ED0DBE3099FA43405DFE43FAEDB34540	2	http://en.wikipedia.org/wiki/Sochi_Autodrom
71	baku	Baku City Circuit	Baku	Azerbaijan	0101000020E6100000A1D634EF38ED484048E17A14AE2F4440	-7	http://en.wikipedia.org/wiki/Baku_City_Circuit
72	mugello	Autodromo Internazionale del Mugello	Mugello	Italy	0101000020E6100000CAC342AD69BE264048E17A14AEFF4540	255	http://en.wikipedia.org/wiki/Mugello_Circuit
73	portimao	Autódromo Internacional do Algarve	Portimão	Portugal	0101000020E610000070CE88D2DE4021C0931804560E9D4240	108	http://en.wikipedia.org/wiki/Algarve_International_Circuit
74	losail	Losail International Circuit	Al Daayen	Qatar	0101000020E6100000EEEBC03923BA49403D0AD7A3707D3940	12	http://en.wikipedia.org/wiki/Losail_International_Circuit
75	jeddah	Jeddah Corniche Circuit	Jeddah	Saudi Arabia	0101000020E6100000E8D9ACFA5C8D4340A857CA32C4A13540	15	http://en.wikipedia.org/wiki/Jeddah_Street_Circuit
76	miami	Miami International Autodrome	Miami	USA	0101000020E6100000ECC039234A0F54C0304CA60A46F53940	0	http://en.wikipedia.org/wiki/Miami_International_Autodrome
77	vegas	Las Vegas Strip Street Circuit	Las Vegas	United States	0101000020E6100000508D976E12CB5CC0F46C567DAE0E4240	642	https://en.wikipedia.org/wiki/Las_Vegas_Grand_Prix#Circuit
\.


--
-- Data for Name: formula_one_penalty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_penalty (id, license_points, "position", "time", is_time_served_in_pit, earned_id, served_id) FROM stdin;
\.


--
-- Data for Name: formula_one_pointsystem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_pointsystem (id, reference, name, driver_position_points, driver_fastest_lap, team_position_points, team_fastest_lap, partial, shared_drive, is_double_points) FROM stdin;
1	No Points	Session with no Points Awarded	0	0	0	0	0	0	f
2	r1950	1950-1953 Race Points	1	1	0	0	0	1	f
3	r1954	1954 Race Points	1	2	0	0	0	1	f
4	r1955	1955 Race Points	1	2	0	0	0	2	f
5	r1956	1956 - 1957 Race Points	1	2	0	0	0	3	f
6	r1958	1958 - 1959 Race Points	1	2	1	0	0	0	f
7	r1958indi	1958 - 1959 Indianapolis Points	1	2	0	0	0	0	f
8	r1960	1960 Race Points	2	0	2	0	0	0	f
9	r1960indi	1960 Indianapolis Points	2	0	0	0	0	0	f
10	r1961	1961 Race Points	3	0	2	0	0	0	f
11	r1962	1962 - 1974 Race Points	3	0	3	0	0	0	f
12	r1975	1975 - 1979 Race Points	3	0	3	0	1	0	f
13	r1980	1980 - 1990 Race Points	3	0	3	0	2	0	f
14	r1991	1991 - 2002 Race Points	5	0	5	0	2	0	f
15	r2003	2003 - 2009 Race Points	6	0	6	0	2	0	f
16	r2010	2010 - 2018 Race Points	7	0	7	0	2	0	f
17	r2014double	2014 Double Race Points	7	0	7	0	2	0	t
18	r2019	2019 - 2021 Race Points	7	3	7	3	2	0	f
19	sprint2021	2021 Sprint Points	21	0	21	0	2	0	f
20	r2022	2022 Race Points	7	4	7	4	3	0	f
21	sprint2022	2022 Sprint Points	22	0	22	0	3	0	f
22	r2023	2023 - Present Race Points	7	4	7	4	4	0	f
23	sprint2023	2023 - Present Sprint Points	22	0	22	0	4	0	f
\.


--
-- Data for Name: formula_one_round; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_round (id, number, name, date, race_number, wikipedia, is_cancelled, circuit_id, season_id) FROM stdin;
1	1	British Grand Prix	1950-05-13	1	http://en.wikipedia.org/wiki/1950_British_Grand_Prix	f	1	1
2	2	Monaco Grand Prix	1950-05-21	2	http://en.wikipedia.org/wiki/1950_Monaco_Grand_Prix	f	2	1
3	3	Indianapolis 500	1950-05-30	3	http://en.wikipedia.org/wiki/1950_Indianapolis_500	f	3	1
4	4	Swiss Grand Prix	1950-06-04	4	http://en.wikipedia.org/wiki/1950_Swiss_Grand_Prix	f	4	1
5	5	Belgian Grand Prix	1950-06-18	5	http://en.wikipedia.org/wiki/1950_Belgian_Grand_Prix	f	5	1
6	6	French Grand Prix	1950-07-02	6	http://en.wikipedia.org/wiki/1950_French_Grand_Prix	f	6	1
7	7	Italian Grand Prix	1950-09-03	7	http://en.wikipedia.org/wiki/1950_Italian_Grand_Prix	f	7	1
8	1	Swiss Grand Prix	1951-05-27	8	http://en.wikipedia.org/wiki/1951_Swiss_Grand_Prix	f	4	2
9	2	Indianapolis 500	1951-05-30	9	http://en.wikipedia.org/wiki/1951_Indianapolis_500	f	3	2
10	3	Belgian Grand Prix	1951-06-17	10	http://en.wikipedia.org/wiki/1951_Belgian_Grand_Prix	f	5	2
11	4	French Grand Prix	1951-07-01	11	http://en.wikipedia.org/wiki/1951_French_Grand_Prix	f	6	2
12	5	British Grand Prix	1951-07-14	12	http://en.wikipedia.org/wiki/1951_British_Grand_Prix	f	1	2
13	6	German Grand Prix	1951-07-29	13	http://en.wikipedia.org/wiki/1951_German_Grand_Prix	f	8	2
14	7	Italian Grand Prix	1951-09-16	14	http://en.wikipedia.org/wiki/1951_Italian_Grand_Prix	f	7	2
15	8	Spanish Grand Prix	1951-10-28	15	http://en.wikipedia.org/wiki/1951_Spanish_Grand_Prix	f	9	2
16	1	Swiss Grand Prix	1952-05-18	16	http://en.wikipedia.org/wiki/1952_Swiss_Grand_Prix	f	4	3
17	2	Indianapolis 500	1952-05-30	17	http://en.wikipedia.org/wiki/1952_Indianapolis_500	f	3	3
18	3	Belgian Grand Prix	1952-06-22	18	http://en.wikipedia.org/wiki/1952_Belgian_Grand_Prix	f	5	3
19	4	French Grand Prix	1952-07-06	19	http://en.wikipedia.org/wiki/1952_French_Grand_Prix	f	10	3
20	5	British Grand Prix	1952-07-19	20	http://en.wikipedia.org/wiki/1952_British_Grand_Prix	f	1	3
21	6	German Grand Prix	1952-08-03	21	http://en.wikipedia.org/wiki/1952_German_Grand_Prix	f	8	3
22	7	Dutch Grand Prix	1952-08-17	22	http://en.wikipedia.org/wiki/1952_Dutch_Grand_Prix	f	11	3
23	8	Italian Grand Prix	1952-09-07	23	http://en.wikipedia.org/wiki/1952_Italian_Grand_Prix	f	7	3
24	1	Argentine Grand Prix	1953-01-18	24	http://en.wikipedia.org/wiki/1953_Argentine_Grand_Prix	f	12	4
25	2	Indianapolis 500	1953-05-30	25	http://en.wikipedia.org/wiki/1953_Indianapolis_500	f	3	4
26	3	Dutch Grand Prix	1953-06-07	26	http://en.wikipedia.org/wiki/1953_Dutch_Grand_Prix	f	11	4
27	4	Belgian Grand Prix	1953-06-21	27	http://en.wikipedia.org/wiki/1953_Belgian_Grand_Prix	f	5	4
28	5	French Grand Prix	1953-07-05	28	http://en.wikipedia.org/wiki/1953_French_Grand_Prix	f	6	4
29	6	British Grand Prix	1953-07-18	29	http://en.wikipedia.org/wiki/1953_British_Grand_Prix	f	1	4
30	7	German Grand Prix	1953-08-02	30	http://en.wikipedia.org/wiki/1953_German_Grand_Prix	f	8	4
31	8	Swiss Grand Prix	1953-08-23	31	http://en.wikipedia.org/wiki/1953_Swiss_Grand_Prix	f	4	4
32	9	Italian Grand Prix	1953-09-13	32	http://en.wikipedia.org/wiki/1953_Italian_Grand_Prix	f	7	4
33	1	Argentine Grand Prix	1954-01-17	33	http://en.wikipedia.org/wiki/1954_Argentine_Grand_Prix	f	12	5
34	2	Indianapolis 500	1954-05-31	34	http://en.wikipedia.org/wiki/1954_Indianapolis_500	f	3	5
35	3	Belgian Grand Prix	1954-06-20	35	http://en.wikipedia.org/wiki/1954_Belgian_Grand_Prix	f	5	5
36	4	French Grand Prix	1954-07-04	36	http://en.wikipedia.org/wiki/1954_French_Grand_Prix	f	6	5
37	5	British Grand Prix	1954-07-17	37	http://en.wikipedia.org/wiki/1954_British_Grand_Prix	f	1	5
38	6	German Grand Prix	1954-08-01	38	http://en.wikipedia.org/wiki/1954_German_Grand_Prix	f	8	5
39	7	Swiss Grand Prix	1954-08-22	39	http://en.wikipedia.org/wiki/1954_Swiss_Grand_Prix	f	4	5
40	8	Italian Grand Prix	1954-09-05	40	http://en.wikipedia.org/wiki/1954_Italian_Grand_Prix	f	7	5
41	9	Spanish Grand Prix	1954-10-24	41	http://en.wikipedia.org/wiki/1954_Spanish_Grand_Prix	f	9	5
42	1	Argentine Grand Prix	1955-01-16	42	http://en.wikipedia.org/wiki/1955_Argentine_Grand_Prix	f	12	6
43	2	Monaco Grand Prix	1955-05-22	43	http://en.wikipedia.org/wiki/1955_Monaco_Grand_Prix	f	2	6
44	3	Indianapolis 500	1955-05-30	44	http://en.wikipedia.org/wiki/1955_Indianapolis_500	f	3	6
45	4	Belgian Grand Prix	1955-06-05	45	http://en.wikipedia.org/wiki/1955_Belgian_Grand_Prix	f	5	6
46	5	Dutch Grand Prix	1955-06-19	46	http://en.wikipedia.org/wiki/1955_Dutch_Grand_Prix	f	11	6
47	6	British Grand Prix	1955-07-16	47	http://en.wikipedia.org/wiki/1955_British_Grand_Prix	f	13	6
48	7	Italian Grand Prix	1955-09-11	48	http://en.wikipedia.org/wiki/1955_Italian_Grand_Prix	f	7	6
49	1	Argentine Grand Prix	1956-01-22	49	http://en.wikipedia.org/wiki/1956_Argentine_Grand_Prix	f	12	7
50	2	Monaco Grand Prix	1956-05-13	50	http://en.wikipedia.org/wiki/1956_Monaco_Grand_Prix	f	2	7
51	3	Indianapolis 500	1956-05-30	51	http://en.wikipedia.org/wiki/1956_Indianapolis_500	f	3	7
52	4	Belgian Grand Prix	1956-06-03	52	http://en.wikipedia.org/wiki/1956_Belgian_Grand_Prix	f	5	7
53	5	French Grand Prix	1956-07-01	53	http://en.wikipedia.org/wiki/1956_French_Grand_Prix	f	6	7
54	6	British Grand Prix	1956-07-14	54	http://en.wikipedia.org/wiki/1956_British_Grand_Prix	f	1	7
55	7	German Grand Prix	1956-08-05	55	http://en.wikipedia.org/wiki/1956_German_Grand_Prix	f	8	7
56	8	Italian Grand Prix	1956-09-02	56	http://en.wikipedia.org/wiki/1956_Italian_Grand_Prix	f	7	7
57	1	Argentine Grand Prix	1957-01-13	57	http://en.wikipedia.org/wiki/1957_Argentine_Grand_Prix	f	12	8
58	2	Monaco Grand Prix	1957-05-19	58	http://en.wikipedia.org/wiki/1957_Monaco_Grand_Prix	f	2	8
59	3	Indianapolis 500	1957-05-30	59	http://en.wikipedia.org/wiki/1957_Indianapolis_500	f	3	8
60	4	French Grand Prix	1957-07-07	60	http://en.wikipedia.org/wiki/1957_French_Grand_Prix	f	10	8
61	5	British Grand Prix	1957-07-20	61	http://en.wikipedia.org/wiki/1957_British_Grand_Prix	f	13	8
62	6	German Grand Prix	1957-08-04	62	http://en.wikipedia.org/wiki/1957_German_Grand_Prix	f	8	8
63	7	Pescara Grand Prix	1957-08-18	63	http://en.wikipedia.org/wiki/1957_Pescara_Grand_Prix	f	14	8
64	8	Italian Grand Prix	1957-09-08	64	http://en.wikipedia.org/wiki/1957_Italian_Grand_Prix	f	7	8
65	1	Argentine Grand Prix	1958-01-19	65	http://en.wikipedia.org/wiki/1958_Argentine_Grand_Prix	f	12	9
66	2	Monaco Grand Prix	1958-05-18	66	http://en.wikipedia.org/wiki/1958_Monaco_Grand_Prix	f	2	9
67	3	Dutch Grand Prix	1958-05-26	67	http://en.wikipedia.org/wiki/1958_Dutch_Grand_Prix	f	11	9
68	4	Indianapolis 500	1958-05-30	68	http://en.wikipedia.org/wiki/1958_Indianapolis_500	f	3	9
69	5	Belgian Grand Prix	1958-06-15	69	http://en.wikipedia.org/wiki/1958_Belgian_Grand_Prix	f	5	9
70	6	French Grand Prix	1958-07-06	70	http://en.wikipedia.org/wiki/1958_French_Grand_Prix	f	6	9
71	7	British Grand Prix	1958-07-19	71	http://en.wikipedia.org/wiki/1958_British_Grand_Prix	f	1	9
72	8	German Grand Prix	1958-08-03	72	http://en.wikipedia.org/wiki/1958_German_Grand_Prix	f	8	9
73	9	Portuguese Grand Prix	1958-08-24	73	http://en.wikipedia.org/wiki/1958_Portuguese_Grand_Prix	f	15	9
74	10	Italian Grand Prix	1958-09-07	74	http://en.wikipedia.org/wiki/1958_Italian_Grand_Prix	f	7	9
75	11	Moroccan Grand Prix	1958-10-19	75	http://en.wikipedia.org/wiki/1958_Moroccan_Grand_Prix	f	16	9
76	1	Monaco Grand Prix	1959-05-10	76	http://en.wikipedia.org/wiki/1959_Monaco_Grand_Prix	f	2	10
77	2	Indianapolis 500	1959-05-30	77	http://en.wikipedia.org/wiki/1959_Indianapolis_500	f	3	10
78	3	Dutch Grand Prix	1959-05-31	78	http://en.wikipedia.org/wiki/1959_Dutch_Grand_Prix	f	11	10
79	4	French Grand Prix	1959-07-05	79	http://en.wikipedia.org/wiki/1959_French_Grand_Prix	f	6	10
80	5	British Grand Prix	1959-07-18	80	http://en.wikipedia.org/wiki/1959_British_Grand_Prix	f	13	10
81	6	German Grand Prix	1959-08-02	81	http://en.wikipedia.org/wiki/1959_German_Grand_Prix	f	17	10
82	7	Portuguese Grand Prix	1959-08-23	82	http://en.wikipedia.org/wiki/1959_Portuguese_Grand_Prix	f	18	10
83	8	Italian Grand Prix	1959-09-13	83	http://en.wikipedia.org/wiki/1959_Italian_Grand_Prix	f	7	10
84	9	United States Grand Prix	1959-12-12	84	http://en.wikipedia.org/wiki/1959_United_States_Grand_Prix	f	19	10
85	1	Argentine Grand Prix	1960-02-07	85	http://en.wikipedia.org/wiki/1960_Argentine_Grand_Prix	f	12	11
86	2	Monaco Grand Prix	1960-05-29	86	http://en.wikipedia.org/wiki/1960_Monaco_Grand_Prix	f	2	11
87	3	Indianapolis 500	1960-05-30	87	http://en.wikipedia.org/wiki/1960_Indianapolis_500	f	3	11
88	4	Dutch Grand Prix	1960-06-06	88	http://en.wikipedia.org/wiki/1960_Dutch_Grand_Prix	f	11	11
89	5	Belgian Grand Prix	1960-06-19	89	http://en.wikipedia.org/wiki/1960_Belgian_Grand_Prix	f	5	11
90	6	French Grand Prix	1960-07-03	90	http://en.wikipedia.org/wiki/1960_French_Grand_Prix	f	6	11
91	7	British Grand Prix	1960-07-16	91	http://en.wikipedia.org/wiki/1960_British_Grand_Prix	f	1	11
92	8	Portuguese Grand Prix	1960-08-14	92	http://en.wikipedia.org/wiki/1960_Portuguese_Grand_Prix	f	15	11
93	9	Italian Grand Prix	1960-09-04	93	http://en.wikipedia.org/wiki/1960_Italian_Grand_Prix	f	7	11
94	10	United States Grand Prix	1960-11-20	94	http://en.wikipedia.org/wiki/1960_United_States_Grand_Prix	f	20	11
95	1	Monaco Grand Prix	1961-05-14	95	http://en.wikipedia.org/wiki/1961_Monaco_Grand_Prix	f	2	12
96	2	Dutch Grand Prix	1961-05-22	96	http://en.wikipedia.org/wiki/1961_Dutch_Grand_Prix	f	11	12
97	3	Belgian Grand Prix	1961-06-18	97	http://en.wikipedia.org/wiki/1961_Belgian_Grand_Prix	f	5	12
98	4	French Grand Prix	1961-07-02	98	http://en.wikipedia.org/wiki/1961_French_Grand_Prix	f	6	12
99	5	British Grand Prix	1961-07-15	99	http://en.wikipedia.org/wiki/1961_British_Grand_Prix	f	13	12
100	6	German Grand Prix	1961-08-06	100	http://en.wikipedia.org/wiki/1961_German_Grand_Prix	f	8	12
101	7	Italian Grand Prix	1961-09-10	101	http://en.wikipedia.org/wiki/1961_Italian_Grand_Prix	f	7	12
102	8	United States Grand Prix	1961-10-08	102	http://en.wikipedia.org/wiki/1961_United_States_Grand_Prix	f	21	12
103	1	Dutch Grand Prix	1962-05-20	103	http://en.wikipedia.org/wiki/1962_Dutch_Grand_Prix	f	11	13
104	2	Monaco Grand Prix	1962-06-03	104	http://en.wikipedia.org/wiki/1962_Monaco_Grand_Prix	f	2	13
105	3	Belgian Grand Prix	1962-06-17	105	http://en.wikipedia.org/wiki/1962_Belgian_Grand_Prix	f	5	13
106	4	French Grand Prix	1962-07-08	106	http://en.wikipedia.org/wiki/1962_French_Grand_Prix	f	10	13
107	5	British Grand Prix	1962-07-21	107	http://en.wikipedia.org/wiki/1962_British_Grand_Prix	f	13	13
108	6	German Grand Prix	1962-08-05	108	http://en.wikipedia.org/wiki/1962_German_Grand_Prix	f	8	13
109	7	Italian Grand Prix	1962-09-16	109	http://en.wikipedia.org/wiki/1962_Italian_Grand_Prix	f	7	13
110	8	United States Grand Prix	1962-10-07	110	http://en.wikipedia.org/wiki/1962_United_States_Grand_Prix	f	21	13
111	9	South African Grand Prix	1962-12-29	111	http://en.wikipedia.org/wiki/1962_South_African_Grand_Prix	f	22	13
112	1	Monaco Grand Prix	1963-05-26	112	http://en.wikipedia.org/wiki/1963_Monaco_Grand_Prix	f	2	14
113	2	Belgian Grand Prix	1963-06-09	113	http://en.wikipedia.org/wiki/1963_Belgian_Grand_Prix	f	5	14
114	3	Dutch Grand Prix	1963-06-23	114	http://en.wikipedia.org/wiki/1963_Dutch_Grand_Prix	f	11	14
115	4	French Grand Prix	1963-06-30	115	http://en.wikipedia.org/wiki/1963_French_Grand_Prix	f	6	14
116	5	British Grand Prix	1963-07-20	116	http://en.wikipedia.org/wiki/1963_British_Grand_Prix	f	1	14
117	6	German Grand Prix	1963-08-04	117	http://en.wikipedia.org/wiki/1963_German_Grand_Prix	f	8	14
118	7	Italian Grand Prix	1963-09-08	118	http://en.wikipedia.org/wiki/1963_Italian_Grand_Prix	f	7	14
119	8	United States Grand Prix	1963-10-06	119	http://en.wikipedia.org/wiki/1963_United_States_Grand_Prix	f	21	14
120	9	Mexican Grand Prix	1963-10-27	120	http://en.wikipedia.org/wiki/1963_Mexican_Grand_Prix	f	23	14
121	10	South African Grand Prix	1963-12-28	121	http://en.wikipedia.org/wiki/1963_South_African_Grand_Prix	f	22	14
122	1	Monaco Grand Prix	1964-05-10	122	http://en.wikipedia.org/wiki/1964_Monaco_Grand_Prix	f	2	15
123	2	Dutch Grand Prix	1964-05-24	123	http://en.wikipedia.org/wiki/1964_Dutch_Grand_Prix	f	11	15
124	3	Belgian Grand Prix	1964-06-14	124	http://en.wikipedia.org/wiki/1964_Belgian_Grand_Prix	f	5	15
125	4	French Grand Prix	1964-06-28	125	http://en.wikipedia.org/wiki/1964_French_Grand_Prix	f	10	15
126	5	British Grand Prix	1964-07-11	126	http://en.wikipedia.org/wiki/1964_British_Grand_Prix	f	24	15
127	6	German Grand Prix	1964-08-02	127	http://en.wikipedia.org/wiki/1964_German_Grand_Prix	f	8	15
128	7	Austrian Grand Prix	1964-08-23	128	http://en.wikipedia.org/wiki/1964_Austrian_Grand_Prix	f	25	15
129	8	Italian Grand Prix	1964-09-06	129	http://en.wikipedia.org/wiki/1964_Italian_Grand_Prix	f	7	15
130	9	United States Grand Prix	1964-10-04	130	http://en.wikipedia.org/wiki/1964_United_States_Grand_Prix	f	21	15
131	10	Mexican Grand Prix	1964-10-25	131	http://en.wikipedia.org/wiki/1964_Mexican_Grand_Prix	f	23	15
132	1	South African Grand Prix	1965-01-01	132	http://en.wikipedia.org/wiki/1965_South_African_Grand_Prix	f	22	16
133	2	Monaco Grand Prix	1965-05-30	133	http://en.wikipedia.org/wiki/1965_Monaco_Grand_Prix	f	2	16
134	3	Belgian Grand Prix	1965-06-13	134	http://en.wikipedia.org/wiki/1965_Belgian_Grand_Prix	f	5	16
135	4	French Grand Prix	1965-06-27	135	http://en.wikipedia.org/wiki/1965_French_Grand_Prix	f	26	16
136	5	British Grand Prix	1965-07-10	136	http://en.wikipedia.org/wiki/1965_British_Grand_Prix	f	1	16
137	6	Dutch Grand Prix	1965-07-18	137	http://en.wikipedia.org/wiki/1965_Dutch_Grand_Prix	f	11	16
138	7	German Grand Prix	1965-08-01	138	http://en.wikipedia.org/wiki/1965_German_Grand_Prix	f	8	16
139	8	Italian Grand Prix	1965-09-12	139	http://en.wikipedia.org/wiki/1965_Italian_Grand_Prix	f	7	16
140	9	United States Grand Prix	1965-10-03	140	http://en.wikipedia.org/wiki/1965_United_States_Grand_Prix	f	21	16
141	10	Mexican Grand Prix	1965-10-24	141	http://en.wikipedia.org/wiki/1965_Mexican_Grand_Prix	f	23	16
142	1	Monaco Grand Prix	1966-05-22	142	http://en.wikipedia.org/wiki/1966_Monaco_Grand_Prix	f	2	17
143	2	Belgian Grand Prix	1966-06-12	143	http://en.wikipedia.org/wiki/1966_Belgian_Grand_Prix	f	5	17
144	3	French Grand Prix	1966-07-03	144	http://en.wikipedia.org/wiki/1966_French_Grand_Prix	f	6	17
145	4	British Grand Prix	1966-07-16	145	http://en.wikipedia.org/wiki/1966_British_Grand_Prix	f	24	17
146	5	Dutch Grand Prix	1966-07-24	146	http://en.wikipedia.org/wiki/1966_Dutch_Grand_Prix	f	11	17
147	6	German Grand Prix	1966-08-07	147	http://en.wikipedia.org/wiki/1966_German_Grand_Prix	f	8	17
148	7	Italian Grand Prix	1966-09-04	148	http://en.wikipedia.org/wiki/1966_Italian_Grand_Prix	f	7	17
149	8	United States Grand Prix	1966-10-02	149	http://en.wikipedia.org/wiki/1966_United_States_Grand_Prix	f	21	17
150	9	Mexican Grand Prix	1966-10-23	150	http://en.wikipedia.org/wiki/1966_Mexican_Grand_Prix	f	23	17
151	1	South African Grand Prix	1967-01-02	151	http://en.wikipedia.org/wiki/1967_South_African_Grand_Prix	f	27	18
152	2	Monaco Grand Prix	1967-05-07	152	http://en.wikipedia.org/wiki/1967_Monaco_Grand_Prix	f	2	18
153	3	Dutch Grand Prix	1967-06-04	153	http://en.wikipedia.org/wiki/1967_Dutch_Grand_Prix	f	11	18
154	4	Belgian Grand Prix	1967-06-18	154	http://en.wikipedia.org/wiki/1967_Belgian_Grand_Prix	f	5	18
155	5	French Grand Prix	1967-07-02	155	http://en.wikipedia.org/wiki/1967_French_Grand_Prix	f	28	18
156	6	British Grand Prix	1967-07-15	156	http://en.wikipedia.org/wiki/1967_British_Grand_Prix	f	1	18
157	7	German Grand Prix	1967-08-06	157	http://en.wikipedia.org/wiki/1967_German_Grand_Prix	f	8	18
158	8	Canadian Grand Prix	1967-08-27	158	http://en.wikipedia.org/wiki/1967_Canadian_Grand_Prix	f	29	18
159	9	Italian Grand Prix	1967-09-10	159	http://en.wikipedia.org/wiki/1967_Italian_Grand_Prix	f	7	18
160	10	United States Grand Prix	1967-10-01	160	http://en.wikipedia.org/wiki/1967_United_States_Grand_Prix	f	21	18
161	11	Mexican Grand Prix	1967-10-22	161	http://en.wikipedia.org/wiki/1967_Mexican_Grand_Prix	f	23	18
162	1	South African Grand Prix	1968-01-01	162	http://en.wikipedia.org/wiki/1968_South_African_Grand_Prix	f	27	19
163	2	Spanish Grand Prix	1968-05-12	163	http://en.wikipedia.org/wiki/1968_Spanish_Grand_Prix	f	30	19
164	3	Monaco Grand Prix	1968-05-26	164	http://en.wikipedia.org/wiki/1968_Monaco_Grand_Prix	f	2	19
165	4	Belgian Grand Prix	1968-06-09	165	http://en.wikipedia.org/wiki/1968_Belgian_Grand_Prix	f	5	19
166	5	Dutch Grand Prix	1968-06-23	166	http://en.wikipedia.org/wiki/1968_Dutch_Grand_Prix	f	11	19
167	6	French Grand Prix	1968-07-07	167	http://en.wikipedia.org/wiki/1968_French_Grand_Prix	f	10	19
168	7	British Grand Prix	1968-07-20	168	http://en.wikipedia.org/wiki/1968_British_Grand_Prix	f	24	19
169	8	German Grand Prix	1968-08-04	169	http://en.wikipedia.org/wiki/1968_German_Grand_Prix	f	8	19
170	9	Italian Grand Prix	1968-09-08	170	http://en.wikipedia.org/wiki/1968_Italian_Grand_Prix	f	7	19
171	10	Canadian Grand Prix	1968-09-22	171	http://en.wikipedia.org/wiki/1968_Canadian_Grand_Prix	f	31	19
172	11	United States Grand Prix	1968-10-06	172	http://en.wikipedia.org/wiki/1968_United_States_Grand_Prix	f	21	19
173	12	Mexican Grand Prix	1968-11-03	173	http://en.wikipedia.org/wiki/1968_Mexican_Grand_Prix	f	23	19
174	1	South African Grand Prix	1969-03-01	174	http://en.wikipedia.org/wiki/1969_South_African_Grand_Prix	f	27	20
175	2	Spanish Grand Prix	1969-05-04	175	http://en.wikipedia.org/wiki/1969_Spanish_Grand_Prix	f	32	20
176	3	Monaco Grand Prix	1969-05-18	176	http://en.wikipedia.org/wiki/1969_Monaco_Grand_Prix	f	2	20
177	4	Dutch Grand Prix	1969-06-21	177	http://en.wikipedia.org/wiki/1969_Dutch_Grand_Prix	f	11	20
178	5	French Grand Prix	1969-07-06	178	http://en.wikipedia.org/wiki/1969_French_Grand_Prix	f	26	20
179	6	British Grand Prix	1969-07-19	179	http://en.wikipedia.org/wiki/1969_British_Grand_Prix	f	1	20
180	7	German Grand Prix	1969-08-03	180	http://en.wikipedia.org/wiki/1969_German_Grand_Prix	f	8	20
181	8	Italian Grand Prix	1969-09-07	181	http://en.wikipedia.org/wiki/1969_Italian_Grand_Prix	f	7	20
182	9	Canadian Grand Prix	1969-09-20	182	http://en.wikipedia.org/wiki/1969_Canadian_Grand_Prix	f	29	20
183	10	United States Grand Prix	1969-10-05	183	http://en.wikipedia.org/wiki/1969_United_States_Grand_Prix	f	21	20
184	11	Mexican Grand Prix	1969-10-19	184	http://en.wikipedia.org/wiki/1969_Mexican_Grand_Prix	f	23	20
185	1	South African Grand Prix	1970-03-07	185	http://en.wikipedia.org/wiki/1970_South_African_Grand_Prix	f	27	21
186	2	Spanish Grand Prix	1970-04-19	186	http://en.wikipedia.org/wiki/1970_Spanish_Grand_Prix	f	30	21
187	3	Monaco Grand Prix	1970-05-10	187	http://en.wikipedia.org/wiki/1970_Monaco_Grand_Prix	f	2	21
188	4	Belgian Grand Prix	1970-06-07	188	http://en.wikipedia.org/wiki/1970_Belgian_Grand_Prix	f	5	21
189	5	Dutch Grand Prix	1970-06-21	189	http://en.wikipedia.org/wiki/1970_Dutch_Grand_Prix	f	11	21
190	6	French Grand Prix	1970-07-05	190	http://en.wikipedia.org/wiki/1970_French_Grand_Prix	f	26	21
191	7	British Grand Prix	1970-07-18	191	http://en.wikipedia.org/wiki/1970_British_Grand_Prix	f	24	21
192	8	German Grand Prix	1970-08-02	192	http://en.wikipedia.org/wiki/1970_German_Grand_Prix	f	33	21
193	9	Austrian Grand Prix	1970-08-16	193	http://en.wikipedia.org/wiki/1970_Austrian_Grand_Prix	f	34	21
194	10	Italian Grand Prix	1970-09-06	194	http://en.wikipedia.org/wiki/1970_Italian_Grand_Prix	f	7	21
195	11	Canadian Grand Prix	1970-09-20	195	http://en.wikipedia.org/wiki/1970_Canadian_Grand_Prix	f	31	21
196	12	United States Grand Prix	1970-10-04	196	http://en.wikipedia.org/wiki/1970_United_States_Grand_Prix	f	21	21
197	13	Mexican Grand Prix	1970-10-25	197	http://en.wikipedia.org/wiki/1970_Mexican_Grand_Prix	f	23	21
198	1	South African Grand Prix	1971-03-06	198	http://en.wikipedia.org/wiki/1971_South_African_Grand_Prix	f	27	22
199	2	Spanish Grand Prix	1971-04-18	199	http://en.wikipedia.org/wiki/1971_Spanish_Grand_Prix	f	32	22
200	3	Monaco Grand Prix	1971-05-23	200	http://en.wikipedia.org/wiki/1971_Monaco_Grand_Prix	f	2	22
201	4	Dutch Grand Prix	1971-06-20	201	http://en.wikipedia.org/wiki/1971_Dutch_Grand_Prix	f	11	22
202	5	French Grand Prix	1971-07-04	202	http://en.wikipedia.org/wiki/1971_French_Grand_Prix	f	35	22
203	6	British Grand Prix	1971-07-17	203	http://en.wikipedia.org/wiki/1971_British_Grand_Prix	f	1	22
204	7	German Grand Prix	1971-08-01	204	http://en.wikipedia.org/wiki/1971_German_Grand_Prix	f	8	22
205	8	Austrian Grand Prix	1971-08-15	205	http://en.wikipedia.org/wiki/1971_Austrian_Grand_Prix	f	34	22
206	9	Italian Grand Prix	1971-09-05	206	http://en.wikipedia.org/wiki/1971_Italian_Grand_Prix	f	7	22
207	10	Canadian Grand Prix	1971-09-19	207	http://en.wikipedia.org/wiki/1971_Canadian_Grand_Prix	f	29	22
208	11	United States Grand Prix	1971-10-03	208	http://en.wikipedia.org/wiki/1971_United_States_Grand_Prix	f	21	22
209	1	Argentine Grand Prix	1972-01-23	209	http://en.wikipedia.org/wiki/1972_Argentine_Grand_Prix	f	12	23
210	2	South African Grand Prix	1972-03-04	210	http://en.wikipedia.org/wiki/1972_South_African_Grand_Prix	f	27	23
211	3	Spanish Grand Prix	1972-05-01	211	http://en.wikipedia.org/wiki/1972_Spanish_Grand_Prix	f	30	23
212	4	Monaco Grand Prix	1972-05-14	212	http://en.wikipedia.org/wiki/1972_Monaco_Grand_Prix	f	2	23
213	5	Belgian Grand Prix	1972-06-04	213	http://en.wikipedia.org/wiki/1972_Belgian_Grand_Prix	f	36	23
214	6	French Grand Prix	1972-07-02	214	http://en.wikipedia.org/wiki/1972_French_Grand_Prix	f	26	23
215	7	British Grand Prix	1972-07-15	215	http://en.wikipedia.org/wiki/1972_British_Grand_Prix	f	24	23
216	8	German Grand Prix	1972-07-30	216	http://en.wikipedia.org/wiki/1972_German_Grand_Prix	f	8	23
217	9	Austrian Grand Prix	1972-08-13	217	http://en.wikipedia.org/wiki/1972_Austrian_Grand_Prix	f	34	23
218	10	Italian Grand Prix	1972-09-10	218	http://en.wikipedia.org/wiki/1972_Italian_Grand_Prix	f	7	23
219	11	Canadian Grand Prix	1972-09-24	219	http://en.wikipedia.org/wiki/1972_Canadian_Grand_Prix	f	29	23
220	12	United States Grand Prix	1972-10-08	220	http://en.wikipedia.org/wiki/1972_United_States_Grand_Prix	f	21	23
221	1	Argentine Grand Prix	1973-01-28	221	http://en.wikipedia.org/wiki/1973_Argentine_Grand_Prix	f	12	24
222	2	Brazilian Grand Prix	1973-02-11	222	http://en.wikipedia.org/wiki/1973_Brazilian_Grand_Prix	f	37	24
223	3	South African Grand Prix	1973-03-03	223	http://en.wikipedia.org/wiki/1973_South_African_Grand_Prix	f	27	24
224	4	Spanish Grand Prix	1973-04-29	224	http://en.wikipedia.org/wiki/1973_Spanish_Grand_Prix	f	32	24
225	5	Belgian Grand Prix	1973-05-20	225	http://en.wikipedia.org/wiki/1973_Belgian_Grand_Prix	f	38	24
226	6	Monaco Grand Prix	1973-06-03	226	http://en.wikipedia.org/wiki/1973_Monaco_Grand_Prix	f	2	24
227	7	Swedish Grand Prix	1973-06-17	227	http://en.wikipedia.org/wiki/1973_Swedish_Grand_Prix	f	39	24
228	8	French Grand Prix	1973-07-01	228	http://en.wikipedia.org/wiki/1973_French_Grand_Prix	f	35	24
229	9	British Grand Prix	1973-07-14	229	http://en.wikipedia.org/wiki/1973_British_Grand_Prix	f	1	24
230	10	Dutch Grand Prix	1973-07-29	230	http://en.wikipedia.org/wiki/1973_Dutch_Grand_Prix	f	11	24
231	11	German Grand Prix	1973-08-05	231	http://en.wikipedia.org/wiki/1973_German_Grand_Prix	f	8	24
232	12	Austrian Grand Prix	1973-08-19	232	http://en.wikipedia.org/wiki/1973_Austrian_Grand_Prix	f	34	24
233	13	Italian Grand Prix	1973-09-09	233	http://en.wikipedia.org/wiki/1973_Italian_Grand_Prix	f	7	24
234	14	Canadian Grand Prix	1973-09-23	234	http://en.wikipedia.org/wiki/1973_Canadian_Grand_Prix	f	29	24
235	15	United States Grand Prix	1973-10-07	235	http://en.wikipedia.org/wiki/1973_United_States_Grand_Prix	f	21	24
236	1	Argentine Grand Prix	1974-01-13	236	http://en.wikipedia.org/wiki/1974_Argentine_Grand_Prix	f	12	25
237	2	Brazilian Grand Prix	1974-01-27	237	http://en.wikipedia.org/wiki/1974_Brazilian_Grand_Prix	f	37	25
238	3	South African Grand Prix	1974-03-30	238	http://en.wikipedia.org/wiki/1974_South_African_Grand_Prix	f	27	25
239	4	Spanish Grand Prix	1974-04-28	239	http://en.wikipedia.org/wiki/1974_Spanish_Grand_Prix	f	30	25
240	5	Belgian Grand Prix	1974-05-12	240	http://en.wikipedia.org/wiki/1974_Belgian_Grand_Prix	f	36	25
241	6	Monaco Grand Prix	1974-05-26	241	http://en.wikipedia.org/wiki/1974_Monaco_Grand_Prix	f	2	25
242	7	Swedish Grand Prix	1974-06-09	242	http://en.wikipedia.org/wiki/1974_Swedish_Grand_Prix	f	39	25
243	8	Dutch Grand Prix	1974-06-23	243	http://en.wikipedia.org/wiki/1974_Dutch_Grand_Prix	f	11	25
244	9	French Grand Prix	1974-07-07	244	http://en.wikipedia.org/wiki/1974_French_Grand_Prix	f	40	25
245	10	British Grand Prix	1974-07-20	245	http://en.wikipedia.org/wiki/1974_British_Grand_Prix	f	24	25
246	11	German Grand Prix	1974-08-04	246	http://en.wikipedia.org/wiki/1974_German_Grand_Prix	f	8	25
247	12	Austrian Grand Prix	1974-08-18	247	http://en.wikipedia.org/wiki/1974_Austrian_Grand_Prix	f	34	25
248	13	Italian Grand Prix	1974-09-08	248	http://en.wikipedia.org/wiki/1974_Italian_Grand_Prix	f	7	25
249	14	Canadian Grand Prix	1974-09-22	249	http://en.wikipedia.org/wiki/1974_Canadian_Grand_Prix	f	29	25
250	15	United States Grand Prix	1974-10-06	250	http://en.wikipedia.org/wiki/1974_United_States_Grand_Prix	f	21	25
251	1	Argentine Grand Prix	1975-01-12	251	http://en.wikipedia.org/wiki/1975_Argentine_Grand_Prix	f	12	26
252	2	Brazilian Grand Prix	1975-01-26	252	http://en.wikipedia.org/wiki/1975_Brazilian_Grand_Prix	f	37	26
253	3	South African Grand Prix	1975-03-01	253	http://en.wikipedia.org/wiki/1975_South_African_Grand_Prix	f	27	26
254	4	Spanish Grand Prix	1975-04-27	254	http://en.wikipedia.org/wiki/1975_Spanish_Grand_Prix	f	32	26
255	5	Monaco Grand Prix	1975-05-11	255	http://en.wikipedia.org/wiki/1975_Monaco_Grand_Prix	f	2	26
256	6	Belgian Grand Prix	1975-05-25	256	http://en.wikipedia.org/wiki/1975_Belgian_Grand_Prix	f	38	26
257	7	Swedish Grand Prix	1975-06-08	257	http://en.wikipedia.org/wiki/1975_Swedish_Grand_Prix	f	39	26
258	8	Dutch Grand Prix	1975-06-22	258	http://en.wikipedia.org/wiki/1975_Dutch_Grand_Prix	f	11	26
259	9	French Grand Prix	1975-07-06	259	http://en.wikipedia.org/wiki/1975_French_Grand_Prix	f	35	26
260	10	British Grand Prix	1975-07-19	260	http://en.wikipedia.org/wiki/1975_British_Grand_Prix	f	1	26
261	11	German Grand Prix	1975-08-03	261	http://en.wikipedia.org/wiki/1975_German_Grand_Prix	f	8	26
262	12	Austrian Grand Prix	1975-08-17	262	http://en.wikipedia.org/wiki/1975_Austrian_Grand_Prix	f	34	26
263	13	Italian Grand Prix	1975-09-07	263	http://en.wikipedia.org/wiki/1975_Italian_Grand_Prix	f	7	26
264	14	United States Grand Prix	1975-10-05	264	http://en.wikipedia.org/wiki/1975_United_States_Grand_Prix	f	21	26
265	1	Brazilian Grand Prix	1976-01-25	265	http://en.wikipedia.org/wiki/1976_Brazilian_Grand_Prix	f	37	27
266	2	South African Grand Prix	1976-03-06	266	http://en.wikipedia.org/wiki/1976_South_African_Grand_Prix	f	27	27
267	3	United States Grand Prix West	1976-03-28	267	http://en.wikipedia.org/wiki/1976_United_States_Grand_Prix_West	f	41	27
268	4	Spanish Grand Prix	1976-05-02	268	http://en.wikipedia.org/wiki/1976_Spanish_Grand_Prix	f	30	27
269	5	Belgian Grand Prix	1976-05-16	269	http://en.wikipedia.org/wiki/1976_Belgian_Grand_Prix	f	38	27
270	6	Monaco Grand Prix	1976-05-30	270	http://en.wikipedia.org/wiki/1976_Monaco_Grand_Prix	f	2	27
271	7	Swedish Grand Prix	1976-06-13	271	http://en.wikipedia.org/wiki/1976_Swedish_Grand_Prix	f	39	27
272	8	French Grand Prix	1976-07-04	272	http://en.wikipedia.org/wiki/1976_French_Grand_Prix	f	35	27
273	9	British Grand Prix	1976-07-18	273	http://en.wikipedia.org/wiki/1976_British_Grand_Prix	f	24	27
274	10	German Grand Prix	1976-08-01	274	http://en.wikipedia.org/wiki/1976_German_Grand_Prix	f	8	27
275	11	Austrian Grand Prix	1976-08-15	275	http://en.wikipedia.org/wiki/1976_Austrian_Grand_Prix	f	34	27
276	12	Dutch Grand Prix	1976-08-29	276	http://en.wikipedia.org/wiki/1976_Dutch_Grand_Prix	f	11	27
277	13	Italian Grand Prix	1976-09-12	277	http://en.wikipedia.org/wiki/1976_Italian_Grand_Prix	f	7	27
278	14	Canadian Grand Prix	1976-10-03	278	http://en.wikipedia.org/wiki/1976_Canadian_Grand_Prix	f	29	27
279	15	United States Grand Prix	1976-10-10	279	http://en.wikipedia.org/wiki/1976_United_States_Grand_Prix	f	21	27
280	16	Japanese Grand Prix	1976-10-24	280	http://en.wikipedia.org/wiki/1976_Japanese_Grand_Prix	f	42	27
281	1	Argentine Grand Prix	1977-01-09	281	http://en.wikipedia.org/wiki/1977_Argentine_Grand_Prix	f	12	28
282	2	Brazilian Grand Prix	1977-01-23	282	http://en.wikipedia.org/wiki/1977_Brazilian_Grand_Prix	f	37	28
283	3	South African Grand Prix	1977-03-05	283	http://en.wikipedia.org/wiki/1977_South_African_Grand_Prix	f	27	28
284	4	United States Grand Prix West	1977-04-03	284	http://en.wikipedia.org/wiki/1977_United_States_Grand_Prix_West	f	41	28
285	5	Spanish Grand Prix	1977-05-08	285	http://en.wikipedia.org/wiki/1977_Spanish_Grand_Prix	f	30	28
286	6	Monaco Grand Prix	1977-05-22	286	http://en.wikipedia.org/wiki/1977_Monaco_Grand_Prix	f	2	28
287	7	Belgian Grand Prix	1977-06-05	287	http://en.wikipedia.org/wiki/1977_Belgian_Grand_Prix	f	38	28
288	8	Swedish Grand Prix	1977-06-19	288	http://en.wikipedia.org/wiki/1977_Swedish_Grand_Prix	f	39	28
289	9	French Grand Prix	1977-07-03	289	http://en.wikipedia.org/wiki/1977_French_Grand_Prix	f	40	28
290	10	British Grand Prix	1977-07-16	290	http://en.wikipedia.org/wiki/1977_British_Grand_Prix	f	1	28
291	11	German Grand Prix	1977-07-31	291	http://en.wikipedia.org/wiki/1977_German_Grand_Prix	f	33	28
292	12	Austrian Grand Prix	1977-08-14	292	http://en.wikipedia.org/wiki/1977_Austrian_Grand_Prix	f	34	28
293	13	Dutch Grand Prix	1977-08-28	293	http://en.wikipedia.org/wiki/1977_Dutch_Grand_Prix	f	11	28
294	14	Italian Grand Prix	1977-09-11	294	http://en.wikipedia.org/wiki/1977_Italian_Grand_Prix	f	7	28
295	15	United States Grand Prix	1977-10-02	295	http://en.wikipedia.org/wiki/1977_United_States_Grand_Prix	f	21	28
296	16	Canadian Grand Prix	1977-10-09	296	http://en.wikipedia.org/wiki/1977_Canadian_Grand_Prix	f	29	28
297	17	Japanese Grand Prix	1977-10-23	297	http://en.wikipedia.org/wiki/1977_Japanese_Grand_Prix	f	42	28
298	1	Argentine Grand Prix	1978-01-15	298	http://en.wikipedia.org/wiki/1978_Argentine_Grand_Prix	f	12	29
299	2	Brazilian Grand Prix	1978-01-29	299	http://en.wikipedia.org/wiki/1978_Brazilian_Grand_Prix	f	43	29
300	3	South African Grand Prix	1978-03-04	300	http://en.wikipedia.org/wiki/1978_South_African_Grand_Prix	f	27	29
301	4	United States Grand Prix West	1978-04-02	301	http://en.wikipedia.org/wiki/1978_United_States_Grand_Prix_West	f	41	29
302	5	Monaco Grand Prix	1978-05-07	302	http://en.wikipedia.org/wiki/1978_Monaco_Grand_Prix	f	2	29
303	6	Belgian Grand Prix	1978-05-21	303	http://en.wikipedia.org/wiki/1978_Belgian_Grand_Prix	f	38	29
304	7	Spanish Grand Prix	1978-06-04	304	http://en.wikipedia.org/wiki/1978_Spanish_Grand_Prix	f	30	29
305	8	Swedish Grand Prix	1978-06-17	305	http://en.wikipedia.org/wiki/1978_Swedish_Grand_Prix	f	39	29
306	9	French Grand Prix	1978-07-02	306	http://en.wikipedia.org/wiki/1978_French_Grand_Prix	f	35	29
307	10	British Grand Prix	1978-07-16	307	http://en.wikipedia.org/wiki/1978_British_Grand_Prix	f	24	29
308	11	German Grand Prix	1978-07-30	308	http://en.wikipedia.org/wiki/1978_German_Grand_Prix	f	33	29
309	12	Austrian Grand Prix	1978-08-13	309	http://en.wikipedia.org/wiki/1978_Austrian_Grand_Prix	f	34	29
310	13	Dutch Grand Prix	1978-08-27	310	http://en.wikipedia.org/wiki/1978_Dutch_Grand_Prix	f	11	29
311	14	Italian Grand Prix	1978-09-10	311	http://en.wikipedia.org/wiki/1978_Italian_Grand_Prix	f	7	29
312	15	United States Grand Prix	1978-10-01	312	http://en.wikipedia.org/wiki/1978_United_States_Grand_Prix	f	21	29
313	16	Canadian Grand Prix	1978-10-08	313	http://en.wikipedia.org/wiki/1978_Canadian_Grand_Prix	f	44	29
314	1	Argentine Grand Prix	1979-01-21	314	http://en.wikipedia.org/wiki/1979_Argentine_Grand_Prix	f	12	30
315	2	Brazilian Grand Prix	1979-02-04	315	http://en.wikipedia.org/wiki/1979_Brazilian_Grand_Prix	f	37	30
316	3	South African Grand Prix	1979-03-03	316	http://en.wikipedia.org/wiki/1979_South_African_Grand_Prix	f	27	30
317	4	United States Grand Prix West	1979-04-08	317	http://en.wikipedia.org/wiki/1979_United_States_Grand_Prix_West	f	41	30
318	5	Spanish Grand Prix	1979-04-29	318	http://en.wikipedia.org/wiki/1979_Spanish_Grand_Prix	f	30	30
319	6	Belgian Grand Prix	1979-05-13	319	http://en.wikipedia.org/wiki/1979_Belgian_Grand_Prix	f	38	30
320	7	Monaco Grand Prix	1979-05-27	320	http://en.wikipedia.org/wiki/1979_Monaco_Grand_Prix	f	2	30
321	8	French Grand Prix	1979-07-01	321	http://en.wikipedia.org/wiki/1979_French_Grand_Prix	f	40	30
322	9	British Grand Prix	1979-07-14	322	http://en.wikipedia.org/wiki/1979_British_Grand_Prix	f	1	30
323	10	German Grand Prix	1979-07-29	323	http://en.wikipedia.org/wiki/1979_German_Grand_Prix	f	33	30
324	11	Austrian Grand Prix	1979-08-12	324	http://en.wikipedia.org/wiki/1979_Austrian_Grand_Prix	f	34	30
325	12	Dutch Grand Prix	1979-08-26	325	http://en.wikipedia.org/wiki/1979_Dutch_Grand_Prix	f	11	30
326	13	Italian Grand Prix	1979-09-09	326	http://en.wikipedia.org/wiki/1979_Italian_Grand_Prix	f	7	30
327	14	Canadian Grand Prix	1979-09-30	327	http://en.wikipedia.org/wiki/1979_Canadian_Grand_Prix	f	44	30
328	15	United States Grand Prix	1979-10-07	328	http://en.wikipedia.org/wiki/1979_United_States_Grand_Prix	f	21	30
329	1	Argentine Grand Prix	1980-01-13	329	http://en.wikipedia.org/wiki/1980_Argentine_Grand_Prix	f	12	31
330	2	Brazilian Grand Prix	1980-01-27	330	http://en.wikipedia.org/wiki/1980_Brazilian_Grand_Prix	f	37	31
331	3	South African Grand Prix	1980-03-01	331	http://en.wikipedia.org/wiki/1980_South_African_Grand_Prix	f	27	31
332	4	United States Grand Prix West	1980-03-30	332	http://en.wikipedia.org/wiki/1980_United_States_Grand_Prix_West	f	41	31
333	5	Belgian Grand Prix	1980-05-04	333	http://en.wikipedia.org/wiki/1980_Belgian_Grand_Prix	f	38	31
334	6	Monaco Grand Prix	1980-05-18	334	http://en.wikipedia.org/wiki/1980_Monaco_Grand_Prix	f	2	31
335	7	French Grand Prix	1980-06-29	335	http://en.wikipedia.org/wiki/1980_French_Grand_Prix	f	35	31
336	8	British Grand Prix	1980-07-13	336	http://en.wikipedia.org/wiki/1980_British_Grand_Prix	f	24	31
337	9	German Grand Prix	1980-08-10	337	http://en.wikipedia.org/wiki/1980_German_Grand_Prix	f	33	31
338	10	Austrian Grand Prix	1980-08-17	338	http://en.wikipedia.org/wiki/1980_Austrian_Grand_Prix	f	34	31
339	11	Dutch Grand Prix	1980-08-31	339	http://en.wikipedia.org/wiki/1980_Dutch_Grand_Prix	f	11	31
340	12	Italian Grand Prix	1980-09-14	340	http://en.wikipedia.org/wiki/1980_Italian_Grand_Prix	f	45	31
341	13	Canadian Grand Prix	1980-09-28	341	http://en.wikipedia.org/wiki/1980_Canadian_Grand_Prix	f	44	31
342	14	United States Grand Prix	1980-10-05	342	http://en.wikipedia.org/wiki/1980_United_States_Grand_Prix	f	21	31
343	1	United States Grand Prix West	1981-03-15	343	http://en.wikipedia.org/wiki/1981_United_States_Grand_Prix_West	f	41	32
344	2	Brazilian Grand Prix	1981-03-29	344	http://en.wikipedia.org/wiki/1981_Brazilian_Grand_Prix	f	43	32
345	3	Argentine Grand Prix	1981-04-12	345	http://en.wikipedia.org/wiki/1981_Argentine_Grand_Prix	f	12	32
346	4	San Marino Grand Prix	1981-05-03	346	http://en.wikipedia.org/wiki/1981_San_Marino_Grand_Prix	f	45	32
347	5	Belgian Grand Prix	1981-05-17	347	http://en.wikipedia.org/wiki/1981_Belgian_Grand_Prix	f	38	32
348	6	Monaco Grand Prix	1981-05-31	348	http://en.wikipedia.org/wiki/1981_Monaco_Grand_Prix	f	2	32
349	7	Spanish Grand Prix	1981-06-21	349	http://en.wikipedia.org/wiki/1981_Spanish_Grand_Prix	f	30	32
350	8	French Grand Prix	1981-07-05	350	http://en.wikipedia.org/wiki/1981_French_Grand_Prix	f	40	32
351	9	British Grand Prix	1981-07-18	351	http://en.wikipedia.org/wiki/1981_British_Grand_Prix	f	1	32
352	10	German Grand Prix	1981-08-02	352	http://en.wikipedia.org/wiki/1981_German_Grand_Prix	f	33	32
353	11	Austrian Grand Prix	1981-08-16	353	http://en.wikipedia.org/wiki/1981_Austrian_Grand_Prix	f	34	32
354	12	Dutch Grand Prix	1981-08-30	354	http://en.wikipedia.org/wiki/1981_Dutch_Grand_Prix	f	11	32
355	13	Italian Grand Prix	1981-09-13	355	http://en.wikipedia.org/wiki/1981_Italian_Grand_Prix	f	7	32
356	14	Canadian Grand Prix	1981-09-27	356	http://en.wikipedia.org/wiki/1981_Canadian_Grand_Prix	f	44	32
357	15	Caesars Palace Grand Prix	1981-10-17	357	http://en.wikipedia.org/wiki/1981_Caesars_Palace_Grand_Prix	f	46	32
358	1	South African Grand Prix	1982-01-23	358	http://en.wikipedia.org/wiki/1982_South_African_Grand_Prix	f	27	33
359	2	Brazilian Grand Prix	1982-03-21	359	http://en.wikipedia.org/wiki/1982_Brazilian_Grand_Prix	f	43	33
360	3	United States Grand Prix West	1982-04-04	360	http://en.wikipedia.org/wiki/1982_United_States_Grand_Prix_West	f	41	33
361	4	San Marino Grand Prix	1982-04-25	361	http://en.wikipedia.org/wiki/1982_San_Marino_Grand_Prix	f	45	33
362	5	Belgian Grand Prix	1982-05-09	362	http://en.wikipedia.org/wiki/1982_Belgian_Grand_Prix	f	38	33
363	6	Monaco Grand Prix	1982-05-23	363	http://en.wikipedia.org/wiki/1982_Monaco_Grand_Prix	f	2	33
364	7	Detroit Grand Prix	1982-06-06	364	http://en.wikipedia.org/wiki/1982_Detroit_Grand_Prix	f	47	33
365	8	Canadian Grand Prix	1982-06-13	365	http://en.wikipedia.org/wiki/1982_Canadian_Grand_Prix	f	44	33
366	9	Dutch Grand Prix	1982-07-03	366	http://en.wikipedia.org/wiki/1982_Dutch_Grand_Prix	f	11	33
367	10	British Grand Prix	1982-07-18	367	http://en.wikipedia.org/wiki/1982_British_Grand_Prix	f	24	33
368	11	French Grand Prix	1982-07-25	368	http://en.wikipedia.org/wiki/1982_French_Grand_Prix	f	35	33
369	12	German Grand Prix	1982-08-08	369	http://en.wikipedia.org/wiki/1982_German_Grand_Prix	f	33	33
370	13	Austrian Grand Prix	1982-08-15	370	http://en.wikipedia.org/wiki/1982_Austrian_Grand_Prix	f	34	33
371	14	Swiss Grand Prix	1982-08-29	371	http://en.wikipedia.org/wiki/1982_Swiss_Grand_Prix	f	40	33
372	15	Italian Grand Prix	1982-09-12	372	http://en.wikipedia.org/wiki/1982_Italian_Grand_Prix	f	7	33
373	16	Caesars Palace Grand Prix	1982-09-25	373	http://en.wikipedia.org/wiki/1982_Caesars_Palace_Grand_Prix	f	46	33
374	1	Brazilian Grand Prix	1983-03-13	374	http://en.wikipedia.org/wiki/1983_Brazilian_Grand_Prix	f	43	34
375	2	United States Grand Prix West	1983-03-27	375	http://en.wikipedia.org/wiki/1983_United_States_Grand_Prix_West	f	41	34
376	3	French Grand Prix	1983-04-17	376	http://en.wikipedia.org/wiki/1983_French_Grand_Prix	f	35	34
377	4	San Marino Grand Prix	1983-05-01	377	http://en.wikipedia.org/wiki/1983_San_Marino_Grand_Prix	f	45	34
378	5	Monaco Grand Prix	1983-05-15	378	http://en.wikipedia.org/wiki/1983_Monaco_Grand_Prix	f	2	34
379	6	Belgian Grand Prix	1983-05-22	379	http://en.wikipedia.org/wiki/1983_Belgian_Grand_Prix	f	5	34
380	7	Detroit Grand Prix	1983-06-05	380	http://en.wikipedia.org/wiki/1983_Detroit_Grand_Prix	f	47	34
381	8	Canadian Grand Prix	1983-06-12	381	http://en.wikipedia.org/wiki/1983_Canadian_Grand_Prix	f	44	34
382	9	British Grand Prix	1983-07-16	382	http://en.wikipedia.org/wiki/1983_British_Grand_Prix	f	1	34
383	10	German Grand Prix	1983-08-07	383	http://en.wikipedia.org/wiki/1983_German_Grand_Prix	f	33	34
384	11	Austrian Grand Prix	1983-08-14	384	http://en.wikipedia.org/wiki/1983_Austrian_Grand_Prix	f	34	34
385	12	Dutch Grand Prix	1983-08-28	385	http://en.wikipedia.org/wiki/1983_Dutch_Grand_Prix	f	11	34
386	13	Italian Grand Prix	1983-09-11	386	http://en.wikipedia.org/wiki/1983_Italian_Grand_Prix	f	7	34
387	14	European Grand Prix	1983-09-25	387	http://en.wikipedia.org/wiki/1983_European_Grand_Prix	f	24	34
388	15	South African Grand Prix	1983-10-15	388	http://en.wikipedia.org/wiki/1983_South_African_Grand_Prix	f	27	34
389	1	Brazilian Grand Prix	1984-03-25	389	http://en.wikipedia.org/wiki/1984_Brazilian_Grand_Prix	f	43	35
390	2	South African Grand Prix	1984-04-07	390	http://en.wikipedia.org/wiki/1984_South_African_Grand_Prix	f	27	35
391	3	Belgian Grand Prix	1984-04-29	391	http://en.wikipedia.org/wiki/1984_Belgian_Grand_Prix	f	38	35
392	4	San Marino Grand Prix	1984-05-06	392	http://en.wikipedia.org/wiki/1984_San_Marino_Grand_Prix	f	45	35
393	5	French Grand Prix	1984-05-20	393	http://en.wikipedia.org/wiki/1984_French_Grand_Prix	f	40	35
394	6	Monaco Grand Prix	1984-06-03	394	http://en.wikipedia.org/wiki/1984_Monaco_Grand_Prix	f	2	35
395	7	Canadian Grand Prix	1984-06-17	395	http://en.wikipedia.org/wiki/1984_Canadian_Grand_Prix	f	44	35
396	8	Detroit Grand Prix	1984-06-24	396	http://en.wikipedia.org/wiki/1984_Detroit_Grand_Prix	f	47	35
397	9	Dallas Grand Prix	1984-07-08	397	http://en.wikipedia.org/wiki/1984_Dallas_Grand_Prix	f	48	35
398	10	British Grand Prix	1984-07-22	398	http://en.wikipedia.org/wiki/1984_British_Grand_Prix	f	24	35
399	11	German Grand Prix	1984-08-05	399	http://en.wikipedia.org/wiki/1984_German_Grand_Prix	f	33	35
400	12	Austrian Grand Prix	1984-08-19	400	http://en.wikipedia.org/wiki/1984_Austrian_Grand_Prix	f	34	35
401	13	Dutch Grand Prix	1984-08-26	401	http://en.wikipedia.org/wiki/1984_Dutch_Grand_Prix	f	11	35
402	14	Italian Grand Prix	1984-09-09	402	http://en.wikipedia.org/wiki/1984_Italian_Grand_Prix	f	7	35
403	15	European Grand Prix	1984-10-07	403	http://en.wikipedia.org/wiki/1984_European_Grand_Prix	f	8	35
404	16	Portuguese Grand Prix	1984-10-21	404	http://en.wikipedia.org/wiki/1984_Portuguese_Grand_Prix	f	49	35
405	1	Brazilian Grand Prix	1985-04-07	405	http://en.wikipedia.org/wiki/1985_Brazilian_Grand_Prix	f	43	36
406	2	Portuguese Grand Prix	1985-04-21	406	http://en.wikipedia.org/wiki/1985_Portuguese_Grand_Prix	f	49	36
407	3	San Marino Grand Prix	1985-05-05	407	http://en.wikipedia.org/wiki/1985_San_Marino_Grand_Prix	f	45	36
408	4	Monaco Grand Prix	1985-05-19	408	http://en.wikipedia.org/wiki/1985_Monaco_Grand_Prix	f	2	36
409	5	Canadian Grand Prix	1985-06-16	409	http://en.wikipedia.org/wiki/1985_Canadian_Grand_Prix	f	44	36
410	6	Detroit Grand Prix	1985-06-23	410	http://en.wikipedia.org/wiki/1985_Detroit_Grand_Prix	f	47	36
411	7	French Grand Prix	1985-07-07	411	http://en.wikipedia.org/wiki/1985_French_Grand_Prix	f	35	36
412	8	British Grand Prix	1985-07-21	412	http://en.wikipedia.org/wiki/1985_British_Grand_Prix	f	1	36
413	9	German Grand Prix	1985-08-04	413	http://en.wikipedia.org/wiki/1985_German_Grand_Prix	f	8	36
414	10	Austrian Grand Prix	1985-08-18	414	http://en.wikipedia.org/wiki/1985_Austrian_Grand_Prix	f	34	36
415	11	Dutch Grand Prix	1985-08-25	415	http://en.wikipedia.org/wiki/1985_Dutch_Grand_Prix	f	11	36
416	12	Italian Grand Prix	1985-09-08	416	http://en.wikipedia.org/wiki/1985_Italian_Grand_Prix	f	7	36
417	13	Belgian Grand Prix	1985-09-15	417	http://en.wikipedia.org/wiki/1985_Belgian_Grand_Prix	f	5	36
418	14	European Grand Prix	1985-10-06	418	http://en.wikipedia.org/wiki/1985_European_Grand_Prix	f	24	36
419	15	South African Grand Prix	1985-10-19	419	http://en.wikipedia.org/wiki/1985_South_African_Grand_Prix	f	27	36
420	16	Australian Grand Prix	1985-11-03	420	http://en.wikipedia.org/wiki/1985_Australian_Grand_Prix	f	50	36
421	1	Brazilian Grand Prix	1986-03-23	421	http://en.wikipedia.org/wiki/1986_Brazilian_Grand_Prix	f	43	37
422	2	Spanish Grand Prix	1986-04-13	422	http://en.wikipedia.org/wiki/1986_Spanish_Grand_Prix	f	51	37
423	3	San Marino Grand Prix	1986-04-27	423	http://en.wikipedia.org/wiki/1986_San_Marino_Grand_Prix	f	45	37
424	4	Monaco Grand Prix	1986-05-11	424	http://en.wikipedia.org/wiki/1986_Monaco_Grand_Prix	f	2	37
425	5	Belgian Grand Prix	1986-05-25	425	http://en.wikipedia.org/wiki/1986_Belgian_Grand_Prix	f	5	37
426	6	Canadian Grand Prix	1986-06-15	426	http://en.wikipedia.org/wiki/1986_Canadian_Grand_Prix	f	44	37
427	7	Detroit Grand Prix	1986-06-22	427	http://en.wikipedia.org/wiki/1986_Detroit_Grand_Prix	f	47	37
428	8	French Grand Prix	1986-07-06	428	http://en.wikipedia.org/wiki/1986_French_Grand_Prix	f	35	37
429	9	British Grand Prix	1986-07-13	429	http://en.wikipedia.org/wiki/1986_British_Grand_Prix	f	24	37
430	10	German Grand Prix	1986-07-27	430	http://en.wikipedia.org/wiki/1986_German_Grand_Prix	f	33	37
431	11	Hungarian Grand Prix	1986-08-10	431	http://en.wikipedia.org/wiki/1986_Hungarian_Grand_Prix	f	52	37
432	12	Austrian Grand Prix	1986-08-17	432	http://en.wikipedia.org/wiki/1986_Austrian_Grand_Prix	f	34	37
433	13	Italian Grand Prix	1986-09-07	433	http://en.wikipedia.org/wiki/1986_Italian_Grand_Prix	f	7	37
434	14	Portuguese Grand Prix	1986-09-21	434	http://en.wikipedia.org/wiki/1986_Portuguese_Grand_Prix	f	49	37
435	15	Mexican Grand Prix	1986-10-12	435	http://en.wikipedia.org/wiki/1986_Mexican_Grand_Prix	f	23	37
436	16	Australian Grand Prix	1986-10-26	436	http://en.wikipedia.org/wiki/1986_Australian_Grand_Prix	f	50	37
437	1	Brazilian Grand Prix	1987-04-12	437	http://en.wikipedia.org/wiki/1987_Brazilian_Grand_Prix	f	43	38
438	2	San Marino Grand Prix	1987-05-03	438	http://en.wikipedia.org/wiki/1987_San_Marino_Grand_Prix	f	45	38
439	3	Belgian Grand Prix	1987-05-17	439	http://en.wikipedia.org/wiki/1987_Belgian_Grand_Prix	f	5	38
440	4	Monaco Grand Prix	1987-05-31	440	http://en.wikipedia.org/wiki/1987_Monaco_Grand_Prix	f	2	38
441	5	Detroit Grand Prix	1987-06-21	441	http://en.wikipedia.org/wiki/1987_Detroit_Grand_Prix	f	47	38
442	6	French Grand Prix	1987-07-05	442	http://en.wikipedia.org/wiki/1987_French_Grand_Prix	f	35	38
443	7	British Grand Prix	1987-07-12	443	http://en.wikipedia.org/wiki/1987_British_Grand_Prix	f	1	38
444	8	German Grand Prix	1987-07-26	444	http://en.wikipedia.org/wiki/1987_German_Grand_Prix	f	33	38
445	9	Hungarian Grand Prix	1987-08-09	445	http://en.wikipedia.org/wiki/1987_Hungarian_Grand_Prix	f	52	38
446	10	Austrian Grand Prix	1987-08-16	446	http://en.wikipedia.org/wiki/1987_Austrian_Grand_Prix	f	34	38
447	11	Italian Grand Prix	1987-09-06	447	http://en.wikipedia.org/wiki/1987_Italian_Grand_Prix	f	7	38
448	12	Portuguese Grand Prix	1987-09-20	448	http://en.wikipedia.org/wiki/1987_Portuguese_Grand_Prix	f	49	38
449	13	Spanish Grand Prix	1987-09-27	449	http://en.wikipedia.org/wiki/1987_Spanish_Grand_Prix	f	51	38
450	14	Mexican Grand Prix	1987-10-18	450	http://en.wikipedia.org/wiki/1987_Mexican_Grand_Prix	f	23	38
451	15	Japanese Grand Prix	1987-11-01	451	http://en.wikipedia.org/wiki/1987_Japanese_Grand_Prix	f	53	38
452	16	Australian Grand Prix	1987-11-15	452	http://en.wikipedia.org/wiki/1987_Australian_Grand_Prix	f	50	38
453	1	Brazilian Grand Prix	1988-04-03	453	http://en.wikipedia.org/wiki/1988_Brazilian_Grand_Prix	f	43	39
454	2	San Marino Grand Prix	1988-05-01	454	http://en.wikipedia.org/wiki/1988_San_Marino_Grand_Prix	f	45	39
455	3	Monaco Grand Prix	1988-05-15	455	http://en.wikipedia.org/wiki/1988_Monaco_Grand_Prix	f	2	39
456	4	Mexican Grand Prix	1988-05-29	456	http://en.wikipedia.org/wiki/1988_Mexican_Grand_Prix	f	23	39
457	5	Canadian Grand Prix	1988-06-12	457	http://en.wikipedia.org/wiki/1988_Canadian_Grand_Prix	f	44	39
458	6	Detroit Grand Prix	1988-06-19	458	http://en.wikipedia.org/wiki/1988_Detroit_Grand_Prix	f	47	39
459	7	French Grand Prix	1988-07-03	459	http://en.wikipedia.org/wiki/1988_French_Grand_Prix	f	35	39
460	8	British Grand Prix	1988-07-10	460	http://en.wikipedia.org/wiki/1988_British_Grand_Prix	f	1	39
461	9	German Grand Prix	1988-07-24	461	http://en.wikipedia.org/wiki/1988_German_Grand_Prix	f	33	39
462	10	Hungarian Grand Prix	1988-08-07	462	http://en.wikipedia.org/wiki/1988_Hungarian_Grand_Prix	f	52	39
463	11	Belgian Grand Prix	1988-08-28	463	http://en.wikipedia.org/wiki/1988_Belgian_Grand_Prix	f	5	39
464	12	Italian Grand Prix	1988-09-11	464	http://en.wikipedia.org/wiki/1988_Italian_Grand_Prix	f	7	39
465	13	Portuguese Grand Prix	1988-09-25	465	http://en.wikipedia.org/wiki/1988_Portuguese_Grand_Prix	f	49	39
466	14	Spanish Grand Prix	1988-10-02	466	http://en.wikipedia.org/wiki/1988_Spanish_Grand_Prix	f	51	39
467	15	Japanese Grand Prix	1988-10-30	467	http://en.wikipedia.org/wiki/1988_Japanese_Grand_Prix	f	53	39
468	16	Australian Grand Prix	1988-11-13	468	http://en.wikipedia.org/wiki/1988_Australian_Grand_Prix	f	50	39
469	1	Brazilian Grand Prix	1989-03-26	469	http://en.wikipedia.org/wiki/1989_Brazilian_Grand_Prix	f	43	40
470	2	San Marino Grand Prix	1989-04-23	470	http://en.wikipedia.org/wiki/1989_San_Marino_Grand_Prix	f	45	40
471	3	Monaco Grand Prix	1989-05-07	471	http://en.wikipedia.org/wiki/1989_Monaco_Grand_Prix	f	2	40
472	4	Mexican Grand Prix	1989-05-28	472	http://en.wikipedia.org/wiki/1989_Mexican_Grand_Prix	f	23	40
473	5	United States Grand Prix	1989-06-04	473	http://en.wikipedia.org/wiki/1989_United_States_Grand_Prix	f	54	40
474	6	Canadian Grand Prix	1989-06-18	474	http://en.wikipedia.org/wiki/1989_Canadian_Grand_Prix	f	44	40
475	7	French Grand Prix	1989-07-09	475	http://en.wikipedia.org/wiki/1989_French_Grand_Prix	f	35	40
476	8	British Grand Prix	1989-07-16	476	http://en.wikipedia.org/wiki/1989_British_Grand_Prix	f	1	40
477	9	German Grand Prix	1989-07-30	477	http://en.wikipedia.org/wiki/1989_German_Grand_Prix	f	33	40
478	10	Hungarian Grand Prix	1989-08-13	478	http://en.wikipedia.org/wiki/1989_Hungarian_Grand_Prix	f	52	40
479	11	Belgian Grand Prix	1989-08-27	479	http://en.wikipedia.org/wiki/1989_Belgian_Grand_Prix	f	5	40
480	12	Italian Grand Prix	1989-09-10	480	http://en.wikipedia.org/wiki/1989_Italian_Grand_Prix	f	7	40
481	13	Portuguese Grand Prix	1989-09-24	481	http://en.wikipedia.org/wiki/1989_Portuguese_Grand_Prix	f	49	40
482	14	Spanish Grand Prix	1989-10-01	482	http://en.wikipedia.org/wiki/1989_Spanish_Grand_Prix	f	51	40
483	15	Japanese Grand Prix	1989-10-22	483	http://en.wikipedia.org/wiki/1989_Japanese_Grand_Prix	f	53	40
484	16	Australian Grand Prix	1989-11-05	484	http://en.wikipedia.org/wiki/1989_Australian_Grand_Prix	f	50	40
485	1	United States Grand Prix	1990-03-11	485	http://en.wikipedia.org/wiki/1990_United_States_Grand_Prix	f	54	41
486	2	Brazilian Grand Prix	1990-03-25	486	http://en.wikipedia.org/wiki/1990_Brazilian_Grand_Prix	f	37	41
487	3	San Marino Grand Prix	1990-05-13	487	http://en.wikipedia.org/wiki/1990_San_Marino_Grand_Prix	f	45	41
488	4	Monaco Grand Prix	1990-05-27	488	http://en.wikipedia.org/wiki/1990_Monaco_Grand_Prix	f	2	41
489	5	Canadian Grand Prix	1990-06-10	489	http://en.wikipedia.org/wiki/1990_Canadian_Grand_Prix	f	44	41
490	6	Mexican Grand Prix	1990-06-24	490	http://en.wikipedia.org/wiki/1990_Mexican_Grand_Prix	f	23	41
491	7	French Grand Prix	1990-07-08	491	http://en.wikipedia.org/wiki/1990_French_Grand_Prix	f	35	41
492	8	British Grand Prix	1990-07-15	492	http://en.wikipedia.org/wiki/1990_British_Grand_Prix	f	1	41
493	9	German Grand Prix	1990-07-29	493	http://en.wikipedia.org/wiki/1990_German_Grand_Prix	f	33	41
494	10	Hungarian Grand Prix	1990-08-12	494	http://en.wikipedia.org/wiki/1990_Hungarian_Grand_Prix	f	52	41
495	11	Belgian Grand Prix	1990-08-26	495	http://en.wikipedia.org/wiki/1990_Belgian_Grand_Prix	f	5	41
496	12	Italian Grand Prix	1990-09-09	496	http://en.wikipedia.org/wiki/1990_Italian_Grand_Prix	f	7	41
497	13	Portuguese Grand Prix	1990-09-23	497	http://en.wikipedia.org/wiki/1990_Portuguese_Grand_Prix	f	49	41
498	14	Spanish Grand Prix	1990-09-30	498	http://en.wikipedia.org/wiki/1990_Spanish_Grand_Prix	f	51	41
499	15	Japanese Grand Prix	1990-10-21	499	http://en.wikipedia.org/wiki/1990_Japanese_Grand_Prix	f	53	41
500	16	Australian Grand Prix	1990-11-04	500	http://en.wikipedia.org/wiki/1990_Australian_Grand_Prix	f	50	41
501	1	United States Grand Prix	1991-03-10	501	http://en.wikipedia.org/wiki/1991_United_States_Grand_Prix	f	54	42
502	2	Brazilian Grand Prix	1991-03-24	502	http://en.wikipedia.org/wiki/1991_Brazilian_Grand_Prix	f	37	42
503	3	San Marino Grand Prix	1991-04-28	503	http://en.wikipedia.org/wiki/1991_San_Marino_Grand_Prix	f	45	42
504	4	Monaco Grand Prix	1991-05-12	504	http://en.wikipedia.org/wiki/1991_Monaco_Grand_Prix	f	2	42
505	5	Canadian Grand Prix	1991-06-02	505	http://en.wikipedia.org/wiki/1991_Canadian_Grand_Prix	f	44	42
506	6	Mexican Grand Prix	1991-06-16	506	http://en.wikipedia.org/wiki/1991_Mexican_Grand_Prix	f	23	42
507	7	French Grand Prix	1991-07-07	507	http://en.wikipedia.org/wiki/1991_French_Grand_Prix	f	55	42
508	8	British Grand Prix	1991-07-14	508	http://en.wikipedia.org/wiki/1991_British_Grand_Prix	f	1	42
509	9	German Grand Prix	1991-07-28	509	http://en.wikipedia.org/wiki/1991_German_Grand_Prix	f	33	42
510	10	Hungarian Grand Prix	1991-08-11	510	http://en.wikipedia.org/wiki/1991_Hungarian_Grand_Prix	f	52	42
511	11	Belgian Grand Prix	1991-08-25	511	http://en.wikipedia.org/wiki/1991_Belgian_Grand_Prix	f	5	42
512	12	Italian Grand Prix	1991-09-08	512	http://en.wikipedia.org/wiki/1991_Italian_Grand_Prix	f	7	42
513	13	Portuguese Grand Prix	1991-09-22	513	http://en.wikipedia.org/wiki/1991_Portuguese_Grand_Prix	f	49	42
514	14	Spanish Grand Prix	1991-09-29	514	http://en.wikipedia.org/wiki/1991_Spanish_Grand_Prix	f	56	42
515	15	Japanese Grand Prix	1991-10-20	515	http://en.wikipedia.org/wiki/1991_Japanese_Grand_Prix	f	53	42
516	16	Australian Grand Prix	1991-11-03	516	http://en.wikipedia.org/wiki/1991_Australian_Grand_Prix	f	50	42
517	1	South African Grand Prix	1992-03-01	517	http://en.wikipedia.org/wiki/1992_South_African_Grand_Prix	f	27	43
518	2	Mexican Grand Prix	1992-03-22	518	http://en.wikipedia.org/wiki/1992_Mexican_Grand_Prix	f	23	43
519	3	Brazilian Grand Prix	1992-04-05	519	http://en.wikipedia.org/wiki/1992_Brazilian_Grand_Prix	f	37	43
520	4	Spanish Grand Prix	1992-05-03	520	http://en.wikipedia.org/wiki/1992_Spanish_Grand_Prix	f	56	43
521	5	San Marino Grand Prix	1992-05-17	521	http://en.wikipedia.org/wiki/1992_San_Marino_Grand_Prix	f	45	43
522	6	Monaco Grand Prix	1992-05-31	522	http://en.wikipedia.org/wiki/1992_Monaco_Grand_Prix	f	2	43
523	7	Canadian Grand Prix	1992-06-14	523	http://en.wikipedia.org/wiki/1992_Canadian_Grand_Prix	f	44	43
524	8	French Grand Prix	1992-07-05	524	http://en.wikipedia.org/wiki/1992_French_Grand_Prix	f	55	43
525	9	British Grand Prix	1992-07-12	525	http://en.wikipedia.org/wiki/1992_British_Grand_Prix	f	1	43
526	10	German Grand Prix	1992-07-26	526	http://en.wikipedia.org/wiki/1992_German_Grand_Prix	f	33	43
527	11	Hungarian Grand Prix	1992-08-16	527	http://en.wikipedia.org/wiki/1992_Hungarian_Grand_Prix	f	52	43
528	12	Belgian Grand Prix	1992-08-30	528	http://en.wikipedia.org/wiki/1992_Belgian_Grand_Prix	f	5	43
529	13	Italian Grand Prix	1992-09-13	529	http://en.wikipedia.org/wiki/1992_Italian_Grand_Prix	f	7	43
530	14	Portuguese Grand Prix	1992-09-27	530	http://en.wikipedia.org/wiki/1992_Portuguese_Grand_Prix	f	49	43
531	15	Japanese Grand Prix	1992-10-25	531	http://en.wikipedia.org/wiki/1992_Japanese_Grand_Prix	f	53	43
532	16	Australian Grand Prix	1992-11-08	532	http://en.wikipedia.org/wiki/1992_Australian_Grand_Prix	f	50	43
533	1	South African Grand Prix	1993-03-14	533	http://en.wikipedia.org/wiki/1993_South_African_Grand_Prix	f	27	44
534	2	Brazilian Grand Prix	1993-03-28	534	http://en.wikipedia.org/wiki/1993_Brazilian_Grand_Prix	f	37	44
535	3	European Grand Prix	1993-04-11	535	http://en.wikipedia.org/wiki/1993_European_Grand_Prix	f	57	44
536	4	San Marino Grand Prix	1993-04-25	536	http://en.wikipedia.org/wiki/1993_San_Marino_Grand_Prix	f	45	44
537	5	Spanish Grand Prix	1993-05-09	537	http://en.wikipedia.org/wiki/1993_Spanish_Grand_Prix	f	56	44
538	6	Monaco Grand Prix	1993-05-23	538	http://en.wikipedia.org/wiki/1993_Monaco_Grand_Prix	f	2	44
539	7	Canadian Grand Prix	1993-06-13	539	http://en.wikipedia.org/wiki/1993_Canadian_Grand_Prix	f	44	44
540	8	French Grand Prix	1993-07-04	540	http://en.wikipedia.org/wiki/1993_French_Grand_Prix	f	55	44
541	9	British Grand Prix	1993-07-11	541	http://en.wikipedia.org/wiki/1993_British_Grand_Prix	f	1	44
542	10	German Grand Prix	1993-07-25	542	http://en.wikipedia.org/wiki/1993_German_Grand_Prix	f	33	44
543	11	Hungarian Grand Prix	1993-08-15	543	http://en.wikipedia.org/wiki/1993_Hungarian_Grand_Prix	f	52	44
544	12	Belgian Grand Prix	1993-08-29	544	http://en.wikipedia.org/wiki/1993_Belgian_Grand_Prix	f	5	44
545	13	Italian Grand Prix	1993-09-12	545	http://en.wikipedia.org/wiki/1993_Italian_Grand_Prix	f	7	44
546	14	Portuguese Grand Prix	1993-09-26	546	http://en.wikipedia.org/wiki/1993_Portuguese_Grand_Prix	f	49	44
547	15	Japanese Grand Prix	1993-10-24	547	http://en.wikipedia.org/wiki/1993_Japanese_Grand_Prix	f	53	44
548	16	Australian Grand Prix	1993-11-07	548	http://en.wikipedia.org/wiki/1993_Australian_Grand_Prix	f	50	44
549	1	Brazilian Grand Prix	1994-03-27	549	http://en.wikipedia.org/wiki/1994_Brazilian_Grand_Prix	f	37	45
550	2	Pacific Grand Prix	1994-04-17	550	http://en.wikipedia.org/wiki/1994_Pacific_Grand_Prix	f	58	45
551	3	San Marino Grand Prix	1994-05-01	551	http://en.wikipedia.org/wiki/1994_San_Marino_Grand_Prix	f	45	45
552	4	Monaco Grand Prix	1994-05-15	552	http://en.wikipedia.org/wiki/1994_Monaco_Grand_Prix	f	2	45
553	5	Spanish Grand Prix	1994-05-29	553	http://en.wikipedia.org/wiki/1994_Spanish_Grand_Prix	f	56	45
554	6	Canadian Grand Prix	1994-06-12	554	http://en.wikipedia.org/wiki/1994_Canadian_Grand_Prix	f	44	45
555	7	French Grand Prix	1994-07-03	555	http://en.wikipedia.org/wiki/1994_French_Grand_Prix	f	55	45
556	8	British Grand Prix	1994-07-10	556	http://en.wikipedia.org/wiki/1994_British_Grand_Prix	f	1	45
557	9	German Grand Prix	1994-07-31	557	http://en.wikipedia.org/wiki/1994_German_Grand_Prix	f	33	45
558	10	Hungarian Grand Prix	1994-08-14	558	http://en.wikipedia.org/wiki/1994_Hungarian_Grand_Prix	f	52	45
559	11	Belgian Grand Prix	1994-08-28	559	http://en.wikipedia.org/wiki/1994_Belgian_Grand_Prix	f	5	45
560	12	Italian Grand Prix	1994-09-11	560	http://en.wikipedia.org/wiki/1994_Italian_Grand_Prix	f	7	45
561	13	Portuguese Grand Prix	1994-09-25	561	http://en.wikipedia.org/wiki/1994_Portuguese_Grand_Prix	f	49	45
562	14	European Grand Prix	1994-10-16	562	http://en.wikipedia.org/wiki/1994_European_Grand_Prix	f	51	45
563	15	Japanese Grand Prix	1994-11-06	563	http://en.wikipedia.org/wiki/1994_Japanese_Grand_Prix	f	53	45
564	16	Australian Grand Prix	1994-11-13	564	http://en.wikipedia.org/wiki/1994_Australian_Grand_Prix	f	50	45
565	1	Brazilian Grand Prix	1995-03-26	565	http://en.wikipedia.org/wiki/1995_Brazilian_Grand_Prix	f	37	46
566	2	Argentine Grand Prix	1995-04-09	566	http://en.wikipedia.org/wiki/1995_Argentine_Grand_Prix	f	12	46
567	3	San Marino Grand Prix	1995-04-30	567	http://en.wikipedia.org/wiki/1995_San_Marino_Grand_Prix	f	45	46
568	4	Spanish Grand Prix	1995-05-14	568	http://en.wikipedia.org/wiki/1995_Spanish_Grand_Prix	f	56	46
569	5	Monaco Grand Prix	1995-05-28	569	http://en.wikipedia.org/wiki/1995_Monaco_Grand_Prix	f	2	46
570	6	Canadian Grand Prix	1995-06-11	570	http://en.wikipedia.org/wiki/1995_Canadian_Grand_Prix	f	44	46
571	7	French Grand Prix	1995-07-02	571	http://en.wikipedia.org/wiki/1995_French_Grand_Prix	f	55	46
572	8	British Grand Prix	1995-07-16	572	http://en.wikipedia.org/wiki/1995_British_Grand_Prix	f	1	46
573	9	German Grand Prix	1995-07-30	573	http://en.wikipedia.org/wiki/1995_German_Grand_Prix	f	33	46
574	10	Hungarian Grand Prix	1995-08-13	574	http://en.wikipedia.org/wiki/1995_Hungarian_Grand_Prix	f	52	46
575	11	Belgian Grand Prix	1995-08-27	575	http://en.wikipedia.org/wiki/1995_Belgian_Grand_Prix	f	5	46
576	12	Italian Grand Prix	1995-09-10	576	http://en.wikipedia.org/wiki/1995_Italian_Grand_Prix	f	7	46
577	13	Portuguese Grand Prix	1995-09-24	577	http://en.wikipedia.org/wiki/1995_Portuguese_Grand_Prix	f	49	46
578	14	European Grand Prix	1995-10-01	578	http://en.wikipedia.org/wiki/1995_European_Grand_Prix	f	8	46
579	15	Pacific Grand Prix	1995-10-22	579	http://en.wikipedia.org/wiki/1995_Pacific_Grand_Prix	f	58	46
580	16	Japanese Grand Prix	1995-10-29	580	http://en.wikipedia.org/wiki/1995_Japanese_Grand_Prix	f	53	46
581	17	Australian Grand Prix	1995-11-12	581	http://en.wikipedia.org/wiki/1995_Australian_Grand_Prix	f	50	46
582	1	Australian Grand Prix	1996-03-10	582	http://en.wikipedia.org/wiki/1996_Australian_Grand_Prix	f	59	47
583	2	Brazilian Grand Prix	1996-03-31	583	http://en.wikipedia.org/wiki/1996_Brazilian_Grand_Prix	f	37	47
584	3	Argentine Grand Prix	1996-04-07	584	http://en.wikipedia.org/wiki/1996_Argentine_Grand_Prix	f	12	47
585	4	European Grand Prix	1996-04-28	585	http://en.wikipedia.org/wiki/1996_European_Grand_Prix	f	8	47
586	5	San Marino Grand Prix	1996-05-05	586	http://en.wikipedia.org/wiki/1996_San_Marino_Grand_Prix	f	45	47
587	6	Monaco Grand Prix	1996-05-19	587	http://en.wikipedia.org/wiki/1996_Monaco_Grand_Prix	f	2	47
588	7	Spanish Grand Prix	1996-06-02	588	http://en.wikipedia.org/wiki/1996_Spanish_Grand_Prix	f	56	47
589	8	Canadian Grand Prix	1996-06-16	589	http://en.wikipedia.org/wiki/1996_Canadian_Grand_Prix	f	44	47
590	9	French Grand Prix	1996-06-30	590	http://en.wikipedia.org/wiki/1996_French_Grand_Prix	f	55	47
591	10	British Grand Prix	1996-07-14	591	http://en.wikipedia.org/wiki/1996_British_Grand_Prix	f	1	47
592	11	German Grand Prix	1996-07-28	592	http://en.wikipedia.org/wiki/1996_German_Grand_Prix	f	33	47
593	12	Hungarian Grand Prix	1996-08-11	593	http://en.wikipedia.org/wiki/1996_Hungarian_Grand_Prix	f	52	47
594	13	Belgian Grand Prix	1996-08-25	594	http://en.wikipedia.org/wiki/1996_Belgian_Grand_Prix	f	5	47
595	14	Italian Grand Prix	1996-09-08	595	http://en.wikipedia.org/wiki/1996_Italian_Grand_Prix	f	7	47
596	15	Portuguese Grand Prix	1996-09-22	596	http://en.wikipedia.org/wiki/1996_Portuguese_Grand_Prix	f	49	47
597	16	Japanese Grand Prix	1996-10-13	597	http://en.wikipedia.org/wiki/1996_Japanese_Grand_Prix	f	53	47
598	1	Australian Grand Prix	1997-03-09	598	http://en.wikipedia.org/wiki/1997_Australian_Grand_Prix	f	59	48
599	2	Brazilian Grand Prix	1997-03-30	599	http://en.wikipedia.org/wiki/1997_Brazilian_Grand_Prix	f	37	48
600	3	Argentine Grand Prix	1997-04-13	600	http://en.wikipedia.org/wiki/1997_Argentine_Grand_Prix	f	12	48
601	4	San Marino Grand Prix	1997-04-27	601	http://en.wikipedia.org/wiki/1997_San_Marino_Grand_Prix	f	45	48
602	5	Monaco Grand Prix	1997-05-11	602	http://en.wikipedia.org/wiki/1997_Monaco_Grand_Prix	f	2	48
603	6	Spanish Grand Prix	1997-05-25	603	http://en.wikipedia.org/wiki/1997_Spanish_Grand_Prix	f	56	48
604	7	Canadian Grand Prix	1997-06-15	604	http://en.wikipedia.org/wiki/1997_Canadian_Grand_Prix	f	44	48
605	8	French Grand Prix	1997-06-29	605	http://en.wikipedia.org/wiki/1997_French_Grand_Prix	f	55	48
606	9	British Grand Prix	1997-07-13	606	http://en.wikipedia.org/wiki/1997_British_Grand_Prix	f	1	48
607	10	German Grand Prix	1997-07-27	607	http://en.wikipedia.org/wiki/1997_German_Grand_Prix	f	33	48
608	11	Hungarian Grand Prix	1997-08-10	608	http://en.wikipedia.org/wiki/1997_Hungarian_Grand_Prix	f	52	48
609	12	Belgian Grand Prix	1997-08-24	609	http://en.wikipedia.org/wiki/1997_Belgian_Grand_Prix	f	5	48
610	13	Italian Grand Prix	1997-09-07	610	http://en.wikipedia.org/wiki/1997_Italian_Grand_Prix	f	7	48
611	14	Austrian Grand Prix	1997-09-21	611	http://en.wikipedia.org/wiki/1997_Austrian_Grand_Prix	f	34	48
612	15	Luxembourg Grand Prix	1997-09-28	612	http://en.wikipedia.org/wiki/1997_Luxembourg_Grand_Prix	f	8	48
613	16	Japanese Grand Prix	1997-10-12	613	http://en.wikipedia.org/wiki/1997_Japanese_Grand_Prix	f	53	48
614	17	European Grand Prix	1997-10-26	614	http://en.wikipedia.org/wiki/1997_European_Grand_Prix	f	51	48
615	1	Australian Grand Prix	1998-03-08	615	http://en.wikipedia.org/wiki/1998_Australian_Grand_Prix	f	59	49
616	2	Brazilian Grand Prix	1998-03-29	616	http://en.wikipedia.org/wiki/1998_Brazilian_Grand_Prix	f	37	49
617	3	Argentine Grand Prix	1998-04-12	617	http://en.wikipedia.org/wiki/1998_Argentine_Grand_Prix	f	12	49
618	4	San Marino Grand Prix	1998-04-26	618	http://en.wikipedia.org/wiki/1998_San_Marino_Grand_Prix	f	45	49
619	5	Spanish Grand Prix	1998-05-10	619	http://en.wikipedia.org/wiki/1998_Spanish_Grand_Prix	f	56	49
620	6	Monaco Grand Prix	1998-05-24	620	http://en.wikipedia.org/wiki/1998_Monaco_Grand_Prix	f	2	49
621	7	Canadian Grand Prix	1998-06-07	621	http://en.wikipedia.org/wiki/1998_Canadian_Grand_Prix	f	44	49
622	8	French Grand Prix	1998-06-28	622	http://en.wikipedia.org/wiki/1998_French_Grand_Prix	f	55	49
623	9	British Grand Prix	1998-07-12	623	http://en.wikipedia.org/wiki/1998_British_Grand_Prix	f	1	49
624	10	Austrian Grand Prix	1998-07-26	624	http://en.wikipedia.org/wiki/1998_Austrian_Grand_Prix	f	34	49
625	11	German Grand Prix	1998-08-02	625	http://en.wikipedia.org/wiki/1998_German_Grand_Prix	f	33	49
626	12	Hungarian Grand Prix	1998-08-16	626	http://en.wikipedia.org/wiki/1998_Hungarian_Grand_Prix	f	52	49
627	13	Belgian Grand Prix	1998-08-30	627	http://en.wikipedia.org/wiki/1998_Belgian_Grand_Prix	f	5	49
628	14	Italian Grand Prix	1998-09-13	628	http://en.wikipedia.org/wiki/1998_Italian_Grand_Prix	f	7	49
629	15	Luxembourg Grand Prix	1998-09-27	629	http://en.wikipedia.org/wiki/1998_Luxembourg_Grand_Prix	f	8	49
630	16	Japanese Grand Prix	1998-11-01	630	http://en.wikipedia.org/wiki/1998_Japanese_Grand_Prix	f	53	49
631	1	Australian Grand Prix	1999-03-07	631	http://en.wikipedia.org/wiki/1999_Australian_Grand_Prix	f	59	50
632	2	Brazilian Grand Prix	1999-04-11	632	http://en.wikipedia.org/wiki/1999_Brazilian_Grand_Prix	f	37	50
633	3	San Marino Grand Prix	1999-05-02	633	http://en.wikipedia.org/wiki/1999_San_Marino_Grand_Prix	f	45	50
634	4	Monaco Grand Prix	1999-05-16	634	http://en.wikipedia.org/wiki/1999_Monaco_Grand_Prix	f	2	50
635	5	Spanish Grand Prix	1999-05-30	635	http://en.wikipedia.org/wiki/1999_Spanish_Grand_Prix	f	56	50
636	6	Canadian Grand Prix	1999-06-13	636	http://en.wikipedia.org/wiki/1999_Canadian_Grand_Prix	f	44	50
637	7	French Grand Prix	1999-06-27	637	http://en.wikipedia.org/wiki/1999_French_Grand_Prix	f	55	50
638	8	British Grand Prix	1999-07-11	638	http://en.wikipedia.org/wiki/1999_British_Grand_Prix	f	1	50
639	9	Austrian Grand Prix	1999-07-25	639	http://en.wikipedia.org/wiki/1999_Austrian_Grand_Prix	f	34	50
640	10	German Grand Prix	1999-08-01	640	http://en.wikipedia.org/wiki/1999_German_Grand_Prix	f	33	50
641	11	Hungarian Grand Prix	1999-08-15	641	http://en.wikipedia.org/wiki/1999_Hungarian_Grand_Prix	f	52	50
642	12	Belgian Grand Prix	1999-08-29	642	http://en.wikipedia.org/wiki/1999_Belgian_Grand_Prix	f	5	50
643	13	Italian Grand Prix	1999-09-12	643	http://en.wikipedia.org/wiki/1999_Italian_Grand_Prix	f	7	50
644	14	European Grand Prix	1999-09-26	644	http://en.wikipedia.org/wiki/1999_European_Grand_Prix	f	8	50
645	15	Malaysian Grand Prix	1999-10-17	645	http://en.wikipedia.org/wiki/1999_Malaysian_Grand_Prix	f	60	50
646	16	Japanese Grand Prix	1999-10-31	646	http://en.wikipedia.org/wiki/1999_Japanese_Grand_Prix	f	53	50
647	1	Australian Grand Prix	2000-03-12	647	http://en.wikipedia.org/wiki/2000_Australian_Grand_Prix	f	59	51
648	2	Brazilian Grand Prix	2000-03-26	648	http://en.wikipedia.org/wiki/2000_Brazilian_Grand_Prix	f	37	51
649	3	San Marino Grand Prix	2000-04-09	649	http://en.wikipedia.org/wiki/2000_San_Marino_Grand_Prix	f	45	51
650	4	British Grand Prix	2000-04-23	650	http://en.wikipedia.org/wiki/2000_British_Grand_Prix	f	1	51
651	5	Spanish Grand Prix	2000-05-07	651	http://en.wikipedia.org/wiki/2000_Spanish_Grand_Prix	f	56	51
652	6	European Grand Prix	2000-05-21	652	http://en.wikipedia.org/wiki/2000_European_Grand_Prix	f	8	51
653	7	Monaco Grand Prix	2000-06-04	653	http://en.wikipedia.org/wiki/2000_Monaco_Grand_Prix	f	2	51
654	8	Canadian Grand Prix	2000-06-18	654	http://en.wikipedia.org/wiki/2000_Canadian_Grand_Prix	f	44	51
655	9	French Grand Prix	2000-07-02	655	http://en.wikipedia.org/wiki/2000_French_Grand_Prix	f	55	51
656	10	Austrian Grand Prix	2000-07-16	656	http://en.wikipedia.org/wiki/2000_Austrian_Grand_Prix	f	34	51
657	11	German Grand Prix	2000-07-30	657	http://en.wikipedia.org/wiki/2000_German_Grand_Prix	f	33	51
658	12	Hungarian Grand Prix	2000-08-13	658	http://en.wikipedia.org/wiki/2000_Hungarian_Grand_Prix	f	52	51
659	13	Belgian Grand Prix	2000-08-27	659	http://en.wikipedia.org/wiki/2000_Belgian_Grand_Prix	f	5	51
660	14	Italian Grand Prix	2000-09-10	660	http://en.wikipedia.org/wiki/2000_Italian_Grand_Prix	f	7	51
661	15	United States Grand Prix	2000-09-24	661	http://en.wikipedia.org/wiki/2000_United_States_Grand_Prix	f	3	51
662	16	Japanese Grand Prix	2000-10-08	662	http://en.wikipedia.org/wiki/2000_Japanese_Grand_Prix	f	53	51
663	17	Malaysian Grand Prix	2000-10-22	663	http://en.wikipedia.org/wiki/2000_Malaysian_Grand_Prix	f	60	51
664	1	Australian Grand Prix	2001-03-04	664	http://en.wikipedia.org/wiki/2001_Australian_Grand_Prix	f	59	52
665	2	Malaysian Grand Prix	2001-03-18	665	http://en.wikipedia.org/wiki/2001_Malaysian_Grand_Prix	f	60	52
666	3	Brazilian Grand Prix	2001-04-01	666	http://en.wikipedia.org/wiki/2001_Brazilian_Grand_Prix	f	37	52
667	4	San Marino Grand Prix	2001-04-15	667	http://en.wikipedia.org/wiki/2001_San_Marino_Grand_Prix	f	45	52
668	5	Spanish Grand Prix	2001-04-29	668	http://en.wikipedia.org/wiki/2001_Spanish_Grand_Prix	f	56	52
669	6	Austrian Grand Prix	2001-05-13	669	http://en.wikipedia.org/wiki/2001_Austrian_Grand_Prix	f	34	52
670	7	Monaco Grand Prix	2001-05-27	670	http://en.wikipedia.org/wiki/2001_Monaco_Grand_Prix	f	2	52
671	8	Canadian Grand Prix	2001-06-10	671	http://en.wikipedia.org/wiki/2001_Canadian_Grand_Prix	f	44	52
672	9	European Grand Prix	2001-06-24	672	http://en.wikipedia.org/wiki/2001_European_Grand_Prix	f	8	52
673	10	French Grand Prix	2001-07-01	673	http://en.wikipedia.org/wiki/2001_French_Grand_Prix	f	55	52
674	11	British Grand Prix	2001-07-15	674	http://en.wikipedia.org/wiki/2001_British_Grand_Prix	f	1	52
675	12	German Grand Prix	2001-07-29	675	http://en.wikipedia.org/wiki/2001_German_Grand_Prix	f	33	52
676	13	Hungarian Grand Prix	2001-08-19	676	http://en.wikipedia.org/wiki/2001_Hungarian_Grand_Prix	f	52	52
677	14	Belgian Grand Prix	2001-09-02	677	http://en.wikipedia.org/wiki/2001_Belgian_Grand_Prix	f	5	52
678	15	Italian Grand Prix	2001-09-16	678	http://en.wikipedia.org/wiki/2001_Italian_Grand_Prix	f	7	52
679	16	United States Grand Prix	2001-09-30	679	http://en.wikipedia.org/wiki/2001_United_States_Grand_Prix	f	3	52
680	17	Japanese Grand Prix	2001-10-14	680	http://en.wikipedia.org/wiki/2001_Japanese_Grand_Prix	f	53	52
681	1	Australian Grand Prix	2002-03-03	681	http://en.wikipedia.org/wiki/2002_Australian_Grand_Prix	f	59	53
682	2	Malaysian Grand Prix	2002-03-17	682	http://en.wikipedia.org/wiki/2002_Malaysian_Grand_Prix	f	60	53
683	3	Brazilian Grand Prix	2002-03-31	683	http://en.wikipedia.org/wiki/2002_Brazilian_Grand_Prix	f	37	53
684	4	San Marino Grand Prix	2002-04-14	684	http://en.wikipedia.org/wiki/2002_San_Marino_Grand_Prix	f	45	53
685	5	Spanish Grand Prix	2002-04-28	685	http://en.wikipedia.org/wiki/2002_Spanish_Grand_Prix	f	56	53
686	6	Austrian Grand Prix	2002-05-12	686	http://en.wikipedia.org/wiki/2002_Austrian_Grand_Prix	f	34	53
687	7	Monaco Grand Prix	2002-05-26	687	http://en.wikipedia.org/wiki/2002_Monaco_Grand_Prix	f	2	53
688	8	Canadian Grand Prix	2002-06-09	688	http://en.wikipedia.org/wiki/2002_Canadian_Grand_Prix	f	44	53
689	9	European Grand Prix	2002-06-23	689	http://en.wikipedia.org/wiki/2002_European_Grand_Prix	f	8	53
690	10	British Grand Prix	2002-07-07	690	http://en.wikipedia.org/wiki/2002_British_Grand_Prix	f	1	53
691	11	French Grand Prix	2002-07-21	691	http://en.wikipedia.org/wiki/2002_French_Grand_Prix	f	55	53
692	12	German Grand Prix	2002-07-28	692	http://en.wikipedia.org/wiki/2002_German_Grand_Prix	f	33	53
693	13	Hungarian Grand Prix	2002-08-18	693	http://en.wikipedia.org/wiki/2002_Hungarian_Grand_Prix	f	52	53
694	14	Belgian Grand Prix	2002-09-01	694	http://en.wikipedia.org/wiki/2002_Belgian_Grand_Prix	f	5	53
695	15	Italian Grand Prix	2002-09-15	695	http://en.wikipedia.org/wiki/2002_Italian_Grand_Prix	f	7	53
696	16	United States Grand Prix	2002-09-29	696	http://en.wikipedia.org/wiki/2002_United_States_Grand_Prix	f	3	53
697	17	Japanese Grand Prix	2002-10-13	697	http://en.wikipedia.org/wiki/2002_Japanese_Grand_Prix	f	53	53
698	1	Australian Grand Prix	2003-03-09	698	http://en.wikipedia.org/wiki/2003_Australian_Grand_Prix	f	59	54
699	2	Malaysian Grand Prix	2003-03-23	699	http://en.wikipedia.org/wiki/2003_Malaysian_Grand_Prix	f	60	54
700	3	Brazilian Grand Prix	2003-04-06	700	http://en.wikipedia.org/wiki/2003_Brazilian_Grand_Prix	f	37	54
701	4	San Marino Grand Prix	2003-04-20	701	http://en.wikipedia.org/wiki/2003_San_Marino_Grand_Prix	f	45	54
702	5	Spanish Grand Prix	2003-05-04	702	http://en.wikipedia.org/wiki/2003_Spanish_Grand_Prix	f	56	54
703	6	Austrian Grand Prix	2003-05-18	703	http://en.wikipedia.org/wiki/2003_Austrian_Grand_Prix	f	34	54
704	7	Monaco Grand Prix	2003-06-01	704	http://en.wikipedia.org/wiki/2003_Monaco_Grand_Prix	f	2	54
705	8	Canadian Grand Prix	2003-06-15	705	http://en.wikipedia.org/wiki/2003_Canadian_Grand_Prix	f	44	54
706	9	European Grand Prix	2003-06-29	706	http://en.wikipedia.org/wiki/2003_European_Grand_Prix	f	8	54
707	10	French Grand Prix	2003-07-06	707	http://en.wikipedia.org/wiki/2003_French_Grand_Prix	f	55	54
708	11	British Grand Prix	2003-07-20	708	http://en.wikipedia.org/wiki/2003_British_Grand_Prix	f	1	54
709	12	German Grand Prix	2003-08-03	709	http://en.wikipedia.org/wiki/2003_German_Grand_Prix	f	33	54
710	13	Hungarian Grand Prix	2003-08-24	710	http://en.wikipedia.org/wiki/2003_Hungarian_Grand_Prix	f	52	54
711	14	Italian Grand Prix	2003-09-14	711	http://en.wikipedia.org/wiki/2003_Italian_Grand_Prix	f	7	54
712	15	United States Grand Prix	2003-09-28	712	http://en.wikipedia.org/wiki/2003_United_States_Grand_Prix	f	3	54
713	16	Japanese Grand Prix	2003-10-12	713	http://en.wikipedia.org/wiki/2003_Japanese_Grand_Prix	f	53	54
714	1	Australian Grand Prix	2004-03-07	714	http://en.wikipedia.org/wiki/2004_Australian_Grand_Prix	f	59	55
715	2	Malaysian Grand Prix	2004-03-21	715	http://en.wikipedia.org/wiki/2004_Malaysian_Grand_Prix	f	60	55
716	3	Bahrain Grand Prix	2004-04-04	716	http://en.wikipedia.org/wiki/2004_Bahrain_Grand_Prix	f	61	55
717	4	San Marino Grand Prix	2004-04-25	717	http://en.wikipedia.org/wiki/2004_San_Marino_Grand_Prix	f	45	55
718	5	Spanish Grand Prix	2004-05-09	718	http://en.wikipedia.org/wiki/2004_Spanish_Grand_Prix	f	56	55
719	6	Monaco Grand Prix	2004-05-23	719	http://en.wikipedia.org/wiki/2004_Monaco_Grand_Prix	f	2	55
720	7	European Grand Prix	2004-05-30	720	http://en.wikipedia.org/wiki/2004_European_Grand_Prix	f	8	55
721	8	Canadian Grand Prix	2004-06-13	721	http://en.wikipedia.org/wiki/2004_Canadian_Grand_Prix	f	44	55
722	9	United States Grand Prix	2004-06-20	722	http://en.wikipedia.org/wiki/2004_United_States_Grand_Prix	f	3	55
723	10	French Grand Prix	2004-07-04	723	http://en.wikipedia.org/wiki/2004_French_Grand_Prix	f	55	55
724	11	British Grand Prix	2004-07-11	724	http://en.wikipedia.org/wiki/2004_British_Grand_Prix	f	1	55
725	12	German Grand Prix	2004-07-25	725	http://en.wikipedia.org/wiki/2004_German_Grand_Prix	f	33	55
726	13	Hungarian Grand Prix	2004-08-15	726	http://en.wikipedia.org/wiki/2004_Hungarian_Grand_Prix	f	52	55
727	14	Belgian Grand Prix	2004-08-29	727	http://en.wikipedia.org/wiki/2004_Belgian_Grand_Prix	f	5	55
728	15	Italian Grand Prix	2004-09-12	728	http://en.wikipedia.org/wiki/2004_Italian_Grand_Prix	f	7	55
729	16	Chinese Grand Prix	2004-09-26	729	http://en.wikipedia.org/wiki/2004_Chinese_Grand_Prix	f	62	55
730	17	Japanese Grand Prix	2004-10-10	730	http://en.wikipedia.org/wiki/2004_Japanese_Grand_Prix	f	53	55
731	18	Brazilian Grand Prix	2004-10-24	731	http://en.wikipedia.org/wiki/2004_Brazilian_Grand_Prix	f	37	55
732	1	Australian Grand Prix	2005-03-06	732	http://en.wikipedia.org/wiki/2005_Australian_Grand_Prix	f	59	56
733	2	Malaysian Grand Prix	2005-03-20	733	http://en.wikipedia.org/wiki/2005_Malaysian_Grand_Prix	f	60	56
734	3	Bahrain Grand Prix	2005-04-03	734	http://en.wikipedia.org/wiki/2005_Bahrain_Grand_Prix	f	61	56
735	4	San Marino Grand Prix	2005-04-24	735	http://en.wikipedia.org/wiki/2005_San_Marino_Grand_Prix	f	45	56
736	5	Spanish Grand Prix	2005-05-08	736	http://en.wikipedia.org/wiki/2005_Spanish_Grand_Prix	f	56	56
737	6	Monaco Grand Prix	2005-05-22	737	http://en.wikipedia.org/wiki/2005_Monaco_Grand_Prix	f	2	56
738	7	European Grand Prix	2005-05-29	738	http://en.wikipedia.org/wiki/2005_European_Grand_Prix	f	8	56
739	8	Canadian Grand Prix	2005-06-12	739	http://en.wikipedia.org/wiki/2005_Canadian_Grand_Prix	f	44	56
740	9	United States Grand Prix	2005-06-19	740	http://en.wikipedia.org/wiki/2005_United_States_Grand_Prix	f	3	56
741	10	French Grand Prix	2005-07-03	741	http://en.wikipedia.org/wiki/2005_French_Grand_Prix	f	55	56
742	11	British Grand Prix	2005-07-10	742	http://en.wikipedia.org/wiki/2005_British_Grand_Prix	f	1	56
743	12	German Grand Prix	2005-07-24	743	http://en.wikipedia.org/wiki/2005_German_Grand_Prix	f	33	56
744	13	Hungarian Grand Prix	2005-07-31	744	http://en.wikipedia.org/wiki/2005_Hungarian_Grand_Prix	f	52	56
745	14	Turkish Grand Prix	2005-08-21	745	http://en.wikipedia.org/wiki/2005_Turkish_Grand_Prix	f	63	56
746	15	Italian Grand Prix	2005-09-04	746	http://en.wikipedia.org/wiki/2005_Italian_Grand_Prix	f	7	56
747	16	Belgian Grand Prix	2005-09-11	747	http://en.wikipedia.org/wiki/2005_Belgian_Grand_Prix	f	5	56
748	17	Brazilian Grand Prix	2005-09-25	748	http://en.wikipedia.org/wiki/2005_Brazilian_Grand_Prix	f	37	56
749	18	Japanese Grand Prix	2005-10-09	749	http://en.wikipedia.org/wiki/2005_Japanese_Grand_Prix	f	53	56
750	19	Chinese Grand Prix	2005-10-16	750	http://en.wikipedia.org/wiki/2005_Chinese_Grand_Prix	f	62	56
751	1	Bahrain Grand Prix	2006-03-12	751	http://en.wikipedia.org/wiki/2006_Bahrain_Grand_Prix	f	61	57
752	2	Malaysian Grand Prix	2006-03-19	752	http://en.wikipedia.org/wiki/2006_Malaysian_Grand_Prix	f	60	57
753	3	Australian Grand Prix	2006-04-02	753	http://en.wikipedia.org/wiki/2006_Australian_Grand_Prix	f	59	57
754	4	San Marino Grand Prix	2006-04-23	754	http://en.wikipedia.org/wiki/2006_San_Marino_Grand_Prix	f	45	57
755	5	European Grand Prix	2006-05-07	755	http://en.wikipedia.org/wiki/2006_European_Grand_Prix	f	8	57
756	6	Spanish Grand Prix	2006-05-14	756	http://en.wikipedia.org/wiki/2006_Spanish_Grand_Prix	f	56	57
757	7	Monaco Grand Prix	2006-05-28	757	http://en.wikipedia.org/wiki/2006_Monaco_Grand_Prix	f	2	57
758	8	British Grand Prix	2006-06-11	758	http://en.wikipedia.org/wiki/2006_British_Grand_Prix	f	1	57
759	9	Canadian Grand Prix	2006-06-25	759	http://en.wikipedia.org/wiki/2006_Canadian_Grand_Prix	f	44	57
760	10	United States Grand Prix	2006-07-02	760	http://en.wikipedia.org/wiki/2006_United_States_Grand_Prix	f	3	57
761	11	French Grand Prix	2006-07-16	761	http://en.wikipedia.org/wiki/2006_French_Grand_Prix	f	55	57
762	12	German Grand Prix	2006-07-30	762	http://en.wikipedia.org/wiki/2006_German_Grand_Prix	f	33	57
763	13	Hungarian Grand Prix	2006-08-06	763	http://en.wikipedia.org/wiki/2006_Hungarian_Grand_Prix	f	52	57
764	14	Turkish Grand Prix	2006-08-27	764	http://en.wikipedia.org/wiki/2006_Turkish_Grand_Prix	f	63	57
765	15	Italian Grand Prix	2006-09-10	765	http://en.wikipedia.org/wiki/2006_Italian_Grand_Prix	f	7	57
766	16	Chinese Grand Prix	2006-10-01	766	http://en.wikipedia.org/wiki/2006_Chinese_Grand_Prix	f	62	57
767	17	Japanese Grand Prix	2006-10-08	767	http://en.wikipedia.org/wiki/2006_Japanese_Grand_Prix	f	53	57
768	18	Brazilian Grand Prix	2006-10-22	768	http://en.wikipedia.org/wiki/2006_Brazilian_Grand_Prix	f	37	57
769	1	Australian Grand Prix	2007-03-18	769	http://en.wikipedia.org/wiki/2007_Australian_Grand_Prix	f	59	58
770	2	Malaysian Grand Prix	2007-04-08	770	http://en.wikipedia.org/wiki/2007_Malaysian_Grand_Prix	f	60	58
771	3	Bahrain Grand Prix	2007-04-15	771	http://en.wikipedia.org/wiki/2007_Bahrain_Grand_Prix	f	61	58
772	4	Spanish Grand Prix	2007-05-13	772	http://en.wikipedia.org/wiki/2007_Spanish_Grand_Prix	f	56	58
773	5	Monaco Grand Prix	2007-05-27	773	http://en.wikipedia.org/wiki/2007_Monaco_Grand_Prix	f	2	58
774	6	Canadian Grand Prix	2007-06-10	774	http://en.wikipedia.org/wiki/2007_Canadian_Grand_Prix	f	44	58
775	7	United States Grand Prix	2007-06-17	775	http://en.wikipedia.org/wiki/2007_United_States_Grand_Prix	f	3	58
776	8	French Grand Prix	2007-07-01	776	http://en.wikipedia.org/wiki/2007_French_Grand_Prix	f	55	58
777	9	British Grand Prix	2007-07-08	777	http://en.wikipedia.org/wiki/2007_British_Grand_Prix	f	1	58
778	10	European Grand Prix	2007-07-22	778	http://en.wikipedia.org/wiki/2007_European_Grand_Prix	f	8	58
779	11	Hungarian Grand Prix	2007-08-05	779	http://en.wikipedia.org/wiki/2007_Hungarian_Grand_Prix	f	52	58
780	12	Turkish Grand Prix	2007-08-26	780	http://en.wikipedia.org/wiki/2007_Turkish_Grand_Prix	f	63	58
781	13	Italian Grand Prix	2007-09-09	781	http://en.wikipedia.org/wiki/2007_Italian_Grand_Prix	f	7	58
782	14	Belgian Grand Prix	2007-09-16	782	http://en.wikipedia.org/wiki/2007_Belgian_Grand_Prix	f	5	58
783	15	Japanese Grand Prix	2007-09-30	783	http://en.wikipedia.org/wiki/2007_Japanese_Grand_Prix	f	42	58
784	16	Chinese Grand Prix	2007-10-07	784	http://en.wikipedia.org/wiki/2007_Chinese_Grand_Prix	f	62	58
785	17	Brazilian Grand Prix	2007-10-21	785	http://en.wikipedia.org/wiki/2007_Brazilian_Grand_Prix	f	37	58
786	1	Australian Grand Prix	2008-03-16	786	http://en.wikipedia.org/wiki/2008_Australian_Grand_Prix	f	59	59
787	2	Malaysian Grand Prix	2008-03-23	787	http://en.wikipedia.org/wiki/2008_Malaysian_Grand_Prix	f	60	59
788	3	Bahrain Grand Prix	2008-04-06	788	http://en.wikipedia.org/wiki/2008_Bahrain_Grand_Prix	f	61	59
789	4	Spanish Grand Prix	2008-04-27	789	http://en.wikipedia.org/wiki/2008_Spanish_Grand_Prix	f	56	59
790	5	Turkish Grand Prix	2008-05-11	790	http://en.wikipedia.org/wiki/2008_Turkish_Grand_Prix	f	63	59
791	6	Monaco Grand Prix	2008-05-25	791	http://en.wikipedia.org/wiki/2008_Monaco_Grand_Prix	f	2	59
792	7	Canadian Grand Prix	2008-06-08	792	http://en.wikipedia.org/wiki/2008_Canadian_Grand_Prix	f	44	59
793	8	French Grand Prix	2008-06-22	793	http://en.wikipedia.org/wiki/2008_French_Grand_Prix	f	55	59
794	9	British Grand Prix	2008-07-06	794	http://en.wikipedia.org/wiki/2008_British_Grand_Prix	f	1	59
795	10	German Grand Prix	2008-07-20	795	http://en.wikipedia.org/wiki/2008_German_Grand_Prix	f	33	59
796	11	Hungarian Grand Prix	2008-08-03	796	http://en.wikipedia.org/wiki/2008_Hungarian_Grand_Prix	f	52	59
797	12	European Grand Prix	2008-08-24	797	http://en.wikipedia.org/wiki/2008_European_Grand_Prix	f	64	59
798	13	Belgian Grand Prix	2008-09-07	798	http://en.wikipedia.org/wiki/2008_Belgian_Grand_Prix	f	5	59
799	14	Italian Grand Prix	2008-09-14	799	http://en.wikipedia.org/wiki/2008_Italian_Grand_Prix	f	7	59
800	15	Singapore Grand Prix	2008-09-28	800	http://en.wikipedia.org/wiki/2008_Singapore_Grand_Prix	f	65	59
801	16	Japanese Grand Prix	2008-10-12	801	http://en.wikipedia.org/wiki/2008_Japanese_Grand_Prix	f	42	59
802	17	Chinese Grand Prix	2008-10-19	802	http://en.wikipedia.org/wiki/2008_Chinese_Grand_Prix	f	62	59
803	18	Brazilian Grand Prix	2008-11-02	803	http://en.wikipedia.org/wiki/2008_Brazilian_Grand_Prix	f	37	59
804	1	Australian Grand Prix	2009-03-29	804	http://en.wikipedia.org/wiki/2009_Australian_Grand_Prix	f	59	60
805	2	Malaysian Grand Prix	2009-04-05	805	http://en.wikipedia.org/wiki/2009_Malaysian_Grand_Prix	f	60	60
806	3	Chinese Grand Prix	2009-04-19	806	http://en.wikipedia.org/wiki/2009_Chinese_Grand_Prix	f	62	60
807	4	Bahrain Grand Prix	2009-04-26	807	http://en.wikipedia.org/wiki/2009_Bahrain_Grand_Prix	f	61	60
808	5	Spanish Grand Prix	2009-05-10	808	http://en.wikipedia.org/wiki/2009_Spanish_Grand_Prix	f	56	60
809	6	Monaco Grand Prix	2009-05-24	809	http://en.wikipedia.org/wiki/2009_Monaco_Grand_Prix	f	2	60
810	7	Turkish Grand Prix	2009-06-07	810	http://en.wikipedia.org/wiki/2009_Turkish_Grand_Prix	f	63	60
811	8	British Grand Prix	2009-06-21	811	http://en.wikipedia.org/wiki/2009_British_Grand_Prix	f	1	60
812	9	German Grand Prix	2009-07-12	812	http://en.wikipedia.org/wiki/2009_German_Grand_Prix	f	8	60
813	10	Hungarian Grand Prix	2009-07-26	813	http://en.wikipedia.org/wiki/2009_Hungarian_Grand_Prix	f	52	60
814	11	European Grand Prix	2009-08-23	814	http://en.wikipedia.org/wiki/2009_European_Grand_Prix	f	64	60
815	12	Belgian Grand Prix	2009-08-30	815	http://en.wikipedia.org/wiki/2009_Belgian_Grand_Prix	f	5	60
816	13	Italian Grand Prix	2009-09-13	816	http://en.wikipedia.org/wiki/2009_Italian_Grand_Prix	f	7	60
817	14	Singapore Grand Prix	2009-09-27	817	http://en.wikipedia.org/wiki/2009_Singapore_Grand_Prix	f	65	60
818	15	Japanese Grand Prix	2009-10-04	818	http://en.wikipedia.org/wiki/2009_Japanese_Grand_Prix	f	53	60
819	16	Brazilian Grand Prix	2009-10-18	819	http://en.wikipedia.org/wiki/2009_Brazilian_Grand_Prix	f	37	60
820	17	Abu Dhabi Grand Prix	2009-11-01	820	http://en.wikipedia.org/wiki/2009_Abu_Dhabi_Grand_Prix	f	66	60
821	1	Bahrain Grand Prix	2010-03-14	821	http://en.wikipedia.org/wiki/2010_Bahrain_Grand_Prix	f	61	61
822	2	Australian Grand Prix	2010-03-28	822	http://en.wikipedia.org/wiki/2010_Australian_Grand_Prix	f	59	61
823	3	Malaysian Grand Prix	2010-04-04	823	http://en.wikipedia.org/wiki/2010_Malaysian_Grand_Prix	f	60	61
824	4	Chinese Grand Prix	2010-04-18	824	http://en.wikipedia.org/wiki/2010_Chinese_Grand_Prix	f	62	61
825	5	Spanish Grand Prix	2010-05-09	825	http://en.wikipedia.org/wiki/2010_Spanish_Grand_Prix	f	56	61
826	6	Monaco Grand Prix	2010-05-16	826	http://en.wikipedia.org/wiki/2010_Monaco_Grand_Prix	f	2	61
827	7	Turkish Grand Prix	2010-05-30	827	http://en.wikipedia.org/wiki/2010_Turkish_Grand_Prix	f	63	61
828	8	Canadian Grand Prix	2010-06-13	828	http://en.wikipedia.org/wiki/2010_Canadian_Grand_Prix	f	44	61
829	9	European Grand Prix	2010-06-27	829	http://en.wikipedia.org/wiki/2010_European_Grand_Prix	f	64	61
830	10	British Grand Prix	2010-07-11	830	http://en.wikipedia.org/wiki/2010_British_Grand_Prix	f	1	61
831	11	German Grand Prix	2010-07-25	831	http://en.wikipedia.org/wiki/2010_German_Grand_Prix	f	33	61
832	12	Hungarian Grand Prix	2010-08-01	832	http://en.wikipedia.org/wiki/2010_Hungarian_Grand_Prix	f	52	61
833	13	Belgian Grand Prix	2010-08-29	833	http://en.wikipedia.org/wiki/2010_Belgian_Grand_Prix	f	5	61
834	14	Italian Grand Prix	2010-09-12	834	http://en.wikipedia.org/wiki/2010_Italian_Grand_Prix	f	7	61
835	15	Singapore Grand Prix	2010-09-26	835	http://en.wikipedia.org/wiki/2010_Singapore_Grand_Prix	f	65	61
836	16	Japanese Grand Prix	2010-10-10	836	http://en.wikipedia.org/wiki/2010_Japanese_Grand_Prix	f	53	61
837	17	Korean Grand Prix	2010-10-24	837	http://en.wikipedia.org/wiki/2010_Korean_Grand_Prix	f	67	61
838	18	Brazilian Grand Prix	2010-11-07	838	http://en.wikipedia.org/wiki/2010_Brazilian_Grand_Prix	f	37	61
839	19	Abu Dhabi Grand Prix	2010-11-14	839	http://en.wikipedia.org/wiki/2010_Abu_Dhabi_Grand_Prix	f	66	61
840	1	Australian Grand Prix	2011-03-27	840	http://en.wikipedia.org/wiki/2011_Australian_Grand_Prix	f	59	62
841	2	Malaysian Grand Prix	2011-04-10	841	http://en.wikipedia.org/wiki/2011_Malaysian_Grand_Prix	f	60	62
842	3	Chinese Grand Prix	2011-04-17	842	http://en.wikipedia.org/wiki/2011_Chinese_Grand_Prix	f	62	62
843	4	Turkish Grand Prix	2011-05-08	843	http://en.wikipedia.org/wiki/2011_Turkish_Grand_Prix	f	63	62
844	5	Spanish Grand Prix	2011-05-22	844	http://en.wikipedia.org/wiki/2011_Spanish_Grand_Prix	f	56	62
845	6	Monaco Grand Prix	2011-05-29	845	http://en.wikipedia.org/wiki/2011_Monaco_Grand_Prix	f	2	62
846	7	Canadian Grand Prix	2011-06-12	846	http://en.wikipedia.org/wiki/2011_Canadian_Grand_Prix	f	44	62
847	8	European Grand Prix	2011-06-26	847	http://en.wikipedia.org/wiki/2011_European_Grand_Prix	f	64	62
848	9	British Grand Prix	2011-07-10	848	http://en.wikipedia.org/wiki/2011_British_Grand_Prix	f	1	62
849	10	German Grand Prix	2011-07-24	849	http://en.wikipedia.org/wiki/2011_German_Grand_Prix	f	8	62
850	11	Hungarian Grand Prix	2011-07-31	850	http://en.wikipedia.org/wiki/2011_Hungarian_Grand_Prix	f	52	62
851	12	Belgian Grand Prix	2011-08-28	851	http://en.wikipedia.org/wiki/2011_Belgian_Grand_Prix	f	5	62
852	13	Italian Grand Prix	2011-09-11	852	http://en.wikipedia.org/wiki/2011_Italian_Grand_Prix	f	7	62
853	14	Singapore Grand Prix	2011-09-25	853	http://en.wikipedia.org/wiki/2011_Singapore_Grand_Prix	f	65	62
854	15	Japanese Grand Prix	2011-10-09	854	http://en.wikipedia.org/wiki/2011_Japanese_Grand_Prix	f	53	62
855	16	Korean Grand Prix	2011-10-16	855	http://en.wikipedia.org/wiki/2011_Korean_Grand_Prix	f	67	62
856	17	Indian Grand Prix	2011-10-30	856	http://en.wikipedia.org/wiki/2011_Indian_Grand_Prix	f	68	62
857	18	Abu Dhabi Grand Prix	2011-11-13	857	http://en.wikipedia.org/wiki/2011_Abu_Dhabi_Grand_Prix	f	66	62
858	19	Brazilian Grand Prix	2011-11-27	858	http://en.wikipedia.org/wiki/2011_Brazilian_Grand_Prix	f	37	62
859	1	Australian Grand Prix	2012-03-18	859	http://en.wikipedia.org/wiki/2012_Australian_Grand_Prix	f	59	63
860	2	Malaysian Grand Prix	2012-03-25	860	http://en.wikipedia.org/wiki/2012_Malaysian_Grand_Prix	f	60	63
861	3	Chinese Grand Prix	2012-04-15	861	http://en.wikipedia.org/wiki/2012_Chinese_Grand_Prix	f	62	63
862	4	Bahrain Grand Prix	2012-04-22	862	http://en.wikipedia.org/wiki/2012_Bahrain_Grand_Prix	f	61	63
863	5	Spanish Grand Prix	2012-05-13	863	http://en.wikipedia.org/wiki/2012_Spanish_Grand_Prix	f	56	63
864	6	Monaco Grand Prix	2012-05-27	864	http://en.wikipedia.org/wiki/2012_Monaco_Grand_Prix	f	2	63
865	7	Canadian Grand Prix	2012-06-10	865	http://en.wikipedia.org/wiki/2012_Canadian_Grand_Prix	f	44	63
866	8	European Grand Prix	2012-06-24	866	http://en.wikipedia.org/wiki/2012_European_Grand_Prix	f	64	63
867	9	British Grand Prix	2012-07-08	867	http://en.wikipedia.org/wiki/2012_British_Grand_Prix	f	1	63
868	10	German Grand Prix	2012-07-22	868	http://en.wikipedia.org/wiki/2012_German_Grand_Prix	f	33	63
869	11	Hungarian Grand Prix	2012-07-29	869	http://en.wikipedia.org/wiki/2012_Hungarian_Grand_Prix	f	52	63
870	12	Belgian Grand Prix	2012-09-02	870	http://en.wikipedia.org/wiki/2012_Belgian_Grand_Prix	f	5	63
871	13	Italian Grand Prix	2012-09-09	871	http://en.wikipedia.org/wiki/2012_Italian_Grand_Prix	f	7	63
872	14	Singapore Grand Prix	2012-09-23	872	http://en.wikipedia.org/wiki/2012_Singapore_Grand_Prix	f	65	63
873	15	Japanese Grand Prix	2012-10-07	873	http://en.wikipedia.org/wiki/2012_Japanese_Grand_Prix	f	53	63
874	16	Korean Grand Prix	2012-10-14	874	http://en.wikipedia.org/wiki/2012_Korean_Grand_Prix	f	67	63
875	17	Indian Grand Prix	2012-10-28	875	http://en.wikipedia.org/wiki/2012_Indian_Grand_Prix	f	68	63
876	18	Abu Dhabi Grand Prix	2012-11-04	876	http://en.wikipedia.org/wiki/2012_Abu_Dhabi_Grand_Prix	f	66	63
877	19	United States Grand Prix	2012-11-18	877	http://en.wikipedia.org/wiki/2012_United_States_Grand_Prix	f	69	63
878	20	Brazilian Grand Prix	2012-11-25	878	http://en.wikipedia.org/wiki/2012_Brazilian_Grand_Prix	f	37	63
879	1	Australian Grand Prix	2013-03-17	879	http://en.wikipedia.org/wiki/2013_Australian_Grand_Prix	f	59	64
880	2	Malaysian Grand Prix	2013-03-24	880	http://en.wikipedia.org/wiki/2013_Malaysian_Grand_Prix	f	60	64
881	3	Chinese Grand Prix	2013-04-14	881	http://en.wikipedia.org/wiki/2013_Chinese_Grand_Prix	f	62	64
882	4	Bahrain Grand Prix	2013-04-21	882	http://en.wikipedia.org/wiki/2013_Bahrain_Grand_Prix	f	61	64
883	5	Spanish Grand Prix	2013-05-12	883	http://en.wikipedia.org/wiki/2013_Spanish_Grand_Prix	f	56	64
884	6	Monaco Grand Prix	2013-05-26	884	http://en.wikipedia.org/wiki/2013_Monaco_Grand_Prix	f	2	64
885	7	Canadian Grand Prix	2013-06-09	885	http://en.wikipedia.org/wiki/2013_Canadian_Grand_Prix	f	44	64
886	8	British Grand Prix	2013-06-30	886	http://en.wikipedia.org/wiki/2013_British_Grand_Prix	f	1	64
887	9	German Grand Prix	2013-07-07	887	http://en.wikipedia.org/wiki/2013_German_Grand_Prix	f	8	64
888	10	Hungarian Grand Prix	2013-07-28	888	http://en.wikipedia.org/wiki/2013_Hungarian_Grand_Prix	f	52	64
889	11	Belgian Grand Prix	2013-08-25	889	http://en.wikipedia.org/wiki/2013_Belgian_Grand_Prix	f	5	64
890	12	Italian Grand Prix	2013-09-08	890	http://en.wikipedia.org/wiki/2013_Italian_Grand_Prix	f	7	64
891	13	Singapore Grand Prix	2013-09-22	891	http://en.wikipedia.org/wiki/2013_Singapore_Grand_Prix	f	65	64
892	14	Korean Grand Prix	2013-10-06	892	http://en.wikipedia.org/wiki/2013_Korean_Grand_Prix	f	67	64
893	15	Japanese Grand Prix	2013-10-13	893	http://en.wikipedia.org/wiki/2013_Japanese_Grand_Prix	f	53	64
894	16	Indian Grand Prix	2013-10-27	894	http://en.wikipedia.org/wiki/2013_Indian_Grand_Prix	f	68	64
895	17	Abu Dhabi Grand Prix	2013-11-03	895	http://en.wikipedia.org/wiki/2013_Abu_Dhabi_Grand_Prix	f	66	64
896	18	United States Grand Prix	2013-11-17	896	http://en.wikipedia.org/wiki/2013_United_States_Grand_Prix	f	69	64
897	19	Brazilian Grand Prix	2013-11-24	897	http://en.wikipedia.org/wiki/2013_Brazilian_Grand_Prix	f	37	64
898	1	Australian Grand Prix	2014-03-16	898	http://en.wikipedia.org/wiki/2014_Australian_Grand_Prix	f	59	65
899	2	Malaysian Grand Prix	2014-03-30	899	http://en.wikipedia.org/wiki/2014_Malaysian_Grand_Prix	f	60	65
900	3	Bahrain Grand Prix	2014-04-06	900	http://en.wikipedia.org/wiki/2014_Bahrain_Grand_Prix	f	61	65
901	4	Chinese Grand Prix	2014-04-20	901	http://en.wikipedia.org/wiki/2014_Chinese_Grand_Prix	f	62	65
902	5	Spanish Grand Prix	2014-05-11	902	http://en.wikipedia.org/wiki/2014_Spanish_Grand_Prix	f	56	65
903	6	Monaco Grand Prix	2014-05-25	903	http://en.wikipedia.org/wiki/2014_Monaco_Grand_Prix	f	2	65
904	7	Canadian Grand Prix	2014-06-08	904	http://en.wikipedia.org/wiki/2014_Canadian_Grand_Prix	f	44	65
905	8	Austrian Grand Prix	2014-06-22	905	http://en.wikipedia.org/wiki/2014_Austrian_Grand_Prix	f	34	65
906	9	British Grand Prix	2014-07-06	906	http://en.wikipedia.org/wiki/2014_British_Grand_Prix	f	1	65
907	10	German Grand Prix	2014-07-20	907	http://en.wikipedia.org/wiki/2014_German_Grand_Prix	f	33	65
908	11	Hungarian Grand Prix	2014-07-27	908	http://en.wikipedia.org/wiki/2014_Hungarian_Grand_Prix	f	52	65
909	12	Belgian Grand Prix	2014-08-24	909	http://en.wikipedia.org/wiki/2014_Belgian_Grand_Prix	f	5	65
910	13	Italian Grand Prix	2014-09-07	910	http://en.wikipedia.org/wiki/2014_Italian_Grand_Prix	f	7	65
911	14	Singapore Grand Prix	2014-09-21	911	http://en.wikipedia.org/wiki/2014_Singapore_Grand_Prix	f	65	65
912	15	Japanese Grand Prix	2014-10-05	912	http://en.wikipedia.org/wiki/2014_Japanese_Grand_Prix	f	53	65
913	16	Russian Grand Prix	2014-10-12	913	http://en.wikipedia.org/wiki/2014_Russian_Grand_Prix	f	70	65
914	17	United States Grand Prix	2014-11-02	914	http://en.wikipedia.org/wiki/2014_United_States_Grand_Prix	f	69	65
915	18	Brazilian Grand Prix	2014-11-09	915	http://en.wikipedia.org/wiki/2014_Brazilian_Grand_Prix	f	37	65
916	19	Abu Dhabi Grand Prix	2014-11-23	916	http://en.wikipedia.org/wiki/2014_Abu_Dhabi_Grand_Prix	f	66	65
917	1	Australian Grand Prix	2015-03-15	917	http://en.wikipedia.org/wiki/2015_Australian_Grand_Prix	f	59	66
918	2	Malaysian Grand Prix	2015-03-29	918	http://en.wikipedia.org/wiki/2015_Malaysian_Grand_Prix	f	60	66
919	3	Chinese Grand Prix	2015-04-12	919	http://en.wikipedia.org/wiki/2015_Chinese_Grand_Prix	f	62	66
920	4	Bahrain Grand Prix	2015-04-19	920	http://en.wikipedia.org/wiki/2015_Bahrain_Grand_Prix	f	61	66
921	5	Spanish Grand Prix	2015-05-10	921	http://en.wikipedia.org/wiki/2015_Spanish_Grand_Prix	f	56	66
922	6	Monaco Grand Prix	2015-05-24	922	http://en.wikipedia.org/wiki/2015_Monaco_Grand_Prix	f	2	66
923	7	Canadian Grand Prix	2015-06-07	923	http://en.wikipedia.org/wiki/2015_Canadian_Grand_Prix	f	44	66
924	8	Austrian Grand Prix	2015-06-21	924	http://en.wikipedia.org/wiki/2015_Austrian_Grand_Prix	f	34	66
925	9	British Grand Prix	2015-07-05	925	http://en.wikipedia.org/wiki/2015_British_Grand_Prix	f	1	66
926	10	Hungarian Grand Prix	2015-07-26	926	http://en.wikipedia.org/wiki/2015_Hungarian_Grand_Prix	f	52	66
927	11	Belgian Grand Prix	2015-08-23	927	http://en.wikipedia.org/wiki/2015_Belgian_Grand_Prix	f	5	66
928	12	Italian Grand Prix	2015-09-06	928	http://en.wikipedia.org/wiki/2015_Italian_Grand_Prix	f	7	66
929	13	Singapore Grand Prix	2015-09-20	929	http://en.wikipedia.org/wiki/2015_Singapore_Grand_Prix	f	65	66
930	14	Japanese Grand Prix	2015-09-27	930	http://en.wikipedia.org/wiki/2015_Japanese_Grand_Prix	f	53	66
931	15	Russian Grand Prix	2015-10-11	931	http://en.wikipedia.org/wiki/2015_Russian_Grand_Prix	f	70	66
932	16	United States Grand Prix	2015-10-25	932	http://en.wikipedia.org/wiki/2015_United_States_Grand_Prix	f	69	66
933	17	Mexican Grand Prix	2015-11-01	933	http://en.wikipedia.org/wiki/2015_Mexican_Grand_Prix	f	23	66
934	18	Brazilian Grand Prix	2015-11-15	934	http://en.wikipedia.org/wiki/2015_Brazilian_Grand_Prix	f	37	66
935	19	Abu Dhabi Grand Prix	2015-11-29	935	http://en.wikipedia.org/wiki/2015_Abu_Dhabi_Grand_Prix	f	66	66
936	1	Australian Grand Prix	2016-03-20	936	http://en.wikipedia.org/wiki/2016_Australian_Grand_Prix	f	59	67
937	2	Bahrain Grand Prix	2016-04-03	937	http://en.wikipedia.org/wiki/2016_Bahrain_Grand_Prix	f	61	67
938	3	Chinese Grand Prix	2016-04-17	938	http://en.wikipedia.org/wiki/2016_Chinese_Grand_Prix	f	62	67
939	4	Russian Grand Prix	2016-05-01	939	http://en.wikipedia.org/wiki/2016_Russian_Grand_Prix	f	70	67
940	5	Spanish Grand Prix	2016-05-15	940	http://en.wikipedia.org/wiki/2016_Spanish_Grand_Prix	f	56	67
941	6	Monaco Grand Prix	2016-05-29	941	http://en.wikipedia.org/wiki/2016_Monaco_Grand_Prix	f	2	67
942	7	Canadian Grand Prix	2016-06-12	942	http://en.wikipedia.org/wiki/2016_Canadian_Grand_Prix	f	44	67
943	8	European Grand Prix	2016-06-19	943	http://en.wikipedia.org/wiki/2016_European_Grand_Prix	f	71	67
944	9	Austrian Grand Prix	2016-07-03	944	http://en.wikipedia.org/wiki/2016_Austrian_Grand_Prix	f	34	67
945	10	British Grand Prix	2016-07-10	945	http://en.wikipedia.org/wiki/2016_British_Grand_Prix	f	1	67
946	11	Hungarian Grand Prix	2016-07-24	946	http://en.wikipedia.org/wiki/2016_Hungarian_Grand_Prix	f	52	67
947	12	German Grand Prix	2016-07-31	947	http://en.wikipedia.org/wiki/2016_German_Grand_Prix	f	33	67
948	13	Belgian Grand Prix	2016-08-28	948	http://en.wikipedia.org/wiki/2016_Belgian_Grand_Prix	f	5	67
949	14	Italian Grand Prix	2016-09-04	949	http://en.wikipedia.org/wiki/2016_Italian_Grand_Prix	f	7	67
950	15	Singapore Grand Prix	2016-09-18	950	http://en.wikipedia.org/wiki/2016_Singapore_Grand_Prix	f	65	67
951	16	Malaysian Grand Prix	2016-10-02	951	http://en.wikipedia.org/wiki/2016_Malaysian_Grand_Prix	f	60	67
952	17	Japanese Grand Prix	2016-10-09	952	http://en.wikipedia.org/wiki/2016_Japanese_Grand_Prix	f	53	67
953	18	United States Grand Prix	2016-10-23	953	http://en.wikipedia.org/wiki/2016_United_States_Grand_Prix	f	69	67
954	19	Mexican Grand Prix	2016-10-30	954	http://en.wikipedia.org/wiki/2016_Mexican_Grand_Prix	f	23	67
955	20	Brazilian Grand Prix	2016-11-13	955	http://en.wikipedia.org/wiki/2016_Brazilian_Grand_Prix	f	37	67
956	21	Abu Dhabi Grand Prix	2016-11-27	956	http://en.wikipedia.org/wiki/2016_Abu_Dhabi_Grand_Prix	f	66	67
957	1	Australian Grand Prix	2017-03-26	957	http://en.wikipedia.org/wiki/2017_Australian_Grand_Prix	f	59	68
958	2	Chinese Grand Prix	2017-04-09	958	http://en.wikipedia.org/wiki/2017_Chinese_Grand_Prix	f	62	68
959	3	Bahrain Grand Prix	2017-04-16	959	http://en.wikipedia.org/wiki/2017_Bahrain_Grand_Prix	f	61	68
960	4	Russian Grand Prix	2017-04-30	960	http://en.wikipedia.org/wiki/2017_Russian_Grand_Prix	f	70	68
961	5	Spanish Grand Prix	2017-05-14	961	http://en.wikipedia.org/wiki/2017_Spanish_Grand_Prix	f	56	68
962	6	Monaco Grand Prix	2017-05-28	962	http://en.wikipedia.org/wiki/2017_Monaco_Grand_Prix	f	2	68
963	7	Canadian Grand Prix	2017-06-11	963	http://en.wikipedia.org/wiki/2017_Canadian_Grand_Prix	f	44	68
964	8	Azerbaijan Grand Prix	2017-06-25	964	http://en.wikipedia.org/wiki/2017_Azerbaijan_Grand_Prix	f	71	68
965	9	Austrian Grand Prix	2017-07-09	965	http://en.wikipedia.org/wiki/2017_Austrian_Grand_Prix	f	34	68
966	10	British Grand Prix	2017-07-16	966	http://en.wikipedia.org/wiki/2017_British_Grand_Prix	f	1	68
967	11	Hungarian Grand Prix	2017-07-30	967	http://en.wikipedia.org/wiki/2017_Hungarian_Grand_Prix	f	52	68
968	12	Belgian Grand Prix	2017-08-27	968	http://en.wikipedia.org/wiki/2017_Belgian_Grand_Prix	f	5	68
969	13	Italian Grand Prix	2017-09-03	969	http://en.wikipedia.org/wiki/2017_Italian_Grand_Prix	f	7	68
970	14	Singapore Grand Prix	2017-09-17	970	http://en.wikipedia.org/wiki/2017_Singapore_Grand_Prix	f	65	68
971	15	Malaysian Grand Prix	2017-10-01	971	http://en.wikipedia.org/wiki/2017_Malaysian_Grand_Prix	f	60	68
972	16	Japanese Grand Prix	2017-10-08	972	http://en.wikipedia.org/wiki/2017_Japanese_Grand_Prix	f	53	68
973	17	United States Grand Prix	2017-10-22	973	http://en.wikipedia.org/wiki/2017_United_States_Grand_Prix	f	69	68
974	18	Mexican Grand Prix	2017-10-29	974	http://en.wikipedia.org/wiki/2017_Mexican_Grand_Prix	f	23	68
975	19	Brazilian Grand Prix	2017-11-12	975	http://en.wikipedia.org/wiki/2017_Brazilian_Grand_Prix	f	37	68
976	20	Abu Dhabi Grand Prix	2017-11-26	976	http://en.wikipedia.org/wiki/2017_Abu_Dhabi_Grand_Prix	f	66	68
977	1	Australian Grand Prix	2018-03-25	977	http://en.wikipedia.org/wiki/2018_Australian_Grand_Prix	f	59	69
978	2	Bahrain Grand Prix	2018-04-08	978	http://en.wikipedia.org/wiki/2018_Bahrain_Grand_Prix	f	61	69
979	3	Chinese Grand Prix	2018-04-15	979	http://en.wikipedia.org/wiki/2018_Chinese_Grand_Prix	f	62	69
980	4	Azerbaijan Grand Prix	2018-04-29	980	http://en.wikipedia.org/wiki/2018_Azerbaijan_Grand_Prix	f	71	69
981	5	Spanish Grand Prix	2018-05-13	981	http://en.wikipedia.org/wiki/2018_Spanish_Grand_Prix	f	56	69
982	6	Monaco Grand Prix	2018-05-27	982	http://en.wikipedia.org/wiki/2018_Monaco_Grand_Prix	f	2	69
983	7	Canadian Grand Prix	2018-06-10	983	http://en.wikipedia.org/wiki/2018_Canadian_Grand_Prix	f	44	69
984	8	French Grand Prix	2018-06-24	984	http://en.wikipedia.org/wiki/2018_French_Grand_Prix	f	35	69
985	9	Austrian Grand Prix	2018-07-01	985	http://en.wikipedia.org/wiki/2018_Austrian_Grand_Prix	f	34	69
986	10	British Grand Prix	2018-07-08	986	http://en.wikipedia.org/wiki/2018_British_Grand_Prix	f	1	69
987	11	German Grand Prix	2018-07-22	987	http://en.wikipedia.org/wiki/2018_German_Grand_Prix	f	33	69
988	12	Hungarian Grand Prix	2018-07-29	988	http://en.wikipedia.org/wiki/2018_Hungarian_Grand_Prix	f	52	69
989	13	Belgian Grand Prix	2018-08-26	989	http://en.wikipedia.org/wiki/2018_Belgian_Grand_Prix	f	5	69
990	14	Italian Grand Prix	2018-09-02	990	http://en.wikipedia.org/wiki/2018_Italian_Grand_Prix	f	7	69
991	15	Singapore Grand Prix	2018-09-16	991	http://en.wikipedia.org/wiki/2018_Singapore_Grand_Prix	f	65	69
992	16	Russian Grand Prix	2018-09-30	992	http://en.wikipedia.org/wiki/2018_Russian_Grand_Prix	f	70	69
993	17	Japanese Grand Prix	2018-10-07	993	http://en.wikipedia.org/wiki/2018_Japanese_Grand_Prix	f	53	69
994	18	United States Grand Prix	2018-10-21	994	http://en.wikipedia.org/wiki/2018_United_States_Grand_Prix	f	69	69
995	19	Mexican Grand Prix	2018-10-28	995	http://en.wikipedia.org/wiki/2018_Mexican_Grand_Prix	f	23	69
996	20	Brazilian Grand Prix	2018-11-11	996	http://en.wikipedia.org/wiki/2018_Brazilian_Grand_Prix	f	37	69
997	21	Abu Dhabi Grand Prix	2018-11-25	997	http://en.wikipedia.org/wiki/2018_Abu_Dhabi_Grand_Prix	f	66	69
998	1	Australian Grand Prix	2019-03-17	998	http://en.wikipedia.org/wiki/2019_Australian_Grand_Prix	f	59	70
999	2	Bahrain Grand Prix	2019-03-31	999	http://en.wikipedia.org/wiki/2019_Bahrain_Grand_Prix	f	61	70
1000	3	Chinese Grand Prix	2019-04-14	1000	http://en.wikipedia.org/wiki/2019_Chinese_Grand_Prix	f	62	70
1001	4	Azerbaijan Grand Prix	2019-04-28	1001	http://en.wikipedia.org/wiki/2019_Azerbaijan_Grand_Prix	f	71	70
1002	5	Spanish Grand Prix	2019-05-12	1002	http://en.wikipedia.org/wiki/2019_Spanish_Grand_Prix	f	56	70
1003	6	Monaco Grand Prix	2019-05-26	1003	http://en.wikipedia.org/wiki/2019_Monaco_Grand_Prix	f	2	70
1004	7	Canadian Grand Prix	2019-06-09	1004	http://en.wikipedia.org/wiki/2019_Canadian_Grand_Prix	f	44	70
1005	8	French Grand Prix	2019-06-23	1005	http://en.wikipedia.org/wiki/2019_French_Grand_Prix	f	35	70
1006	9	Austrian Grand Prix	2019-06-30	1006	http://en.wikipedia.org/wiki/2019_Austrian_Grand_Prix	f	34	70
1007	10	British Grand Prix	2019-07-14	1007	http://en.wikipedia.org/wiki/2019_British_Grand_Prix	f	1	70
1008	11	German Grand Prix	2019-07-28	1008	http://en.wikipedia.org/wiki/2019_German_Grand_Prix	f	33	70
1009	12	Hungarian Grand Prix	2019-08-04	1009	http://en.wikipedia.org/wiki/2019_Hungarian_Grand_Prix	f	52	70
1010	13	Belgian Grand Prix	2019-09-01	1010	http://en.wikipedia.org/wiki/2019_Belgian_Grand_Prix	f	5	70
1011	14	Italian Grand Prix	2019-09-08	1011	http://en.wikipedia.org/wiki/2019_Italian_Grand_Prix	f	7	70
1012	15	Singapore Grand Prix	2019-09-22	1012	http://en.wikipedia.org/wiki/2019_Singapore_Grand_Prix	f	65	70
1013	16	Russian Grand Prix	2019-09-29	1013	http://en.wikipedia.org/wiki/2019_Russian_Grand_Prix	f	70	70
1014	17	Japanese Grand Prix	2019-10-13	1014	http://en.wikipedia.org/wiki/2019_Japanese_Grand_Prix	f	53	70
1015	18	Mexican Grand Prix	2019-10-27	1015	http://en.wikipedia.org/wiki/2019_Mexican_Grand_Prix	f	23	70
1016	19	United States Grand Prix	2019-11-03	1016	http://en.wikipedia.org/wiki/2019_United_States_Grand_Prix	f	69	70
1017	20	Brazilian Grand Prix	2019-11-17	1017	http://en.wikipedia.org/wiki/2019_Brazilian_Grand_Prix	f	37	70
1018	21	Abu Dhabi Grand Prix	2019-12-01	1018	http://en.wikipedia.org/wiki/2019_Abu_Dhabi_Grand_Prix	f	66	70
1019	1	Austrian Grand Prix	2020-07-05	1019	http://en.wikipedia.org/wiki/2020_Austrian_Grand_Prix	f	34	71
1020	2	Styrian Grand Prix	2020-07-12	1020	http://en.wikipedia.org/wiki/2020_Styrian_Grand_Prix	f	34	71
1021	3	Hungarian Grand Prix	2020-07-19	1021	http://en.wikipedia.org/wiki/2020_Hungarian_Grand_Prix	f	52	71
1022	4	British Grand Prix	2020-08-02	1022	http://en.wikipedia.org/wiki/2020_British_Grand_Prix	f	1	71
1023	5	70th Anniversary Grand Prix	2020-08-09	1023	http://en.wikipedia.org/wiki/70th_Anniversary_Grand_Prix	f	1	71
1024	6	Spanish Grand Prix	2020-08-16	1024	http://en.wikipedia.org/wiki/2020_Spanish_Grand_Prix	f	56	71
1025	7	Belgian Grand Prix	2020-08-30	1025	http://en.wikipedia.org/wiki/2020_Belgian_Grand_Prix	f	5	71
1026	8	Italian Grand Prix	2020-09-06	1026	http://en.wikipedia.org/wiki/2020_Italian_Grand_Prix	f	7	71
1027	9	Tuscan Grand Prix	2020-09-13	1027	http://en.wikipedia.org/wiki/2020_Tuscan_Grand_Prix	f	72	71
1028	10	Russian Grand Prix	2020-09-27	1028	http://en.wikipedia.org/wiki/2020_Russian_Grand_Prix	f	70	71
1029	11	Eifel Grand Prix	2020-10-11	1029	http://en.wikipedia.org/wiki/2020_Eifel_Grand_Prix	f	8	71
1030	12	Portuguese Grand Prix	2020-10-25	1030	http://en.wikipedia.org/wiki/2020_Portuguese_Grand_Prix	f	73	71
1031	13	Emilia Romagna Grand Prix	2020-11-01	1031	http://en.wikipedia.org/wiki/2020_Emilia_Romagna_Grand_Prix	f	45	71
1032	14	Turkish Grand Prix	2020-11-15	1032	http://en.wikipedia.org/wiki/2020_Turkish_Grand_Prix	f	63	71
1033	15	Bahrain Grand Prix	2020-11-29	1033	http://en.wikipedia.org/wiki/2020_Bahrain_Grand_Prix	f	61	71
1034	16	Sakhir Grand Prix	2020-12-06	1034	http://en.wikipedia.org/wiki/2020_Sakhir_Grand_Prix	f	61	71
1035	17	Abu Dhabi Grand Prix	2020-12-13	1035	http://en.wikipedia.org/wiki/2020_Abu_Dhabi_Grand_Prix	f	66	71
1036	1	Bahrain Grand Prix	2021-03-28	1036	http://en.wikipedia.org/wiki/2021_Bahrain_Grand_Prix	f	61	72
1037	2	Emilia Romagna Grand Prix	2021-04-18	1037	http://en.wikipedia.org/wiki/2021_Emilia_Romagna_Grand_Prix	f	45	72
1038	3	Portuguese Grand Prix	2021-05-02	1038	http://en.wikipedia.org/wiki/2021_Portuguese_Grand_Prix	f	73	72
1039	4	Spanish Grand Prix	2021-05-09	1039	http://en.wikipedia.org/wiki/2021_Spanish_Grand_Prix	f	56	72
1040	5	Monaco Grand Prix	2021-05-23	1040	http://en.wikipedia.org/wiki/2021_Monaco_Grand_Prix	f	2	72
1041	6	Azerbaijan Grand Prix	2021-06-06	1041	http://en.wikipedia.org/wiki/2021_Azerbaijan_Grand_Prix	f	71	72
1042	7	French Grand Prix	2021-06-20	1042	http://en.wikipedia.org/wiki/2021_French_Grand_Prix	f	35	72
1043	8	Styrian Grand Prix	2021-06-27	1043	http://en.wikipedia.org/wiki/2021_Styrian_Grand_Prix	f	34	72
1044	9	Austrian Grand Prix	2021-07-04	1044	http://en.wikipedia.org/wiki/2021_Austrian_Grand_Prix	f	34	72
1045	10	British Grand Prix	2021-07-18	1045	http://en.wikipedia.org/wiki/2021_British_Grand_Prix	f	1	72
1046	11	Hungarian Grand Prix	2021-08-01	1046	http://en.wikipedia.org/wiki/2021_Hungarian_Grand_Prix	f	52	72
1047	12	Belgian Grand Prix	2021-08-29	1047	http://en.wikipedia.org/wiki/2021_Belgian_Grand_Prix	f	5	72
1048	13	Dutch Grand Prix	2021-09-05	1048	http://en.wikipedia.org/wiki/2021_Dutch_Grand_Prix	f	11	72
1049	14	Italian Grand Prix	2021-09-12	1049	http://en.wikipedia.org/wiki/2021_Italian_Grand_Prix	f	7	72
1050	15	Russian Grand Prix	2021-09-26	1050	http://en.wikipedia.org/wiki/2021_Russian_Grand_Prix	f	70	72
1051	16	Turkish Grand Prix	2021-10-10	1051	http://en.wikipedia.org/wiki/2021_Turkish_Grand_Prix	f	63	72
1052	17	United States Grand Prix	2021-10-24	1052	http://en.wikipedia.org/wiki/2021_United_States_Grand_Prix	f	69	72
1053	18	Mexico City Grand Prix	2021-11-07	1053	http://en.wikipedia.org/wiki/2021_Mexican_Grand_Prix	f	23	72
1054	19	São Paulo Grand Prix	2021-11-14	1054	http://en.wikipedia.org/wiki/2021_S%C3%A3o_Paulo_Grand_Prix	f	37	72
1055	20	Qatar Grand Prix	2021-11-21	1055	http://en.wikipedia.org/wiki/2021_Qatar_Grand_Prix	f	74	72
1056	21	Saudi Arabian Grand Prix	2021-12-05	1056	http://en.wikipedia.org/wiki/2021_Saudi_Arabian_Grand_Prix	f	75	72
1057	22	Abu Dhabi Grand Prix	2021-12-12	1057	http://en.wikipedia.org/wiki/2021_Abu_Dhabi_Grand_Prix	f	66	72
1058	1	Bahrain Grand Prix	2022-03-20	1058	http://en.wikipedia.org/wiki/2022_Bahrain_Grand_Prix	f	61	73
1059	2	Saudi Arabian Grand Prix	2022-03-27	1059	http://en.wikipedia.org/wiki/2022_Saudi_Arabian_Grand_Prix	f	75	73
1060	3	Australian Grand Prix	2022-04-10	1060	http://en.wikipedia.org/wiki/2022_Australian_Grand_Prix	f	59	73
1061	4	Emilia Romagna Grand Prix	2022-04-24	1061	http://en.wikipedia.org/wiki/2022_Emilia_Romagna_Grand_Prix	f	45	73
1062	5	Miami Grand Prix	2022-05-08	1062	http://en.wikipedia.org/wiki/2022_Miami_Grand_Prix	f	76	73
1063	6	Spanish Grand Prix	2022-05-22	1063	http://en.wikipedia.org/wiki/2022_Spanish_Grand_Prix	f	56	73
1064	7	Monaco Grand Prix	2022-05-29	1064	http://en.wikipedia.org/wiki/2022_Monaco_Grand_Prix	f	2	73
1065	8	Azerbaijan Grand Prix	2022-06-12	1065	http://en.wikipedia.org/wiki/2022_Azerbaijan_Grand_Prix	f	71	73
1066	9	Canadian Grand Prix	2022-06-19	1066	http://en.wikipedia.org/wiki/2022_Canadian_Grand_Prix	f	44	73
1067	10	British Grand Prix	2022-07-03	1067	http://en.wikipedia.org/wiki/2022_British_Grand_Prix	f	1	73
1068	11	Austrian Grand Prix	2022-07-10	1068	http://en.wikipedia.org/wiki/2022_Austrian_Grand_Prix	f	34	73
1069	12	French Grand Prix	2022-07-24	1069	http://en.wikipedia.org/wiki/2022_French_Grand_Prix	f	35	73
1070	13	Hungarian Grand Prix	2022-07-31	1070	http://en.wikipedia.org/wiki/2022_Hungarian_Grand_Prix	f	52	73
1071	14	Belgian Grand Prix	2022-08-28	1071	http://en.wikipedia.org/wiki/2022_Belgian_Grand_Prix	f	5	73
1072	15	Dutch Grand Prix	2022-09-04	1072	http://en.wikipedia.org/wiki/2022_Dutch_Grand_Prix	f	11	73
1073	16	Italian Grand Prix	2022-09-11	1073	http://en.wikipedia.org/wiki/2022_Italian_Grand_Prix	f	7	73
1074	17	Singapore Grand Prix	2022-10-02	1074	http://en.wikipedia.org/wiki/2022_Singapore_Grand_Prix	f	65	73
1075	18	Japanese Grand Prix	2022-10-09	1075	http://en.wikipedia.org/wiki/2022_Japanese_Grand_Prix	f	53	73
1076	19	United States Grand Prix	2022-10-23	1076	http://en.wikipedia.org/wiki/2022_United_States_Grand_Prix	f	69	73
1077	20	Mexico City Grand Prix	2022-10-30	1077	http://en.wikipedia.org/wiki/2022_Mexican_Grand_Prix	f	23	73
1078	21	São Paulo Grand Prix	2022-11-13	1078	http://en.wikipedia.org/wiki/2022_Brazilian_Grand_Prix	f	37	73
1079	22	Abu Dhabi Grand Prix	2022-11-20	1079	http://en.wikipedia.org/wiki/2022_Abu_Dhabi_Grand_Prix	f	66	73
1080	1	Bahrain Grand Prix	2023-03-05	1080	https://en.wikipedia.org/wiki/2023_Bahrain_Grand_Prix	f	61	74
1081	2	Saudi Arabian Grand Prix	2023-03-19	1081	https://en.wikipedia.org/wiki/2023_Saudi_Arabian_Grand_Prix	f	75	74
1082	3	Australian Grand Prix	2023-04-02	1082	https://en.wikipedia.org/wiki/2023_Australian_Grand_Prix	f	59	74
1083	4	Azerbaijan Grand Prix	2023-04-30	1083	https://en.wikipedia.org/wiki/2023_Azerbaijan_Grand_Prix	f	71	74
1084	5	Miami Grand Prix	2023-05-07	1084	https://en.wikipedia.org/wiki/2023_Miami_Grand_Prix	f	76	74
1085	6	Monaco Grand Prix	2023-05-28	1085	https://en.wikipedia.org/wiki/2023_Monaco_Grand_Prix	f	2	74
1086	7	Spanish Grand Prix	2023-06-04	1086	https://en.wikipedia.org/wiki/2023_Spanish_Grand_Prix	f	56	74
1087	8	Canadian Grand Prix	2023-06-18	1087	https://en.wikipedia.org/wiki/2023_Canadian_Grand_Prix	f	44	74
1088	9	Austrian Grand Prix	2023-07-02	1088	https://en.wikipedia.org/wiki/2023_Austrian_Grand_Prix	f	34	74
1089	10	British Grand Prix	2023-07-09	1089	https://en.wikipedia.org/wiki/2023_British_Grand_Prix	f	1	74
1090	11	Hungarian Grand Prix	2023-07-23	1090	https://en.wikipedia.org/wiki/2023_Hungarian_Grand_Prix	f	52	74
1091	12	Belgian Grand Prix	2023-07-30	1091	https://en.wikipedia.org/wiki/2023_Belgian_Grand_Prix	f	5	74
1092	13	Dutch Grand Prix	2023-08-27	1092	https://en.wikipedia.org/wiki/2023_Dutch_Grand_Prix	f	11	74
1093	14	Italian Grand Prix	2023-09-03	1093	https://en.wikipedia.org/wiki/2023_Italian_Grand_Prix	f	7	74
1094	15	Singapore Grand Prix	2023-09-17	1094	https://en.wikipedia.org/wiki/2023_Singapore_Grand_Prix	f	65	74
1095	16	Japanese Grand Prix	2023-09-24	1095	https://en.wikipedia.org/wiki/2023_Japanese_Grand_Prix	f	53	74
1096	17	Qatar Grand Prix	2023-10-08	1096	https://en.wikipedia.org/wiki/2023_Qatar_Grand_Prix	f	74	74
1097	18	United States Grand Prix	2023-10-22	1097	https://en.wikipedia.org/wiki/2023_United_States_Grand_Prix	f	69	74
1098	19	Mexico City Grand Prix	2023-10-29	1098	https://en.wikipedia.org/wiki/2023_Mexico_City_Grand_Prix	f	23	74
1099	20	São Paulo Grand Prix	2023-11-05	1099	https://en.wikipedia.org/wiki/2023_S%C3%A3o_Paulo_Grand_Prix	f	37	74
1100	21	Las Vegas Grand Prix	2023-11-19	1100	https://en.wikipedia.org/wiki/2023_Las_Vegas_Grand_Prix	f	77	74
1101	22	Abu Dhabi Grand Prix	2023-11-26	1101	https://en.wikipedia.org/wiki/2023_Abu_Dhabi_Grand_Prix	f	66	74
1102	1	Bahrain Grand Prix	2024-03-02	1102	https://en.wikipedia.org/wiki/2024_Bahrain_Grand_Prix	f	61	75
1103	2	Saudi Arabian Grand Prix	2024-03-09	1103	https://en.wikipedia.org/wiki/2024_Saudi_Arabian_Grand_Prix	f	75	75
1104	3	Australian Grand Prix	2024-03-24	1104	https://en.wikipedia.org/wiki/2024_Australian_Grand_Prix	f	59	75
1105	4	Japanese Grand Prix	2024-04-07	1105	https://en.wikipedia.org/wiki/2024_Japanese_Grand_Prix	f	53	75
1106	5	Chinese Grand Prix	2024-04-21	1106	https://en.wikipedia.org/wiki/2024_Chinese_Grand_Prix	f	62	75
1107	6	Miami Grand Prix	2024-05-05	1107	https://en.wikipedia.org/wiki/2024_Miami_Grand_Prix	f	76	75
1108	7	Emilia Romagna Grand Prix	2024-05-19	1108	https://en.wikipedia.org/wiki/2024_Emilia_Romagna_Grand_Prix	f	45	75
1109	8	Monaco Grand Prix	2024-05-26	1109	https://en.wikipedia.org/wiki/2024_Monaco_Grand_Prix	f	2	75
1110	9	Canadian Grand Prix	2024-06-09	1110	https://en.wikipedia.org/wiki/2024_Canadian_Grand_Prix	f	44	75
1111	10	Spanish Grand Prix	2024-06-23	1111	https://en.wikipedia.org/wiki/2024_Spanish_Grand_Prix	f	56	75
1112	11	Austrian Grand Prix	2024-06-30	1112	https://en.wikipedia.org/wiki/2024_Austrian_Grand_Prix	f	34	75
1113	12	British Grand Prix	2024-07-07	1113	https://en.wikipedia.org/wiki/2024_British_Grand_Prix	f	1	75
1114	13	Hungarian Grand Prix	2024-07-21	1114	https://en.wikipedia.org/wiki/2024_Hungarian_Grand_Prix	f	52	75
1115	14	Belgian Grand Prix	2024-07-28	1115	https://en.wikipedia.org/wiki/2024_Belgian_Grand_Prix	f	5	75
1116	15	Dutch Grand Prix	2024-08-25	1116	https://en.wikipedia.org/wiki/2024_Dutch_Grand_Prix	f	11	75
1117	16	Italian Grand Prix	2024-09-01	1117	https://en.wikipedia.org/wiki/2024_Italian_Grand_Prix	f	7	75
1118	17	Azerbaijan Grand Prix	2024-09-15	1118	https://en.wikipedia.org/wiki/2024_Azerbaijan_Grand_Prix	f	71	75
1119	18	Singapore Grand Prix	2024-09-22	1119	https://en.wikipedia.org/wiki/2024_Singapore_Grand_Prix	f	65	75
1120	19	United States Grand Prix	2024-10-20	1120	https://en.wikipedia.org/wiki/2024_United_States_Grand_Prix	f	69	75
1121	20	Mexico City Grand Prix	2024-10-27	1121	https://en.wikipedia.org/wiki/2024_Mexico_City_Grand_Prix	f	23	75
1122	21	São Paulo Grand Prix	2024-11-03	1122	https://en.wikipedia.org/wiki/2024_S%C3%A3o_Paulo_Grand_Prix	f	37	75
1123	22	Las Vegas Grand Prix	2024-11-23	1123	https://en.wikipedia.org/wiki/2024_Las_Vegas_Grand_Prix	f	77	75
1124	23	Qatar Grand Prix	2024-12-01	1124	https://en.wikipedia.org/wiki/2024_Qatar_Grand_Prix	f	74	75
1125	24	Abu Dhabi Grand Prix	2024-12-08	1125	https://en.wikipedia.org/wiki/2024_Abu_Dhabi_Grand_Prix	f	66	75
\.


--
-- Data for Name: formula_one_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_session (id, number, type, date, "time", scheduled_laps, is_cancelled, point_system_id, round_id) FROM stdin;
2	1	QB	1950-05-11	\N	\N	f	1	1
1	2	R	1950-05-13	\N	\N	f	2	1
5	1	QB	1950-05-18	\N	\N	f	1	2
4	2	R	1950-05-21	\N	\N	f	2	2
8	1	QB	1950-05-28	\N	\N	f	1	3
7	2	R	1950-05-30	\N	\N	f	2	3
11	1	QB	1950-06-02	\N	\N	f	1	4
10	2	R	1950-06-04	\N	\N	f	2	4
14	1	QB	1950-06-16	\N	\N	f	1	5
13	2	R	1950-06-18	\N	\N	f	2	5
17	1	QB	1950-06-30	\N	\N	f	1	6
16	2	R	1950-07-02	\N	\N	f	2	6
20	1	QB	1950-09-01	\N	\N	f	1	7
19	2	R	1950-09-03	\N	\N	f	2	7
23	1	QB	1951-05-25	\N	\N	f	1	8
22	2	R	1951-05-27	\N	\N	f	2	8
26	1	QB	1951-05-28	\N	\N	f	1	9
25	2	R	1951-05-30	\N	\N	f	2	9
29	1	QB	1951-06-15	\N	\N	f	1	10
28	2	R	1951-06-17	\N	\N	f	2	10
32	1	QB	1951-06-29	\N	\N	f	1	11
31	2	R	1951-07-01	\N	\N	f	2	11
35	1	QB	1951-07-12	\N	\N	f	1	12
34	2	R	1951-07-14	\N	\N	f	2	12
38	1	QB	1951-07-27	\N	\N	f	1	13
37	2	R	1951-07-29	\N	\N	f	2	13
41	1	QB	1951-09-14	\N	\N	f	1	14
40	2	R	1951-09-16	\N	\N	f	2	14
44	1	QB	1951-10-26	\N	\N	f	1	15
43	2	R	1951-10-28	\N	\N	f	2	15
47	1	QB	1952-05-16	\N	\N	f	1	16
46	2	R	1952-05-18	\N	\N	f	2	16
50	1	QB	1952-05-28	\N	\N	f	1	17
49	2	R	1952-05-30	\N	\N	f	2	17
53	1	QB	1952-06-20	\N	\N	f	1	18
52	2	R	1952-06-22	\N	\N	f	2	18
56	1	QB	1952-07-04	\N	\N	f	1	19
55	2	R	1952-07-06	\N	\N	f	2	19
59	1	QB	1952-07-17	\N	\N	f	1	20
58	2	R	1952-07-19	\N	\N	f	2	20
62	1	QB	1952-08-01	\N	\N	f	1	21
61	2	R	1952-08-03	\N	\N	f	2	21
65	1	QB	1952-08-15	\N	\N	f	1	22
64	2	R	1952-08-17	\N	\N	f	2	22
68	1	QB	1952-09-05	\N	\N	f	1	23
67	2	R	1952-09-07	\N	\N	f	2	23
71	1	QB	1953-01-16	\N	\N	f	1	24
70	2	R	1953-01-18	\N	\N	f	2	24
74	1	QB	1953-05-28	\N	\N	f	1	25
73	2	R	1953-05-30	\N	\N	f	2	25
77	1	QB	1953-06-05	\N	\N	f	1	26
76	2	R	1953-06-07	\N	\N	f	2	26
80	1	QB	1953-06-19	\N	\N	f	1	27
79	2	R	1953-06-21	\N	\N	f	2	27
83	1	QB	1953-07-03	\N	\N	f	1	28
82	2	R	1953-07-05	\N	\N	f	2	28
86	1	QB	1953-07-16	\N	\N	f	1	29
85	2	R	1953-07-18	\N	\N	f	2	29
89	1	QB	1953-07-31	\N	\N	f	1	30
88	2	R	1953-08-02	\N	\N	f	2	30
92	1	QB	1953-08-21	\N	\N	f	1	31
91	2	R	1953-08-23	\N	\N	f	2	31
95	1	QB	1953-09-11	\N	\N	f	1	32
94	2	R	1953-09-13	\N	\N	f	2	32
98	1	QB	1954-01-15	\N	\N	f	1	33
97	2	R	1954-01-17	\N	\N	f	3	33
101	1	QB	1954-05-29	\N	\N	f	1	34
100	2	R	1954-05-31	\N	\N	f	3	34
104	1	QB	1954-06-18	\N	\N	f	1	35
103	2	R	1954-06-20	\N	\N	f	3	35
107	1	QB	1954-07-02	\N	\N	f	1	36
106	2	R	1954-07-04	\N	\N	f	3	36
110	1	QB	1954-07-15	\N	\N	f	1	37
109	2	R	1954-07-17	\N	\N	f	3	37
113	1	QB	1954-07-30	\N	\N	f	1	38
112	2	R	1954-08-01	\N	\N	f	3	38
116	1	QB	1954-08-20	\N	\N	f	1	39
115	2	R	1954-08-22	\N	\N	f	3	39
119	1	QB	1954-09-03	\N	\N	f	1	40
118	2	R	1954-09-05	\N	\N	f	3	40
122	1	QB	1954-10-22	\N	\N	f	1	41
121	2	R	1954-10-24	\N	\N	f	3	41
125	1	QB	1955-01-14	\N	\N	f	1	42
124	2	R	1955-01-16	\N	\N	f	4	42
128	1	QB	1955-05-19	\N	\N	f	1	43
127	2	R	1955-05-22	\N	\N	f	4	43
131	1	QB	1955-05-28	\N	\N	f	1	44
130	2	R	1955-05-30	\N	\N	f	4	44
134	1	QB	1955-06-03	\N	\N	f	1	45
133	2	R	1955-06-05	\N	\N	f	4	45
137	1	QB	1955-06-17	\N	\N	f	1	46
136	2	R	1955-06-19	\N	\N	f	4	46
140	1	QB	1955-07-14	\N	\N	f	1	47
139	2	R	1955-07-16	\N	\N	f	4	47
143	1	QB	1955-09-09	\N	\N	f	1	48
142	2	R	1955-09-11	\N	\N	f	4	48
146	1	QB	1956-01-20	\N	\N	f	1	49
145	2	R	1956-01-22	\N	\N	f	5	49
149	1	QB	1956-05-10	\N	\N	f	1	50
148	2	R	1956-05-13	\N	\N	f	5	50
152	1	QB	1956-05-28	\N	\N	f	1	51
151	2	R	1956-05-30	\N	\N	f	5	51
155	1	QB	1956-06-01	\N	\N	f	1	52
154	2	R	1956-06-03	\N	\N	f	5	52
158	1	QB	1956-06-29	\N	\N	f	1	53
157	2	R	1956-07-01	\N	\N	f	5	53
161	1	QB	1956-07-12	\N	\N	f	1	54
160	2	R	1956-07-14	\N	\N	f	5	54
164	1	QB	1956-08-03	\N	\N	f	1	55
163	2	R	1956-08-05	\N	\N	f	5	55
167	1	QB	1956-08-31	\N	\N	f	1	56
166	2	R	1956-09-02	\N	\N	f	5	56
170	1	QB	1957-01-11	\N	\N	f	1	57
169	2	R	1957-01-13	\N	\N	f	5	57
173	1	QB	1957-05-16	\N	\N	f	1	58
172	2	R	1957-05-19	\N	\N	f	5	58
176	1	QB	1957-05-28	\N	\N	f	1	59
175	2	R	1957-05-30	\N	\N	f	5	59
179	1	QB	1957-07-05	\N	\N	f	1	60
178	2	R	1957-07-07	\N	\N	f	5	60
182	1	QB	1957-07-18	\N	\N	f	1	61
181	2	R	1957-07-20	\N	\N	f	5	61
185	1	QB	1957-08-02	\N	\N	f	1	62
184	2	R	1957-08-04	\N	\N	f	5	62
188	1	QB	1957-08-16	\N	\N	f	1	63
187	2	R	1957-08-18	\N	\N	f	5	63
191	1	QB	1957-09-06	\N	\N	f	1	64
190	2	R	1957-09-08	\N	\N	f	5	64
194	1	QB	1958-01-17	\N	\N	f	1	65
193	2	R	1958-01-19	\N	\N	f	6	65
197	1	QB	1958-05-15	\N	\N	f	1	66
196	2	R	1958-05-18	\N	\N	f	6	66
200	1	QB	1958-05-24	\N	\N	f	1	67
199	2	R	1958-05-26	\N	\N	f	6	67
203	1	QB	1958-05-28	\N	\N	f	1	68
202	2	R	1958-05-30	\N	\N	f	7	68
206	1	QB	1958-06-13	\N	\N	f	1	69
205	2	R	1958-06-15	\N	\N	f	6	69
209	1	QB	1958-07-04	\N	\N	f	1	70
208	2	R	1958-07-06	\N	\N	f	6	70
212	1	QB	1958-07-17	\N	\N	f	1	71
211	2	R	1958-07-19	\N	\N	f	6	71
215	1	QB	1958-08-01	\N	\N	f	1	72
214	2	R	1958-08-03	\N	\N	f	6	72
218	1	QB	1958-08-22	\N	\N	f	1	73
217	2	R	1958-08-24	\N	\N	f	6	73
221	1	QB	1958-09-05	\N	\N	f	1	74
220	2	R	1958-09-07	\N	\N	f	6	74
224	1	QB	1958-10-17	\N	\N	f	1	75
223	2	R	1958-10-19	\N	\N	f	6	75
227	1	QB	1959-05-07	\N	\N	f	1	76
226	2	R	1959-05-10	\N	\N	f	6	76
230	1	QB	1959-05-28	\N	\N	f	1	77
229	2	R	1959-05-30	\N	\N	f	7	77
233	1	QB	1959-05-29	\N	\N	f	1	78
232	2	R	1959-05-31	\N	\N	f	6	78
236	1	QB	1959-07-03	\N	\N	f	1	79
235	2	R	1959-07-05	\N	\N	f	6	79
239	1	QB	1959-07-16	\N	\N	f	1	80
238	2	R	1959-07-18	\N	\N	f	6	80
242	1	QB	1959-07-31	\N	\N	f	1	81
241	2	R	1959-08-02	\N	\N	f	6	81
245	1	QB	1959-08-21	\N	\N	f	1	82
244	2	R	1959-08-23	\N	\N	f	6	82
248	1	QB	1959-09-11	\N	\N	f	1	83
247	2	R	1959-09-13	\N	\N	f	6	83
251	1	QB	1959-12-10	\N	\N	f	1	84
250	2	R	1959-12-12	\N	\N	f	6	84
254	1	QB	1960-02-05	\N	\N	f	1	85
253	2	R	1960-02-07	\N	\N	f	8	85
257	1	QB	1960-05-26	\N	\N	f	1	86
256	2	R	1960-05-29	\N	\N	f	8	86
260	1	QB	1960-05-28	\N	\N	f	1	87
259	2	R	1960-05-30	\N	\N	f	9	87
263	1	QB	1960-06-04	\N	\N	f	1	88
262	2	R	1960-06-06	\N	\N	f	8	88
266	1	QB	1960-06-17	\N	\N	f	1	89
265	2	R	1960-06-19	\N	\N	f	8	89
269	1	QB	1960-07-01	\N	\N	f	1	90
268	2	R	1960-07-03	\N	\N	f	8	90
272	1	QB	1960-07-14	\N	\N	f	1	91
271	2	R	1960-07-16	\N	\N	f	8	91
275	1	QB	1960-08-12	\N	\N	f	1	92
274	2	R	1960-08-14	\N	\N	f	8	92
278	1	QB	1960-09-02	\N	\N	f	1	93
277	2	R	1960-09-04	\N	\N	f	8	93
281	1	QB	1960-11-18	\N	\N	f	1	94
280	2	R	1960-11-20	\N	\N	f	8	94
284	1	QB	1961-05-11	\N	\N	f	1	95
283	2	R	1961-05-14	\N	\N	f	10	95
287	1	QB	1961-05-20	\N	\N	f	1	96
286	2	R	1961-05-22	\N	\N	f	10	96
290	1	QB	1961-06-16	\N	\N	f	1	97
289	2	R	1961-06-18	\N	\N	f	10	97
293	1	QB	1961-06-30	\N	\N	f	1	98
292	2	R	1961-07-02	\N	\N	f	10	98
296	1	QB	1961-07-13	\N	\N	f	1	99
295	2	R	1961-07-15	\N	\N	f	10	99
299	1	QB	1961-08-04	\N	\N	f	1	100
298	2	R	1961-08-06	\N	\N	f	10	100
302	1	QB	1961-09-08	\N	\N	f	1	101
301	2	R	1961-09-10	\N	\N	f	10	101
305	1	QB	1961-10-06	\N	\N	f	1	102
304	2	R	1961-10-08	\N	\N	f	10	102
308	1	QB	1962-05-18	\N	\N	f	1	103
307	2	R	1962-05-20	\N	\N	f	11	103
311	1	QB	1962-05-31	\N	\N	f	1	104
310	2	R	1962-06-03	\N	\N	f	11	104
314	1	QB	1962-06-15	\N	\N	f	1	105
313	2	R	1962-06-17	\N	\N	f	11	105
317	1	QB	1962-07-06	\N	\N	f	1	106
316	2	R	1962-07-08	\N	\N	f	11	106
320	1	QB	1962-07-19	\N	\N	f	1	107
319	2	R	1962-07-21	\N	\N	f	11	107
323	1	QB	1962-08-03	\N	\N	f	1	108
322	2	R	1962-08-05	\N	\N	f	11	108
326	1	QB	1962-09-14	\N	\N	f	1	109
325	2	R	1962-09-16	\N	\N	f	11	109
329	1	QB	1962-10-05	\N	\N	f	1	110
328	2	R	1962-10-07	\N	\N	f	11	110
332	1	QB	1962-12-27	\N	\N	f	1	111
331	2	R	1962-12-29	\N	\N	f	11	111
335	1	QB	1963-05-23	\N	\N	f	1	112
334	2	R	1963-05-26	\N	\N	f	11	112
338	1	QB	1963-06-07	\N	\N	f	1	113
337	2	R	1963-06-09	\N	\N	f	11	113
341	1	QB	1963-06-21	\N	\N	f	1	114
340	2	R	1963-06-23	\N	\N	f	11	114
344	1	QB	1963-06-28	\N	\N	f	1	115
343	2	R	1963-06-30	\N	\N	f	11	115
347	1	QB	1963-07-18	\N	\N	f	1	116
346	2	R	1963-07-20	\N	\N	f	11	116
350	1	QB	1963-08-02	\N	\N	f	1	117
349	2	R	1963-08-04	\N	\N	f	11	117
353	1	QB	1963-09-06	\N	\N	f	1	118
352	2	R	1963-09-08	\N	\N	f	11	118
356	1	QB	1963-10-04	\N	\N	f	1	119
355	2	R	1963-10-06	\N	\N	f	11	119
359	1	QB	1963-10-25	\N	\N	f	1	120
358	2	R	1963-10-27	\N	\N	f	11	120
362	1	QB	1963-12-26	\N	\N	f	1	121
361	2	R	1963-12-28	\N	\N	f	11	121
365	1	QB	1964-05-07	\N	\N	f	1	122
364	2	R	1964-05-10	\N	\N	f	11	122
368	1	QB	1964-05-22	\N	\N	f	1	123
367	2	R	1964-05-24	\N	\N	f	11	123
371	1	QB	1964-06-12	\N	\N	f	1	124
370	2	R	1964-06-14	\N	\N	f	11	124
374	1	QB	1964-06-26	\N	\N	f	1	125
373	2	R	1964-06-28	\N	\N	f	11	125
377	1	QB	1964-07-09	\N	\N	f	1	126
376	2	R	1964-07-11	\N	\N	f	11	126
380	1	QB	1964-07-31	\N	\N	f	1	127
379	2	R	1964-08-02	\N	\N	f	11	127
383	1	QB	1964-08-21	\N	\N	f	1	128
382	2	R	1964-08-23	\N	\N	f	11	128
386	1	QB	1964-09-04	\N	\N	f	1	129
385	2	R	1964-09-06	\N	\N	f	11	129
389	1	QB	1964-10-02	\N	\N	f	1	130
388	2	R	1964-10-04	\N	\N	f	11	130
392	1	QB	1964-10-23	\N	\N	f	1	131
391	2	R	1964-10-25	\N	\N	f	11	131
395	1	QB	1964-12-30	\N	\N	f	1	132
394	2	R	1965-01-01	\N	\N	f	11	132
398	1	QB	1965-05-27	\N	\N	f	1	133
397	2	R	1965-05-30	\N	\N	f	11	133
401	1	QB	1965-06-11	\N	\N	f	1	134
400	2	R	1965-06-13	\N	\N	f	11	134
404	1	QB	1965-06-25	\N	\N	f	1	135
403	2	R	1965-06-27	\N	\N	f	11	135
407	1	QB	1965-07-08	\N	\N	f	1	136
406	2	R	1965-07-10	\N	\N	f	11	136
410	1	QB	1965-07-16	\N	\N	f	1	137
409	2	R	1965-07-18	\N	\N	f	11	137
413	1	QB	1965-07-30	\N	\N	f	1	138
412	2	R	1965-08-01	\N	\N	f	11	138
416	1	QB	1965-09-10	\N	\N	f	1	139
415	2	R	1965-09-12	\N	\N	f	11	139
419	1	QB	1965-10-01	\N	\N	f	1	140
418	2	R	1965-10-03	\N	\N	f	11	140
422	1	QB	1965-10-22	\N	\N	f	1	141
421	2	R	1965-10-24	\N	\N	f	11	141
425	1	QB	1966-05-19	\N	\N	f	1	142
424	2	R	1966-05-22	\N	\N	f	11	142
428	1	QB	1966-06-10	\N	\N	f	1	143
427	2	R	1966-06-12	\N	\N	f	11	143
431	1	QB	1966-07-01	\N	\N	f	1	144
430	2	R	1966-07-03	\N	\N	f	11	144
434	1	QB	1966-07-14	\N	\N	f	1	145
433	2	R	1966-07-16	\N	\N	f	11	145
437	1	QB	1966-07-22	\N	\N	f	1	146
436	2	R	1966-07-24	\N	\N	f	11	146
440	1	QB	1966-08-05	\N	\N	f	1	147
439	2	R	1966-08-07	\N	\N	f	11	147
443	1	QB	1966-09-02	\N	\N	f	1	148
442	2	R	1966-09-04	\N	\N	f	11	148
446	1	QB	1966-09-30	\N	\N	f	1	149
445	2	R	1966-10-02	\N	\N	f	11	149
449	1	QB	1966-10-21	\N	\N	f	1	150
448	2	R	1966-10-23	\N	\N	f	11	150
452	1	QB	1966-12-31	\N	\N	f	1	151
451	2	R	1967-01-02	\N	\N	f	11	151
455	1	QB	1967-05-04	\N	\N	f	1	152
454	2	R	1967-05-07	\N	\N	f	11	152
458	1	QB	1967-06-02	\N	\N	f	1	153
457	2	R	1967-06-04	\N	\N	f	11	153
461	1	QB	1967-06-16	\N	\N	f	1	154
460	2	R	1967-06-18	\N	\N	f	11	154
464	1	QB	1967-06-30	\N	\N	f	1	155
463	2	R	1967-07-02	\N	\N	f	11	155
467	1	QB	1967-07-13	\N	\N	f	1	156
466	2	R	1967-07-15	\N	\N	f	11	156
470	1	QB	1967-08-04	\N	\N	f	1	157
469	2	R	1967-08-06	\N	\N	f	11	157
473	1	QB	1967-08-25	\N	\N	f	1	158
472	2	R	1967-08-27	\N	\N	f	11	158
476	1	QB	1967-09-08	\N	\N	f	1	159
475	2	R	1967-09-10	\N	\N	f	11	159
479	1	QB	1967-09-29	\N	\N	f	1	160
478	2	R	1967-10-01	\N	\N	f	11	160
482	1	QB	1967-10-20	\N	\N	f	1	161
481	2	R	1967-10-22	\N	\N	f	11	161
485	1	QB	1967-12-30	\N	\N	f	1	162
484	2	R	1968-01-01	\N	\N	f	11	162
488	1	QB	1968-05-10	\N	\N	f	1	163
487	2	R	1968-05-12	\N	\N	f	11	163
491	1	QB	1968-05-23	\N	\N	f	1	164
490	2	R	1968-05-26	\N	\N	f	11	164
494	1	QB	1968-06-07	\N	\N	f	1	165
493	2	R	1968-06-09	\N	\N	f	11	165
497	1	QB	1968-06-21	\N	\N	f	1	166
496	2	R	1968-06-23	\N	\N	f	11	166
500	1	QB	1968-07-05	\N	\N	f	1	167
499	2	R	1968-07-07	\N	\N	f	11	167
503	1	QB	1968-07-18	\N	\N	f	1	168
502	2	R	1968-07-20	\N	\N	f	11	168
506	1	QB	1968-08-02	\N	\N	f	1	169
505	2	R	1968-08-04	\N	\N	f	11	169
509	1	QB	1968-09-06	\N	\N	f	1	170
508	2	R	1968-09-08	\N	\N	f	11	170
512	1	QB	1968-09-20	\N	\N	f	1	171
511	2	R	1968-09-22	\N	\N	f	11	171
515	1	QB	1968-10-04	\N	\N	f	1	172
514	2	R	1968-10-06	\N	\N	f	11	172
518	1	QB	1968-11-01	\N	\N	f	1	173
517	2	R	1968-11-03	\N	\N	f	11	173
521	1	QB	1969-02-27	\N	\N	f	1	174
520	2	R	1969-03-01	\N	\N	f	11	174
524	1	QB	1969-05-02	\N	\N	f	1	175
523	2	R	1969-05-04	\N	\N	f	11	175
527	1	QB	1969-05-15	\N	\N	f	1	176
526	2	R	1969-05-18	\N	\N	f	11	176
530	1	QB	1969-06-19	\N	\N	f	1	177
529	2	R	1969-06-21	\N	\N	f	11	177
533	1	QB	1969-07-04	\N	\N	f	1	178
532	2	R	1969-07-06	\N	\N	f	11	178
536	1	QB	1969-07-17	\N	\N	f	1	179
535	2	R	1969-07-19	\N	\N	f	11	179
539	1	QB	1969-08-01	\N	\N	f	1	180
538	2	R	1969-08-03	\N	\N	f	11	180
542	1	QB	1969-09-05	\N	\N	f	1	181
541	2	R	1969-09-07	\N	\N	f	11	181
545	1	QB	1969-09-18	\N	\N	f	1	182
544	2	R	1969-09-20	\N	\N	f	11	182
548	1	QB	1969-10-03	\N	\N	f	1	183
547	2	R	1969-10-05	\N	\N	f	11	183
551	1	QB	1969-10-17	\N	\N	f	1	184
550	2	R	1969-10-19	\N	\N	f	11	184
554	1	QB	1970-03-05	\N	\N	f	1	185
553	2	R	1970-03-07	\N	\N	f	11	185
557	1	QB	1970-04-17	\N	\N	f	1	186
556	2	R	1970-04-19	\N	\N	f	11	186
560	1	QB	1970-05-07	\N	\N	f	1	187
559	2	R	1970-05-10	\N	\N	f	11	187
563	1	QB	1970-06-05	\N	\N	f	1	188
562	2	R	1970-06-07	\N	\N	f	11	188
566	1	QB	1970-06-19	\N	\N	f	1	189
565	2	R	1970-06-21	\N	\N	f	11	189
569	1	QB	1970-07-03	\N	\N	f	1	190
568	2	R	1970-07-05	\N	\N	f	11	190
572	1	QB	1970-07-16	\N	\N	f	1	191
571	2	R	1970-07-18	\N	\N	f	11	191
575	1	QB	1970-07-31	\N	\N	f	1	192
574	2	R	1970-08-02	\N	\N	f	11	192
578	1	QB	1970-08-14	\N	\N	f	1	193
577	2	R	1970-08-16	\N	\N	f	11	193
581	1	QB	1970-09-04	\N	\N	f	1	194
580	2	R	1970-09-06	\N	\N	f	11	194
584	1	QB	1970-09-18	\N	\N	f	1	195
583	2	R	1970-09-20	\N	\N	f	11	195
587	1	QB	1970-10-02	\N	\N	f	1	196
586	2	R	1970-10-04	\N	\N	f	11	196
590	1	QB	1970-10-23	\N	\N	f	1	197
589	2	R	1970-10-25	\N	\N	f	11	197
593	1	QB	1971-03-04	\N	\N	f	1	198
592	2	R	1971-03-06	\N	\N	f	11	198
596	1	QB	1971-04-16	\N	\N	f	1	199
595	2	R	1971-04-18	\N	\N	f	11	199
599	1	QB	1971-05-20	\N	\N	f	1	200
598	2	R	1971-05-23	\N	\N	f	11	200
602	1	QB	1971-06-18	\N	\N	f	1	201
601	2	R	1971-06-20	\N	\N	f	11	201
605	1	QB	1971-07-02	\N	\N	f	1	202
604	2	R	1971-07-04	\N	\N	f	11	202
608	1	QB	1971-07-15	\N	\N	f	1	203
607	2	R	1971-07-17	\N	\N	f	11	203
611	1	QB	1971-07-30	\N	\N	f	1	204
610	2	R	1971-08-01	\N	\N	f	11	204
614	1	QB	1971-08-13	\N	\N	f	1	205
613	2	R	1971-08-15	\N	\N	f	11	205
617	1	QB	1971-09-03	\N	\N	f	1	206
616	2	R	1971-09-05	\N	\N	f	11	206
620	1	QB	1971-09-17	\N	\N	f	1	207
619	2	R	1971-09-19	\N	\N	f	11	207
623	1	QB	1971-10-01	\N	\N	f	1	208
622	2	R	1971-10-03	\N	\N	f	11	208
626	1	QB	1972-01-21	\N	\N	f	1	209
625	2	R	1972-01-23	\N	\N	f	11	209
629	1	QB	1972-03-02	\N	\N	f	1	210
628	2	R	1972-03-04	\N	\N	f	11	210
632	1	QB	1972-04-29	\N	\N	f	1	211
631	2	R	1972-05-01	\N	\N	f	11	211
635	1	QB	1972-05-11	\N	\N	f	1	212
634	2	R	1972-05-14	\N	\N	f	11	212
638	1	QB	1972-06-02	\N	\N	f	1	213
637	2	R	1972-06-04	\N	\N	f	11	213
641	1	QB	1972-06-30	\N	\N	f	1	214
640	2	R	1972-07-02	\N	\N	f	11	214
644	1	QB	1972-07-13	\N	\N	f	1	215
643	2	R	1972-07-15	\N	\N	f	11	215
647	1	QB	1972-07-28	\N	\N	f	1	216
646	2	R	1972-07-30	\N	\N	f	11	216
650	1	QB	1972-08-11	\N	\N	f	1	217
649	2	R	1972-08-13	\N	\N	f	11	217
653	1	QB	1972-09-08	\N	\N	f	1	218
652	2	R	1972-09-10	\N	\N	f	11	218
656	1	QB	1972-09-22	\N	\N	f	1	219
655	2	R	1972-09-24	\N	\N	f	11	219
659	1	QB	1972-10-06	\N	\N	f	1	220
658	2	R	1972-10-08	\N	\N	f	11	220
662	1	QB	1973-01-26	\N	\N	f	1	221
661	2	R	1973-01-28	\N	\N	f	11	221
665	1	QB	1973-02-09	\N	\N	f	1	222
664	2	R	1973-02-11	\N	\N	f	11	222
668	1	QB	1973-03-01	\N	\N	f	1	223
667	2	R	1973-03-03	\N	\N	f	11	223
671	1	QB	1973-04-27	\N	\N	f	1	224
670	2	R	1973-04-29	\N	\N	f	11	224
674	1	QB	1973-05-18	\N	\N	f	1	225
673	2	R	1973-05-20	\N	\N	f	11	225
677	1	QB	1973-05-31	\N	\N	f	1	226
676	2	R	1973-06-03	\N	\N	f	11	226
680	1	QB	1973-06-15	\N	\N	f	1	227
679	2	R	1973-06-17	\N	\N	f	11	227
683	1	QB	1973-06-29	\N	\N	f	1	228
682	2	R	1973-07-01	\N	\N	f	11	228
686	1	QB	1973-07-12	\N	\N	f	1	229
685	2	R	1973-07-14	\N	\N	f	11	229
689	1	QB	1973-07-27	\N	\N	f	1	230
688	2	R	1973-07-29	\N	\N	f	11	230
692	1	QB	1973-08-03	\N	\N	f	1	231
691	2	R	1973-08-05	\N	\N	f	11	231
695	1	QB	1973-08-17	\N	\N	f	1	232
694	2	R	1973-08-19	\N	\N	f	11	232
698	1	QB	1973-09-07	\N	\N	f	1	233
697	2	R	1973-09-09	\N	\N	f	11	233
701	1	QB	1973-09-21	\N	\N	f	1	234
700	2	R	1973-09-23	\N	\N	f	11	234
704	1	QB	1973-10-05	\N	\N	f	1	235
703	2	R	1973-10-07	\N	\N	f	11	235
707	1	QB	1974-01-11	\N	\N	f	1	236
706	2	R	1974-01-13	\N	\N	f	11	236
710	1	QB	1974-01-25	\N	\N	f	1	237
709	2	R	1974-01-27	\N	\N	f	11	237
713	1	QB	1974-03-28	\N	\N	f	1	238
712	2	R	1974-03-30	\N	\N	f	11	238
716	1	QB	1974-04-26	\N	\N	f	1	239
715	2	R	1974-04-28	\N	\N	f	11	239
719	1	QB	1974-05-10	\N	\N	f	1	240
718	2	R	1974-05-12	\N	\N	f	11	240
722	1	QB	1974-05-23	\N	\N	f	1	241
721	2	R	1974-05-26	\N	\N	f	11	241
725	1	QB	1974-06-07	\N	\N	f	1	242
724	2	R	1974-06-09	\N	\N	f	11	242
728	1	QB	1974-06-21	\N	\N	f	1	243
727	2	R	1974-06-23	\N	\N	f	11	243
731	1	QB	1974-07-05	\N	\N	f	1	244
730	2	R	1974-07-07	\N	\N	f	11	244
734	1	QB	1974-07-18	\N	\N	f	1	245
733	2	R	1974-07-20	\N	\N	f	11	245
737	1	QB	1974-08-02	\N	\N	f	1	246
736	2	R	1974-08-04	\N	\N	f	11	246
740	1	QB	1974-08-16	\N	\N	f	1	247
739	2	R	1974-08-18	\N	\N	f	11	247
743	1	QB	1974-09-06	\N	\N	f	1	248
742	2	R	1974-09-08	\N	\N	f	11	248
746	1	QB	1974-09-20	\N	\N	f	1	249
745	2	R	1974-09-22	\N	\N	f	11	249
749	1	QB	1974-10-04	\N	\N	f	1	250
748	2	R	1974-10-06	\N	\N	f	11	250
752	1	QB	1975-01-10	\N	\N	f	1	251
751	2	R	1975-01-12	\N	\N	f	12	251
755	1	QB	1975-01-24	\N	\N	f	1	252
754	2	R	1975-01-26	\N	\N	f	12	252
758	1	QB	1975-02-27	\N	\N	f	1	253
757	2	R	1975-03-01	\N	\N	f	12	253
761	1	QB	1975-04-25	\N	\N	f	1	254
760	2	R	1975-04-27	\N	\N	f	12	254
764	1	QB	1975-05-08	\N	\N	f	1	255
763	2	R	1975-05-11	\N	\N	f	12	255
767	1	QB	1975-05-23	\N	\N	f	1	256
766	2	R	1975-05-25	\N	\N	f	12	256
770	1	QB	1975-06-06	\N	\N	f	1	257
769	2	R	1975-06-08	\N	\N	f	12	257
773	1	QB	1975-06-20	\N	\N	f	1	258
772	2	R	1975-06-22	\N	\N	f	12	258
776	1	QB	1975-07-04	\N	\N	f	1	259
775	2	R	1975-07-06	\N	\N	f	12	259
779	1	QB	1975-07-17	\N	\N	f	1	260
778	2	R	1975-07-19	\N	\N	f	12	260
782	1	QB	1975-08-01	\N	\N	f	1	261
781	2	R	1975-08-03	\N	\N	f	12	261
785	1	QB	1975-08-15	\N	\N	f	1	262
784	2	R	1975-08-17	\N	\N	f	12	262
788	1	QB	1975-09-05	\N	\N	f	1	263
787	2	R	1975-09-07	\N	\N	f	12	263
791	1	QB	1975-10-03	\N	\N	f	1	264
790	2	R	1975-10-05	\N	\N	f	12	264
794	1	QB	1976-01-23	\N	\N	f	1	265
793	2	R	1976-01-25	\N	\N	f	12	265
797	1	QB	1976-03-04	\N	\N	f	1	266
796	2	R	1976-03-06	\N	\N	f	12	266
800	1	QB	1976-03-26	\N	\N	f	1	267
799	2	R	1976-03-28	\N	\N	f	12	267
803	1	QB	1976-04-30	\N	\N	f	1	268
802	2	R	1976-05-02	\N	\N	f	12	268
806	1	QB	1976-05-14	\N	\N	f	1	269
805	2	R	1976-05-16	\N	\N	f	12	269
809	1	QB	1976-05-27	\N	\N	f	1	270
808	2	R	1976-05-30	\N	\N	f	12	270
812	1	QB	1976-06-11	\N	\N	f	1	271
811	2	R	1976-06-13	\N	\N	f	12	271
815	1	QB	1976-07-02	\N	\N	f	1	272
814	2	R	1976-07-04	\N	\N	f	12	272
818	1	QB	1976-07-16	\N	\N	f	1	273
817	2	R	1976-07-18	\N	\N	f	12	273
821	1	QB	1976-07-30	\N	\N	f	1	274
820	2	R	1976-08-01	\N	\N	f	12	274
824	1	QB	1976-08-13	\N	\N	f	1	275
823	2	R	1976-08-15	\N	\N	f	12	275
827	1	QB	1976-08-27	\N	\N	f	1	276
826	2	R	1976-08-29	\N	\N	f	12	276
830	1	QB	1976-09-10	\N	\N	f	1	277
829	2	R	1976-09-12	\N	\N	f	12	277
833	1	QB	1976-10-01	\N	\N	f	1	278
832	2	R	1976-10-03	\N	\N	f	12	278
836	1	QB	1976-10-08	\N	\N	f	1	279
835	2	R	1976-10-10	\N	\N	f	12	279
839	1	QB	1976-10-22	\N	\N	f	1	280
838	2	R	1976-10-24	\N	\N	f	12	280
842	1	QB	1977-01-07	\N	\N	f	1	281
841	2	R	1977-01-09	\N	\N	f	12	281
845	1	QB	1977-01-21	\N	\N	f	1	282
844	2	R	1977-01-23	\N	\N	f	12	282
848	1	QB	1977-03-03	\N	\N	f	1	283
847	2	R	1977-03-05	\N	\N	f	12	283
851	1	QB	1977-04-01	\N	\N	f	1	284
850	2	R	1977-04-03	\N	\N	f	12	284
854	1	QB	1977-05-06	\N	\N	f	1	285
853	2	R	1977-05-08	\N	\N	f	12	285
857	1	QB	1977-05-19	\N	\N	f	1	286
856	2	R	1977-05-22	\N	\N	f	12	286
860	1	QB	1977-06-03	\N	\N	f	1	287
859	2	R	1977-06-05	\N	\N	f	12	287
863	1	QB	1977-06-17	\N	\N	f	1	288
862	2	R	1977-06-19	\N	\N	f	12	288
866	1	QB	1977-07-01	\N	\N	f	1	289
865	2	R	1977-07-03	\N	\N	f	12	289
869	1	QB	1977-07-14	\N	\N	f	1	290
868	2	R	1977-07-16	\N	\N	f	12	290
872	1	QB	1977-07-29	\N	\N	f	1	291
871	2	R	1977-07-31	\N	\N	f	12	291
875	1	QB	1977-08-12	\N	\N	f	1	292
874	2	R	1977-08-14	\N	\N	f	12	292
878	1	QB	1977-08-26	\N	\N	f	1	293
877	2	R	1977-08-28	\N	\N	f	12	293
881	1	QB	1977-09-09	\N	\N	f	1	294
880	2	R	1977-09-11	\N	\N	f	12	294
884	1	QB	1977-09-30	\N	\N	f	1	295
883	2	R	1977-10-02	\N	\N	f	12	295
887	1	QB	1977-10-07	\N	\N	f	1	296
886	2	R	1977-10-09	\N	\N	f	12	296
890	1	QB	1977-10-21	\N	\N	f	1	297
889	2	R	1977-10-23	\N	\N	f	12	297
893	1	QB	1978-01-13	\N	\N	f	1	298
892	2	R	1978-01-15	\N	\N	f	12	298
896	1	QB	1978-01-27	\N	\N	f	1	299
895	2	R	1978-01-29	\N	\N	f	12	299
899	1	QB	1978-03-02	\N	\N	f	1	300
898	2	R	1978-03-04	\N	\N	f	12	300
902	1	QB	1978-03-31	\N	\N	f	1	301
901	2	R	1978-04-02	\N	\N	f	12	301
905	1	QB	1978-05-04	\N	\N	f	1	302
904	2	R	1978-05-07	\N	\N	f	12	302
908	1	QB	1978-05-19	\N	\N	f	1	303
907	2	R	1978-05-21	\N	\N	f	12	303
911	1	QB	1978-06-02	\N	\N	f	1	304
910	2	R	1978-06-04	\N	\N	f	12	304
914	1	QB	1978-06-15	\N	\N	f	1	305
913	2	R	1978-06-17	\N	\N	f	12	305
917	1	QB	1978-06-30	\N	\N	f	1	306
916	2	R	1978-07-02	\N	\N	f	12	306
920	1	QB	1978-07-14	\N	\N	f	1	307
919	2	R	1978-07-16	\N	\N	f	12	307
923	1	QB	1978-07-28	\N	\N	f	1	308
922	2	R	1978-07-30	\N	\N	f	12	308
926	1	QB	1978-08-11	\N	\N	f	1	309
925	2	R	1978-08-13	\N	\N	f	12	309
929	1	QB	1978-08-25	\N	\N	f	1	310
928	2	R	1978-08-27	\N	\N	f	12	310
932	1	QB	1978-09-08	\N	\N	f	1	311
931	2	R	1978-09-10	\N	\N	f	12	311
935	1	QB	1978-09-29	\N	\N	f	1	312
934	2	R	1978-10-01	\N	\N	f	12	312
938	1	QB	1978-10-06	\N	\N	f	1	313
937	2	R	1978-10-08	\N	\N	f	12	313
941	1	QB	1979-01-19	\N	\N	f	1	314
940	2	R	1979-01-21	\N	\N	f	12	314
944	1	QB	1979-02-02	\N	\N	f	1	315
943	2	R	1979-02-04	\N	\N	f	12	315
947	1	QB	1979-03-01	\N	\N	f	1	316
946	2	R	1979-03-03	\N	\N	f	12	316
950	1	QB	1979-04-06	\N	\N	f	1	317
949	2	R	1979-04-08	\N	\N	f	12	317
953	1	QB	1979-04-27	\N	\N	f	1	318
952	2	R	1979-04-29	\N	\N	f	12	318
956	1	QB	1979-05-11	\N	\N	f	1	319
955	2	R	1979-05-13	\N	\N	f	12	319
959	1	QB	1979-05-24	\N	\N	f	1	320
958	2	R	1979-05-27	\N	\N	f	12	320
962	1	QB	1979-06-29	\N	\N	f	1	321
961	2	R	1979-07-01	\N	\N	f	12	321
965	1	QB	1979-07-12	\N	\N	f	1	322
964	2	R	1979-07-14	\N	\N	f	12	322
968	1	QB	1979-07-27	\N	\N	f	1	323
967	2	R	1979-07-29	\N	\N	f	12	323
971	1	QB	1979-08-10	\N	\N	f	1	324
970	2	R	1979-08-12	\N	\N	f	12	324
974	1	QB	1979-08-24	\N	\N	f	1	325
973	2	R	1979-08-26	\N	\N	f	12	325
977	1	QB	1979-09-07	\N	\N	f	1	326
976	2	R	1979-09-09	\N	\N	f	12	326
980	1	QB	1979-09-28	\N	\N	f	1	327
979	2	R	1979-09-30	\N	\N	f	12	327
983	1	QB	1979-10-05	\N	\N	f	1	328
982	2	R	1979-10-07	\N	\N	f	12	328
986	1	QB	1980-01-11	\N	\N	f	1	329
985	2	R	1980-01-13	\N	\N	f	13	329
989	1	QB	1980-01-25	\N	\N	f	1	330
988	2	R	1980-01-27	\N	\N	f	13	330
992	1	QB	1980-02-28	\N	\N	f	1	331
991	2	R	1980-03-01	\N	\N	f	13	331
995	1	QB	1980-03-28	\N	\N	f	1	332
994	2	R	1980-03-30	\N	\N	f	13	332
998	1	QB	1980-05-02	\N	\N	f	1	333
997	2	R	1980-05-04	\N	\N	f	13	333
1001	1	QB	1980-05-15	\N	\N	f	1	334
1000	2	R	1980-05-18	\N	\N	f	13	334
1004	1	QB	1980-06-27	\N	\N	f	1	335
1003	2	R	1980-06-29	\N	\N	f	13	335
1007	1	QB	1980-07-11	\N	\N	f	1	336
1006	2	R	1980-07-13	\N	\N	f	13	336
1010	1	QB	1980-08-08	\N	\N	f	1	337
1009	2	R	1980-08-10	\N	\N	f	13	337
1013	1	QB	1980-08-15	\N	\N	f	1	338
1012	2	R	1980-08-17	\N	\N	f	13	338
1016	1	QB	1980-08-29	\N	\N	f	1	339
1015	2	R	1980-08-31	\N	\N	f	13	339
1019	1	QB	1980-09-12	\N	\N	f	1	340
1018	2	R	1980-09-14	\N	\N	f	13	340
1022	1	QB	1980-09-26	\N	\N	f	1	341
1021	2	R	1980-09-28	\N	\N	f	13	341
1025	1	QB	1980-10-03	\N	\N	f	1	342
1024	2	R	1980-10-05	\N	\N	f	13	342
1028	1	QB	1981-03-13	\N	\N	f	1	343
1027	2	R	1981-03-15	\N	\N	f	13	343
1031	1	QB	1981-03-27	\N	\N	f	1	344
1030	2	R	1981-03-29	\N	\N	f	13	344
1034	1	QB	1981-04-10	\N	\N	f	1	345
1033	2	R	1981-04-12	\N	\N	f	13	345
1037	1	QB	1981-05-01	\N	\N	f	1	346
1036	2	R	1981-05-03	\N	\N	f	13	346
1040	1	QB	1981-05-15	\N	\N	f	1	347
1039	2	R	1981-05-17	\N	\N	f	13	347
1043	1	QB	1981-05-28	\N	\N	f	1	348
1042	2	R	1981-05-31	\N	\N	f	13	348
1046	1	QB	1981-06-19	\N	\N	f	1	349
1045	2	R	1981-06-21	\N	\N	f	13	349
1049	1	QB	1981-07-03	\N	\N	f	1	350
1048	2	R	1981-07-05	\N	\N	f	13	350
1052	1	QB	1981-07-16	\N	\N	f	1	351
1051	2	R	1981-07-18	\N	\N	f	13	351
1055	1	QB	1981-07-31	\N	\N	f	1	352
1054	2	R	1981-08-02	\N	\N	f	13	352
1058	1	QB	1981-08-14	\N	\N	f	1	353
1057	2	R	1981-08-16	\N	\N	f	13	353
1061	1	QB	1981-08-28	\N	\N	f	1	354
1060	2	R	1981-08-30	\N	\N	f	13	354
1064	1	QB	1981-09-11	\N	\N	f	1	355
1063	2	R	1981-09-13	\N	\N	f	13	355
1067	1	QB	1981-09-25	\N	\N	f	1	356
1066	2	R	1981-09-27	\N	\N	f	13	356
1070	1	QB	1981-10-15	\N	\N	f	1	357
1069	2	R	1981-10-17	\N	\N	f	13	357
1073	1	QB	1982-01-21	\N	\N	f	1	358
1072	2	R	1982-01-23	\N	\N	f	13	358
1076	1	QB	1982-03-19	\N	\N	f	1	359
1075	2	R	1982-03-21	\N	\N	f	13	359
1079	1	QB	1982-04-02	\N	\N	f	1	360
1078	2	R	1982-04-04	\N	\N	f	13	360
1082	1	QB	1982-04-23	\N	\N	f	1	361
1081	2	R	1982-04-25	\N	\N	f	13	361
1085	1	QB	1982-05-07	\N	\N	f	1	362
1084	2	R	1982-05-09	\N	\N	f	13	362
1088	1	QB	1982-05-20	\N	\N	f	1	363
1087	2	R	1982-05-23	\N	\N	f	13	363
1091	1	QB	1982-06-04	\N	\N	f	1	364
1090	2	R	1982-06-06	\N	\N	f	13	364
1094	1	QB	1982-06-11	\N	\N	f	1	365
1093	2	R	1982-06-13	\N	\N	f	13	365
1097	1	QB	1982-07-01	\N	\N	f	1	366
1096	2	R	1982-07-03	\N	\N	f	13	366
1100	1	QB	1982-07-16	\N	\N	f	1	367
1099	2	R	1982-07-18	\N	\N	f	13	367
1103	1	QB	1982-07-23	\N	\N	f	1	368
1102	2	R	1982-07-25	\N	\N	f	13	368
1106	1	QB	1982-08-06	\N	\N	f	1	369
1105	2	R	1982-08-08	\N	\N	f	13	369
1109	1	QB	1982-08-13	\N	\N	f	1	370
1108	2	R	1982-08-15	\N	\N	f	13	370
1112	1	QB	1982-08-27	\N	\N	f	1	371
1111	2	R	1982-08-29	\N	\N	f	13	371
1115	1	QB	1982-09-10	\N	\N	f	1	372
1114	2	R	1982-09-12	\N	\N	f	13	372
1118	1	QB	1982-09-23	\N	\N	f	1	373
1117	2	R	1982-09-25	\N	\N	f	13	373
1121	1	QB	1983-03-11	\N	\N	f	1	374
1120	2	R	1983-03-13	\N	\N	f	13	374
1124	1	QB	1983-03-25	\N	\N	f	1	375
1123	2	R	1983-03-27	\N	\N	f	13	375
1127	1	QB	1983-04-15	\N	\N	f	1	376
1126	2	R	1983-04-17	\N	\N	f	13	376
1130	1	QB	1983-04-29	\N	\N	f	1	377
1129	2	R	1983-05-01	\N	\N	f	13	377
1133	1	QB	1983-05-12	\N	\N	f	1	378
1132	2	R	1983-05-15	\N	\N	f	13	378
1136	1	QB	1983-05-20	\N	\N	f	1	379
1135	2	R	1983-05-22	\N	\N	f	13	379
1139	1	QB	1983-06-03	\N	\N	f	1	380
1138	2	R	1983-06-05	\N	\N	f	13	380
1142	1	QB	1983-06-10	\N	\N	f	1	381
1141	2	R	1983-06-12	\N	\N	f	13	381
1145	1	QB	1983-07-14	\N	\N	f	1	382
1144	2	R	1983-07-16	\N	\N	f	13	382
1148	1	QB	1983-08-05	\N	\N	f	1	383
1147	2	R	1983-08-07	\N	\N	f	13	383
1151	1	QB	1983-08-12	\N	\N	f	1	384
1150	2	R	1983-08-14	\N	\N	f	13	384
1154	1	QB	1983-08-26	\N	\N	f	1	385
1153	2	R	1983-08-28	\N	\N	f	13	385
1157	1	QB	1983-09-09	\N	\N	f	1	386
1156	2	R	1983-09-11	\N	\N	f	13	386
1160	1	QB	1983-09-23	\N	\N	f	1	387
1159	2	R	1983-09-25	\N	\N	f	13	387
1163	1	QB	1983-10-13	\N	\N	f	1	388
1162	2	R	1983-10-15	\N	\N	f	13	388
1166	1	QB	1984-03-23	\N	\N	f	1	389
1165	2	R	1984-03-25	\N	\N	f	13	389
1169	1	QB	1984-04-05	\N	\N	f	1	390
1168	2	R	1984-04-07	\N	\N	f	13	390
1172	1	QB	1984-04-27	\N	\N	f	1	391
1171	2	R	1984-04-29	\N	\N	f	13	391
1175	1	QB	1984-05-04	\N	\N	f	1	392
1174	2	R	1984-05-06	\N	\N	f	13	392
1178	1	QB	1984-05-18	\N	\N	f	1	393
1177	2	R	1984-05-20	\N	\N	f	13	393
1181	1	QB	1984-05-31	\N	\N	f	1	394
1180	2	R	1984-06-03	\N	\N	f	13	394
1184	1	QB	1984-06-15	\N	\N	f	1	395
1183	2	R	1984-06-17	\N	\N	f	13	395
1187	1	QB	1984-06-22	\N	\N	f	1	396
1186	2	R	1984-06-24	\N	\N	f	13	396
1190	1	QB	1984-07-06	\N	\N	f	1	397
1189	2	R	1984-07-08	\N	\N	f	13	397
1193	1	QB	1984-07-20	\N	\N	f	1	398
1192	2	R	1984-07-22	\N	\N	f	13	398
1196	1	QB	1984-08-03	\N	\N	f	1	399
1195	2	R	1984-08-05	\N	\N	f	13	399
1199	1	QB	1984-08-17	\N	\N	f	1	400
1198	2	R	1984-08-19	\N	\N	f	13	400
1202	1	QB	1984-08-24	\N	\N	f	1	401
1201	2	R	1984-08-26	\N	\N	f	13	401
1205	1	QB	1984-09-07	\N	\N	f	1	402
1204	2	R	1984-09-09	\N	\N	f	13	402
1208	1	QB	1984-10-05	\N	\N	f	1	403
1207	2	R	1984-10-07	\N	\N	f	13	403
1211	1	QB	1984-10-19	\N	\N	f	1	404
1210	2	R	1984-10-21	\N	\N	f	13	404
1214	1	QB	1985-04-05	\N	\N	f	1	405
1213	2	R	1985-04-07	\N	\N	f	13	405
1217	1	QB	1985-04-19	\N	\N	f	1	406
1216	2	R	1985-04-21	\N	\N	f	13	406
1220	1	QB	1985-05-03	\N	\N	f	1	407
1219	2	R	1985-05-05	\N	\N	f	13	407
1223	1	QB	1985-05-16	\N	\N	f	1	408
1222	2	R	1985-05-19	\N	\N	f	13	408
1226	1	QB	1985-06-14	\N	\N	f	1	409
1225	2	R	1985-06-16	\N	\N	f	13	409
1229	1	QB	1985-06-21	\N	\N	f	1	410
1228	2	R	1985-06-23	\N	\N	f	13	410
1232	1	QB	1985-07-05	\N	\N	f	1	411
1231	2	R	1985-07-07	\N	\N	f	13	411
1235	1	QB	1985-07-19	\N	\N	f	1	412
1234	2	R	1985-07-21	\N	\N	f	13	412
1238	1	QB	1985-08-02	\N	\N	f	1	413
1237	2	R	1985-08-04	\N	\N	f	13	413
1241	1	QB	1985-08-16	\N	\N	f	1	414
1240	2	R	1985-08-18	\N	\N	f	13	414
1244	1	QB	1985-08-23	\N	\N	f	1	415
1243	2	R	1985-08-25	\N	\N	f	13	415
1247	1	QB	1985-09-06	\N	\N	f	1	416
1246	2	R	1985-09-08	\N	\N	f	13	416
1250	1	QB	1985-09-13	\N	\N	f	1	417
1249	2	R	1985-09-15	\N	\N	f	13	417
1253	1	QB	1985-10-04	\N	\N	f	1	418
1252	2	R	1985-10-06	\N	\N	f	13	418
1256	1	QB	1985-10-17	\N	\N	f	1	419
1255	2	R	1985-10-19	\N	\N	f	13	419
1259	1	QB	1985-11-01	\N	\N	f	1	420
1258	2	R	1985-11-03	\N	\N	f	13	420
1262	1	QB	1986-03-21	\N	\N	f	1	421
1261	2	R	1986-03-23	\N	\N	f	13	421
1265	1	QB	1986-04-11	\N	\N	f	1	422
1264	2	R	1986-04-13	\N	\N	f	13	422
1268	1	QB	1986-04-25	\N	\N	f	1	423
1267	2	R	1986-04-27	\N	\N	f	13	423
1271	1	QB	1986-05-08	\N	\N	f	1	424
1270	2	R	1986-05-11	\N	\N	f	13	424
1274	1	QB	1986-05-23	\N	\N	f	1	425
1273	2	R	1986-05-25	\N	\N	f	13	425
1277	1	QB	1986-06-13	\N	\N	f	1	426
1276	2	R	1986-06-15	\N	\N	f	13	426
1280	1	QB	1986-06-20	\N	\N	f	1	427
1279	2	R	1986-06-22	\N	\N	f	13	427
1283	1	QB	1986-07-04	\N	\N	f	1	428
1282	2	R	1986-07-06	\N	\N	f	13	428
1286	1	QB	1986-07-11	\N	\N	f	1	429
1285	2	R	1986-07-13	\N	\N	f	13	429
1289	1	QB	1986-07-25	\N	\N	f	1	430
1288	2	R	1986-07-27	\N	\N	f	13	430
1292	1	QB	1986-08-08	\N	\N	f	1	431
1291	2	R	1986-08-10	\N	\N	f	13	431
1295	1	QB	1986-08-15	\N	\N	f	1	432
1294	2	R	1986-08-17	\N	\N	f	13	432
1298	1	QB	1986-09-05	\N	\N	f	1	433
1297	2	R	1986-09-07	\N	\N	f	13	433
1301	1	QB	1986-09-19	\N	\N	f	1	434
1300	2	R	1986-09-21	\N	\N	f	13	434
1304	1	QB	1986-10-10	\N	\N	f	1	435
1303	2	R	1986-10-12	\N	\N	f	13	435
1307	1	QB	1986-10-24	\N	\N	f	1	436
1306	2	R	1986-10-26	\N	\N	f	13	436
1310	1	QB	1987-04-10	\N	\N	f	1	437
1309	2	R	1987-04-12	\N	\N	f	13	437
1313	1	QB	1987-05-01	\N	\N	f	1	438
1312	2	R	1987-05-03	\N	\N	f	13	438
1316	1	QB	1987-05-15	\N	\N	f	1	439
1315	2	R	1987-05-17	\N	\N	f	13	439
1319	1	QB	1987-05-28	\N	\N	f	1	440
1318	2	R	1987-05-31	\N	\N	f	13	440
1322	1	QB	1987-06-19	\N	\N	f	1	441
1321	2	R	1987-06-21	\N	\N	f	13	441
1325	1	QB	1987-07-03	\N	\N	f	1	442
1324	2	R	1987-07-05	\N	\N	f	13	442
1328	1	QB	1987-07-10	\N	\N	f	1	443
1327	2	R	1987-07-12	\N	\N	f	13	443
1331	1	QB	1987-07-24	\N	\N	f	1	444
1330	2	R	1987-07-26	\N	\N	f	13	444
1334	1	QB	1987-08-07	\N	\N	f	1	445
1333	2	R	1987-08-09	\N	\N	f	13	445
1337	1	QB	1987-08-14	\N	\N	f	1	446
1336	2	R	1987-08-16	\N	\N	f	13	446
1340	1	QB	1987-09-04	\N	\N	f	1	447
1339	2	R	1987-09-06	\N	\N	f	13	447
1343	1	QB	1987-09-18	\N	\N	f	1	448
1342	2	R	1987-09-20	\N	\N	f	13	448
1346	1	QB	1987-09-25	\N	\N	f	1	449
1345	2	R	1987-09-27	\N	\N	f	13	449
1349	1	QB	1987-10-16	\N	\N	f	1	450
1348	2	R	1987-10-18	\N	\N	f	13	450
1352	1	QB	1987-10-30	\N	\N	f	1	451
1351	2	R	1987-11-01	\N	\N	f	13	451
1355	1	QB	1987-11-13	\N	\N	f	1	452
1354	2	R	1987-11-15	\N	\N	f	13	452
1358	1	QB	1988-04-01	\N	\N	f	1	453
1357	2	R	1988-04-03	\N	\N	f	13	453
1361	1	QB	1988-04-29	\N	\N	f	1	454
1360	2	R	1988-05-01	\N	\N	f	13	454
1364	1	QB	1988-05-12	\N	\N	f	1	455
1363	2	R	1988-05-15	\N	\N	f	13	455
1367	1	QB	1988-05-27	\N	\N	f	1	456
1366	2	R	1988-05-29	\N	\N	f	13	456
1370	1	QB	1988-06-10	\N	\N	f	1	457
1369	2	R	1988-06-12	\N	\N	f	13	457
1373	1	QB	1988-06-17	\N	\N	f	1	458
1372	2	R	1988-06-19	\N	\N	f	13	458
1376	1	QB	1988-07-01	\N	\N	f	1	459
1375	2	R	1988-07-03	\N	\N	f	13	459
1379	1	QB	1988-07-08	\N	\N	f	1	460
1378	2	R	1988-07-10	\N	\N	f	13	460
1382	1	QB	1988-07-22	\N	\N	f	1	461
1381	2	R	1988-07-24	\N	\N	f	13	461
1385	1	QB	1988-08-05	\N	\N	f	1	462
1384	2	R	1988-08-07	\N	\N	f	13	462
1388	1	QB	1988-08-26	\N	\N	f	1	463
1387	2	R	1988-08-28	\N	\N	f	13	463
1391	1	QB	1988-09-09	\N	\N	f	1	464
1390	2	R	1988-09-11	\N	\N	f	13	464
1394	1	QB	1988-09-23	\N	\N	f	1	465
1393	2	R	1988-09-25	\N	\N	f	13	465
1397	1	QB	1988-09-30	\N	\N	f	1	466
1396	2	R	1988-10-02	\N	\N	f	13	466
1400	1	QB	1988-10-28	\N	\N	f	1	467
1399	2	R	1988-10-30	\N	\N	f	13	467
1403	1	QB	1988-11-11	\N	\N	f	1	468
1402	2	R	1988-11-13	\N	\N	f	13	468
1406	1	QB	1989-03-24	\N	\N	f	1	469
1405	2	R	1989-03-26	\N	\N	f	13	469
1409	1	QB	1989-04-21	\N	\N	f	1	470
1408	2	R	1989-04-23	\N	\N	f	13	470
1412	1	QB	1989-05-04	\N	\N	f	1	471
1411	2	R	1989-05-07	\N	\N	f	13	471
1415	1	QB	1989-05-26	\N	\N	f	1	472
1414	2	R	1989-05-28	\N	\N	f	13	472
1418	1	QB	1989-06-02	\N	\N	f	1	473
1417	2	R	1989-06-04	\N	\N	f	13	473
1421	1	QB	1989-06-16	\N	\N	f	1	474
1420	2	R	1989-06-18	\N	\N	f	13	474
1424	1	QB	1989-07-07	\N	\N	f	1	475
1423	2	R	1989-07-09	\N	\N	f	13	475
1427	1	QB	1989-07-14	\N	\N	f	1	476
1426	2	R	1989-07-16	\N	\N	f	13	476
1430	1	QB	1989-07-28	\N	\N	f	1	477
1429	2	R	1989-07-30	\N	\N	f	13	477
1433	1	QB	1989-08-11	\N	\N	f	1	478
1432	2	R	1989-08-13	\N	\N	f	13	478
1436	1	QB	1989-08-25	\N	\N	f	1	479
1435	2	R	1989-08-27	\N	\N	f	13	479
1439	1	QB	1989-09-08	\N	\N	f	1	480
1438	2	R	1989-09-10	\N	\N	f	13	480
1442	1	QB	1989-09-22	\N	\N	f	1	481
1441	2	R	1989-09-24	\N	\N	f	13	481
1445	1	QB	1989-09-29	\N	\N	f	1	482
1444	2	R	1989-10-01	\N	\N	f	13	482
1448	1	QB	1989-10-20	\N	\N	f	1	483
1447	2	R	1989-10-22	\N	\N	f	13	483
1451	1	QB	1989-11-03	\N	\N	f	1	484
1450	2	R	1989-11-05	\N	\N	f	13	484
1454	1	QB	1990-03-09	\N	\N	f	1	485
1453	2	R	1990-03-11	\N	\N	f	13	485
1457	1	QB	1990-03-23	\N	\N	f	1	486
1456	2	R	1990-03-25	\N	\N	f	13	486
1460	1	QB	1990-05-11	\N	\N	f	1	487
1459	2	R	1990-05-13	\N	\N	f	13	487
1463	1	QB	1990-05-24	\N	\N	f	1	488
1462	2	R	1990-05-27	\N	\N	f	13	488
1466	1	QB	1990-06-08	\N	\N	f	1	489
1465	2	R	1990-06-10	\N	\N	f	13	489
1469	1	QB	1990-06-22	\N	\N	f	1	490
1468	2	R	1990-06-24	\N	\N	f	13	490
1472	1	QB	1990-07-06	\N	\N	f	1	491
1471	2	R	1990-07-08	\N	\N	f	13	491
1475	1	QB	1990-07-13	\N	\N	f	1	492
1474	2	R	1990-07-15	\N	\N	f	13	492
1478	1	QB	1990-07-27	\N	\N	f	1	493
1477	2	R	1990-07-29	\N	\N	f	13	493
1481	1	QB	1990-08-10	\N	\N	f	1	494
1480	2	R	1990-08-12	\N	\N	f	13	494
1484	1	QB	1990-08-24	\N	\N	f	1	495
1483	2	R	1990-08-26	\N	\N	f	13	495
1487	1	QB	1990-09-07	\N	\N	f	1	496
1486	2	R	1990-09-09	\N	\N	f	13	496
1490	1	QB	1990-09-21	\N	\N	f	1	497
1489	2	R	1990-09-23	\N	\N	f	13	497
1493	1	QB	1990-09-28	\N	\N	f	1	498
1492	2	R	1990-09-30	\N	\N	f	13	498
1496	1	QB	1990-10-19	\N	\N	f	1	499
1495	2	R	1990-10-21	\N	\N	f	13	499
1499	1	QB	1990-11-02	\N	\N	f	1	500
1498	2	R	1990-11-04	\N	\N	f	13	500
1502	1	QB	1991-03-08	\N	\N	f	1	501
1501	2	R	1991-03-10	\N	\N	f	14	501
1505	1	QB	1991-03-22	\N	\N	f	1	502
1504	2	R	1991-03-24	\N	\N	f	14	502
1508	1	QB	1991-04-26	\N	\N	f	1	503
1507	2	R	1991-04-28	\N	\N	f	14	503
1511	1	QB	1991-05-09	\N	\N	f	1	504
1510	2	R	1991-05-12	\N	\N	f	14	504
1514	1	QB	1991-05-31	\N	\N	f	1	505
1513	2	R	1991-06-02	\N	\N	f	14	505
1517	1	QB	1991-06-14	\N	\N	f	1	506
1516	2	R	1991-06-16	\N	\N	f	14	506
1520	1	QB	1991-07-05	\N	\N	f	1	507
1519	2	R	1991-07-07	\N	\N	f	14	507
1523	1	QB	1991-07-12	\N	\N	f	1	508
1522	2	R	1991-07-14	\N	\N	f	14	508
1526	1	QB	1991-07-26	\N	\N	f	1	509
1525	2	R	1991-07-28	\N	\N	f	14	509
1529	1	QB	1991-08-09	\N	\N	f	1	510
1528	2	R	1991-08-11	\N	\N	f	14	510
1532	1	QB	1991-08-23	\N	\N	f	1	511
1531	2	R	1991-08-25	\N	\N	f	14	511
1535	1	QB	1991-09-06	\N	\N	f	1	512
1534	2	R	1991-09-08	\N	\N	f	14	512
1538	1	QB	1991-09-20	\N	\N	f	1	513
1537	2	R	1991-09-22	\N	\N	f	14	513
1541	1	QB	1991-09-27	\N	\N	f	1	514
1540	2	R	1991-09-29	\N	\N	f	14	514
1544	1	QB	1991-10-18	\N	\N	f	1	515
1543	2	R	1991-10-20	\N	\N	f	14	515
1547	1	QB	1991-11-01	\N	\N	f	1	516
1546	2	R	1991-11-03	\N	\N	f	14	516
1550	1	QB	1992-02-28	\N	\N	f	1	517
1549	2	R	1992-03-01	\N	\N	f	14	517
1553	1	QB	1992-03-20	\N	\N	f	1	518
1552	2	R	1992-03-22	\N	\N	f	14	518
1556	1	QB	1992-04-03	\N	\N	f	1	519
1555	2	R	1992-04-05	\N	\N	f	14	519
1559	1	QB	1992-05-01	\N	\N	f	1	520
1558	2	R	1992-05-03	\N	\N	f	14	520
1562	1	QB	1992-05-15	\N	\N	f	1	521
1561	2	R	1992-05-17	\N	\N	f	14	521
1565	1	QB	1992-05-28	\N	\N	f	1	522
1564	2	R	1992-05-31	\N	\N	f	14	522
1568	1	QB	1992-06-12	\N	\N	f	1	523
1567	2	R	1992-06-14	\N	\N	f	14	523
1571	1	QB	1992-07-03	\N	\N	f	1	524
1570	2	R	1992-07-05	\N	\N	f	14	524
1574	1	QB	1992-07-10	\N	\N	f	1	525
1573	2	R	1992-07-12	\N	\N	f	14	525
1577	1	QB	1992-07-24	\N	\N	f	1	526
1576	2	R	1992-07-26	\N	\N	f	14	526
1580	1	QB	1992-08-14	\N	\N	f	1	527
1579	2	R	1992-08-16	\N	\N	f	14	527
1583	1	QB	1992-08-28	\N	\N	f	1	528
1582	2	R	1992-08-30	\N	\N	f	14	528
1586	1	QB	1992-09-11	\N	\N	f	1	529
1585	2	R	1992-09-13	\N	\N	f	14	529
1589	1	QB	1992-09-25	\N	\N	f	1	530
1588	2	R	1992-09-27	\N	\N	f	14	530
1592	1	QB	1992-10-23	\N	\N	f	1	531
1591	2	R	1992-10-25	\N	\N	f	14	531
1595	1	QB	1992-11-06	\N	\N	f	1	532
1594	2	R	1992-11-08	\N	\N	f	14	532
1598	1	QB	1993-03-12	\N	\N	f	1	533
1597	2	R	1993-03-14	\N	\N	f	14	533
1601	1	QB	1993-03-26	\N	\N	f	1	534
1600	2	R	1993-03-28	\N	\N	f	14	534
1604	1	QB	1993-04-09	\N	\N	f	1	535
1603	2	R	1993-04-11	\N	\N	f	14	535
1607	1	QB	1993-04-23	\N	\N	f	1	536
1606	2	R	1993-04-25	\N	\N	f	14	536
1610	1	QB	1993-05-07	\N	\N	f	1	537
1609	2	R	1993-05-09	\N	\N	f	14	537
1613	1	QB	1993-05-20	\N	\N	f	1	538
1612	2	R	1993-05-23	\N	\N	f	14	538
1616	1	QB	1993-06-11	\N	\N	f	1	539
1615	2	R	1993-06-13	\N	\N	f	14	539
1619	1	QB	1993-07-02	\N	\N	f	1	540
1618	2	R	1993-07-04	\N	\N	f	14	540
1622	1	QB	1993-07-09	\N	\N	f	1	541
1621	2	R	1993-07-11	\N	\N	f	14	541
1625	1	QB	1993-07-23	\N	\N	f	1	542
1624	2	R	1993-07-25	\N	\N	f	14	542
1628	1	QB	1993-08-13	\N	\N	f	1	543
1627	2	R	1993-08-15	\N	\N	f	14	543
1631	1	QB	1993-08-27	\N	\N	f	1	544
1630	2	R	1993-08-29	\N	\N	f	14	544
1634	1	QB	1993-09-10	\N	\N	f	1	545
1633	2	R	1993-09-12	\N	\N	f	14	545
1637	1	QB	1993-09-24	\N	\N	f	1	546
1636	2	R	1993-09-26	\N	\N	f	14	546
1640	1	QB	1993-10-22	\N	\N	f	1	547
1639	2	R	1993-10-24	\N	\N	f	14	547
1643	1	QB	1993-11-05	\N	\N	f	1	548
1642	2	R	1993-11-07	\N	\N	f	14	548
1646	1	QB	1994-03-25	\N	\N	f	1	549
1645	2	R	1994-03-27	\N	\N	f	14	549
1649	1	QB	1994-04-15	\N	\N	f	1	550
1648	2	R	1994-04-17	\N	\N	f	14	550
1652	1	QB	1994-04-29	\N	\N	f	1	551
1651	2	R	1994-05-01	\N	\N	f	14	551
1655	1	QB	1994-05-12	\N	\N	f	1	552
1654	2	R	1994-05-15	\N	\N	f	14	552
1658	1	QB	1994-05-27	\N	\N	f	1	553
1657	2	R	1994-05-29	\N	\N	f	14	553
1661	1	QB	1994-06-10	\N	\N	f	1	554
1660	2	R	1994-06-12	\N	\N	f	14	554
1664	1	QB	1994-07-01	\N	\N	f	1	555
1663	2	R	1994-07-03	\N	\N	f	14	555
1667	1	QB	1994-07-08	\N	\N	f	1	556
1666	2	R	1994-07-10	\N	\N	f	14	556
1670	1	QB	1994-07-29	\N	\N	f	1	557
1669	2	R	1994-07-31	\N	\N	f	14	557
1673	1	QB	1994-08-12	\N	\N	f	1	558
1672	2	R	1994-08-14	\N	\N	f	14	558
1676	1	QB	1994-08-26	\N	\N	f	1	559
1675	2	R	1994-08-28	\N	\N	f	14	559
1679	1	QB	1994-09-09	\N	\N	f	1	560
1678	2	R	1994-09-11	\N	\N	f	14	560
1682	1	QB	1994-09-23	\N	\N	f	1	561
1681	2	R	1994-09-25	\N	\N	f	14	561
1685	1	QB	1994-10-14	\N	\N	f	1	562
1684	2	R	1994-10-16	\N	\N	f	14	562
1688	1	QB	1994-11-04	\N	\N	f	1	563
1687	2	R	1994-11-06	\N	\N	f	14	563
1691	1	QB	1994-11-11	\N	\N	f	1	564
1690	2	R	1994-11-13	\N	\N	f	14	564
1694	1	QB	1995-03-24	\N	\N	f	1	565
1693	2	R	1995-03-26	\N	\N	f	14	565
1697	1	QB	1995-04-07	\N	\N	f	1	566
1696	2	R	1995-04-09	\N	\N	f	14	566
1700	1	QB	1995-04-28	\N	\N	f	1	567
1699	2	R	1995-04-30	\N	\N	f	14	567
1703	1	QB	1995-05-12	\N	\N	f	1	568
1702	2	R	1995-05-14	\N	\N	f	14	568
1706	1	QB	1995-05-25	\N	\N	f	1	569
1705	2	R	1995-05-28	\N	\N	f	14	569
1709	1	QB	1995-06-09	\N	\N	f	1	570
1708	2	R	1995-06-11	\N	\N	f	14	570
1712	1	QB	1995-06-30	\N	\N	f	1	571
1711	2	R	1995-07-02	\N	\N	f	14	571
1715	1	QB	1995-07-14	\N	\N	f	1	572
1714	2	R	1995-07-16	\N	\N	f	14	572
1718	1	QB	1995-07-28	\N	\N	f	1	573
1717	2	R	1995-07-30	\N	\N	f	14	573
1721	1	QB	1995-08-11	\N	\N	f	1	574
1720	2	R	1995-08-13	\N	\N	f	14	574
1724	1	QB	1995-08-25	\N	\N	f	1	575
1723	2	R	1995-08-27	\N	\N	f	14	575
1727	1	QB	1995-09-08	\N	\N	f	1	576
1726	2	R	1995-09-10	\N	\N	f	14	576
1730	1	QB	1995-09-22	\N	\N	f	1	577
1729	2	R	1995-09-24	\N	\N	f	14	577
1733	1	QB	1995-09-29	\N	\N	f	1	578
1732	2	R	1995-10-01	\N	\N	f	14	578
1736	1	QB	1995-10-20	\N	\N	f	1	579
1735	2	R	1995-10-22	\N	\N	f	14	579
1739	1	QB	1995-10-27	\N	\N	f	1	580
1738	2	R	1995-10-29	\N	\N	f	14	580
1742	1	QB	1995-11-10	\N	\N	f	1	581
1741	2	R	1995-11-12	\N	\N	f	14	581
1745	1	QB	1996-03-09	\N	\N	f	1	582
1744	2	R	1996-03-10	\N	\N	f	14	582
1747	1	QB	1996-03-30	\N	\N	f	1	583
1746	2	R	1996-03-31	\N	\N	f	14	583
1749	1	QB	1996-04-06	\N	\N	f	1	584
1748	2	R	1996-04-07	\N	\N	f	14	584
1751	1	QB	1996-04-27	\N	\N	f	1	585
1750	2	R	1996-04-28	\N	\N	f	14	585
1753	1	QB	1996-05-04	\N	\N	f	1	586
1752	2	R	1996-05-05	\N	\N	f	14	586
1755	1	QB	1996-05-18	\N	\N	f	1	587
1754	2	R	1996-05-19	\N	\N	f	14	587
1757	1	QB	1996-06-01	\N	\N	f	1	588
1756	2	R	1996-06-02	\N	\N	f	14	588
1759	1	QB	1996-06-15	\N	\N	f	1	589
1758	2	R	1996-06-16	\N	\N	f	14	589
1761	1	QB	1996-06-29	\N	\N	f	1	590
1760	2	R	1996-06-30	\N	\N	f	14	590
1763	1	QB	1996-07-13	\N	\N	f	1	591
1762	2	R	1996-07-14	\N	\N	f	14	591
1765	1	QB	1996-07-27	\N	\N	f	1	592
1764	2	R	1996-07-28	\N	\N	f	14	592
1767	1	QB	1996-08-10	\N	\N	f	1	593
1766	2	R	1996-08-11	\N	\N	f	14	593
1769	1	QB	1996-08-24	\N	\N	f	1	594
1768	2	R	1996-08-25	\N	\N	f	14	594
1771	1	QB	1996-09-07	\N	\N	f	1	595
1770	2	R	1996-09-08	\N	\N	f	14	595
1773	1	QB	1996-09-21	\N	\N	f	1	596
1772	2	R	1996-09-22	\N	\N	f	14	596
1775	1	QB	1996-10-12	\N	\N	f	1	597
1774	2	R	1996-10-13	\N	\N	f	14	597
1777	1	QB	1997-03-08	\N	\N	f	1	598
1776	2	R	1997-03-09	\N	\N	f	14	598
1779	1	QB	1997-03-29	\N	\N	f	1	599
1778	2	R	1997-03-30	\N	\N	f	14	599
1781	1	QB	1997-04-12	\N	\N	f	1	600
1780	2	R	1997-04-13	\N	\N	f	14	600
1783	1	QB	1997-04-26	\N	\N	f	1	601
1782	2	R	1997-04-27	\N	\N	f	14	601
1785	1	QB	1997-05-10	\N	\N	f	1	602
1784	2	R	1997-05-11	\N	\N	f	14	602
1787	1	QB	1997-05-24	\N	\N	f	1	603
1786	2	R	1997-05-25	\N	\N	f	14	603
1789	1	QB	1997-06-14	\N	\N	f	1	604
1788	2	R	1997-06-15	\N	\N	f	14	604
1791	1	QB	1997-06-28	\N	\N	f	1	605
1790	2	R	1997-06-29	\N	\N	f	14	605
1793	1	QB	1997-07-12	\N	\N	f	1	606
1792	2	R	1997-07-13	\N	\N	f	14	606
1795	1	QB	1997-07-26	\N	\N	f	1	607
1794	2	R	1997-07-27	\N	\N	f	14	607
1797	1	QB	1997-08-09	\N	\N	f	1	608
1796	2	R	1997-08-10	\N	\N	f	14	608
1799	1	QB	1997-08-23	\N	\N	f	1	609
1798	2	R	1997-08-24	\N	\N	f	14	609
1801	1	QB	1997-09-06	\N	\N	f	1	610
1800	2	R	1997-09-07	\N	\N	f	14	610
1803	1	QB	1997-09-20	\N	\N	f	1	611
1802	2	R	1997-09-21	\N	\N	f	14	611
1805	1	QB	1997-09-27	\N	\N	f	1	612
1804	2	R	1997-09-28	\N	\N	f	14	612
1807	1	QB	1997-10-11	\N	\N	f	1	613
1806	2	R	1997-10-12	\N	\N	f	14	613
1809	1	QB	1997-10-25	\N	\N	f	1	614
1808	2	R	1997-10-26	\N	\N	f	14	614
1811	1	QB	1998-03-07	\N	\N	f	1	615
1810	2	R	1998-03-08	\N	\N	f	14	615
1813	1	QB	1998-03-28	\N	\N	f	1	616
1812	2	R	1998-03-29	\N	\N	f	14	616
1815	1	QB	1998-04-11	\N	\N	f	1	617
1814	2	R	1998-04-12	\N	\N	f	14	617
1817	1	QB	1998-04-25	\N	\N	f	1	618
1816	2	R	1998-04-26	\N	\N	f	14	618
1819	1	QB	1998-05-09	\N	\N	f	1	619
1818	2	R	1998-05-10	\N	\N	f	14	619
1821	1	QB	1998-05-23	\N	\N	f	1	620
1820	2	R	1998-05-24	\N	\N	f	14	620
1823	1	QB	1998-06-06	\N	\N	f	1	621
1822	2	R	1998-06-07	\N	\N	f	14	621
1825	1	QB	1998-06-27	\N	\N	f	1	622
1824	2	R	1998-06-28	\N	\N	f	14	622
1827	1	QB	1998-07-11	\N	\N	f	1	623
1826	2	R	1998-07-12	\N	\N	f	14	623
1829	1	QB	1998-07-25	\N	\N	f	1	624
1828	2	R	1998-07-26	\N	\N	f	14	624
1831	1	QB	1998-08-01	\N	\N	f	1	625
1830	2	R	1998-08-02	\N	\N	f	14	625
1833	1	QB	1998-08-15	\N	\N	f	1	626
1832	2	R	1998-08-16	\N	\N	f	14	626
1835	1	QB	1998-08-29	\N	\N	f	1	627
1834	2	R	1998-08-30	\N	\N	f	14	627
1837	1	QB	1998-09-12	\N	\N	f	1	628
1836	2	R	1998-09-13	\N	\N	f	14	628
1839	1	QB	1998-09-26	\N	\N	f	1	629
1838	2	R	1998-09-27	\N	\N	f	14	629
1841	1	QB	1998-10-31	\N	\N	f	1	630
1840	2	R	1998-11-01	\N	\N	f	14	630
1843	1	QB	1999-03-06	\N	\N	f	1	631
1842	2	R	1999-03-07	\N	\N	f	14	631
1845	1	QB	1999-04-10	\N	\N	f	1	632
1844	2	R	1999-04-11	\N	\N	f	14	632
1847	1	QB	1999-05-01	\N	\N	f	1	633
1846	2	R	1999-05-02	\N	\N	f	14	633
1849	1	QB	1999-05-15	\N	\N	f	1	634
1848	2	R	1999-05-16	\N	\N	f	14	634
1851	1	QB	1999-05-29	\N	\N	f	1	635
1850	2	R	1999-05-30	\N	\N	f	14	635
1853	1	QB	1999-06-12	\N	\N	f	1	636
1852	2	R	1999-06-13	\N	\N	f	14	636
1855	1	QB	1999-06-26	\N	\N	f	1	637
1854	2	R	1999-06-27	\N	\N	f	14	637
1857	1	QB	1999-07-10	\N	\N	f	1	638
1856	2	R	1999-07-11	\N	\N	f	14	638
1859	1	QB	1999-07-24	\N	\N	f	1	639
1858	2	R	1999-07-25	\N	\N	f	14	639
1861	1	QB	1999-07-31	\N	\N	f	1	640
1860	2	R	1999-08-01	\N	\N	f	14	640
1863	1	QB	1999-08-14	\N	\N	f	1	641
1862	2	R	1999-08-15	\N	\N	f	14	641
1865	1	QB	1999-08-28	\N	\N	f	1	642
1864	2	R	1999-08-29	\N	\N	f	14	642
1867	1	QB	1999-09-11	\N	\N	f	1	643
1866	2	R	1999-09-12	\N	\N	f	14	643
1869	1	QB	1999-09-25	\N	\N	f	1	644
1868	2	R	1999-09-26	\N	\N	f	14	644
1871	1	QB	1999-10-16	\N	\N	f	1	645
1870	2	R	1999-10-17	\N	\N	f	14	645
1873	1	QB	1999-10-30	\N	\N	f	1	646
1872	2	R	1999-10-31	\N	\N	f	14	646
1875	1	QB	2000-03-11	\N	\N	f	1	647
1874	2	R	2000-03-12	\N	\N	f	14	647
1877	1	QB	2000-03-25	\N	\N	f	1	648
1876	2	R	2000-03-26	\N	\N	f	14	648
1879	1	QB	2000-04-08	\N	\N	f	1	649
1878	2	R	2000-04-09	\N	\N	f	14	649
1881	1	QB	2000-04-22	\N	\N	f	1	650
1880	2	R	2000-04-23	\N	\N	f	14	650
1883	1	QB	2000-05-06	\N	\N	f	1	651
1882	2	R	2000-05-07	\N	\N	f	14	651
1885	1	QB	2000-05-20	\N	\N	f	1	652
1884	2	R	2000-05-21	\N	\N	f	14	652
1887	1	QB	2000-06-03	\N	\N	f	1	653
1886	2	R	2000-06-04	\N	\N	f	14	653
1889	1	QB	2000-06-17	\N	\N	f	1	654
1888	2	R	2000-06-18	\N	\N	f	14	654
1891	1	QB	2000-07-01	\N	\N	f	1	655
1890	2	R	2000-07-02	\N	\N	f	14	655
1893	1	QB	2000-07-15	\N	\N	f	1	656
1892	2	R	2000-07-16	\N	\N	f	14	656
1895	1	QB	2000-07-29	\N	\N	f	1	657
1894	2	R	2000-07-30	\N	\N	f	14	657
1897	1	QB	2000-08-12	\N	\N	f	1	658
1896	2	R	2000-08-13	\N	\N	f	14	658
1899	1	QB	2000-08-26	\N	\N	f	1	659
1898	2	R	2000-08-27	\N	\N	f	14	659
1901	1	QB	2000-09-09	\N	\N	f	1	660
1900	2	R	2000-09-10	\N	\N	f	14	660
1903	1	QB	2000-09-23	\N	\N	f	1	661
1902	2	R	2000-09-24	\N	\N	f	14	661
1905	1	QB	2000-10-07	\N	\N	f	1	662
1904	2	R	2000-10-08	\N	\N	f	14	662
1907	1	QB	2000-10-21	\N	\N	f	1	663
1906	2	R	2000-10-22	\N	\N	f	14	663
1909	1	QB	2001-03-03	\N	\N	f	1	664
1908	2	R	2001-03-04	\N	\N	f	14	664
1911	1	QB	2001-03-17	\N	\N	f	1	665
1910	2	R	2001-03-18	\N	\N	f	14	665
1913	1	QB	2001-03-31	\N	\N	f	1	666
1912	2	R	2001-04-01	\N	\N	f	14	666
1915	1	QB	2001-04-14	\N	\N	f	1	667
1914	2	R	2001-04-15	\N	\N	f	14	667
1917	1	QB	2001-04-28	\N	\N	f	1	668
1916	2	R	2001-04-29	\N	\N	f	14	668
1919	1	QB	2001-05-12	\N	\N	f	1	669
1918	2	R	2001-05-13	\N	\N	f	14	669
1921	1	QB	2001-05-26	\N	\N	f	1	670
1920	2	R	2001-05-27	\N	\N	f	14	670
1923	1	QB	2001-06-09	\N	\N	f	1	671
1922	2	R	2001-06-10	\N	\N	f	14	671
1925	1	QB	2001-06-23	\N	\N	f	1	672
1924	2	R	2001-06-24	\N	\N	f	14	672
1927	1	QB	2001-06-30	\N	\N	f	1	673
1926	2	R	2001-07-01	\N	\N	f	14	673
1929	1	QB	2001-07-14	\N	\N	f	1	674
1928	2	R	2001-07-15	\N	\N	f	14	674
1931	1	QB	2001-07-28	\N	\N	f	1	675
1930	2	R	2001-07-29	\N	\N	f	14	675
1933	1	QB	2001-08-18	\N	\N	f	1	676
1932	2	R	2001-08-19	\N	\N	f	14	676
1935	1	QB	2001-09-01	\N	\N	f	1	677
1934	2	R	2001-09-02	\N	\N	f	14	677
1937	1	QB	2001-09-15	\N	\N	f	1	678
1936	2	R	2001-09-16	\N	\N	f	14	678
1939	1	QB	2001-09-29	\N	\N	f	1	679
1938	2	R	2001-09-30	\N	\N	f	14	679
1941	1	QB	2001-10-13	\N	\N	f	1	680
1940	2	R	2001-10-14	\N	\N	f	14	680
1943	1	QB	2002-03-02	\N	\N	f	1	681
1942	2	R	2002-03-03	\N	\N	f	14	681
1945	1	QB	2002-03-16	\N	\N	f	1	682
1944	2	R	2002-03-17	\N	\N	f	14	682
1947	1	QB	2002-03-30	\N	\N	f	1	683
1946	2	R	2002-03-31	\N	\N	f	14	683
1949	1	QB	2002-04-13	\N	\N	f	1	684
1948	2	R	2002-04-14	\N	\N	f	14	684
1951	1	QB	2002-04-27	\N	\N	f	1	685
1950	2	R	2002-04-28	\N	\N	f	14	685
1953	1	QB	2002-05-11	\N	\N	f	1	686
1952	2	R	2002-05-12	\N	\N	f	14	686
1955	1	QB	2002-05-25	\N	\N	f	1	687
1954	2	R	2002-05-26	\N	\N	f	14	687
1957	1	QB	2002-06-08	\N	\N	f	1	688
1956	2	R	2002-06-09	\N	\N	f	14	688
1959	1	QB	2002-06-22	\N	\N	f	1	689
1958	2	R	2002-06-23	\N	\N	f	14	689
1961	1	QB	2002-07-06	\N	\N	f	1	690
1960	2	R	2002-07-07	\N	\N	f	14	690
1963	1	QB	2002-07-20	\N	\N	f	1	691
1962	2	R	2002-07-21	\N	\N	f	14	691
1965	1	QB	2002-07-27	\N	\N	f	1	692
1964	2	R	2002-07-28	\N	\N	f	14	692
1967	1	QB	2002-08-17	\N	\N	f	1	693
1966	2	R	2002-08-18	\N	\N	f	14	693
1969	1	QB	2002-08-31	\N	\N	f	1	694
1968	2	R	2002-09-01	\N	\N	f	14	694
1971	1	QB	2002-09-14	\N	\N	f	1	695
1970	2	R	2002-09-15	\N	\N	f	14	695
1973	1	QB	2002-09-28	\N	\N	f	1	696
1972	2	R	2002-09-29	\N	\N	f	14	696
1975	1	QB	2002-10-12	\N	\N	f	1	697
1974	2	R	2002-10-13	\N	\N	f	14	697
1977	1	QO	2003-03-07	\N	\N	f	1	698
1978	2	QB	2003-03-08	\N	\N	f	1	698
1976	3	R	2003-03-09	\N	\N	f	15	698
1980	1	QO	2003-03-21	\N	\N	f	1	699
1981	2	QB	2003-03-22	\N	\N	f	1	699
1979	3	R	2003-03-23	\N	\N	f	15	699
1983	1	QO	2003-04-04	\N	\N	f	1	700
1984	2	QB	2003-04-05	\N	\N	f	1	700
1982	3	R	2003-04-06	\N	\N	f	15	700
1986	1	QO	2003-04-18	\N	\N	f	1	701
1987	2	QB	2003-04-19	\N	\N	f	1	701
1985	3	R	2003-04-20	\N	\N	f	15	701
1989	1	QO	2003-05-02	\N	\N	f	1	702
1990	2	QB	2003-05-03	\N	\N	f	1	702
1988	3	R	2003-05-04	\N	\N	f	15	702
1992	1	QO	2003-05-16	\N	\N	f	1	703
1993	2	QB	2003-05-17	\N	\N	f	1	703
1991	3	R	2003-05-18	\N	\N	f	15	703
1995	1	QO	2003-05-29	\N	\N	f	1	704
1996	2	QB	2003-05-31	\N	\N	f	1	704
1994	3	R	2003-06-01	\N	\N	f	15	704
1998	1	QO	2003-06-13	\N	\N	f	1	705
1999	2	QB	2003-06-14	\N	\N	f	1	705
1997	3	R	2003-06-15	\N	\N	f	15	705
2001	1	QO	2003-06-27	\N	\N	f	1	706
2002	2	QB	2003-06-28	\N	\N	f	1	706
2000	3	R	2003-06-29	\N	\N	f	15	706
2004	1	QO	2003-07-04	\N	\N	f	1	707
2005	2	QB	2003-07-05	\N	\N	f	1	707
2003	3	R	2003-07-06	\N	\N	f	15	707
2007	1	QO	2003-07-18	\N	\N	f	1	708
2008	2	QB	2003-07-19	\N	\N	f	1	708
2006	3	R	2003-07-20	\N	\N	f	15	708
2010	1	QO	2003-08-01	\N	\N	f	1	709
2011	2	QB	2003-08-02	\N	\N	f	1	709
2009	3	R	2003-08-03	\N	\N	f	15	709
2013	1	QO	2003-08-22	\N	\N	f	1	710
2014	2	QB	2003-08-23	\N	\N	f	1	710
2012	3	R	2003-08-24	\N	\N	f	15	710
2016	1	QO	2003-09-12	\N	\N	f	1	711
2017	2	QB	2003-09-13	\N	\N	f	1	711
2015	3	R	2003-09-14	\N	\N	f	15	711
2019	1	QO	2003-09-26	\N	\N	f	1	712
2020	2	QB	2003-09-27	\N	\N	f	1	712
2018	3	R	2003-09-28	\N	\N	f	15	712
2022	1	QO	2003-10-10	\N	\N	f	1	713
2023	2	QB	2003-10-11	\N	\N	f	1	713
2021	3	R	2003-10-12	\N	\N	f	15	713
2025	1	QO	2004-03-06	\N	\N	f	1	714
2026	2	QB	2004-03-06	\N	\N	f	1	714
2024	3	R	2004-03-07	\N	\N	f	15	714
2028	1	QO	2004-03-20	\N	\N	f	1	715
2029	2	QB	2004-03-20	\N	\N	f	1	715
2027	3	R	2004-03-21	\N	\N	f	15	715
2031	1	QO	2004-04-03	\N	\N	f	1	716
2032	2	QB	2004-04-03	\N	\N	f	1	716
2030	3	R	2004-04-04	\N	\N	f	15	716
2034	1	QO	2004-04-24	\N	\N	f	1	717
2035	2	QB	2004-04-24	\N	\N	f	1	717
2033	3	R	2004-04-25	\N	\N	f	15	717
2037	1	QO	2004-05-08	\N	\N	f	1	718
2038	2	QB	2004-05-08	\N	\N	f	1	718
2036	3	R	2004-05-09	\N	\N	f	15	718
2040	1	QO	2004-05-22	\N	\N	f	1	719
2041	2	QB	2004-05-22	\N	\N	f	1	719
2039	3	R	2004-05-23	\N	\N	f	15	719
2043	1	QO	2004-05-29	\N	\N	f	1	720
2044	2	QB	2004-05-29	\N	\N	f	1	720
2042	3	R	2004-05-30	\N	\N	f	15	720
2046	1	QO	2004-06-12	\N	\N	f	1	721
2047	2	QB	2004-06-12	\N	\N	f	1	721
2045	3	R	2004-06-13	\N	\N	f	15	721
2049	1	QO	2004-06-19	\N	\N	f	1	722
2050	2	QB	2004-06-19	\N	\N	f	1	722
2048	3	R	2004-06-20	\N	\N	f	15	722
2052	1	QO	2004-07-03	\N	\N	f	1	723
2053	2	QB	2004-07-03	\N	\N	f	1	723
2051	3	R	2004-07-04	\N	\N	f	15	723
2055	1	QO	2004-07-10	\N	\N	f	1	724
2056	2	QB	2004-07-10	\N	\N	f	1	724
2054	3	R	2004-07-11	\N	\N	f	15	724
2058	1	QO	2004-07-24	\N	\N	f	1	725
2059	2	QB	2004-07-24	\N	\N	f	1	725
2057	3	R	2004-07-25	\N	\N	f	15	725
2061	1	QO	2004-08-14	\N	\N	f	1	726
2062	2	QB	2004-08-14	\N	\N	f	1	726
2060	3	R	2004-08-15	\N	\N	f	15	726
2064	1	QO	2004-08-28	\N	\N	f	1	727
2065	2	QB	2004-08-28	\N	\N	f	1	727
2063	3	R	2004-08-29	\N	\N	f	15	727
2067	1	QO	2004-09-11	\N	\N	f	1	728
2068	2	QB	2004-09-11	\N	\N	f	1	728
2066	3	R	2004-09-12	\N	\N	f	15	728
2070	1	QO	2004-09-25	\N	\N	f	1	729
2071	2	QB	2004-09-25	\N	\N	f	1	729
2069	3	R	2004-09-26	\N	\N	f	15	729
2073	1	QO	2004-10-09	\N	\N	f	1	730
2074	2	QB	2004-10-09	\N	\N	f	1	730
2072	3	R	2004-10-10	\N	\N	f	15	730
2076	1	QO	2004-10-23	\N	\N	f	1	731
2077	2	QB	2004-10-23	\N	\N	f	1	731
2075	3	R	2004-10-24	\N	\N	f	15	731
2079	1	QA	2005-03-05	\N	\N	f	1	732
2078	2	R	2005-03-06	14:00:00	\N	f	15	732
2080	3	QA	2005-03-06	\N	\N	f	1	732
2082	1	QA	2005-03-19	\N	\N	f	1	733
2081	2	R	2005-03-20	15:00:00	\N	f	15	733
2083	3	QA	2005-03-20	\N	\N	f	1	733
2085	1	QA	2005-04-02	\N	\N	f	1	734
2084	2	R	2005-04-03	14:30:00	\N	f	15	734
2086	3	QA	2005-04-03	\N	\N	f	1	734
2088	1	QA	2005-04-23	\N	\N	f	1	735
2087	2	R	2005-04-24	14:00:00	\N	f	15	735
2089	3	QA	2005-04-24	\N	\N	f	1	735
2091	1	QA	2005-05-07	\N	\N	f	1	736
2090	2	R	2005-05-08	14:00:00	\N	f	15	736
2092	3	QA	2005-05-08	\N	\N	f	1	736
2094	1	QA	2005-05-21	\N	\N	f	1	737
2093	2	R	2005-05-22	14:00:00	\N	f	15	737
2095	3	QA	2005-05-22	\N	\N	f	1	737
2097	1	QB	2005-05-28	\N	\N	f	1	738
2096	2	R	2005-05-29	14:00:00	\N	f	15	738
2099	1	QB	2005-06-11	\N	\N	f	1	739
2098	2	R	2005-06-12	13:00:00	\N	f	15	739
2101	1	QB	2005-06-18	\N	\N	f	1	740
2100	2	R	2005-06-19	14:00:00	\N	f	15	740
2103	1	QB	2005-07-02	\N	\N	f	1	741
2102	2	R	2005-07-03	14:00:00	\N	f	15	741
2105	1	QB	2005-07-09	\N	\N	f	1	742
2104	2	R	2005-07-10	14:00:00	\N	f	15	742
2107	1	QB	2005-07-23	\N	\N	f	1	743
2106	2	R	2005-07-24	14:00:00	\N	f	15	743
2109	1	QB	2005-07-30	\N	\N	f	1	744
2108	2	R	2005-07-31	14:00:00	\N	f	15	744
2111	1	QB	2005-08-20	\N	\N	f	1	745
2110	2	R	2005-08-21	15:00:00	\N	f	15	745
2113	1	QB	2005-09-03	\N	\N	f	1	746
2112	2	R	2005-09-04	14:00:00	\N	f	15	746
2115	1	QB	2005-09-10	\N	\N	f	1	747
2114	2	R	2005-09-11	14:00:00	\N	f	15	747
2117	1	QB	2005-09-24	\N	\N	f	1	748
2116	2	R	2005-09-25	14:00:00	\N	f	15	748
2119	1	QB	2005-10-08	\N	\N	f	1	749
2118	2	R	2005-10-09	14:00:00	\N	f	15	749
2121	1	QB	2005-10-15	\N	\N	f	1	750
2120	2	R	2005-10-16	14:00:00	\N	f	15	750
2126	1	FP1	2006-03-10	\N	\N	f	1	751
2127	2	FP2	2006-03-10	\N	\N	f	1	751
2123	3	Q1	2006-03-11	\N	\N	f	1	751
2124	4	Q2	2006-03-11	\N	\N	f	1	751
2125	5	Q3	2006-03-11	\N	\N	f	1	751
2128	6	FP3	2006-03-11	\N	\N	f	1	751
2122	7	R	2006-03-12	14:30:00	\N	f	15	751
2133	1	FP1	2006-03-17	\N	\N	f	1	752
2134	2	FP2	2006-03-17	\N	\N	f	1	752
2130	3	Q1	2006-03-18	\N	\N	f	1	752
2131	4	Q2	2006-03-18	\N	\N	f	1	752
2132	5	Q3	2006-03-18	\N	\N	f	1	752
2135	6	FP3	2006-03-18	\N	\N	f	1	752
2129	7	R	2006-03-19	15:00:00	\N	f	15	752
2140	1	FP1	2006-03-31	\N	\N	f	1	753
2141	2	FP2	2006-03-31	\N	\N	f	1	753
2137	3	Q1	2006-04-01	\N	\N	f	1	753
2138	4	Q2	2006-04-01	\N	\N	f	1	753
2139	5	Q3	2006-04-01	\N	\N	f	1	753
2142	6	FP3	2006-04-01	\N	\N	f	1	753
2136	7	R	2006-04-02	14:00:00	\N	f	15	753
2147	1	FP1	2006-04-21	\N	\N	f	1	754
2148	2	FP2	2006-04-21	\N	\N	f	1	754
2144	3	Q1	2006-04-22	\N	\N	f	1	754
2145	4	Q2	2006-04-22	\N	\N	f	1	754
2146	5	Q3	2006-04-22	\N	\N	f	1	754
2149	6	FP3	2006-04-22	\N	\N	f	1	754
2143	7	R	2006-04-23	14:00:00	\N	f	15	754
2154	1	FP1	2006-05-05	\N	\N	f	1	755
2155	2	FP2	2006-05-05	\N	\N	f	1	755
2151	3	Q1	2006-05-06	\N	\N	f	1	755
2152	4	Q2	2006-05-06	\N	\N	f	1	755
2153	5	Q3	2006-05-06	\N	\N	f	1	755
2156	6	FP3	2006-05-06	\N	\N	f	1	755
2150	7	R	2006-05-07	14:00:00	\N	f	15	755
2161	1	FP1	2006-05-12	\N	\N	f	1	756
2162	2	FP2	2006-05-12	\N	\N	f	1	756
2158	3	Q1	2006-05-13	\N	\N	f	1	756
2159	4	Q2	2006-05-13	\N	\N	f	1	756
2160	5	Q3	2006-05-13	\N	\N	f	1	756
2163	6	FP3	2006-05-13	\N	\N	f	1	756
2157	7	R	2006-05-14	14:00:00	\N	f	15	756
2168	1	FP1	2006-05-25	\N	\N	f	1	757
2169	2	FP2	2006-05-25	\N	\N	f	1	757
2165	3	Q1	2006-05-27	\N	\N	f	1	757
2166	4	Q2	2006-05-27	\N	\N	f	1	757
2167	5	Q3	2006-05-27	\N	\N	f	1	757
2170	6	FP3	2006-05-27	\N	\N	f	1	757
2164	7	R	2006-05-28	14:00:00	\N	f	15	757
2175	1	FP1	2006-06-09	\N	\N	f	1	758
2176	2	FP2	2006-06-09	\N	\N	f	1	758
2172	3	Q1	2006-06-10	\N	\N	f	1	758
2173	4	Q2	2006-06-10	\N	\N	f	1	758
2174	5	Q3	2006-06-10	\N	\N	f	1	758
2177	6	FP3	2006-06-10	\N	\N	f	1	758
2171	7	R	2006-06-11	12:00:00	\N	f	15	758
2182	1	FP1	2006-06-23	\N	\N	f	1	759
2183	2	FP2	2006-06-23	\N	\N	f	1	759
2179	3	Q1	2006-06-24	\N	\N	f	1	759
2180	4	Q2	2006-06-24	\N	\N	f	1	759
2181	5	Q3	2006-06-24	\N	\N	f	1	759
2184	6	FP3	2006-06-24	\N	\N	f	1	759
2178	7	R	2006-06-25	13:00:00	\N	f	15	759
2189	1	FP1	2006-06-30	\N	\N	f	1	760
2190	2	FP2	2006-06-30	\N	\N	f	1	760
2186	3	Q1	2006-07-01	\N	\N	f	1	760
2187	4	Q2	2006-07-01	\N	\N	f	1	760
2188	5	Q3	2006-07-01	\N	\N	f	1	760
2191	6	FP3	2006-07-01	\N	\N	f	1	760
2185	7	R	2006-07-02	14:00:00	\N	f	15	760
2196	1	FP1	2006-07-14	\N	\N	f	1	761
2197	2	FP2	2006-07-14	\N	\N	f	1	761
2193	3	Q1	2006-07-15	\N	\N	f	1	761
2194	4	Q2	2006-07-15	\N	\N	f	1	761
2195	5	Q3	2006-07-15	\N	\N	f	1	761
2198	6	FP3	2006-07-15	\N	\N	f	1	761
2192	7	R	2006-07-16	14:00:00	\N	f	15	761
2203	1	FP1	2006-07-28	\N	\N	f	1	762
2204	2	FP2	2006-07-28	\N	\N	f	1	762
2200	3	Q1	2006-07-29	\N	\N	f	1	762
2201	4	Q2	2006-07-29	\N	\N	f	1	762
2202	5	Q3	2006-07-29	\N	\N	f	1	762
2205	6	FP3	2006-07-29	\N	\N	f	1	762
2199	7	R	2006-07-30	14:00:00	\N	f	15	762
2210	1	FP1	2006-08-04	\N	\N	f	1	763
2211	2	FP2	2006-08-04	\N	\N	f	1	763
2207	3	Q1	2006-08-05	\N	\N	f	1	763
2208	4	Q2	2006-08-05	\N	\N	f	1	763
2209	5	Q3	2006-08-05	\N	\N	f	1	763
2212	6	FP3	2006-08-05	\N	\N	f	1	763
2206	7	R	2006-08-06	14:00:00	\N	f	15	763
2217	1	FP1	2006-08-25	\N	\N	f	1	764
2218	2	FP2	2006-08-25	\N	\N	f	1	764
2214	3	Q1	2006-08-26	\N	\N	f	1	764
2215	4	Q2	2006-08-26	\N	\N	f	1	764
2216	5	Q3	2006-08-26	\N	\N	f	1	764
2219	6	FP3	2006-08-26	\N	\N	f	1	764
2213	7	R	2006-08-27	15:00:00	\N	f	15	764
2224	1	FP1	2006-09-08	\N	\N	f	1	765
2225	2	FP2	2006-09-08	\N	\N	f	1	765
2221	3	Q1	2006-09-09	\N	\N	f	1	765
2222	4	Q2	2006-09-09	\N	\N	f	1	765
2223	5	Q3	2006-09-09	\N	\N	f	1	765
2226	6	FP3	2006-09-09	\N	\N	f	1	765
2220	7	R	2006-09-10	14:00:00	\N	f	15	765
2231	1	FP1	2006-09-29	\N	\N	f	1	766
2232	2	FP2	2006-09-29	\N	\N	f	1	766
2228	3	Q1	2006-09-30	\N	\N	f	1	766
2229	4	Q2	2006-09-30	\N	\N	f	1	766
2230	5	Q3	2006-09-30	\N	\N	f	1	766
2233	6	FP3	2006-09-30	\N	\N	f	1	766
2227	7	R	2006-10-01	14:00:00	\N	f	15	766
2238	1	FP1	2006-10-06	\N	\N	f	1	767
2239	2	FP2	2006-10-06	\N	\N	f	1	767
2235	3	Q1	2006-10-07	\N	\N	f	1	767
2236	4	Q2	2006-10-07	\N	\N	f	1	767
2237	5	Q3	2006-10-07	\N	\N	f	1	767
2240	6	FP3	2006-10-07	\N	\N	f	1	767
2234	7	R	2006-10-08	14:00:00	\N	f	15	767
2245	1	FP1	2006-10-20	\N	\N	f	1	768
2246	2	FP2	2006-10-20	\N	\N	f	1	768
2242	3	Q1	2006-10-21	\N	\N	f	1	768
2243	4	Q2	2006-10-21	\N	\N	f	1	768
2244	5	Q3	2006-10-21	\N	\N	f	1	768
2247	6	FP3	2006-10-21	\N	\N	f	1	768
2241	7	R	2006-10-22	14:00:00	\N	f	15	768
2252	1	FP1	2007-03-16	\N	\N	f	1	769
2253	2	FP2	2007-03-16	\N	\N	f	1	769
2249	3	Q1	2007-03-17	\N	\N	f	1	769
2250	4	Q2	2007-03-17	\N	\N	f	1	769
2251	5	Q3	2007-03-17	\N	\N	f	1	769
2254	6	FP3	2007-03-17	\N	\N	f	1	769
2248	7	R	2007-03-18	03:00:00	\N	f	15	769
2259	1	FP1	2007-04-06	\N	\N	f	1	770
2260	2	FP2	2007-04-06	\N	\N	f	1	770
2256	3	Q1	2007-04-07	\N	\N	f	1	770
2257	4	Q2	2007-04-07	\N	\N	f	1	770
2258	5	Q3	2007-04-07	\N	\N	f	1	770
2261	6	FP3	2007-04-07	\N	\N	f	1	770
2255	7	R	2007-04-08	07:00:00	\N	f	15	770
2266	1	FP1	2007-04-13	\N	\N	f	1	771
2267	2	FP2	2007-04-13	\N	\N	f	1	771
2263	3	Q1	2007-04-14	\N	\N	f	1	771
2264	4	Q2	2007-04-14	\N	\N	f	1	771
2265	5	Q3	2007-04-14	\N	\N	f	1	771
2268	6	FP3	2007-04-14	\N	\N	f	1	771
2262	7	R	2007-04-15	11:30:00	\N	f	15	771
2273	1	FP1	2007-05-11	\N	\N	f	1	772
2274	2	FP2	2007-05-11	\N	\N	f	1	772
2270	3	Q1	2007-05-12	\N	\N	f	1	772
2271	4	Q2	2007-05-12	\N	\N	f	1	772
2272	5	Q3	2007-05-12	\N	\N	f	1	772
2275	6	FP3	2007-05-12	\N	\N	f	1	772
2269	7	R	2007-05-13	12:00:00	\N	f	15	772
2280	1	FP1	2007-05-24	\N	\N	f	1	773
2281	2	FP2	2007-05-24	\N	\N	f	1	773
2277	3	Q1	2007-05-26	\N	\N	f	1	773
2278	4	Q2	2007-05-26	\N	\N	f	1	773
2279	5	Q3	2007-05-26	\N	\N	f	1	773
2282	6	FP3	2007-05-26	\N	\N	f	1	773
2276	7	R	2007-05-27	12:00:00	\N	f	15	773
2287	1	FP1	2007-06-08	\N	\N	f	1	774
2288	2	FP2	2007-06-08	\N	\N	f	1	774
2284	3	Q1	2007-06-09	\N	\N	f	1	774
2285	4	Q2	2007-06-09	\N	\N	f	1	774
2286	5	Q3	2007-06-09	\N	\N	f	1	774
2289	6	FP3	2007-06-09	\N	\N	f	1	774
2283	7	R	2007-06-10	17:00:00	\N	f	15	774
2294	1	FP1	2007-06-15	\N	\N	f	1	775
2295	2	FP2	2007-06-15	\N	\N	f	1	775
2291	3	Q1	2007-06-16	\N	\N	f	1	775
2292	4	Q2	2007-06-16	\N	\N	f	1	775
2293	5	Q3	2007-06-16	\N	\N	f	1	775
2296	6	FP3	2007-06-16	\N	\N	f	1	775
2290	7	R	2007-06-17	17:00:00	\N	f	15	775
2301	1	FP1	2007-06-29	\N	\N	f	1	776
2302	2	FP2	2007-06-29	\N	\N	f	1	776
2298	3	Q1	2007-06-30	\N	\N	f	1	776
2299	4	Q2	2007-06-30	\N	\N	f	1	776
2300	5	Q3	2007-06-30	\N	\N	f	1	776
2303	6	FP3	2007-06-30	\N	\N	f	1	776
2297	7	R	2007-07-01	12:00:00	\N	f	15	776
2308	1	FP1	2007-07-06	\N	\N	f	1	777
2309	2	FP2	2007-07-06	\N	\N	f	1	777
2305	3	Q1	2007-07-07	\N	\N	f	1	777
2306	4	Q2	2007-07-07	\N	\N	f	1	777
2307	5	Q3	2007-07-07	\N	\N	f	1	777
2310	6	FP3	2007-07-07	\N	\N	f	1	777
2304	7	R	2007-07-08	12:00:00	\N	f	15	777
2315	1	FP1	2007-07-20	\N	\N	f	1	778
2316	2	FP2	2007-07-20	\N	\N	f	1	778
2312	3	Q1	2007-07-21	\N	\N	f	1	778
2313	4	Q2	2007-07-21	\N	\N	f	1	778
2314	5	Q3	2007-07-21	\N	\N	f	1	778
2317	6	FP3	2007-07-21	\N	\N	f	1	778
2311	7	R	2007-07-22	12:00:00	\N	f	15	778
2322	1	FP1	2007-08-03	\N	\N	f	1	779
2323	2	FP2	2007-08-03	\N	\N	f	1	779
2319	3	Q1	2007-08-04	\N	\N	f	1	779
2320	4	Q2	2007-08-04	\N	\N	f	1	779
2321	5	Q3	2007-08-04	\N	\N	f	1	779
2324	6	FP3	2007-08-04	\N	\N	f	1	779
2318	7	R	2007-08-05	12:00:00	\N	f	15	779
2329	1	FP1	2007-08-24	\N	\N	f	1	780
2330	2	FP2	2007-08-24	\N	\N	f	1	780
2326	3	Q1	2007-08-25	\N	\N	f	1	780
2327	4	Q2	2007-08-25	\N	\N	f	1	780
2328	5	Q3	2007-08-25	\N	\N	f	1	780
2331	6	FP3	2007-08-25	\N	\N	f	1	780
2325	7	R	2007-08-26	12:00:00	\N	f	15	780
2336	1	FP1	2007-09-07	\N	\N	f	1	781
2337	2	FP2	2007-09-07	\N	\N	f	1	781
2333	3	Q1	2007-09-08	\N	\N	f	1	781
2334	4	Q2	2007-09-08	\N	\N	f	1	781
2335	5	Q3	2007-09-08	\N	\N	f	1	781
2338	6	FP3	2007-09-08	\N	\N	f	1	781
2332	7	R	2007-09-09	12:00:00	\N	f	15	781
2343	1	FP1	2007-09-14	\N	\N	f	1	782
2344	2	FP2	2007-09-14	\N	\N	f	1	782
2340	3	Q1	2007-09-15	\N	\N	f	1	782
2341	4	Q2	2007-09-15	\N	\N	f	1	782
2342	5	Q3	2007-09-15	\N	\N	f	1	782
2345	6	FP3	2007-09-15	\N	\N	f	1	782
2339	7	R	2007-09-16	12:00:00	\N	f	15	782
2350	1	FP1	2007-09-28	\N	\N	f	1	783
2351	2	FP2	2007-09-28	\N	\N	f	1	783
2347	3	Q1	2007-09-29	\N	\N	f	1	783
2348	4	Q2	2007-09-29	\N	\N	f	1	783
2349	5	Q3	2007-09-29	\N	\N	f	1	783
2352	6	FP3	2007-09-29	\N	\N	f	1	783
2346	7	R	2007-09-30	04:30:00	\N	f	15	783
2357	1	FP1	2007-10-05	\N	\N	f	1	784
2358	2	FP2	2007-10-05	\N	\N	f	1	784
2354	3	Q1	2007-10-06	\N	\N	f	1	784
2355	4	Q2	2007-10-06	\N	\N	f	1	784
2356	5	Q3	2007-10-06	\N	\N	f	1	784
2359	6	FP3	2007-10-06	\N	\N	f	1	784
2353	7	R	2007-10-07	06:00:00	\N	f	15	784
2364	1	FP1	2007-10-19	\N	\N	f	1	785
2365	2	FP2	2007-10-19	\N	\N	f	1	785
2361	3	Q1	2007-10-20	\N	\N	f	1	785
2362	4	Q2	2007-10-20	\N	\N	f	1	785
2363	5	Q3	2007-10-20	\N	\N	f	1	785
2366	6	FP3	2007-10-20	\N	\N	f	1	785
2360	7	R	2007-10-21	16:00:00	\N	f	15	785
2371	1	FP1	2008-03-14	\N	\N	f	1	786
2372	2	FP2	2008-03-14	\N	\N	f	1	786
2368	3	Q1	2008-03-15	\N	\N	f	1	786
2369	4	Q2	2008-03-15	\N	\N	f	1	786
2370	5	Q3	2008-03-15	\N	\N	f	1	786
2373	6	FP3	2008-03-15	\N	\N	f	1	786
2367	7	R	2008-03-16	04:30:00	\N	f	15	786
2378	1	FP1	2008-03-21	\N	\N	f	1	787
2379	2	FP2	2008-03-21	\N	\N	f	1	787
2375	3	Q1	2008-03-22	\N	\N	f	1	787
2376	4	Q2	2008-03-22	\N	\N	f	1	787
2377	5	Q3	2008-03-22	\N	\N	f	1	787
2380	6	FP3	2008-03-22	\N	\N	f	1	787
2374	7	R	2008-03-23	07:00:00	\N	f	15	787
2385	1	FP1	2008-04-04	\N	\N	f	1	788
2386	2	FP2	2008-04-04	\N	\N	f	1	788
2382	3	Q1	2008-04-05	\N	\N	f	1	788
2383	4	Q2	2008-04-05	\N	\N	f	1	788
2384	5	Q3	2008-04-05	\N	\N	f	1	788
2387	6	FP3	2008-04-05	\N	\N	f	1	788
2381	7	R	2008-04-06	11:30:00	\N	f	15	788
2392	1	FP1	2008-04-25	\N	\N	f	1	789
2393	2	FP2	2008-04-25	\N	\N	f	1	789
2389	3	Q1	2008-04-26	\N	\N	f	1	789
2390	4	Q2	2008-04-26	\N	\N	f	1	789
2391	5	Q3	2008-04-26	\N	\N	f	1	789
2394	6	FP3	2008-04-26	\N	\N	f	1	789
2388	7	R	2008-04-27	12:00:00	\N	f	15	789
2399	1	FP1	2008-05-09	\N	\N	f	1	790
2400	2	FP2	2008-05-09	\N	\N	f	1	790
2396	3	Q1	2008-05-10	\N	\N	f	1	790
2397	4	Q2	2008-05-10	\N	\N	f	1	790
2398	5	Q3	2008-05-10	\N	\N	f	1	790
2401	6	FP3	2008-05-10	\N	\N	f	1	790
2395	7	R	2008-05-11	12:00:00	\N	f	15	790
2406	1	FP1	2008-05-22	\N	\N	f	1	791
2407	2	FP2	2008-05-22	\N	\N	f	1	791
2403	3	Q1	2008-05-24	\N	\N	f	1	791
2404	4	Q2	2008-05-24	\N	\N	f	1	791
2405	5	Q3	2008-05-24	\N	\N	f	1	791
2408	6	FP3	2008-05-24	\N	\N	f	1	791
2402	7	R	2008-05-25	12:00:00	\N	f	15	791
2413	1	FP1	2008-06-06	\N	\N	f	1	792
2414	2	FP2	2008-06-06	\N	\N	f	1	792
2410	3	Q1	2008-06-07	\N	\N	f	1	792
2411	4	Q2	2008-06-07	\N	\N	f	1	792
2412	5	Q3	2008-06-07	\N	\N	f	1	792
2415	6	FP3	2008-06-07	\N	\N	f	1	792
2409	7	R	2008-06-08	17:00:00	\N	f	15	792
2420	1	FP1	2008-06-20	\N	\N	f	1	793
2421	2	FP2	2008-06-20	\N	\N	f	1	793
2417	3	Q1	2008-06-21	\N	\N	f	1	793
2418	4	Q2	2008-06-21	\N	\N	f	1	793
2419	5	Q3	2008-06-21	\N	\N	f	1	793
2422	6	FP3	2008-06-21	\N	\N	f	1	793
2416	7	R	2008-06-22	12:00:00	\N	f	15	793
2427	1	FP1	2008-07-04	\N	\N	f	1	794
2428	2	FP2	2008-07-04	\N	\N	f	1	794
2424	3	Q1	2008-07-05	\N	\N	f	1	794
2425	4	Q2	2008-07-05	\N	\N	f	1	794
2426	5	Q3	2008-07-05	\N	\N	f	1	794
2429	6	FP3	2008-07-05	\N	\N	f	1	794
2423	7	R	2008-07-06	12:00:00	\N	f	15	794
2434	1	FP1	2008-07-18	\N	\N	f	1	795
2435	2	FP2	2008-07-18	\N	\N	f	1	795
2431	3	Q1	2008-07-19	\N	\N	f	1	795
2432	4	Q2	2008-07-19	\N	\N	f	1	795
2433	5	Q3	2008-07-19	\N	\N	f	1	795
2436	6	FP3	2008-07-19	\N	\N	f	1	795
2430	7	R	2008-07-20	12:00:00	\N	f	15	795
2441	1	FP1	2008-08-01	\N	\N	f	1	796
2442	2	FP2	2008-08-01	\N	\N	f	1	796
2438	3	Q1	2008-08-02	\N	\N	f	1	796
2439	4	Q2	2008-08-02	\N	\N	f	1	796
2440	5	Q3	2008-08-02	\N	\N	f	1	796
2443	6	FP3	2008-08-02	\N	\N	f	1	796
2437	7	R	2008-08-03	12:00:00	\N	f	15	796
2448	1	FP1	2008-08-22	\N	\N	f	1	797
2449	2	FP2	2008-08-22	\N	\N	f	1	797
2445	3	Q1	2008-08-23	\N	\N	f	1	797
2446	4	Q2	2008-08-23	\N	\N	f	1	797
2447	5	Q3	2008-08-23	\N	\N	f	1	797
2450	6	FP3	2008-08-23	\N	\N	f	1	797
2444	7	R	2008-08-24	12:00:00	\N	f	15	797
2455	1	FP1	2008-09-05	\N	\N	f	1	798
2456	2	FP2	2008-09-05	\N	\N	f	1	798
2452	3	Q1	2008-09-06	\N	\N	f	1	798
2453	4	Q2	2008-09-06	\N	\N	f	1	798
2454	5	Q3	2008-09-06	\N	\N	f	1	798
2457	6	FP3	2008-09-06	\N	\N	f	1	798
2451	7	R	2008-09-07	12:00:00	\N	f	15	798
2462	1	FP1	2008-09-12	\N	\N	f	1	799
2463	2	FP2	2008-09-12	\N	\N	f	1	799
2459	3	Q1	2008-09-13	\N	\N	f	1	799
2460	4	Q2	2008-09-13	\N	\N	f	1	799
2461	5	Q3	2008-09-13	\N	\N	f	1	799
2464	6	FP3	2008-09-13	\N	\N	f	1	799
2458	7	R	2008-09-14	12:00:00	\N	f	15	799
2469	1	FP1	2008-09-26	\N	\N	f	1	800
2470	2	FP2	2008-09-26	\N	\N	f	1	800
2466	3	Q1	2008-09-27	\N	\N	f	1	800
2467	4	Q2	2008-09-27	\N	\N	f	1	800
2468	5	Q3	2008-09-27	\N	\N	f	1	800
2471	6	FP3	2008-09-27	\N	\N	f	1	800
2465	7	R	2008-09-28	12:00:00	\N	f	15	800
2476	1	FP1	2008-10-10	\N	\N	f	1	801
2477	2	FP2	2008-10-10	\N	\N	f	1	801
2473	3	Q1	2008-10-11	\N	\N	f	1	801
2474	4	Q2	2008-10-11	\N	\N	f	1	801
2475	5	Q3	2008-10-11	\N	\N	f	1	801
2478	6	FP3	2008-10-11	\N	\N	f	1	801
2472	7	R	2008-10-12	04:30:00	\N	f	15	801
2483	1	FP1	2008-10-17	\N	\N	f	1	802
2484	2	FP2	2008-10-17	\N	\N	f	1	802
2480	3	Q1	2008-10-18	\N	\N	f	1	802
2481	4	Q2	2008-10-18	\N	\N	f	1	802
2482	5	Q3	2008-10-18	\N	\N	f	1	802
2485	6	FP3	2008-10-18	\N	\N	f	1	802
2479	7	R	2008-10-19	07:00:00	\N	f	15	802
2490	1	FP1	2008-10-31	\N	\N	f	1	803
2491	2	FP2	2008-10-31	\N	\N	f	1	803
2487	3	Q1	2008-11-01	\N	\N	f	1	803
2488	4	Q2	2008-11-01	\N	\N	f	1	803
2489	5	Q3	2008-11-01	\N	\N	f	1	803
2492	6	FP3	2008-11-01	\N	\N	f	1	803
2486	7	R	2008-11-02	17:00:00	\N	f	15	803
2497	1	FP1	2009-03-27	\N	\N	f	1	804
2498	2	FP2	2009-03-27	\N	\N	f	1	804
2494	3	Q1	2009-03-28	\N	\N	f	1	804
2495	4	Q2	2009-03-28	\N	\N	f	1	804
2496	5	Q3	2009-03-28	\N	\N	f	1	804
2499	6	FP3	2009-03-28	\N	\N	f	1	804
2493	7	R	2009-03-29	06:00:00	\N	f	15	804
2504	1	FP1	2009-04-03	\N	\N	f	1	805
2505	2	FP2	2009-04-03	\N	\N	f	1	805
2501	3	Q1	2009-04-04	\N	\N	f	1	805
2502	4	Q2	2009-04-04	\N	\N	f	1	805
2503	5	Q3	2009-04-04	\N	\N	f	1	805
2506	6	FP3	2009-04-04	\N	\N	f	1	805
2500	7	R	2009-04-05	09:00:00	\N	f	15	805
2511	1	FP1	2009-04-17	\N	\N	f	1	806
2512	2	FP2	2009-04-17	\N	\N	f	1	806
2508	3	Q1	2009-04-18	\N	\N	f	1	806
2509	4	Q2	2009-04-18	\N	\N	f	1	806
2510	5	Q3	2009-04-18	\N	\N	f	1	806
2513	6	FP3	2009-04-18	\N	\N	f	1	806
2507	7	R	2009-04-19	07:00:00	\N	f	15	806
2518	1	FP1	2009-04-24	\N	\N	f	1	807
2519	2	FP2	2009-04-24	\N	\N	f	1	807
2515	3	Q1	2009-04-25	\N	\N	f	1	807
2516	4	Q2	2009-04-25	\N	\N	f	1	807
2517	5	Q3	2009-04-25	\N	\N	f	1	807
2520	6	FP3	2009-04-25	\N	\N	f	1	807
2514	7	R	2009-04-26	12:00:00	\N	f	15	807
2525	1	FP1	2009-05-08	\N	\N	f	1	808
2526	2	FP2	2009-05-08	\N	\N	f	1	808
2522	3	Q1	2009-05-09	\N	\N	f	1	808
2523	4	Q2	2009-05-09	\N	\N	f	1	808
2524	5	Q3	2009-05-09	\N	\N	f	1	808
2527	6	FP3	2009-05-09	\N	\N	f	1	808
2521	7	R	2009-05-10	12:00:00	\N	f	15	808
2532	1	FP1	2009-05-21	\N	\N	f	1	809
2533	2	FP2	2009-05-21	\N	\N	f	1	809
2529	3	Q1	2009-05-23	\N	\N	f	1	809
2530	4	Q2	2009-05-23	\N	\N	f	1	809
2531	5	Q3	2009-05-23	\N	\N	f	1	809
2534	6	FP3	2009-05-23	\N	\N	f	1	809
2528	7	R	2009-05-24	12:00:00	\N	f	15	809
2539	1	FP1	2009-06-05	\N	\N	f	1	810
2540	2	FP2	2009-06-05	\N	\N	f	1	810
2536	3	Q1	2009-06-06	\N	\N	f	1	810
2537	4	Q2	2009-06-06	\N	\N	f	1	810
2538	5	Q3	2009-06-06	\N	\N	f	1	810
2541	6	FP3	2009-06-06	\N	\N	f	1	810
2535	7	R	2009-06-07	12:00:00	\N	f	15	810
2546	1	FP1	2009-06-19	\N	\N	f	1	811
2547	2	FP2	2009-06-19	\N	\N	f	1	811
2543	3	Q1	2009-06-20	\N	\N	f	1	811
2544	4	Q2	2009-06-20	\N	\N	f	1	811
2545	5	Q3	2009-06-20	\N	\N	f	1	811
2548	6	FP3	2009-06-20	\N	\N	f	1	811
2542	7	R	2009-06-21	12:00:00	\N	f	15	811
2553	1	FP1	2009-07-10	\N	\N	f	1	812
2554	2	FP2	2009-07-10	\N	\N	f	1	812
2550	3	Q1	2009-07-11	\N	\N	f	1	812
2551	4	Q2	2009-07-11	\N	\N	f	1	812
2552	5	Q3	2009-07-11	\N	\N	f	1	812
2555	6	FP3	2009-07-11	\N	\N	f	1	812
2549	7	R	2009-07-12	12:00:00	\N	f	15	812
2560	1	FP1	2009-07-24	\N	\N	f	1	813
2561	2	FP2	2009-07-24	\N	\N	f	1	813
2557	3	Q1	2009-07-25	\N	\N	f	1	813
2558	4	Q2	2009-07-25	\N	\N	f	1	813
2559	5	Q3	2009-07-25	\N	\N	f	1	813
2562	6	FP3	2009-07-25	\N	\N	f	1	813
2556	7	R	2009-07-26	12:00:00	\N	f	15	813
2567	1	FP1	2009-08-21	\N	\N	f	1	814
2568	2	FP2	2009-08-21	\N	\N	f	1	814
2564	3	Q1	2009-08-22	\N	\N	f	1	814
2565	4	Q2	2009-08-22	\N	\N	f	1	814
2566	5	Q3	2009-08-22	\N	\N	f	1	814
2569	6	FP3	2009-08-22	\N	\N	f	1	814
2563	7	R	2009-08-23	12:00:00	\N	f	15	814
2574	1	FP1	2009-08-28	\N	\N	f	1	815
2575	2	FP2	2009-08-28	\N	\N	f	1	815
2571	3	Q1	2009-08-29	\N	\N	f	1	815
2572	4	Q2	2009-08-29	\N	\N	f	1	815
2573	5	Q3	2009-08-29	\N	\N	f	1	815
2576	6	FP3	2009-08-29	\N	\N	f	1	815
2570	7	R	2009-08-30	12:00:00	\N	f	15	815
2581	1	FP1	2009-09-11	\N	\N	f	1	816
2582	2	FP2	2009-09-11	\N	\N	f	1	816
2578	3	Q1	2009-09-12	\N	\N	f	1	816
2579	4	Q2	2009-09-12	\N	\N	f	1	816
2580	5	Q3	2009-09-12	\N	\N	f	1	816
2583	6	FP3	2009-09-12	\N	\N	f	1	816
2577	7	R	2009-09-13	12:00:00	\N	f	15	816
2588	1	FP1	2009-09-25	\N	\N	f	1	817
2589	2	FP2	2009-09-25	\N	\N	f	1	817
2585	3	Q1	2009-09-26	\N	\N	f	1	817
2586	4	Q2	2009-09-26	\N	\N	f	1	817
2587	5	Q3	2009-09-26	\N	\N	f	1	817
2590	6	FP3	2009-09-26	\N	\N	f	1	817
2584	7	R	2009-09-27	12:00:00	\N	f	15	817
2595	1	FP1	2009-10-02	\N	\N	f	1	818
2596	2	FP2	2009-10-02	\N	\N	f	1	818
2592	3	Q1	2009-10-03	\N	\N	f	1	818
2593	4	Q2	2009-10-03	\N	\N	f	1	818
2594	5	Q3	2009-10-03	\N	\N	f	1	818
2597	6	FP3	2009-10-03	\N	\N	f	1	818
2591	7	R	2009-10-04	05:00:00	\N	f	15	818
2602	1	FP1	2009-10-16	\N	\N	f	1	819
2603	2	FP2	2009-10-16	\N	\N	f	1	819
2599	3	Q1	2009-10-17	\N	\N	f	1	819
2600	4	Q2	2009-10-17	\N	\N	f	1	819
2601	5	Q3	2009-10-17	\N	\N	f	1	819
2604	6	FP3	2009-10-17	\N	\N	f	1	819
2598	7	R	2009-10-18	16:00:00	\N	f	15	819
2609	1	FP1	2009-10-30	\N	\N	f	1	820
2610	2	FP2	2009-10-30	\N	\N	f	1	820
2606	3	Q1	2009-10-31	\N	\N	f	1	820
2607	4	Q2	2009-10-31	\N	\N	f	1	820
2608	5	Q3	2009-10-31	\N	\N	f	1	820
2611	6	FP3	2009-10-31	\N	\N	f	1	820
2605	7	R	2009-11-01	11:00:00	\N	f	15	820
2616	1	FP1	2010-03-12	\N	\N	f	1	821
2617	2	FP2	2010-03-12	\N	\N	f	1	821
2613	3	Q1	2010-03-13	\N	\N	f	1	821
2614	4	Q2	2010-03-13	\N	\N	f	1	821
2615	5	Q3	2010-03-13	\N	\N	f	1	821
2618	6	FP3	2010-03-13	\N	\N	f	1	821
2612	7	R	2010-03-14	12:00:00	\N	f	16	821
2623	1	FP1	2010-03-26	\N	\N	f	1	822
2624	2	FP2	2010-03-26	\N	\N	f	1	822
2620	3	Q1	2010-03-27	\N	\N	f	1	822
2621	4	Q2	2010-03-27	\N	\N	f	1	822
2622	5	Q3	2010-03-27	\N	\N	f	1	822
2625	6	FP3	2010-03-27	\N	\N	f	1	822
2619	7	R	2010-03-28	06:00:00	\N	f	16	822
2630	1	FP1	2010-04-02	\N	\N	f	1	823
2631	2	FP2	2010-04-02	\N	\N	f	1	823
2627	3	Q1	2010-04-03	\N	\N	f	1	823
2628	4	Q2	2010-04-03	\N	\N	f	1	823
2629	5	Q3	2010-04-03	\N	\N	f	1	823
2632	6	FP3	2010-04-03	\N	\N	f	1	823
2626	7	R	2010-04-04	08:00:00	\N	f	16	823
2637	1	FP1	2010-04-16	\N	\N	f	1	824
2638	2	FP2	2010-04-16	\N	\N	f	1	824
2634	3	Q1	2010-04-17	\N	\N	f	1	824
2635	4	Q2	2010-04-17	\N	\N	f	1	824
2636	5	Q3	2010-04-17	\N	\N	f	1	824
2639	6	FP3	2010-04-17	\N	\N	f	1	824
2633	7	R	2010-04-18	06:00:00	\N	f	16	824
2644	1	FP1	2010-05-07	\N	\N	f	1	825
2645	2	FP2	2010-05-07	\N	\N	f	1	825
2641	3	Q1	2010-05-08	\N	\N	f	1	825
2642	4	Q2	2010-05-08	\N	\N	f	1	825
2643	5	Q3	2010-05-08	\N	\N	f	1	825
2646	6	FP3	2010-05-08	\N	\N	f	1	825
2640	7	R	2010-05-09	12:00:00	\N	f	16	825
2651	1	FP1	2010-05-13	\N	\N	f	1	826
2652	2	FP2	2010-05-13	\N	\N	f	1	826
2648	3	Q1	2010-05-15	\N	\N	f	1	826
2649	4	Q2	2010-05-15	\N	\N	f	1	826
2650	5	Q3	2010-05-15	\N	\N	f	1	826
2653	6	FP3	2010-05-15	\N	\N	f	1	826
2647	7	R	2010-05-16	12:00:00	\N	f	16	826
2658	1	FP1	2010-05-28	\N	\N	f	1	827
2659	2	FP2	2010-05-28	\N	\N	f	1	827
2655	3	Q1	2010-05-29	\N	\N	f	1	827
2656	4	Q2	2010-05-29	\N	\N	f	1	827
2657	5	Q3	2010-05-29	\N	\N	f	1	827
2660	6	FP3	2010-05-29	\N	\N	f	1	827
2654	7	R	2010-05-30	11:00:00	\N	f	16	827
2665	1	FP1	2010-06-11	\N	\N	f	1	828
2666	2	FP2	2010-06-11	\N	\N	f	1	828
2662	3	Q1	2010-06-12	\N	\N	f	1	828
2663	4	Q2	2010-06-12	\N	\N	f	1	828
2664	5	Q3	2010-06-12	\N	\N	f	1	828
2667	6	FP3	2010-06-12	\N	\N	f	1	828
2661	7	R	2010-06-13	16:00:00	\N	f	16	828
2672	1	FP1	2010-06-25	\N	\N	f	1	829
2673	2	FP2	2010-06-25	\N	\N	f	1	829
2669	3	Q1	2010-06-26	\N	\N	f	1	829
2670	4	Q2	2010-06-26	\N	\N	f	1	829
2671	5	Q3	2010-06-26	\N	\N	f	1	829
2674	6	FP3	2010-06-26	\N	\N	f	1	829
2668	7	R	2010-06-27	12:00:00	\N	f	16	829
2679	1	FP1	2010-07-09	\N	\N	f	1	830
2680	2	FP2	2010-07-09	\N	\N	f	1	830
2676	3	Q1	2010-07-10	\N	\N	f	1	830
2677	4	Q2	2010-07-10	\N	\N	f	1	830
2678	5	Q3	2010-07-10	\N	\N	f	1	830
2681	6	FP3	2010-07-10	\N	\N	f	1	830
2675	7	R	2010-07-11	12:00:00	\N	f	16	830
2686	1	FP1	2010-07-23	\N	\N	f	1	831
2687	2	FP2	2010-07-23	\N	\N	f	1	831
2683	3	Q1	2010-07-24	\N	\N	f	1	831
2684	4	Q2	2010-07-24	\N	\N	f	1	831
2685	5	Q3	2010-07-24	\N	\N	f	1	831
2688	6	FP3	2010-07-24	\N	\N	f	1	831
2682	7	R	2010-07-25	12:00:00	\N	f	16	831
2693	1	FP1	2010-07-30	\N	\N	f	1	832
2694	2	FP2	2010-07-30	\N	\N	f	1	832
2690	3	Q1	2010-07-31	\N	\N	f	1	832
2691	4	Q2	2010-07-31	\N	\N	f	1	832
2692	5	Q3	2010-07-31	\N	\N	f	1	832
2695	6	FP3	2010-07-31	\N	\N	f	1	832
2689	7	R	2010-08-01	12:00:00	\N	f	16	832
2700	1	FP1	2010-08-27	\N	\N	f	1	833
2701	2	FP2	2010-08-27	\N	\N	f	1	833
2697	3	Q1	2010-08-28	\N	\N	f	1	833
2698	4	Q2	2010-08-28	\N	\N	f	1	833
2699	5	Q3	2010-08-28	\N	\N	f	1	833
2702	6	FP3	2010-08-28	\N	\N	f	1	833
2696	7	R	2010-08-29	12:00:00	\N	f	16	833
2707	1	FP1	2010-09-10	\N	\N	f	1	834
2708	2	FP2	2010-09-10	\N	\N	f	1	834
2704	3	Q1	2010-09-11	\N	\N	f	1	834
2705	4	Q2	2010-09-11	\N	\N	f	1	834
2706	5	Q3	2010-09-11	\N	\N	f	1	834
2709	6	FP3	2010-09-11	\N	\N	f	1	834
2703	7	R	2010-09-12	12:00:00	\N	f	16	834
2714	1	FP1	2010-09-24	\N	\N	f	1	835
2715	2	FP2	2010-09-24	\N	\N	f	1	835
2711	3	Q1	2010-09-25	\N	\N	f	1	835
2712	4	Q2	2010-09-25	\N	\N	f	1	835
2713	5	Q3	2010-09-25	\N	\N	f	1	835
2716	6	FP3	2010-09-25	\N	\N	f	1	835
2710	7	R	2010-09-26	12:00:00	\N	f	16	835
2721	1	FP1	2010-10-08	\N	\N	f	1	836
2722	2	FP2	2010-10-08	\N	\N	f	1	836
2718	3	Q1	2010-10-09	\N	\N	f	1	836
2719	4	Q2	2010-10-09	\N	\N	f	1	836
2720	5	Q3	2010-10-09	\N	\N	f	1	836
2723	6	FP3	2010-10-09	\N	\N	f	1	836
2717	7	R	2010-10-10	06:00:00	\N	f	16	836
2728	1	FP1	2010-10-22	\N	\N	f	1	837
2729	2	FP2	2010-10-22	\N	\N	f	1	837
2725	3	Q1	2010-10-23	\N	\N	f	1	837
2726	4	Q2	2010-10-23	\N	\N	f	1	837
2727	5	Q3	2010-10-23	\N	\N	f	1	837
2730	6	FP3	2010-10-23	\N	\N	f	1	837
2724	7	R	2010-10-24	05:00:00	\N	f	16	837
2735	1	FP1	2010-11-05	\N	\N	f	1	838
2736	2	FP2	2010-11-05	\N	\N	f	1	838
2732	3	Q1	2010-11-06	\N	\N	f	1	838
2733	4	Q2	2010-11-06	\N	\N	f	1	838
2734	5	Q3	2010-11-06	\N	\N	f	1	838
2737	6	FP3	2010-11-06	\N	\N	f	1	838
2731	7	R	2010-11-07	16:00:00	\N	f	16	838
2742	1	FP1	2010-11-12	\N	\N	f	1	839
2743	2	FP2	2010-11-12	\N	\N	f	1	839
2739	3	Q1	2010-11-13	\N	\N	f	1	839
2740	4	Q2	2010-11-13	\N	\N	f	1	839
2741	5	Q3	2010-11-13	\N	\N	f	1	839
2744	6	FP3	2010-11-13	\N	\N	f	1	839
2738	7	R	2010-11-14	13:00:00	\N	f	16	839
2749	1	FP1	2011-03-25	\N	\N	f	1	840
2750	2	FP2	2011-03-25	\N	\N	f	1	840
2746	3	Q1	2011-03-26	\N	\N	f	1	840
2747	4	Q2	2011-03-26	\N	\N	f	1	840
2748	5	Q3	2011-03-26	\N	\N	f	1	840
2751	6	FP3	2011-03-26	\N	\N	f	1	840
2745	7	R	2011-03-27	06:00:00	\N	f	16	840
2756	1	FP1	2011-04-08	\N	\N	f	1	841
2757	2	FP2	2011-04-08	\N	\N	f	1	841
2753	3	Q1	2011-04-09	\N	\N	f	1	841
2754	4	Q2	2011-04-09	\N	\N	f	1	841
2755	5	Q3	2011-04-09	\N	\N	f	1	841
2758	6	FP3	2011-04-09	\N	\N	f	1	841
2752	7	R	2011-04-10	08:00:00	\N	f	16	841
2763	1	FP1	2011-04-15	\N	\N	f	1	842
2764	2	FP2	2011-04-15	\N	\N	f	1	842
2760	3	Q1	2011-04-16	\N	\N	f	1	842
2761	4	Q2	2011-04-16	\N	\N	f	1	842
2762	5	Q3	2011-04-16	\N	\N	f	1	842
2765	6	FP3	2011-04-16	\N	\N	f	1	842
2759	7	R	2011-04-17	07:00:00	\N	f	16	842
2770	1	FP1	2011-05-06	\N	\N	f	1	843
2771	2	FP2	2011-05-06	\N	\N	f	1	843
2767	3	Q1	2011-05-07	\N	\N	f	1	843
2768	4	Q2	2011-05-07	\N	\N	f	1	843
2769	5	Q3	2011-05-07	\N	\N	f	1	843
2772	6	FP3	2011-05-07	\N	\N	f	1	843
2766	7	R	2011-05-08	12:00:00	\N	f	16	843
2777	1	FP1	2011-05-20	\N	\N	f	1	844
2778	2	FP2	2011-05-20	\N	\N	f	1	844
2774	3	Q1	2011-05-21	\N	\N	f	1	844
2775	4	Q2	2011-05-21	\N	\N	f	1	844
2776	5	Q3	2011-05-21	\N	\N	f	1	844
2779	6	FP3	2011-05-21	\N	\N	f	1	844
2773	7	R	2011-05-22	12:00:00	\N	f	16	844
2784	1	FP1	2011-05-26	\N	\N	f	1	845
2785	2	FP2	2011-05-26	\N	\N	f	1	845
2781	3	Q1	2011-05-28	\N	\N	f	1	845
2782	4	Q2	2011-05-28	\N	\N	f	1	845
2783	5	Q3	2011-05-28	\N	\N	f	1	845
2786	6	FP3	2011-05-28	\N	\N	f	1	845
2780	7	R	2011-05-29	12:00:00	\N	f	16	845
2791	1	FP1	2011-06-10	\N	\N	f	1	846
2792	2	FP2	2011-06-10	\N	\N	f	1	846
2788	3	Q1	2011-06-11	\N	\N	f	1	846
2789	4	Q2	2011-06-11	\N	\N	f	1	846
2790	5	Q3	2011-06-11	\N	\N	f	1	846
2793	6	FP3	2011-06-11	\N	\N	f	1	846
2787	7	R	2011-06-12	17:00:00	\N	f	16	846
2798	1	FP1	2011-06-24	\N	\N	f	1	847
2799	2	FP2	2011-06-24	\N	\N	f	1	847
2795	3	Q1	2011-06-25	\N	\N	f	1	847
2796	4	Q2	2011-06-25	\N	\N	f	1	847
2797	5	Q3	2011-06-25	\N	\N	f	1	847
2800	6	FP3	2011-06-25	\N	\N	f	1	847
2794	7	R	2011-06-26	12:00:00	\N	f	16	847
2805	1	FP1	2011-07-08	\N	\N	f	1	848
2806	2	FP2	2011-07-08	\N	\N	f	1	848
2802	3	Q1	2011-07-09	\N	\N	f	1	848
2803	4	Q2	2011-07-09	\N	\N	f	1	848
2804	5	Q3	2011-07-09	\N	\N	f	1	848
2807	6	FP3	2011-07-09	\N	\N	f	1	848
2801	7	R	2011-07-10	12:00:00	\N	f	16	848
2812	1	FP1	2011-07-22	\N	\N	f	1	849
2813	2	FP2	2011-07-22	\N	\N	f	1	849
2809	3	Q1	2011-07-23	\N	\N	f	1	849
2810	4	Q2	2011-07-23	\N	\N	f	1	849
2811	5	Q3	2011-07-23	\N	\N	f	1	849
2814	6	FP3	2011-07-23	\N	\N	f	1	849
2808	7	R	2011-07-24	12:00:00	\N	f	16	849
2819	1	FP1	2011-07-29	\N	\N	f	1	850
2820	2	FP2	2011-07-29	\N	\N	f	1	850
2816	3	Q1	2011-07-30	\N	\N	f	1	850
2817	4	Q2	2011-07-30	\N	\N	f	1	850
2818	5	Q3	2011-07-30	\N	\N	f	1	850
2821	6	FP3	2011-07-30	\N	\N	f	1	850
2815	7	R	2011-07-31	12:00:00	\N	f	16	850
2826	1	FP1	2011-08-26	\N	\N	f	1	851
2827	2	FP2	2011-08-26	\N	\N	f	1	851
2823	3	Q1	2011-08-27	\N	\N	f	1	851
2824	4	Q2	2011-08-27	\N	\N	f	1	851
2825	5	Q3	2011-08-27	\N	\N	f	1	851
2828	6	FP3	2011-08-27	\N	\N	f	1	851
2822	7	R	2011-08-28	12:00:00	\N	f	16	851
2833	1	FP1	2011-09-09	\N	\N	f	1	852
2834	2	FP2	2011-09-09	\N	\N	f	1	852
2830	3	Q1	2011-09-10	\N	\N	f	1	852
2831	4	Q2	2011-09-10	\N	\N	f	1	852
2832	5	Q3	2011-09-10	\N	\N	f	1	852
2835	6	FP3	2011-09-10	\N	\N	f	1	852
2829	7	R	2011-09-11	12:00:00	\N	f	16	852
2840	1	FP1	2011-09-23	\N	\N	f	1	853
2841	2	FP2	2011-09-23	\N	\N	f	1	853
2837	3	Q1	2011-09-24	\N	\N	f	1	853
2838	4	Q2	2011-09-24	\N	\N	f	1	853
2839	5	Q3	2011-09-24	\N	\N	f	1	853
2842	6	FP3	2011-09-24	\N	\N	f	1	853
2836	7	R	2011-09-25	12:00:00	\N	f	16	853
2847	1	FP1	2011-10-07	\N	\N	f	1	854
2848	2	FP2	2011-10-07	\N	\N	f	1	854
2844	3	Q1	2011-10-08	\N	\N	f	1	854
2845	4	Q2	2011-10-08	\N	\N	f	1	854
2846	5	Q3	2011-10-08	\N	\N	f	1	854
2849	6	FP3	2011-10-08	\N	\N	f	1	854
2843	7	R	2011-10-09	06:00:00	\N	f	16	854
2854	1	FP1	2011-10-14	\N	\N	f	1	855
2855	2	FP2	2011-10-14	\N	\N	f	1	855
2851	3	Q1	2011-10-15	\N	\N	f	1	855
2852	4	Q2	2011-10-15	\N	\N	f	1	855
2853	5	Q3	2011-10-15	\N	\N	f	1	855
2856	6	FP3	2011-10-15	\N	\N	f	1	855
2850	7	R	2011-10-16	06:00:00	\N	f	16	855
2861	1	FP1	2011-10-28	\N	\N	f	1	856
2862	2	FP2	2011-10-28	\N	\N	f	1	856
2858	3	Q1	2011-10-29	\N	\N	f	1	856
2859	4	Q2	2011-10-29	\N	\N	f	1	856
2860	5	Q3	2011-10-29	\N	\N	f	1	856
2863	6	FP3	2011-10-29	\N	\N	f	1	856
2857	7	R	2011-10-30	09:30:00	\N	f	16	856
2868	1	FP1	2011-11-11	\N	\N	f	1	857
2869	2	FP2	2011-11-11	\N	\N	f	1	857
2865	3	Q1	2011-11-12	\N	\N	f	1	857
2866	4	Q2	2011-11-12	\N	\N	f	1	857
2867	5	Q3	2011-11-12	\N	\N	f	1	857
2870	6	FP3	2011-11-12	\N	\N	f	1	857
2864	7	R	2011-11-13	13:00:00	\N	f	16	857
2875	1	FP1	2011-11-25	\N	\N	f	1	858
2876	2	FP2	2011-11-25	\N	\N	f	1	858
2872	3	Q1	2011-11-26	\N	\N	f	1	858
2873	4	Q2	2011-11-26	\N	\N	f	1	858
2874	5	Q3	2011-11-26	\N	\N	f	1	858
2877	6	FP3	2011-11-26	\N	\N	f	1	858
2871	7	R	2011-11-27	16:00:00	\N	f	16	858
2882	1	FP1	2012-03-16	\N	\N	f	1	859
2883	2	FP2	2012-03-16	\N	\N	f	1	859
2879	3	Q1	2012-03-17	\N	\N	f	1	859
2880	4	Q2	2012-03-17	\N	\N	f	1	859
2881	5	Q3	2012-03-17	\N	\N	f	1	859
2884	6	FP3	2012-03-17	\N	\N	f	1	859
2878	7	R	2012-03-18	06:00:00	\N	f	16	859
2889	1	FP1	2012-03-23	\N	\N	f	1	860
2890	2	FP2	2012-03-23	\N	\N	f	1	860
2886	3	Q1	2012-03-24	\N	\N	f	1	860
2887	4	Q2	2012-03-24	\N	\N	f	1	860
2888	5	Q3	2012-03-24	\N	\N	f	1	860
2891	6	FP3	2012-03-24	\N	\N	f	1	860
2885	7	R	2012-03-25	08:00:00	\N	f	16	860
2896	1	FP1	2012-04-13	\N	\N	f	1	861
2897	2	FP2	2012-04-13	\N	\N	f	1	861
2893	3	Q1	2012-04-14	\N	\N	f	1	861
2894	4	Q2	2012-04-14	\N	\N	f	1	861
2895	5	Q3	2012-04-14	\N	\N	f	1	861
2898	6	FP3	2012-04-14	\N	\N	f	1	861
2892	7	R	2012-04-15	07:00:00	\N	f	16	861
2903	1	FP1	2012-04-20	\N	\N	f	1	862
2904	2	FP2	2012-04-20	\N	\N	f	1	862
2900	3	Q1	2012-04-21	\N	\N	f	1	862
2901	4	Q2	2012-04-21	\N	\N	f	1	862
2902	5	Q3	2012-04-21	\N	\N	f	1	862
2905	6	FP3	2012-04-21	\N	\N	f	1	862
2899	7	R	2012-04-22	12:00:00	\N	f	16	862
2910	1	FP1	2012-05-11	\N	\N	f	1	863
2911	2	FP2	2012-05-11	\N	\N	f	1	863
2907	3	Q1	2012-05-12	\N	\N	f	1	863
2908	4	Q2	2012-05-12	\N	\N	f	1	863
2909	5	Q3	2012-05-12	\N	\N	f	1	863
2912	6	FP3	2012-05-12	\N	\N	f	1	863
2906	7	R	2012-05-13	12:00:00	\N	f	16	863
2917	1	FP1	2012-05-24	\N	\N	f	1	864
2918	2	FP2	2012-05-24	\N	\N	f	1	864
2914	3	Q1	2012-05-26	\N	\N	f	1	864
2915	4	Q2	2012-05-26	\N	\N	f	1	864
2916	5	Q3	2012-05-26	\N	\N	f	1	864
2919	6	FP3	2012-05-26	\N	\N	f	1	864
2913	7	R	2012-05-27	12:00:00	\N	f	16	864
2924	1	FP1	2012-06-08	\N	\N	f	1	865
2925	2	FP2	2012-06-08	\N	\N	f	1	865
2921	3	Q1	2012-06-09	\N	\N	f	1	865
2922	4	Q2	2012-06-09	\N	\N	f	1	865
2923	5	Q3	2012-06-09	\N	\N	f	1	865
2926	6	FP3	2012-06-09	\N	\N	f	1	865
2920	7	R	2012-06-10	18:00:00	\N	f	16	865
2931	1	FP1	2012-06-22	\N	\N	f	1	866
2932	2	FP2	2012-06-22	\N	\N	f	1	866
2928	3	Q1	2012-06-23	\N	\N	f	1	866
2929	4	Q2	2012-06-23	\N	\N	f	1	866
2930	5	Q3	2012-06-23	\N	\N	f	1	866
2933	6	FP3	2012-06-23	\N	\N	f	1	866
2927	7	R	2012-06-24	12:00:00	\N	f	16	866
2938	1	FP1	2012-07-06	\N	\N	f	1	867
2939	2	FP2	2012-07-06	\N	\N	f	1	867
2935	3	Q1	2012-07-07	\N	\N	f	1	867
2936	4	Q2	2012-07-07	\N	\N	f	1	867
2937	5	Q3	2012-07-07	\N	\N	f	1	867
2940	6	FP3	2012-07-07	\N	\N	f	1	867
2934	7	R	2012-07-08	12:00:00	\N	f	16	867
2945	1	FP1	2012-07-20	\N	\N	f	1	868
2946	2	FP2	2012-07-20	\N	\N	f	1	868
2942	3	Q1	2012-07-21	\N	\N	f	1	868
2943	4	Q2	2012-07-21	\N	\N	f	1	868
2944	5	Q3	2012-07-21	\N	\N	f	1	868
2947	6	FP3	2012-07-21	\N	\N	f	1	868
2941	7	R	2012-07-22	12:00:00	\N	f	16	868
2952	1	FP1	2012-07-27	\N	\N	f	1	869
2953	2	FP2	2012-07-27	\N	\N	f	1	869
2949	3	Q1	2012-07-28	\N	\N	f	1	869
2950	4	Q2	2012-07-28	\N	\N	f	1	869
2951	5	Q3	2012-07-28	\N	\N	f	1	869
2954	6	FP3	2012-07-28	\N	\N	f	1	869
2948	7	R	2012-07-29	12:00:00	\N	f	16	869
2959	1	FP1	2012-08-31	\N	\N	f	1	870
2960	2	FP2	2012-08-31	\N	\N	f	1	870
2956	3	Q1	2012-09-01	\N	\N	f	1	870
2957	4	Q2	2012-09-01	\N	\N	f	1	870
2958	5	Q3	2012-09-01	\N	\N	f	1	870
2961	6	FP3	2012-09-01	\N	\N	f	1	870
2955	7	R	2012-09-02	12:00:00	\N	f	16	870
2966	1	FP1	2012-09-07	\N	\N	f	1	871
2967	2	FP2	2012-09-07	\N	\N	f	1	871
2963	3	Q1	2012-09-08	\N	\N	f	1	871
2964	4	Q2	2012-09-08	\N	\N	f	1	871
2965	5	Q3	2012-09-08	\N	\N	f	1	871
2968	6	FP3	2012-09-08	\N	\N	f	1	871
2962	7	R	2012-09-09	12:00:00	\N	f	16	871
2973	1	FP1	2012-09-21	\N	\N	f	1	872
2974	2	FP2	2012-09-21	\N	\N	f	1	872
2970	3	Q1	2012-09-22	\N	\N	f	1	872
2971	4	Q2	2012-09-22	\N	\N	f	1	872
2972	5	Q3	2012-09-22	\N	\N	f	1	872
2975	6	FP3	2012-09-22	\N	\N	f	1	872
2969	7	R	2012-09-23	12:00:00	\N	f	16	872
2980	1	FP1	2012-10-05	\N	\N	f	1	873
2981	2	FP2	2012-10-05	\N	\N	f	1	873
2977	3	Q1	2012-10-06	\N	\N	f	1	873
2978	4	Q2	2012-10-06	\N	\N	f	1	873
2979	5	Q3	2012-10-06	\N	\N	f	1	873
2982	6	FP3	2012-10-06	\N	\N	f	1	873
2976	7	R	2012-10-07	06:00:00	\N	f	16	873
2987	1	FP1	2012-10-12	\N	\N	f	1	874
2988	2	FP2	2012-10-12	\N	\N	f	1	874
2984	3	Q1	2012-10-13	\N	\N	f	1	874
2985	4	Q2	2012-10-13	\N	\N	f	1	874
2986	5	Q3	2012-10-13	\N	\N	f	1	874
2989	6	FP3	2012-10-13	\N	\N	f	1	874
2983	7	R	2012-10-14	06:00:00	\N	f	16	874
2994	1	FP1	2012-10-26	\N	\N	f	1	875
2995	2	FP2	2012-10-26	\N	\N	f	1	875
2991	3	Q1	2012-10-27	\N	\N	f	1	875
2992	4	Q2	2012-10-27	\N	\N	f	1	875
2993	5	Q3	2012-10-27	\N	\N	f	1	875
2996	6	FP3	2012-10-27	\N	\N	f	1	875
2990	7	R	2012-10-28	09:30:00	\N	f	16	875
3001	1	FP1	2012-11-02	\N	\N	f	1	876
3002	2	FP2	2012-11-02	\N	\N	f	1	876
2998	3	Q1	2012-11-03	\N	\N	f	1	876
2999	4	Q2	2012-11-03	\N	\N	f	1	876
3000	5	Q3	2012-11-03	\N	\N	f	1	876
3003	6	FP3	2012-11-03	\N	\N	f	1	876
2997	7	R	2012-11-04	13:00:00	\N	f	16	876
3008	1	FP1	2012-11-16	\N	\N	f	1	877
3009	2	FP2	2012-11-16	\N	\N	f	1	877
3005	3	Q1	2012-11-17	\N	\N	f	1	877
3006	4	Q2	2012-11-17	\N	\N	f	1	877
3007	5	Q3	2012-11-17	\N	\N	f	1	877
3010	6	FP3	2012-11-17	\N	\N	f	1	877
3004	7	R	2012-11-18	19:00:00	\N	f	16	877
3015	1	FP1	2012-11-23	\N	\N	f	1	878
3016	2	FP2	2012-11-23	\N	\N	f	1	878
3012	3	Q1	2012-11-24	\N	\N	f	1	878
3013	4	Q2	2012-11-24	\N	\N	f	1	878
3014	5	Q3	2012-11-24	\N	\N	f	1	878
3017	6	FP3	2012-11-24	\N	\N	f	1	878
3011	7	R	2012-11-25	16:00:00	\N	f	16	878
3022	1	FP1	2013-03-15	\N	\N	f	1	879
3023	2	FP2	2013-03-15	\N	\N	f	1	879
3019	3	Q1	2013-03-16	\N	\N	f	1	879
3020	4	Q2	2013-03-16	\N	\N	f	1	879
3021	5	Q3	2013-03-16	\N	\N	f	1	879
3024	6	FP3	2013-03-16	\N	\N	f	1	879
3018	7	R	2013-03-17	06:00:00	\N	f	16	879
3029	1	FP1	2013-03-22	\N	\N	f	1	880
3030	2	FP2	2013-03-22	\N	\N	f	1	880
3026	3	Q1	2013-03-23	\N	\N	f	1	880
3027	4	Q2	2013-03-23	\N	\N	f	1	880
3028	5	Q3	2013-03-23	\N	\N	f	1	880
3031	6	FP3	2013-03-23	\N	\N	f	1	880
3025	7	R	2013-03-24	08:00:00	\N	f	16	880
3036	1	FP1	2013-04-12	\N	\N	f	1	881
3037	2	FP2	2013-04-12	\N	\N	f	1	881
3033	3	Q1	2013-04-13	\N	\N	f	1	881
3034	4	Q2	2013-04-13	\N	\N	f	1	881
3035	5	Q3	2013-04-13	\N	\N	f	1	881
3038	6	FP3	2013-04-13	\N	\N	f	1	881
3032	7	R	2013-04-14	07:00:00	\N	f	16	881
3043	1	FP1	2013-04-19	\N	\N	f	1	882
3044	2	FP2	2013-04-19	\N	\N	f	1	882
3040	3	Q1	2013-04-20	\N	\N	f	1	882
3041	4	Q2	2013-04-20	\N	\N	f	1	882
3042	5	Q3	2013-04-20	\N	\N	f	1	882
3045	6	FP3	2013-04-20	\N	\N	f	1	882
3039	7	R	2013-04-21	12:00:00	\N	f	16	882
3050	1	FP1	2013-05-10	\N	\N	f	1	883
3051	2	FP2	2013-05-10	\N	\N	f	1	883
3047	3	Q1	2013-05-11	\N	\N	f	1	883
3048	4	Q2	2013-05-11	\N	\N	f	1	883
3049	5	Q3	2013-05-11	\N	\N	f	1	883
3052	6	FP3	2013-05-11	\N	\N	f	1	883
3046	7	R	2013-05-12	12:00:00	\N	f	16	883
3057	1	FP1	2013-05-23	\N	\N	f	1	884
3058	2	FP2	2013-05-23	\N	\N	f	1	884
3054	3	Q1	2013-05-25	\N	\N	f	1	884
3055	4	Q2	2013-05-25	\N	\N	f	1	884
3056	5	Q3	2013-05-25	\N	\N	f	1	884
3059	6	FP3	2013-05-25	\N	\N	f	1	884
3053	7	R	2013-05-26	12:00:00	\N	f	16	884
3064	1	FP1	2013-06-07	\N	\N	f	1	885
3065	2	FP2	2013-06-07	\N	\N	f	1	885
3061	3	Q1	2013-06-08	\N	\N	f	1	885
3062	4	Q2	2013-06-08	\N	\N	f	1	885
3063	5	Q3	2013-06-08	\N	\N	f	1	885
3066	6	FP3	2013-06-08	\N	\N	f	1	885
3060	7	R	2013-06-09	18:00:00	\N	f	16	885
3071	1	FP1	2013-06-28	\N	\N	f	1	886
3072	2	FP2	2013-06-28	\N	\N	f	1	886
3068	3	Q1	2013-06-29	\N	\N	f	1	886
3069	4	Q2	2013-06-29	\N	\N	f	1	886
3070	5	Q3	2013-06-29	\N	\N	f	1	886
3073	6	FP3	2013-06-29	\N	\N	f	1	886
3067	7	R	2013-06-30	12:00:00	\N	f	16	886
3078	1	FP1	2013-07-05	\N	\N	f	1	887
3079	2	FP2	2013-07-05	\N	\N	f	1	887
3075	3	Q1	2013-07-06	\N	\N	f	1	887
3076	4	Q2	2013-07-06	\N	\N	f	1	887
3077	5	Q3	2013-07-06	\N	\N	f	1	887
3080	6	FP3	2013-07-06	\N	\N	f	1	887
3074	7	R	2013-07-07	12:00:00	\N	f	16	887
3085	1	FP1	2013-07-26	\N	\N	f	1	888
3086	2	FP2	2013-07-26	\N	\N	f	1	888
3082	3	Q1	2013-07-27	\N	\N	f	1	888
3083	4	Q2	2013-07-27	\N	\N	f	1	888
3084	5	Q3	2013-07-27	\N	\N	f	1	888
3087	6	FP3	2013-07-27	\N	\N	f	1	888
3081	7	R	2013-07-28	12:00:00	\N	f	16	888
3092	1	FP1	2013-08-23	\N	\N	f	1	889
3093	2	FP2	2013-08-23	\N	\N	f	1	889
3089	3	Q1	2013-08-24	\N	\N	f	1	889
3090	4	Q2	2013-08-24	\N	\N	f	1	889
3091	5	Q3	2013-08-24	\N	\N	f	1	889
3094	6	FP3	2013-08-24	\N	\N	f	1	889
3088	7	R	2013-08-25	12:00:00	\N	f	16	889
3099	1	FP1	2013-09-06	\N	\N	f	1	890
3100	2	FP2	2013-09-06	\N	\N	f	1	890
3096	3	Q1	2013-09-07	\N	\N	f	1	890
3097	4	Q2	2013-09-07	\N	\N	f	1	890
3098	5	Q3	2013-09-07	\N	\N	f	1	890
3101	6	FP3	2013-09-07	\N	\N	f	1	890
3095	7	R	2013-09-08	12:00:00	\N	f	16	890
3106	1	FP1	2013-09-20	\N	\N	f	1	891
3107	2	FP2	2013-09-20	\N	\N	f	1	891
3103	3	Q1	2013-09-21	\N	\N	f	1	891
3104	4	Q2	2013-09-21	\N	\N	f	1	891
3105	5	Q3	2013-09-21	\N	\N	f	1	891
3108	6	FP3	2013-09-21	\N	\N	f	1	891
3102	7	R	2013-09-22	12:00:00	\N	f	16	891
3113	1	FP1	2013-10-04	\N	\N	f	1	892
3114	2	FP2	2013-10-04	\N	\N	f	1	892
3110	3	Q1	2013-10-05	\N	\N	f	1	892
3111	4	Q2	2013-10-05	\N	\N	f	1	892
3112	5	Q3	2013-10-05	\N	\N	f	1	892
3115	6	FP3	2013-10-05	\N	\N	f	1	892
3109	7	R	2013-10-06	06:00:00	\N	f	16	892
3120	1	FP1	2013-10-11	\N	\N	f	1	893
3121	2	FP2	2013-10-11	\N	\N	f	1	893
3117	3	Q1	2013-10-12	\N	\N	f	1	893
3118	4	Q2	2013-10-12	\N	\N	f	1	893
3119	5	Q3	2013-10-12	\N	\N	f	1	893
3122	6	FP3	2013-10-12	\N	\N	f	1	893
3116	7	R	2013-10-13	06:00:00	\N	f	16	893
3127	1	FP1	2013-10-25	\N	\N	f	1	894
3128	2	FP2	2013-10-25	\N	\N	f	1	894
3124	3	Q1	2013-10-26	\N	\N	f	1	894
3125	4	Q2	2013-10-26	\N	\N	f	1	894
3126	5	Q3	2013-10-26	\N	\N	f	1	894
3129	6	FP3	2013-10-26	\N	\N	f	1	894
3123	7	R	2013-10-27	09:30:00	\N	f	16	894
3134	1	FP1	2013-11-01	\N	\N	f	1	895
3135	2	FP2	2013-11-01	\N	\N	f	1	895
3131	3	Q1	2013-11-02	\N	\N	f	1	895
3132	4	Q2	2013-11-02	\N	\N	f	1	895
3133	5	Q3	2013-11-02	\N	\N	f	1	895
3136	6	FP3	2013-11-02	\N	\N	f	1	895
3130	7	R	2013-11-03	13:00:00	\N	f	16	895
3141	1	FP1	2013-11-15	\N	\N	f	1	896
3142	2	FP2	2013-11-15	\N	\N	f	1	896
3138	3	Q1	2013-11-16	\N	\N	f	1	896
3139	4	Q2	2013-11-16	\N	\N	f	1	896
3140	5	Q3	2013-11-16	\N	\N	f	1	896
3143	6	FP3	2013-11-16	\N	\N	f	1	896
3137	7	R	2013-11-17	19:00:00	\N	f	16	896
3148	1	FP1	2013-11-22	\N	\N	f	1	897
3149	2	FP2	2013-11-22	\N	\N	f	1	897
3145	3	Q1	2013-11-23	\N	\N	f	1	897
3146	4	Q2	2013-11-23	\N	\N	f	1	897
3147	5	Q3	2013-11-23	\N	\N	f	1	897
3150	6	FP3	2013-11-23	\N	\N	f	1	897
3144	7	R	2013-11-24	16:00:00	\N	f	16	897
3155	1	FP1	2014-03-14	\N	\N	f	1	898
3156	2	FP2	2014-03-14	\N	\N	f	1	898
3152	3	Q1	2014-03-15	\N	\N	f	1	898
3153	4	Q2	2014-03-15	\N	\N	f	1	898
3154	5	Q3	2014-03-15	\N	\N	f	1	898
3157	6	FP3	2014-03-15	\N	\N	f	1	898
3151	7	R	2014-03-16	06:00:00	\N	f	16	898
3162	1	FP1	2014-03-28	\N	\N	f	1	899
3163	2	FP2	2014-03-28	\N	\N	f	1	899
3159	3	Q1	2014-03-29	\N	\N	f	1	899
3160	4	Q2	2014-03-29	\N	\N	f	1	899
3161	5	Q3	2014-03-29	\N	\N	f	1	899
3164	6	FP3	2014-03-29	\N	\N	f	1	899
3158	7	R	2014-03-30	08:00:00	\N	f	16	899
3169	1	FP1	2014-04-04	\N	\N	f	1	900
3170	2	FP2	2014-04-04	\N	\N	f	1	900
3166	3	Q1	2014-04-05	\N	\N	f	1	900
3167	4	Q2	2014-04-05	\N	\N	f	1	900
3168	5	Q3	2014-04-05	\N	\N	f	1	900
3171	6	FP3	2014-04-05	\N	\N	f	1	900
3165	7	R	2014-04-06	15:00:00	\N	f	16	900
3176	1	FP1	2014-04-18	\N	\N	f	1	901
3177	2	FP2	2014-04-18	\N	\N	f	1	901
3173	3	Q1	2014-04-19	\N	\N	f	1	901
3174	4	Q2	2014-04-19	\N	\N	f	1	901
3175	5	Q3	2014-04-19	\N	\N	f	1	901
3178	6	FP3	2014-04-19	\N	\N	f	1	901
3172	7	R	2014-04-20	07:00:00	\N	f	16	901
3183	1	FP1	2014-05-09	\N	\N	f	1	902
3184	2	FP2	2014-05-09	\N	\N	f	1	902
3180	3	Q1	2014-05-10	\N	\N	f	1	902
3181	4	Q2	2014-05-10	\N	\N	f	1	902
3182	5	Q3	2014-05-10	\N	\N	f	1	902
3185	6	FP3	2014-05-10	\N	\N	f	1	902
3179	7	R	2014-05-11	12:00:00	\N	f	16	902
3190	1	FP1	2014-05-22	\N	\N	f	1	903
3191	2	FP2	2014-05-22	\N	\N	f	1	903
3187	3	Q1	2014-05-24	\N	\N	f	1	903
3188	4	Q2	2014-05-24	\N	\N	f	1	903
3189	5	Q3	2014-05-24	\N	\N	f	1	903
3192	6	FP3	2014-05-24	\N	\N	f	1	903
3186	7	R	2014-05-25	12:00:00	\N	f	16	903
3197	1	FP1	2014-06-06	\N	\N	f	1	904
3198	2	FP2	2014-06-06	\N	\N	f	1	904
3194	3	Q1	2014-06-07	\N	\N	f	1	904
3195	4	Q2	2014-06-07	\N	\N	f	1	904
3196	5	Q3	2014-06-07	\N	\N	f	1	904
3199	6	FP3	2014-06-07	\N	\N	f	1	904
3193	7	R	2014-06-08	18:00:00	\N	f	16	904
3204	1	FP1	2014-06-20	\N	\N	f	1	905
3205	2	FP2	2014-06-20	\N	\N	f	1	905
3201	3	Q1	2014-06-21	\N	\N	f	1	905
3202	4	Q2	2014-06-21	\N	\N	f	1	905
3203	5	Q3	2014-06-21	\N	\N	f	1	905
3206	6	FP3	2014-06-21	\N	\N	f	1	905
3200	7	R	2014-06-22	12:00:00	\N	f	16	905
3211	1	FP1	2014-07-04	\N	\N	f	1	906
3212	2	FP2	2014-07-04	\N	\N	f	1	906
3208	3	Q1	2014-07-05	\N	\N	f	1	906
3209	4	Q2	2014-07-05	\N	\N	f	1	906
3210	5	Q3	2014-07-05	\N	\N	f	1	906
3213	6	FP3	2014-07-05	\N	\N	f	1	906
3207	7	R	2014-07-06	12:00:00	\N	f	16	906
3218	1	FP1	2014-07-18	\N	\N	f	1	907
3219	2	FP2	2014-07-18	\N	\N	f	1	907
3215	3	Q1	2014-07-19	\N	\N	f	1	907
3216	4	Q2	2014-07-19	\N	\N	f	1	907
3217	5	Q3	2014-07-19	\N	\N	f	1	907
3220	6	FP3	2014-07-19	\N	\N	f	1	907
3214	7	R	2014-07-20	12:00:00	\N	f	16	907
3225	1	FP1	2014-07-25	\N	\N	f	1	908
3226	2	FP2	2014-07-25	\N	\N	f	1	908
3222	3	Q1	2014-07-26	\N	\N	f	1	908
3223	4	Q2	2014-07-26	\N	\N	f	1	908
3224	5	Q3	2014-07-26	\N	\N	f	1	908
3227	6	FP3	2014-07-26	\N	\N	f	1	908
3221	7	R	2014-07-27	12:00:00	\N	f	16	908
3232	1	FP1	2014-08-22	\N	\N	f	1	909
3233	2	FP2	2014-08-22	\N	\N	f	1	909
3229	3	Q1	2014-08-23	\N	\N	f	1	909
3230	4	Q2	2014-08-23	\N	\N	f	1	909
3231	5	Q3	2014-08-23	\N	\N	f	1	909
3234	6	FP3	2014-08-23	\N	\N	f	1	909
3228	7	R	2014-08-24	12:00:00	\N	f	16	909
3239	1	FP1	2014-09-05	\N	\N	f	1	910
3240	2	FP2	2014-09-05	\N	\N	f	1	910
3236	3	Q1	2014-09-06	\N	\N	f	1	910
3237	4	Q2	2014-09-06	\N	\N	f	1	910
3238	5	Q3	2014-09-06	\N	\N	f	1	910
3241	6	FP3	2014-09-06	\N	\N	f	1	910
3235	7	R	2014-09-07	12:00:00	\N	f	16	910
3246	1	FP1	2014-09-19	\N	\N	f	1	911
3247	2	FP2	2014-09-19	\N	\N	f	1	911
3243	3	Q1	2014-09-20	\N	\N	f	1	911
3244	4	Q2	2014-09-20	\N	\N	f	1	911
3245	5	Q3	2014-09-20	\N	\N	f	1	911
3248	6	FP3	2014-09-20	\N	\N	f	1	911
3242	7	R	2014-09-21	12:00:00	\N	f	16	911
3253	1	FP1	2014-10-03	\N	\N	f	1	912
3254	2	FP2	2014-10-03	\N	\N	f	1	912
3250	3	Q1	2014-10-04	\N	\N	f	1	912
3251	4	Q2	2014-10-04	\N	\N	f	1	912
3252	5	Q3	2014-10-04	\N	\N	f	1	912
3255	6	FP3	2014-10-04	\N	\N	f	1	912
3249	7	R	2014-10-05	06:00:00	\N	f	16	912
3260	1	FP1	2014-10-10	\N	\N	f	1	913
3261	2	FP2	2014-10-10	\N	\N	f	1	913
3257	3	Q1	2014-10-11	\N	\N	f	1	913
3258	4	Q2	2014-10-11	\N	\N	f	1	913
3259	5	Q3	2014-10-11	\N	\N	f	1	913
3262	6	FP3	2014-10-11	\N	\N	f	1	913
3256	7	R	2014-10-12	11:00:00	\N	f	16	913
3267	1	FP1	2014-10-31	\N	\N	f	1	914
3268	2	FP2	2014-10-31	\N	\N	f	1	914
3264	3	Q1	2014-11-01	\N	\N	f	1	914
3265	4	Q2	2014-11-01	\N	\N	f	1	914
3266	5	Q3	2014-11-01	\N	\N	f	1	914
3269	6	FP3	2014-11-01	\N	\N	f	1	914
3263	7	R	2014-11-02	20:00:00	\N	f	16	914
3274	1	FP1	2014-11-07	\N	\N	f	1	915
3275	2	FP2	2014-11-07	\N	\N	f	1	915
3271	3	Q1	2014-11-08	\N	\N	f	1	915
3272	4	Q2	2014-11-08	\N	\N	f	1	915
3273	5	Q3	2014-11-08	\N	\N	f	1	915
3276	6	FP3	2014-11-08	\N	\N	f	1	915
3270	7	R	2014-11-09	16:00:00	\N	f	16	915
3281	1	FP1	2014-11-21	\N	\N	f	1	916
3282	2	FP2	2014-11-21	\N	\N	f	1	916
3278	3	Q1	2014-11-22	\N	\N	f	1	916
3279	4	Q2	2014-11-22	\N	\N	f	1	916
3280	5	Q3	2014-11-22	\N	\N	f	1	916
3283	6	FP3	2014-11-22	\N	\N	f	1	916
3277	7	R	2014-11-23	13:00:00	\N	f	16	916
3288	1	FP1	2015-03-13	\N	\N	f	1	917
3289	2	FP2	2015-03-13	\N	\N	f	1	917
3285	3	Q1	2015-03-14	\N	\N	f	1	917
3286	4	Q2	2015-03-14	\N	\N	f	1	917
3287	5	Q3	2015-03-14	\N	\N	f	1	917
3290	6	FP3	2015-03-14	\N	\N	f	1	917
3284	7	R	2015-03-15	05:00:00	\N	f	16	917
3295	1	FP1	2015-03-27	\N	\N	f	1	918
3296	2	FP2	2015-03-27	\N	\N	f	1	918
3292	3	Q1	2015-03-28	\N	\N	f	1	918
3293	4	Q2	2015-03-28	\N	\N	f	1	918
3294	5	Q3	2015-03-28	\N	\N	f	1	918
3297	6	FP3	2015-03-28	\N	\N	f	1	918
3291	7	R	2015-03-29	07:00:00	\N	f	16	918
3302	1	FP1	2015-04-10	\N	\N	f	1	919
3303	2	FP2	2015-04-10	\N	\N	f	1	919
3299	3	Q1	2015-04-11	\N	\N	f	1	919
3300	4	Q2	2015-04-11	\N	\N	f	1	919
3301	5	Q3	2015-04-11	\N	\N	f	1	919
3304	6	FP3	2015-04-11	\N	\N	f	1	919
3298	7	R	2015-04-12	06:00:00	\N	f	16	919
3309	1	FP1	2015-04-17	\N	\N	f	1	920
3310	2	FP2	2015-04-17	\N	\N	f	1	920
3306	3	Q1	2015-04-18	\N	\N	f	1	920
3307	4	Q2	2015-04-18	\N	\N	f	1	920
3308	5	Q3	2015-04-18	\N	\N	f	1	920
3311	6	FP3	2015-04-18	\N	\N	f	1	920
3305	7	R	2015-04-19	15:00:00	\N	f	16	920
3316	1	FP1	2015-05-08	\N	\N	f	1	921
3317	2	FP2	2015-05-08	\N	\N	f	1	921
3313	3	Q1	2015-05-09	\N	\N	f	1	921
3314	4	Q2	2015-05-09	\N	\N	f	1	921
3315	5	Q3	2015-05-09	\N	\N	f	1	921
3318	6	FP3	2015-05-09	\N	\N	f	1	921
3312	7	R	2015-05-10	12:00:00	\N	f	16	921
3323	1	FP1	2015-05-21	\N	\N	f	1	922
3324	2	FP2	2015-05-21	\N	\N	f	1	922
3320	3	Q1	2015-05-23	\N	\N	f	1	922
3321	4	Q2	2015-05-23	\N	\N	f	1	922
3322	5	Q3	2015-05-23	\N	\N	f	1	922
3325	6	FP3	2015-05-23	\N	\N	f	1	922
3319	7	R	2015-05-24	12:00:00	\N	f	16	922
3330	1	FP1	2015-06-05	\N	\N	f	1	923
3331	2	FP2	2015-06-05	\N	\N	f	1	923
3327	3	Q1	2015-06-06	\N	\N	f	1	923
3328	4	Q2	2015-06-06	\N	\N	f	1	923
3329	5	Q3	2015-06-06	\N	\N	f	1	923
3332	6	FP3	2015-06-06	\N	\N	f	1	923
3326	7	R	2015-06-07	18:00:00	\N	f	16	923
3337	1	FP1	2015-06-19	\N	\N	f	1	924
3338	2	FP2	2015-06-19	\N	\N	f	1	924
3334	3	Q1	2015-06-20	\N	\N	f	1	924
3335	4	Q2	2015-06-20	\N	\N	f	1	924
3336	5	Q3	2015-06-20	\N	\N	f	1	924
3339	6	FP3	2015-06-20	\N	\N	f	1	924
3333	7	R	2015-06-21	12:00:00	\N	f	16	924
3344	1	FP1	2015-07-03	\N	\N	f	1	925
3345	2	FP2	2015-07-03	\N	\N	f	1	925
3341	3	Q1	2015-07-04	\N	\N	f	1	925
3342	4	Q2	2015-07-04	\N	\N	f	1	925
3343	5	Q3	2015-07-04	\N	\N	f	1	925
3346	6	FP3	2015-07-04	\N	\N	f	1	925
3340	7	R	2015-07-05	12:00:00	\N	f	16	925
3351	1	FP1	2015-07-24	\N	\N	f	1	926
3352	2	FP2	2015-07-24	\N	\N	f	1	926
3348	3	Q1	2015-07-25	\N	\N	f	1	926
3349	4	Q2	2015-07-25	\N	\N	f	1	926
3350	5	Q3	2015-07-25	\N	\N	f	1	926
3353	6	FP3	2015-07-25	\N	\N	f	1	926
3347	7	R	2015-07-26	12:00:00	\N	f	16	926
3358	1	FP1	2015-08-21	\N	\N	f	1	927
3359	2	FP2	2015-08-21	\N	\N	f	1	927
3355	3	Q1	2015-08-22	\N	\N	f	1	927
3356	4	Q2	2015-08-22	\N	\N	f	1	927
3357	5	Q3	2015-08-22	\N	\N	f	1	927
3360	6	FP3	2015-08-22	\N	\N	f	1	927
3354	7	R	2015-08-23	12:00:00	\N	f	16	927
3365	1	FP1	2015-09-04	\N	\N	f	1	928
3366	2	FP2	2015-09-04	\N	\N	f	1	928
3362	3	Q1	2015-09-05	\N	\N	f	1	928
3363	4	Q2	2015-09-05	\N	\N	f	1	928
3364	5	Q3	2015-09-05	\N	\N	f	1	928
3367	6	FP3	2015-09-05	\N	\N	f	1	928
3361	7	R	2015-09-06	12:00:00	\N	f	16	928
3372	1	FP1	2015-09-18	\N	\N	f	1	929
3373	2	FP2	2015-09-18	\N	\N	f	1	929
3369	3	Q1	2015-09-19	\N	\N	f	1	929
3370	4	Q2	2015-09-19	\N	\N	f	1	929
3371	5	Q3	2015-09-19	\N	\N	f	1	929
3374	6	FP3	2015-09-19	\N	\N	f	1	929
3368	7	R	2015-09-20	12:00:00	\N	f	16	929
3379	1	FP1	2015-09-25	\N	\N	f	1	930
3380	2	FP2	2015-09-25	\N	\N	f	1	930
3376	3	Q1	2015-09-26	\N	\N	f	1	930
3377	4	Q2	2015-09-26	\N	\N	f	1	930
3378	5	Q3	2015-09-26	\N	\N	f	1	930
3381	6	FP3	2015-09-26	\N	\N	f	1	930
3375	7	R	2015-09-27	05:00:00	\N	f	16	930
3386	1	FP1	2015-10-09	\N	\N	f	1	931
3387	2	FP2	2015-10-09	\N	\N	f	1	931
3383	3	Q1	2015-10-10	\N	\N	f	1	931
3384	4	Q2	2015-10-10	\N	\N	f	1	931
3385	5	Q3	2015-10-10	\N	\N	f	1	931
3388	6	FP3	2015-10-10	\N	\N	f	1	931
3382	7	R	2015-10-11	11:00:00	\N	f	16	931
3393	1	FP1	2015-10-23	\N	\N	f	1	932
3394	2	FP2	2015-10-23	\N	\N	f	1	932
3390	3	Q1	2015-10-24	\N	\N	f	1	932
3391	4	Q2	2015-10-24	\N	\N	f	1	932
3392	5	Q3	2015-10-24	\N	\N	f	1	932
3395	6	FP3	2015-10-24	\N	\N	f	1	932
3389	7	R	2015-10-25	19:00:00	\N	f	16	932
3400	1	FP1	2015-10-30	\N	\N	f	1	933
3401	2	FP2	2015-10-30	\N	\N	f	1	933
3397	3	Q1	2015-10-31	\N	\N	f	1	933
3398	4	Q2	2015-10-31	\N	\N	f	1	933
3399	5	Q3	2015-10-31	\N	\N	f	1	933
3402	6	FP3	2015-10-31	\N	\N	f	1	933
3396	7	R	2015-11-01	19:00:00	\N	f	16	933
3407	1	FP1	2015-11-13	\N	\N	f	1	934
3408	2	FP2	2015-11-13	\N	\N	f	1	934
3404	3	Q1	2015-11-14	\N	\N	f	1	934
3405	4	Q2	2015-11-14	\N	\N	f	1	934
3406	5	Q3	2015-11-14	\N	\N	f	1	934
3409	6	FP3	2015-11-14	\N	\N	f	1	934
3403	7	R	2015-11-15	16:00:00	\N	f	16	934
3414	1	FP1	2015-11-27	\N	\N	f	1	935
3415	2	FP2	2015-11-27	\N	\N	f	1	935
3411	3	Q1	2015-11-28	\N	\N	f	1	935
3412	4	Q2	2015-11-28	\N	\N	f	1	935
3413	5	Q3	2015-11-28	\N	\N	f	1	935
3416	6	FP3	2015-11-28	\N	\N	f	1	935
3410	7	R	2015-11-29	13:00:00	\N	f	16	935
3421	1	FP1	2016-03-18	\N	\N	f	1	936
3422	2	FP2	2016-03-18	\N	\N	f	1	936
3418	3	Q1	2016-03-19	\N	\N	f	1	936
3419	4	Q2	2016-03-19	\N	\N	f	1	936
3420	5	Q3	2016-03-19	\N	\N	f	1	936
3423	6	FP3	2016-03-19	\N	\N	f	1	936
3417	7	R	2016-03-20	05:00:00	\N	f	16	936
3428	1	FP1	2016-04-01	\N	\N	f	1	937
3429	2	FP2	2016-04-01	\N	\N	f	1	937
3425	3	Q1	2016-04-02	\N	\N	f	1	937
3426	4	Q2	2016-04-02	\N	\N	f	1	937
3427	5	Q3	2016-04-02	\N	\N	f	1	937
3430	6	FP3	2016-04-02	\N	\N	f	1	937
3424	7	R	2016-04-03	15:00:00	\N	f	16	937
3435	1	FP1	2016-04-15	\N	\N	f	1	938
3436	2	FP2	2016-04-15	\N	\N	f	1	938
3432	3	Q1	2016-04-16	\N	\N	f	1	938
3433	4	Q2	2016-04-16	\N	\N	f	1	938
3434	5	Q3	2016-04-16	\N	\N	f	1	938
3437	6	FP3	2016-04-16	\N	\N	f	1	938
3431	7	R	2016-04-17	06:00:00	\N	f	16	938
3442	1	FP1	2016-04-29	\N	\N	f	1	939
3443	2	FP2	2016-04-29	\N	\N	f	1	939
3439	3	Q1	2016-04-30	\N	\N	f	1	939
3440	4	Q2	2016-04-30	\N	\N	f	1	939
3441	5	Q3	2016-04-30	\N	\N	f	1	939
3444	6	FP3	2016-04-30	\N	\N	f	1	939
3438	7	R	2016-05-01	12:00:00	\N	f	16	939
3449	1	FP1	2016-05-13	\N	\N	f	1	940
3450	2	FP2	2016-05-13	\N	\N	f	1	940
3446	3	Q1	2016-05-14	\N	\N	f	1	940
3447	4	Q2	2016-05-14	\N	\N	f	1	940
3448	5	Q3	2016-05-14	\N	\N	f	1	940
3451	6	FP3	2016-05-14	\N	\N	f	1	940
3445	7	R	2016-05-15	12:00:00	\N	f	16	940
3456	1	FP1	2016-05-26	\N	\N	f	1	941
3457	2	FP2	2016-05-26	\N	\N	f	1	941
3453	3	Q1	2016-05-28	\N	\N	f	1	941
3454	4	Q2	2016-05-28	\N	\N	f	1	941
3455	5	Q3	2016-05-28	\N	\N	f	1	941
3458	6	FP3	2016-05-28	\N	\N	f	1	941
3452	7	R	2016-05-29	12:00:00	\N	f	16	941
3463	1	FP1	2016-06-10	\N	\N	f	1	942
3464	2	FP2	2016-06-10	\N	\N	f	1	942
3460	3	Q1	2016-06-11	\N	\N	f	1	942
3461	4	Q2	2016-06-11	\N	\N	f	1	942
3462	5	Q3	2016-06-11	\N	\N	f	1	942
3465	6	FP3	2016-06-11	\N	\N	f	1	942
3459	7	R	2016-06-12	18:00:00	\N	f	16	942
3470	1	FP1	2016-06-17	\N	\N	f	1	943
3471	2	FP2	2016-06-17	\N	\N	f	1	943
3467	3	Q1	2016-06-18	\N	\N	f	1	943
3468	4	Q2	2016-06-18	\N	\N	f	1	943
3469	5	Q3	2016-06-18	\N	\N	f	1	943
3472	6	FP3	2016-06-18	\N	\N	f	1	943
3466	7	R	2016-06-19	13:00:00	\N	f	16	943
3477	1	FP1	2016-07-01	\N	\N	f	1	944
3478	2	FP2	2016-07-01	\N	\N	f	1	944
3474	3	Q1	2016-07-02	\N	\N	f	1	944
3475	4	Q2	2016-07-02	\N	\N	f	1	944
3476	5	Q3	2016-07-02	\N	\N	f	1	944
3479	6	FP3	2016-07-02	\N	\N	f	1	944
3473	7	R	2016-07-03	12:00:00	\N	f	16	944
3484	1	FP1	2016-07-08	\N	\N	f	1	945
3485	2	FP2	2016-07-08	\N	\N	f	1	945
3481	3	Q1	2016-07-09	\N	\N	f	1	945
3482	4	Q2	2016-07-09	\N	\N	f	1	945
3483	5	Q3	2016-07-09	\N	\N	f	1	945
3486	6	FP3	2016-07-09	\N	\N	f	1	945
3480	7	R	2016-07-10	12:00:00	\N	f	16	945
3491	1	FP1	2016-07-22	\N	\N	f	1	946
3492	2	FP2	2016-07-22	\N	\N	f	1	946
3488	3	Q1	2016-07-23	\N	\N	f	1	946
3489	4	Q2	2016-07-23	\N	\N	f	1	946
3490	5	Q3	2016-07-23	\N	\N	f	1	946
3493	6	FP3	2016-07-23	\N	\N	f	1	946
3487	7	R	2016-07-24	12:00:00	\N	f	16	946
3498	1	FP1	2016-07-29	\N	\N	f	1	947
3499	2	FP2	2016-07-29	\N	\N	f	1	947
3495	3	Q1	2016-07-30	\N	\N	f	1	947
3496	4	Q2	2016-07-30	\N	\N	f	1	947
3497	5	Q3	2016-07-30	\N	\N	f	1	947
3500	6	FP3	2016-07-30	\N	\N	f	1	947
3494	7	R	2016-07-31	12:00:00	\N	f	16	947
3505	1	FP1	2016-08-26	\N	\N	f	1	948
3506	2	FP2	2016-08-26	\N	\N	f	1	948
3502	3	Q1	2016-08-27	\N	\N	f	1	948
3503	4	Q2	2016-08-27	\N	\N	f	1	948
3504	5	Q3	2016-08-27	\N	\N	f	1	948
3507	6	FP3	2016-08-27	\N	\N	f	1	948
3501	7	R	2016-08-28	12:00:00	\N	f	16	948
3512	1	FP1	2016-09-02	\N	\N	f	1	949
3513	2	FP2	2016-09-02	\N	\N	f	1	949
3509	3	Q1	2016-09-03	\N	\N	f	1	949
3510	4	Q2	2016-09-03	\N	\N	f	1	949
3511	5	Q3	2016-09-03	\N	\N	f	1	949
3514	6	FP3	2016-09-03	\N	\N	f	1	949
3508	7	R	2016-09-04	12:00:00	\N	f	16	949
3519	1	FP1	2016-09-16	\N	\N	f	1	950
3520	2	FP2	2016-09-16	\N	\N	f	1	950
3516	3	Q1	2016-09-17	\N	\N	f	1	950
3517	4	Q2	2016-09-17	\N	\N	f	1	950
3518	5	Q3	2016-09-17	\N	\N	f	1	950
3521	6	FP3	2016-09-17	\N	\N	f	1	950
3515	7	R	2016-09-18	12:00:00	\N	f	16	950
3526	1	FP1	2016-09-30	\N	\N	f	1	951
3527	2	FP2	2016-09-30	\N	\N	f	1	951
3523	3	Q1	2016-10-01	\N	\N	f	1	951
3524	4	Q2	2016-10-01	\N	\N	f	1	951
3525	5	Q3	2016-10-01	\N	\N	f	1	951
3528	6	FP3	2016-10-01	\N	\N	f	1	951
3522	7	R	2016-10-02	07:00:00	\N	f	16	951
3533	1	FP1	2016-10-07	\N	\N	f	1	952
3534	2	FP2	2016-10-07	\N	\N	f	1	952
3530	3	Q1	2016-10-08	\N	\N	f	1	952
3531	4	Q2	2016-10-08	\N	\N	f	1	952
3532	5	Q3	2016-10-08	\N	\N	f	1	952
3535	6	FP3	2016-10-08	\N	\N	f	1	952
3529	7	R	2016-10-09	05:00:00	\N	f	16	952
3540	1	FP1	2016-10-21	\N	\N	f	1	953
3541	2	FP2	2016-10-21	\N	\N	f	1	953
3537	3	Q1	2016-10-22	\N	\N	f	1	953
3538	4	Q2	2016-10-22	\N	\N	f	1	953
3539	5	Q3	2016-10-22	\N	\N	f	1	953
3542	6	FP3	2016-10-22	\N	\N	f	1	953
3536	7	R	2016-10-23	19:00:00	\N	f	16	953
3547	1	FP1	2016-10-28	\N	\N	f	1	954
3548	2	FP2	2016-10-28	\N	\N	f	1	954
3544	3	Q1	2016-10-29	\N	\N	f	1	954
3545	4	Q2	2016-10-29	\N	\N	f	1	954
3546	5	Q3	2016-10-29	\N	\N	f	1	954
3549	6	FP3	2016-10-29	\N	\N	f	1	954
3543	7	R	2016-10-30	19:00:00	\N	f	16	954
3554	1	FP1	2016-11-11	\N	\N	f	1	955
3555	2	FP2	2016-11-11	\N	\N	f	1	955
3551	3	Q1	2016-11-12	\N	\N	f	1	955
3552	4	Q2	2016-11-12	\N	\N	f	1	955
3553	5	Q3	2016-11-12	\N	\N	f	1	955
3556	6	FP3	2016-11-12	\N	\N	f	1	955
3550	7	R	2016-11-13	16:00:00	\N	f	16	955
3561	1	FP1	2016-11-25	\N	\N	f	1	956
3562	2	FP2	2016-11-25	\N	\N	f	1	956
3558	3	Q1	2016-11-26	\N	\N	f	1	956
3559	4	Q2	2016-11-26	\N	\N	f	1	956
3560	5	Q3	2016-11-26	\N	\N	f	1	956
3563	6	FP3	2016-11-26	\N	\N	f	1	956
3557	7	R	2016-11-27	13:00:00	\N	f	16	956
3568	1	FP1	2017-03-24	\N	\N	f	1	957
3569	2	FP2	2017-03-24	\N	\N	f	1	957
3565	3	Q1	2017-03-25	\N	\N	f	1	957
3566	4	Q2	2017-03-25	\N	\N	f	1	957
3567	5	Q3	2017-03-25	\N	\N	f	1	957
3570	6	FP3	2017-03-25	\N	\N	f	1	957
3564	7	R	2017-03-26	05:00:00	\N	f	16	957
3575	1	FP1	2017-04-07	\N	\N	f	1	958
3576	2	FP2	2017-04-07	\N	\N	f	1	958
3572	3	Q1	2017-04-08	\N	\N	f	1	958
3573	4	Q2	2017-04-08	\N	\N	f	1	958
3574	5	Q3	2017-04-08	\N	\N	f	1	958
3577	6	FP3	2017-04-08	\N	\N	f	1	958
3571	7	R	2017-04-09	06:00:00	\N	f	16	958
3582	1	FP1	2017-04-14	\N	\N	f	1	959
3583	2	FP2	2017-04-14	\N	\N	f	1	959
3579	3	Q1	2017-04-15	\N	\N	f	1	959
3580	4	Q2	2017-04-15	\N	\N	f	1	959
3581	5	Q3	2017-04-15	\N	\N	f	1	959
3584	6	FP3	2017-04-15	\N	\N	f	1	959
3578	7	R	2017-04-16	15:00:00	\N	f	16	959
3589	1	FP1	2017-04-28	\N	\N	f	1	960
3590	2	FP2	2017-04-28	\N	\N	f	1	960
3586	3	Q1	2017-04-29	\N	\N	f	1	960
3587	4	Q2	2017-04-29	\N	\N	f	1	960
3588	5	Q3	2017-04-29	\N	\N	f	1	960
3591	6	FP3	2017-04-29	\N	\N	f	1	960
3585	7	R	2017-04-30	12:00:00	\N	f	16	960
3596	1	FP1	2017-05-12	\N	\N	f	1	961
3597	2	FP2	2017-05-12	\N	\N	f	1	961
3593	3	Q1	2017-05-13	\N	\N	f	1	961
3594	4	Q2	2017-05-13	\N	\N	f	1	961
3595	5	Q3	2017-05-13	\N	\N	f	1	961
3598	6	FP3	2017-05-13	\N	\N	f	1	961
3592	7	R	2017-05-14	12:00:00	\N	f	16	961
3603	1	FP1	2017-05-25	\N	\N	f	1	962
3604	2	FP2	2017-05-25	\N	\N	f	1	962
3600	3	Q1	2017-05-27	\N	\N	f	1	962
3601	4	Q2	2017-05-27	\N	\N	f	1	962
3602	5	Q3	2017-05-27	\N	\N	f	1	962
3605	6	FP3	2017-05-27	\N	\N	f	1	962
3599	7	R	2017-05-28	12:00:00	\N	f	16	962
3610	1	FP1	2017-06-09	\N	\N	f	1	963
3611	2	FP2	2017-06-09	\N	\N	f	1	963
3607	3	Q1	2017-06-10	\N	\N	f	1	963
3608	4	Q2	2017-06-10	\N	\N	f	1	963
3609	5	Q3	2017-06-10	\N	\N	f	1	963
3612	6	FP3	2017-06-10	\N	\N	f	1	963
3606	7	R	2017-06-11	18:00:00	\N	f	16	963
3617	1	FP1	2017-06-23	\N	\N	f	1	964
3618	2	FP2	2017-06-23	\N	\N	f	1	964
3614	3	Q1	2017-06-24	\N	\N	f	1	964
3615	4	Q2	2017-06-24	\N	\N	f	1	964
3616	5	Q3	2017-06-24	\N	\N	f	1	964
3619	6	FP3	2017-06-24	\N	\N	f	1	964
3613	7	R	2017-06-25	13:00:00	\N	f	16	964
3624	1	FP1	2017-07-07	\N	\N	f	1	965
3625	2	FP2	2017-07-07	\N	\N	f	1	965
3621	3	Q1	2017-07-08	\N	\N	f	1	965
3622	4	Q2	2017-07-08	\N	\N	f	1	965
3623	5	Q3	2017-07-08	\N	\N	f	1	965
3626	6	FP3	2017-07-08	\N	\N	f	1	965
3620	7	R	2017-07-09	12:00:00	\N	f	16	965
3631	1	FP1	2017-07-14	\N	\N	f	1	966
3632	2	FP2	2017-07-14	\N	\N	f	1	966
3628	3	Q1	2017-07-15	\N	\N	f	1	966
3629	4	Q2	2017-07-15	\N	\N	f	1	966
3630	5	Q3	2017-07-15	\N	\N	f	1	966
3633	6	FP3	2017-07-15	\N	\N	f	1	966
3627	7	R	2017-07-16	12:00:00	\N	f	16	966
3638	1	FP1	2017-07-28	\N	\N	f	1	967
3639	2	FP2	2017-07-28	\N	\N	f	1	967
3635	3	Q1	2017-07-29	\N	\N	f	1	967
3636	4	Q2	2017-07-29	\N	\N	f	1	967
3637	5	Q3	2017-07-29	\N	\N	f	1	967
3640	6	FP3	2017-07-29	\N	\N	f	1	967
3634	7	R	2017-07-30	12:00:00	\N	f	16	967
3645	1	FP1	2017-08-25	\N	\N	f	1	968
3646	2	FP2	2017-08-25	\N	\N	f	1	968
3642	3	Q1	2017-08-26	\N	\N	f	1	968
3643	4	Q2	2017-08-26	\N	\N	f	1	968
3644	5	Q3	2017-08-26	\N	\N	f	1	968
3647	6	FP3	2017-08-26	\N	\N	f	1	968
3641	7	R	2017-08-27	12:00:00	\N	f	16	968
3652	1	FP1	2017-09-01	\N	\N	f	1	969
3653	2	FP2	2017-09-01	\N	\N	f	1	969
3649	3	Q1	2017-09-02	\N	\N	f	1	969
3650	4	Q2	2017-09-02	\N	\N	f	1	969
3651	5	Q3	2017-09-02	\N	\N	f	1	969
3654	6	FP3	2017-09-02	\N	\N	f	1	969
3648	7	R	2017-09-03	12:00:00	\N	f	16	969
3659	1	FP1	2017-09-15	\N	\N	f	1	970
3660	2	FP2	2017-09-15	\N	\N	f	1	970
3656	3	Q1	2017-09-16	\N	\N	f	1	970
3657	4	Q2	2017-09-16	\N	\N	f	1	970
3658	5	Q3	2017-09-16	\N	\N	f	1	970
3661	6	FP3	2017-09-16	\N	\N	f	1	970
3655	7	R	2017-09-17	12:00:00	\N	f	16	970
3666	1	FP1	2017-09-29	\N	\N	f	1	971
3667	2	FP2	2017-09-29	\N	\N	f	1	971
3663	3	Q1	2017-09-30	\N	\N	f	1	971
3664	4	Q2	2017-09-30	\N	\N	f	1	971
3665	5	Q3	2017-09-30	\N	\N	f	1	971
3668	6	FP3	2017-09-30	\N	\N	f	1	971
3662	7	R	2017-10-01	07:00:00	\N	f	16	971
3673	1	FP1	2017-10-06	\N	\N	f	1	972
3674	2	FP2	2017-10-06	\N	\N	f	1	972
3670	3	Q1	2017-10-07	\N	\N	f	1	972
3671	4	Q2	2017-10-07	\N	\N	f	1	972
3672	5	Q3	2017-10-07	\N	\N	f	1	972
3675	6	FP3	2017-10-07	\N	\N	f	1	972
3669	7	R	2017-10-08	05:00:00	\N	f	16	972
3680	1	FP1	2017-10-20	\N	\N	f	1	973
3681	2	FP2	2017-10-20	\N	\N	f	1	973
3677	3	Q1	2017-10-21	\N	\N	f	1	973
3678	4	Q2	2017-10-21	\N	\N	f	1	973
3679	5	Q3	2017-10-21	\N	\N	f	1	973
3682	6	FP3	2017-10-21	\N	\N	f	1	973
3676	7	R	2017-10-22	19:00:00	\N	f	16	973
3687	1	FP1	2017-10-27	\N	\N	f	1	974
3688	2	FP2	2017-10-27	\N	\N	f	1	974
3684	3	Q1	2017-10-28	\N	\N	f	1	974
3685	4	Q2	2017-10-28	\N	\N	f	1	974
3686	5	Q3	2017-10-28	\N	\N	f	1	974
3689	6	FP3	2017-10-28	\N	\N	f	1	974
3683	7	R	2017-10-29	19:00:00	\N	f	16	974
3694	1	FP1	2017-11-10	\N	\N	f	1	975
3695	2	FP2	2017-11-10	\N	\N	f	1	975
3691	3	Q1	2017-11-11	\N	\N	f	1	975
3692	4	Q2	2017-11-11	\N	\N	f	1	975
3693	5	Q3	2017-11-11	\N	\N	f	1	975
3696	6	FP3	2017-11-11	\N	\N	f	1	975
3690	7	R	2017-11-12	16:00:00	\N	f	16	975
3701	1	FP1	2017-11-24	\N	\N	f	1	976
3702	2	FP2	2017-11-24	\N	\N	f	1	976
3698	3	Q1	2017-11-25	\N	\N	f	1	976
3699	4	Q2	2017-11-25	\N	\N	f	1	976
3700	5	Q3	2017-11-25	\N	\N	f	1	976
3703	6	FP3	2017-11-25	\N	\N	f	1	976
3697	7	R	2017-11-26	13:00:00	\N	f	16	976
3708	1	FP1	2018-03-23	\N	\N	f	1	977
3709	2	FP2	2018-03-23	\N	\N	f	1	977
3705	3	Q1	2018-03-24	\N	\N	f	1	977
3706	4	Q2	2018-03-24	\N	\N	f	1	977
3707	5	Q3	2018-03-24	\N	\N	f	1	977
3710	6	FP3	2018-03-24	\N	\N	f	1	977
3704	7	R	2018-03-25	05:10:00	\N	f	16	977
3715	1	FP1	2018-04-06	\N	\N	f	1	978
3716	2	FP2	2018-04-06	\N	\N	f	1	978
3712	3	Q1	2018-04-07	\N	\N	f	1	978
3713	4	Q2	2018-04-07	\N	\N	f	1	978
3714	5	Q3	2018-04-07	\N	\N	f	1	978
3717	6	FP3	2018-04-07	\N	\N	f	1	978
3711	7	R	2018-04-08	15:10:00	\N	f	16	978
3722	1	FP1	2018-04-13	\N	\N	f	1	979
3723	2	FP2	2018-04-13	\N	\N	f	1	979
3719	3	Q1	2018-04-14	\N	\N	f	1	979
3720	4	Q2	2018-04-14	\N	\N	f	1	979
3721	5	Q3	2018-04-14	\N	\N	f	1	979
3724	6	FP3	2018-04-14	\N	\N	f	1	979
3718	7	R	2018-04-15	06:10:00	\N	f	16	979
3729	1	FP1	2018-04-27	\N	\N	f	1	980
3730	2	FP2	2018-04-27	\N	\N	f	1	980
3726	3	Q1	2018-04-28	\N	\N	f	1	980
3727	4	Q2	2018-04-28	\N	\N	f	1	980
3728	5	Q3	2018-04-28	\N	\N	f	1	980
3731	6	FP3	2018-04-28	\N	\N	f	1	980
3725	7	R	2018-04-29	12:10:00	\N	f	16	980
3736	1	FP1	2018-05-11	\N	\N	f	1	981
3737	2	FP2	2018-05-11	\N	\N	f	1	981
3733	3	Q1	2018-05-12	\N	\N	f	1	981
3734	4	Q2	2018-05-12	\N	\N	f	1	981
3735	5	Q3	2018-05-12	\N	\N	f	1	981
3738	6	FP3	2018-05-12	\N	\N	f	1	981
3732	7	R	2018-05-13	13:10:00	\N	f	16	981
3743	1	FP1	2018-05-24	\N	\N	f	1	982
3744	2	FP2	2018-05-24	\N	\N	f	1	982
3740	3	Q1	2018-05-26	\N	\N	f	1	982
3741	4	Q2	2018-05-26	\N	\N	f	1	982
3742	5	Q3	2018-05-26	\N	\N	f	1	982
3745	6	FP3	2018-05-26	\N	\N	f	1	982
3739	7	R	2018-05-27	13:10:00	\N	f	16	982
3750	1	FP1	2018-06-08	\N	\N	f	1	983
3751	2	FP2	2018-06-08	\N	\N	f	1	983
3747	3	Q1	2018-06-09	\N	\N	f	1	983
3748	4	Q2	2018-06-09	\N	\N	f	1	983
3749	5	Q3	2018-06-09	\N	\N	f	1	983
3752	6	FP3	2018-06-09	\N	\N	f	1	983
3746	7	R	2018-06-10	18:10:00	\N	f	16	983
3757	1	FP1	2018-06-22	\N	\N	f	1	984
3758	2	FP2	2018-06-22	\N	\N	f	1	984
3754	3	Q1	2018-06-23	\N	\N	f	1	984
3755	4	Q2	2018-06-23	\N	\N	f	1	984
3756	5	Q3	2018-06-23	\N	\N	f	1	984
3759	6	FP3	2018-06-23	\N	\N	f	1	984
3753	7	R	2018-06-24	14:10:00	\N	f	16	984
3764	1	FP1	2018-06-29	\N	\N	f	1	985
3765	2	FP2	2018-06-29	\N	\N	f	1	985
3761	3	Q1	2018-06-30	\N	\N	f	1	985
3762	4	Q2	2018-06-30	\N	\N	f	1	985
3763	5	Q3	2018-06-30	\N	\N	f	1	985
3766	6	FP3	2018-06-30	\N	\N	f	1	985
3760	7	R	2018-07-01	13:10:00	\N	f	16	985
3771	1	FP1	2018-07-06	\N	\N	f	1	986
3772	2	FP2	2018-07-06	\N	\N	f	1	986
3768	3	Q1	2018-07-07	\N	\N	f	1	986
3769	4	Q2	2018-07-07	\N	\N	f	1	986
3770	5	Q3	2018-07-07	\N	\N	f	1	986
3773	6	FP3	2018-07-07	\N	\N	f	1	986
3767	7	R	2018-07-08	13:10:00	\N	f	16	986
3778	1	FP1	2018-07-20	\N	\N	f	1	987
3779	2	FP2	2018-07-20	\N	\N	f	1	987
3775	3	Q1	2018-07-21	\N	\N	f	1	987
3776	4	Q2	2018-07-21	\N	\N	f	1	987
3777	5	Q3	2018-07-21	\N	\N	f	1	987
3780	6	FP3	2018-07-21	\N	\N	f	1	987
3774	7	R	2018-07-22	13:10:00	\N	f	16	987
3785	1	FP1	2018-07-27	\N	\N	f	1	988
3786	2	FP2	2018-07-27	\N	\N	f	1	988
3782	3	Q1	2018-07-28	\N	\N	f	1	988
3783	4	Q2	2018-07-28	\N	\N	f	1	988
3784	5	Q3	2018-07-28	\N	\N	f	1	988
3787	6	FP3	2018-07-28	\N	\N	f	1	988
3781	7	R	2018-07-29	13:10:00	\N	f	16	988
3792	1	FP1	2018-08-24	\N	\N	f	1	989
3793	2	FP2	2018-08-24	\N	\N	f	1	989
3789	3	Q1	2018-08-25	\N	\N	f	1	989
3790	4	Q2	2018-08-25	\N	\N	f	1	989
3791	5	Q3	2018-08-25	\N	\N	f	1	989
3794	6	FP3	2018-08-25	\N	\N	f	1	989
3788	7	R	2018-08-26	13:10:00	\N	f	16	989
3799	1	FP1	2018-08-31	\N	\N	f	1	990
3800	2	FP2	2018-08-31	\N	\N	f	1	990
3796	3	Q1	2018-09-01	\N	\N	f	1	990
3797	4	Q2	2018-09-01	\N	\N	f	1	990
3798	5	Q3	2018-09-01	\N	\N	f	1	990
3801	6	FP3	2018-09-01	\N	\N	f	1	990
3795	7	R	2018-09-02	13:10:00	\N	f	16	990
3806	1	FP1	2018-09-14	\N	\N	f	1	991
3807	2	FP2	2018-09-14	\N	\N	f	1	991
3803	3	Q1	2018-09-15	\N	\N	f	1	991
3804	4	Q2	2018-09-15	\N	\N	f	1	991
3805	5	Q3	2018-09-15	\N	\N	f	1	991
3808	6	FP3	2018-09-15	\N	\N	f	1	991
3802	7	R	2018-09-16	12:10:00	\N	f	16	991
3813	1	FP1	2018-09-28	\N	\N	f	1	992
3814	2	FP2	2018-09-28	\N	\N	f	1	992
3810	3	Q1	2018-09-29	\N	\N	f	1	992
3811	4	Q2	2018-09-29	\N	\N	f	1	992
3812	5	Q3	2018-09-29	\N	\N	f	1	992
3815	6	FP3	2018-09-29	\N	\N	f	1	992
3809	7	R	2018-09-30	11:10:00	\N	f	16	992
3820	1	FP1	2018-10-05	\N	\N	f	1	993
3821	2	FP2	2018-10-05	\N	\N	f	1	993
3817	3	Q1	2018-10-06	\N	\N	f	1	993
3818	4	Q2	2018-10-06	\N	\N	f	1	993
3819	5	Q3	2018-10-06	\N	\N	f	1	993
3822	6	FP3	2018-10-06	\N	\N	f	1	993
3816	7	R	2018-10-07	05:10:00	\N	f	16	993
3827	1	FP1	2018-10-19	\N	\N	f	1	994
3828	2	FP2	2018-10-19	\N	\N	f	1	994
3824	3	Q1	2018-10-20	\N	\N	f	1	994
3825	4	Q2	2018-10-20	\N	\N	f	1	994
3826	5	Q3	2018-10-20	\N	\N	f	1	994
3829	6	FP3	2018-10-20	\N	\N	f	1	994
3823	7	R	2018-10-21	18:10:00	\N	f	16	994
3834	1	FP1	2018-10-26	\N	\N	f	1	995
3835	2	FP2	2018-10-26	\N	\N	f	1	995
3831	3	Q1	2018-10-27	\N	\N	f	1	995
3832	4	Q2	2018-10-27	\N	\N	f	1	995
3833	5	Q3	2018-10-27	\N	\N	f	1	995
3836	6	FP3	2018-10-27	\N	\N	f	1	995
3830	7	R	2018-10-28	19:10:00	\N	f	16	995
3841	1	FP1	2018-11-09	\N	\N	f	1	996
3842	2	FP2	2018-11-09	\N	\N	f	1	996
3838	3	Q1	2018-11-10	\N	\N	f	1	996
3839	4	Q2	2018-11-10	\N	\N	f	1	996
3840	5	Q3	2018-11-10	\N	\N	f	1	996
3843	6	FP3	2018-11-10	\N	\N	f	1	996
3837	7	R	2018-11-11	17:10:00	\N	f	16	996
3848	1	FP1	2018-11-23	\N	\N	f	1	997
3849	2	FP2	2018-11-23	\N	\N	f	1	997
3845	3	Q1	2018-11-24	\N	\N	f	1	997
3846	4	Q2	2018-11-24	\N	\N	f	1	997
3847	5	Q3	2018-11-24	\N	\N	f	1	997
3850	6	FP3	2018-11-24	\N	\N	f	1	997
3844	7	R	2018-11-25	13:10:00	\N	f	16	997
3855	1	FP1	2019-03-15	\N	\N	f	1	998
3856	2	FP2	2019-03-15	\N	\N	f	1	998
3852	3	Q1	2019-03-16	\N	\N	f	1	998
3853	4	Q2	2019-03-16	\N	\N	f	1	998
3854	5	Q3	2019-03-16	\N	\N	f	1	998
3857	6	FP3	2019-03-16	\N	\N	f	1	998
3851	7	R	2019-03-17	05:10:00	\N	f	18	998
3862	1	FP1	2019-03-29	\N	\N	f	1	999
3863	2	FP2	2019-03-29	\N	\N	f	1	999
3859	3	Q1	2019-03-30	\N	\N	f	1	999
3860	4	Q2	2019-03-30	\N	\N	f	1	999
3861	5	Q3	2019-03-30	\N	\N	f	1	999
3864	6	FP3	2019-03-30	\N	\N	f	1	999
3858	7	R	2019-03-31	15:10:00	\N	f	18	999
3869	1	FP1	2019-04-12	\N	\N	f	1	1000
3870	2	FP2	2019-04-12	\N	\N	f	1	1000
3866	3	Q1	2019-04-13	\N	\N	f	1	1000
3867	4	Q2	2019-04-13	\N	\N	f	1	1000
3868	5	Q3	2019-04-13	\N	\N	f	1	1000
3871	6	FP3	2019-04-13	\N	\N	f	1	1000
3865	7	R	2019-04-14	06:10:00	\N	f	18	1000
3876	1	FP1	2019-04-26	\N	\N	f	1	1001
3877	2	FP2	2019-04-26	\N	\N	f	1	1001
3873	3	Q1	2019-04-27	\N	\N	f	1	1001
3874	4	Q2	2019-04-27	\N	\N	f	1	1001
3875	5	Q3	2019-04-27	\N	\N	f	1	1001
3878	6	FP3	2019-04-27	\N	\N	f	1	1001
3872	7	R	2019-04-28	12:10:00	\N	f	18	1001
3883	1	FP1	2019-05-10	\N	\N	f	1	1002
3884	2	FP2	2019-05-10	\N	\N	f	1	1002
3880	3	Q1	2019-05-11	\N	\N	f	1	1002
3881	4	Q2	2019-05-11	\N	\N	f	1	1002
3882	5	Q3	2019-05-11	\N	\N	f	1	1002
3885	6	FP3	2019-05-11	\N	\N	f	1	1002
3879	7	R	2019-05-12	13:10:00	\N	f	18	1002
3890	1	FP1	2019-05-23	\N	\N	f	1	1003
3891	2	FP2	2019-05-23	\N	\N	f	1	1003
3887	3	Q1	2019-05-25	\N	\N	f	1	1003
3888	4	Q2	2019-05-25	\N	\N	f	1	1003
3889	5	Q3	2019-05-25	\N	\N	f	1	1003
3892	6	FP3	2019-05-25	\N	\N	f	1	1003
3886	7	R	2019-05-26	13:10:00	\N	f	18	1003
3897	1	FP1	2019-06-07	\N	\N	f	1	1004
3898	2	FP2	2019-06-07	\N	\N	f	1	1004
3894	3	Q1	2019-06-08	\N	\N	f	1	1004
3895	4	Q2	2019-06-08	\N	\N	f	1	1004
3896	5	Q3	2019-06-08	\N	\N	f	1	1004
3899	6	FP3	2019-06-08	\N	\N	f	1	1004
3893	7	R	2019-06-09	18:10:00	\N	f	18	1004
3904	1	FP1	2019-06-21	\N	\N	f	1	1005
3905	2	FP2	2019-06-21	\N	\N	f	1	1005
3901	3	Q1	2019-06-22	\N	\N	f	1	1005
3902	4	Q2	2019-06-22	\N	\N	f	1	1005
3903	5	Q3	2019-06-22	\N	\N	f	1	1005
3906	6	FP3	2019-06-22	\N	\N	f	1	1005
3900	7	R	2019-06-23	13:10:00	\N	f	18	1005
3911	1	FP1	2019-06-28	\N	\N	f	1	1006
3912	2	FP2	2019-06-28	\N	\N	f	1	1006
3908	3	Q1	2019-06-29	\N	\N	f	1	1006
3909	4	Q2	2019-06-29	\N	\N	f	1	1006
3910	5	Q3	2019-06-29	\N	\N	f	1	1006
3913	6	FP3	2019-06-29	\N	\N	f	1	1006
3907	7	R	2019-06-30	13:10:00	\N	f	18	1006
3918	1	FP1	2019-07-12	\N	\N	f	1	1007
3919	2	FP2	2019-07-12	\N	\N	f	1	1007
3915	3	Q1	2019-07-13	\N	\N	f	1	1007
3916	4	Q2	2019-07-13	\N	\N	f	1	1007
3917	5	Q3	2019-07-13	\N	\N	f	1	1007
3920	6	FP3	2019-07-13	\N	\N	f	1	1007
3914	7	R	2019-07-14	13:10:00	\N	f	18	1007
3925	1	FP1	2019-07-26	\N	\N	f	1	1008
3926	2	FP2	2019-07-26	\N	\N	f	1	1008
3922	3	Q1	2019-07-27	\N	\N	f	1	1008
3923	4	Q2	2019-07-27	\N	\N	f	1	1008
3924	5	Q3	2019-07-27	\N	\N	f	1	1008
3927	6	FP3	2019-07-27	\N	\N	f	1	1008
3921	7	R	2019-07-28	13:10:00	\N	f	18	1008
3932	1	FP1	2019-08-02	\N	\N	f	1	1009
3933	2	FP2	2019-08-02	\N	\N	f	1	1009
3929	3	Q1	2019-08-03	\N	\N	f	1	1009
3930	4	Q2	2019-08-03	\N	\N	f	1	1009
3931	5	Q3	2019-08-03	\N	\N	f	1	1009
3934	6	FP3	2019-08-03	\N	\N	f	1	1009
3928	7	R	2019-08-04	13:10:00	\N	f	18	1009
3939	1	FP1	2019-08-30	\N	\N	f	1	1010
3940	2	FP2	2019-08-30	\N	\N	f	1	1010
3936	3	Q1	2019-08-31	\N	\N	f	1	1010
3937	4	Q2	2019-08-31	\N	\N	f	1	1010
3938	5	Q3	2019-08-31	\N	\N	f	1	1010
3941	6	FP3	2019-08-31	\N	\N	f	1	1010
3935	7	R	2019-09-01	13:10:00	\N	f	18	1010
3946	1	FP1	2019-09-06	\N	\N	f	1	1011
3947	2	FP2	2019-09-06	\N	\N	f	1	1011
3943	3	Q1	2019-09-07	\N	\N	f	1	1011
3944	4	Q2	2019-09-07	\N	\N	f	1	1011
3945	5	Q3	2019-09-07	\N	\N	f	1	1011
3948	6	FP3	2019-09-07	\N	\N	f	1	1011
3942	7	R	2019-09-08	13:10:00	\N	f	18	1011
3953	1	FP1	2019-09-20	\N	\N	f	1	1012
3954	2	FP2	2019-09-20	\N	\N	f	1	1012
3950	3	Q1	2019-09-21	\N	\N	f	1	1012
3951	4	Q2	2019-09-21	\N	\N	f	1	1012
3952	5	Q3	2019-09-21	\N	\N	f	1	1012
3955	6	FP3	2019-09-21	\N	\N	f	1	1012
3949	7	R	2019-09-22	12:10:00	\N	f	18	1012
3960	1	FP1	2019-09-27	\N	\N	f	1	1013
3961	2	FP2	2019-09-27	\N	\N	f	1	1013
3957	3	Q1	2019-09-28	\N	\N	f	1	1013
3958	4	Q2	2019-09-28	\N	\N	f	1	1013
3959	5	Q3	2019-09-28	\N	\N	f	1	1013
3962	6	FP3	2019-09-28	\N	\N	f	1	1013
3956	7	R	2019-09-29	11:10:00	\N	f	18	1013
3967	1	FP1	2019-10-11	\N	\N	f	1	1014
3968	2	FP2	2019-10-11	\N	\N	f	1	1014
3964	3	Q1	2019-10-12	\N	\N	f	1	1014
3965	4	Q2	2019-10-12	\N	\N	f	1	1014
3966	5	Q3	2019-10-12	\N	\N	f	1	1014
3969	6	FP3	2019-10-12	\N	\N	f	1	1014
3963	7	R	2019-10-13	05:10:00	\N	f	18	1014
3974	1	FP1	2019-10-25	\N	\N	f	1	1015
3975	2	FP2	2019-10-25	\N	\N	f	1	1015
3971	3	Q1	2019-10-26	\N	\N	f	1	1015
3972	4	Q2	2019-10-26	\N	\N	f	1	1015
3973	5	Q3	2019-10-26	\N	\N	f	1	1015
3976	6	FP3	2019-10-26	\N	\N	f	1	1015
3970	7	R	2019-10-27	19:10:00	\N	f	18	1015
3981	1	FP1	2019-11-01	\N	\N	f	1	1016
3982	2	FP2	2019-11-01	\N	\N	f	1	1016
3978	3	Q1	2019-11-02	\N	\N	f	1	1016
3979	4	Q2	2019-11-02	\N	\N	f	1	1016
3980	5	Q3	2019-11-02	\N	\N	f	1	1016
3983	6	FP3	2019-11-02	\N	\N	f	1	1016
3977	7	R	2019-11-03	19:10:00	\N	f	18	1016
3988	1	FP1	2019-11-15	\N	\N	f	1	1017
3989	2	FP2	2019-11-15	\N	\N	f	1	1017
3985	3	Q1	2019-11-16	\N	\N	f	1	1017
3986	4	Q2	2019-11-16	\N	\N	f	1	1017
3987	5	Q3	2019-11-16	\N	\N	f	1	1017
3990	6	FP3	2019-11-16	\N	\N	f	1	1017
3984	7	R	2019-11-17	17:10:00	\N	f	18	1017
3995	1	FP1	2019-11-29	\N	\N	f	1	1018
3996	2	FP2	2019-11-29	\N	\N	f	1	1018
3992	3	Q1	2019-11-30	\N	\N	f	1	1018
3993	4	Q2	2019-11-30	\N	\N	f	1	1018
3994	5	Q3	2019-11-30	\N	\N	f	1	1018
3997	6	FP3	2019-11-30	\N	\N	f	1	1018
3991	7	R	2019-12-01	13:10:00	\N	f	18	1018
4002	1	FP1	2020-07-03	\N	\N	f	1	1019
4003	2	FP2	2020-07-03	\N	\N	f	1	1019
3999	3	Q1	2020-07-04	\N	\N	f	1	1019
4000	4	Q2	2020-07-04	\N	\N	f	1	1019
4001	5	Q3	2020-07-04	\N	\N	f	1	1019
4004	6	FP3	2020-07-04	\N	\N	f	1	1019
3998	7	R	2020-07-05	13:10:00	\N	f	18	1019
4009	1	FP1	2020-07-10	\N	\N	f	1	1020
4010	2	FP2	2020-07-10	\N	\N	f	1	1020
4006	3	Q1	2020-07-11	\N	\N	f	1	1020
4007	4	Q2	2020-07-11	\N	\N	f	1	1020
4008	5	Q3	2020-07-11	\N	\N	f	1	1020
4011	6	FP3	2020-07-11	\N	\N	f	1	1020
4005	7	R	2020-07-12	13:10:00	\N	f	18	1020
4016	1	FP1	2020-07-17	\N	\N	f	1	1021
4017	2	FP2	2020-07-17	\N	\N	f	1	1021
4013	3	Q1	2020-07-18	\N	\N	f	1	1021
4014	4	Q2	2020-07-18	\N	\N	f	1	1021
4015	5	Q3	2020-07-18	\N	\N	f	1	1021
4018	6	FP3	2020-07-18	\N	\N	f	1	1021
4012	7	R	2020-07-19	13:10:00	\N	f	18	1021
4023	1	FP1	2020-07-31	\N	\N	f	1	1022
4024	2	FP2	2020-07-31	\N	\N	f	1	1022
4020	3	Q1	2020-08-01	\N	\N	f	1	1022
4021	4	Q2	2020-08-01	\N	\N	f	1	1022
4022	5	Q3	2020-08-01	\N	\N	f	1	1022
4025	6	FP3	2020-08-01	\N	\N	f	1	1022
4019	7	R	2020-08-02	13:10:00	\N	f	18	1022
4030	1	FP1	2020-08-07	\N	\N	f	1	1023
4031	2	FP2	2020-08-07	\N	\N	f	1	1023
4027	3	Q1	2020-08-08	\N	\N	f	1	1023
4028	4	Q2	2020-08-08	\N	\N	f	1	1023
4029	5	Q3	2020-08-08	\N	\N	f	1	1023
4032	6	FP3	2020-08-08	\N	\N	f	1	1023
4026	7	R	2020-08-09	13:10:00	\N	f	18	1023
4037	1	FP1	2020-08-14	\N	\N	f	1	1024
4038	2	FP2	2020-08-14	\N	\N	f	1	1024
4034	3	Q1	2020-08-15	\N	\N	f	1	1024
4035	4	Q2	2020-08-15	\N	\N	f	1	1024
4036	5	Q3	2020-08-15	\N	\N	f	1	1024
4039	6	FP3	2020-08-15	\N	\N	f	1	1024
4033	7	R	2020-08-16	13:10:00	\N	f	18	1024
4044	1	FP1	2020-08-28	\N	\N	f	1	1025
4045	2	FP2	2020-08-28	\N	\N	f	1	1025
4041	3	Q1	2020-08-29	\N	\N	f	1	1025
4042	4	Q2	2020-08-29	\N	\N	f	1	1025
4043	5	Q3	2020-08-29	\N	\N	f	1	1025
4046	6	FP3	2020-08-29	\N	\N	f	1	1025
4040	7	R	2020-08-30	13:10:00	\N	f	18	1025
4051	1	FP1	2020-09-04	\N	\N	f	1	1026
4052	2	FP2	2020-09-04	\N	\N	f	1	1026
4048	3	Q1	2020-09-05	\N	\N	f	1	1026
4049	4	Q2	2020-09-05	\N	\N	f	1	1026
4050	5	Q3	2020-09-05	\N	\N	f	1	1026
4053	6	FP3	2020-09-05	\N	\N	f	1	1026
4047	7	R	2020-09-06	13:10:00	\N	f	18	1026
4058	1	FP1	2020-09-11	\N	\N	f	1	1027
4059	2	FP2	2020-09-11	\N	\N	f	1	1027
4055	3	Q1	2020-09-12	\N	\N	f	1	1027
4056	4	Q2	2020-09-12	\N	\N	f	1	1027
4057	5	Q3	2020-09-12	\N	\N	f	1	1027
4060	6	FP3	2020-09-12	\N	\N	f	1	1027
4054	7	R	2020-09-13	13:10:00	\N	f	18	1027
4065	1	FP1	2020-09-25	\N	\N	f	1	1028
4066	2	FP2	2020-09-25	\N	\N	f	1	1028
4062	3	Q1	2020-09-26	\N	\N	f	1	1028
4063	4	Q2	2020-09-26	\N	\N	f	1	1028
4064	5	Q3	2020-09-26	\N	\N	f	1	1028
4067	6	FP3	2020-09-26	\N	\N	f	1	1028
4061	7	R	2020-09-27	11:10:00	\N	f	18	1028
4072	1	FP1	2020-10-09	\N	\N	f	1	1029
4073	2	FP2	2020-10-09	\N	\N	f	1	1029
4069	3	Q1	2020-10-10	\N	\N	f	1	1029
4070	4	Q2	2020-10-10	\N	\N	f	1	1029
4071	5	Q3	2020-10-10	\N	\N	f	1	1029
4074	6	FP3	2020-10-10	\N	\N	f	1	1029
4068	7	R	2020-10-11	13:10:00	\N	f	18	1029
4079	1	FP1	2020-10-23	\N	\N	f	1	1030
4080	2	FP2	2020-10-23	\N	\N	f	1	1030
4076	3	Q1	2020-10-24	\N	\N	f	1	1030
4077	4	Q2	2020-10-24	\N	\N	f	1	1030
4078	5	Q3	2020-10-24	\N	\N	f	1	1030
4081	6	FP3	2020-10-24	\N	\N	f	1	1030
4075	7	R	2020-10-25	12:10:00	\N	f	18	1030
4086	1	FP1	2020-10-30	\N	\N	f	1	1031
4087	2	FP2	2020-10-30	\N	\N	f	1	1031
4083	3	Q1	2020-10-31	\N	\N	f	1	1031
4084	4	Q2	2020-10-31	\N	\N	f	1	1031
4085	5	Q3	2020-10-31	\N	\N	f	1	1031
4088	6	FP3	2020-10-31	\N	\N	f	1	1031
4082	7	R	2020-11-01	12:10:00	\N	f	18	1031
4093	1	FP1	2020-11-13	\N	\N	f	1	1032
4094	2	FP2	2020-11-13	\N	\N	f	1	1032
4090	3	Q1	2020-11-14	\N	\N	f	1	1032
4091	4	Q2	2020-11-14	\N	\N	f	1	1032
4092	5	Q3	2020-11-14	\N	\N	f	1	1032
4095	6	FP3	2020-11-14	\N	\N	f	1	1032
4089	7	R	2020-11-15	10:10:00	\N	f	18	1032
4100	1	FP1	2020-11-27	\N	\N	f	1	1033
4101	2	FP2	2020-11-27	\N	\N	f	1	1033
4097	3	Q1	2020-11-28	\N	\N	f	1	1033
4098	4	Q2	2020-11-28	\N	\N	f	1	1033
4099	5	Q3	2020-11-28	\N	\N	f	1	1033
4102	6	FP3	2020-11-28	\N	\N	f	1	1033
4096	7	R	2020-11-29	14:10:00	\N	f	18	1033
4107	1	FP1	2020-12-04	\N	\N	f	1	1034
4108	2	FP2	2020-12-04	\N	\N	f	1	1034
4104	3	Q1	2020-12-05	\N	\N	f	1	1034
4105	4	Q2	2020-12-05	\N	\N	f	1	1034
4106	5	Q3	2020-12-05	\N	\N	f	1	1034
4109	6	FP3	2020-12-05	\N	\N	f	1	1034
4103	7	R	2020-12-06	17:10:00	\N	f	18	1034
4114	1	FP1	2020-12-11	\N	\N	f	1	1035
4115	2	FP2	2020-12-11	\N	\N	f	1	1035
4111	3	Q1	2020-12-12	\N	\N	f	1	1035
4112	4	Q2	2020-12-12	\N	\N	f	1	1035
4113	5	Q3	2020-12-12	\N	\N	f	1	1035
4116	6	FP3	2020-12-12	\N	\N	f	1	1035
4110	7	R	2020-12-13	13:10:00	\N	f	18	1035
4121	1	FP1	2021-03-26	\N	\N	f	1	1036
4122	2	FP2	2021-03-26	\N	\N	f	1	1036
4118	3	Q1	2021-03-27	\N	\N	f	1	1036
4119	4	Q2	2021-03-27	\N	\N	f	1	1036
4120	5	Q3	2021-03-27	\N	\N	f	1	1036
4123	6	FP3	2021-03-27	\N	\N	f	1	1036
4117	7	R	2021-03-28	15:00:00	\N	f	18	1036
4128	1	FP1	2021-04-16	\N	\N	f	1	1037
4129	2	FP2	2021-04-16	\N	\N	f	1	1037
4125	3	Q1	2021-04-17	\N	\N	f	1	1037
4126	4	Q2	2021-04-17	\N	\N	f	1	1037
4127	5	Q3	2021-04-17	\N	\N	f	1	1037
4130	6	FP3	2021-04-17	\N	\N	f	1	1037
4124	7	R	2021-04-18	13:00:00	\N	f	18	1037
4135	1	FP1	2021-04-30	\N	\N	f	1	1038
4136	2	FP2	2021-04-30	\N	\N	f	1	1038
4132	3	Q1	2021-05-01	\N	\N	f	1	1038
4133	4	Q2	2021-05-01	\N	\N	f	1	1038
4134	5	Q3	2021-05-01	\N	\N	f	1	1038
4137	6	FP3	2021-05-01	\N	\N	f	1	1038
4131	7	R	2021-05-02	14:00:00	\N	f	18	1038
4142	1	FP1	2021-05-07	\N	\N	f	1	1039
4143	2	FP2	2021-05-07	\N	\N	f	1	1039
4139	3	Q1	2021-05-08	\N	\N	f	1	1039
4140	4	Q2	2021-05-08	\N	\N	f	1	1039
4141	5	Q3	2021-05-08	\N	\N	f	1	1039
4144	6	FP3	2021-05-08	\N	\N	f	1	1039
4138	7	R	2021-05-09	13:00:00	\N	f	18	1039
4149	1	FP1	2021-05-21	\N	\N	f	1	1040
4150	2	FP2	2021-05-21	\N	\N	f	1	1040
4146	3	Q1	2021-05-22	\N	\N	f	1	1040
4147	4	Q2	2021-05-22	\N	\N	f	1	1040
4148	5	Q3	2021-05-22	\N	\N	f	1	1040
4151	6	FP3	2021-05-22	\N	\N	f	1	1040
4145	7	R	2021-05-23	13:00:00	\N	f	18	1040
4156	1	FP1	2021-06-04	\N	\N	f	1	1041
4157	2	FP2	2021-06-04	\N	\N	f	1	1041
4153	3	Q1	2021-06-05	\N	\N	f	1	1041
4154	4	Q2	2021-06-05	\N	\N	f	1	1041
4155	5	Q3	2021-06-05	\N	\N	f	1	1041
4158	6	FP3	2021-06-05	\N	\N	f	1	1041
4152	7	R	2021-06-06	12:00:00	\N	f	18	1041
4163	1	FP1	2021-06-18	\N	\N	f	1	1042
4164	2	FP2	2021-06-18	\N	\N	f	1	1042
4160	3	Q1	2021-06-19	\N	\N	f	1	1042
4161	4	Q2	2021-06-19	\N	\N	f	1	1042
4162	5	Q3	2021-06-19	\N	\N	f	1	1042
4165	6	FP3	2021-06-19	\N	\N	f	1	1042
4159	7	R	2021-06-20	13:00:00	\N	f	18	1042
4170	1	FP1	2021-06-25	\N	\N	f	1	1043
4171	2	FP2	2021-06-25	\N	\N	f	1	1043
4167	3	Q1	2021-06-26	\N	\N	f	1	1043
4168	4	Q2	2021-06-26	\N	\N	f	1	1043
4169	5	Q3	2021-06-26	\N	\N	f	1	1043
4172	6	FP3	2021-06-26	\N	\N	f	1	1043
4166	7	R	2021-06-27	13:00:00	\N	f	18	1043
4177	1	FP1	2021-07-02	\N	\N	f	1	1044
4178	2	FP2	2021-07-02	\N	\N	f	1	1044
4174	3	Q1	2021-07-03	\N	\N	f	1	1044
4175	4	Q2	2021-07-03	\N	\N	f	1	1044
4176	5	Q3	2021-07-03	\N	\N	f	1	1044
4179	6	FP3	2021-07-03	\N	\N	f	1	1044
4173	7	R	2021-07-04	13:00:00	\N	f	18	1044
4181	1	Q1	2021-07-16	\N	\N	f	1	1045
4182	2	Q2	2021-07-16	\N	\N	f	1	1045
4183	3	Q3	2021-07-16	\N	\N	f	1	1045
4184	4	FP1	2021-07-16	\N	\N	f	1	1045
4185	5	FP2	2021-07-17	\N	\N	f	1	1045
4186	6	SR	2021-07-17	\N	\N	f	19	1045
4180	7	R	2021-07-18	14:00:00	\N	f	18	1045
4191	1	FP1	2021-07-30	\N	\N	f	1	1046
4192	2	FP2	2021-07-30	\N	\N	f	1	1046
4188	3	Q1	2021-07-31	\N	\N	f	1	1046
4189	4	Q2	2021-07-31	\N	\N	f	1	1046
4190	5	Q3	2021-07-31	\N	\N	f	1	1046
4193	6	FP3	2021-07-31	\N	\N	f	1	1046
4187	7	R	2021-08-01	13:00:00	\N	f	18	1046
4198	1	FP1	2021-08-27	\N	\N	f	1	1047
4199	2	FP2	2021-08-27	\N	\N	f	1	1047
4195	3	Q1	2021-08-28	\N	\N	f	1	1047
4196	4	Q2	2021-08-28	\N	\N	f	1	1047
4197	5	Q3	2021-08-28	\N	\N	f	1	1047
4200	6	FP3	2021-08-28	\N	\N	f	1	1047
4194	7	R	2021-08-29	13:00:00	\N	f	18	1047
4205	1	FP1	2021-09-03	\N	\N	f	1	1048
4206	2	FP2	2021-09-03	\N	\N	f	1	1048
4202	3	Q1	2021-09-04	\N	\N	f	1	1048
4203	4	Q2	2021-09-04	\N	\N	f	1	1048
4204	5	Q3	2021-09-04	\N	\N	f	1	1048
4207	6	FP3	2021-09-04	\N	\N	f	1	1048
4201	7	R	2021-09-05	13:00:00	\N	f	18	1048
4209	1	Q1	2021-09-10	\N	\N	f	1	1049
4210	2	Q2	2021-09-10	\N	\N	f	1	1049
4211	3	Q3	2021-09-10	\N	\N	f	1	1049
4212	4	FP1	2021-09-10	\N	\N	f	1	1049
4213	5	FP2	2021-09-11	\N	\N	f	1	1049
4214	6	SR	2021-09-11	\N	\N	f	19	1049
4208	7	R	2021-09-12	13:00:00	\N	f	18	1049
4219	1	FP1	2021-09-24	\N	\N	f	1	1050
4220	2	FP2	2021-09-24	\N	\N	f	1	1050
4216	3	Q1	2021-09-25	\N	\N	f	1	1050
4217	4	Q2	2021-09-25	\N	\N	f	1	1050
4218	5	Q3	2021-09-25	\N	\N	f	1	1050
4221	6	FP3	2021-09-25	\N	\N	f	1	1050
4215	7	R	2021-09-26	12:00:00	\N	f	18	1050
4226	1	FP1	2021-10-08	\N	\N	f	1	1051
4227	2	FP2	2021-10-08	\N	\N	f	1	1051
4223	3	Q1	2021-10-09	\N	\N	f	1	1051
4224	4	Q2	2021-10-09	\N	\N	f	1	1051
4225	5	Q3	2021-10-09	\N	\N	f	1	1051
4228	6	FP3	2021-10-09	\N	\N	f	1	1051
4222	7	R	2021-10-10	12:00:00	\N	f	18	1051
4233	1	FP1	2021-10-22	\N	\N	f	1	1052
4234	2	FP2	2021-10-22	\N	\N	f	1	1052
4230	3	Q1	2021-10-23	\N	\N	f	1	1052
4231	4	Q2	2021-10-23	\N	\N	f	1	1052
4232	5	Q3	2021-10-23	\N	\N	f	1	1052
4235	6	FP3	2021-10-23	\N	\N	f	1	1052
4229	7	R	2021-10-24	19:00:00	\N	f	18	1052
4240	1	FP1	2021-11-05	\N	\N	f	1	1053
4241	2	FP2	2021-11-05	\N	\N	f	1	1053
4237	3	Q1	2021-11-06	\N	\N	f	1	1053
4238	4	Q2	2021-11-06	\N	\N	f	1	1053
4239	5	Q3	2021-11-06	\N	\N	f	1	1053
4242	6	FP3	2021-11-06	\N	\N	f	1	1053
4236	7	R	2021-11-07	19:00:00	\N	f	18	1053
4244	1	Q1	2021-11-12	\N	\N	f	1	1054
4245	2	Q2	2021-11-12	\N	\N	f	1	1054
4246	3	Q3	2021-11-12	\N	\N	f	1	1054
4247	4	FP1	2021-11-12	\N	\N	f	1	1054
4248	5	FP2	2021-11-13	\N	\N	f	1	1054
4249	6	SR	2021-11-13	\N	\N	f	19	1054
4243	7	R	2021-11-14	17:00:00	\N	f	18	1054
4254	1	FP1	2021-11-19	\N	\N	f	1	1055
4255	2	FP2	2021-11-19	\N	\N	f	1	1055
4251	3	Q1	2021-11-20	\N	\N	f	1	1055
4252	4	Q2	2021-11-20	\N	\N	f	1	1055
4253	5	Q3	2021-11-20	\N	\N	f	1	1055
4256	6	FP3	2021-11-20	\N	\N	f	1	1055
4250	7	R	2021-11-21	14:00:00	\N	f	18	1055
4261	1	FP1	2021-12-03	\N	\N	f	1	1056
4262	2	FP2	2021-12-03	\N	\N	f	1	1056
4258	3	Q1	2021-12-04	\N	\N	f	1	1056
4259	4	Q2	2021-12-04	\N	\N	f	1	1056
4260	5	Q3	2021-12-04	\N	\N	f	1	1056
4263	6	FP3	2021-12-04	\N	\N	f	1	1056
4257	7	R	2021-12-05	17:30:00	\N	f	18	1056
4268	1	FP1	2021-12-10	\N	\N	f	1	1057
4269	2	FP2	2021-12-10	\N	\N	f	1	1057
4265	3	Q1	2021-12-11	\N	\N	f	1	1057
4266	4	Q2	2021-12-11	\N	\N	f	1	1057
4267	5	Q3	2021-12-11	\N	\N	f	1	1057
4270	6	FP3	2021-12-11	\N	\N	f	1	1057
4264	7	R	2021-12-12	13:00:00	\N	f	18	1057
4275	1	FP1	2022-03-18	12:00:00	\N	f	1	1058
4276	2	FP2	2022-03-18	15:00:00	\N	f	1	1058
4277	3	FP3	2022-03-19	12:00:00	\N	f	1	1058
4272	4	Q1	2022-03-19	15:00:00	\N	f	1	1058
4273	5	Q2	2022-03-19	15:00:00	\N	f	1	1058
4274	6	Q3	2022-03-19	15:00:00	\N	f	1	1058
4271	7	R	2022-03-20	15:00:00	\N	f	20	1058
4282	1	FP1	2022-03-25	14:00:00	\N	f	1	1059
4283	2	FP2	2022-03-25	17:00:00	\N	f	1	1059
4284	3	FP3	2022-03-26	14:00:00	\N	f	1	1059
4279	4	Q1	2022-03-26	17:00:00	\N	f	1	1059
4280	5	Q2	2022-03-26	17:00:00	\N	f	1	1059
4281	6	Q3	2022-03-26	17:00:00	\N	f	1	1059
4278	7	R	2022-03-27	17:00:00	\N	f	20	1059
4289	1	FP1	2022-04-08	03:00:00	\N	f	1	1060
4290	2	FP2	2022-04-08	06:00:00	\N	f	1	1060
4291	3	FP3	2022-04-09	03:00:00	\N	f	1	1060
4286	4	Q1	2022-04-09	06:00:00	\N	f	1	1060
4287	5	Q2	2022-04-09	06:00:00	\N	f	1	1060
4288	6	Q3	2022-04-09	06:00:00	\N	f	1	1060
4285	7	R	2022-04-10	05:00:00	\N	f	20	1060
4296	1	FP1	2022-04-22	11:30:00	\N	f	1	1061
4293	2	Q1	2022-04-22	15:00:00	\N	f	1	1061
4294	3	Q2	2022-04-22	15:00:00	\N	f	1	1061
4295	4	Q3	2022-04-22	15:00:00	\N	f	1	1061
4297	5	FP2	2022-04-23	10:30:00	\N	f	1	1061
4298	6	SR	2022-04-23	14:30:00	\N	f	21	1061
4292	7	R	2022-04-24	13:00:00	\N	f	20	1061
4303	1	FP1	2022-05-06	18:30:00	\N	f	1	1062
4304	2	FP2	2022-05-06	21:30:00	\N	f	1	1062
4305	3	FP3	2022-05-07	17:00:00	\N	f	1	1062
4300	4	Q1	2022-05-07	20:00:00	\N	f	1	1062
4301	5	Q2	2022-05-07	20:00:00	\N	f	1	1062
4302	6	Q3	2022-05-07	20:00:00	\N	f	1	1062
4299	7	R	2022-05-08	19:30:00	\N	f	20	1062
4310	1	FP1	2022-05-20	12:00:00	\N	f	1	1063
4311	2	FP2	2022-05-20	15:00:00	\N	f	1	1063
4312	3	FP3	2022-05-21	11:00:00	\N	f	1	1063
4307	4	Q1	2022-05-21	14:00:00	\N	f	1	1063
4308	5	Q2	2022-05-21	14:00:00	\N	f	1	1063
4309	6	Q3	2022-05-21	14:00:00	\N	f	1	1063
4306	7	R	2022-05-22	13:00:00	\N	f	20	1063
4317	1	FP1	2022-05-27	12:00:00	\N	f	1	1064
4318	2	FP2	2022-05-27	15:00:00	\N	f	1	1064
4319	3	FP3	2022-05-28	11:00:00	\N	f	1	1064
4314	4	Q1	2022-05-28	14:00:00	\N	f	1	1064
4315	5	Q2	2022-05-28	14:00:00	\N	f	1	1064
4316	6	Q3	2022-05-28	14:00:00	\N	f	1	1064
4313	7	R	2022-05-29	13:00:00	\N	f	20	1064
4324	1	FP1	2022-06-10	11:00:00	\N	f	1	1065
4325	2	FP2	2022-06-10	14:00:00	\N	f	1	1065
4326	3	FP3	2022-06-11	11:00:00	\N	f	1	1065
4321	4	Q1	2022-06-11	14:00:00	\N	f	1	1065
4322	5	Q2	2022-06-11	14:00:00	\N	f	1	1065
4323	6	Q3	2022-06-11	14:00:00	\N	f	1	1065
4320	7	R	2022-06-12	11:00:00	\N	f	20	1065
4331	1	FP1	2022-06-17	18:00:00	\N	f	1	1066
4332	2	FP2	2022-06-17	21:00:00	\N	f	1	1066
4333	3	FP3	2022-06-18	17:00:00	\N	f	1	1066
4328	4	Q1	2022-06-18	20:00:00	\N	f	1	1066
4329	5	Q2	2022-06-18	20:00:00	\N	f	1	1066
4330	6	Q3	2022-06-18	20:00:00	\N	f	1	1066
4327	7	R	2022-06-19	18:00:00	\N	f	20	1066
4338	1	FP1	2022-07-01	12:00:00	\N	f	1	1067
4339	2	FP2	2022-07-01	15:00:00	\N	f	1	1067
4340	3	FP3	2022-07-02	11:00:00	\N	f	1	1067
4335	4	Q1	2022-07-02	14:00:00	\N	f	1	1067
4336	5	Q2	2022-07-02	14:00:00	\N	f	1	1067
4337	6	Q3	2022-07-02	14:00:00	\N	f	1	1067
4334	7	R	2022-07-03	14:00:00	\N	f	20	1067
4345	1	FP1	2022-07-08	11:30:00	\N	f	1	1068
4342	2	Q1	2022-07-08	15:00:00	\N	f	1	1068
4343	3	Q2	2022-07-08	15:00:00	\N	f	1	1068
4344	4	Q3	2022-07-08	15:00:00	\N	f	1	1068
4346	5	FP2	2022-07-09	10:30:00	\N	f	1	1068
4347	6	SR	2022-07-09	14:30:00	\N	f	21	1068
4341	7	R	2022-07-10	13:00:00	\N	f	20	1068
4352	1	FP1	2022-07-22	12:00:00	\N	f	1	1069
4353	2	FP2	2022-07-22	15:00:00	\N	f	1	1069
4354	3	FP3	2022-07-23	11:00:00	\N	f	1	1069
4349	4	Q1	2022-07-23	14:00:00	\N	f	1	1069
4350	5	Q2	2022-07-23	14:00:00	\N	f	1	1069
4351	6	Q3	2022-07-23	14:00:00	\N	f	1	1069
4348	7	R	2022-07-24	13:00:00	\N	f	20	1069
4359	1	FP1	2022-07-29	12:00:00	\N	f	1	1070
4360	2	FP2	2022-07-29	15:00:00	\N	f	1	1070
4361	3	FP3	2022-07-30	11:00:00	\N	f	1	1070
4356	4	Q1	2022-07-30	14:00:00	\N	f	1	1070
4357	5	Q2	2022-07-30	14:00:00	\N	f	1	1070
4358	6	Q3	2022-07-30	14:00:00	\N	f	1	1070
4355	7	R	2022-07-31	13:00:00	\N	f	20	1070
4366	1	FP1	2022-08-26	12:00:00	\N	f	1	1071
4367	2	FP2	2022-08-26	15:00:00	\N	f	1	1071
4368	3	FP3	2022-08-27	11:00:00	\N	f	1	1071
4363	4	Q1	2022-08-27	14:00:00	\N	f	1	1071
4364	5	Q2	2022-08-27	14:00:00	\N	f	1	1071
4365	6	Q3	2022-08-27	14:00:00	\N	f	1	1071
4362	7	R	2022-08-28	13:00:00	\N	f	20	1071
4373	1	FP1	2022-09-02	10:30:00	\N	f	1	1072
4374	2	FP2	2022-09-02	14:00:00	\N	f	1	1072
4375	3	FP3	2022-09-03	10:00:00	\N	f	1	1072
4370	4	Q1	2022-09-03	13:00:00	\N	f	1	1072
4371	5	Q2	2022-09-03	13:00:00	\N	f	1	1072
4372	6	Q3	2022-09-03	13:00:00	\N	f	1	1072
4369	7	R	2022-09-04	13:00:00	\N	f	20	1072
4380	1	FP1	2022-09-09	12:00:00	\N	f	1	1073
4381	2	FP2	2022-09-09	15:00:00	\N	f	1	1073
4382	3	FP3	2022-09-10	11:00:00	\N	f	1	1073
4377	4	Q1	2022-09-10	14:00:00	\N	f	1	1073
4378	5	Q2	2022-09-10	14:00:00	\N	f	1	1073
4379	6	Q3	2022-09-10	14:00:00	\N	f	1	1073
4376	7	R	2022-09-11	13:00:00	\N	f	20	1073
4387	1	FP1	2022-09-30	10:00:00	\N	f	1	1074
4388	2	FP2	2022-09-30	13:00:00	\N	f	1	1074
4389	3	FP3	2022-10-01	10:00:00	\N	f	1	1074
4384	4	Q1	2022-10-01	13:00:00	\N	f	1	1074
4385	5	Q2	2022-10-01	13:00:00	\N	f	1	1074
4386	6	Q3	2022-10-01	13:00:00	\N	f	1	1074
4383	7	R	2022-10-02	12:00:00	\N	f	20	1074
4394	1	FP1	2022-10-07	03:00:00	\N	f	1	1075
4395	2	FP2	2022-10-07	06:00:00	\N	f	1	1075
4396	3	FP3	2022-10-08	03:00:00	\N	f	1	1075
4391	4	Q1	2022-10-08	06:00:00	\N	f	1	1075
4392	5	Q2	2022-10-08	06:00:00	\N	f	1	1075
4393	6	Q3	2022-10-08	06:00:00	\N	f	1	1075
4390	7	R	2022-10-09	05:00:00	\N	f	20	1075
4401	1	FP1	2022-10-21	19:00:00	\N	f	1	1076
4402	2	FP2	2022-10-21	22:00:00	\N	f	1	1076
4403	3	FP3	2022-10-22	19:00:00	\N	f	1	1076
4398	4	Q1	2022-10-22	22:00:00	\N	f	1	1076
4399	5	Q2	2022-10-22	22:00:00	\N	f	1	1076
4400	6	Q3	2022-10-22	22:00:00	\N	f	1	1076
4397	7	R	2022-10-23	19:00:00	\N	f	20	1076
4408	1	FP1	2022-10-28	18:00:00	\N	f	1	1077
4409	2	FP2	2022-10-28	21:00:00	\N	f	1	1077
4410	3	FP3	2022-10-29	17:00:00	\N	f	1	1077
4405	4	Q1	2022-10-29	20:00:00	\N	f	1	1077
4406	5	Q2	2022-10-29	20:00:00	\N	f	1	1077
4407	6	Q3	2022-10-29	20:00:00	\N	f	1	1077
4404	7	R	2022-10-30	20:00:00	\N	f	20	1077
4415	1	FP1	2022-11-11	15:30:00	\N	f	1	1078
4412	2	Q1	2022-11-11	19:00:00	\N	f	1	1078
4413	3	Q2	2022-11-11	19:00:00	\N	f	1	1078
4414	4	Q3	2022-11-11	19:00:00	\N	f	1	1078
4416	5	FP2	2022-11-12	15:30:00	\N	f	1	1078
4417	6	SR	2022-11-12	19:30:00	\N	f	21	1078
4411	7	R	2022-11-13	18:00:00	\N	f	20	1078
4422	1	FP1	2022-11-18	10:00:00	\N	f	1	1079
4423	2	FP2	2022-11-18	13:00:00	\N	f	1	1079
4424	3	FP3	2022-11-19	11:00:00	\N	f	1	1079
4419	4	Q1	2022-11-19	14:00:00	\N	f	1	1079
4420	5	Q2	2022-11-19	14:00:00	\N	f	1	1079
4421	6	Q3	2022-11-19	14:00:00	\N	f	1	1079
4418	7	R	2022-11-20	13:00:00	\N	f	20	1079
4429	1	FP1	2023-03-03	11:30:00	\N	f	1	1080
4430	2	FP2	2023-03-03	15:00:00	\N	f	1	1080
4431	3	FP3	2023-03-04	11:30:00	\N	f	1	1080
4426	4	Q1	2023-03-04	15:00:00	\N	f	1	1080
4427	5	Q2	2023-03-04	15:00:00	\N	f	1	1080
4428	6	Q3	2023-03-04	15:00:00	\N	f	1	1080
4425	7	R	2023-03-05	15:00:00	\N	f	22	1080
4436	1	FP1	2023-03-17	13:30:00	\N	f	1	1081
4437	2	FP2	2023-03-17	17:00:00	\N	f	1	1081
4438	3	FP3	2023-03-18	13:30:00	\N	f	1	1081
4433	4	Q1	2023-03-18	17:00:00	\N	f	1	1081
4434	5	Q2	2023-03-18	17:00:00	\N	f	1	1081
4435	6	Q3	2023-03-18	17:00:00	\N	f	1	1081
4432	7	R	2023-03-19	17:00:00	\N	f	22	1081
4443	1	FP1	2023-03-31	01:30:00	\N	f	1	1082
4444	2	FP2	2023-03-31	05:00:00	\N	f	1	1082
4445	3	FP3	2023-04-01	01:30:00	\N	f	1	1082
4440	4	Q1	2023-04-01	05:00:00	\N	f	1	1082
4441	5	Q2	2023-04-01	05:00:00	\N	f	1	1082
4442	6	Q3	2023-04-01	05:00:00	\N	f	1	1082
4439	7	R	2023-04-02	05:00:00	\N	f	22	1082
4450	1	FP1	2023-04-28	09:30:00	\N	f	1	1083
4447	2	Q1	2023-04-28	13:00:00	\N	f	1	1083
4448	3	Q2	2023-04-28	13:00:00	\N	f	1	1083
4449	4	Q3	2023-04-28	13:00:00	\N	f	1	1083
4451	5	SQ1	2023-04-29	09:30:00	\N	f	1	1083
4452	6	SQ2	2023-04-29	09:30:00	\N	f	1	1083
4453	7	SQ3	2023-04-29	09:30:00	\N	f	1	1083
4454	8	SR	2023-04-29	13:30:00	\N	f	23	1083
4446	9	R	2023-04-30	11:00:00	\N	f	22	1083
4459	1	FP1	2023-05-05	18:00:00	\N	f	1	1084
4460	2	FP2	2023-05-05	21:30:00	\N	f	1	1084
4461	3	FP3	2023-05-06	16:30:00	\N	f	1	1084
4456	4	Q1	2023-05-06	20:00:00	\N	f	1	1084
4457	5	Q2	2023-05-06	20:00:00	\N	f	1	1084
4458	6	Q3	2023-05-06	20:00:00	\N	f	1	1084
4455	7	R	2023-05-07	19:30:00	\N	f	22	1084
4466	1	FP1	2023-05-26	11:30:00	\N	f	1	1085
4467	2	FP2	2023-05-26	15:00:00	\N	f	1	1085
4468	3	FP3	2023-05-27	10:30:00	\N	f	1	1085
4463	4	Q1	2023-05-27	14:00:00	\N	f	1	1085
4464	5	Q2	2023-05-27	14:00:00	\N	f	1	1085
4465	6	Q3	2023-05-27	14:00:00	\N	f	1	1085
4462	7	R	2023-05-28	13:00:00	\N	f	22	1085
4473	1	FP1	2023-06-02	11:30:00	\N	f	1	1086
4474	2	FP2	2023-06-02	15:00:00	\N	f	1	1086
4475	3	FP3	2023-06-03	10:30:00	\N	f	1	1086
4470	4	Q1	2023-06-03	14:00:00	\N	f	1	1086
4471	5	Q2	2023-06-03	14:00:00	\N	f	1	1086
4472	6	Q3	2023-06-03	14:00:00	\N	f	1	1086
4469	7	R	2023-06-04	13:00:00	\N	f	22	1086
4480	1	FP1	2023-06-16	17:30:00	\N	f	1	1087
4481	2	FP2	2023-06-16	21:00:00	\N	f	1	1087
4482	3	FP3	2023-06-17	16:30:00	\N	f	1	1087
4477	4	Q1	2023-06-17	20:00:00	\N	f	1	1087
4478	5	Q2	2023-06-17	20:00:00	\N	f	1	1087
4479	6	Q3	2023-06-17	20:00:00	\N	f	1	1087
4476	7	R	2023-06-18	18:00:00	\N	f	22	1087
4487	1	FP1	2023-06-30	11:30:00	\N	f	1	1088
4484	2	Q1	2023-06-30	15:00:00	\N	f	1	1088
4485	3	Q2	2023-06-30	15:00:00	\N	f	1	1088
4486	4	Q3	2023-06-30	15:00:00	\N	f	1	1088
4488	5	SQ1	2023-07-01	10:30:00	\N	f	1	1088
4489	6	SQ2	2023-07-01	10:30:00	\N	f	1	1088
4490	7	SQ3	2023-07-01	10:30:00	\N	f	1	1088
4491	8	SR	2023-07-01	14:30:00	\N	f	23	1088
4483	9	R	2023-07-02	13:00:00	\N	f	22	1088
4496	1	FP1	2023-07-07	11:30:00	\N	f	1	1089
4497	2	FP2	2023-07-07	15:00:00	\N	f	1	1089
4498	3	FP3	2023-07-08	10:30:00	\N	f	1	1089
4493	4	Q1	2023-07-08	14:00:00	\N	f	1	1089
4494	5	Q2	2023-07-08	14:00:00	\N	f	1	1089
4495	6	Q3	2023-07-08	14:00:00	\N	f	1	1089
4492	7	R	2023-07-09	14:00:00	\N	f	22	1089
4503	1	FP1	2023-07-21	11:30:00	\N	f	1	1090
4504	2	FP2	2023-07-21	15:00:00	\N	f	1	1090
4505	3	FP3	2023-07-22	10:30:00	\N	f	1	1090
4500	4	Q1	2023-07-22	14:00:00	\N	f	1	1090
4501	5	Q2	2023-07-22	14:00:00	\N	f	1	1090
4502	6	Q3	2023-07-22	14:00:00	\N	f	1	1090
4499	7	R	2023-07-23	13:00:00	\N	f	22	1090
4510	1	FP1	2023-07-28	11:30:00	\N	f	1	1091
4507	2	Q1	2023-07-28	15:00:00	\N	f	1	1091
4508	3	Q2	2023-07-28	15:00:00	\N	f	1	1091
4509	4	Q3	2023-07-28	15:00:00	\N	f	1	1091
4511	5	SQ1	2023-07-29	10:30:00	\N	f	1	1091
4512	6	SQ2	2023-07-29	10:30:00	\N	f	1	1091
4513	7	SQ3	2023-07-29	10:30:00	\N	f	1	1091
4514	8	SR	2023-07-29	14:30:00	\N	f	23	1091
4506	9	R	2023-07-30	13:00:00	\N	f	22	1091
4519	1	FP1	2023-08-25	10:30:00	\N	f	1	1092
4520	2	FP2	2023-08-25	14:00:00	\N	f	1	1092
4521	3	FP3	2023-08-26	09:30:00	\N	f	1	1092
4516	4	Q1	2023-08-26	13:00:00	\N	f	1	1092
4517	5	Q2	2023-08-26	13:00:00	\N	f	1	1092
4518	6	Q3	2023-08-26	13:00:00	\N	f	1	1092
4515	7	R	2023-08-27	13:00:00	\N	f	22	1092
4526	1	FP1	2023-09-01	11:30:00	\N	f	1	1093
4527	2	FP2	2023-09-01	15:00:00	\N	f	1	1093
4528	3	FP3	2023-09-02	10:30:00	\N	f	1	1093
4523	4	Q1	2023-09-02	14:00:00	\N	f	1	1093
4524	5	Q2	2023-09-02	14:00:00	\N	f	1	1093
4525	6	Q3	2023-09-02	14:00:00	\N	f	1	1093
4522	7	R	2023-09-03	13:00:00	\N	f	22	1093
4533	1	FP1	2023-09-15	09:30:00	\N	f	1	1094
4534	2	FP2	2023-09-15	13:00:00	\N	f	1	1094
4535	3	FP3	2023-09-16	09:30:00	\N	f	1	1094
4530	4	Q1	2023-09-16	13:00:00	\N	f	1	1094
4531	5	Q2	2023-09-16	13:00:00	\N	f	1	1094
4532	6	Q3	2023-09-16	13:00:00	\N	f	1	1094
4529	7	R	2023-09-17	12:00:00	\N	f	22	1094
4540	1	FP1	2023-09-22	02:30:00	\N	f	1	1095
4541	2	FP2	2023-09-22	06:00:00	\N	f	1	1095
4542	3	FP3	2023-09-23	02:30:00	\N	f	1	1095
4537	4	Q1	2023-09-23	06:00:00	\N	f	1	1095
4538	5	Q2	2023-09-23	06:00:00	\N	f	1	1095
4539	6	Q3	2023-09-23	06:00:00	\N	f	1	1095
4536	7	R	2023-09-24	05:00:00	\N	f	22	1095
4547	1	FP1	2023-10-06	13:30:00	\N	f	1	1096
4544	2	Q1	2023-10-06	17:00:00	\N	f	1	1096
4545	3	Q2	2023-10-06	17:00:00	\N	f	1	1096
4546	4	Q3	2023-10-06	17:00:00	\N	f	1	1096
4548	5	SQ1	2023-10-07	13:00:00	\N	f	1	1096
4549	6	SQ2	2023-10-07	13:00:00	\N	f	1	1096
4550	7	SQ3	2023-10-07	13:00:00	\N	f	1	1096
4551	8	SR	2023-10-07	17:30:00	\N	f	23	1096
4543	9	R	2023-10-08	17:00:00	\N	f	22	1096
4556	1	FP1	2023-10-20	17:30:00	\N	f	1	1097
4553	2	Q1	2023-10-20	21:00:00	\N	f	1	1097
4554	3	Q2	2023-10-20	21:00:00	\N	f	1	1097
4555	4	Q3	2023-10-20	21:00:00	\N	f	1	1097
4557	5	SQ1	2023-10-21	18:00:00	\N	f	1	1097
4558	6	SQ2	2023-10-21	18:00:00	\N	f	1	1097
4559	7	SQ3	2023-10-21	18:00:00	\N	f	1	1097
4560	8	SR	2023-10-21	22:00:00	\N	f	23	1097
4552	9	R	2023-10-22	19:00:00	\N	f	22	1097
4565	1	FP1	2023-10-27	18:30:00	\N	f	1	1098
4566	2	FP2	2023-10-27	22:00:00	\N	f	1	1098
4567	3	FP3	2023-10-28	17:30:00	\N	f	1	1098
4562	4	Q1	2023-10-28	21:00:00	\N	f	1	1098
4563	5	Q2	2023-10-28	21:00:00	\N	f	1	1098
4564	6	Q3	2023-10-28	21:00:00	\N	f	1	1098
4561	7	R	2023-10-29	20:00:00	\N	f	22	1098
4572	1	FP1	2023-11-03	14:30:00	\N	f	1	1099
4569	2	Q1	2023-11-03	18:00:00	\N	f	1	1099
4570	3	Q2	2023-11-03	18:00:00	\N	f	1	1099
4571	4	Q3	2023-11-03	18:00:00	\N	f	1	1099
4573	5	SQ1	2023-11-04	14:30:00	\N	f	1	1099
4574	6	SQ2	2023-11-04	14:30:00	\N	f	1	1099
4575	7	SQ3	2023-11-04	14:30:00	\N	f	1	1099
4576	8	SR	2023-11-04	18:30:00	\N	f	23	1099
4568	9	R	2023-11-05	17:00:00	\N	f	22	1099
4581	1	FP1	2023-11-16	04:30:00	\N	f	1	1100
4582	2	FP2	2023-11-16	08:00:00	\N	f	1	1100
4583	3	FP3	2023-11-17	04:30:00	\N	f	1	1100
4578	4	Q1	2023-11-17	08:00:00	\N	f	1	1100
4579	5	Q2	2023-11-17	08:00:00	\N	f	1	1100
4580	6	Q3	2023-11-17	08:00:00	\N	f	1	1100
4577	7	R	2023-11-19	06:00:00	\N	f	22	1100
4588	1	FP1	2023-11-24	09:30:00	\N	f	1	1101
4589	2	FP2	2023-11-24	13:00:00	\N	f	1	1101
4590	3	FP3	2023-11-25	10:30:00	\N	f	1	1101
4585	4	Q1	2023-11-25	14:00:00	\N	f	1	1101
4586	5	Q2	2023-11-25	14:00:00	\N	f	1	1101
4587	6	Q3	2023-11-25	14:00:00	\N	f	1	1101
4584	7	R	2023-11-26	13:00:00	\N	f	22	1101
4595	1	FP1	2024-02-29	11:30:00	\N	f	1	1102
4596	2	FP2	2024-02-29	15:00:00	\N	f	1	1102
4597	3	FP3	2024-03-01	12:30:00	\N	f	1	1102
4592	4	Q1	2024-03-01	16:00:00	\N	f	1	1102
4593	5	Q2	2024-03-01	16:00:00	\N	f	1	1102
4594	6	Q3	2024-03-01	16:00:00	\N	f	1	1102
4591	7	R	2024-03-02	15:00:00	\N	f	22	1102
4602	1	FP1	2024-03-07	13:30:00	\N	f	1	1103
4603	2	FP2	2024-03-07	17:00:00	\N	f	1	1103
4604	3	FP3	2024-03-08	13:30:00	\N	f	1	1103
4599	4	Q1	2024-03-08	17:00:00	\N	f	1	1103
4600	5	Q2	2024-03-08	17:00:00	\N	f	1	1103
4601	6	Q3	2024-03-08	17:00:00	\N	f	1	1103
4598	7	R	2024-03-09	17:00:00	\N	f	22	1103
4609	1	FP1	2024-03-22	01:30:00	\N	f	1	1104
4610	2	FP2	2024-03-22	05:00:00	\N	f	1	1104
4611	3	FP3	2024-03-23	01:30:00	\N	f	1	1104
4606	4	Q1	2024-03-23	05:00:00	\N	f	1	1104
4607	5	Q2	2024-03-23	05:00:00	\N	f	1	1104
4608	6	Q3	2024-03-23	05:00:00	\N	f	1	1104
4605	7	R	2024-03-24	04:00:00	\N	f	22	1104
4616	1	FP1	2024-04-05	02:30:00	\N	f	1	1105
4617	2	FP2	2024-04-05	06:00:00	\N	f	1	1105
4618	3	FP3	2024-04-06	02:30:00	\N	f	1	1105
4613	4	Q1	2024-04-06	06:00:00	\N	f	1	1105
4614	5	Q2	2024-04-06	06:00:00	\N	f	1	1105
4615	6	Q3	2024-04-06	06:00:00	\N	f	1	1105
4612	7	R	2024-04-07	05:00:00	\N	f	22	1105
4623	1	FP1	2024-04-19	03:30:00	\N	f	1	1106
4624	2	SQ1	2024-04-19	07:30:00	\N	f	1	1106
4625	3	SQ2	2024-04-19	07:30:00	\N	f	1	1106
4626	4	SQ3	2024-04-19	07:30:00	\N	f	1	1106
4627	5	SR	2024-04-20	03:00:00	\N	f	23	1106
4620	6	Q1	2024-04-20	07:00:00	\N	f	1	1106
4621	7	Q2	2024-04-20	07:00:00	\N	f	1	1106
4622	8	Q3	2024-04-20	07:00:00	\N	f	1	1106
4619	9	R	2024-04-21	07:00:00	\N	f	22	1106
4632	1	FP1	2024-05-03	16:30:00	\N	f	1	1107
4633	2	SQ1	2024-05-03	20:30:00	\N	f	1	1107
4634	3	SQ2	2024-05-03	20:30:00	\N	f	1	1107
4635	4	SQ3	2024-05-03	20:30:00	\N	f	1	1107
4636	5	SR	2024-05-04	16:00:00	\N	f	23	1107
4629	6	Q1	2024-05-04	20:00:00	\N	f	1	1107
4630	7	Q2	2024-05-04	20:00:00	\N	f	1	1107
4631	8	Q3	2024-05-04	20:00:00	\N	f	1	1107
4628	9	R	2024-05-05	20:00:00	\N	f	22	1107
4641	1	FP1	2024-05-17	11:30:00	\N	f	1	1108
4642	2	FP2	2024-05-17	15:00:00	\N	f	1	1108
4643	3	FP3	2024-05-18	10:30:00	\N	f	1	1108
4638	4	Q1	2024-05-18	14:00:00	\N	f	1	1108
4639	5	Q2	2024-05-18	14:00:00	\N	f	1	1108
4640	6	Q3	2024-05-18	14:00:00	\N	f	1	1108
4637	7	R	2024-05-19	13:00:00	\N	f	22	1108
4648	1	FP1	2024-05-24	11:30:00	\N	f	1	1109
4649	2	FP2	2024-05-24	15:00:00	\N	f	1	1109
4650	3	FP3	2024-05-25	10:30:00	\N	f	1	1109
4645	4	Q1	2024-05-25	14:00:00	\N	f	1	1109
4646	5	Q2	2024-05-25	14:00:00	\N	f	1	1109
4647	6	Q3	2024-05-25	14:00:00	\N	f	1	1109
4644	7	R	2024-05-26	13:00:00	\N	f	22	1109
4655	1	FP1	2024-06-07	17:30:00	\N	f	1	1110
4656	2	FP2	2024-06-07	21:00:00	\N	f	1	1110
4657	3	FP3	2024-06-08	16:30:00	\N	f	1	1110
4652	4	Q1	2024-06-08	20:00:00	\N	f	1	1110
4653	5	Q2	2024-06-08	20:00:00	\N	f	1	1110
4654	6	Q3	2024-06-08	20:00:00	\N	f	1	1110
4651	7	R	2024-06-09	18:00:00	\N	f	22	1110
4662	1	FP1	2024-06-21	11:30:00	\N	f	1	1111
4663	2	FP2	2024-06-21	15:00:00	\N	f	1	1111
4664	3	FP3	2024-06-22	10:30:00	\N	f	1	1111
4659	4	Q1	2024-06-22	14:00:00	\N	f	1	1111
4660	5	Q2	2024-06-22	14:00:00	\N	f	1	1111
4661	6	Q3	2024-06-22	14:00:00	\N	f	1	1111
4658	7	R	2024-06-23	13:00:00	\N	f	22	1111
4669	1	FP1	2024-06-28	10:30:00	\N	f	1	1112
4670	2	SQ1	2024-06-28	14:30:00	\N	f	1	1112
4671	3	SQ2	2024-06-28	14:30:00	\N	f	1	1112
4672	4	SQ3	2024-06-28	14:30:00	\N	f	1	1112
4673	5	SR	2024-06-29	10:00:00	\N	f	23	1112
4666	6	Q1	2024-06-29	14:00:00	\N	f	1	1112
4667	7	Q2	2024-06-29	14:00:00	\N	f	1	1112
4668	8	Q3	2024-06-29	14:00:00	\N	f	1	1112
4665	9	R	2024-06-30	13:00:00	\N	f	22	1112
4678	1	FP1	2024-07-05	11:30:00	\N	f	1	1113
4679	2	FP2	2024-07-05	15:00:00	\N	f	1	1113
4680	3	FP3	2024-07-06	10:30:00	\N	f	1	1113
4675	4	Q1	2024-07-06	14:00:00	\N	f	1	1113
4676	5	Q2	2024-07-06	14:00:00	\N	f	1	1113
4677	6	Q3	2024-07-06	14:00:00	\N	f	1	1113
4674	7	R	2024-07-07	14:00:00	\N	f	22	1113
4685	1	FP1	2024-07-19	11:30:00	\N	f	1	1114
4686	2	FP2	2024-07-19	15:00:00	\N	f	1	1114
4687	3	FP3	2024-07-20	10:30:00	\N	f	1	1114
4682	4	Q1	2024-07-20	14:00:00	\N	f	1	1114
4683	5	Q2	2024-07-20	14:00:00	\N	f	1	1114
4684	6	Q3	2024-07-20	14:00:00	\N	f	1	1114
4681	7	R	2024-07-21	13:00:00	\N	f	22	1114
4692	1	FP1	2024-07-26	11:30:00	\N	f	1	1115
4693	2	FP2	2024-07-26	15:00:00	\N	f	1	1115
4694	3	FP3	2024-07-27	10:30:00	\N	f	1	1115
4689	4	Q1	2024-07-27	14:00:00	\N	f	1	1115
4690	5	Q2	2024-07-27	14:00:00	\N	f	1	1115
4691	6	Q3	2024-07-27	14:00:00	\N	f	1	1115
4688	7	R	2024-07-28	13:00:00	\N	f	22	1115
4699	1	FP1	2024-08-23	10:30:00	\N	f	1	1116
4700	2	FP2	2024-08-23	14:00:00	\N	f	1	1116
4701	3	FP3	2024-08-24	09:30:00	\N	f	1	1116
4696	4	Q1	2024-08-24	13:00:00	\N	f	1	1116
4697	5	Q2	2024-08-24	13:00:00	\N	f	1	1116
4698	6	Q3	2024-08-24	13:00:00	\N	f	1	1116
4695	7	R	2024-08-25	13:00:00	\N	f	22	1116
4706	1	FP1	2024-08-30	11:30:00	\N	f	1	1117
4707	2	FP2	2024-08-30	15:00:00	\N	f	1	1117
4708	3	FP3	2024-08-31	10:30:00	\N	f	1	1117
4703	4	Q1	2024-08-31	14:00:00	\N	f	1	1117
4704	5	Q2	2024-08-31	14:00:00	\N	f	1	1117
4705	6	Q3	2024-08-31	14:00:00	\N	f	1	1117
4702	7	R	2024-09-01	13:00:00	\N	f	22	1117
4713	1	FP1	2024-09-13	09:30:00	\N	f	1	1118
4714	2	FP2	2024-09-13	13:00:00	\N	f	1	1118
4715	3	FP3	2024-09-14	08:30:00	\N	f	1	1118
4710	4	Q1	2024-09-14	12:00:00	\N	f	1	1118
4711	5	Q2	2024-09-14	12:00:00	\N	f	1	1118
4712	6	Q3	2024-09-14	12:00:00	\N	f	1	1118
4709	7	R	2024-09-15	11:00:00	\N	f	22	1118
4720	1	FP1	2024-09-20	09:30:00	\N	f	1	1119
4721	2	FP2	2024-09-20	13:00:00	\N	f	1	1119
4722	3	FP3	2024-09-21	09:30:00	\N	f	1	1119
4717	4	Q1	2024-09-21	13:00:00	\N	f	1	1119
4718	5	Q2	2024-09-21	13:00:00	\N	f	1	1119
4719	6	Q3	2024-09-21	13:00:00	\N	f	1	1119
4716	7	R	2024-09-22	12:00:00	\N	f	22	1119
4727	1	FP1	2024-10-18	17:30:00	\N	f	1	1120
4728	2	SQ1	2024-10-18	21:30:00	\N	f	1	1120
4729	3	SQ2	2024-10-18	21:30:00	\N	f	1	1120
4730	4	SQ3	2024-10-18	21:30:00	\N	f	1	1120
4731	5	SR	2024-10-19	18:00:00	\N	f	23	1120
4724	6	Q1	2024-10-19	22:00:00	\N	f	1	1120
4725	7	Q2	2024-10-19	22:00:00	\N	f	1	1120
4726	8	Q3	2024-10-19	22:00:00	\N	f	1	1120
4723	9	R	2024-10-20	19:00:00	\N	f	22	1120
4736	1	FP1	2024-10-25	18:30:00	\N	f	1	1121
4737	2	FP2	2024-10-25	22:00:00	\N	f	1	1121
4738	3	FP3	2024-10-26	17:30:00	\N	f	1	1121
4733	4	Q1	2024-10-26	21:00:00	\N	f	1	1121
4734	5	Q2	2024-10-26	21:00:00	\N	f	1	1121
4735	6	Q3	2024-10-26	21:00:00	\N	f	1	1121
4732	7	R	2024-10-27	20:00:00	\N	f	22	1121
4743	1	FP1	2024-11-01	14:30:00	\N	f	1	1122
4744	2	SQ1	2024-11-01	18:30:00	\N	f	1	1122
4745	3	SQ2	2024-11-01	18:30:00	\N	f	1	1122
4746	4	SQ3	2024-11-01	18:30:00	\N	f	1	1122
4747	5	SR	2024-11-02	14:00:00	\N	f	23	1122
4740	6	Q1	2024-11-02	18:00:00	\N	f	1	1122
4741	7	Q2	2024-11-02	18:00:00	\N	f	1	1122
4742	8	Q3	2024-11-02	18:00:00	\N	f	1	1122
4739	9	R	2024-11-03	17:00:00	\N	f	22	1122
4752	1	FP1	2024-11-21	02:30:00	\N	f	1	1123
4753	2	FP2	2024-11-21	06:00:00	\N	f	1	1123
4754	3	FP3	2024-11-22	02:30:00	\N	f	1	1123
4749	4	Q1	2024-11-22	06:00:00	\N	f	1	1123
4750	5	Q2	2024-11-22	06:00:00	\N	f	1	1123
4751	6	Q3	2024-11-22	06:00:00	\N	f	1	1123
4748	7	R	2024-11-23	06:00:00	\N	f	22	1123
4759	1	FP1	2024-11-29	13:30:00	\N	f	1	1124
4760	2	SQ1	2024-11-29	17:30:00	\N	f	1	1124
4761	3	SQ2	2024-11-29	17:30:00	\N	f	1	1124
4762	4	SQ3	2024-11-29	17:30:00	\N	f	1	1124
4763	5	SR	2024-11-30	13:00:00	\N	f	23	1124
4756	6	Q1	2024-11-30	17:00:00	\N	f	1	1124
4757	7	Q2	2024-11-30	17:00:00	\N	f	1	1124
4758	8	Q3	2024-11-30	17:00:00	\N	f	1	1124
4755	9	R	2024-12-01	17:00:00	\N	f	22	1124
4768	1	FP1	2024-12-06	09:30:00	\N	f	1	1125
4769	2	FP2	2024-12-06	13:00:00	\N	f	1	1125
4770	3	FP3	2024-12-07	10:30:00	\N	f	1	1125
4765	4	Q1	2024-12-07	14:00:00	\N	f	1	1125
4766	5	Q2	2024-12-07	14:00:00	\N	f	1	1125
4767	6	Q3	2024-12-07	14:00:00	\N	f	1	1125
4764	7	R	2024-12-08	13:00:00	\N	f	22	1125
3	\N	QB	1950-05-12	\N	\N	f	1	1
6	\N	QB	1950-05-20	\N	\N	f	1	2
9	\N	QB	1950-05-29	\N	\N	f	1	3
12	\N	QB	1950-06-03	\N	\N	f	1	4
15	\N	QB	1950-06-17	\N	\N	f	1	5
18	\N	QB	1950-07-01	\N	\N	f	1	6
21	\N	QB	1950-09-02	\N	\N	f	1	7
24	\N	QB	1951-05-26	\N	\N	f	1	8
27	\N	QB	1951-05-29	\N	\N	f	1	9
30	\N	QB	1951-06-16	\N	\N	f	1	10
33	\N	QB	1951-06-30	\N	\N	f	1	11
36	\N	QB	1951-07-13	\N	\N	f	1	12
39	\N	QB	1951-07-28	\N	\N	f	1	13
42	\N	QB	1951-09-15	\N	\N	f	1	14
45	\N	QB	1951-10-27	\N	\N	f	1	15
48	\N	QB	1952-05-17	\N	\N	f	1	16
51	\N	QB	1952-05-29	\N	\N	f	1	17
54	\N	QB	1952-06-21	\N	\N	f	1	18
57	\N	QB	1952-07-05	\N	\N	f	1	19
60	\N	QB	1952-07-18	\N	\N	f	1	20
63	\N	QB	1952-08-02	\N	\N	f	1	21
66	\N	QB	1952-08-16	\N	\N	f	1	22
69	\N	QB	1952-09-06	\N	\N	f	1	23
72	\N	QB	1953-01-17	\N	\N	f	1	24
75	\N	QB	1953-05-29	\N	\N	f	1	25
78	\N	QB	1953-06-06	\N	\N	f	1	26
81	\N	QB	1953-06-20	\N	\N	f	1	27
84	\N	QB	1953-07-04	\N	\N	f	1	28
87	\N	QB	1953-07-17	\N	\N	f	1	29
90	\N	QB	1953-08-01	\N	\N	f	1	30
93	\N	QB	1953-08-22	\N	\N	f	1	31
96	\N	QB	1953-09-12	\N	\N	f	1	32
99	\N	QB	1954-01-16	\N	\N	f	1	33
102	\N	QB	1954-05-30	\N	\N	f	1	34
105	\N	QB	1954-06-19	\N	\N	f	1	35
108	\N	QB	1954-07-03	\N	\N	f	1	36
111	\N	QB	1954-07-16	\N	\N	f	1	37
114	\N	QB	1954-07-31	\N	\N	f	1	38
117	\N	QB	1954-08-21	\N	\N	f	1	39
120	\N	QB	1954-09-04	\N	\N	f	1	40
123	\N	QB	1954-10-23	\N	\N	f	1	41
126	\N	QB	1955-01-15	\N	\N	f	1	42
129	\N	QB	1955-05-21	\N	\N	f	1	43
132	\N	QB	1955-05-29	\N	\N	f	1	44
135	\N	QB	1955-06-04	\N	\N	f	1	45
138	\N	QB	1955-06-18	\N	\N	f	1	46
141	\N	QB	1955-07-15	\N	\N	f	1	47
144	\N	QB	1955-09-10	\N	\N	f	1	48
147	\N	QB	1956-01-21	\N	\N	f	1	49
150	\N	QB	1956-05-12	\N	\N	f	1	50
153	\N	QB	1956-05-29	\N	\N	f	1	51
156	\N	QB	1956-06-02	\N	\N	f	1	52
159	\N	QB	1956-06-30	\N	\N	f	1	53
162	\N	QB	1956-07-13	\N	\N	f	1	54
165	\N	QB	1956-08-04	\N	\N	f	1	55
168	\N	QB	1956-09-01	\N	\N	f	1	56
171	\N	QB	1957-01-12	\N	\N	f	1	57
174	\N	QB	1957-05-18	\N	\N	f	1	58
177	\N	QB	1957-05-29	\N	\N	f	1	59
180	\N	QB	1957-07-06	\N	\N	f	1	60
183	\N	QB	1957-07-19	\N	\N	f	1	61
186	\N	QB	1957-08-03	\N	\N	f	1	62
189	\N	QB	1957-08-17	\N	\N	f	1	63
192	\N	QB	1957-09-07	\N	\N	f	1	64
195	\N	QB	1958-01-18	\N	\N	f	1	65
198	\N	QB	1958-05-17	\N	\N	f	1	66
201	\N	QB	1958-05-25	\N	\N	f	1	67
204	\N	QB	1958-05-29	\N	\N	f	1	68
207	\N	QB	1958-06-14	\N	\N	f	1	69
210	\N	QB	1958-07-05	\N	\N	f	1	70
213	\N	QB	1958-07-18	\N	\N	f	1	71
216	\N	QB	1958-08-02	\N	\N	f	1	72
219	\N	QB	1958-08-23	\N	\N	f	1	73
222	\N	QB	1958-09-06	\N	\N	f	1	74
225	\N	QB	1958-10-18	\N	\N	f	1	75
228	\N	QB	1959-05-09	\N	\N	f	1	76
231	\N	QB	1959-05-29	\N	\N	f	1	77
234	\N	QB	1959-05-30	\N	\N	f	1	78
237	\N	QB	1959-07-04	\N	\N	f	1	79
240	\N	QB	1959-07-17	\N	\N	f	1	80
243	\N	QB	1959-08-01	\N	\N	f	1	81
246	\N	QB	1959-08-22	\N	\N	f	1	82
249	\N	QB	1959-09-12	\N	\N	f	1	83
252	\N	QB	1959-12-11	\N	\N	f	1	84
255	\N	QB	1960-02-06	\N	\N	f	1	85
258	\N	QB	1960-05-28	\N	\N	f	1	86
261	\N	QB	1960-05-29	\N	\N	f	1	87
264	\N	QB	1960-06-05	\N	\N	f	1	88
267	\N	QB	1960-06-18	\N	\N	f	1	89
270	\N	QB	1960-07-02	\N	\N	f	1	90
273	\N	QB	1960-07-15	\N	\N	f	1	91
276	\N	QB	1960-08-13	\N	\N	f	1	92
279	\N	QB	1960-09-03	\N	\N	f	1	93
282	\N	QB	1960-11-19	\N	\N	f	1	94
285	\N	QB	1961-05-13	\N	\N	f	1	95
288	\N	QB	1961-05-21	\N	\N	f	1	96
291	\N	QB	1961-06-17	\N	\N	f	1	97
294	\N	QB	1961-07-01	\N	\N	f	1	98
297	\N	QB	1961-07-14	\N	\N	f	1	99
300	\N	QB	1961-08-05	\N	\N	f	1	100
303	\N	QB	1961-09-09	\N	\N	f	1	101
306	\N	QB	1961-10-07	\N	\N	f	1	102
309	\N	QB	1962-05-19	\N	\N	f	1	103
312	\N	QB	1962-06-02	\N	\N	f	1	104
315	\N	QB	1962-06-16	\N	\N	f	1	105
318	\N	QB	1962-07-07	\N	\N	f	1	106
321	\N	QB	1962-07-20	\N	\N	f	1	107
324	\N	QB	1962-08-04	\N	\N	f	1	108
327	\N	QB	1962-09-15	\N	\N	f	1	109
330	\N	QB	1962-10-06	\N	\N	f	1	110
333	\N	QB	1962-12-28	\N	\N	f	1	111
336	\N	QB	1963-05-25	\N	\N	f	1	112
339	\N	QB	1963-06-08	\N	\N	f	1	113
342	\N	QB	1963-06-22	\N	\N	f	1	114
345	\N	QB	1963-06-29	\N	\N	f	1	115
348	\N	QB	1963-07-19	\N	\N	f	1	116
351	\N	QB	1963-08-03	\N	\N	f	1	117
354	\N	QB	1963-09-07	\N	\N	f	1	118
357	\N	QB	1963-10-05	\N	\N	f	1	119
360	\N	QB	1963-10-26	\N	\N	f	1	120
363	\N	QB	1963-12-27	\N	\N	f	1	121
366	\N	QB	1964-05-09	\N	\N	f	1	122
369	\N	QB	1964-05-23	\N	\N	f	1	123
372	\N	QB	1964-06-13	\N	\N	f	1	124
375	\N	QB	1964-06-27	\N	\N	f	1	125
378	\N	QB	1964-07-10	\N	\N	f	1	126
381	\N	QB	1964-08-01	\N	\N	f	1	127
384	\N	QB	1964-08-22	\N	\N	f	1	128
387	\N	QB	1964-09-05	\N	\N	f	1	129
390	\N	QB	1964-10-03	\N	\N	f	1	130
393	\N	QB	1964-10-24	\N	\N	f	1	131
396	\N	QB	1964-12-31	\N	\N	f	1	132
399	\N	QB	1965-05-29	\N	\N	f	1	133
402	\N	QB	1965-06-12	\N	\N	f	1	134
405	\N	QB	1965-06-26	\N	\N	f	1	135
408	\N	QB	1965-07-09	\N	\N	f	1	136
411	\N	QB	1965-07-17	\N	\N	f	1	137
414	\N	QB	1965-07-31	\N	\N	f	1	138
417	\N	QB	1965-09-11	\N	\N	f	1	139
420	\N	QB	1965-10-02	\N	\N	f	1	140
423	\N	QB	1965-10-23	\N	\N	f	1	141
426	\N	QB	1966-05-21	\N	\N	f	1	142
429	\N	QB	1966-06-11	\N	\N	f	1	143
432	\N	QB	1966-07-02	\N	\N	f	1	144
435	\N	QB	1966-07-15	\N	\N	f	1	145
438	\N	QB	1966-07-23	\N	\N	f	1	146
441	\N	QB	1966-08-06	\N	\N	f	1	147
444	\N	QB	1966-09-03	\N	\N	f	1	148
447	\N	QB	1966-10-01	\N	\N	f	1	149
450	\N	QB	1966-10-22	\N	\N	f	1	150
453	\N	QB	1967-01-01	\N	\N	f	1	151
456	\N	QB	1967-05-06	\N	\N	f	1	152
459	\N	QB	1967-06-03	\N	\N	f	1	153
462	\N	QB	1967-06-17	\N	\N	f	1	154
465	\N	QB	1967-07-01	\N	\N	f	1	155
468	\N	QB	1967-07-14	\N	\N	f	1	156
471	\N	QB	1967-08-05	\N	\N	f	1	157
474	\N	QB	1967-08-26	\N	\N	f	1	158
477	\N	QB	1967-09-09	\N	\N	f	1	159
480	\N	QB	1967-09-30	\N	\N	f	1	160
483	\N	QB	1967-10-21	\N	\N	f	1	161
486	\N	QB	1967-12-31	\N	\N	f	1	162
489	\N	QB	1968-05-11	\N	\N	f	1	163
492	\N	QB	1968-05-25	\N	\N	f	1	164
495	\N	QB	1968-06-08	\N	\N	f	1	165
498	\N	QB	1968-06-22	\N	\N	f	1	166
501	\N	QB	1968-07-06	\N	\N	f	1	167
504	\N	QB	1968-07-19	\N	\N	f	1	168
507	\N	QB	1968-08-03	\N	\N	f	1	169
510	\N	QB	1968-09-07	\N	\N	f	1	170
513	\N	QB	1968-09-21	\N	\N	f	1	171
516	\N	QB	1968-10-05	\N	\N	f	1	172
519	\N	QB	1968-11-02	\N	\N	f	1	173
522	\N	QB	1969-02-28	\N	\N	f	1	174
525	\N	QB	1969-05-03	\N	\N	f	1	175
528	\N	QB	1969-05-17	\N	\N	f	1	176
531	\N	QB	1969-06-20	\N	\N	f	1	177
534	\N	QB	1969-07-05	\N	\N	f	1	178
537	\N	QB	1969-07-18	\N	\N	f	1	179
540	\N	QB	1969-08-02	\N	\N	f	1	180
543	\N	QB	1969-09-06	\N	\N	f	1	181
546	\N	QB	1969-09-19	\N	\N	f	1	182
549	\N	QB	1969-10-04	\N	\N	f	1	183
552	\N	QB	1969-10-18	\N	\N	f	1	184
555	\N	QB	1970-03-06	\N	\N	f	1	185
558	\N	QB	1970-04-18	\N	\N	f	1	186
561	\N	QB	1970-05-09	\N	\N	f	1	187
564	\N	QB	1970-06-06	\N	\N	f	1	188
567	\N	QB	1970-06-20	\N	\N	f	1	189
570	\N	QB	1970-07-04	\N	\N	f	1	190
573	\N	QB	1970-07-17	\N	\N	f	1	191
576	\N	QB	1970-08-01	\N	\N	f	1	192
579	\N	QB	1970-08-15	\N	\N	f	1	193
582	\N	QB	1970-09-05	\N	\N	f	1	194
585	\N	QB	1970-09-19	\N	\N	f	1	195
588	\N	QB	1970-10-03	\N	\N	f	1	196
591	\N	QB	1970-10-24	\N	\N	f	1	197
594	\N	QB	1971-03-05	\N	\N	f	1	198
597	\N	QB	1971-04-17	\N	\N	f	1	199
600	\N	QB	1971-05-22	\N	\N	f	1	200
603	\N	QB	1971-06-19	\N	\N	f	1	201
606	\N	QB	1971-07-03	\N	\N	f	1	202
609	\N	QB	1971-07-16	\N	\N	f	1	203
612	\N	QB	1971-07-31	\N	\N	f	1	204
615	\N	QB	1971-08-14	\N	\N	f	1	205
618	\N	QB	1971-09-04	\N	\N	f	1	206
621	\N	QB	1971-09-18	\N	\N	f	1	207
624	\N	QB	1971-10-02	\N	\N	f	1	208
627	\N	QB	1972-01-22	\N	\N	f	1	209
630	\N	QB	1972-03-03	\N	\N	f	1	210
633	\N	QB	1972-04-30	\N	\N	f	1	211
636	\N	QB	1972-05-13	\N	\N	f	1	212
639	\N	QB	1972-06-03	\N	\N	f	1	213
642	\N	QB	1972-07-01	\N	\N	f	1	214
645	\N	QB	1972-07-14	\N	\N	f	1	215
648	\N	QB	1972-07-29	\N	\N	f	1	216
651	\N	QB	1972-08-12	\N	\N	f	1	217
654	\N	QB	1972-09-09	\N	\N	f	1	218
657	\N	QB	1972-09-23	\N	\N	f	1	219
660	\N	QB	1972-10-07	\N	\N	f	1	220
663	\N	QB	1973-01-27	\N	\N	f	1	221
666	\N	QB	1973-02-10	\N	\N	f	1	222
669	\N	QB	1973-03-02	\N	\N	f	1	223
672	\N	QB	1973-04-28	\N	\N	f	1	224
675	\N	QB	1973-05-19	\N	\N	f	1	225
678	\N	QB	1973-06-02	\N	\N	f	1	226
681	\N	QB	1973-06-16	\N	\N	f	1	227
684	\N	QB	1973-06-30	\N	\N	f	1	228
687	\N	QB	1973-07-13	\N	\N	f	1	229
690	\N	QB	1973-07-28	\N	\N	f	1	230
693	\N	QB	1973-08-04	\N	\N	f	1	231
696	\N	QB	1973-08-18	\N	\N	f	1	232
699	\N	QB	1973-09-08	\N	\N	f	1	233
702	\N	QB	1973-09-22	\N	\N	f	1	234
705	\N	QB	1973-10-06	\N	\N	f	1	235
708	\N	QB	1974-01-12	\N	\N	f	1	236
711	\N	QB	1974-01-26	\N	\N	f	1	237
714	\N	QB	1974-03-29	\N	\N	f	1	238
717	\N	QB	1974-04-27	\N	\N	f	1	239
720	\N	QB	1974-05-11	\N	\N	f	1	240
723	\N	QB	1974-05-25	\N	\N	f	1	241
726	\N	QB	1974-06-08	\N	\N	f	1	242
729	\N	QB	1974-06-22	\N	\N	f	1	243
732	\N	QB	1974-07-06	\N	\N	f	1	244
735	\N	QB	1974-07-19	\N	\N	f	1	245
738	\N	QB	1974-08-03	\N	\N	f	1	246
741	\N	QB	1974-08-17	\N	\N	f	1	247
744	\N	QB	1974-09-07	\N	\N	f	1	248
747	\N	QB	1974-09-21	\N	\N	f	1	249
750	\N	QB	1974-10-05	\N	\N	f	1	250
753	\N	QB	1975-01-11	\N	\N	f	1	251
756	\N	QB	1975-01-25	\N	\N	f	1	252
759	\N	QB	1975-02-28	\N	\N	f	1	253
762	\N	QB	1975-04-26	\N	\N	f	1	254
765	\N	QB	1975-05-10	\N	\N	f	1	255
768	\N	QB	1975-05-24	\N	\N	f	1	256
771	\N	QB	1975-06-07	\N	\N	f	1	257
774	\N	QB	1975-06-21	\N	\N	f	1	258
777	\N	QB	1975-07-05	\N	\N	f	1	259
780	\N	QB	1975-07-18	\N	\N	f	1	260
783	\N	QB	1975-08-02	\N	\N	f	1	261
786	\N	QB	1975-08-16	\N	\N	f	1	262
789	\N	QB	1975-09-06	\N	\N	f	1	263
792	\N	QB	1975-10-04	\N	\N	f	1	264
795	\N	QB	1976-01-24	\N	\N	f	1	265
798	\N	QB	1976-03-05	\N	\N	f	1	266
801	\N	QB	1976-03-27	\N	\N	f	1	267
804	\N	QB	1976-05-01	\N	\N	f	1	268
807	\N	QB	1976-05-15	\N	\N	f	1	269
810	\N	QB	1976-05-29	\N	\N	f	1	270
813	\N	QB	1976-06-12	\N	\N	f	1	271
816	\N	QB	1976-07-03	\N	\N	f	1	272
819	\N	QB	1976-07-17	\N	\N	f	1	273
822	\N	QB	1976-07-31	\N	\N	f	1	274
825	\N	QB	1976-08-14	\N	\N	f	1	275
828	\N	QB	1976-08-28	\N	\N	f	1	276
831	\N	QB	1976-09-11	\N	\N	f	1	277
834	\N	QB	1976-10-02	\N	\N	f	1	278
837	\N	QB	1976-10-09	\N	\N	f	1	279
840	\N	QB	1976-10-23	\N	\N	f	1	280
843	\N	QB	1977-01-08	\N	\N	f	1	281
846	\N	QB	1977-01-22	\N	\N	f	1	282
849	\N	QB	1977-03-04	\N	\N	f	1	283
852	\N	QB	1977-04-02	\N	\N	f	1	284
855	\N	QB	1977-05-07	\N	\N	f	1	285
858	\N	QB	1977-05-21	\N	\N	f	1	286
861	\N	QB	1977-06-04	\N	\N	f	1	287
864	\N	QB	1977-06-18	\N	\N	f	1	288
867	\N	QB	1977-07-02	\N	\N	f	1	289
870	\N	QB	1977-07-15	\N	\N	f	1	290
873	\N	QB	1977-07-30	\N	\N	f	1	291
876	\N	QB	1977-08-13	\N	\N	f	1	292
879	\N	QB	1977-08-27	\N	\N	f	1	293
882	\N	QB	1977-09-10	\N	\N	f	1	294
885	\N	QB	1977-10-01	\N	\N	f	1	295
888	\N	QB	1977-10-08	\N	\N	f	1	296
891	\N	QB	1977-10-22	\N	\N	f	1	297
894	\N	QB	1978-01-14	\N	\N	f	1	298
897	\N	QB	1978-01-28	\N	\N	f	1	299
900	\N	QB	1978-03-03	\N	\N	f	1	300
903	\N	QB	1978-04-01	\N	\N	f	1	301
906	\N	QB	1978-05-06	\N	\N	f	1	302
909	\N	QB	1978-05-20	\N	\N	f	1	303
912	\N	QB	1978-06-03	\N	\N	f	1	304
915	\N	QB	1978-06-16	\N	\N	f	1	305
918	\N	QB	1978-07-01	\N	\N	f	1	306
921	\N	QB	1978-07-15	\N	\N	f	1	307
924	\N	QB	1978-07-29	\N	\N	f	1	308
927	\N	QB	1978-08-12	\N	\N	f	1	309
930	\N	QB	1978-08-26	\N	\N	f	1	310
933	\N	QB	1978-09-09	\N	\N	f	1	311
936	\N	QB	1978-09-30	\N	\N	f	1	312
939	\N	QB	1978-10-07	\N	\N	f	1	313
942	\N	QB	1979-01-20	\N	\N	f	1	314
945	\N	QB	1979-02-03	\N	\N	f	1	315
948	\N	QB	1979-03-02	\N	\N	f	1	316
951	\N	QB	1979-04-07	\N	\N	f	1	317
954	\N	QB	1979-04-28	\N	\N	f	1	318
957	\N	QB	1979-05-12	\N	\N	f	1	319
960	\N	QB	1979-05-26	\N	\N	f	1	320
963	\N	QB	1979-06-30	\N	\N	f	1	321
966	\N	QB	1979-07-13	\N	\N	f	1	322
969	\N	QB	1979-07-28	\N	\N	f	1	323
972	\N	QB	1979-08-11	\N	\N	f	1	324
975	\N	QB	1979-08-25	\N	\N	f	1	325
978	\N	QB	1979-09-08	\N	\N	f	1	326
981	\N	QB	1979-09-29	\N	\N	f	1	327
984	\N	QB	1979-10-06	\N	\N	f	1	328
987	\N	QB	1980-01-12	\N	\N	f	1	329
990	\N	QB	1980-01-26	\N	\N	f	1	330
993	\N	QB	1980-02-29	\N	\N	f	1	331
996	\N	QB	1980-03-29	\N	\N	f	1	332
999	\N	QB	1980-05-03	\N	\N	f	1	333
1002	\N	QB	1980-05-17	\N	\N	f	1	334
1005	\N	QB	1980-06-28	\N	\N	f	1	335
1008	\N	QB	1980-07-12	\N	\N	f	1	336
1011	\N	QB	1980-08-09	\N	\N	f	1	337
1014	\N	QB	1980-08-16	\N	\N	f	1	338
1017	\N	QB	1980-08-30	\N	\N	f	1	339
1020	\N	QB	1980-09-13	\N	\N	f	1	340
1023	\N	QB	1980-09-27	\N	\N	f	1	341
1026	\N	QB	1980-10-04	\N	\N	f	1	342
1029	\N	QB	1981-03-14	\N	\N	f	1	343
1032	\N	QB	1981-03-28	\N	\N	f	1	344
1035	\N	QB	1981-04-11	\N	\N	f	1	345
1038	\N	QB	1981-05-02	\N	\N	f	1	346
1041	\N	QB	1981-05-16	\N	\N	f	1	347
1044	\N	QB	1981-05-30	\N	\N	f	1	348
1047	\N	QB	1981-06-20	\N	\N	f	1	349
1050	\N	QB	1981-07-04	\N	\N	f	1	350
1053	\N	QB	1981-07-17	\N	\N	f	1	351
1056	\N	QB	1981-08-01	\N	\N	f	1	352
1059	\N	QB	1981-08-15	\N	\N	f	1	353
1062	\N	QB	1981-08-29	\N	\N	f	1	354
1065	\N	QB	1981-09-12	\N	\N	f	1	355
1068	\N	QB	1981-09-26	\N	\N	f	1	356
1071	\N	QB	1981-10-16	\N	\N	f	1	357
1074	\N	QB	1982-01-22	\N	\N	f	1	358
1077	\N	QB	1982-03-20	\N	\N	f	1	359
1080	\N	QB	1982-04-03	\N	\N	f	1	360
1083	\N	QB	1982-04-24	\N	\N	f	1	361
1086	\N	QB	1982-05-08	\N	\N	f	1	362
1089	\N	QB	1982-05-22	\N	\N	f	1	363
1092	\N	QB	1982-06-05	\N	\N	f	1	364
1095	\N	QB	1982-06-12	\N	\N	f	1	365
1098	\N	QB	1982-07-02	\N	\N	f	1	366
1101	\N	QB	1982-07-17	\N	\N	f	1	367
1104	\N	QB	1982-07-24	\N	\N	f	1	368
1107	\N	QB	1982-08-07	\N	\N	f	1	369
1110	\N	QB	1982-08-14	\N	\N	f	1	370
1113	\N	QB	1982-08-28	\N	\N	f	1	371
1116	\N	QB	1982-09-11	\N	\N	f	1	372
1119	\N	QB	1982-09-24	\N	\N	f	1	373
1122	\N	QB	1983-03-12	\N	\N	f	1	374
1125	\N	QB	1983-03-26	\N	\N	f	1	375
1128	\N	QB	1983-04-16	\N	\N	f	1	376
1131	\N	QB	1983-04-30	\N	\N	f	1	377
1134	\N	QB	1983-05-14	\N	\N	f	1	378
1137	\N	QB	1983-05-21	\N	\N	f	1	379
1140	\N	QB	1983-06-04	\N	\N	f	1	380
1143	\N	QB	1983-06-11	\N	\N	f	1	381
1146	\N	QB	1983-07-15	\N	\N	f	1	382
1149	\N	QB	1983-08-06	\N	\N	f	1	383
1152	\N	QB	1983-08-13	\N	\N	f	1	384
1155	\N	QB	1983-08-27	\N	\N	f	1	385
1158	\N	QB	1983-09-10	\N	\N	f	1	386
1161	\N	QB	1983-09-24	\N	\N	f	1	387
1164	\N	QB	1983-10-14	\N	\N	f	1	388
1167	\N	QB	1984-03-24	\N	\N	f	1	389
1170	\N	QB	1984-04-06	\N	\N	f	1	390
1173	\N	QB	1984-04-28	\N	\N	f	1	391
1176	\N	QB	1984-05-05	\N	\N	f	1	392
1179	\N	QB	1984-05-19	\N	\N	f	1	393
1182	\N	QB	1984-06-02	\N	\N	f	1	394
1185	\N	QB	1984-06-16	\N	\N	f	1	395
1188	\N	QB	1984-06-23	\N	\N	f	1	396
1191	\N	QB	1984-07-07	\N	\N	f	1	397
1194	\N	QB	1984-07-21	\N	\N	f	1	398
1197	\N	QB	1984-08-04	\N	\N	f	1	399
1200	\N	QB	1984-08-18	\N	\N	f	1	400
1203	\N	QB	1984-08-25	\N	\N	f	1	401
1206	\N	QB	1984-09-08	\N	\N	f	1	402
1209	\N	QB	1984-10-06	\N	\N	f	1	403
1212	\N	QB	1984-10-20	\N	\N	f	1	404
1215	\N	QB	1985-04-06	\N	\N	f	1	405
1218	\N	QB	1985-04-20	\N	\N	f	1	406
1221	\N	QB	1985-05-04	\N	\N	f	1	407
1224	\N	QB	1985-05-18	\N	\N	f	1	408
1227	\N	QB	1985-06-15	\N	\N	f	1	409
1230	\N	QB	1985-06-22	\N	\N	f	1	410
1233	\N	QB	1985-07-06	\N	\N	f	1	411
1236	\N	QB	1985-07-20	\N	\N	f	1	412
1239	\N	QB	1985-08-03	\N	\N	f	1	413
1242	\N	QB	1985-08-17	\N	\N	f	1	414
1245	\N	QB	1985-08-24	\N	\N	f	1	415
1248	\N	QB	1985-09-07	\N	\N	f	1	416
1251	\N	QB	1985-09-14	\N	\N	f	1	417
1254	\N	QB	1985-10-05	\N	\N	f	1	418
1257	\N	QB	1985-10-18	\N	\N	f	1	419
1260	\N	QB	1985-11-02	\N	\N	f	1	420
1263	\N	QB	1986-03-22	\N	\N	f	1	421
1266	\N	QB	1986-04-12	\N	\N	f	1	422
1269	\N	QB	1986-04-26	\N	\N	f	1	423
1272	\N	QB	1986-05-10	\N	\N	f	1	424
1275	\N	QB	1986-05-24	\N	\N	f	1	425
1278	\N	QB	1986-06-14	\N	\N	f	1	426
1281	\N	QB	1986-06-21	\N	\N	f	1	427
1284	\N	QB	1986-07-05	\N	\N	f	1	428
1287	\N	QB	1986-07-12	\N	\N	f	1	429
1290	\N	QB	1986-07-26	\N	\N	f	1	430
1293	\N	QB	1986-08-09	\N	\N	f	1	431
1296	\N	QB	1986-08-16	\N	\N	f	1	432
1299	\N	QB	1986-09-06	\N	\N	f	1	433
1302	\N	QB	1986-09-20	\N	\N	f	1	434
1305	\N	QB	1986-10-11	\N	\N	f	1	435
1308	\N	QB	1986-10-25	\N	\N	f	1	436
1311	\N	QB	1987-04-11	\N	\N	f	1	437
1314	\N	QB	1987-05-02	\N	\N	f	1	438
1317	\N	QB	1987-05-16	\N	\N	f	1	439
1320	\N	QB	1987-05-30	\N	\N	f	1	440
1323	\N	QB	1987-06-20	\N	\N	f	1	441
1326	\N	QB	1987-07-04	\N	\N	f	1	442
1329	\N	QB	1987-07-11	\N	\N	f	1	443
1332	\N	QB	1987-07-25	\N	\N	f	1	444
1335	\N	QB	1987-08-08	\N	\N	f	1	445
1338	\N	QB	1987-08-15	\N	\N	f	1	446
1341	\N	QB	1987-09-05	\N	\N	f	1	447
1344	\N	QB	1987-09-19	\N	\N	f	1	448
1347	\N	QB	1987-09-26	\N	\N	f	1	449
1350	\N	QB	1987-10-17	\N	\N	f	1	450
1353	\N	QB	1987-10-31	\N	\N	f	1	451
1356	\N	QB	1987-11-14	\N	\N	f	1	452
1359	\N	QB	1988-04-02	\N	\N	f	1	453
1362	\N	QB	1988-04-30	\N	\N	f	1	454
1365	\N	QB	1988-05-14	\N	\N	f	1	455
1368	\N	QB	1988-05-28	\N	\N	f	1	456
1371	\N	QB	1988-06-11	\N	\N	f	1	457
1374	\N	QB	1988-06-18	\N	\N	f	1	458
1377	\N	QB	1988-07-02	\N	\N	f	1	459
1380	\N	QB	1988-07-09	\N	\N	f	1	460
1383	\N	QB	1988-07-23	\N	\N	f	1	461
1386	\N	QB	1988-08-06	\N	\N	f	1	462
1389	\N	QB	1988-08-27	\N	\N	f	1	463
1392	\N	QB	1988-09-10	\N	\N	f	1	464
1395	\N	QB	1988-09-24	\N	\N	f	1	465
1398	\N	QB	1988-10-01	\N	\N	f	1	466
1401	\N	QB	1988-10-29	\N	\N	f	1	467
1404	\N	QB	1988-11-12	\N	\N	f	1	468
1407	\N	QB	1989-03-25	\N	\N	f	1	469
1410	\N	QB	1989-04-22	\N	\N	f	1	470
1413	\N	QB	1989-05-06	\N	\N	f	1	471
1416	\N	QB	1989-05-27	\N	\N	f	1	472
1419	\N	QB	1989-06-03	\N	\N	f	1	473
1422	\N	QB	1989-06-17	\N	\N	f	1	474
1425	\N	QB	1989-07-08	\N	\N	f	1	475
1428	\N	QB	1989-07-15	\N	\N	f	1	476
1431	\N	QB	1989-07-29	\N	\N	f	1	477
1434	\N	QB	1989-08-12	\N	\N	f	1	478
1437	\N	QB	1989-08-26	\N	\N	f	1	479
1440	\N	QB	1989-09-09	\N	\N	f	1	480
1443	\N	QB	1989-09-23	\N	\N	f	1	481
1446	\N	QB	1989-09-30	\N	\N	f	1	482
1449	\N	QB	1989-10-21	\N	\N	f	1	483
1452	\N	QB	1989-11-04	\N	\N	f	1	484
1455	\N	QB	1990-03-10	\N	\N	f	1	485
1458	\N	QB	1990-03-24	\N	\N	f	1	486
1461	\N	QB	1990-05-12	\N	\N	f	1	487
1464	\N	QB	1990-05-26	\N	\N	f	1	488
1467	\N	QB	1990-06-09	\N	\N	f	1	489
1470	\N	QB	1990-06-23	\N	\N	f	1	490
1473	\N	QB	1990-07-07	\N	\N	f	1	491
1476	\N	QB	1990-07-14	\N	\N	f	1	492
1479	\N	QB	1990-07-28	\N	\N	f	1	493
1482	\N	QB	1990-08-11	\N	\N	f	1	494
1485	\N	QB	1990-08-25	\N	\N	f	1	495
1488	\N	QB	1990-09-08	\N	\N	f	1	496
1491	\N	QB	1990-09-22	\N	\N	f	1	497
1494	\N	QB	1990-09-29	\N	\N	f	1	498
1497	\N	QB	1990-10-20	\N	\N	f	1	499
1500	\N	QB	1990-11-03	\N	\N	f	1	500
1503	\N	QB	1991-03-09	\N	\N	f	1	501
1506	\N	QB	1991-03-23	\N	\N	f	1	502
1509	\N	QB	1991-04-27	\N	\N	f	1	503
1512	\N	QB	1991-05-11	\N	\N	f	1	504
1515	\N	QB	1991-06-01	\N	\N	f	1	505
1518	\N	QB	1991-06-15	\N	\N	f	1	506
1521	\N	QB	1991-07-06	\N	\N	f	1	507
1524	\N	QB	1991-07-13	\N	\N	f	1	508
1527	\N	QB	1991-07-27	\N	\N	f	1	509
1530	\N	QB	1991-08-10	\N	\N	f	1	510
1533	\N	QB	1991-08-24	\N	\N	f	1	511
1536	\N	QB	1991-09-07	\N	\N	f	1	512
1539	\N	QB	1991-09-21	\N	\N	f	1	513
1542	\N	QB	1991-09-28	\N	\N	f	1	514
1545	\N	QB	1991-10-19	\N	\N	f	1	515
1548	\N	QB	1991-11-02	\N	\N	f	1	516
1551	\N	QB	1992-02-29	\N	\N	f	1	517
1554	\N	QB	1992-03-21	\N	\N	f	1	518
1557	\N	QB	1992-04-04	\N	\N	f	1	519
1560	\N	QB	1992-05-02	\N	\N	f	1	520
1563	\N	QB	1992-05-16	\N	\N	f	1	521
1566	\N	QB	1992-05-30	\N	\N	f	1	522
1569	\N	QB	1992-06-13	\N	\N	f	1	523
1572	\N	QB	1992-07-04	\N	\N	f	1	524
1575	\N	QB	1992-07-11	\N	\N	f	1	525
1578	\N	QB	1992-07-25	\N	\N	f	1	526
1581	\N	QB	1992-08-15	\N	\N	f	1	527
1584	\N	QB	1992-08-29	\N	\N	f	1	528
1587	\N	QB	1992-09-12	\N	\N	f	1	529
1590	\N	QB	1992-09-26	\N	\N	f	1	530
1593	\N	QB	1992-10-24	\N	\N	f	1	531
1596	\N	QB	1992-11-07	\N	\N	f	1	532
1599	\N	QB	1993-03-13	\N	\N	f	1	533
1602	\N	QB	1993-03-27	\N	\N	f	1	534
1605	\N	QB	1993-04-10	\N	\N	f	1	535
1608	\N	QB	1993-04-24	\N	\N	f	1	536
1611	\N	QB	1993-05-08	\N	\N	f	1	537
1614	\N	QB	1993-05-22	\N	\N	f	1	538
1617	\N	QB	1993-06-12	\N	\N	f	1	539
1620	\N	QB	1993-07-03	\N	\N	f	1	540
1623	\N	QB	1993-07-10	\N	\N	f	1	541
1626	\N	QB	1993-07-24	\N	\N	f	1	542
1629	\N	QB	1993-08-14	\N	\N	f	1	543
1632	\N	QB	1993-08-28	\N	\N	f	1	544
1635	\N	QB	1993-09-11	\N	\N	f	1	545
1638	\N	QB	1993-09-25	\N	\N	f	1	546
1641	\N	QB	1993-10-23	\N	\N	f	1	547
1644	\N	QB	1993-11-06	\N	\N	f	1	548
1647	\N	QB	1994-03-26	\N	\N	f	1	549
1650	\N	QB	1994-04-16	\N	\N	f	1	550
1653	\N	QB	1994-04-30	\N	\N	f	1	551
1656	\N	QB	1994-05-14	\N	\N	f	1	552
1659	\N	QB	1994-05-28	\N	\N	f	1	553
1662	\N	QB	1994-06-11	\N	\N	f	1	554
1665	\N	QB	1994-07-02	\N	\N	f	1	555
1668	\N	QB	1994-07-09	\N	\N	f	1	556
1671	\N	QB	1994-07-30	\N	\N	f	1	557
1674	\N	QB	1994-08-13	\N	\N	f	1	558
1677	\N	QB	1994-08-27	\N	\N	f	1	559
1680	\N	QB	1994-09-10	\N	\N	f	1	560
1683	\N	QB	1994-09-24	\N	\N	f	1	561
1686	\N	QB	1994-10-15	\N	\N	f	1	562
1689	\N	QB	1994-11-05	\N	\N	f	1	563
1692	\N	QB	1994-11-12	\N	\N	f	1	564
1695	\N	QB	1995-03-25	\N	\N	f	1	565
1698	\N	QB	1995-04-08	\N	\N	f	1	566
1701	\N	QB	1995-04-29	\N	\N	f	1	567
1704	\N	QB	1995-05-13	\N	\N	f	1	568
1707	\N	QB	1995-05-27	\N	\N	f	1	569
1710	\N	QB	1995-06-10	\N	\N	f	1	570
1713	\N	QB	1995-07-01	\N	\N	f	1	571
1716	\N	QB	1995-07-15	\N	\N	f	1	572
1719	\N	QB	1995-07-29	\N	\N	f	1	573
1722	\N	QB	1995-08-12	\N	\N	f	1	574
1725	\N	QB	1995-08-26	\N	\N	f	1	575
1728	\N	QB	1995-09-09	\N	\N	f	1	576
1731	\N	QB	1995-09-23	\N	\N	f	1	577
1734	\N	QB	1995-09-30	\N	\N	f	1	578
1737	\N	QB	1995-10-21	\N	\N	f	1	579
1740	\N	QB	1995-10-28	\N	\N	f	1	580
1743	\N	QB	1995-11-11	\N	\N	f	1	581
\.


--
-- Data for Name: formula_one_teamdriver; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_one_teamdriver (id, role, driver_id, season_id, team_id) FROM stdin;
1	\N	1	1	1
2	\N	2	1	1
3	\N	3	1	1
4	\N	4	1	5
5	\N	5	1	5
6	\N	6	1	4
7	\N	7	1	4
8	\N	8	1	5
9	\N	9	1	2
10	\N	11	1	2
11	\N	10	1	2
12	\N	12	1	5
13	\N	13	1	1
14	\N	14	1	3
15	\N	15	1	2
16	\N	16	1	2
17	\N	17	1	3
18	\N	18	1	2
19	\N	19	1	2
20	\N	20	1	5
21	\N	22	1	4
22	\N	21	1	4
23	\N	23	1	4
24	\N	24	1	6
25	\N	25	1	6
26	\N	26	1	6
27	\N	27	1	2
28	\N	28	1	8
29	\N	29	1	8
30	\N	30	1	2
31	\N	31	1	7
32	\N	32	1	6
33	\N	33	1	2
34	\N	34	1	10
35	\N	35	1	11
36	\N	36	1	11
37	\N	37	1	10
38	\N	39	1	10
39	\N	38	1	10
40	\N	40	1	23
41	\N	41	1	10
42	\N	42	1	19
43	\N	43	1	22
44	\N	44	1	10
45	\N	45	1	21
46	\N	46	1	20
47	\N	47	1	10
48	\N	48	1	10
49	\N	49	1	19
50	\N	50	1	18
51	\N	51	1	17
52	\N	52	1	10
53	\N	53	1	10
54	\N	54	1	2
55	\N	55	1	10
56	\N	56	1	16
57	\N	57	1	15
58	\N	58	1	14
59	\N	59	1	2
60	\N	60	1	13
61	\N	62	1	12
62	\N	61	1	12
63	\N	63	1	10
64	\N	64	1	10
65	\N	65	1	10
66	\N	38	1	11
67	\N	66	1	9
68	\N	67	1	10
69	\N	68	1	2
70	\N	69	1	2
71	\N	31	1	5
72	\N	70	1	2
73	\N	71	1	5
74	\N	72	1	5
75	\N	25	1	5
76	\N	73	1	5
77	\N	3	1	2
78	\N	74	1	6
79	\N	75	1	5
80	\N	76	1	1
81	\N	77	1	6
82	\N	78	1	5
83	\N	79	1	2
84	\N	80	1	1
85	\N	81	1	2
86	\N	68	1	24
87	\N	13	2	1
88	\N	76	2	6
89	\N	1	2	1
90	\N	80	2	1
91	\N	18	2	1
92	\N	24	2	6
93	\N	19	2	2
94	\N	82	2	25
95	\N	5	2	5
96	\N	8	2	5
97	\N	83	2	6
98	\N	31	2	2
99	\N	12	2	5
100	\N	75	2	5
101	\N	32	2	6
102	\N	78	2	5
103	\N	84	2	25
104	\N	4	2	5
105	\N	26	2	6
106	\N	27	2	5
107	\N	85	2	26
108	\N	40	2	10
109	\N	86	2	10
110	\N	48	2	10
111	\N	87	2	10
112	\N	88	2	33
113	\N	89	2	29
114	\N	59	2	23
115	\N	90	2	10
116	\N	46	2	11
117	\N	38	2	11
118	\N	91	2	10
119	\N	92	2	10
120	\N	65	2	10
121	\N	60	2	10
122	\N	36	2	11
123	\N	41	2	28
124	\N	51	2	30
125	\N	63	2	10
126	\N	93	2	10
127	\N	94	2	32
128	\N	95	2	21
129	\N	34	2	10
130	\N	37	2	10
131	\N	49	2	10
132	\N	67	2	29
133	\N	96	2	10
134	\N	53	2	10
135	\N	97	2	31
136	\N	98	2	10
137	\N	99	2	27
138	\N	42	2	19
139	\N	47	2	11
140	\N	52	2	2
141	\N	100	2	9
142	\N	101	2	5
143	\N	71	2	5
144	\N	19	2	5
145	\N	2	2	1
146	\N	27	2	6
147	\N	3	2	6
148	\N	72	2	5
149	\N	102	2	8
150	\N	29	2	8
151	\N	103	2	8
152	\N	28	2	8
153	\N	104	2	2
154	\N	18	2	2
155	\N	68	2	1
156	\N	3	2	34
157	\N	21	2	34
158	\N	10	2	4
159	\N	6	2	4
160	\N	105	2	5
161	\N	14	2	3
162	\N	106	2	2
163	\N	16	2	2
164	\N	107	2	2
165	\N	108	2	5
166	\N	81	2	1
167	\N	70	2	2
168	\N	30	2	35
169	\N	109	2	6
170	\N	110	2	34
171	\N	111	2	2
172	\N	112	2	5
173	\N	15	2	2
174	\N	113	2	2
175	\N	76	3	6
176	\N	83	3	6
177	\N	114	3	36
178	\N	115	3	38
179	\N	116	3	7
180	\N	18	3	2
181	\N	85	3	6
182	\N	117	3	7
183	\N	15	3	8
184	\N	1	3	6
185	\N	103	3	6
186	\N	31	3	2
187	\N	82	3	25
188	\N	118	3	25
189	\N	28	3	36
190	\N	119	3	25
191	\N	84	3	25
192	\N	120	3	37
193	\N	121	3	26
194	\N	5	3	6
195	\N	122	3	8
196	\N	49	3	28
197	\N	58	3	10
198	\N	65	3	10
199	\N	46	3	19
200	\N	123	3	10
201	\N	124	3	10
202	\N	125	3	10
203	\N	42	3	10
204	\N	98	3	10
205	\N	34	3	10
206	\N	48	3	10
207	\N	126	3	9
208	\N	100	3	10
209	\N	60	3	20
210	\N	127	3	33
211	\N	128	3	27
212	\N	99	3	10
213	\N	95	3	10
214	\N	59	3	19
215	\N	87	3	19
216	\N	52	3	10
217	\N	54	3	31
218	\N	97	3	10
219	\N	38	3	11
220	\N	91	3	10
221	\N	129	3	10
222	\N	63	3	10
223	\N	50	3	10
224	\N	130	3	10
225	\N	96	3	10
226	\N	24	3	6
227	\N	89	3	20
228	\N	88	3	10
229	\N	131	3	7
230	\N	132	3	25
231	\N	133	3	6
232	\N	12	3	36
233	\N	134	3	25
234	\N	135	3	26
235	\N	136	3	8
236	\N	137	3	25
237	\N	138	3	39
238	\N	82	3	4
239	\N	29	3	8
240	\N	8	3	2
241	\N	4	3	25
242	\N	79	3	6
243	\N	15	3	36
244	\N	32	3	3
245	\N	12	3	8
246	\N	139	3	6
247	\N	140	3	40
248	\N	141	3	40
249	\N	3	3	7
250	\N	142	3	6
251	\N	143	3	40
252	\N	32	3	6
253	\N	144	3	3
254	\N	145	3	40
255	\N	146	3	2
256	\N	147	3	38
257	\N	105	3	25
258	\N	29	3	36
259	\N	16	3	7
260	\N	148	3	2
261	\N	149	3	39
262	\N	134	3	6
263	\N	150	3	26
264	\N	151	3	37
265	\N	12	3	25
266	\N	152	3	26
267	\N	153	3	41
268	\N	154	3	37
269	\N	155	3	26
270	\N	156	3	41
271	\N	157	3	41
272	\N	158	3	41
273	\N	159	3	6
274	\N	81	3	26
275	\N	68	3	2
276	\N	160	3	26
277	\N	161	3	26
278	\N	26	3	6
279	\N	109	3	2
280	\N	162	3	2
281	\N	163	3	25
282	\N	132	3	8
283	\N	27	3	2
284	\N	115	3	7
285	\N	82	3	40
286	\N	30	3	2
287	\N	164	3	35
288	\N	165	3	2
289	\N	120	3	6
290	\N	166	3	42
291	\N	24	4	6
292	\N	26	4	6
293	\N	27	4	2
294	\N	131	4	6
295	\N	167	4	2
296	\N	114	4	36
297	\N	29	4	36
298	\N	31	4	36
299	\N	168	4	7
300	\N	116	4	7
301	\N	28	4	36
302	\N	13	4	2
303	\N	68	4	2
304	\N	1	4	6
305	\N	169	4	36
306	\N	170	4	8
307	\N	171	4	7
308	\N	99	4	10
309	\N	123	4	10
310	\N	46	4	10
311	\N	65	4	10
312	\N	43	4	10
313	\N	63	4	10
314	\N	48	4	10
315	\N	172	4	10
316	\N	58	4	10
317	\N	128	4	10
318	\N	173	4	20
319	\N	95	4	28
320	\N	38	4	28
321	\N	50	4	28
322	\N	51	4	10
323	\N	91	4	10
324	\N	130	4	10
325	\N	93	4	10
326	\N	87	4	28
327	\N	124	4	29
328	\N	35	4	10
329	\N	97	4	10
330	\N	88	4	10
331	\N	67	4	10
332	\N	174	4	10
333	\N	41	4	10
334	\N	175	4	10
335	\N	176	4	10
336	\N	57	4	10
337	\N	54	4	10
338	\N	129	4	28
339	\N	86	4	43
340	\N	44	4	28
341	\N	95	4	10
342	\N	55	4	10
343	\N	46	4	19
344	\N	34	4	10
345	\N	177	4	9
346	\N	50	4	10
347	\N	178	4	10
348	\N	130	4	31
349	\N	176	4	44
350	\N	88	4	20
351	\N	18	4	2
352	\N	5	4	6
353	\N	119	4	25
354	\N	82	4	40
355	\N	145	4	40
356	\N	12	4	40
357	\N	179	4	36
358	\N	115	4	7
359	\N	142	4	40
360	\N	118	4	25
361	\N	104	4	2
362	\N	180	4	36
363	\N	132	4	25
364	\N	101	4	40
365	\N	12	4	2
366	\N	181	4	8
367	\N	135	4	26
368	\N	6	4	7
369	\N	4	4	25
370	\N	19	4	35
371	\N	82	4	7
372	\N	15	4	40
373	\N	164	4	35
374	\N	32	4	7
375	\N	182	4	7
376	\N	22	4	40
377	\N	183	4	25
378	\N	184	4	40
379	\N	105	4	25
380	\N	147	4	7
381	\N	108	4	6
382	\N	185	4	26
383	\N	186	4	7
384	\N	160	4	26
385	\N	158	4	41
386	\N	153	4	41
387	\N	187	4	26
388	\N	188	4	45
389	\N	189	4	26
390	\N	154	4	26
391	\N	190	4	37
392	\N	191	4	6
393	\N	157	4	37
394	\N	192	4	26
395	\N	120	4	37
396	\N	193	4	26
397	\N	194	4	2
398	\N	122	4	6
399	\N	195	4	25
400	\N	109	4	2
401	\N	85	4	6
402	\N	197	4	2
403	\N	196	4	2
404	\N	198	4	6
405	\N	15	4	2
406	\N	183	4	40
407	\N	139	4	6
408	\N	199	4	25
409	\N	13	5	2
410	\N	1	5	6
411	\N	27	5	6
412	\N	29	5	6
413	\N	164	5	36
414	\N	31	5	2
415	\N	15	5	2
416	\N	18	5	2
417	\N	198	5	6
418	\N	114	5	36
419	\N	131	5	6
420	\N	104	5	2
421	\N	179	5	2
422	\N	200	5	36
423	\N	201	5	2
424	\N	5	5	6
425	\N	196	5	2
426	\N	169	5	2
427	\N	99	5	10
428	\N	124	5	28
429	\N	48	5	10
430	\N	46	5	10
431	\N	49	5	10
432	\N	86	5	10
433	\N	63	5	10
434	\N	177	5	47
435	\N	43	5	10
436	\N	55	5	10
437	\N	202	5	10
438	\N	178	5	20
439	\N	123	5	10
440	\N	51	5	10
441	\N	88	5	10
442	\N	65	5	10
443	\N	34	5	10
444	\N	41	5	28
445	\N	95	5	28
446	\N	87	5	28
447	\N	129	5	10
448	\N	38	5	10
449	\N	64	5	10
450	\N	175	5	10
451	\N	173	5	10
452	\N	125	5	46
453	\N	130	5	20
454	\N	203	5	20
455	\N	127	5	10
456	\N	204	5	10
457	\N	58	5	10
458	\N	205	5	10
459	\N	128	5	30
460	\N	97	5	30
461	\N	50	5	10
462	\N	88	5	22
463	\N	176	5	22
464	\N	172	5	22
465	\N	88	5	29
466	\N	130	5	29
467	\N	172	5	10
468	\N	44	5	10
469	\N	206	5	31
470	\N	54	5	31
471	\N	127	5	29
472	\N	207	5	29
473	\N	208	5	10
474	\N	82	5	2
475	\N	101	5	36
476	\N	197	5	2
477	\N	132	5	36
478	\N	108	5	6
479	\N	13	5	48
480	\N	209	5	48
481	\N	28	5	6
482	\N	26	5	2
483	\N	115	5	2
484	\N	185	5	48
485	\N	142	5	2
486	\N	118	5	25
487	\N	181	5	36
488	\N	210	5	36
489	\N	24	5	2
490	\N	6	5	7
491	\N	211	5	40
492	\N	212	5	40
493	\N	213	5	40
494	\N	214	5	7
495	\N	215	5	40
496	\N	216	5	2
497	\N	217	5	40
498	\N	3	5	6
499	\N	218	5	36
500	\N	119	5	49
501	\N	32	5	7
502	\N	117	5	7
503	\N	116	5	7
504	\N	186	5	7
505	\N	76	5	6
506	\N	194	5	48
507	\N	160	5	50
508	\N	180	5	36
509	\N	5	5	2
510	\N	24	5	6
511	\N	219	5	2
512	\N	111	5	2
513	\N	220	5	2
514	\N	24	5	51
515	\N	26	5	51
516	\N	13	6	48
517	\N	27	6	6
518	\N	29	6	6
519	\N	1	6	6
520	\N	198	6	6
521	\N	209	6	48
522	\N	82	6	48
523	\N	185	6	48
524	\N	179	6	2
525	\N	114	6	2
526	\N	31	6	2
527	\N	196	6	2
528	\N	197	6	2
529	\N	169	6	2
530	\N	218	6	2
531	\N	221	6	36
532	\N	26	6	51
533	\N	222	6	51
534	\N	223	6	2
535	\N	24	6	51
536	\N	164	6	36
537	\N	170	6	36
538	\N	224	6	2
539	\N	19	6	51
540	\N	210	6	36
541	\N	76	6	6
542	\N	132	6	6
543	\N	31	6	6
544	\N	28	6	36
545	\N	103	6	48
546	\N	131	6	49
547	\N	5	6	2
548	\N	118	6	2
549	\N	225	6	25
550	\N	129	6	10
551	\N	38	6	10
552	\N	43	6	10
553	\N	51	6	10
554	\N	176	6	28
555	\N	208	6	10
556	\N	41	6	10
557	\N	88	6	10
558	\N	226	6	10
559	\N	205	6	10
560	\N	172	6	10
561	\N	44	6	10
562	\N	46	6	28
563	\N	227	6	10
564	\N	128	6	27
565	\N	58	6	52
566	\N	177	6	47
567	\N	178	6	10
568	\N	123	6	10
569	\N	228	6	27
570	\N	65	6	10
571	\N	229	6	29
572	\N	34	6	10
573	\N	230	6	30
574	\N	231	6	10
575	\N	124	6	28
576	\N	99	6	10
577	\N	48	6	10
578	\N	232	6	10
579	\N	97	6	28
580	\N	233	6	10
581	\N	203	6	10
582	\N	55	6	20
583	\N	63	6	10
584	\N	125	6	46
585	\N	12	6	2
586	\N	222	6	6
587	\N	131	6	6
588	\N	234	6	36
589	\N	12	6	6
590	\N	214	6	2
591	\N	21	6	2
592	\N	76	6	48
593	\N	235	6	36
594	\N	115	6	49
595	\N	31	6	49
596	\N	236	6	7
597	\N	145	6	40
598	\N	119	6	2
599	\N	142	6	2
600	\N	21	6	40
601	\N	22	6	40
602	\N	212	6	40
603	\N	103	6	2
604	\N	183	6	40
605	\N	199	6	2
606	\N	237	6	36
607	\N	26	6	6
608	\N	238	6	53
609	\N	13	7	6
610	\N	196	7	6
611	\N	114	7	2
612	\N	131	7	2
613	\N	109	7	2
614	\N	239	7	2
615	\N	240	7	6
616	\N	241	7	2
617	\N	223	7	2
618	\N	82	7	2
619	\N	119	7	6
620	\N	238	7	2
621	\N	169	7	2
622	\N	222	7	6
623	\N	27	7	2
624	\N	234	7	36
625	\N	164	7	36
626	\N	101	7	36
627	\N	224	7	2
628	\N	214	7	2
629	\N	28	7	36
630	\N	5	7	2
631	\N	29	7	49
632	\N	31	7	49
633	\N	242	7	6
634	\N	131	7	34
635	\N	243	7	34
636	\N	19	7	2
637	\N	44	7	9
638	\N	65	7	10
639	\N	177	7	47
640	\N	34	7	10
641	\N	66	7	10
642	\N	129	7	28
643	\N	244	7	10
644	\N	97	7	10
645	\N	125	7	19
646	\N	98	7	20
647	\N	50	7	28
648	\N	63	7	10
649	\N	245	7	10
650	\N	232	7	10
651	\N	128	7	28
652	\N	246	7	28
653	\N	67	7	10
654	\N	205	7	10
655	\N	124	7	28
656	\N	58	7	10
657	\N	247	7	10
658	\N	38	7	10
659	\N	203	7	10
660	\N	230	7	10
661	\N	172	7	10
662	\N	248	7	10
663	\N	229	7	10
664	\N	88	7	10
665	\N	226	7	10
666	\N	231	7	10
667	\N	233	7	10
668	\N	49	7	10
669	\N	176	7	28
670	\N	43	7	10
671	\N	132	7	6
672	\N	26	7	2
673	\N	101	7	6
674	\N	249	7	40
675	\N	111	7	2
676	\N	131	7	49
677	\N	103	7	2
678	\N	234	7	2
679	\N	250	7	6
680	\N	29	7	54
681	\N	251	7	49
682	\N	183	7	40
683	\N	6	7	7
684	\N	252	7	40
685	\N	142	7	2
686	\N	253	7	2
687	\N	198	7	2
688	\N	254	7	40
689	\N	255	7	55
690	\N	236	7	2
691	\N	216	7	34
692	\N	27	7	49
693	\N	220	7	2
694	\N	256	7	36
695	\N	31	7	2
696	\N	216	7	40
697	\N	18	7	2
698	\N	103	7	36
699	\N	76	7	49
700	\N	257	7	2
701	\N	258	7	40
702	\N	259	7	6
703	\N	13	8	2
704	\N	114	8	2
705	\N	169	8	2
706	\N	31	8	2
707	\N	27	8	6
708	\N	250	8	6
709	\N	119	8	6
710	\N	224	8	6
711	\N	259	8	6
712	\N	257	8	2
713	\N	82	8	2
714	\N	260	8	6
715	\N	238	8	2
716	\N	222	8	6
717	\N	131	8	6
718	\N	196	8	6
719	\N	243	8	49
720	\N	261	8	2
721	\N	262	8	40
722	\N	29	8	6
723	\N	236	8	7
724	\N	242	8	2
725	\N	216	8	34
726	\N	263	8	40
727	\N	214	8	2
728	\N	82	8	49
729	\N	142	8	34
730	\N	185	8	2
731	\N	103	8	2
732	\N	258	8	7
733	\N	65	8	52
734	\N	58	8	52
735	\N	124	8	28
736	\N	43	8	10
737	\N	88	8	10
738	\N	233	8	10
739	\N	175	8	10
740	\N	205	8	10
741	\N	244	8	47
742	\N	50	8	19
743	\N	248	8	10
744	\N	176	8	28
745	\N	245	8	10
746	\N	227	8	28
747	\N	38	8	10
748	\N	34	8	10
749	\N	177	8	10
750	\N	125	8	10
751	\N	264	8	10
752	\N	247	8	10
753	\N	226	8	56
754	\N	63	8	10
755	\N	265	8	28
756	\N	266	8	10
757	\N	128	8	10
758	\N	267	8	10
759	\N	232	8	10
760	\N	172	8	10
761	\N	203	8	10
762	\N	97	8	19
763	\N	49	8	9
764	\N	230	8	10
765	\N	268	8	10
766	\N	269	8	7
767	\N	262	8	49
768	\N	142	8	49
769	\N	270	8	34
770	\N	142	8	7
771	\N	6	8	7
772	\N	263	8	2
773	\N	183	8	34
774	\N	258	8	34
775	\N	253	8	2
776	\N	188	8	57
777	\N	271	8	7
778	\N	272	8	57
779	\N	273	8	7
780	\N	198	8	57
781	\N	111	8	2
782	\N	274	8	7
783	\N	275	8	7
784	\N	220	8	2
785	\N	82	9	7
786	\N	196	9	6
787	\N	131	9	6
788	\N	13	9	2
789	\N	114	9	2
790	\N	31	9	2
791	\N	169	9	2
792	\N	111	9	2
793	\N	214	9	2
794	\N	119	9	6
795	\N	29	9	7
796	\N	236	9	7
797	\N	31	9	34
798	\N	276	9	58
799	\N	259	9	6
800	\N	257	9	2
801	\N	277	9	58
802	\N	142	9	7
803	\N	82	9	49
804	\N	114	9	34
805	\N	242	9	2
806	\N	243	9	49
807	\N	262	9	49
808	\N	216	9	7
809	\N	278	9	2
810	\N	239	9	2
811	\N	279	9	40
812	\N	255	9	40
813	\N	280	9	2
814	\N	281	9	2
815	\N	282	9	35
816	\N	238	9	35
817	\N	216	9	34
818	\N	283	9	40
819	\N	284	9	2
820	\N	19	9	2
821	\N	272	9	57
822	\N	261	9	2
823	\N	124	9	52
824	\N	285	9	52
825	\N	233	9	10
826	\N	38	9	52
827	\N	58	9	52
828	\N	125	9	9
829	\N	177	9	47
830	\N	286	9	9
831	\N	128	9	10
832	\N	267	9	10
833	\N	232	9	10
834	\N	34	9	10
835	\N	247	9	28
836	\N	245	9	10
837	\N	287	9	28
838	\N	288	9	28
839	\N	266	9	10
840	\N	43	9	10
841	\N	228	9	10
842	\N	97	9	19
843	\N	246	9	10
844	\N	265	9	28
845	\N	176	9	10
846	\N	227	9	56
847	\N	248	9	19
848	\N	244	9	10
849	\N	66	9	9
850	\N	203	9	9
851	\N	205	9	10
852	\N	289	9	10
853	\N	290	9	10
854	\N	291	9	10
855	\N	292	9	28
856	\N	240	9	6
857	\N	29	9	2
858	\N	187	9	2
859	\N	293	9	2
860	\N	49	9	2
861	\N	29	9	34
862	\N	294	9	2
863	\N	295	9	7
864	\N	263	9	40
865	\N	296	9	58
866	\N	183	9	40
867	\N	297	9	7
868	\N	188	9	57
869	\N	273	9	7
870	\N	293	9	6
871	\N	263	9	58
872	\N	187	9	7
873	\N	298	9	7
874	\N	185	9	2
875	\N	275	9	7
876	\N	271	9	7
877	\N	276	9	2
878	\N	282	9	2
879	\N	257	9	34
880	\N	183	9	7
881	\N	299	9	7
882	\N	300	9	7
883	\N	301	9	7
884	\N	302	9	7
885	\N	236	10	59
886	\N	243	10	6
887	\N	29	10	59
888	\N	293	10	6
889	\N	297	10	59
890	\N	142	10	60
891	\N	82	10	59
892	\N	216	10	34
893	\N	31	10	34
894	\N	257	10	34
895	\N	114	10	6
896	\N	277	10	58
897	\N	261	10	59
898	\N	259	10	57
899	\N	276	10	6
900	\N	253	10	58
901	\N	263	10	59
902	\N	242	10	2
903	\N	303	10	59
904	\N	304	10	59
905	\N	280	10	57
906	\N	305	10	58
907	\N	306	10	59
908	\N	281	10	2
909	\N	97	10	9
910	\N	58	10	9
911	\N	176	10	19
912	\N	38	10	52
913	\N	289	10	52
914	\N	233	10	52
915	\N	46	10	10
916	\N	128	10	10
917	\N	43	10	10
918	\N	288	10	28
919	\N	50	10	28
920	\N	244	10	23
921	\N	226	10	56
922	\N	172	10	10
923	\N	307	10	10
924	\N	308	10	10
925	\N	265	10	28
926	\N	232	10	28
927	\N	44	10	9
928	\N	66	10	9
929	\N	267	10	28
930	\N	177	10	10
931	\N	231	10	62
932	\N	309	10	47
933	\N	245	10	10
934	\N	310	10	10
935	\N	248	10	61
936	\N	227	10	10
937	\N	286	10	10
938	\N	266	10	63
939	\N	311	10	10
940	\N	291	10	19
941	\N	124	10	52
942	\N	312	10	58
943	\N	272	10	57
944	\N	294	10	64
945	\N	142	10	64
946	\N	240	10	6
947	\N	272	10	2
948	\N	313	10	2
949	\N	82	10	34
950	\N	314	10	6
951	\N	295	10	60
952	\N	315	10	60
953	\N	316	10	2
954	\N	296	10	58
955	\N	317	10	67
956	\N	318	10	59
957	\N	319	10	59
958	\N	263	10	67
959	\N	183	10	59
960	\N	185	10	60
961	\N	320	10	58
962	\N	271	10	65
963	\N	321	10	59
964	\N	243	10	49
965	\N	322	10	59
966	\N	323	10	59
967	\N	324	10	66
968	\N	325	10	58
969	\N	326	10	59
970	\N	327	10	59
971	\N	185	10	34
972	\N	328	10	60
973	\N	242	10	59
974	\N	282	10	2
975	\N	183	10	60
976	\N	259	10	6
977	\N	329	10	57
978	\N	97	10	10
979	\N	260	10	69
980	\N	313	10	68
981	\N	31	10	59
982	\N	330	10	67
983	\N	331	10	40
984	\N	332	10	2
985	\N	297	11	59
986	\N	276	11	6
987	\N	29	11	59
988	\N	82	11	59
989	\N	169	11	60
990	\N	259	11	6
991	\N	312	11	58
992	\N	257	11	34
993	\N	293	11	6
994	\N	333	11	58
995	\N	27	11	6
996	\N	334	11	60
997	\N	261	11	70
998	\N	335	11	2
999	\N	336	11	2
1000	\N	31	11	59
1001	\N	236	11	59
1002	\N	277	11	34
1003	\N	296	11	58
1004	\N	337	11	2
1005	\N	338	11	2
1006	\N	242	11	2
1007	\N	82	11	58
1008	\N	243	11	59
1009	\N	339	11	6
1010	\N	314	11	34
1011	\N	142	11	59
1012	\N	317	11	59
1013	\N	340	11	58
1014	\N	29	11	60
1015	\N	253	11	59
1016	\N	271	11	65
1017	\N	261	11	60
1018	\N	341	11	71
1019	\N	242	11	72
1020	\N	342	11	71
1021	\N	295	11	60
1022	\N	58	11	9
1023	\N	97	11	9
1024	\N	289	11	52
1025	\N	309	11	47
1026	\N	176	11	19
1027	\N	128	11	27
1028	\N	343	11	9
1029	\N	244	11	73
1030	\N	344	11	27
1031	\N	245	11	10
1032	\N	311	11	52
1033	\N	46	11	28
1034	\N	208	11	28
1035	\N	50	11	10
1036	\N	95	11	9
1037	\N	310	11	73
1038	\N	228	11	10
1039	\N	345	11	61
1040	\N	124	11	52
1041	\N	49	11	9
1042	\N	265	11	17
1043	\N	177	11	10
1044	\N	38	11	9
1045	\N	346	11	52
1046	\N	288	11	10
1047	\N	230	11	10
1048	\N	233	11	52
1049	\N	92	11	10
1050	\N	308	11	52
1051	\N	291	11	9
1052	\N	66	11	9
1053	\N	226	11	17
1054	\N	287	11	10
1055	\N	318	11	59
1056	\N	272	11	59
1057	\N	347	11	58
1058	\N	142	11	64
1059	\N	240	11	59
1060	\N	304	11	59
1061	\N	348	11	6
1062	\N	321	11	58
1063	\N	216	11	58
1064	\N	335	11	72
1065	\N	243	11	49
1066	\N	339	11	71
1067	\N	320	11	58
1068	\N	29	11	64
1069	\N	341	11	59
1070	\N	183	11	59
1071	\N	322	11	60
1072	\N	342	11	59
1073	\N	328	11	60
1074	\N	282	11	72
1075	\N	185	11	57
1076	\N	188	11	57
1077	\N	349	11	59
1078	\N	187	11	59
1079	\N	350	11	70
1080	\N	351	11	60
1081	\N	242	11	60
1082	\N	352	11	59
1083	\N	353	11	59
1084	\N	214	11	2
1085	\N	293	11	59
1086	\N	354	11	58
1087	\N	259	11	60
1088	\N	305	11	72
1089	\N	355	11	2
1090	\N	271	11	60
1091	\N	216	11	59
1092	\N	82	12	74
1093	\N	339	12	6
1094	\N	293	12	6
1095	\N	259	12	6
1096	\N	314	12	57
1097	\N	297	12	59
1098	\N	29	12	60
1099	\N	276	12	74
1100	\N	185	12	57
1101	\N	347	12	74
1102	\N	340	12	59
1103	\N	257	12	57
1104	\N	243	12	34
1105	\N	356	12	74
1106	\N	236	12	59
1107	\N	277	12	34
1108	\N	312	12	74
1109	\N	318	12	74
1110	\N	261	12	59
1111	\N	304	12	55
1112	\N	240	12	55
1113	\N	326	12	74
1114	\N	272	12	57
1115	\N	295	12	74
1116	\N	240	12	6
1117	\N	357	12	59
1118	\N	358	12	60
1119	\N	304	12	74
1120	\N	348	12	74
1121	\N	273	12	74
1122	\N	187	12	74
1123	\N	359	12	6
1124	\N	142	12	59
1125	\N	242	12	75
1126	\N	360	12	59
1127	\N	361	12	74
1128	\N	271	12	65
1129	\N	362	12	74
1130	\N	322	12	77
1131	\N	183	12	76
1132	\N	82	12	76
1133	\N	327	12	74
1134	\N	363	12	74
1135	\N	364	12	60
1136	\N	295	12	59
1137	\N	348	12	6
1138	\N	188	12	57
1139	\N	365	12	78
1140	\N	366	12	59
1141	\N	367	12	59
1142	\N	368	12	59
1143	\N	366	12	60
1144	\N	369	12	79
1145	\N	370	12	6
1146	\N	371	12	80
1147	\N	261	12	74
1148	\N	183	12	59
1149	\N	372	12	80
1150	\N	373	12	75
1151	\N	101	12	55
1152	\N	351	12	59
1153	\N	374	12	74
1154	\N	375	12	59
1155	\N	376	12	59
1156	\N	377	12	74
1157	\N	378	12	59
1158	\N	240	12	74
1159	\N	354	12	74
1160	\N	343	12	74
1161	\N	379	12	59
1162	\N	380	12	74
1163	\N	277	13	34
1164	\N	326	13	74
1165	\N	293	13	6
1166	\N	359	13	6
1167	\N	362	13	59
1168	\N	272	13	57
1169	\N	257	13	57
1170	\N	357	13	59
1171	\N	347	13	74
1172	\N	370	13	6
1173	\N	339	13	34
1174	\N	312	13	74
1175	\N	261	13	74
1176	\N	187	13	55
1177	\N	314	13	57
1178	\N	297	13	59
1179	\N	142	13	81
1180	\N	340	13	81
1181	\N	236	13	74
1182	\N	381	13	57
1183	\N	382	13	57
1184	\N	29	13	74
1185	\N	358	13	6
1186	\N	348	13	6
1187	\N	383	13	74
1188	\N	357	13	34
1189	\N	261	13	82
1190	\N	371	13	74
1191	\N	372	13	80
1192	\N	273	13	34
1193	\N	304	13	74
1194	\N	368	13	74
1195	\N	314	13	82
1196	\N	363	13	34
1197	\N	384	13	57
1198	\N	357	13	7
1199	\N	383	13	82
1200	\N	385	13	58
1201	\N	315	13	57
1202	\N	386	13	74
1203	\N	295	13	59
1204	\N	387	13	55
1205	\N	388	13	74
1206	\N	187	13	82
1207	\N	389	13	74
1208	\N	322	13	74
1209	\N	368	13	55
1210	\N	322	13	77
1211	\N	390	13	57
1212	\N	371	13	57
1213	\N	304	13	84
1214	\N	236	13	83
1215	\N	384	13	82
1216	\N	360	13	59
1217	\N	391	13	82
1218	\N	389	13	82
1219	\N	363	13	74
1220	\N	374	13	74
1221	\N	373	13	75
1222	\N	336	13	85
1223	\N	392	13	86
1224	\N	376	13	74
1225	\N	393	13	74
1226	\N	378	13	59
1227	\N	394	13	59
1228	\N	354	13	74
1229	\N	395	13	74
1230	\N	396	13	59
1231	\N	397	13	34
1232	\N	398	13	74
1233	\N	399	13	87
1234	\N	400	13	88
1235	\N	401	13	74
1236	\N	402	13	74
1237	\N	403	13	74
1238	\N	277	14	34
1239	\N	339	14	34
1240	\N	297	14	59
1241	\N	340	14	6
1242	\N	362	14	59
1243	\N	326	14	74
1244	\N	257	14	59
1245	\N	347	14	74
1246	\N	236	14	74
1247	\N	312	14	82
1248	\N	348	14	6
1249	\N	29	14	81
1250	\N	314	14	83
1251	\N	354	14	82
1252	\N	383	14	82
1253	\N	404	14	81
1254	\N	360	14	74
1255	\N	293	14	89
1256	\N	359	14	89
1257	\N	368	14	82
1258	\N	295	14	90
1259	\N	387	14	90
1260	\N	336	14	85
1261	\N	358	14	34
1262	\N	272	14	57
1263	\N	304	14	81
1264	\N	236	14	83
1265	\N	312	14	91
1266	\N	385	14	74
1267	\N	405	14	6
1268	\N	406	14	57
1269	\N	29	14	74
1270	\N	293	14	82
1271	\N	261	14	82
1272	\N	407	14	74
1273	\N	408	14	81
1274	\N	368	14	81
1275	\N	409	14	77
1276	\N	328	14	59
1277	\N	101	14	74
1278	\N	327	14	74
1279	\N	392	14	86
1280	\N	29	14	34
1281	\N	407	14	81
1282	\N	410	14	74
1283	\N	358	14	6
1284	\N	411	14	60
1285	\N	373	14	92
1286	\N	391	14	82
1287	\N	386	14	57
1288	\N	369	14	79
1289	\N	412	14	93
1290	\N	97	14	82
1291	\N	413	14	74
1292	\N	261	14	81
1293	\N	378	14	82
1294	\N	379	14	74
1295	\N	414	14	93
1296	\N	415	14	34
1297	\N	404	14	82
1298	\N	416	14	59
1299	\N	379	14	58
1300	\N	417	14	74
1301	\N	396	14	59
1302	\N	399	14	87
1303	\N	418	14	60
1304	\N	419	14	94
1305	\N	420	14	1
1306	\N	421	14	83
1307	\N	398	14	74
1308	\N	403	14	87
1309	\N	422	14	82
1310	\N	395	14	74
1311	\N	277	15	34
1312	\N	339	15	34
1313	\N	385	15	74
1314	\N	347	15	74
1315	\N	257	15	59
1316	\N	407	15	82
1317	\N	408	15	95
1318	\N	383	15	82
1319	\N	293	15	59
1320	\N	358	15	6
1321	\N	314	15	95
1322	\N	29	15	34
1323	\N	236	15	95
1324	\N	297	15	59
1325	\N	340	15	6
1326	\N	326	15	91
1327	\N	404	15	82
1328	\N	423	15	82
1329	\N	360	15	82
1330	\N	312	15	82
1331	\N	101	15	90
1332	\N	359	15	34
1333	\N	362	15	34
1334	\N	257	15	96
1335	\N	383	15	96
1336	\N	272	15	57
1337	\N	312	15	91
1338	\N	423	15	74
1339	\N	383	15	95
1340	\N	257	15	95
1341	\N	410	15	74
1342	\N	424	15	59
1343	\N	409	15	96
1344	\N	326	15	82
1345	\N	425	15	97
1346	\N	426	15	34
1347	\N	406	15	74
1348	\N	427	15	98
1349	\N	188	15	59
1350	\N	428	15	96
1351	\N	404	15	74
1352	\N	405	15	6
1353	\N	328	15	99
1354	\N	429	15	96
1355	\N	396	15	59
1356	\N	379	15	74
1357	\N	378	15	96
1358	\N	413	15	6
1359	\N	415	15	74
1360	\N	347	16	74
1361	\N	340	16	6
1362	\N	277	16	34
1363	\N	410	16	74
1364	\N	297	16	59
1365	\N	430	16	34
1366	\N	383	16	96
1367	\N	236	16	95
1368	\N	431	16	97
1369	\N	420	16	1
1370	\N	362	16	82
1371	\N	425	16	96
1372	\N	403	16	102
1373	\N	421	16	97
1374	\N	358	16	6
1375	\N	408	16	95
1376	\N	257	16	95
1377	\N	428	16	59
1378	\N	396	16	59
1379	\N	314	16	95
1380	\N	418	16	103
1381	\N	395	16	74
1382	\N	399	16	101
1383	\N	419	16	94
1384	\N	398	16	74
1385	\N	432	16	74
1386	\N	433	16	102
1387	\N	434	16	94
1388	\N	435	16	100
1389	\N	436	16	60
1390	\N	437	16	59
1391	\N	438	16	95
1392	\N	431	16	74
1393	\N	426	16	82
1394	\N	427	16	98
1395	\N	407	16	82
1396	\N	339	16	98
1397	\N	304	16	34
1398	\N	312	16	82
1399	\N	261	16	34
1400	\N	404	16	82
1401	\N	409	16	96
1402	\N	439	16	59
1403	\N	440	16	103
1404	\N	441	16	74
1405	\N	406	16	74
1406	\N	372	16	34
1407	\N	409	16	95
1408	\N	371	16	6
1409	\N	429	16	74
1410	\N	359	16	95
1411	\N	442	16	34
1412	\N	413	16	6
1413	\N	443	16	6
1414	\N	415	16	74
1415	\N	443	16	82
1416	\N	405	16	6
1417	\N	430	17	34
1418	\N	358	17	6
1419	\N	277	17	34
1420	\N	443	17	34
1421	\N	339	17	60
1422	\N	444	17	60
1423	\N	257	17	60
1424	\N	347	17	74
1425	\N	428	17	60
1426	\N	383	17	96
1427	\N	410	17	82
1428	\N	236	17	105
1429	\N	340	17	6
1430	\N	438	17	95
1431	\N	297	17	104
1432	\N	408	17	95
1433	\N	314	17	107
1434	\N	383	17	60
1435	\N	297	17	106
1436	\N	385	17	82
1437	\N	352	17	34
1438	\N	324	17	6
1439	\N	438	17	105
1440	\N	424	17	96
1441	\N	404	17	60
1442	\N	413	17	74
1443	\N	257	17	95
1444	\N	340	17	60
1445	\N	445	17	95
1446	\N	446	17	109
1447	\N	326	17	108
1448	\N	405	17	6
1449	\N	429	17	74
1450	\N	359	17	6
1451	\N	347	17	82
1452	\N	339	17	98
1453	\N	314	17	110
1454	\N	293	17	107
1455	\N	404	17	96
1456	\N	385	17	74
1457	\N	312	17	34
1458	\N	427	17	98
1459	\N	413	17	82
1460	\N	443	17	107
1461	\N	443	17	110
1462	\N	415	17	60
1463	\N	413	18	60
1464	\N	396	18	59
1465	\N	340	18	98
1466	\N	438	18	105
1467	\N	408	18	95
1468	\N	236	18	105
1469	\N	434	18	95
1470	\N	447	18	95
1471	\N	403	18	101
1472	\N	448	18	82
1473	\N	314	18	107
1474	\N	383	18	60
1475	\N	428	18	60
1476	\N	410	18	34
1477	\N	257	18	60
1478	\N	347	18	82
1479	\N	277	18	82
1480	\N	430	18	34
1481	\N	404	18	6
1482	\N	297	18	112
1483	\N	358	18	6
1484	\N	448	18	34
1485	\N	347	18	74
1486	\N	314	18	110
1487	\N	449	18	111
1488	\N	450	18	111
1489	\N	339	18	107
1490	\N	347	18	94
1491	\N	324	18	6
1492	\N	405	18	6
1493	\N	445	18	82
1494	\N	277	18	94
1495	\N	444	18	60
1496	\N	445	18	34
1497	\N	297	18	110
1498	\N	451	18	34
1499	\N	452	18	60
1500	\N	444	18	105
1501	\N	453	18	113
1502	\N	454	18	94
1503	\N	452	18	97
1504	\N	451	18	81
1505	\N	455	18	111
1506	\N	456	18	114
1507	\N	457	18	81
1508	\N	458	18	114
1509	\N	459	18	111
1510	\N	426	18	60
1511	\N	460	18	82
1512	\N	461	18	94
1513	\N	462	18	107
1514	\N	463	18	59
1515	\N	455	18	60
1516	\N	359	18	94
1517	\N	405	18	110
1518	\N	450	18	104
1519	\N	415	18	94
1520	\N	464	18	6
1521	\N	415	18	82
1522	\N	347	19	94
1523	\N	277	19	94
1524	\N	428	19	105
1525	\N	404	19	6
1526	\N	438	19	112
1527	\N	450	19	116
1528	\N	383	19	60
1529	\N	340	19	98
1530	\N	396	19	105
1531	\N	433	19	95
1532	\N	314	19	110
1533	\N	455	19	6
1534	\N	257	19	60
1535	\N	430	19	116
1536	\N	403	19	87
1537	\N	465	19	59
1538	\N	413	19	34
1539	\N	236	19	105
1540	\N	466	19	6
1541	\N	410	19	34
1542	\N	467	19	60
1543	\N	434	19	105
1544	\N	405	19	115
1545	\N	438	19	104
1546	\N	467	19	115
1547	\N	297	19	104
1548	\N	383	19	94
1549	\N	448	19	34
1550	\N	426	19	34
1551	\N	304	19	115
1552	\N	450	19	111
1553	\N	449	19	116
1554	\N	454	19	94
1555	\N	257	19	112
1556	\N	453	19	105
1557	\N	314	19	105
1558	\N	468	19	115
1559	\N	449	19	115
1560	\N	459	19	98
1561	\N	469	19	115
1562	\N	457	19	81
1563	\N	458	19	105
1564	\N	297	19	117
1565	\N	451	19	98
1566	\N	470	19	6
1567	\N	425	19	34
1568	\N	471	19	111
1569	\N	314	19	104
1570	\N	472	19	94
1571	\N	438	19	117
1572	\N	473	19	34
1573	\N	474	19	94
1574	\N	257	19	98
1575	\N	415	19	94
1576	\N	430	20	116
1577	\N	277	20	94
1578	\N	438	20	104
1579	\N	383	20	94
1580	\N	297	20	104
1581	\N	450	20	116
1582	\N	454	20	34
1583	\N	403	20	105
1584	\N	420	20	105
1585	\N	428	20	94
1586	\N	340	20	34
1587	\N	413	20	34
1588	\N	404	20	6
1589	\N	236	20	97
1590	\N	474	20	94
1591	\N	396	20	94
1592	\N	455	20	97
1593	\N	465	20	104
1594	\N	448	20	97
1595	\N	426	20	94
1596	\N	468	20	60
1597	\N	453	20	97
1598	\N	450	20	104
1599	\N	468	20	104
1600	\N	475	20	94
1601	\N	413	20	6
1602	\N	257	20	94
1603	\N	470	20	104
1604	\N	454	20	118
1605	\N	449	20	116
1606	\N	305	20	94
1607	\N	472	20	34
1608	\N	462	20	107
1609	\N	476	20	95
1610	\N	477	20	34
1611	\N	236	21	83
1612	\N	438	21	104
1613	\N	430	21	119
1614	\N	450	21	111
1615	\N	475	21	58
1616	\N	277	21	58
1617	\N	471	21	111
1618	\N	396	21	58
1619	\N	413	21	34
1620	\N	383	21	119
1621	\N	420	21	83
1622	\N	434	21	58
1623	\N	428	21	58
1624	\N	455	21	6
1625	\N	340	21	104
1626	\N	477	21	34
1627	\N	449	21	119
1628	\N	297	21	104
1629	\N	448	21	85
1630	\N	474	21	119
1631	\N	478	21	83
1632	\N	454	21	34
1633	\N	404	21	119
1634	\N	466	21	120
1635	\N	479	21	58
1636	\N	480	21	119
1637	\N	481	21	6
1638	\N	470	21	83
1639	\N	482	21	6
1640	\N	483	21	119
1641	\N	484	21	104
1642	\N	314	21	104
1643	\N	305	21	58
1644	\N	453	21	121
1645	\N	485	21	58
1646	\N	340	21	122
1647	\N	467	21	85
1648	\N	457	21	119
1649	\N	486	21	85
1650	\N	257	21	104
1651	\N	487	21	120
1652	\N	430	21	123
1653	\N	488	21	58
1654	\N	470	21	122
1655	\N	489	21	83
1656	\N	490	21	34
1657	\N	474	22	6
1658	\N	430	22	123
1659	\N	482	22	6
1660	\N	488	22	94
1661	\N	404	22	111
1662	\N	438	22	117
1663	\N	467	22	122
1664	\N	455	22	6
1665	\N	277	22	83
1666	\N	480	22	124
1667	\N	471	22	124
1668	\N	478	22	122
1669	\N	466	22	125
1670	\N	485	22	94
1671	\N	340	22	122
1672	\N	483	22	123
1673	\N	491	22	34
1674	\N	413	22	34
1675	\N	434	22	83
1676	\N	383	22	34
1677	\N	396	22	124
1678	\N	433	22	83
1679	\N	484	22	117
1680	\N	257	22	117
1681	\N	479	22	124
1682	\N	450	22	111
1683	\N	486	22	83
1684	\N	492	22	124
1685	\N	493	22	122
1686	\N	494	22	126
1687	\N	495	22	124
1688	\N	496	22	124
1689	\N	480	22	125
1690	\N	487	22	124
1691	\N	488	22	126
1692	\N	470	22	122
1693	\N	497	22	124
1694	\N	434	22	94
1695	\N	454	22	117
1696	\N	468	22	34
1697	\N	487	22	125
1698	\N	484	22	34
1699	\N	498	22	34
1700	\N	499	22	124
1701	\N	407	22	122
1702	\N	485	22	126
1703	\N	500	22	124
1704	\N	453	22	121
1705	\N	501	22	117
1706	\N	477	22	34
1707	\N	305	22	94
1708	\N	502	22	83
1709	\N	451	22	117
1710	\N	503	22	34
1711	\N	504	22	122
1712	\N	423	22	123
1713	\N	430	23	123
1714	\N	438	23	117
1715	\N	455	23	6
1716	\N	482	23	6
1717	\N	486	23	122
1718	\N	480	23	119
1719	\N	505	23	83
1720	\N	471	23	119
1721	\N	491	23	34
1722	\N	498	23	34
1723	\N	499	23	119
1724	\N	485	23	58
1725	\N	483	23	123
1726	\N	488	23	34
1727	\N	423	23	117
1728	\N	474	23	6
1729	\N	466	23	122
1730	\N	277	23	83
1731	\N	494	23	58
1732	\N	484	23	34
1733	\N	479	23	34
1734	\N	404	23	111
1735	\N	478	23	119
1736	\N	396	23	122
1737	\N	506	23	119
1738	\N	450	23	34
1739	\N	407	23	122
1740	\N	434	23	58
1741	\N	507	23	83
1742	\N	497	23	119
1743	\N	467	23	117
1744	\N	487	23	127
1745	\N	487	23	6
1746	\N	508	23	123
1747	\N	509	23	6
1748	\N	454	23	34
1749	\N	471	23	128
1750	\N	470	23	127
1751	\N	510	23	129
1752	\N	340	23	122
1753	\N	488	23	58
1754	\N	492	23	119
1755	\N	472	23	34
1756	\N	511	23	117
1757	\N	504	23	122
1758	\N	467	23	34
1759	\N	485	24	58
1760	\N	483	24	123
1761	\N	430	24	123
1762	\N	455	24	6
1763	\N	438	24	117
1764	\N	507	24	83
1765	\N	482	24	34
1766	\N	423	24	117
1767	\N	509	24	6
1768	\N	497	24	119
1769	\N	500	24	119
1770	\N	450	24	34
1771	\N	491	24	130
1772	\N	480	24	58
1773	\N	499	24	34
1774	\N	505	24	83
1775	\N	407	24	122
1776	\N	506	24	122
1777	\N	487	24	130
1778	\N	512	24	122
1779	\N	513	24	131
1780	\N	466	24	122
1781	\N	511	24	117
1782	\N	514	24	123
1783	\N	433	24	130
1784	\N	454	24	131
1785	\N	434	24	58
1786	\N	471	24	119
1787	\N	277	24	131
1788	\N	466	24	83
1789	\N	404	24	127
1790	\N	515	24	119
1791	\N	516	24	119
1792	\N	488	24	119
1793	\N	517	24	132
1794	\N	471	24	130
1795	\N	518	24	83
1796	\N	519	24	122
1797	\N	520	24	119
1798	\N	521	24	130
1799	\N	493	24	130
1800	\N	455	24	117
1801	\N	478	24	83
1802	\N	404	24	123
1803	\N	486	24	130
1804	\N	484	24	34
1805	\N	455	24	130
1806	\N	467	24	131
1807	\N	438	25	117
1808	\N	499	25	6
1809	\N	482	25	6
1810	\N	407	25	117
1811	\N	450	25	34
1812	\N	508	25	123
1813	\N	505	25	83
1814	\N	491	25	119
1815	\N	471	25	34
1816	\N	485	25	117
1817	\N	522	25	81
1818	\N	518	25	83
1819	\N	480	25	58
1820	\N	277	25	81
1821	\N	455	25	58
1822	\N	523	25	83
1823	\N	524	25	119
1824	\N	510	25	34
1825	\N	511	25	123
1826	\N	506	25	122
1827	\N	509	25	130
1828	\N	515	25	119
1829	\N	519	25	122
1830	\N	423	25	131
1831	\N	500	25	131
1832	\N	525	25	119
1833	\N	526	25	58
1834	\N	514	25	123
1835	\N	434	25	117
1836	\N	515	25	133
1837	\N	422	25	58
1838	\N	527	25	130
1839	\N	467	25	131
1840	\N	486	25	135
1841	\N	404	25	134
1842	\N	517	25	83
1843	\N	493	25	130
1844	\N	528	25	132
1845	\N	529	25	83
1846	\N	530	25	136
1847	\N	531	25	83
1848	\N	532	25	122
1849	\N	488	25	119
1850	\N	533	25	131
1851	\N	523	25	130
1852	\N	530	25	131
1853	\N	506	25	83
1854	\N	534	25	130
1855	\N	535	25	122
1856	\N	484	25	81
1857	\N	516	25	136
1858	\N	470	25	122
1859	\N	536	25	83
1860	\N	537	25	138
1861	\N	491	25	137
1862	\N	538	25	119
1863	\N	539	25	136
1864	\N	540	25	130
1865	\N	541	25	134
1866	\N	451	25	117
1867	\N	542	25	122
1868	\N	478	25	81
1869	\N	526	25	133
1870	\N	538	25	132
1871	\N	534	25	122
1872	\N	543	25	83
1873	\N	544	25	83
1874	\N	474	25	140
1875	\N	543	25	122
1876	\N	501	25	139
1877	\N	519	25	117
1878	\N	404	25	34
1879	\N	461	25	83
1880	\N	539	25	83
1881	\N	486	25	58
1882	\N	485	26	117
1883	\N	515	26	133
1884	\N	505	26	83
1885	\N	482	26	6
1886	\N	508	26	123
1887	\N	499	26	6
1888	\N	501	26	139
1889	\N	455	26	58
1890	\N	525	26	119
1891	\N	277	26	81
1892	\N	511	26	123
1893	\N	530	26	143
1894	\N	478	26	81
1895	\N	519	26	117
1896	\N	506	26	83
1897	\N	509	26	141
1898	\N	474	26	140
1899	\N	538	26	34
1900	\N	480	26	58
1901	\N	540	26	141
1902	\N	507	26	142
1903	\N	518	26	122
1904	\N	500	26	143
1905	\N	478	26	144
1906	\N	545	26	58
1907	\N	514	26	58
1908	\N	434	26	117
1909	\N	546	26	34
1910	\N	526	26	123
1911	\N	536	26	119
1912	\N	547	26	141
1913	\N	548	26	132
1914	\N	510	26	81
1915	\N	549	26	133
1916	\N	277	26	144
1917	\N	550	26	133
1918	\N	510	26	144
1919	\N	547	26	144
1920	\N	551	26	141
1921	\N	526	26	141
1922	\N	528	26	144
1923	\N	493	26	132
1924	\N	549	26	144
1925	\N	552	26	137
1926	\N	534	26	123
1927	\N	510	26	141
1928	\N	501	26	119
1929	\N	553	26	58
1930	\N	537	26	138
1931	\N	554	26	122
1932	\N	524	26	119
1933	\N	555	26	58
1934	\N	556	26	133
1935	\N	518	26	58
1936	\N	539	26	141
1937	\N	557	26	137
1938	\N	404	26	132
1939	\N	558	26	133
1940	\N	559	26	141
1941	\N	500	26	145
1942	\N	509	26	142
1943	\N	560	26	141
1944	\N	518	26	139
1945	\N	561	26	123
1946	\N	536	26	141
1947	\N	499	27	6
1948	\N	508	27	123
1949	\N	530	27	131
1950	\N	524	27	119
1951	\N	511	27	123
1952	\N	519	27	117
1953	\N	482	27	6
1954	\N	455	27	148
1955	\N	560	27	141
1956	\N	506	27	147
1957	\N	562	27	142
1958	\N	505	27	147
1959	\N	485	27	142
1960	\N	536	27	119
1961	\N	500	27	131
1962	\N	515	27	117
1963	\N	525	27	119
1964	\N	540	27	146
1965	\N	480	27	58
1966	\N	474	27	58
1967	\N	518	27	139
1968	\N	539	27	34
1969	\N	474	27	140
1970	\N	546	27	58
1971	\N	558	27	122
1972	\N	561	27	148
1973	\N	404	27	132
1974	\N	556	27	133
1975	\N	563	27	58
1976	\N	480	27	119
1977	\N	526	27	123
1978	\N	549	27	122
1979	\N	509	27	119
1980	\N	541	27	149
1981	\N	564	27	97
1982	\N	565	27	141
1983	\N	566	27	97
1984	\N	567	27	97
1985	\N	522	27	133
1986	\N	471	27	122
1987	\N	568	27	97
1988	\N	567	27	132
1989	\N	551	27	97
1990	\N	546	27	97
1991	\N	569	27	122
1992	\N	538	27	131
1993	\N	536	27	97
1994	\N	478	27	147
1995	\N	570	27	123
1996	\N	509	27	148
1997	\N	571	27	132
1998	\N	478	27	133
1999	\N	455	27	132
2000	\N	572	27	139
2001	\N	573	27	122
2002	\N	505	27	6
2003	\N	574	27	123
2004	\N	541	27	147
2005	\N	404	27	148
2006	\N	575	27	133
2007	\N	576	27	148
2008	\N	577	27	122
2009	\N	578	27	150
2010	\N	571	27	148
2011	\N	579	27	123
2012	\N	557	27	137
2013	\N	511	28	148
2014	\N	506	28	83
2015	\N	505	28	6
2016	\N	485	28	142
2017	\N	474	28	58
2018	\N	482	28	132
2019	\N	525	28	122
2020	\N	526	28	119
2021	\N	530	28	131
2022	\N	518	28	83
2023	\N	575	28	119
2024	\N	540	28	146
2025	\N	508	28	123
2026	\N	515	28	117
2027	\N	519	28	117
2028	\N	480	28	123
2029	\N	562	28	142
2030	\N	499	28	6
2031	\N	571	28	122
2032	\N	560	28	131
2033	\N	563	28	58
2034	\N	541	28	34
2035	\N	558	28	119
2036	\N	524	28	119
2037	\N	572	28	119
2038	\N	500	28	139
2039	\N	553	28	119
2040	\N	524	28	83
2041	\N	549	28	131
2042	\N	567	28	119
2043	\N	566	28	117
2044	\N	580	28	133
2045	\N	556	28	133
2046	\N	509	28	119
2047	\N	516	28	151
2048	\N	573	28	34
2049	\N	581	28	131
2050	\N	455	28	132
2051	\N	541	28	122
2052	\N	582	28	119
2053	\N	583	28	133
2054	\N	454	28	131
2055	\N	558	28	117
2056	\N	584	28	119
2057	\N	585	28	122
2058	\N	586	28	117
2059	\N	528	28	122
2060	\N	534	28	152
2061	\N	585	28	132
2062	\N	587	28	119
2063	\N	522	28	34
2064	\N	557	28	122
2065	\N	588	28	153
2066	\N	589	28	139
2067	\N	529	28	34
2068	\N	571	28	139
2069	\N	509	28	131
2070	\N	539	28	133
2071	\N	553	28	149
2072	\N	590	28	119
2073	\N	591	28	117
2074	\N	592	28	122
2075	\N	564	28	154
2076	\N	593	28	83
2077	\N	500	28	131
2078	\N	594	28	139
2079	\N	586	28	6
2080	\N	595	28	123
2081	\N	579	28	150
2082	\N	500	28	146
2083	\N	577	28	150
2084	\N	474	29	58
2085	\N	499	29	83
2086	\N	508	29	123
2087	\N	515	29	117
2088	\N	480	29	58
2089	\N	585	29	117
2090	\N	505	29	6
2091	\N	586	29	6
2092	\N	485	29	142
2093	\N	511	29	148
2094	\N	519	29	89
2095	\N	500	29	89
2096	\N	558	29	117
2097	\N	596	29	123
2098	\N	482	29	131
2099	\N	540	29	146
2100	\N	524	29	131
2101	\N	525	29	122
2102	\N	518	29	83
2103	\N	549	29	141
2104	\N	594	29	132
2105	\N	592	29	132
2106	\N	509	29	156
2107	\N	580	29	122
2108	\N	583	29	58
2109	\N	597	29	155
2110	\N	569	29	133
2111	\N	581	29	157
2112	\N	478	29	157
2113	\N	534	29	152
2114	\N	598	29	155
2115	\N	597	29	133
2116	\N	599	29	158
2117	\N	594	29	131
2118	\N	600	29	133
2119	\N	455	29	132
2120	\N	591	29	117
2121	\N	601	29	89
2122	\N	566	29	117
2123	\N	598	29	89
2124	\N	600	29	132
2125	\N	602	29	132
2126	\N	557	29	117
2127	\N	598	29	148
2128	\N	556	29	132
2129	\N	603	29	132
2130	\N	603	29	117
2131	\N	571	29	89
2132	\N	590	29	89
2133	\N	556	29	89
2134	\N	604	29	122
2135	\N	601	29	156
2136	\N	605	29	148
2137	\N	558	29	132
2138	\N	500	29	58
2139	\N	606	29	122
2140	\N	603	29	83
2141	\N	599	29	122
2142	\N	540	30	146
2143	\N	505	30	58
2144	\N	518	30	117
2145	\N	508	30	146
2146	\N	474	30	58
2147	\N	485	30	142
2148	\N	607	30	131
2149	\N	519	30	157
2150	\N	549	30	141
2151	\N	482	30	141
2152	\N	600	30	132
2153	\N	586	30	6
2154	\N	583	30	58
2155	\N	608	30	131
2156	\N	515	30	148
2157	\N	500	30	123
2158	\N	534	30	152
2159	\N	499	30	147
2160	\N	599	30	152
2161	\N	511	30	6
2162	\N	596	30	123
2163	\N	585	30	117
2164	\N	603	30	147
2165	\N	509	30	156
2166	\N	581	30	157
2167	\N	524	30	89
2168	\N	609	30	159
2169	\N	591	30	1
2170	\N	609	30	156
2171	\N	598	30	148
2172	\N	455	30	146
2173	\N	610	30	132
2174	\N	602	30	123
2175	\N	600	30	123
2176	\N	525	30	1
2177	\N	611	30	132
2178	\N	583	30	160
2179	\N	612	30	97
2180	\N	603	30	97
2181	\N	575	30	142
2182	\N	499	30	97
2183	\N	549	31	141
2184	\N	603	31	83
2185	\N	598	31	142
2186	\N	600	31	123
2187	\N	591	31	1
2188	\N	613	31	117
2189	\N	612	31	83
2190	\N	508	31	1
2191	\N	511	31	6
2192	\N	482	31	132
2193	\N	485	31	142
2194	\N	586	31	6
2195	\N	540	31	146
2196	\N	581	31	157
2197	\N	611	31	89
2198	\N	474	31	58
2199	\N	519	31	157
2200	\N	505	31	141
2201	\N	607	31	58
2202	\N	518	31	117
2203	\N	534	31	152
2204	\N	599	31	152
2205	\N	596	31	146
2206	\N	500	31	123
2207	\N	614	31	131
2208	\N	615	31	131
2209	\N	608	31	89
2210	\N	597	31	161
2211	\N	602	31	131
2212	\N	616	31	117
2213	\N	617	31	132
2214	\N	608	31	132
2215	\N	583	31	83
2216	\N	580	31	141
2217	\N	618	31	141
2218	\N	556	31	89
2219	\N	619	31	58
2220	\N	525	31	1
2221	\N	602	31	132
2222	\N	620	31	157
2223	\N	621	31	157
2224	\N	622	31	1
2225	\N	620	31	123
2226	\N	623	31	141
2227	\N	602	31	141
2228	\N	549	32	141
2229	\N	505	32	141
2230	\N	603	32	83
2231	\N	474	32	1
2232	\N	597	32	123
2233	\N	585	32	155
2234	\N	624	32	142
2235	\N	599	32	152
2236	\N	611	32	132
2237	\N	596	32	6
2238	\N	500	32	146
2239	\N	583	32	83
2240	\N	591	32	1
2241	\N	540	32	146
2242	\N	598	32	142
2243	\N	608	32	89
2244	\N	581	32	157
2245	\N	606	32	161
2246	\N	619	32	58
2247	\N	586	32	6
2248	\N	518	32	117
2249	\N	607	32	58
2250	\N	613	32	152
2251	\N	622	32	117
2252	\N	623	32	123
2253	\N	600	32	119
2254	\N	625	32	161
2255	\N	626	32	157
2256	\N	627	32	119
2257	\N	612	32	123
2258	\N	627	32	161
2259	\N	628	32	132
2260	\N	534	32	146
2261	\N	629	32	89
2262	\N	630	32	123
2263	\N	631	32	162
2264	\N	553	32	162
2265	\N	632	32	161
2266	\N	627	32	132
2267	\N	593	32	161
2268	\N	611	32	155
2269	\N	585	32	146
2270	\N	500	32	161
2271	\N	633	32	157
2272	\N	613	33	152
2273	\N	505	33	141
2274	\N	599	33	152
2275	\N	499	33	117
2276	\N	598	33	141
2277	\N	518	33	117
2278	\N	630	33	123
2279	\N	607	33	58
2280	\N	627	33	89
2281	\N	621	33	89
2282	\N	591	33	1
2283	\N	519	33	119
2284	\N	622	33	1
2285	\N	600	33	155
2286	\N	634	33	119
2287	\N	629	33	123
2288	\N	624	33	142
2289	\N	596	33	6
2290	\N	540	33	146
2291	\N	631	33	162
2292	\N	581	33	83
2293	\N	597	33	146
2294	\N	586	33	6
2295	\N	603	33	83
2296	\N	619	33	58
2297	\N	500	33	161
2298	\N	635	33	157
2299	\N	636	33	161
2300	\N	553	33	157
2301	\N	637	33	132
2302	\N	638	33	162
2303	\N	474	33	141
2304	\N	553	33	123
2305	\N	611	33	157
2306	\N	600	33	141
2307	\N	608	33	155
2308	\N	566	33	119
2309	\N	602	33	155
2310	\N	585	33	6
2311	\N	639	33	58
2312	\N	602	33	58
2313	\N	640	33	155
2314	\N	580	33	119
2315	\N	474	33	6
2316	\N	603	34	83
2317	\N	499	34	117
2318	\N	540	34	141
2319	\N	585	34	6
2320	\N	611	34	157
2321	\N	613	34	152
2322	\N	631	34	162
2323	\N	624	34	157
2324	\N	599	34	6
2325	\N	641	34	123
2326	\N	619	34	58
2327	\N	642	34	155
2328	\N	627	34	163
2329	\N	621	34	89
2330	\N	598	34	141
2331	\N	607	34	58
2332	\N	637	34	155
2333	\N	597	34	152
2334	\N	518	34	117
2335	\N	634	34	146
2336	\N	635	34	1
2337	\N	500	34	146
2338	\N	581	34	83
2339	\N	643	34	161
2340	\N	591	34	162
2341	\N	630	34	123
2342	\N	622	34	1
2343	\N	632	34	161
2344	\N	549	34	157
2345	\N	644	34	163
2346	\N	645	34	157
2347	\N	633	34	163
2348	\N	615	34	164
2349	\N	646	34	163
2350	\N	647	34	141
2351	\N	613	35	117
2352	\N	598	35	141
2353	\N	607	35	58
2354	\N	597	35	1
2355	\N	585	35	152
2356	\N	645	35	157
2357	\N	611	35	157
2358	\N	647	35	163
2359	\N	648	35	123
2360	\N	631	35	152
2361	\N	622	35	146
2362	\N	581	35	1
2363	\N	499	35	117
2364	\N	619	35	58
2365	\N	603	35	83
2366	\N	638	35	83
2367	\N	599	35	6
2368	\N	632	35	161
2369	\N	649	35	146
2370	\N	650	35	163
2371	\N	642	35	162
2372	\N	540	35	141
2373	\N	630	35	6
2374	\N	635	35	164
2375	\N	651	35	123
2376	\N	652	35	162
2377	\N	621	35	89
2378	\N	653	35	161
2379	\N	643	35	83
2380	\N	654	35	164
2381	\N	620	35	163
2382	\N	615	35	123
2383	\N	620	35	123
2384	\N	655	35	89
2385	\N	615	35	162
2386	\N	656	35	162
2387	\N	621	35	83
2388	\N	657	35	152
2389	\N	613	36	117
2390	\N	630	36	6
2391	\N	607	36	58
2392	\N	599	36	6
2393	\N	585	36	152
2394	\N	540	36	146
2395	\N	615	36	123
2396	\N	648	36	123
2397	\N	650	36	163
2398	\N	631	36	152
2399	\N	645	36	157
2400	\N	632	36	161
2401	\N	621	36	163
2402	\N	655	36	157
2403	\N	652	36	58
2404	\N	597	36	1
2405	\N	656	36	165
2406	\N	499	36	117
2407	\N	622	36	146
2408	\N	581	36	1
2409	\N	598	36	141
2410	\N	649	36	83
2411	\N	619	36	141
2412	\N	635	36	164
2413	\N	603	36	83
2414	\N	651	36	123
2415	\N	615	36	6
2416	\N	647	36	166
2417	\N	638	36	162
2418	\N	611	36	83
2419	\N	654	36	161
2420	\N	649	36	152
2421	\N	646	36	163
2422	\N	632	36	162
2423	\N	657	36	146
2424	\N	549	36	81
2425	\N	658	36	166
2426	\N	518	36	117
2427	\N	659	36	123
2428	\N	657	36	123
2429	\N	603	37	141
2430	\N	652	37	58
2431	\N	540	37	146
2432	\N	599	37	146
2433	\N	648	37	123
2434	\N	655	37	167
2435	\N	657	37	123
2436	\N	607	37	83
2437	\N	660	37	58
2438	\N	638	37	167
2439	\N	645	37	157
2440	\N	630	37	6
2441	\N	613	37	117
2442	\N	658	37	161
2443	\N	615	37	6
2444	\N	585	37	81
2445	\N	581	37	83
2446	\N	647	37	166
2447	\N	611	37	157
2448	\N	661	37	165
2449	\N	622	37	165
2450	\N	632	37	161
2451	\N	598	37	117
2452	\N	549	37	81
2453	\N	619	37	141
2454	\N	654	37	166
2455	\N	631	37	83
2456	\N	658	37	157
2457	\N	597	37	81
2458	\N	662	37	161
2459	\N	650	37	146
2460	\N	663	37	161
2461	\N	659	37	168
2462	\N	613	38	117
2463	\N	603	38	141
2464	\N	615	38	117
2465	\N	655	38	6
2466	\N	645	38	167
2467	\N	619	38	141
2468	\N	664	38	58
2469	\N	630	38	6
2470	\N	658	38	166
2471	\N	647	38	123
2472	\N	657	38	123
2473	\N	665	38	168
2474	\N	597	38	157
2475	\N	652	38	58
2476	\N	581	38	83
2477	\N	622	38	83
2478	\N	631	38	157
2479	\N	663	38	161
2480	\N	661	38	165
2481	\N	648	38	166
2482	\N	638	38	167
2483	\N	666	38	165
2484	\N	659	38	119
2485	\N	650	38	169
2486	\N	667	38	161
2487	\N	632	38	146
2488	\N	599	38	146
2489	\N	668	38	161
2490	\N	669	38	170
2491	\N	670	38	169
2492	\N	639	38	168
2493	\N	581	38	141
2494	\N	671	38	83
2495	\N	613	39	117
2496	\N	655	39	6
2497	\N	603	39	58
2498	\N	631	39	157
2499	\N	630	39	6
2500	\N	664	39	58
2501	\N	645	39	167
2502	\N	597	39	157
2503	\N	615	39	146
2504	\N	622	39	173
2505	\N	647	39	123
2506	\N	672	39	165
2507	\N	650	39	169
2508	\N	667	39	170
2509	\N	657	39	168
2510	\N	670	39	169
2511	\N	652	39	117
2512	\N	599	39	146
2513	\N	671	39	172
2514	\N	619	39	141
2515	\N	661	39	167
2516	\N	581	39	141
2517	\N	659	39	119
2518	\N	666	39	165
2519	\N	673	39	119
2520	\N	674	39	172
2521	\N	675	39	123
2522	\N	632	39	166
2523	\N	669	39	161
2524	\N	676	39	166
2525	\N	663	39	171
2526	\N	656	39	165
2527	\N	648	39	141
2528	\N	644	39	141
2529	\N	677	39	169
2530	\N	678	39	169
2531	\N	619	40	6
2532	\N	613	40	117
2533	\N	673	40	119
2534	\N	679	40	167
2535	\N	631	40	157
2536	\N	661	40	167
2537	\N	647	40	123
2538	\N	664	40	58
2539	\N	680	40	146
2540	\N	630	40	123
2541	\N	652	40	117
2542	\N	650	40	169
2543	\N	622	40	171
2544	\N	658	40	173
2545	\N	581	40	141
2546	\N	597	40	157
2547	\N	676	40	166
2548	\N	648	40	83
2549	\N	659	40	119
2550	\N	603	40	58
2551	\N	669	40	161
2552	\N	671	40	83
2553	\N	645	40	141
2554	\N	656	40	165
2555	\N	655	40	6
2556	\N	672	40	165
2557	\N	670	40	169
2558	\N	599	40	146
2559	\N	681	40	172
2560	\N	639	40	170
2561	\N	663	40	171
2562	\N	632	40	161
2563	\N	682	40	173
2564	\N	678	40	170
2565	\N	683	40	168
2566	\N	677	40	166
2567	\N	615	40	174
2568	\N	684	40	174
2569	\N	667	40	168
2570	\N	685	40	123
2571	\N	686	40	167
2572	\N	687	40	169
2573	\N	688	40	157
2574	\N	670	40	168
2575	\N	630	40	169
2576	\N	679	40	123
2577	\N	678	40	173
2578	\N	689	40	170
2579	\N	674	40	172
2580	\N	690	40	174
2581	\N	681	40	173
2582	\N	691	40	165
2583	\N	684	40	173
2584	\N	652	41	117
2585	\N	685	41	123
2586	\N	645	41	141
2587	\N	603	41	167
2588	\N	671	41	83
2589	\N	664	41	123
2590	\N	656	41	165
2591	\N	687	41	169
2592	\N	581	41	141
2593	\N	630	41	157
2594	\N	661	41	167
2595	\N	676	41	157
2596	\N	639	41	172
2597	\N	673	41	175
2598	\N	691	41	165
2599	\N	677	41	169
2600	\N	619	41	6
2601	\N	655	41	117
2602	\N	681	41	83
2603	\N	680	41	161
2604	\N	622	41	171
2605	\N	613	41	6
2606	\N	659	41	175
2607	\N	631	41	58
2608	\N	669	41	146
2609	\N	688	41	58
2610	\N	650	41	146
2611	\N	615	41	174
2612	\N	692	41	171
2613	\N	690	41	174
2614	\N	667	41	168
2615	\N	670	41	168
2616	\N	693	41	172
2617	\N	694	41	176
2618	\N	684	41	170
2619	\N	663	41	157
2620	\N	681	41	174
2621	\N	686	41	171
2622	\N	695	41	83
2623	\N	591	41	176
2624	\N	639	41	167
2625	\N	679	41	58
2626	\N	692	41	165
2627	\N	652	42	117
2628	\N	613	42	6
2629	\N	603	42	167
2630	\N	671	42	123
2631	\N	664	42	123
2632	\N	677	42	169
2633	\N	669	42	180
2634	\N	667	42	168
2635	\N	656	42	165
2636	\N	684	42	177
2637	\N	648	42	83
2638	\N	685	42	6
2639	\N	696	42	58
2640	\N	581	42	141
2641	\N	639	42	167
2642	\N	630	42	178
2643	\N	659	42	175
2644	\N	645	42	146
2645	\N	655	42	117
2646	\N	619	42	141
2647	\N	673	42	175
2648	\N	697	42	83
2649	\N	686	42	171
2650	\N	692	42	165
2651	\N	690	42	171
2652	\N	687	42	169
2653	\N	663	42	178
2654	\N	615	42	168
2655	\N	698	42	146
2656	\N	675	42	58
2657	\N	622	42	177
2658	\N	699	42	170
2659	\N	680	42	179
2660	\N	700	42	180
2661	\N	687	42	81
2662	\N	677	42	81
2663	\N	701	42	168
2664	\N	615	42	178
2665	\N	679	42	58
2666	\N	702	42	58
2667	\N	703	42	177
2668	\N	703	42	167
2669	\N	639	42	177
2670	\N	704	42	177
2671	\N	667	42	179
2672	\N	680	42	168
2673	\N	705	42	175
2674	\N	706	42	170
2675	\N	692	42	6
2676	\N	639	42	165
2677	\N	684	42	169
2678	\N	619	43	141
2679	\N	581	43	141
2680	\N	652	43	117
2681	\N	703	43	167
2682	\N	655	43	117
2683	\N	679	43	58
2684	\N	698	43	146
2685	\N	677	43	178
2686	\N	696	43	58
2687	\N	630	43	178
2688	\N	673	43	177
2689	\N	707	43	169
2690	\N	700	43	83
2691	\N	680	43	123
2692	\N	645	43	146
2693	\N	656	43	171
2694	\N	692	43	165
2695	\N	690	43	171
2696	\N	708	43	165
2697	\N	622	43	123
2698	\N	685	43	6
2699	\N	659	43	6
2700	\N	667	43	179
2701	\N	705	43	119
2702	\N	684	43	169
2703	\N	648	43	167
2704	\N	709	43	119
2705	\N	710	43	179
2706	\N	671	43	177
2707	\N	711	43	83
2708	\N	712	43	83
2709	\N	639	43	181
2710	\N	713	43	181
2711	\N	704	43	165
2712	\N	700	43	179
2713	\N	714	43	119
2714	\N	669	43	6
2715	\N	608	43	119
2716	\N	613	44	141
2717	\N	652	44	117
2718	\N	697	44	146
2719	\N	708	44	165
2720	\N	690	44	182
2721	\N	655	44	6
2722	\N	631	44	178
2723	\N	648	44	146
2724	\N	630	44	81
2725	\N	698	44	169
2726	\N	581	44	167
2727	\N	703	44	167
2728	\N	679	44	58
2729	\N	705	44	182
2730	\N	715	44	177
2731	\N	685	44	6
2732	\N	650	44	169
2733	\N	701	44	165
2734	\N	677	44	178
2735	\N	716	44	81
2736	\N	712	44	141
2737	\N	704	44	58
2738	\N	717	44	117
2739	\N	659	44	177
2740	\N	707	44	123
2741	\N	622	44	123
2742	\N	645	44	177
2743	\N	656	44	165
2744	\N	718	44	58
2745	\N	719	44	177
2746	\N	696	44	117
2747	\N	714	44	177
2748	\N	720	44	177
2749	\N	721	44	169
2750	\N	722	44	165
2751	\N	703	45	167
2752	\N	712	45	141
2753	\N	685	45	6
2754	\N	715	45	177
2755	\N	707	45	123
2756	\N	705	45	182
2757	\N	679	45	58
2758	\N	656	45	165
2759	\N	698	45	169
2760	\N	718	45	58
2761	\N	723	45	146
2762	\N	695	45	184
2763	\N	652	45	141
2764	\N	648	45	117
2765	\N	720	45	177
2766	\N	724	45	167
2767	\N	687	45	146
2768	\N	697	45	123
2769	\N	708	45	178
2770	\N	725	45	182
2771	\N	696	45	117
2772	\N	630	45	165
2773	\N	692	45	178
2774	\N	655	45	6
2775	\N	726	45	169
2776	\N	684	45	183
2777	\N	727	45	184
2778	\N	709	45	183
2779	\N	677	45	177
2780	\N	669	45	6
2781	\N	622	45	177
2782	\N	690	45	167
2783	\N	704	45	58
2784	\N	728	45	141
2785	\N	729	45	184
2786	\N	622	45	182
2787	\N	722	45	184
2788	\N	619	45	141
2789	\N	650	45	117
2790	\N	730	45	58
2791	\N	650	45	169
2792	\N	670	45	169
2793	\N	679	45	146
2794	\N	687	45	58
2795	\N	731	45	184
2796	\N	732	45	169
2797	\N	733	45	58
2798	\N	734	45	146
2799	\N	679	45	167
2800	\N	735	45	184
2801	\N	690	45	182
2802	\N	736	45	169
2803	\N	703	46	167
2804	\N	728	46	141
2805	\N	655	46	6
2806	\N	696	46	117
2807	\N	685	46	6
2808	\N	697	46	117
2809	\N	733	46	123
2810	\N	677	46	146
2811	\N	729	46	183
2812	\N	737	46	185
2813	\N	692	46	178
2814	\N	735	46	178
2815	\N	716	46	165
2816	\N	639	46	185
2817	\N	705	46	182
2818	\N	712	46	141
2819	\N	679	46	167
2820	\N	684	46	183
2821	\N	715	46	177
2822	\N	724	46	184
2823	\N	707	46	123
2824	\N	720	46	177
2825	\N	731	46	184
2826	\N	725	46	182
2827	\N	723	46	146
2828	\N	656	46	165
2829	\N	619	46	117
2830	\N	648	46	146
2831	\N	738	46	182
2832	\N	739	46	178
2833	\N	740	46	183
2834	\N	718	46	165
2835	\N	736	46	183
2836	\N	667	46	123
2837	\N	741	46	117
2838	\N	712	47	141
2839	\N	742	47	141
2840	\N	720	47	6
2841	\N	655	47	167
2842	\N	696	47	117
2843	\N	733	47	123
2844	\N	723	47	146
2845	\N	725	47	182
2846	\N	743	47	178
2847	\N	737	47	146
2848	\N	707	47	123
2849	\N	718	47	165
2850	\N	703	47	6
2851	\N	744	47	165
2852	\N	715	47	177
2853	\N	728	47	117
2854	\N	724	47	178
2855	\N	685	47	167
2856	\N	648	47	177
2857	\N	679	47	182
2858	\N	716	47	185
2859	\N	729	47	185
2860	\N	745	47	165
2861	\N	740	47	165
2862	\N	728	48	117
2863	\N	703	48	6
2864	\N	696	48	117
2865	\N	655	48	167
2866	\N	723	48	187
2867	\N	669	48	182
2868	\N	746	48	187
2869	\N	725	48	141
2870	\N	747	48	165
2871	\N	737	48	157
2872	\N	715	48	186
2873	\N	733	48	123
2874	\N	741	48	186
2875	\N	685	48	167
2876	\N	707	48	165
2877	\N	744	48	177
2878	\N	724	48	123
2879	\N	748	48	177
2880	\N	742	48	141
2881	\N	720	48	6
2882	\N	679	48	182
2883	\N	712	48	157
2884	\N	749	48	81
2885	\N	743	48	81
2886	\N	692	48	182
2887	\N	750	48	167
2888	\N	747	48	187
2889	\N	751	48	182
2890	\N	745	48	165
2891	\N	696	49	117
2892	\N	728	49	117
2893	\N	725	49	141
2894	\N	720	49	6
2895	\N	742	49	141
2896	\N	679	49	182
2897	\N	750	49	167
2898	\N	712	49	177
2899	\N	723	49	187
2900	\N	744	49	167
2901	\N	685	49	182
2902	\N	747	49	187
2903	\N	743	49	123
2904	\N	733	49	157
2905	\N	752	49	165
2906	\N	746	49	165
2907	\N	703	49	6
2908	\N	737	49	157
2909	\N	748	49	177
2910	\N	741	49	186
2911	\N	753	49	123
2912	\N	715	49	186
2913	\N	724	49	186
2914	\N	720	50	6
2915	\N	725	50	177
2916	\N	748	50	141
2917	\N	744	50	167
2918	\N	715	50	186
2919	\N	754	50	157
2920	\N	753	50	157
2921	\N	703	50	6
2922	\N	755	50	188
2923	\N	716	50	165
2924	\N	750	50	167
2925	\N	737	50	182
2926	\N	756	50	165
2927	\N	747	50	187
2928	\N	723	50	187
2929	\N	696	50	117
2930	\N	704	50	141
2931	\N	728	50	117
2932	\N	742	50	188
2933	\N	712	50	177
2934	\N	685	50	182
2935	\N	679	50	186
2936	\N	757	50	165
2937	\N	733	50	188
2938	\N	733	50	6
2939	\N	703	51	6
2940	\N	715	51	6
2941	\N	748	51	141
2942	\N	742	51	188
2943	\N	744	51	167
2944	\N	755	51	188
2945	\N	750	51	167
2946	\N	756	51	165
2947	\N	758	51	187
2948	\N	733	51	182
2949	\N	759	51	141
2950	\N	737	51	182
2951	\N	760	51	165
2952	\N	725	51	177
2953	\N	747	51	177
2954	\N	685	51	187
2955	\N	696	51	117
2956	\N	724	51	157
2957	\N	728	51	117
2958	\N	754	51	157
2959	\N	720	51	189
2960	\N	679	51	189
2961	\N	761	51	189
2962	\N	703	52	6
2963	\N	728	52	117
2964	\N	715	52	6
2965	\N	758	52	182
2966	\N	725	52	177
2967	\N	762	52	182
2968	\N	723	52	188
2969	\N	761	52	189
2970	\N	685	52	187
2971	\N	724	52	157
2972	\N	720	52	189
2973	\N	763	52	165
2974	\N	744	52	167
2975	\N	759	52	167
2976	\N	764	52	141
2977	\N	747	52	177
2978	\N	696	52	117
2979	\N	748	52	141
2980	\N	742	52	188
2981	\N	745	52	165
2982	\N	765	52	157
2983	\N	760	52	187
2984	\N	761	52	187
2985	\N	754	52	189
2986	\N	755	52	177
2987	\N	685	52	177
2988	\N	725	52	187
2989	\N	766	52	187
2990	\N	767	52	165
2991	\N	703	53	6
2992	\N	764	53	141
2993	\N	762	53	117
2994	\N	720	53	189
2995	\N	768	53	165
2996	\N	733	53	190
2997	\N	767	53	165
2998	\N	754	53	189
2999	\N	728	53	117
3000	\N	742	53	188
3001	\N	725	53	157
3002	\N	765	53	157
3003	\N	769	53	177
3004	\N	747	53	152
3005	\N	715	53	6
3006	\N	748	53	141
3007	\N	744	53	177
3008	\N	770	53	182
3009	\N	758	53	182
3010	\N	759	53	152
3011	\N	723	53	188
3012	\N	771	53	190
3013	\N	772	53	165
3014	\N	725	53	182
3015	\N	728	54	117
3016	\N	764	54	141
3017	\N	762	54	117
3018	\N	703	54	6
3019	\N	747	54	152
3020	\N	725	54	182
3021	\N	763	54	152
3022	\N	748	54	141
3023	\N	742	54	188
3024	\N	759	54	188
3025	\N	724	54	165
3026	\N	744	54	177
3027	\N	773	54	189
3028	\N	723	54	190
3029	\N	758	54	182
3030	\N	774	54	165
3031	\N	768	54	189
3032	\N	775	54	190
3033	\N	776	54	177
3034	\N	715	54	6
3035	\N	777	54	165
3036	\N	774	54	189
3037	\N	778	54	177
3038	\N	756	54	141
3039	\N	769	54	188
3040	\N	703	55	6
3041	\N	715	55	6
3042	\N	763	55	152
3043	\N	748	55	141
3044	\N	764	55	141
3045	\N	759	55	188
3046	\N	747	55	152
3047	\N	728	55	117
3048	\N	769	55	188
3049	\N	744	55	182
3050	\N	779	55	189
3051	\N	775	55	190
3052	\N	723	55	190
3053	\N	780	55	177
3054	\N	770	55	182
3055	\N	758	55	177
3056	\N	781	55	165
3057	\N	768	55	189
3058	\N	778	55	165
3059	\N	762	55	117
3060	\N	782	55	177
3061	\N	756	55	141
3062	\N	773	55	141
3063	\N	755	55	190
3064	\N	742	55	152
3065	\N	747	55	190
3066	\N	744	56	152
3067	\N	715	56	6
3068	\N	763	56	152
3069	\N	728	56	191
3070	\N	768	56	141
3071	\N	764	56	117
3072	\N	779	56	191
3073	\N	762	56	117
3074	\N	747	56	190
3075	\N	770	56	182
3076	\N	759	56	188
3077	\N	748	56	190
3078	\N	742	56	182
3079	\N	769	56	188
3080	\N	783	56	177
3081	\N	784	56	177
3082	\N	785	56	165
3083	\N	703	56	6
3084	\N	758	56	141
3085	\N	786	56	165
3086	\N	772	56	188
3087	\N	754	56	117
3088	\N	750	56	117
3089	\N	787	56	191
3090	\N	755	56	190
3091	\N	788	56	165
3092	\N	773	56	141
3093	\N	763	57	152
3094	\N	703	57	6
3095	\N	762	57	117
3096	\N	759	57	98
3097	\N	764	57	117
3098	\N	768	57	141
3099	\N	789	57	141
3100	\N	779	57	191
3101	\N	770	57	6
3102	\N	728	57	191
3103	\N	787	57	195
3104	\N	758	57	192
3105	\N	790	57	195
3106	\N	748	57	190
3107	\N	715	57	98
3108	\N	747	57	190
3109	\N	784	57	194
3110	\N	769	57	193
3111	\N	791	57	193
3112	\N	742	57	192
3113	\N	744	57	152
3114	\N	786	57	194
3115	\N	792	57	193
3116	\N	754	57	117
3117	\N	793	57	193
3118	\N	794	57	192
3119	\N	786	57	196
3120	\N	784	57	196
3121	\N	788	57	191
3122	\N	762	58	6
3123	\N	763	58	117
3124	\N	795	58	117
3125	\N	758	58	192
3126	\N	744	58	152
3127	\N	770	58	6
3128	\N	789	58	141
3129	\N	748	58	190
3130	\N	747	58	190
3131	\N	796	58	152
3132	\N	715	58	98
3133	\N	769	58	193
3134	\N	768	58	191
3135	\N	787	58	195
3136	\N	759	58	98
3137	\N	772	58	193
3138	\N	797	58	197
3139	\N	750	58	141
3140	\N	728	58	191
3141	\N	794	58	192
3142	\N	790	58	195
3143	\N	786	58	197
3144	\N	798	58	192
3145	\N	799	58	197
3146	\N	798	58	195
3147	\N	793	58	197
3148	\N	800	58	141
3149	\N	795	59	117
3150	\N	758	59	192
3151	\N	789	59	141
3152	\N	763	59	152
3153	\N	796	59	117
3154	\N	800	59	141
3155	\N	801	59	195
3156	\N	762	59	6
3157	\N	794	59	192
3158	\N	782	59	190
3159	\N	769	59	193
3160	\N	802	59	152
3161	\N	770	59	6
3162	\N	728	59	191
3163	\N	747	59	190
3164	\N	797	59	198
3165	\N	768	59	191
3166	\N	759	59	98
3167	\N	772	59	193
3168	\N	798	59	195
3169	\N	744	59	198
3170	\N	715	59	98
3171	\N	759	60	199
3172	\N	715	60	199
3173	\N	747	60	190
3174	\N	782	60	190
3175	\N	763	60	152
3176	\N	789	60	141
3177	\N	803	60	195
3178	\N	801	60	195
3179	\N	797	60	198
3180	\N	758	60	192
3181	\N	744	60	198
3182	\N	768	60	191
3183	\N	798	60	191
3184	\N	794	60	192
3185	\N	762	60	6
3186	\N	770	60	6
3187	\N	802	60	152
3188	\N	800	60	141
3189	\N	796	60	117
3190	\N	795	60	117
3191	\N	804	60	195
3192	\N	805	60	152
3193	\N	716	60	6
3194	\N	744	60	6
3195	\N	787	60	198
3196	\N	806	60	190
3197	\N	763	61	6
3198	\N	770	61	6
3199	\N	795	61	117
3200	\N	798	61	191
3201	\N	789	61	48
3202	\N	703	61	48
3203	\N	759	61	117
3204	\N	768	61	191
3205	\N	787	61	198
3206	\N	715	61	141
3207	\N	794	61	152
3208	\N	797	61	198
3209	\N	804	61	195
3210	\N	807	61	141
3211	\N	796	61	202
3212	\N	803	61	195
3213	\N	747	61	202
3214	\N	754	61	182
3215	\N	808	61	200
3216	\N	782	61	201
3217	\N	809	61	152
3218	\N	806	61	182
3219	\N	810	61	201
3220	\N	811	61	200
3221	\N	793	61	200
3222	\N	758	61	182
3223	\N	779	61	200
3224	\N	798	62	191
3225	\N	795	62	117
3226	\N	809	62	152
3227	\N	763	62	6
3228	\N	768	62	191
3229	\N	759	62	117
3230	\N	770	62	6
3231	\N	803	62	195
3232	\N	797	62	198
3233	\N	812	62	198
3234	\N	804	62	195
3235	\N	758	62	152
3236	\N	747	62	202
3237	\N	813	62	201
3238	\N	782	62	201
3239	\N	715	62	141
3240	\N	789	62	48
3241	\N	796	62	202
3242	\N	703	62	48
3243	\N	814	62	141
3244	\N	806	62	182
3245	\N	815	62	182
3246	\N	787	62	200
3247	\N	783	62	200
3248	\N	754	62	182
3249	\N	816	62	200
3250	\N	811	62	202
3251	\N	808	62	152
3252	\N	759	63	117
3253	\N	798	63	191
3254	\N	795	63	117
3255	\N	768	63	191
3256	\N	763	63	6
3257	\N	806	63	182
3258	\N	762	63	204
3259	\N	815	63	182
3260	\N	816	63	195
3261	\N	812	63	198
3262	\N	817	63	195
3263	\N	789	63	48
3264	\N	814	63	141
3265	\N	782	63	205
3266	\N	818	63	205
3267	\N	808	63	141
3268	\N	770	63	6
3269	\N	796	63	203
3270	\N	809	63	203
3271	\N	703	63	48
3272	\N	805	63	204
3273	\N	807	63	198
3274	\N	754	63	200
3275	\N	783	63	200
3276	\N	813	63	204
3277	\N	762	64	204
3278	\N	763	64	6
3279	\N	798	64	191
3280	\N	770	64	6
3281	\N	795	64	48
3282	\N	768	64	191
3283	\N	797	64	198
3284	\N	812	64	198
3285	\N	759	64	117
3286	\N	805	64	204
3287	\N	815	64	117
3288	\N	817	64	195
3289	\N	819	64	182
3290	\N	820	64	141
3291	\N	821	64	205
3292	\N	818	64	203
3293	\N	822	64	205
3294	\N	823	64	203
3295	\N	816	64	195
3296	\N	789	64	48
3297	\N	814	64	141
3298	\N	807	64	182
3299	\N	796	64	204
3300	\N	789	65	48
3301	\N	824	65	117
3302	\N	759	65	117
3303	\N	763	65	6
3304	\N	820	65	141
3305	\N	807	65	198
3306	\N	762	65	6
3307	\N	817	65	195
3308	\N	825	65	195
3309	\N	815	65	198
3310	\N	797	65	182
3311	\N	819	65	182
3312	\N	822	65	205
3313	\N	821	65	205
3314	\N	805	65	204
3315	\N	814	65	204
3316	\N	826	65	203
3317	\N	798	65	191
3318	\N	795	65	48
3319	\N	770	65	141
3320	\N	806	65	203
3321	\N	816	65	191
3322	\N	827	65	203
3323	\N	828	65	203
3324	\N	795	66	48
3325	\N	789	66	48
3326	\N	798	66	6
3327	\N	770	66	141
3328	\N	829	66	182
3329	\N	816	66	191
3330	\N	807	66	198
3331	\N	826	66	182
3332	\N	830	66	195
3333	\N	815	66	198
3334	\N	759	66	117
3335	\N	762	66	6
3336	\N	831	66	195
3337	\N	805	66	204
3338	\N	814	66	204
3339	\N	825	66	191
3340	\N	824	66	117
3341	\N	820	66	141
3342	\N	832	66	206
3343	\N	763	66	117
3344	\N	828	66	206
3345	\N	833	66	206
3346	\N	789	67	48
3347	\N	795	67	48
3348	\N	798	67	6
3349	\N	816	67	191
3350	\N	770	67	141
3351	\N	805	67	207
3352	\N	807	67	198
3353	\N	820	67	141
3354	\N	830	67	195
3355	\N	831	67	195
3356	\N	834	67	152
3357	\N	824	67	152
3358	\N	815	67	198
3359	\N	759	67	117
3360	\N	829	67	182
3361	\N	835	67	206
3362	\N	826	67	182
3363	\N	762	67	6
3364	\N	836	67	206
3365	\N	819	67	207
3366	\N	763	67	117
3367	\N	825	67	191
3368	\N	837	67	117
3369	\N	831	67	191
3370	\N	825	67	195
3371	\N	838	67	206
3372	\N	798	68	6
3373	\N	795	68	48
3374	\N	820	68	48
3375	\N	762	68	6
3376	\N	831	68	191
3377	\N	770	68	141
3378	\N	815	68	198
3379	\N	830	68	195
3380	\N	825	68	195
3381	\N	838	68	198
3382	\N	807	68	152
3383	\N	839	68	182
3384	\N	837	68	117
3385	\N	763	68	117
3386	\N	824	68	207
3387	\N	840	68	141
3388	\N	816	68	191
3389	\N	826	68	182
3390	\N	834	68	152
3391	\N	805	68	207
3392	\N	835	68	182
3393	\N	759	68	117
3394	\N	812	68	141
3395	\N	841	68	195
3396	\N	830	68	152
3397	\N	842	68	195
3398	\N	798	69	6
3399	\N	795	69	48
3400	\N	762	69	6
3401	\N	816	69	191
3402	\N	763	69	117
3403	\N	831	69	191
3404	\N	807	69	152
3405	\N	820	69	48
3406	\N	837	69	117
3407	\N	830	69	152
3408	\N	815	69	198
3409	\N	838	69	198
3410	\N	843	69	182
3411	\N	840	69	141
3412	\N	842	69	195
3413	\N	805	69	207
3414	\N	824	69	207
3415	\N	841	69	195
3416	\N	826	69	182
3417	\N	844	69	141
3418	\N	820	70	48
3419	\N	795	70	48
3420	\N	831	70	191
3421	\N	798	70	6
3422	\N	843	70	6
3423	\N	824	70	207
3424	\N	807	70	152
3425	\N	762	70	1
3426	\N	840	70	208
3427	\N	825	70	195
3428	\N	841	70	191
3429	\N	845	70	117
3430	\N	815	70	208
3431	\N	846	70	195
3432	\N	839	70	1
3433	\N	847	70	141
3434	\N	794	70	141
3435	\N	805	70	207
3436	\N	816	70	152
3437	\N	830	70	117
3438	\N	846	70	191
3439	\N	841	70	195
3440	\N	820	71	48
3441	\N	843	71	6
3442	\N	845	71	117
3443	\N	795	71	48
3444	\N	830	71	117
3445	\N	815	71	208
3446	\N	841	71	209
3447	\N	838	71	152
3448	\N	839	71	1
3449	\N	798	71	6
3450	\N	848	71	141
3451	\N	825	71	209
3452	\N	846	71	191
3453	\N	762	71	1
3454	\N	847	71	141
3455	\N	805	71	207
3456	\N	824	71	207
3457	\N	840	71	208
3458	\N	816	71	152
3459	\N	831	71	191
3460	\N	807	71	208
3461	\N	847	71	48
3462	\N	849	71	141
3463	\N	850	71	207
3464	\N	795	72	48
3465	\N	831	72	191
3466	\N	820	72	48
3467	\N	845	72	117
3468	\N	815	72	191
3469	\N	843	72	6
3470	\N	816	72	117
3471	\N	830	72	6
3472	\N	851	72	209
3473	\N	840	72	64
3474	\N	762	72	1
3475	\N	839	72	1
3476	\N	838	72	210
3477	\N	847	72	141
3478	\N	798	72	64
3479	\N	852	72	207
3480	\N	841	72	209
3481	\N	848	72	141
3482	\N	763	72	210
3483	\N	853	72	207
3484	\N	794	72	1
3485	\N	843	73	6
3486	\N	830	73	6
3487	\N	795	73	48
3488	\N	847	73	48
3489	\N	824	73	207
3490	\N	820	73	1
3491	\N	838	73	210
3492	\N	851	73	209
3493	\N	763	73	210
3494	\N	854	73	1
3495	\N	852	73	207
3496	\N	840	73	64
3497	\N	846	73	141
3498	\N	816	73	117
3499	\N	845	73	117
3500	\N	848	73	141
3501	\N	807	73	64
3502	\N	815	73	191
3503	\N	831	73	191
3504	\N	841	73	209
3505	\N	798	73	64
3506	\N	855	73	141
3507	\N	831	74	191
3508	\N	815	74	191
3509	\N	763	74	64
3510	\N	830	74	6
3511	\N	795	74	48
3512	\N	840	74	64
3513	\N	847	74	48
3514	\N	820	74	1
3515	\N	841	74	210
3516	\N	846	74	141
3517	\N	851	74	209
3518	\N	856	74	141
3519	\N	824	74	207
3520	\N	855	74	209
3521	\N	807	74	207
3522	\N	854	74	1
3523	\N	845	74	117
3524	\N	838	74	210
3525	\N	843	74	6
3526	\N	857	74	117
3527	\N	816	74	209
3528	\N	858	74	209
3529	\N	831	75	191
3530	\N	815	75	191
3531	\N	830	75	6
3532	\N	843	75	6
3533	\N	847	75	48
3534	\N	845	75	117
3535	\N	795	75	48
3536	\N	857	75	117
3537	\N	763	75	64
3538	\N	840	75	64
3539	\N	854	75	182
3540	\N	824	75	207
3541	\N	816	75	211
3542	\N	851	75	211
3543	\N	846	75	141
3544	\N	807	75	207
3545	\N	838	75	210
3546	\N	841	75	210
3547	\N	820	75	182
3548	\N	856	75	141
3549	\N	859	75	6
\.


--
-- Name: ergast_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ergast_status_id_seq', 1, false);


--
-- Name: formula_one_baseteam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_one_baseteam_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.formula_one_circuit_id_seq', 1, false);


--
-- Name: formula_one_driver_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_one_driver_id_seq', 1, false);


--
-- Name: formula_one_penalty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_one_penalty_id_seq', 1, false);


--
-- Name: formula_one_pointsystem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_one_pointsystem_id_seq', 23, true);


--
-- Name: formula_one_round_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_one_round_id_seq', 1, false);


--
-- Name: formula_one_season_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_one_season_id_seq', 1, false);


--
-- Name: formula_one_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_one_session_id_seq', 1, false);


--
-- Name: formula_one_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_one_team_id_seq', 1, false);


--
-- Name: formula_one_teamdriver_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formula_one_teamdriver_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

