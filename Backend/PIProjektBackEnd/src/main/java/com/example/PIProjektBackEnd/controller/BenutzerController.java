package com.example.PIProjektBackEnd.controller;

import com.example.PIProjektBackEnd.model.Benutzer;
import com.example.PIProjektBackEnd.reposetory.BenutzerRepository;
import com.example.PIProjektBackEnd.services.BenutzerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Iterator;
import java.util.List;


@RestController
public class BenutzerController {

    @Autowired
    BenutzerRepository benutzerRepository;

    @Autowired
    BenutzerService bs;

    @GetMapping("/Benutzer")
    public Iterable<Benutzer> alleBenutzerdatenBekommen() {
        return benutzerRepository.findAll();
    }





    @PostMapping("/Benutzer")
    public Benutzer createNewUser(@RequestBody Benutzer benutzer){
        return benutzerRepository.save(benutzer);
    }

    @PostMapping("/create")
    public ResponseEntity<Benutzer> createUser(@RequestBody Benutzer user) {
        Benutzer createdUser = bs.createUser(user);
        return ResponseEntity.ok(createdUser);
    }

}
