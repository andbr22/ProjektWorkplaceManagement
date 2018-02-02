package pl.workspace.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.workspace.model.User;
import pl.workspace.model.Work;
import pl.workspace.model.WorkComment;
import pl.workspace.model.WorkOrder;
import pl.workspace.repository.UserRepository;
import pl.workspace.repository.WorkCommentRepository;
import pl.workspace.repository.WorkOrderRepository;
import pl.workspace.repository.WorkRepository;
import pl.workspace.security.UserPrincipal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/work")
public class WorkController {
    @Autowired
    private WorkRepository workRepository;
    @Autowired
    private WorkOrderRepository workOrderRepository;
    @Autowired
    private WorkCommentRepository workCommentRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PasswordEncoder encoder;

    @GetMapping("/add/{id}")
    public String addNewWorkForm(Model model, @PathVariable("id") long orderId, @AuthenticationPrincipal UserPrincipal principal){
        User user = userRepository.findOne(principal.getId());
        if(user == null){
            return "redirect:/login";
        }
        WorkOrder workOrder = workOrderRepository.findOne(orderId);
        if(workOrder==null){
            return "redirect:/";
        }
        Work work = new Work();
        WorkComment comment = new WorkComment();
        work.setComment(comment);
        model.addAttribute("work",work);
        return "work/addWork";
    }

    @PostMapping("/add/{orderId}")
    public String addNewWork(Model model, @PathVariable("orderId") long orderId, @AuthenticationPrincipal UserPrincipal principal, @Valid Work work, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "work/addWork";
        }
        User user = userRepository.findOne(principal.getId());
        if(user == null){
            return "redirect:/login";
        }
        WorkOrder workOrder = workOrderRepository.findOne(orderId);
        if(workOrder==null){
            return "redirect:/";
        }
        if(work.getComment().getText().isEmpty()){
            work.setComment(null);
        }else{
            workCommentRepository.save(work.getComment());
        }
        work.setWorker(user);
        work.setWorkOrder(workOrder);
        work.setAdded(LocalDateTime.now());
        workRepository.save(work);
        return "redirect:/work/viewOrder/"+workOrder.getId();
    }

    @GetMapping("/viewOrder/{id}")
    public String orderWorkOverview(@PathVariable("id") long orderId, Model model){
        WorkOrder order = workOrderRepository.findOne(orderId);
        List<Work> works = workRepository.findAllByWorkOrderId(orderId);
        model.addAttribute("order",order);
        model.addAttribute("works",works);

        return "work/viewByOrders";
    }


//    @GetMapping("/history")
//    public String workHistory(){
//
//        return "";
//    }

    @GetMapping("")
    public String listOfActiveTasks(Model model){
        List<WorkOrder> activeOrders = workOrderRepository.findAllByFinishedFalseAndStoppedFalse();
        model.addAttribute("orders", activeOrders);
        model.addAttribute("now", LocalDateTime.now());
        return "work/allActive";
    }


    @GetMapping("/workerPassword")
    public String workerChangePassForm(Model model){
        return "user/workerPassword";
    }

    @PostMapping("/workerPassword")
    public String workerChangePass(@AuthenticationPrincipal UserPrincipal principal, Model model, @Param("oldPass") String oldPass, @Param("newPass") String newPass, @Param("repeatPass") String repeatPass){
        User worker = userRepository.findOne(principal.getId());
        if(!encoder.matches(oldPass,worker.getPassword())){
            model.addAttribute("message","Old password doesn't match");
            return "user/workerPassword";
        }
        if (!newPass.equals(repeatPass)){
            model.addAttribute("message","New password and Repeat new password don't match");
            return "user/workerPassword";
        }
        worker.setPassword(encoder.encode(newPass));
        userRepository.save(worker);
        return "redirect:/work";
    }
}
