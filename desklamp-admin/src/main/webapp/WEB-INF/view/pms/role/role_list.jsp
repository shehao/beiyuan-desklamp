<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="/WEB-INF/tld/sys-permission.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<div class="row">
    <div class="col-sm-12">
        <h4 class="pull-left page-title">权限管理</h4>
        <ol class="breadcrumb pull-right">
            <li><a data-target="divload" data-div="baseContainer">权限管理</a></li>
            <li class="active">角色管理</li>
        </ol>
    </div>
</div>

<div class="panel adapt-window-height">
    <div class="panel-body">
        <div class="mt20">
            <div class="m-b-10">
                <form id="paramForm" class="form-inline" tableId="roleTableId" onsubmit="return false;">
                    <label>角色名称：<input name="name" id="name" type="text" class="form-control" placeholder="角色名称"></label>
                    <label>角色类型：
                        <select class="select2 select2-offscreen" id="code" name="code" style="width: 240px;"
                                data-placeholder="请选择" tabindex="" title="">
                            <%--<option value=" ">全部</option>
                            <option value="DEVELOP">开发人员</option>
                            <option value="TEST">测试角色</option>
                            <option value="MANAGE">管理角色</option>
                            <option value="SHOP_OWNER">商户角色</option>
                            <option value="OPERATION">运营人员</option>--%>
                                <option value=" ">全部</option>
                            <c:forEach items="${roleList}" var="item">
                                <option value="${item.code}">${item.name}</option>
                            </c:forEach>
                        </select>
                    </label>
                    <label>状态：
                        <select class="select2 select2-offscreen" id="status" name="status" style="width: 240px;" data-placeholder="请选择" tabindex="" title="">
                            <option value=" ">全部</option>
                            <option value="1">有效</option>
                            <option value="2">无效</option>
                        </select>
                    </label>
                    <div class="form-group fr">
                        <sec:requiredPermission resource="pms:role:edit">
                            <a class="btn btn-primary"  href="${pageContext.request.contextPath}/pms/role/edit" data-toggle="modal" data-target="#base_modal">添加角色</a>
                        </sec:requiredPermission>
                        <button class="btn btn-primary waves-effect searchBtn">查询</button>
                        <button class="btn btn-primary waves-effect clearSearch">清空</button>
                    </div>
                </form>
            </div>
            <table  data-toggle="table"  data-classes="table table-hover"
                    data-pagination="true"
                    data-url="${pageContext.request.contextPath}/pms/role/listData" id="roleTableId"
                    data-side-pagination="server">
                <thead>
                <tr>
                    <th data-field="" data-align="left" data-formatter="operateRender">操作</th>
                    <th data-field="name" data-align="left">角色名称</th>
                    <th data-field="roleType" data-align="left" data-formatter="roleTypeRender">角色类型</th>
                    <th data-field="remark" data-align="left">备注</th>
                    <th data-field="status" data-align="left" data-formatter="statusRenderValid">状态</th>
                    <th data-field="createBy" data-align="left" >创建者</th>
                    <th data-field="createDate" data-align="left"  data-formatter="defaultDateFormatter">创建日期</th>
                    <th data-field="lastUpdateBy" data-align="left" >最后修改人</th>
                    <th data-field="lastUpdateDate" data-align="left"  data-formatter="defaultDateFormatter">最后修改日期</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
<%--权限--%>
<sec:requiredPermission resource="pms:role:edit">
    <input type="hidden" id="editRolePermission" name="editRolePermission" value="">
</sec:requiredPermission>
<sec:requiredPermission resource="pms:role:enable">
    <input type="hidden" id="enableRolePermission" name="enableRolePermission" value="">
</sec:requiredPermission>
<sec:requiredPermission resource="pms:role:resourceSetting">
    <input type="hidden" id="setRolePermission" name="setRolePermission" value="">
</sec:requiredPermission>
<script src="${pageContext.request.contextPath}/assets/js/module/pms/role/role_list.js"></script>
</html>