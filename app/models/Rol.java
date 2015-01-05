package models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import play.db.ebean.Model;
import play.db.ebean.Model.Finder;

@Entity
public class Rol extends Model {

	@Id
	public String codigo;
	public String nombre;
	
	
	public Rol(String codigo, String nombre)
	{
		this.codigo=codigo;
		this.nombre=nombre;
	}
	
	public static Finder<String, Rol> find = new Finder<String, Rol>(String.class, Rol.class);
	
	
}
