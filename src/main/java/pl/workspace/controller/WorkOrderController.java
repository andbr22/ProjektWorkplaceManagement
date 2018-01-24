package pl.workspace.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.workspace.model.WorkComment;
import pl.workspace.model.WorkOrder;
import pl.workspace.repository.WorkOrderRepository;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/order")
public class WorkOrderController {
    @Autowired
    WorkOrderRepository workOrderRepository;

    @GetMapping("/create")
    public String workOrderForm(Model model){
        WorkOrder workOrder = new WorkOrder();
        model.addAttribute("workOrder", workOrder);
        return "order/newForm";
    }

    @PostMapping("/create")
    public String workOrderCreate(Model model,@Valid WorkOrder workOrder, BindingResult bindingResult, @Param("ready") boolean ready){
        if(bindingResult.hasErrors()){
            return "order/newForm";
        }
        workOrder.setCreated(LocalDateTime.now());
        if(ready){
            workOrder.setReadyToWork(LocalDateTime.now());
        }
        workOrderRepository.save(workOrder);
        return "redirect:/order";
    }

    @GetMapping("")
    public String listWorkOrders(Model model){
        List<WorkOrder> orders = workOrderRepository.findAll();
        model.addAttribute("orders",orders);
        return "order/allOrders";
    }

    @GetMapping("/edit/{id}")
    public String editOrderForm(Model model, @PathVariable("id") long id){
        WorkOrder workOrder = workOrderRepository.findOne(id);
        if(workOrder.getReadyToRealisation()!= null && workOrder.getReadyToRealisation().isBefore(LocalDateTime.now())){
            return "redirect:/order";
        }
        model.addAttribute("workOrder", workOrder);
        return "order/editForm";
    }

    @PostMapping("/edit/{id}")
    public String editOrder(@PathVariable("id") long id, @Valid WorkOrder workOrder, BindingResult bindingResult, @Param("workReady") boolean workReady){
        if(bindingResult.hasErrors()){
            return "order/editForm";
        }
        WorkOrder baseOrder = workOrderRepository.findOne(id);
        workOrder.setCreated(baseOrder.getCreated());
        workOrder.setReadyToRealisation(baseOrder.getReadyToRealisation());
        workOrder.setReadyToWork(baseOrder.getReadyToWork());
        if(workReady && workOrder.getReadyToWork() == null){
            workOrder.setReadyToWork(LocalDateTime.now());
        }
        workOrderRepository.save(workOrder);
        return "redirect:/order";
    }

    @GetMapping("/{id}/ReadyToRealisation")
    public  String readyToRealisationConfirmation(@PathVariable("id") long id){
        WorkOrder workOrder = workOrderRepository.findOne(id);
        return"order/orderRealisationConfirmation";
    }

    @PostMapping("/{id}/ReadyToRealisation")
    public String readyToRealisation(@PathVariable("id") long id){
        WorkOrder workOrder = workOrderRepository.findOne(id);
        if(!workOrder.isFinished()){
            workOrder.setFinished(true);
        }
        if(workOrder.getReadyToWork() == null){
            workOrder.setReadyToWork(LocalDateTime.now());
        }
        workOrder.setReadyToRealisation(LocalDateTime.now());
        workOrderRepository.save(workOrder);
        return "redirect:/order";
    }

    @GetMapping("/clone/{id}")
    public String cloneOrderForm(Model model, @PathVariable("id") long id){
        WorkOrder workOrder = new WorkOrder();
        WorkOrder workOrderToClone = workOrderRepository.findOne(id);

        workOrder.setOrderName(workOrderToClone.getOrderName());
        workOrder.setOrderDescription(workOrderToClone.getOrderDescription());
        workOrder.setOrderClient(workOrderToClone.getOrderClient());

        model.addAttribute("workOrder",workOrder);

        return "order/newForm";
    }

}
