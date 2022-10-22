create table chain
(
    id          bigint auto_increment
        primary key,
    chain_name  varchar(32) null,
    chain_desc  varchar(64) null,
    el_data     text        null,
    create_time datetime    null
);

INSERT INTO chain (id, chain_name, chain_desc, el_data, create_time) VALUES (1, 'chain1', '测试流程', 'THEN(a, b, c);', '2022-09-19 19:31:00');
