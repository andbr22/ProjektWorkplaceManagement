package pl.workspace.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.workspace.model.WorkOrder;

import java.time.LocalDateTime;
import java.util.List;

public interface WorkOrderRepository extends JpaRepository<WorkOrder,Long>{

    List<WorkOrder> findAllByFinishedFalseAndStoppedFalse();

    @Query("SELECT o FROM WorkOrder o ORDER BY o.created DESC")
    List<WorkOrder> findAllOrderByCreatedDesc();

    @Query("SELECT o FROM WorkOrder o WHERE o.readyToWork between ?1 and ?2 ORDER BY o.created DESC")
    public List<WorkOrder> chooseWorkOrderBetweenDates(LocalDateTime start, LocalDateTime end);

    @Query("SELECT o FROM WorkOrder o WHERE o.orderClient LIKE %?1% ORDER BY o.created DESC")
    public List<WorkOrder> findByOrderClientLike(String client);

    @Query("SELECT o FROM WorkOrder o WHERE o.orderName LIKE %?1% ORDER BY o.created DESC")
    public List<WorkOrder> findByOrderNameLike(String order);
}
