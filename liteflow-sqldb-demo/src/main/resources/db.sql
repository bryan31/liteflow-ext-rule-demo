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

INSERT INTO chain (id, application_name, chain_name, chain_desc, el_data, route, namespace, create_time, enable) VALUES (1, 'demo', 'chain1', '测试流程', 'THEN(a,b,c,s1,s2,s3,s4);', null, null, '2022-09-19 19:31:00', 1);
INSERT INTO chain (id, application_name, chain_name, chain_desc, el_data, route, namespace, create_time, enable) VALUES (3, 'demo', 'r_chain1', '策略路由1', 'THEN(b,a,s1);', 'r1', 'ns', '2024-05-27 14:03:01', 1);
INSERT INTO chain (id, application_name, chain_name, chain_desc, el_data, route, namespace, create_time, enable) VALUES (4, 'demo', 'r_chain2', '策略路由2', 'THEN(a,b,s2);', 'OR(r1,r2)', 'ns', '2024-05-27 14:03:44', 1);

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
INSERT INTO script (id, application_name, script_id, script_name, script_data, script_type, language, enable) VALUES (3, 'demo', 's3', '脚本s3', 'setData(defaultContext, "s3", 5*6);', 'script', 'aviator', 1);
INSERT INTO script (id, application_name, script_id, script_name, script_data, script_type, language, enable) VALUES (4, 'demo', 's4', '脚本4', 'import cn.hutool.core.collection.ListUtil;
import com.example.liteflow.mysql.vo.Person;
import com.yomahub.liteflow.core.NodeComponent;
import com.yomahub.liteflow.slot.DefaultContext;

import java.util.List;

public class S1Cmp extends NodeComponent {
    @Override
    public void process() throws Exception {
        DefaultContext ctx = this.getFirstContextBean();
        List<Person> personList = ListUtil.toList(
                new Person("jack", 15000),
                new Person("tom", 23500),
                new Person("peter", 18500)
        );

        int totalSalary = personList.stream().mapToInt(Person::getSalary).sum();

        System.out.println(totalSalary);
        ctx.setData("salary", totalSalary);
    }

    @Override
    public void onSuccess() throws Exception {
        System.out.println("succeed");
    }

    @Override
    public boolean isAccess() {
        System.out.println("isAccess");
        return true;
    }
}', 'script', 'java', 1);
