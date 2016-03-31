CREATE TABLE ARTIST (
username CHAR(10),
email CHAR(20) NOT NULL,
user_password CHAR(10) NOT NULL,
address CHAR(100),
first_name CHAR(30),
middle_name CHAR(30),
last_name CHAR(30),
experience INTEGER,
specialization CHAR(20),
UNIQUE (email),
PRIMARY KEY (username)
);
CREATE TABLE BAND (
band_id CHAR(10),
band_name CHAR(30),
since DATE,
specialization CHAR(50),
PRIMARY KEY (band_id)
);
CREATE TABLE ENTHUSIAST (
username CHAR(10),
email CHAR(20) NOT NULL,
enth_password CHAR(10) NOT NULL,
address CHAR(100),
first_name CHAR(30),
middle_name CHAR(30),
last_name CHAR(30),
interests CHAR(100),
UNIQUE (email),
PRIMARY KEY (username)
);
CREATE TABLE INSTR_TRADES (
instr_id INTEGER,
condition CHAR(10),
instr_type CHAR(100),
buyer_name CHAR(10),
seller_name CHAR(10),
cost REAL,
status BOOLEAN,
PRIMARY KEY(instr_id),
FOREIGN KEY (buyer_name) REFERENCES ARTIST(username),
FOREIGN KEY (seller_name) REFERENCES ARTIST(username)
);
CREATE TABLE EVENT (
event_id INTEGER,
start_time TIMESTAMP,
end_time TIMESTAMP,
address CHAR(100),
event_type CHAR(20),
UNIQUE (start_time, end_time, address),
PRIMARY KEY (event_id)
);
CREATE TABLE HIRES (
enth_user CHAR(10),
artst_user CHAR(10),
event_id INTEGER,
status BOOLEAN,
rating INTEGER,
CHECK(rating >= 1 AND rating <=10),
PRIMARY KEY (enth_user, artst_user, event_id),
FOREIGN KEY (enth_user) REFERENCES ENTHUSIAST(username),
FOREIGN KEY (artst_user) REFERENCES ARTIST(username),
FOREIGN KEY (event_id) REFERENCES EVENT(event_id)
);
CREATE TABLE TUTORS (
enth_user CHAR(10),
artst_user CHAR(10),
salary REAL,
status BOOLEAN,
rating INTEGER,
CHECK(rating >= 1 AND rating <=10),
PRIMARY KEY (enth_user, artst_user),
FOREIGN KEY (enth_user) REFERENCES ENTHUSIAST(username),
FOREIGN KEY (artst_user) REFERENCES ARTIST(username)
);
CREATE TABLE BAND_MEMBERS (
artst_user CHAR(10),
band_id CHAR(10),
status BOOLEAN,
PRIMARY KEY (artst_user, band_id),
FOREIGN KEY (artst_user) REFERENCES ARTIST(username),
FOREIGN KEY (band_id) REFERENCES BAND(band_id)
);
CREATE TABLE ARTIST_PERFORMANCE (
artst_user CHAR(10),
event_id INTEGER,
PRIMARY KEY (artst_user, event_id),
FOREIGN KEY (artst_user) REFERENCES ARTIST(username),
FOREIGN KEY (event_id) REFERENCES EVENT(event_id)
);
CREATE TABLE BAND_PERFORMANCE (
band_id CHAR(10),
event_id INTEGER,
PRIMARY KEY (band_id, event_id),
FOREIGN KEY (band_id) REFERENCES BAND(band_id),
FOREIGN KEY (event_id) REFERENCES EVENT(event_id)
);