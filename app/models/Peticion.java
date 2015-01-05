package models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import play.db.ebean.Model;

@Entity
public class Peticion extends Model {
	@Id
	public Long id;
	public String titulo;
	public String descripcion;
	public String fase;
	@ManyToMany
	public List<User> participantes;

	public Peticion(String titulo, String descripcion, User usuario){
		this.titulo=titulo;
		this.descripcion=descripcion;
		this.participantes.add(usuario);
		
	}
	
	public static Model.Finder<Long, Peticion> find = new Model.Finder(Long.class, Peticion.class);
	
	public static Peticion create(String titulo, String descripcion, String usuario){
		Peticion peticion = new Peticion(titulo, descripcion, User.find.ref(usuario));
		peticion.save();
		peticion.saveManyToManyAssociations("participantes");
		return peticion;
	}
	
	public static List<Peticion> peticionesPorUsario(String usuario)
	{
		return find.where().eq("participantes.username", usuario).findList();
	}
	
}
