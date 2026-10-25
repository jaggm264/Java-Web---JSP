/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author bbsot
 */
import java.util.ArrayList;

public class gestionarGrupo {

    private ArrayList<Grupo> listaGrupos;
    private int contadorIdGrupo;

    public gestionarGrupo() {
        this.listaGrupos = new ArrayList<>();
        this.contadorIdGrupo = 0;
    }

    public boolean existeNombreGrupo(String nombreGrupo) {
        if (nombreGrupo == null) return false;
        for (Grupo g : listaGrupos) {
            if (g.getNombreGrupo().equalsIgnoreCase(nombreGrupo.trim())) {
                return true;
            }
        }
        return false;
    }

    public boolean existeNombreGrupoExcluding(String nombreGrupo, int idExcluir) {
        if (nombreGrupo == null) return false;
        for (Grupo g : listaGrupos) {
            if (g.getIdGrupo() != idExcluir && g.getNombreGrupo().equalsIgnoreCase(nombreGrupo.trim())) {
                return true;
            }
        }
        return false;
    }

    public ArrayList<Grupo> buscarGrupos(String filtro) {
        ArrayList<Grupo> resultados = new ArrayList<>();
        if (filtro == null || filtro.trim().isEmpty()) {
            return listaGrupos;
        }
        String filtroLower = filtro.toLowerCase().trim();
        for (Grupo g : listaGrupos) {
            if (g.getNombreGrupo().toLowerCase().contains(filtroLower) ||
                (g.getNombreDocente() != null && g.getNombreDocente().toLowerCase().contains(filtroLower))) {
                resultados.add(g);
            }
        }
        return resultados;
    }

    public void crearGrupo(String nombreGrupo) {
        contadorIdGrupo++;
        Grupo nuevoGrupo = new Grupo(contadorIdGrupo, nombreGrupo);
        listaGrupos.add(nuevoGrupo);
    }

    public ArrayList<Grupo> obtenerTodosLosGrupos() {
        return listaGrupos;
    }

    public Grupo buscarGrupoPorId(int id) {
        for (Grupo grupo : listaGrupos) {
            if (grupo.getIdGrupo() == id) {
                return grupo;
            }
        }
        return null;
    }

    public boolean actualizarNombreGrupo(int id, String nuevoNombre) {
        Grupo grupo = buscarGrupoPorId(id);
        if (grupo != null) {
            grupo.setNombreGrupo(nuevoNombre);
            return true;
        }
        return false;
    }

    public boolean asignarIntegrantes(int id, String int1, String int2, String int3, String int4, String docente) {
        Grupo grupo = buscarGrupoPorId(id);
        if (grupo != null) {
            grupo.setIntegrante1(int1 != null ? int1 : "");
            grupo.setIntegrante2(int2 != null ? int2 : "");
            grupo.setIntegrante3(int3 != null ? int3 : "");
            grupo.setIntegrante4(int4 != null ? int4 : "");
            grupo.setNombreDocente(docente != null ? docente : "");
            return true;
        }
        return false;
    }

    public boolean eliminarGrupo(int id) {
        Grupo grupo = buscarGrupoPorId(id);
        if (grupo != null) {
            listaGrupos.remove(grupo);
            return true;
        }
        return false;
    }
}