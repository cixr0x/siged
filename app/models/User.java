package models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

import play.db.ebean.Model;
import play.db.ebean.Model.Finder;



@Entity
public class User extends Model {

	@Id
	public String username;
	public String nombre;
	public String apellido;
	@JsonIgnore
	public String password;
	public String correo;
	@ManyToMany
	public List<Rol> roles;
	
	
	public User()
	{
		
	}
	public User(String username, String nombre, String apellido, String password, String correo){
		this.username=username;
		this.nombre=nombre;
		this.apellido=apellido;
		this.password=password;
		this.correo=correo;
		
		
	}
	
	public static Finder<String, User> find = new Finder<String, User>(String.class, User.class);
	
	public static User authenticate(String username, String password) {
        return find.where().eq("username", username)
            .eq("password", password).findUnique();
    }
	
	public boolean tieneRol(String role){
		
		for (Rol r : roles){
			if (role.equals(r.codigo))
				return true;
		}
		
		return false;
	}
	
}
