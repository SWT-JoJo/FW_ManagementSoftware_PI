package com.example.PIProjektBackEnd.controller;

import com.example.PIProjektBackEnd.model.Benutzer;
import com.example.PIProjektBackEnd.reposetory.BenutzerRepository;
import com.example.PIProjektBackEnd.services.BenutzerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus; // Import hinzufügen
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping(value = "/Benutzer/create", consumes = "application/json") // 'application/json' ist hier ausreichend
    public ResponseEntity<?> createUser(@RequestBody Benutzer user) {
        System.out.println("Empfangener Benutzer (im Controller): " + user);
        try {
            Benutzer createdUser = bs.createUser(user);
            return ResponseEntity.ok(createdUser);
        } catch (IllegalArgumentException e) {
            // Fange die spezifische Ausnahme ab und gib 409 Conflict zurück
            return ResponseEntity.status(HttpStatus.CONFLICT)
                    .body(e.getMessage()); // Sende die Fehlermeldung an den Client
        } catch (Exception e) {
            // Fange andere unerwartete Ausnahmen ab
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Ein unerwarteter Fehler ist aufgetreten: " + e.getMessage());
        }
    }
}