package com.example.demo.domaine;
import com.example.demo.domaine.Terrain;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class User 
{
    @GeneratedValue

    int idUser;
    String pseudo;
    String password;
    String email;
    Terrain[] terrain;

    public User(){}

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Terrain[] getTerrain() {
        return terrain;
    }

    public void setTerrain(Terrain[] terrain) {
        this.terrain = terrain;
    }

}
