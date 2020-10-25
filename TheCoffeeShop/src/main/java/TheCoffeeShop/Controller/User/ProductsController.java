package TheCoffeeShop.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import TheCoffeeShop.Service.User.ProductServicesIplement;

@Controller
public class ProductsController extends BaseController{
	
	@Autowired
	ProductServicesIplement _productService;
	
	@RequestMapping(value = {"/san-pham"}, method = RequestMethod.GET)
	public ModelAndView products() {
		_mvShare.addObject("categorys",_homeService.GetDataCategorys());
		_mvShare.addObject("products", _homeService.GetDataProducts());
		_mvShare.addObject("sizeProduct",_homeService.GetDataSizeProducts());
		_mvShare.setViewName("user/products/products");
		return _mvShare;
	}
	
	@RequestMapping(value = {"san-pham/{id}"})
	public ModelAndView product(@PathVariable String id) {
		_mvShare.addObject("categorys",_homeService.GetDataCategorys());
		_mvShare.addObject("randomProducts", _homeService.GetRandomProduct());
		_mvShare.addObject("product", _productService.GetDataProductsById(id));
		_mvShare.addObject("sizeProduct",_homeService.GetDataSizeProducts());
		_mvShare.setViewName("user/products/product");
		return _mvShare;
	}
}
