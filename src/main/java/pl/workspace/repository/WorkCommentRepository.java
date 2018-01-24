package pl.workspace.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.workspace.model.WorkComment;

public interface WorkCommentRepository extends JpaRepository<WorkComment,Long>{
}
