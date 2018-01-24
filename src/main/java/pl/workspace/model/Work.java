package pl.workspace.model;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "works")
public class Work {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private int amountDone;

    private int estimateWorkHours;

    private String shift;

    private LocalDateTime added;

    @ManyToOne
    @JoinColumn(name ="id_worker")
    private User worker;

    @ManyToOne
    @JoinColumn(name = "id_workOrder")
    private WorkOrder workOrder;

    //Methods

    public Work() {
    }

    public int getEstimateWorkHours() {
        return estimateWorkHours;
    }

    public void setEstimateWorkHours(int estimateWorkHours) {
        this.estimateWorkHours = estimateWorkHours;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getAmountDone() {
        return amountDone;
    }

    public void setAmountDone(int amountDone) {
        this.amountDone = amountDone;
    }

    public String getShift() {
        return shift;
    }

    public void setShift(String shift) {
        this.shift = shift;
    }

    public LocalDateTime getAdded() {
        return added;
    }

    public void setAdded(LocalDateTime added) {
        this.added = added;
    }

    public User getWorker() {
        return worker;
    }

    public void setWorker(User worker) {
        this.worker = worker;
    }

    public WorkOrder getWorkOrder() {
        return workOrder;
    }

    public void setWorkOrder(WorkOrder workOrder) {
        this.workOrder = workOrder;
    }
}
