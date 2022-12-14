create table user(
    user_id varchar(20) not null primary key,
    password varchar(20),
    name varchar(20),
    email varchar(50),
    height varchar(20),
    elite_or_not varchar(12),
);

create table home_want_away (
    id_no int not null auto_increment primary key,
    home_id varchar(20),
    h_team_name varchar(20),
    juso varchar(20),
    game_date varchar(30),
    home_people varchar(20),
    home_age varchar(20),
    home_uniform varchar(20),
    away_people varchar(20),
    away_level varchar(20),
    away_age varchar(20),
    shower varchar(20),
    parking varchar(20),
    warning varchar(500),
    FOREIGN KEY (home_id) REFERENCES user(user_id) on delete cascade
);

create table apply_away_info(
    apply_id int not null auto_increment primary key,
    game_id_no int,
    away_id varchar(20),
    a_team_name varchar(20),
    away_people varchar(20),
    away_level varchar(20),
    away_age varchar(20),
    accept_status int default 0,
    foreign key (game_id_no) REFERENCES home_want_away(id_no) on delete cascade,
    foreign key (away_id) REFERENCES user(user_id) on delete cascade
);

create table pickup (
    id_no int not null auto_increment primary key,
    home_id varchar(20),
    juso varchar(20),
    date varchar(30),
    people varchar(20),
    level varchar(20),
    age varchar(20),
    color varchar(20),
    shower varchar(20),
    parking varchar(20),
    warning varchar(500),
    FOREIGN KEY (home_id) REFERENCES user(user_id) on delete cascade
);

create table apply_pickup_info(
    apply_id int not null auto_increment primary key,
    game_id_no int,
    guest_id varchar(20),
    name varchar(20),
    height varchar(20),
    position varchar(20),
    age varchar(20),
    accept_status int default 0,
    foreign key (game_id_no) REFERENCES pickup(id_no) on delete cascade,
    foreign key (guest_id) REFERENCES user(user_id) on delete cascade
);

외래키는 고유키나 기본키만 연결할 수 있다.


