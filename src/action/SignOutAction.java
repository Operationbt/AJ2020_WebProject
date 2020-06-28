package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SignOutAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession(true);
		
		try {
			session.removeAttribute("userID");
			session.removeAttribute("userPW");
			session.removeAttribute("userAdmin");
			session.removeAttribute("status");
			System.out.println("Session Removed");
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
	}
}
