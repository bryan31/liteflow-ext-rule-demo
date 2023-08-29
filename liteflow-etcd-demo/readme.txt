客户端GUI推荐用etcdkeeper

1.把配置中的信息替换成你自己的链接信息
2.节点中存的规则文件为：

2.zk中存以下信息：

建立这样的目录结构
liteflow
---chain
---script

chain目录下存：
key: chain1
value: THEN(a,b,c,s1);

script目录下存：
key: s1:script:普通组件
value:

import cn.hutool.core.date.DateUtil

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
defaultContext.setData("s1",a*b)

3.直接运行启动类即可，会自动执行LiteFLowCommand类中的方法。
4.可自己增加组件，替换规则。
5.执行类中每2秒运行一次，为什么要循环，是为了方便你测试热刷新。你直接在etcd里改规则即可。会实时刷新规则，执行结果会变。