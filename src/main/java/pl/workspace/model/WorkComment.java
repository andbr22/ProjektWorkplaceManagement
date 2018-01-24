package pl.workspace.model;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

@Entity
@Table(name = "workComments")
public class WorkComment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(columnDefinition = "TEXT")
    private String text;

    @Min(value = 0)
    @Max(value = 2)
    private int alertLevel = 0;

    //Methods

    public WorkComment() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getAlertLevel() {
        return alertLevel;
    }

    public void setAlertLevel(int alertLevel) {
        this.alertLevel = alertLevel;
    }
}
