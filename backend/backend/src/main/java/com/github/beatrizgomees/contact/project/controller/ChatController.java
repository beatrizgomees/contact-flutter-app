package com.github.beatrizgomees.contact.project.controller;

import com.github.beatrizgomees.contact.project.domain.ChatInput;
import com.github.beatrizgomees.contact.project.domain.ChatOutput;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

@Controller
public class ChatController {

    @MessageMapping("/new-message")
    @SendTo("/topics/contactchat")
    public ChatOutput newMessage(ChatInput input){
        return new ChatOutput(HtmlUtils.htmlEscape(input.phone() + " " + input.message()));
    }



}
