package demo.controller;

import demo.model.Area;
import demo.model.City;
import demo.service.CityService;
import demo.util.Json;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import java.util.List;

/**
 * Created with Intellij IDEA.
 * User: wesley
 * Date: 2015/4/16
 * Time: 18:05
 */
@Controller
public class DemoController {

    @Inject
    private CityService cityService;

    /**
     * 首先获取全部的省份
     * @param map
     * @return
     */
    @RequestMapping(value="/index")
    public String allProvince(ModelMap map){
        map.addAttribute("provinceList", cityService.getAllProvince());
        return "index";
    }

    /**
     * 根据省份获取城市
     * @param id
     * @return
     */
    @RequestMapping(value = "/getCityByProvinceId/{id}")
    @ResponseBody
    public Json getCityByProvinceId(@PathVariable("id") String id){
        List<City> cityList = cityService.getCityByProvinceId(id);
        if (cityList!=null){
            return new Json(true,"success",cityList);
        } else {
            return new Json(false,"fail",null);
        }
    }

    /**
     * 根据城市获取区域
     * @param id
     * @return
     */
    @RequestMapping(value = "/getAreaByCityId/{id}")
    @ResponseBody
    public Json getAreaByCityId(@PathVariable("id") String id){
        List<Area> areaList = cityService.getAreaByCityId(id);
        if (areaList!=null){
            return new Json(true,"success",areaList);
        } else {
            return new Json(false,"fail",null);
        }
    }
}
