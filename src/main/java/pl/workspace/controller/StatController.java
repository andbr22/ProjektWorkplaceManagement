package pl.workspace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/stat")
public class StatController {

    @GetMapping("")
    public String options(){
        return "stat/statOptions";
    }

    @GetMapping("/findWorkOrders")
    public String findWorkOrdersForm(){
        return "stat/";
    }

    @PostMapping("/findWorkOrders")
    protected String findWorkOrders(){
        return "stat/orderList";
    }
}
