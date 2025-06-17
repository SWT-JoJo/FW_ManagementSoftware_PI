package com.example.PIProjektBackEnd.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "qualifikation")
public class Qualifikation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "qnr")
    private Long qnr; // int AI PK -> Long

    @Column(name = "bezeichnung")
    private String bezeichnung;

    @ManyToMany(mappedBy = "qualifikationen")
    @JsonBackReference
    private Set<Benutzer> benutzer = new HashSet<>();

    public Qualifikation(String bezeichnung, Set<Benutzer> benutzer) {
        this.bezeichnung = bezeichnung;
        this.benutzer = benutzer;
    }

    public Qualifikation() {
    }

    public Long getQnr() {
        return qnr;
    }

    public void setQnr(Long qnr) {
        this.qnr = qnr;
    }

    public String getBezeichnung() {
        return bezeichnung;
    }

    public void setBezeichnung(String bezeichnung) {
        this.bezeichnung = bezeichnung;
    }

    public Set<Benutzer> getBenutzer() {
        return benutzer;
    }

    public void setBenutzer(Set<Benutzer> benutzer) {
        this.benutzer = benutzer;
    }
}