package com.example.produkty;

import javax.persistence.*;

@Entity
@Table(name="shop")
public class Shop {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String kategoria;
    private String nazwa;
    private String kraj_pochodzenia;
    private float cena;
    private boolean dostepnosc;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getKategoria() {
        return kategoria;
    }

    public void setKategoria(String kategoria) {
        this.kategoria = kategoria;
    }

    public String getNazwa() {
        return nazwa;
    }

    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }

    public String getKraj_pochodzenia() {
        return kraj_pochodzenia;
    }

    public void setKraj_pochodzenia(String kraj_pochodzenia) {
        this.kraj_pochodzenia = kraj_pochodzenia;
    }

    public float getCena() {
        return cena;
    }

    public void setCena(float cena) {
        this.cena = cena;
    }

    public boolean isDostepnosc() {
        return dostepnosc;
    }

    public void setDostepnosc(boolean dostepnosc) {
        this.dostepnosc = dostepnosc;
    }
}
