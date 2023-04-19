package ru.serg.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/api")
public class FirstAppController {

    @ResponseBody
    @GetMapping("/data")
    public String getDataFromSecondAppAndReturn() {
        RestTemplate restTemplate = new RestTemplate();
        String url = "http://localhost:8081/api/data";
        return restTemplate.getForObject(url, String.class);
    }
}
