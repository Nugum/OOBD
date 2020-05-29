package ru.icmit.oodb.lab12.repository;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import ru.icmit.oodb.lab12.domain.OrderEn;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Component
public class OrderRepository {
    @PersistenceContext(name = "entityManagerFactory")
    protected EntityManager entityManager;

    @Transactional
    public OrderEn save(OrderEn orderEn) {
        if (orderEn != null && orderEn.getId() != null) {
            orderEn = entityManager.merge(orderEn);
        } else {
            entityManager.persist(orderEn);
        }
        return orderEn;
    }

    @Transactional
    public void remove(OrderEn orderEn) {
        entityManager.remove(orderEn);
    }
}
