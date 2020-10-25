package TheCoffeeShop.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController extends BaseController {
	
	
	@RequestMapping(value = {"/", "/trang-chu"}, method = RequestMethod.GET)
	public ModelAndView Index() {
		_mvShare.addObject("categorys",_homeService.GetDataCategorys());
		_mvShare.addObject("products", _homeService.GetDataProducts());
		_mvShare.addObject("sizeProduct",_homeService.GetDataSizeProducts());
		_mvShare.addObject("randomProducts", _homeService.GetRandomProduct());
		_mvShare.setViewName("user/index");
		return _mvShare;
	}
}
