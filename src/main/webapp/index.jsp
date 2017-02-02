<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/inc.jsp" %>
<script type="text/javascript">
    /*页面加载就开始执行*/
    $(document).ready(function () {
        $("#provinceId").change(function () {
            $.get("getCityByProvinceId/"+$("#provinceId").val(),function(data){
                if(data.status){
                    var result = "<option>选择城市</option>";
                    $.each(data.obj,function(n,value){
                        result +="<option value='"+value.cityid+"'>"+value.city+"</option>";
                    });
                    $("#cityId").html('');
                    $("#cityId").append(result);
                }
            },"json");
        });

        $("#cityId").change(function () {
            $.get("getAreaByCityId/"+$("#cityId").val(),function(data){
                if(data.status){
                    var result = "<option>选择区域</option>";
                    $.each(data.obj,function(n,value){
                        result +="<option value='"+value.areaid+"'>"+value.area+"</option>";
                    });
                    $("#areaId").html('');
                    $("#areaId").append(result);
                }
            },"json");
        });
    });
</script>
<div class="row">
    <div class="box col-md-12">
        <div class="box-inner">
            <div class="box-header well" data-original-title="">
                <h2><i class="glyphicon glyphicon-edit"></i>添加学校</h2>

                <div class="box-icon">
                    <a href="#" class="btn btn-setting btn-round btn-default"><i
                            class="glyphicon glyphicon-cog"></i></a>
                    <a href="#" class="btn btn-minimize btn-round btn-default"><i
                            class="glyphicon glyphicon-chevron-up"></i></a>
                    <a href="#" class="btn btn-close btn-round btn-default"><i
                            class="glyphicon glyphicon-remove"></i></a>
                </div>
            </div>
            <div class="box-content">
                <form role="form" action="<%=request.getContextPath()%>/admin/schoolAdd" method="post">
                    <div class="form-group has-success col-md-4">
                        <label for="provinceId">选择省份:</label>
                        <select data-placeholder="省份" id="provinceId" name="province" class="form-control"
                                data-rel="chosen">
                            <c:if test="${!empty provinceList}">
                                <c:forEach items="${provinceList}" var="province">
                                    <option value="${province.provinceid}">${province.province}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                    <div class="form-group has-success col-md-4">
                        <label for="cityId">选择城市:</label>
                        <select data-placeholder="城市" name="city" id="cityId" class="form-control" data-rel="chosen">
                            <option>选择城市</option>
                        </select>
                    </div>
                    <div class="form-group has-success col-md-4" >
                        <label for="areaId">选择区域:</label>
                        <select data-placeholder="区域" name="area" id="areaId" class="form-control" data-rel="chosen">
                            <option>选择区域</option>
                        </select>
                    </div>
                    <div class="form-group has-success col-md-4">
                        <label for="name">学校名:</label>
                        <input type="text" name="name" class="form-control" id="name" placeholder="学校名">
                    </div>
                    <div class="form-group has-success col-md-4">
                        <label for="address">学校详细地址:</label>
                        <input type="text" name="address" class="form-control" id="address" placeholder="学校地址">
                    </div>
                    <div class="form-group has-success col-md-4">
                        <label for="phone">学校联系电话:</label>
                        <input type="text" name="phone" class="form-control" id="phone" placeholder="学校电话">
                    </div>
                    <div class="form-group has-success col-md-12">
                        <label for="describe">学校简介</label>
                        <textarea class="form-control" rows="3" id="describe" name="description"
                                  placeholder="请输入。。。。"></textarea>
                    </div>
                    <button type="submit" class="btn btn-success">添加</button>
                </form>

            </div>
        </div>
    </div>
    <!--/span-->

</div>
<!--/row-->
