package com.example.liteflow.redis;

import com.yomahub.liteflow.core.FlowExecutor;
import com.yomahub.liteflow.flow.LiteflowResponse;
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
            Thread.sleep(2000L);
        }
    }
}
