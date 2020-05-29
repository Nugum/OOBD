package ru.icmit.oodb.lab12.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
public class DeliveryManController {
    @Autowired
    private DeliveryManRepository repository;
    @Autowired
    private OrderRepository orderRepository;

    @RequestMapping("/deliveryman")
    public String deliveryMEN(HttpServletRequest request, @ModelAttribute("model") ModelMap model) {
        String path = request.getContextPath();
        model.addAttribute("app_path", path);

        List<DeliveryMan> deliveryMEN = repository.findAll();
        model.addAttribute("deliverymen", deliveryMEN);
        return "/deliverymen";
    }

    @RequestMapping("/deliverymanbyname")
    public String deliveryManByName(HttpServletRequest request,
                                 @RequestParam(value = "name", required = false) String name,
                                 @ModelAttribute("model") ModelMap model) {
        String path = request.getContextPath();
        model.addAttribute("app_path", path);

        if (name != null) {
            DeliveryMan deliveryMan = repository.findByName(name);
            model.addAttribute("deliveryman", deliveryMan);
        } else {
            model.addAttribute("deliveryman", null);
        }

        return "/deliverymanbyname";
    }

    @RequestMapping("/adddeliveryman")
    public String addCustomer(HttpServletRequest request,
                              @RequestParam(value = "id", required = false) Long id,
                              @RequestParam(value = "name", required = false) String name,
                              @RequestParam(value = "surname", required = false) String surname,
                              @RequestParam(value = "age", required = false) Long age,
                              @RequestParam(value = "workernumber", required = false) Integer workerNumber,
                              @ModelAttribute("model") ModelMap model) {
        String path  = request.getContextPath();
        model.addAttribute("app_path", path);

        DeliveryMan deliveryMan = null;
        if (id != null) {
            deliveryMan = repository.findById(id);
        }
        if (deliveryMan == null) {
            deliveryMan = new DeliveryMan();
        }
        if (name != null || surname != null || workerNumber != null || age != null) {
            deliveryMan.setName(name);
            deliveryMan.setSurname(surname);
            deliveryMan.setAge(age);
            deliveryMan.setWorkerNumber(workerNumber);
            deliveryMan = repository.save(deliveryMan);
        }
        if (deliveryMan.getId() != null) {
            List<OrderEn> orderEns = repository.getDeliveryManOrders(deliveryMan);
            model.addAttribute("orders", orderEns);
        }

        model.addAttribute("deliveryman", deliveryMan);
        return "/deliveryman";
    }
}













