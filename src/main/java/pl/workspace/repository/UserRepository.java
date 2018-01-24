package pl.workspace.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.workspace.model.User;

public interface UserRepository extends JpaRepository<User,Long> {
    public User findByUserName(String username);
}
