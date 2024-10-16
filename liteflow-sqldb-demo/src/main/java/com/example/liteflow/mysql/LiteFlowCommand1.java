package com.example.liteflow.mysql;

import com.yomahub.liteflow.core.FlowExecutor;
import com.yomahub.liteflow.flow.LiteflowResponse;
import com.yomahub.liteflow.slot.DefaultContext;
import com.yomahub.liteflow.util.JsonUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
public class LiteFlowCommand1 implements CommandLineRunner {

    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @Resource
    private FlowExecutor flowExecutor;

    @Override
    public void run(String... args) throws Exception {
        while(true){
            LiteflowResponse response = flowExecutor.execute2Resp("chain1", "arg");
            DefaultContext context = response.getFirstContextBean();
            System.out.println(JsonUtil.toJsonString(context.getData("student")));
            System.out.println(context.getData("salary").toString());
            if (response.isSuccess()){
                log.info("执行成功");
            }else{
                log.info("执行失败");
            }
            Thread.sleep(1000);
        }
    }
}
