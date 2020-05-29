package ru.icmit.oodb.lab12.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.icmit.oodb.lab12.repository.DeliveryManRepository;

import javax.servlet.http.HttpServletRequest;

@Controller
public class DeleteObjectController {
    @Autowired
    private DeliveryManRepository repository;

    @RequestMapping("/deliveryman/delete")
    public String deleteDeliveryMan(HttpServletRequest request,
                                 @RequestParam("deliverymanid") Long deliverymanid,
                                 @ModelAttribute("model")ModelMap model) {
        String path = request.getContextPath();
        model.addAttribute("app_path", path);
        repository.removeDeliveryMan(deliverymanid);
        return "/delobject";
    }

    @RequestMapping("/deliveryman/deleteorder")
    public String deleteOrder(HttpServletRequest request,
                            @RequestParam("orderid") Long orderid,
                            @ModelAttribute("model") ModelMap model) {
        String path = request.getContextPath();
        model.addAttribute("app_path", path);
        repository.removeOrder(orderid);
        return "/delobject";
    }

    @RequestMapping("/deliveryman/deleteallorders")
    public String deleteAllOrders(HttpServletRequest request,
                                @RequestParam("deliverymanid") Long deliverymanid,
                                @ModelAttribute("model") ModelMap model) {
        String path = request.getContextPath();
        model.addAttribute("app_path", path);
        repository.removeDeliveryManOrders(deliverymanid);
        return "/delobject";
    }

    @RequestMapping("/delobject")
    public String delObject(HttpServletRequest request,
                            @ModelAttribute("model") ModelMap model) {
        String path = request.getContextPath();
        model.addAttribute("app_path", path);
        return "/delobject";
    }
}

























