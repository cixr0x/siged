package controllers;

import play.*;
import play.mvc.*;
import play.mvc.Http.*;
import models.*;

public class Secured extends Security.Authenticator {

    @Override
    public String getUsername(Context ctx) {
    	
    	User u =User.find.byId(ctx.session().get("username"));
    	if (u!=null)
    		return ctx.session().get("username");
    	return null;
    }
  
    @Override
    public Result onUnauthorized(Context ctx) {
        return redirect(routes.Application.login());
    }
    
    
}