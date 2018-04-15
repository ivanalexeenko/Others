package com.itransition.config;

import com.itransition.service.TestBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SpringConfig {
    @Bean
    public TestBean getTestBean() {
        return new TestBean("and You!");
    }
}
