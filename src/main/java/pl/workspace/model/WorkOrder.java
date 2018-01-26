package pl.workspace.model;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "workOrders")
public class WorkOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotEmpty
    private String orderName;

    @NotEmpty
    private String orderDescription;

    @NotEmpty
    private String orderClient;

    @Min(value = 1)
    private int amount;

    private LocalDateTime created;

    private LocalDateTime readyToWork;

    private LocalDateTime readyToRealisation;

    private boolean finished = false;

    private boolean stopped = false;

    @OneToMany(mappedBy = "workOrder", cascade = CascadeType.ALL)
    private List<Work> works = new ArrayList<>();

    //Methods

    public WorkOrder() {
    }

    public String getOrderDescription() {
        return orderDescription;
    }

    public void setOrderDescription(String orderDescription) {
        this.orderDescription = orderDescription;
    }

    public LocalDateTime getCreated() {
        return created;
    }

    public void setCreated(LocalDateTime created) {
        this.created = created;
    }

    public LocalDateTime getReadyToWork() {
        return readyToWork;
    }

    public void setReadyToWork(LocalDateTime readyToWork) {
        this.readyToWork = readyToWork;
    }

    public LocalDateTime getReadyToRealisation() {
        return readyToRealisation;
    }

    public void setReadyToRealisation(LocalDateTime readyToRealisation) {
        this.readyToRealisation = readyToRealisation;
    }

    public List<Work> getWorks() {
        return works;
    }

    public void setWorks(List<Work> works) {
        this.works = works;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getOrderName() {
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }

    public String getOrderClient() {
        return orderClient;
    }

    public void setOrderClient(String orderClient) {
        this.orderClient = orderClient;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public boolean isFinished() {
        return finished;
    }

    public void setFinished(boolean finished) {
        this.finished = finished;
    }

    public boolean isStopped() {
        return stopped;
    }

    public void setStopped(boolean stopped) {
        this.stopped = stopped;
    }

    //Other functions
    public int getWholeEstimatedAmount(){
        int result = 0;
        for(Work work: this.getWorks()){
            result += work.getAmountDone();
        }
        return result;
    }

    public int getMaxAlertLevel(){
        int result = 0;
        for(Work work: this.getWorks()){
            if(work.getComment() == null){
                continue;
            }
            if(work.getComment().getAlertLevel()==1){
                result =1;
            }
            if(work.getComment().getAlertLevel()==2){
                result =2;
                break;
            }
        }
        return result;
    }
}
