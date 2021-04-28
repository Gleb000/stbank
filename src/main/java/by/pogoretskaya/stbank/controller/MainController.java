package by.pogoretskaya.stbank.controller;

import by.pogoretskaya.stbank.domain.Message;
import by.pogoretskaya.stbank.domain.User;
import by.pogoretskaya.stbank.repos.MessageRepo;
import by.pogoretskaya.stbank.util.NationalBankCourceApi;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class MainController {

    private final NationalBankCourceApi nationalBankCourceApi;
    private final MessageRepo messageRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/")
    public String greeting(Model model) {
        model.addAttribute("USDRate", nationalBankCourceApi.getUSDOfficialRate());
        model.addAttribute("EURRate", nationalBankCourceApi.getEUROfficialRate());
        model.addAttribute("RUBRate", nationalBankCourceApi.getRUBOfficialRate());

        return "greeting";
    }

    @GetMapping("/bankInfo")
    public String bankInformation(Map<String, Object> model) {
        return "bankInfo";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Message> messages = messageRepo.findAll();

        if (filter != null && !filter.isEmpty()) {
            messages = messageRepo.findByTag(filter);
        } else {
            messages = messageRepo.findAll();
        }

        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);

        return "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @Valid Message message,
            BindingResult bindingResult,
            Model model,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        message.setAuthor(user);

        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errorsMap);
            model.addAttribute("message", message);
        } else {
            if (file != null && !file.getOriginalFilename().isEmpty()) {
                File uploadDir = new File(uploadPath);

                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                String uuidFile = UUID.randomUUID().toString();
                String resultFilename = uuidFile + "." + file.getOriginalFilename();

                file.transferTo(new File(uploadPath + "/" + resultFilename));

                message.setFilename(resultFilename);
            }

            model.addAttribute("message", null);

            messageRepo.save(message);
        }

        Iterable<Message> messages = messageRepo.findAll();

        model.addAttribute("messages", messages);

        return "main";
    }
}