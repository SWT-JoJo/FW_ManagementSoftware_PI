package com.example.PIProjektBackEnd.controller;

import com.example.PIProjektBackEnd.model.Fahrzeug;
import com.example.PIProjektBackEnd.reposetory.FahrzeugeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/Fahrzeuge")
public class FahrzeugeController {

    @Autowired
    FahrzeugeRepository fr;

    @GetMapping
   public Iterable<Fahrzeug> getAllFahrzeuge(){
        return fr.findAll();
    }

}
