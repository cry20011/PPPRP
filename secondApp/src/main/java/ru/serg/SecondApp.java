package ru.serg;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.PropertySource;

import java.util.Collections;

@SpringBootApplication
public class SecondApp {

	public static void main(String[] args) {
		SpringApplication app = new SpringApplication(SecondApp.class);
		app.setDefaultProperties(Collections
				.singletonMap("server.port", "8081"));
		app.run(args);
	}

}
