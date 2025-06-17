package com.example.PIProjektBackEnd.model;

import jakarta.persistence.*;

import java.time.LocalDate;

@Table(name = "fahrzeug")
@Entity
public class Fahrzeug {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long fnr;

    private String bezeichnung;
    private String funkbez;
    private LocalDate in_e_dienst;
    private Integer status;

    public Fahrzeug(String funkbez,String bezeichnung, LocalDate in_e_dienst, Integer status) {
        this.bezeichnung = bezeichnung;
        this.in_e_dienst = in_e_dienst;
        this.status = status;
        this.funkbez = funkbez;
    }
    public Fahrzeug() {
    }

    public Long getFnr() {
        return fnr;
    }

    public void setFnr(Long fnr) {
        this.fnr = fnr;
    }

    public String getBezeichnung() {
        return bezeichnung;
    }

    public void setBezeichnung(String bezeichnung) {
        this.bezeichnung = bezeichnung;
    }

    public LocalDate getIn_e_dienst() {
        return in_e_dienst;
    }

    public void setIn_e_dienst(LocalDate in_e_dienst) {
        this.in_e_dienst = in_e_dienst;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getFunkbez() {
        return funkbez;
    }

    public void setFunkbez(String funkbez) {
        this.funkbez = funkbez;
    }
}
