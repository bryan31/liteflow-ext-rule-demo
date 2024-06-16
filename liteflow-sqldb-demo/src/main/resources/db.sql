create table chain
(
    id               bigint auto_increment
        primary key,
    application_name varchar(32) null,
    chain_name       varchar(32) null,
    chain_desc       varchar(64) null,
    el_data          text        null,
    route            text        null,
    namespace        varchar(32),
    create_time      datetime    null,
    enable           tinyint(1)  1
);


create table script
(
    id               bigint auto_increment
        primary key,
    application_name varchar(32) null,
    script_id        varchar(32) null,
    script_name      varchar(64) null,
    script_data      text        null,
    script_type      varchar(16) null,
    language         varchar(32) null,
    enable           tinyint(1)  1
);

INSERT INTO chain (id, application_name, chain_name, chain_desc, el_data, create_time, enable) VALUES (1, 'demo', 'chain1', '测试流程', 'THEN(a, b, c, s1);', '2022-09-19 19:31:00', 1);

INSERT INTO script (id, application_name, script_id, script_name, script_data, script_type, language, enable) VALUES (1, 'demo', 's1', '脚本s1', 'import cn.hutool.core.date.DateUtil

def date = DateUtil.parse("2022-10-17 13:31:43")
println(date)
defaultContext.setData("demoDate", date)

class Student {
   int studentID
   String studentName
}

Student student = new Student()
student.studentID = 100301
student.studentName = "张三"
defaultContext.setData("student",student)

def a=3
def b=2
defaultContext.setData("s1",a*b)', 'script', 'groovy', 1);
INSERT INTO script (id, application_name, script_id, script_name, script_data, script_type, language, enable) VALUES (2, 'demo', 's2', '脚本s2', 'defaultContext.setData("s2","hello")', 'script', 'groovy', 1);

