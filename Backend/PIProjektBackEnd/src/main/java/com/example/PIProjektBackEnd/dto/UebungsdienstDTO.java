package com.example.PIProjektBackEnd.dto;

import com.example.PIProjektBackEnd.model.Benutzer;
import com.example.PIProjektBackEnd.model.Uebungsdienst;

import java.time.LocalDateTime;

public class UebungsdienstDTO {
    private long unr;
    private String verantwortlicher;
    private String thema;
    private String ort;
    private String strasse;
    private int plz;
    private LocalDateTime start;
    private LocalDateTime ende;

    public UebungsdienstDTO(Uebungsdienst uebungsdienst) {
        this.unr = uebungsdienst.getUenr();
        if (uebungsdienst.getVerantwortlich() != null) {
            this.verantwortlicher = uebungsdienst.getVerantwortlich().getName();
        } else {
            this.verantwortlicher = "Unbekannt"; // Oder "" oder null je nach Wunsch
        }
        this.thema = uebungsdienst.getThema();
        this.ort = uebungsdienst.getOrt();
        this.strasse = uebungsdienst.getStrasse();
        this.plz = uebungsdienst.getPlz();
        this.start = uebungsdienst.getStart();
        this.ende = uebungsdienst.getEnde();
    }


    public long getUnr() {
        return unr;
    }

    public void setUnr(long unr) {
        this.unr = unr;
    }

    public String getVerantwortlicher() {
        return verantwortlicher;
    }

    public void setVerantwortlicher(String verantwortlicher) {
        this.verantwortlicher = verantwortlicher;
    }

    public String getThema() {
        return thema;
    }

    public void setThema(String thema) {
        this.thema = thema;
    }

    public String getOrt() {
        return ort;
    }

    public void setOrt(String ort) {
        this.ort = ort;
    }

    public String getStrasse() {
        return strasse;
    }

    public void setStrasse(String strasse) {
        this.strasse = strasse;
    }

    public int getPlz() {
        return plz;
    }

    public void setPlz(int plz) {
        this.plz = plz;
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
}
