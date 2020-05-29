package ru.icmit.oodb.lab12.domain;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import java.util.ArrayList;
import java.util.List;

@Entity
public class DeliveryMan extends Person {
    private Integer workerNumber;

    @OneToMany(cascade = CascadeType.REMOVE, orphanRemoval = true)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn
    private List<OrderEn> orderEns = new ArrayList<>();

    public Integer getWorkerNumber() {
        return workerNumber;
    }

    public void setWorkerNumber(Integer workerNumber) {
        this.workerNumber = workerNumber;
    }

    public List<OrderEn> getOrderEns() {
        return orderEns;
    }

    public void setOrderEns(List<OrderEn> orderEns) {
        this.orderEns = orderEns;
    }
}
