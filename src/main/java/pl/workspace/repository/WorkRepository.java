package pl.workspace.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.workspace.model.Work;

import java.util.List;

public interface WorkRepository extends JpaRepository<Work,Long> {

//    @Query("SELECT w FROM Work w WHERE current_timestamp")
//    public List<Work> last3Days();

    public List<Work> findAllByWorkOrderId(long id);
}
