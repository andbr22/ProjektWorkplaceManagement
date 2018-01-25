package pl.workspace.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.workspace.model.User;
import pl.workspace.repository.UserRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder encoder;

    @GetMapping("/create")
    public String createUserForm(Model model){
        User user = new User();
        model.addAttribute("user",user);
        return "user/addForm";
    }

    @PostMapping("/create")
    public String createUser(@Valid User user, BindingResult bindingResult){
        User userNameExist = userRepository.findByUserName(user.getUserName());
        if(bindingResult.hasErrors()||userNameExist != null){
            return "user/addForm";
        }
        user.setPassword(encoder.encode(user.getPassword()));
        userRepository.save(user);
        return "redirect:/user/all";
    }

    @GetMapping("/all")
    public String viewAllUsers(Model model){
        List<User> users = userRepository.findAll();
        model.addAttribute("users",users);
        return"user/allUsers";
    }

    @GetMapping("/edit/{id}")
    public String editUserForm(Model model, @PathVariable("id") long id){
        User user = userRepository.findOne(id);
        model.addAttribute("user",user);
        return "user/editForm";
    }

    @PostMapping("/edit/{id}")
    public String editUser(@Valid User user, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            System.out.println(Arrays.toString(bindingResult.getAllErrors().toArray()));
            return "user/editForm";
        }
        userRepository.save(user);
        return "redirect:/user/all";
    }

    //Mock methods
    @GetMapping("/addToSession")
    public String addUserToSessionForm(){
        return "user/addSession";
    }

    @PostMapping("/addToSession")
    public String addUserToSession(@Param("username") String username, HttpServletRequest request){
        User user = userRepository.findByUserName(username);
        HttpSession session = request.getSession();
        if(user!=null){
            session.setAttribute("user",user);
        }
        return "redirect:/";
    }

    @GetMapping("/checkSession")
    @ResponseBody
    public String checkUserSession(HttpServletRequest request){
        HttpSession session = request.getSession();
        if (session.getAttribute("user")==null){
            return "";
        }
        return session.getAttribute("user").toString();
    }

}
