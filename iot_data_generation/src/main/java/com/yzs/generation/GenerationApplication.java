package com.yzs.generation;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@ComponentScan({"com.yzs.generation","com.yzs.common"})
@MapperScan("com.yzs.generation.mapper")
public class GenerationApplication {
    public static void main(String[] args) {
        SpringApplication.run(GenerationApplication.class);

    }
}
