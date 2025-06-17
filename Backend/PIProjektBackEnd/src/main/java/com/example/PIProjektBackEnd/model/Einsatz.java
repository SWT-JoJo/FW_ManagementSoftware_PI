package com.example.PIProjektBackEnd.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;

import java.time.LocalDateTime;

@Table(name = "einsatz")
@Entity
public class Einsatz {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long enr;

    private boolean e_status;
    private String kategorie;
    private String stichwort;
    private String strasse;
    private int plz;
    private String ort;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime alarmzeitpunkt;

    public Einsatz(boolean e_status, String kategorie, String stichwort, String strasse, int plz, String ort, LocalDateTime alarmzeitpunkt) {
        this.e_status = e_status;
        this.kategorie = kategorie;
        this.stichwort = stichwort;
        this.strasse = strasse;
        this.plz = plz;
        this.ort = ort;
        this.alarmzeitpunkt = alarmzeitpunkt;
    }

    public Einsatz(){

    }

    public long getEnr() {
        return enr;
    }

    public void setEnr(long enr) {
        this.enr = enr;
    }

    public boolean isE_status() {
        return e_status;
    }

    public void setE_status(boolean e_status) {
        this.e_status = e_status;
    }

    public String getKategorie() {
        return kategorie;
    }

    public void setKategorie(String kategorie) {
        this.kategorie = kategorie;
    }

    public String getStichwort() {
        return stichwort;
    }

    public void setStichwort(String stichwort) {
        this.stichwort = stichwort;
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

    public String getOrt() {
        return ort;
    }

    public void setOrt(String ort) {
        this.ort = ort;
    }

    public LocalDateTime getAlarmzeitpunkt() {
        return alarmzeitpunkt;
    }

    public void setAlarmzeitpunkt(LocalDateTime alarmzeitpunkt) {
        this.alarmzeitpunkt = alarmzeitpunkt;
    }
}
