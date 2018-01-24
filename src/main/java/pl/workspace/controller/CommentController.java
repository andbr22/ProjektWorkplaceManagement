package pl.workspace.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.workspace.model.WorkComment;
import pl.workspace.repository.WorkCommentRepository;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private WorkCommentRepository workCommentRepository;

    @GetMapping("/{id}")
    public String showComment(Model model, @PathVariable("id") long id){
        WorkComment comment = workCommentRepository.findOne(id);
        model.addAttribute("comment", comment);
        return "comment/view";
    }
}
