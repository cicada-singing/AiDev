package com.aidev;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 *
 * @author aidev
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class AiDevApplication {
    public static void main(String[] args) {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(AiDevApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ 爱开发应用启动成功 ლ(´ڡ`ლ)ﾞ\n" +
                "   _   _    ___           \n" +
                "  /_\\ (_)  /   \\_____   __\n" +
                " //_\\\\| | / /\\ / _ \\ \\ / /\n" +
                "/ ___ \\ |/ /_// ___/\\ V / \n" +
                "\\_/ \\_/_/____/ \\___| \\_/  \n");
    }
}