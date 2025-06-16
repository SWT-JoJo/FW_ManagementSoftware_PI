package com.example.PIProjektBackEnd.model;

import com.fasterxml.jackson.annotation.JsonManagedReference; // Wird eventuell nicht mehr benötigt für diese Felder
import com.fasterxml.jackson.annotation.JsonIgnore; // NEU: Importiere JsonIgnore
import jakarta.persistence.*;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "benutzer")
public class Benutzer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pnr")
    private Long pnr;

    @Column(name = "enr")
    private Integer enr;

    @Column(name = "name")
    private String name;

    @Column(name = "vorname")
    private String vorname;

    @Column(name = "strasse")
    private String strasse;

    @Column(name = "plz")
    private Integer plz;

    @Column(name = "ort")
    private String ort;

    @Column(name = "email", unique = true, nullable = false)
    private String email;

    @Column(name ="isAdmin")
    private boolean isAdmin; // boolean ist ok, wenn es nie null sein soll.

    @Column(name = "passwort", nullable = false)
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY) // Verhindert, dass das Passwort in JSON-Responses erscheint
    private String passwort;

    // FÜGE @JsonIgnore HINZU FÜR FELDER, DIE NICHT ÜBER DEN REQUEST-BODY KOMMEN SOLLEN
    @ManyToMany
    @JoinTable(
            name = "teilnahme_uebungsdienst",
            joinColumns = @JoinColumn(name = "pnr"),
            inverseJoinColumns = @JoinColumn(name = "uenr")
    )
    @JsonIgnore // <-- Hinzugefügt! Jackson ignoriert dieses Feld beim Deserialisieren (und Serialisieren)
    private Set<Uebungsdienst>  uebungsdienste= new HashSet<>();


    @ManyToMany
    @JoinTable(
            name = "benutzer_qualifikationen",
            joinColumns = @JoinColumn(name = "pnr"),
            inverseJoinColumns = @JoinColumn(name = "qnr")
    )
    @JsonIgnore // <-- Hinzugefügt!
    private Set<Qualifikation> qualifikationen = new HashSet<>();

    @ManyToMany
    @JoinTable(
            name = "teilnahme_lehrgang",
            joinColumns = @JoinColumn(name = "pnr"),
            inverseJoinColumns = @JoinColumn(name = "lnr")
    )
    @JsonIgnore // <-- Hinzugefügt!
    private Set<Lehrgang> lehrgaenge = new HashSet<>();

    public Benutzer() {
    }

    // ACHTUNG: Dein Konstruktor akzeptiert Set<Qualifikation> und Set<Lehrgang>
    // Wenn du @JsonIgnore verwendest, werden diese Felder nicht automatisch
    // vom JSON-Body gefüllt. Das ist auch in Ordnung, da du sie beim Erstellen
    // eines Benutzers sowieso nicht übergeben möchtest.
    public Benutzer(Integer enr, String name, String vorname, String strasse, Integer plz, String ort, String email, String passwort, Set<Qualifikation> qualifikationen, Set<Lehrgang> lehrgaenge) {
        this.enr = enr;
        this.name = name;
        this.vorname = vorname;
        this.strasse = strasse;
        this.plz = plz;
        this.ort = ort;
        this.email = email;
        this.passwort = passwort;
        // Diese Zuweisungen werden bei @RequestBody-Deserialisierung ignoriert,
        // wenn @JsonIgnore auf den Feldern ist.
        // Sie sind nur relevant, wenn du Benutzer-Objekte manuell erstellst oder
        // aus der Datenbank lädst.
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

    public Set<Uebungsdienst> getUebungsdienste() { // Getter für uebungsdienste fehlt im Originalcode, sollte hinzugefügt werden
        return uebungsdienste;
    }

    public void setUebungsdienste(Set<Uebungsdienst> uebungsdienste) { // Setter für uebungsdienste fehlt
        this.uebungsdienste = uebungsdienste;
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

    public boolean isAdmin() { // Getter für isAdmin
        return isAdmin;
    }

    public void setAdmin(boolean admin) { // Setter für isAdmin
        isAdmin = admin;
    }
}