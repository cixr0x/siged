package controllers;

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
import play.mvc.*;
import views.html.*;
import static play.libs.Json.toJson;

public class Application extends Controller {

	@Security.Authenticated(Secured.class)
    public static Result index() {
        return ok(index.render(
        		session("currentPage"),
        		Peticion.find.all(), 
        		Tarea.find.all(), 
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
    
    public static Result crearUsuario() {
    	Form<User> userForm = Form.form(User.class).bindFromRequest();
    	User user = userForm.get();
    	user.save();
    	
    	return ok();
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
    	return index();
    }
    
    
    
    

}

