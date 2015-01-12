package models;

import java.util.Date;

import javax.persistence.*;

import play.db.ebean.Model;

@Entity
public class Actualizacion extends Model {
	@Id
	Long id;
	String texto;
	@OneToMany
	User usuario;
	Date fecha;
	@ManyToOne
	Peticion peticion;
	
	
}
