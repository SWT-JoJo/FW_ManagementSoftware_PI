package com.example.PIProjektBackEnd.model;

import jakarta.persistence.*;
import com.example.PIProjektBackEnd.model.IDs.*;

@Entity
@Table(name = "teilnahme_uebungsdienst")
public class TeilnahmeUebungsdienst {

    @EmbeddedId // Markiert, dass die ID eine eingebettete Klasse ist
    private TeilnahmeUebungsdienstId id;

    @ManyToOne // Viele Teilnahmen gehören zu einem Benutzer
    @MapsId("pnr") // Definiert, dass 'pnr' Teil des EmbeddedId ist
    @JoinColumn(name = "pnr", referencedColumnName = "pnr", insertable = false, updatable = false) // Spalte in teilnahme_uebungsdienst, die auf benutzer.pnr verweist
    private Benutzer benutzer;

    @ManyToOne // Viele Teilnahmen gehören zu einem Übungsdienst
    @MapsId("uenr") // Definiert, dass 'uenr' Teil des EmbeddedId ist
    @JoinColumn(name = "uenr", referencedColumnName = "uenr", insertable = false, updatable = false) // Spalte in teilnahme_uebungsdienst, die auf uebungsdienst.uenr verweist
    private Uebungsdienst uebungsdienst;

    // Standardkonstruktor (für JPA benötigt)
    public TeilnahmeUebungsdienst() {
    }

    // Konstruktor zur einfacheren Erstellung
    public TeilnahmeUebungsdienst(Benutzer benutzer, Uebungsdienst uebungsdienst) {
        this.benutzer = benutzer;
        this.uebungsdienst = uebungsdienst;
        this.id = new TeilnahmeUebungsdienstId(benutzer.getPnr(), uebungsdienst.getUenr());
    }

    // --- Getter und Setter ---
    public TeilnahmeUebungsdienstId getId() {
        return id;
    }

    public void setId(TeilnahmeUebungsdienstId id) {
        this.id = id;
    }

    public Benutzer getBenutzer() {
        return benutzer;
    }

    public void setBenutzer(Benutzer benutzer) {
        this.benutzer = benutzer;
    }

    public Uebungsdienst getUebungsdienst() {
        return uebungsdienst;
    }

    public void setUebungsdienst(Uebungsdienst uebungsdienst) {
        this.uebungsdienst = uebungsdienst;
    }
}