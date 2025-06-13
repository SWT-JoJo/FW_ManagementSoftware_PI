package com.example.PIProjektBackEnd.model;

import jakarta.persistence.*;

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

    public Einsatz(boolean e_status, String kategorie, String stichwort, String strasse, int plz, String ort) {
        this.e_status = e_status;
        this.kategorie = kategorie;
        this.stichwort = stichwort;
        this.strasse = strasse;
        this.plz = plz;
        this.ort = ort;
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
}
