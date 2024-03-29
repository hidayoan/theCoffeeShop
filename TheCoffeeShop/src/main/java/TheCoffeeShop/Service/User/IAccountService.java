package TheCoffeeShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import TheCoffeeShop.Entity.Users;
@Service
public interface IAccountService {

	@Autowired
	public List<Users> GetDataUsers();

	@Autowired
	public int addAccount(Users user);
	
	@Autowired
	public boolean checkAccount(Users user);
}
