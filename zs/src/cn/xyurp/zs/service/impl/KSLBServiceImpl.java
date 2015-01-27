package cn.xyurp.zs.service.impl;

import java.util.List;

import cn.xyurp.system.dao.CommonDao;
import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.KSLB;
import cn.xyurp.zs.service.KSLBService;

public class KSLBServiceImpl implements KSLBService {
    private CommonDao commonDao;

    public void setCommonDao(CommonDao commonDao) {
	this.commonDao = commonDao;
    }
    @SuppressWarnings ("unchecked")
    public List<KSLB> getAll() throws ProjectException {
	return commonDao.findList("from KSLB");
    }
	public KSLB find(int id) throws ProjectException {
		return (KSLB) commonDao.load(KSLB.class, id);
	}

}
