package com.example.PIProjektBackEnd.controller;

import com.example.PIProjektBackEnd.dto.UebungsdienstDTO;
import com.example.PIProjektBackEnd.model.Uebungsdienst;
import com.example.PIProjektBackEnd.reposetory.UebungsdienstRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/Uebungsdienste")
public class TerminController {

    @Autowired
    UebungsdienstRepository ur;

    @GetMapping("/{datum}")
    public List<UebungsdienstDTO> getDiensteByDatum(@PathVariable("datum") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate datum) {
        LocalDateTime startOfDay = datum.atStartOfDay();
        LocalDateTime endOfDay = datum.atTime(LocalTime.MAX);

        List<Uebungsdienst> dienste = ur.findBystartBetween(startOfDay, endOfDay);

        // Hier werden die Entities in DTOs umgewandelt, die den Namen enthalten
        return dienste.stream()
                .map(UebungsdienstDTO::new)
                .collect(Collectors.toList());
    }

    @GetMapping
    public List<UebungsdienstDTO> getDienst() {
        List<Uebungsdienst> dienste = (List<Uebungsdienst>) ur.findAll();

        // Hier werden die Entities in DTOs umgewandelt, die den Namen enthalten
        return dienste.stream()
                .map(UebungsdienstDTO::new)
                .collect(Collectors.toList());
    }
}
