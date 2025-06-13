package com.example.PIProjektBackEnd.model;

import jakarta.persistence.*;
import com.fasterxml.jackson.annotation.JsonProperty; // Für @JsonProperty

import java.util.HashSet;
import java.util.Set; // Verwende Set statt List für Many-to-Many-ähnliche Beziehungen, da Reihenfolge nicht wichtig ist und Duplikate vermieden werden

@Entity
@Table(name = "benutzer")
public class Benutzer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pnr") // Explizite Spaltenbenennung ist gut
    private Long pnr;

    @Column(name = "enr")
    private Integer enr; // Wrapper-Typ, wenn nullable in DB

    @Column(name = "name")
    private String name;

    @Column(name = "vorname")
    private String vorname;

    @Column(name = "strasse")
    private String strasse;

    @Column(name = "plz")
    private Integer plz; // Wrapper-Typ, wenn nullable in DB

    @Column(name = "ort")
    private String ort;

    @Column(name = "email", unique = true, nullable = false) // email sollte unique und not null sein
    private String email;

    @Column(name = "passwort", nullable = false) // Passwort ist nicht null
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY) // Verhindert, dass das Passwort in JSON-Responses erscheint
    private String passwort; // Korrekte Schreibweise und Mapping

    // Die Many-to-Many-Beziehung wird über die Join-Entität abgebildet
    @OneToMany(mappedBy = "benutzer", cascade = CascadeType.ALL, orphanRemoval = true)
    // cascade = CascadeType.ALL: Operationen auf Benutzer kaskadieren zu Teilnahmen
    // orphanRemoval = true: Entfernt Teilnahmen, wenn sie aus der Sammlung entfernt werden
    private Set<TeilnahmeUebungsdienst> teilnahmenUebungsdienst = new HashSet<>();

    // --- Constructors ---
    public Benutzer() {
    }

    // Konstruktor für die Erstellung eines neuen Benutzer-Objekts (ohne ID)
    public Benutzer(int enr, String name, String vorname, String strasse, Integer plz, String ort, String email, String passwort) {
        this.enr = enr;
        this.name = name;
        this.vorname = vorname;
        this.strasse = strasse;
        this.plz = plz;
        this.ort = ort;
        this.email = email;
        this.passwort = passwort;
    }

    // --- Getter and Setter methods ---
    public Long getPnr() {
        return pnr;
    }

    public void setPnr(Long pnr) {
        this.pnr = pnr;
    }

    public Integer getEnr() {
        return enr;
    }

    public void setEnr(Integer enr) {
        this.enr = enr;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getVorname() {
        return vorname;
    }

    public void setVorname(String vorname) {
        this.vorname = vorname;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasswort() { // Getter für das Passwort
        return passwort;
    }

    public void setPasswort(String passwort) { // Setter für das Passwort
        this.passwort = passwort;
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
        teilnahme.setBenutzer(this);
    }

    public void removeTeilnahmeUebungsdienst(TeilnahmeUebungsdienst teilnahme) {
        this.teilnahmenUebungsdienst.remove(teilnahme);
        teilnahme.setBenutzer(null);
    }
}