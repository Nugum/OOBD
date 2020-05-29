package ru.icmit.oodb.lab12.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class OrderEn {
    @Id
    @GeneratedValue()
    private Long id;

    @Column(length = 20)
    private String orderEn;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOrderEn() {
        return orderEn;
    }

    public void setOrderEn(String orderEn) {
        this.orderEn = orderEn;
    }
}