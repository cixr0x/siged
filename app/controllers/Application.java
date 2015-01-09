package controllers;

import java.util.Collection;
import java.util.List;

import models.Person;
import models.Peticion;
import models.Rol;
import models.Tarea;
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
import static play.libs.Json.toJson;

public class Application extends Controller {

	@Security.Authenticated(Secured.class)
	@Transactional
    public static Result index() {
        return usuarios();
        
    }
	
	@Transactional
    public static Result main(Html content) {
        return ok(index.render(
        		content, 
        		User.find.byId(request().username())
        		));
        
    }
    
    
	
    public static Result addPerson(){
    	Form<Person> f  = Form.form(Person.class).bindFromRequest();
    	Person person =f.get();
    	//person.name= f.field("name").value();
    	//person.other= f.field("other").value(); 
    	
    	person.save();
    	return redirect(routes.Application.index());
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
    
   @Transactional
    public static Result getUsers(){
    	List<User> users = new Model.Finder(String.class, User.class).all();
    	return ok(toJson(users));
    	
    }
    public static Result getPersons(){
    	List<Person> persons = new Model.Finder(String.class, Person.class).all();
    	return ok(toJson(persons));
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
    
    
    
    

}

