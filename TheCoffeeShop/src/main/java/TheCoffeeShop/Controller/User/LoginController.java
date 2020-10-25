package TheCoffeeShop.Controller.User;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import TheCoffeeShop.Dao.UsersDao;
import TheCoffeeShop.Entity.Users;
import TheCoffeeShop.Service.User.AccountServiceIplement;

@Controller
public class LoginController extends BaseController {
	
	@Autowired
	AccountServiceIplement _AccountService = new AccountServiceIplement();
	@Autowired
	UsersDao usersDao = new UsersDao();


	@RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
	public ModelAndView Register() {
		_mvShare.setViewName("user/login/register");
		_mvShare.addObject("listUsers", _AccountService.GetDataUsers());
		_mvShare.addObject("user", new Users());
		return _mvShare;
	}
	
	@RequestMapping(value = "/dang-ky", method = RequestMethod.POST)
	public ModelAndView CreatAccount(@ModelAttribute("user") Users user) {
		int count = _AccountService.addAccount(user);
		if(count > 0) {
			_mvShare.addObject("status", "Đăng Ký Tài Khỏan Thành Công");
		}
		else {
			_mvShare.addObject("status", "Đăng Ký Tài Khỏan Thất Bại");
		}
		
		_mvShare.setViewName("user/login/register");
		return _mvShare;
	}
	
	@RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
	public ModelAndView Login() {
		_mvShare.setViewName("user/login/login");
		_mvShare.addObject("listUsers", _AccountService.GetDataUsers());
		_mvShare.addObject("user", new Users());
		return _mvShare;
	}
	
	@RequestMapping(value = "/dang-nhap", method = RequestMethod.POST)
	public ModelAndView ConfirmLogin(@ModelAttribute("user") Users user, HttpSession session) {
		//user = (Users) session.getAttribute("userSession");
		boolean check = _AccountService.checkAccount(user);
		if(check) {
			_mvShare.addObject("statusLogin", "Đăng Nhập Tài Khỏan Thành Công");
			user = usersDao.getUserByAcc(user);
			session.setAttribute("userSession", user);
		}
		else {
			_mvShare.addObject("statusLogin", "Đăng Nhập Tài Khỏan Thất Bại");
		}
		_mvShare.setViewName("user/login/login");
		
		return _mvShare;
	}
	
	@RequestMapping(value = "/user/{id}")
	public ModelAndView UserInfo(@PathVariable String id) {
		_mvShare.setViewName("/user/login/userInfo");
		return _mvShare;
	}
	
}
