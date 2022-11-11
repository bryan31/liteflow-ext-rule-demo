package com.example.liteflow.zookeeper;

import com.yomahub.liteflow.core.FlowExecutor;
import com.yomahub.liteflow.flow.LiteflowResponse;
import com.yomahub.liteflow.slot.DefaultContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
public class LiteFlowCommand implements CommandLineRunner {

    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @Resource
    private FlowExecutor flowExecutor;

    @Override
    public void run(String... args) throws Exception {
        while (true){
            LiteflowResponse response = flowExecutor.execute2Resp("chain1", "arg");
            if (response.isSuccess()){
                log.info("执行成功");
            }else{
                log.info("执行失败");
            }
            DefaultContext context = response.getFirstContextBean();
            Integer result = context.getData("s1");
            log.info(result.toString());
            Thread.sleep(2000L);
        }
    }
}
