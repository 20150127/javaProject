package cn.xyurp.zs.service.impl;

import java.util.List;

import cn.xyurp.system.dao.CommonDao;
import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.MZ;
import cn.xyurp.zs.service.MZService;

public class MZServiceImpl implements MZService {
    private CommonDao commonDao;

    public void setCommonDao(CommonDao commonDao) {
	this.commonDao = commonDao;
    }
    @SuppressWarnings ("unchecked")
    public List<MZ> getAll() throws ProjectException {
	return commonDao.findList("from MZ");
    }
	public MZ find(int id) throws ProjectException {
		return (MZ) commonDao.load(MZ.class, id);
	}

}
