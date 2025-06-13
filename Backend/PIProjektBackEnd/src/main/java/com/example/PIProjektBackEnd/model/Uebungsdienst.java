package com.example.PIProjektBackEnd.model;

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

    @Column(name = "verantwortlich") // Spaltenname im DB Schema
    private Long verantwortlich; // Typ sollte Long sein, wenn es ein FK auf Benutzer.pnr ist

    @Column(name = "thema")
    private String thema;

    @Column(name = "strasse")
    private String strasse;

    @Column(name = "plz")
    private Integer plz; // Wrapper-Typ, wenn nullable in DB

    @Column(name = "ort")
    private String ort;

    @Column(name = "start")
    private LocalDateTime start;

    @Column(name = "ende")
    private LocalDateTime ende;

    // Die Many-to-Many-Beziehung wird über die Join-Entität abgebildet
    @OneToMany(mappedBy = "uebungsdienst", cascade = CascadeType.ALL, orphanRemoval = true)
    // cascade = CascadeType.ALL: Operationen auf Uebungsdienst kaskadieren zu Teilnahmen
    // orphanRemoval = true: Entfernt Teilnahmen, wenn sie aus der Sammlung entfernt werden
    private Set<TeilnahmeUebungsdienst> teilnahmenUebungsdienst = new HashSet<>();


    // --- Constructors ---
    public Uebungsdienst() {
    }

    public Uebungsdienst(Long verantwortlich, String thema, String strasse, Integer plz, String ort, LocalDateTime start, LocalDateTime ende) {
        this.verantwortlich = verantwortlich;
        this.thema = thema;
        this.strasse = strasse;
        this.plz = plz;
        this.ort = ort;
        this.start = start;
        this.ende = ende;
    }

    // --- Getter and Setter methods ---
    public Long getUenr() {
        return uenr;
    }

    public void setUenr(Long uenr) {
        this.uenr = uenr;
    }

    public Long getVerantwortlich() {
        return verantwortlich;
    }

    public void setVerantwortlich(Long verantwortlich) {
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

    public Set<TeilnahmeUebungsdienst> getTeilnahmenUebungsdienst() {
        return teilnahmenUebungsdienst;
    }

    public void setTeilnahmenUebungsdienst(Set<TeilnahmeUebungsdienst> teilnahmenUebungsdienst) {
        this.teilnahmenUebungsdienst = teilnahmenUebungsdienst;
    }

    // Hilfsmethoden für die Bidirektionalität
    public void addTeilnahmeUebungsdienst(TeilnahmeUebungsdienst teilnahme) {
        this.teilnahmenUebungsdienst.add(teilnahme);
        teilnahme.setUebungsdienst(this);
    }

    public void removeTeilnahmeUebungsdienst(TeilnahmeUebungsdienst teilnahme) {
        this.teilnahmenUebungsdienst.remove(teilnahme);
        teilnahme.setUebungsdienst(null);
    }
}