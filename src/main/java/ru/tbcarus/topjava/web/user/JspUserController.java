package ru.tbcarus.topjava.web.user;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import ru.tbcarus.topjava.model.Role;
import ru.tbcarus.topjava.model.User;
import ru.tbcarus.topjava.service.UserService;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletRequest;

import java.io.UnsupportedEncodingException;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@ApiIgnore
@Controller
@RequestMapping(value = "/users")
public class JspUserController {
    private static final Logger log = LoggerFactory.getLogger(JspUserController.class);

    @Autowired
    private UserService userService;

    //OK
    @GetMapping("/{id}")
    public String getUser(@PathVariable("id") int id, Model model) {
        User user = userService.get(id);
        model.addAttribute("userEdit", user);
        return "userInfo";
    }

    //OK
    @GetMapping("/delete")
    public String delete(@RequestParam("id") int id) {
        log.info("delete user {}", id);
        userService.delete(id);
        return "redirect:/users";
    }

    //OK
    @GetMapping("/update")
    public String update(@RequestParam int id, HttpServletRequest request, Model model) {
        User user = userService.get(id);
        model.addAttribute("userEdit", user);
        return "userForm";
    }

    //OK
    @GetMapping("/create")
    public String create(HttpServletRequest request, Model model) {
        User user = new User(LocalDateTime.now());
        model.addAttribute("user", user);
        return "userForm";
    }

    //OK
    @PostMapping("/create-or-update")
    public String createOrUpdate(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        int userId = Integer.parseInt(id.isEmpty() ? "0" : id);
        String name = request.getParameter("name");
        String eMail = request.getParameter("email");
        boolean enabled = request.getParameter("enabled") != null;
        LocalDateTime registered = LocalDateTime.now();
        String password = request.getParameter("password");
        Set<Role> roles = new HashSet<>();
        if (request.getParameter("userRole") != null) {
            roles.add(Role.USER);
        }
        if (request.getParameter("adminRole") != null) {
            roles.add(Role.ADMIN);
        }

        if (StringUtils.hasLength(request.getParameter("id"))) {
            User user = userService.get(userId);
            user.setName(name);
            user.setEnabled(enabled);
            user.setPassword(password);
            user.setRoles(roles);
            userService.update(user);

        } else {
            User user = new User(null, name, eMail, password, enabled, registered, roles);
            userService.create(user);
        }
        return "redirect:/users";
    }
}
