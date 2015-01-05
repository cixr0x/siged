package models;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import play.db.ebean.Model;

@Entity
public class Tarea extends Model {

	@Id
	public Long id;
	public String titulo;
	public boolean terminada=false;
	public Date fechaEntrega;
	@ManyToOne
	public User asignado;
	@ManyToOne
	public Peticion peticion;
	
	
	public static Model.Finder<Long,Tarea> find = new Model.Finder(Long.class, Tarea.class);
	
	 public static List<Tarea> tareasAsignadas(String user) {
	       return find.fetch("peticion").where()
	                .eq("terminada", false)
	                .eq("peticion.participante.username", user)
	           .findList();
	    }

	    public static Tarea create(Tarea tarea, Long peticion, String titulo) {
	        tarea.peticion = Peticion.find.ref(peticion);
	        tarea.titulo=titulo;
	        tarea.save();
	        return tarea;
	    }
}
