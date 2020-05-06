package com.yzs.manage;

import com.yzs.common.utils.IdWorker;
import com.yzs.manage.config.MyAuthenticationSuccessHandler;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@ComponentScan({"com.yzs.manage","com.yzs.common"})
@MapperScan("com.yzs.manage.mapper")
public class ManageApplication {

    public static void main(String[] args) {
        SpringApplication.run(ManageApplication.class);
    }

    @Bean
    public IdWorker idWorker(){
        return new IdWorker();
    }
    @Bean
    public BCryptPasswordEncoder encoder(){
        return new BCryptPasswordEncoder();
    }
    @Bean
    public AuthenticationSuccessHandler handler(){
        return new MyAuthenticationSuccessHandler("/index.jsp");
    }
}
