package com.example.PIProjektBackEnd.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import java.time.LocalDateTime; // Import for TIMESTAMP type
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "lehrgang")
public class Lehrgang {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "lnr")
    private Long lnr; // int AI PK -> Long

    @Column(name = "bezeichnung")
    private String bezeichnung; // varchar(50) -> String

    @Column(name = "start")
    private LocalDateTime start; // timestamp -> LocalDateTime

    @Column(name = "ende")
    private LocalDateTime ende; // timestamp -> LocalDateTime

    @Column(name = "strasse")
    private String strasse; // varchar(50) -> String

    @Column(name = "plz")
    private Integer plz; // int -> Integer

    @Column(name = "ort")
    private String ort; // varchar(50) -> String

    @ManyToMany(mappedBy = "lehrgaenge")
    @JsonBackReference
    private Set<Benutzer> teilnehmer = new HashSet<>();

    public Lehrgang(String bezeichnung, LocalDateTime start, LocalDateTime ende, String strasse, Integer plz, String ort, Set<Benutzer> teilnehmer) {
        this.bezeichnung = bezeichnung;
        this.start = start;
        this.ende = ende;
        this.strasse = strasse;
        this.plz = plz;
        this.ort = ort;
        this.teilnehmer = teilnehmer;
    }

    public Lehrgang() {
    }

    public Long getLnr() {
        return lnr;
    }

    public void setLnr(Long lnr) {
        this.lnr = lnr;
    }

    public String getBezeichnung() {
        return bezeichnung;
    }

    public void setBezeichnung(String bezeichnung) {
        this.bezeichnung = bezeichnung;
    }

    public LocalDateTime getStart() {
        return start;
    }

    public void setStart(LocalDateTime start) {
        this.start = start;
    }

    public LocalDateTime getEnde() {
        return ende;
    }

    public void setEnde(LocalDateTime ende) {
        this.ende = ende;
    }

    public String getStrasse() {
        return strasse;
    }

    public void setStrasse(String strasse) {
        this.strasse = strasse;
    }

    public Integer getPlz() {
        return plz;
    }

    public void setPlz(Integer plz) {
        this.plz = plz;
    }

    public String getOrt() {
        return ort;
    }

    public void setOrt(String ort) {
        this.ort = ort;
    }

    public Set<Benutzer> getTeilnehmer() {
        return teilnehmer;
    }

    public void setTeilnehmer(Set<Benutzer> teilnehmer) {
        this.teilnehmer = teilnehmer;
    }

}