package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProjectDataTableDAO;
import dao.UserDataTableDAO;

import dto.ProjectDataBean;
import dto.UserDataBean;
import jdbc.ConnectionProvider;

import java.sql.Connection;
import java.sql.SQLException;

public class DonateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int newMoney = Integer.parseInt(request.getParameter("donationAmount"));
		int pid = Integer.parseInt(request.getParameter("pid"));
		HttpSession session = request.getSession(true);
		String session_userID = (String)session.getAttribute("userID");
		
		Connection conn=null;
		try{
			conn=ConnectionProvider.getConnection();
			ProjectDataTableDAO dao=ProjectDataTableDAO.getInstance();
			ProjectDataBean pastData=dao.select(conn, pid);
			ProjectDataBean ProjectData=new ProjectDataBean(pastData.getPid(),pastData.getWriter(),pastData.getTitle(),pastData.getDate(),
					pastData.getContent(),pastData.getImageURL(),
					pastData.getDeadline(),pastData.getGoal(),pastData.getCurrent()+newMoney,pastData.getSponsor()+1,pastData.getCategory(),false);
			dao.editCurrent(conn, ProjectData);
			dao.editSponsor(conn, ProjectData);
			
			UserDataTableDAO dao2=UserDataTableDAO.getInstance();
			UserDataBean pastData2=dao2.select(conn, session_userID);
			UserDataBean UserData = new UserDataBean(pastData2.getId(), pastData2.getPassword(), pastData2.getMoney()-newMoney, 
													 pastData2.getScheduledMoney(), pastData2.getIsAdmin(), pastData2.getName(), 
													 pastData2.getEmail(), pastData2.getPhone(), pastData2.getRegisterDate());
			dao2.editMoney(conn, UserData);
			
		}catch(SQLException e){
			e.printStackTrace();
			System.out.print("No connection in DonateAction\n");
		}finally{
			try{
				if(conn !=null) conn.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
	}

}
