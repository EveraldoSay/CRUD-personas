package ModeloDAO;

import Config.Conexion;
import Intefaces.CRUD;
import Modelo.Persona;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PersonaDAO implements CRUD {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public List<Persona> listar() {
        ArrayList<Persona> list = new ArrayList<>();
        String sql = "SELECT * FROM persona";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Persona per = new Persona();
                per.setId(rs.getInt("Id"));
                per.setDni(rs.getString("DNI"));
                per.setNom(rs.getString("Nombres"));
                per.setEstado(rs.getInt("Estado")); // Asegúrate de que la columna Estado está en la base de datos
                list.add(per);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Persona list(int id) {
        String sql = "SELECT * FROM persona WHERE Id=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Persona p = new Persona();
                p.setId(rs.getInt("Id"));
                p.setDni(rs.getString("DNI"));
                p.setNom(rs.getString("Nombres"));
                p.setEstado(rs.getInt("Estado")); // Asegúrate de que la columna Estado está en la base de datos
                return p;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean add(Persona per) {
        String sql = "INSERT INTO persona (DNI, Nombres, Estado) VALUES (?, ?, ?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, per.getDni());
            ps.setString(2, per.getNom());
            ps.setInt(3, per.getEstado());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean edit(Persona per) {
        String sql = "UPDATE persona SET DNI=?, Nombres=?, Estado=? WHERE Id=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, per.getDni());
            ps.setString(2, per.getNom());
            ps.setInt(3, per.getEstado());
            ps.setInt(4, per.getId());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "DELETE FROM persona WHERE Id=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
