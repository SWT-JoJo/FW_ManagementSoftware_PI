package com.example.PIProjektBackEnd.model;

import jakarta.persistence.*;

@Entity
@Table(name = "qualifikation")
public class Qualifikation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "qnr")
    private Long qnr; // int AI PK -> Long

    @Column(name = "pnr")
    private Integer pnr; // int (FK) -> Integer

    @Column(name = "bezeichnung")
    private String bezeichnung; // varchar(50) -> String

    // --- Constructors ---
    public Qualifikation() {
    }

    public Qualifikation(Integer pnr, String bezeichnung) {
        this.pnr = pnr;
        this.bezeichnung = bezeichnung;
    }

    // --- Getter and Setter methods ---
    public Long getQnr() {
        return qnr;
    }

    public void setQnr(Long qnr) {
        this.qnr = qnr;
    }

    public Integer getPnr() {
        return pnr;
    }

    public void setPnr(Integer pnr) {
        this.pnr = pnr;
    }

    public String getBezeichnung() {
        return bezeichnung;
    }

    public void setBezeichnung(String bezeichnung) {
        this.bezeichnung = bezeichnung;
    }

    @Override
    public String toString() {
        return "Qualifikation{" +
                "qnr=" + qnr +
                ", pnr=" + pnr +
                ", bezeichnung='" + bezeichnung + '\'' +
                '}';
    }
}