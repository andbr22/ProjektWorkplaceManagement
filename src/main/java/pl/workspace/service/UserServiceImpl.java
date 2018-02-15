package pl.workspace.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.workspace.model.User;
import pl.workspace.model.WorkOrder;
import pl.workspace.repository.UserRepository;
import pl.workspace.repository.WorkOrderRepository;

@Service
@Transactional
public class UserServiceImpl {
    private static final int PAGE_SIZE = 5;

    @Autowired
    private UserRepository userRepository;

    public Page<User> getUserPage(Integer pageNumber){
        PageRequest request = new PageRequest(pageNumber-1, PAGE_SIZE, Sort.Direction.DESC, "id");
        return userRepository.findAll(request);
    }
}
