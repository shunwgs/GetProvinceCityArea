package demo.dao;

import demo.model.City;

import java.util.List;

/**
 * Created with Intellij IDEA.
 * User: wesley
 * Date: 2015/4/16
 * Time: 18:02
 */

public interface CityDao extends BaseDao<City>{
    public List<City> getCityByProvinceId(String id);
}