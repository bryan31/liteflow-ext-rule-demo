package com.example.liteflow.mysql;

import com.yomahub.liteflow.core.FlowExecutor;
import com.yomahub.liteflow.flow.LiteflowResponse;
import com.yomahub.liteflow.slot.DefaultContext;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

//策略路由

//@Component
public class LiteFlowCommand2 implements CommandLineRunner {

    @Resource
    private FlowExecutor flowExecutor;

    @Override
    public void run(String... args) throws Exception {
        while(true){
            flowExecutor.executeRouteChain("ns", 15, DefaultContext.class);
            Thread.sleep(1000);
        }
    }
}
