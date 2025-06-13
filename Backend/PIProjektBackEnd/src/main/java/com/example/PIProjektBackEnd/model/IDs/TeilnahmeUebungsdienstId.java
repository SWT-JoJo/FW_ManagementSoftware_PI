package com.example.PIProjektBackEnd.model.IDs;

import jakarta.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class TeilnahmeUebungsdienstId implements Serializable {

    private Long pnr; // Entspricht Benutzer.pnr
    private Long uenr; // Entspricht Uebungsdienst.uenr

    public TeilnahmeUebungsdienstId() {
    }

    public TeilnahmeUebungsdienstId(Long pnr, Long uenr) {
        this.pnr = pnr;
        this.uenr = uenr;
    }

    // --- Getter und Setter ---
    public Long getPnr() {
        return pnr;
    }

    public void setPnr(Long pnr) {
        this.pnr = pnr;
    }

    public Long getUenr() {
        return uenr;
    }

    public void setUenr(Long uenr) {
        this.uenr = uenr;
    }

    // --- equals() und hashCode() MÜSSEN für zusammengesetzte IDs korrekt implementiert werden! ---
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TeilnahmeUebungsdienstId that = (TeilnahmeUebungsdienstId) o;
        return Objects.equals(pnr, that.pnr) &&
                Objects.equals(uenr, that.uenr);
    }

    @Override
    public int hashCode() {
        return Objects.hash(pnr, uenr);
    }
}