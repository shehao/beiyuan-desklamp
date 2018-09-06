package com.beiyuan.pms.api;

import com.alibaba.dubbo.config.annotation.Service;

import com.beiyuan.base.util.serializer.ObjectUtils;
import com.beiyuan.common.api.PageDto;
import com.beiyuan.config.dubbo.DubboConfiguration;
import com.beiyuan.pms.api.BasicDataTypeApiService;
import com.beiyuan.pms.common.WrapperApiService;
import com.beiyuan.pms.dto.BasicDataTypeDto;
import com.beiyuan.pms.entity.basic.BasicDataType;
import com.beiyuan.pms.service.BasicDataTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * Created by leo on 2018/1/15.
 */
@Service(registry = DubboConfiguration.ZOOKEEPER_SERVICE)
public class BasicDataTypeApiServiceImpl implements BasicDataTypeApiService {

    @Autowired
    private BasicDataTypeService basicDataTypeService;

    @Override
    public int saveData(BasicDataTypeDto data) {
        return basicDataTypeService.saveData(ObjectUtils.copyObject(data, BasicDataType.class));
    }

    @Override
    public int deleteData(BasicDataTypeDto data) {
        Assert.isTrue(null != data && StringUtils.hasText(data.getId()), "参数有误");
        return basicDataTypeService.deleteById(Long.valueOf(data.getId()));
    }

    @Override
    public List<BasicDataTypeDto> findList(BasicDataTypeDto params) {
        List<BasicDataType> typeList = basicDataTypeService.findByBiz(ObjectUtils.changeToMap(params));
        if(!CollectionUtils.isEmpty(typeList)){
            return ObjectUtils.copyListObject(typeList,BasicDataTypeDto.class);
        }
        return null;
    }

    @Override
    public BasicDataTypeDto findById(Long id) {
        BasicDataType data = basicDataTypeService.findById(id);
        return ObjectUtils.copyObject(data, BasicDataTypeDto.class);
    }

    @Override
    public PageDto<BasicDataTypeDto> findPage(PageDto<BasicDataTypeDto> page, BasicDataTypeDto params) {
        return WrapperApiService.findByPage(page, params, basicDataTypeService, BasicDataTypeDto.class);
    }
}
