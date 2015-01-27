package cn.xyurp.zs.service.impl;

import java.util.List;

import cn.xyurp.system.dao.CommonDao;
import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.KSLX;
import cn.xyurp.zs.service.KSLXService;

public class KSLXServiceImpl implements KSLXService {
    private CommonDao commonDao;

    public void setCommonDao(CommonDao commonDao) {
	this.commonDao = commonDao;
    }
    @SuppressWarnings ("unchecked")
    public List<KSLX> getAll() throws ProjectException {
	return commonDao.findList("from KSLX");
    }
	public KSLX find(int id) throws ProjectException {
		return (KSLX) commonDao.load(KSLX.class, id);
	}

}
