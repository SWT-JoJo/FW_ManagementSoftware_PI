package com.example.PIProjektBackEnd.controller;

import com.example.PIProjektBackEnd.model.Einsatz;
import com.example.PIProjektBackEnd.reposetory.EinsatzRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/Einsatz")
public class EinsatzController {
    @Autowired
    EinsatzRepository er;

    @GetMapping
    Iterable<Einsatz> alleEinsaetze(){
        return er.findAll();
    }
}
