package demo.dao;


import demo.model.Area;

import java.util.List;
/**
 * Created with Intellij IDEA.
 * User: wesley
 * Date: 2015/4/16
 * Time: 18:02
 */
public interface AreaDao extends BaseDao<Area>{

    public List<Area> getAreaByCityId(String id);
}