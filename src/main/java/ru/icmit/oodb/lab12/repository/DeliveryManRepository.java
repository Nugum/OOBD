package ru.icmit.oodb.lab12.repository;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import ru.icmit.oodb.lab12.domain.DeliveryMan;
import ru.icmit.oodb.lab12.domain.OrderEn;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Component
public class DeliveryManRepository {
    @PersistenceContext(name = "entityManagerFactory")
    protected EntityManager entityManager;

    public List<DeliveryMan> findAll() {
        Query query = entityManager.createQuery(
                "select d from DeliveryMan d ", DeliveryMan.class
        );
        List<DeliveryMan> deliveryMEN = query.getResultList();
        return deliveryMEN;
    }

    public DeliveryMan findByName(String name) {
        Query query = entityManager.createQuery(
                "select d from DeliveryMan d where d.name like :name ", DeliveryMan.class
        );
        query.setParameter("name", name);
        List<DeliveryMan> deliveryMEN = query.getResultList();

        DeliveryMan deliveryMan = new DeliveryMan();
        deliveryMan.setId(-1L);
        deliveryMan.setName("Нет");
        deliveryMan.setSurname("Пользователя");
        deliveryMan.setAge(-1L);
        deliveryMan.setWorkerNumber(-1);
        if (deliveryMEN.size() > 0) {
            deliveryMan = deliveryMEN.get(0);
        }

        return deliveryMan;
    }

    public List<OrderEn> getDeliveryManOrders(Long deliveryManId) {
        Query query = entityManager.createQuery(
                "select t from DeliveryMan d JOIN d.orderEns t where d.id = :id ", OrderEn.class
        );
        query.setParameter("id", deliveryManId);
        return query.getResultList();
    }

    public List<OrderEn> getDeliveryManOrders(DeliveryMan deliveryMan) {
        Query query = entityManager.createQuery(
                "select t from DeliveryMan d JOIN d.orderEns t where d = :deliveryMan ", OrderEn.class
        );
        query.setParameter("deliveryMan", deliveryMan);
        return query.getResultList();
    }

    public DeliveryMan findById(Long id) {
        return entityManager.find(DeliveryMan.class, id);
    }

    @Transactional
    public DeliveryMan save(DeliveryMan deliveryMan) {
        if (deliveryMan == null) return null;
        if (deliveryMan.getId() != null) {
            deliveryMan = entityManager.merge(deliveryMan);
        } else {
            entityManager.persist(deliveryMan);
        }
        return deliveryMan;
    }

    @Transactional
    public boolean removeDeliveryMan(Long id) {
        DeliveryMan deliveryMan = entityManager.find(DeliveryMan.class, id);
        if (deliveryMan == null) return false;
        entityManager.remove(deliveryMan);
        return true;
    }

    @Transactional
    public boolean removeOrder(Long id) {
        OrderEn orderEn = entityManager.find(OrderEn.class, id);
        if (orderEn == null) return false;
        entityManager.remove(orderEn);
        return true;
    }

    @Transactional
    public boolean removeDeliveryManOrders(Long id) {
        DeliveryMan deliveryMan = entityManager.find(DeliveryMan.class, id);
        if (deliveryMan == null) return false;
        List<OrderEn> orderEns = deliveryMan.getOrderEns();
        orderEns.clear();
        deliveryMan.setOrderEns(orderEns);
        entityManager.merge(deliveryMan);
        return true;
    }
}




















