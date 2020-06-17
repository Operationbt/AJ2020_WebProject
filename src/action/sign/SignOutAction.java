package action.sign;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import action.*;

public class SignOutAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession(true);
		
		try {
			session.removeAttribute("userID");
			session.removeAttribute("userPW");
			session.removeAttribute("userAdmin");
			System.out.println("Session Removed");
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
	}
}
