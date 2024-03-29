DELETE
FROM user_roles;
DELETE
FROM vote;
DELETE
FROM dish;
DELETE
FROM restaurant;
DELETE
FROM users;
ALTER SEQUENCE global_seq RESTART WITH 100000;

INSERT INTO users(name, email, password)
VALUES ('Admin', 'admin@gov.ru', '{noop}superAdmin'), --100000
       ('Ivan', 'ivan@mail.ru', '{noop}ivanpass'),    --100001
       ('Maria', 'maria@mail.ru', '{noop}mariapass'), --100002
       ('Vasily', 'vasily@mail.ru', '{noop}vasilypass'); --100003

INSERT INTO restaurant(name)
VALUES ('KFC'),       --100004
       ('McDonalds'), --100005
       ('Burger King'); --100006

INSERT INTO dish(name, price, restaurant_id)
VALUES ('Бёдра', 7, 100004),
       ('Крылья', 5, 100004),
       ('Пепси', 3, 100004),

       ('Роял', 8, 100005),
       ('Чизбургер', 4, 100005),
       ('БигМак', 5, 100005),
       ('Кола', 3, 100005),

       ('Воппер', 8, 100006),
       ('Пиво', 7, 100006),
       ('Меринда', 4, 100006);

INSERT INTO dish(name, price, restaurant_id, input_date)
VALUES ('Блюдо на другую дату BGK', 10, 100006, '2022-01-01'),
       ('Блюдо на другую дату KFC', 12, 100004, '2022-01-01');


INSERT INTO vote(user_id, restaurant_id, date)
VALUES (100000, 100005, '2022-01-01'),
       (100001, 100004, '2022-01-01'),
       (100002, 100006, '2022-01-01'),
       (100003, 100005, '2022-01-01');

INSERT INTO vote(user_id, restaurant_id)
VALUES (100001, 100005),
       (100002, 100004),
       (100003, 100006);


INSERT INTO user_roles (user_id, role)
VALUES (100000, 'ADMIN'),
       (100000, 'USER'),
       (100001, 'USER'),
       (100002, 'USER'),
       (100003, 'USER');