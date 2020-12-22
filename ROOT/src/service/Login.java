package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Login {
	public void doLogin(HttpServletRequest request, HttpServletResponse response) throws IOException;
}
