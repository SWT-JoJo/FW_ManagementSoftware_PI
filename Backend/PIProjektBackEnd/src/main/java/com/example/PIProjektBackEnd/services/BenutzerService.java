package com.example.PIProjektBackEnd.services;

import com.example.PIProjektBackEnd.model.Benutzer;
import com.example.PIProjektBackEnd.reposetory.BenutzerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BenutzerService {
    @Autowired
    private BenutzerRepository userRepository;

    public Benutzer createUser(Benutzer user) {
        // Hier kannst du noch Validierungen einbauen, z.B. ob username schon existiert
        return userRepository.save(user);
    }
}
