package pl.workspace.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.workspace.model.User;
import pl.workspace.model.WorkOrder;
import pl.workspace.repository.UserRepository;
import pl.workspace.repository.WorkOrderRepository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/stat")
public class StatController {
    @Autowired
    WorkOrderRepository workOrderRepository;
    @Autowired
    UserRepository userRepository;

    @GetMapping("")
    public String options(){
        return "stat/statOptions";
    }

    @GetMapping("/findWorkOrders")
    public String findWorkOrdersForm(){
        return "stat/orderSearch";
    }

    @PostMapping("/findWorkOrders")
    public String findWorkOrders(Model model, @Param("choice") String choice, @Param("client") String client, @Param("order") String order, @Param("start") String start, @Param("end") String end){
        if (choice.equals("client")){
            List<WorkOrder> orders= workOrderRepository.findByOrderClientLike(client);
            model.addAttribute("orders",orders);
            return "order/allOrders";
        }
        if(choice.equals("order")){
            List<WorkOrder> orders= workOrderRepository.findByOrderNameLike(order);
            model.addAttribute("orders",orders);
            return "order/allOrders";
        }
        if(choice.equals("dates")){
            System.out.println(start);
            System.out.println(end);
            List<WorkOrder> orders= workOrderRepository.chooseWorkOrderBetweenDates(LocalDateTime.now().minusDays(2),LocalDateTime.now());
            model.addAttribute("orders",orders);
            return "order/allOrders";
        }
        return "redirect:/stat/findWorkOrders";
    }

    @GetMapping("/workerStats")
    public String workerChooser(Model model){

        return "stat/workerChooser";
    }

    @GetMapping("/workerStats/{id}")
    public String workerStats(@PathVariable("id") long id, @Param("start") String start, @Param("stop") String stop, @Param("dates") boolean dates){
        return "stat/workerChoooser";
    }
}
