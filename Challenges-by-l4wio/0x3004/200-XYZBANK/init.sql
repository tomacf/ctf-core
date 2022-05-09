create database cyber_web200_1;
create user 'cyber_web200_user'@'localhost' identified by 'cyber_web200_password';
grant all privileges on cyber_web200_1.* to 'cyber_web200_user'@'localhost';
create table users (username VARCHAR(20), password VARCHAR(20), pin VARCHAR(20), balance int not null default(1));
INSERT INTO users VALUES ('VICICO', 'Hydr0nd0ming', '0387', 2323);
INSERT INTO users VALUES ('john-kw', 'europ3anELEKTRON', '0203', 9853);
INSERT INTO users VALUES ('shifter', 'nukle@rVAL', '8238', 3789);
INSERT INTO users VALUES ('admin', 'public_senat_mission', '9354', 09982);
