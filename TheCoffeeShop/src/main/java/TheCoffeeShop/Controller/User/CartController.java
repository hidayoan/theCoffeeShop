package TheCoffeeShop.Controller.User;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.jdbc.PreparedStatement.ParseInfo;

import TheCoffeeShop.Dto.CartDto;
import TheCoffeeShop.Entity.Users;
import TheCoffeeShop.Service.User.CartServiceImpl;
import TheCoffeeShop.Service.User.ProductServicesIplement;

@Controller
public class CartController extends BaseController {
	@Autowired
	private CartServiceImpl cartService = new CartServiceImpl();
	
	
	
	@RequestMapping(value="gio-hang")
	public ModelAndView CartView() {
		_mvShare.addObject("sizeProduct",_homeService.GetDataSizeProducts());
		_mvShare.setViewName("user/cart/cart");
		return _mvShare;
	}
	
	@RequestMapping(value="AddCart/{id}")
	public String AddCart(HttpServletRequest request, HttpSession session, @PathVariable long id) {
		HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>) session.getAttribute("ShoppingCart");
		if(cart == null) {
			cart = new HashMap<Long, CartDto>();
		}
		String size = request.getParameter("cartSize");
		cartService.addCart(id, Integer.parseInt(size), cart);
		session.setAttribute("ShoppingCart", cart);
		session.setAttribute("TotalQuantyCart", cartService.totalQuanty(cart));
		session.setAttribute("TotalPriceCart", cartService.totalPrice(cart));
		return "redirect:"+ request.getHeader("referer");
	}
	
	@RequestMapping(value="EditCart/{id}/{quanty}")
	public String EditCart(HttpServletRequest request, HttpSession session, @PathVariable long id, @PathVariable int quanty) {
		HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>) session.getAttribute("ShoppingCart");
		if(cart == null) {
			cart = new HashMap<Long, CartDto>();
		}
		cartService.editCart(id, quanty, cart);
		session.setAttribute("ShoppingCart", cart);
		session.setAttribute("TotalQuantyCart", cartService.totalQuanty(cart));
		session.setAttribute("TotalPriceCart", cartService.totalPrice(cart));
		return "redirect:"+ request.getHeader("referer");
	}
	
	@RequestMapping(value="DeleteCart/{id}")
	public String DeleteCart(HttpServletRequest request, HttpSession session, @PathVariable long id) {
		HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>) session.getAttribute("ShoppingCart");
		if(cart == null) {
			cart = new HashMap<Long, CartDto>();
		}
		cartService.deleteCart(id, cart);
		session.setAttribute("ShoppingCart", cart);
		session.setAttribute("TotalQuantyCart", cartService.totalQuanty(cart));
		session.setAttribute("TotalPriceCart", cartService.totalPrice(cart));
		return "redirect:"+ request.getHeader("referer");
	}
}
