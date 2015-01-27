package cn.xyurp.zs.service.impl;

import java.util.List;

import cn.xyurp.system.dao.CommonDao;
import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.XB;
import cn.xyurp.zs.service.XBService;

public class XBServiceImpl implements XBService {
    private CommonDao commonDao;

    public void setCommonDao(CommonDao commonDao) {
	this.commonDao = commonDao;
    }
    @SuppressWarnings ("unchecked")
    public List<XB> getAll() throws ProjectException {
	return commonDao.findList("from XB");
    }
	public XB find(int id) throws ProjectException {
		return (XB) commonDao.load(XB.class, id);
	}

}
