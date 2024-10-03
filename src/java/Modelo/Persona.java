package Modelo;

public class Persona {
    private int id;
    private String dni;
    private String nom;
    private int estado; // Agregado para manejar el estado

    public Persona() {
    }

    public Persona(String dni, String nom, int estado) {
        this.dni = dni;
        this.nom = nom;
        this.estado = estado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
}
