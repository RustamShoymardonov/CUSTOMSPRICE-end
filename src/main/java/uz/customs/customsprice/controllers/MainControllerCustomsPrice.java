package uz.customs.customsprice.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainControllerCustomsPrice {

//    @GetMapping("/")
//    public ModelAndView index() {
//        ModelAndView model = new ModelAndView("index");
//        return model;
//    }

    @GetMapping(value = "/")
    public String home() {

        return "index";
    }
}