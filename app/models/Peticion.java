package models;

import java.util.Date;
import java.util.List;

import javax.persistence.*;

import play.db.ebean.Model;

@Entity
public class Peticion extends Model {
	@Id
	public Long id;
	public String titulo;
	public String descripcion;
	public String fase;
	@ManyToOne
	public User creador;
	@ManyToOne
	public User responsable;
	public Date fechacreado;
	public Date fechaasignado;
	public Date fechacerrado;
	public String prioridad;
	@OneToMany
	public List<Actualizacion> proceso;

	public Peticion(String titulo, String descripcion, User usuario){
		this.titulo=titulo;
		this.descripcion=descripcion;
		this.creador = usuario;
		this.fechacreado=new Date();
		//this.participantes.add(usuario);
		
	}
	
	public Peticion(){};
	
	public static Model.Finder<Long, Peticion> find = new Model.Finder(Long.class, Peticion.class);
	

	public static List<Peticion> peticionesPorUsario(String usuario)
	{
		return find.where().eq("participantes.username", usuario).findList();
	}
	
}
