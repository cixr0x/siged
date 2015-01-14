package controllers;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import com.avaje.ebean.Ebean;

import models.Actualizacion;
import models.Peticion;
import models.Rol;
import models.User;
import play.*;
import play.data.Form;
import play.data.Form.Field;
import play.db.ebean.Model;
import play.db.ebean.Transactional;
import play.mvc.*;
import play.twirl.api.Html;
import views.html.*;
import views.html.admin.usuarios; 
import views.html.peticiones.*; 
import static play.libs.Json.toJson;


@Transactional
public class Application extends Controller {

	@Security.Authenticated(Secured.class)
    public static Result index() {
		String user =session("username");
		if (user==null)
			login();
        return usuarios();
        
    }
	
	@Security.Authenticated(Secured.class)
    public static Result main(Html content) {
        return ok(index.render(
        		content, 
        		User.find.byId(session("username"))
        		));
        
    }
    
    @Security.Authenticated(Secured.class)
    public static Result crearUsuario() {
    	Form<User>  userForm = Form.form(User.class).bindFromRequest();
    	//if (userForm.hasErrors()) {
    	//	  String errors = userForm.errorsAsJson().textValue();
    	//	  return badRequest(userForm.errorsAsJson());
    	//	}
    	User user = new User();
    	user.apellido = userForm.data().get("apellido");
    	user.correo = userForm.data().get("correo");
    	user.nombre = userForm.data().get("nombre");
    	user.password = userForm.data().get("password");
    	user.username = userForm.data().get("username");
    	for (String key : userForm.data().keySet()){
    		if (key.contains("roles")){
    			user.roles.add(Rol.find.byId(userForm.data().get(key)));
    		}
    	}
    		
    	//user.roles = userForm.data().  .get().roles;
    	user.save();
    	user.saveManyToManyAssociations("roles");
    	
    	return ok();
    }
    
    @Security.Authenticated(Secured.class)
    public static Result editarUsuario() {
    	Form<User>  userForm = Form.form(User.class).bindFromRequest();
    	//if (userForm.hasErrors()) {
    	//	  String errors = userForm.errorsAsJson().textValue();
    	//	  return badRequest(userForm.errorsAsJson());
    	//	}
    	User user = User.find.byId(userForm.data().get("username"));
    	user.apellido = userForm.data().get("apellido");
    	user.correo = userForm.data().get("correo");
    	user.nombre = userForm.data().get("nombre");
    	user.roles.clear();
    	for (String key : userForm.data().keySet()){
    		if (key.contains("roles")){
    			user.roles.add(Rol.find.byId(userForm.data().get(key)));
    		}
    	}
    		
    	//user.roles = userForm.data().  .get().roles;
    	user.save();
    	user.saveManyToManyAssociations("roles");
    	
    	return ok();
    }
    
   @Security.Authenticated(Secured.class)
    public static Result getUsers(){
    	List<User> users = new Model.Finder(String.class, User.class).all();
    	for (User u : users){
    		u.password="";
    	}
    		
    	return ok(toJson(users));
    	
    }

    public static Result login(){
    	return ok(login.render(Form.form(Login.class)));
    }
    
    public static class Login{
    	public String username;
    	public String password;
    	
    	public String validate(){
        	if (User.authenticate(username, password)==null){
        		return "Invalid user or password";
        	}
        	return null;
        }
    }
    public static Result authenticate() {
        Form<Login> loginForm = Form.form(Login.class).bindFromRequest();
        if (loginForm.hasErrors()) {
            return badRequest(login.render(loginForm));
        } else {
            session().clear();
            session("username", loginForm.get().username);
            return redirect(
                routes.Application.index()
            );
        }
    }
    
    public static Result logout() {
        session().clear();
        flash("success", "You've been logged out");
        return redirect(
            routes.Application.login()
        );
    }
    
    @Security.Authenticated(Secured.class)
    public static Result usuarios(){
    	session("currentPage", "usuarios");
    	Html mainContent = usuarios.render(Rol.find.all());
    	return main(mainContent);
    }
    
    @Security.Authenticated(Secured.class)
    public static Result peticiones(){
    	Html mainContent = peticiones.render();
    	return main(mainContent);
    }
    
    @Security.Authenticated(Secured.class)
    public static Result crearPeticion(){
    	Form<Peticion>  form = Form.form(Peticion.class).bindFromRequest();

    	Peticion peticion = new Peticion();
    	peticion.creador = User.find.byId(session("username"));
    	peticion.descripcion = form.data().get("descripcion");
    	peticion.fechacreado = new Date();
    	peticion.fase = "inical";
    	peticion.prioridad =  form.data().get("prioridad");
    	peticion.titulo = form.data().get("titulo");
    	peticion.save();
    	
    	Actualizacion act = new Actualizacion();
    	act.fecha = new Date();
    	act.texto = "La peticion fue creada";
    	act.peticion = peticion;
    	act.usuario = User.find.byId(session("username"));
    	act.save();

    	
    	//
    	return ok();
    }
    
    @Security.Authenticated(Secured.class)
    public static Result crearActualizacion(){
    	Form<Actualizacion>  form = Form.form(Actualizacion.class).bindFromRequest();

    	Actualizacion act = new Actualizacion();
    	act.fecha = new Date();
    	act.texto = form.data().get("texto");
    	act.peticion = Peticion.find.byId(Long.parseLong(form.data().get("peticion_id")));
    	act.usuario = User.find.byId(session("username"));
    	act.save();

    	
    	//
    	return ok();
    }
    
    @Security.Authenticated(Secured.class)
    public static Result getPeticiones(){
    	List<Peticion> peticiones = Ebean.find(Peticion.class)
    			.where()
    				.eq("creador", Ebean.find(User.class, session("username")))
    			.findList();
    		
    	return ok(toJson(peticiones));
    	
    }
    
    

}

