package com.example.PIProjektBackEnd.model;

import jakarta.persistence.*;
import java.time.LocalDateTime; // Import for TIMESTAMP type

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

    // --- Constructors ---
    public Lehrgang() {
    }

    public Lehrgang(String bezeichnung, LocalDateTime start, LocalDateTime ende, String strasse, Integer plz, String ort) {
        this.bezeichnung = bezeichnung;
        this.start = start;
        this.ende = ende;
        this.strasse = strasse;
        this.plz = plz;
        this.ort = ort;
    }

    // --- Getter and Setter methods ---
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

    @Override
    public String toString() {
        return "Lehrgang{" +
                "lnr=" + lnr +
                ", bezeichnung='" + bezeichnung + '\'' +
                ", start=" + start +
                ", ende=" + ende +
                ", strasse='" + strasse + '\'' +
                ", plz=" + plz +
                ", ort='" + ort + '\'' +
                '}';
    }
}