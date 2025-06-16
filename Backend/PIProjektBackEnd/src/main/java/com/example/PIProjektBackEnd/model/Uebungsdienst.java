package com.example.PIProjektBackEnd.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set; // Verwende Set statt List

@Table(name = "uebungsdienst")
@Entity
public class Uebungsdienst {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "uenr") // Explizite Spaltenbenennung
    private Long uenr;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "verantwortlich")
    private Benutzer verantwortlich;

    @Column(name = "thema")
    private String thema;

    @Column(name = "strasse")
    private String strasse;

    @Column(name = "plz")
    private Integer plz; // Wrapper-Typ, wenn nullable in DB

    @Column(name = "ort")
    private String ort;

    @Column(name = "start")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime start;

    @Column(name = "ende")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime ende;


    @ManyToMany(mappedBy = "uebungsdienste")
    @JsonBackReference
    private Set<Benutzer> teilnehmer = new HashSet<>();

    public Uebungsdienst(Benutzer verantwortlich, String thema, String strasse, Integer plz, String ort, LocalDateTime start, LocalDateTime ende, Set<Benutzer> teilnehmer) {
        this.verantwortlich = verantwortlich;
        this.thema = thema;
        this.strasse = strasse;
        this.plz = plz;
        this.ort = ort;
        this.start = start;
        this.ende = ende;
        this.teilnehmer = teilnehmer;
    }

    public Uebungsdienst() {
    }

    public Long getUenr() {
        return uenr;
    }

    public void setUenr(Long uenr) {
        this.uenr = uenr;
    }

    public Benutzer getVerantwortlich() {
        return verantwortlich;
    }

    public void setVerantwortlich(Benutzer verantwortlich) {
        this.verantwortlich = verantwortlich;
    }

    public String getThema() {
        return thema;
    }

    public void setThema(String thema) {
        this.thema = thema;
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

    public Set<Benutzer> getTeilnehmer() {
        return teilnehmer;
    }

    public void setTeilnehmer(Set<Benutzer> teilnehmer) {
        this.teilnehmer = teilnehmer;
    }
}