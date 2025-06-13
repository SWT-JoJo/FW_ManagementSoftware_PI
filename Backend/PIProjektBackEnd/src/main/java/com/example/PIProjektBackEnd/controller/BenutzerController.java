package com.example.PIProjektBackEnd.controller;

import com.example.PIProjektBackEnd.model.Benutzer;
import com.example.PIProjektBackEnd.reposetory.BenutzerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Iterator;
import java.util.List;


@RestController
public class BenutzerController {

    @Autowired
    BenutzerRepository benutzerRepository;
    @GetMapping("/Benutzer")
    public Iterable<Benutzer> alleBenutzerdatenBekommen() {
        return benutzerRepository.findAll();
    }





    @PostMapping("/Benutzer")
    public Benutzer createNewUser(@RequestBody Benutzer benutzer){
        return benutzerRepository.save(benutzer);
    }

}
