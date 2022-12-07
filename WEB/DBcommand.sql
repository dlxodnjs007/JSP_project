create table home_want_away (
    id_no int(10) not null auto_increment primary key,
    home_id varchar(20),
    juso varchar(20),
    game_date varchar(30),
    home_people varchar(20),
    home_age varchar(20),
    home_color varchar(20),
    away_people varchar(20),
    away_level varchar(20),
    away_age varchar(20),
    shower varchar(20),
    parking varchar(20),
    warning varchar(500),
    FOREIGN KEY (home_id) REFERENCES user(user_id)
);

create table apply_away_info(
    apply_id int not null auto_increment primary key,
    game_id_no int,
    away_id varchar(20),
    away_people varchar(20),
    away_level varchar(20),
    away_age varchar(20),
    accept_status int default 0,
    foreign key (game_id_no) REFERENCES home_want_away(id_no),
    foreign key (away_id) REFERENCES user(user_id)
);

