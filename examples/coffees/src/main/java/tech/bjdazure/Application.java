package tech.bjdazure;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.Banner;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = "tech.bjdazure")
public class Application {

	private static final Class<Application> applicationClass = Application.class;

	public static void main(String[] args) {
		
		SpringApplication application = new SpringApplication(applicationClass);
		application.setBannerMode(Banner.Mode.OFF);
		SpringApplication.run(applicationClass, args);
	}
}