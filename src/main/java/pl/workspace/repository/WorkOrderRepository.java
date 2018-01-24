package pl.workspace.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.workspace.model.WorkOrder;

import java.util.List;

public interface WorkOrderRepository extends JpaRepository<WorkOrder,Long>{

    List<WorkOrder> findAllByFinishedFalseAndStoppedFalse();
}
