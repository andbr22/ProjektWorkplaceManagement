package pl.workspace.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.workspace.repository.WorkOrderRepository;
import pl.workspace.repository.WorkRepository;

@Controller
@RequestMapping("/work")
public class WorkController {
    @Autowired
    WorkRepository workRepository;
    @Autowired
    WorkOrderRepository workOrderRepository;

    @GetMapping("/history")
    public String workHistory(){

        return "";
    }

    @GetMapping("")
    public String listOfActiveTasks(){

        return "";
    }
}
