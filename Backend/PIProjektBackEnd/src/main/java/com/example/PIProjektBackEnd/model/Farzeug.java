package com.example.PIProjektBackEnd.model;

import jakarta.persistence.*;

import java.time.LocalDate;

@Table(name = "fahrzeug")
@Entity
public class Farzeug {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long fnr;

    private String bezeichnung;
    private LocalDate in_e_dienst;
    private Integer status;

    public Farzeug(String bezeichnung, LocalDate in_e_dienst, Integer status) {
        this.bezeichnung = bezeichnung;
        this.in_e_dienst = in_e_dienst;
        this.status = status;
    }
    public Farzeug() {
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
}
