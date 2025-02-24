package com.example.liteflow.mysql.cmp;

import cn.hutool.core.collection.ListUtil;
import com.example.liteflow.mysql.vo.Person;
import com.yomahub.liteflow.core.NodeComponent;
import com.yomahub.liteflow.slot.DefaultContext;

import java.util.List;

//这个类是数据库中的脚本，只为了复制用，所以不注册
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
}
