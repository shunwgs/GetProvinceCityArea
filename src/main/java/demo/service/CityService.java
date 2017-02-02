package demo.service;


import demo.dao.AreaDao;
import demo.dao.CityDao;
import demo.dao.ProvinceDao;
import demo.model.Area;
import demo.model.City;
import demo.model.Province;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;


/**
 * Created with Intellij IDEA.
 * User: wesley
 * Date: 2015/4/16 
 * Time: 18:03
 * 有关城市区的服务层
 */
@Service
public class CityService {

    @Inject
    private CityDao cityDao;
    @Inject
    private ProvinceDao provinceDao;
    @Inject
    private AreaDao areaDao;

    public List<Province> getAllProvince() {
        return provinceDao.list();
    }

    public List<City> getCityByProvinceId(String id) {
        return cityDao.getCityByProvinceId(id);
    }

    public List<Area> getAreaByCityId(String id) {
        return areaDao.getAreaByCityId(id);
    }
}
