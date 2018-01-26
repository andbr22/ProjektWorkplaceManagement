package pl.workspace.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.workspace.model.User;
import pl.workspace.repository.UserRepository;
import pl.workspace.security.UserPrincipal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class HomeController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    PasswordEncoder encoder;

    @GetMapping("/")
    public String test(){
        return "home";
    }

    @GetMapping("/logout")
    public String loginForm(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/login";
    }


    @GetMapping("/register")
    public String adminRegisterForm(Model model){
        User user = new User();
        model.addAttribute("user",user);
        return "user/registerAdmin";
    }

    @PostMapping("/register")
    public String adminRegister(Model model, @Valid User user, BindingResult bindingResult){
        User nameCheck = userRepository.findByUserName(user.getUserName());
        if (bindingResult.hasErrors() || nameCheck!=null){
            return "user/registerAdmin";
        }
        user.setPassword(encoder.encode(user.getPassword()));
        user.setEmployee(false);
        System.out.println(user.toString());
        userRepository.save(user);
        System.out.println(user.toString());
        //model.addAttribute("message","Activate account in db by setting employee flag");
        return "redirect:/login";
    }

}
