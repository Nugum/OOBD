package ru.icmit.oodb.lab12.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.icmit.oodb.lab12.domain.DeliveryMan;
import ru.icmit.oodb.lab12.domain.OrderEn;
import ru.icmit.oodb.lab12.repository.DeliveryManRepository;
import ru.icmit.oodb.lab12.repository.OrderRepository;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class OrderController {
    @Autowired
    private DeliveryManRepository deliveryManRepository;
    @Autowired
    private OrderRepository orderRepository;

    @RequestMapping("/addorder")
    @Transactional
    public String deliverymanByName(HttpServletRequest request,
                                 @RequestParam(value = "id", required = false) Long id,
                                 @RequestParam(value = "name", required = false) String name,
                                 @ModelAttribute("model") ModelMap model) {
        String path = request.getContextPath();
        model.addAttribute("app_path", path);

        DeliveryMan deliveryMan = null;
        if (id != null) {
            deliveryMan = deliveryManRepository.findById(id);

            if (deliveryMan != null) {
                OrderEn orderEn = new OrderEn();
                orderEn.setOrderEn(name);
                orderRepository.save(orderEn);

                deliveryMan.getOrderEns().add(orderEn);
                deliveryManRepository.save(deliveryMan);
            }

            List<OrderEn> orderEns = deliveryManRepository.getDeliveryManOrders(deliveryMan);
            model.addAttribute("orders", orderEns);
        } else {
            deliveryMan = new DeliveryMan();
        }
        model.addAttribute("deliveryman", deliveryMan);

        return "/deliveryman";
    }
}
