package pl.workspace.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.workspace.model.WorkOrder;

public interface WorkOrderRepository extends JpaRepository<WorkOrder,Long>{
}
