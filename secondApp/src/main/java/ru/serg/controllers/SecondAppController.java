package ru.serg.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/api")
public class SecondAppController {

    @ResponseBody
    @GetMapping("/data")
    public String getDataFromSecondAppAndReturn() throws IOException {
        String command = "curl -sS http://mtls-nginx.mesh-external.svc.cluster.local";
        Process process = Runtime.getRuntime().exec(command);
        InputStream inputStream = process.getInputStream();
        return new BufferedReader(new InputStreamReader(inputStream))
                .lines().collect(Collectors.joining("\n"));
    }
}
