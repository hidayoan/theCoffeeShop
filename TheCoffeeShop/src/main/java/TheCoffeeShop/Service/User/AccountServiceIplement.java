package TheCoffeeShop.Service.User;

import java.util.List;


import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import TheCoffeeShop.Dao.UsersDao;
import TheCoffeeShop.Entity.Users;
@Service
public class AccountServiceIplement implements IAccountService {
	
	@Autowired
	UsersDao usersDao = new UsersDao();
	
	
	
	public int addAccount(Users user) {

		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));

		return usersDao.addAccount(user);
	}



	@Override
	public List<Users> GetDataUsers() {
		
		return usersDao.GetDataUsers();
	}



	@Autowired
	UsersDao usersDao1 = new UsersDao();
	public boolean checkAccount(Users user) {
		String pass = user.getPassword();
		user = usersDao1.getUserByAcc(user);
		if(user != null) {
			if(BCrypt.checkpw(pass, user.getPassword())) {
				return true;
			}
			else {
				return false;
			}
		}
		return false;
	}
	
	
}
	