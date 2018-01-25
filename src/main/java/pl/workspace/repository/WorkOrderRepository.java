package pl.workspace.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.workspace.model.WorkOrder;

import java.time.LocalDateTime;
import java.util.List;

public interface WorkOrderRepository extends JpaRepository<WorkOrder,Long>{

    List<WorkOrder> findAllByFinishedFalseAndStoppedFalse();

    @Query("SELECT o FROM WorkOrder o WHERE o.readyToWork between ?1 and ?2")
    public List<WorkOrder> chooseWorkOrderBetweenDates(LocalDateTime start, LocalDateTime end);

    @Query("SELECT o FROM WorkOrder o WHERE o.orderClient LIKE %?1%")
    public List<WorkOrder> findByOrderClientLike(String client);

    @Query("SELECT o FROM WorkOrder o WHERE o.orderName LIKE %?1%")
    public List<WorkOrder> findByOrderNameLike(String order);
}
