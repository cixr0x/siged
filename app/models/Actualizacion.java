package models;

import java.util.Date;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import play.db.ebean.Model;

@Entity
public class Actualizacion extends Model {
	@Id
	public Long id;
	public String texto;
	@OneToMany
	public User usuario;
	public Date fecha;
	@JsonIgnore
	@ManyToOne
	public Peticion peticion;
	
	
}
