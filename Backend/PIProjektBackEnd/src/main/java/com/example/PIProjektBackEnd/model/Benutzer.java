package com.example.PIProjektBackEnd.model;

import com.fasterxml.jackson.annotation.JsonManagedReference;
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

    @Column(name ="isAdmin")
    private boolean isAdmin;

    @Column(name = "passwort", nullable = false) // Passwort ist nicht null
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY) // Verhindert, dass das Passwort in JSON-Responses erscheint
    private String passwort; // Korrekte Schreibweise und Mapping

    @ManyToMany
    @JoinTable(
            name = "teilnahme_uebungsdienst",
            joinColumns = @JoinColumn(name = "pnr"),
            inverseJoinColumns = @JoinColumn(name = "uenr")
    )
    @JsonManagedReference
    private Set<Uebungsdienst>  uebungsdienste= new HashSet<>();


    @ManyToMany
    @JoinTable(
            name = "benutzer_qualifikationen",
            joinColumns = @JoinColumn(name = "pnr"),
            inverseJoinColumns = @JoinColumn(name = "qnr")
    )
    @JsonManagedReference
    private Set<Qualifikation> qualifikationen = new HashSet<>();

    @ManyToMany
    @JoinTable(
            name = "teilnahme_lehrgang",
            joinColumns = @JoinColumn(name = "pnr"),
            inverseJoinColumns = @JoinColumn(name = "lnr")
    )
    @JsonManagedReference
    private Set<Lehrgang> lehrgaenge = new HashSet<>();

    public Benutzer() {
    }

    public Benutzer(Integer enr, String name, String vorname, String strasse, Integer plz, String ort, String email, String passwort, Set<Qualifikation> qualifikationen, Set<Lehrgang> lehrgaenge) {
        this.enr = enr;
        this.name = name;
        this.vorname = vorname;
        this.strasse = strasse;
        this.plz = plz;
        this.ort = ort;
        this.email = email;
        this.passwort = passwort;
        this.qualifikationen = qualifikationen;
        this.lehrgaenge = lehrgaenge;
    }

    public Set<Lehrgang> getLehrgaenge() {
        return lehrgaenge;
    }

    public void setLehrgaenge(Set<Lehrgang> lehrgaenge) {
        this.lehrgaenge = lehrgaenge;
    }

    public Set<Qualifikation> getQualifikationen() {
        return qualifikationen;
    }

    public void setQualifikationen(Set<Qualifikation> qualifikationen) {
        this.qualifikationen = qualifikationen;
    }

    public String getPasswort() {
        return passwort;
    }

    public void setPasswort(String passwort) {
        this.passwort = passwort;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getOrt() {
        return ort;
    }

    public void setOrt(String ort) {
        this.ort = ort;
    }

    public Integer getPlz() {
        return plz;
    }

    public void setPlz(Integer plz) {
        this.plz = plz;
    }

    public String getStrasse() {
        return strasse;
    }

    public void setStrasse(String strasse) {
        this.strasse = strasse;
    }

    public String getVorname() {
        return vorname;
    }

    public void setVorname(String vorname) {
        this.vorname = vorname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getEnr() {
        return enr;
    }

    public void setEnr(Integer enr) {
        this.enr = enr;
    }

    public Long getPnr() {
        return pnr;
    }

    public void setPnr(Long pnr) {
        this.pnr = pnr;
    }
}
