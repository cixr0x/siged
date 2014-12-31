package controllers;

import java.util.List;

import models.Person;
import play.*;
import play.data.Form;
import play.data.Form.Field;
import play.db.ebean.Model;
import play.mvc.*;
import views.html.*;
import static play.libs.Json.toJson;

public class Application extends Controller {

    public static Result index() {
        return ok(index.render("Your new application is ready."));
    }
    
    public static Result addPerson(){
    	Form<Person> f  = Form.form(Person.class).bindFromRequest();
    	Person person =f.get();
    	//person.name= f.field("name").value();
    	//person.other= f.field("other").value(); 
    	
    	person.save();
    	return redirect(routes.Application.index());
    }
    
    public static Result getPersons(){
    	List<Person> persons = new Model.Finder(String.class, Person.class).all();
    	return ok(toJson(persons));
    }

}

