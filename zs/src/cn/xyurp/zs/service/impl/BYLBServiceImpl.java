package cn.xyurp.zs.service.impl;

import java.util.List;

import cn.xyurp.system.dao.CommonDao;
import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.BYLB;
import cn.xyurp.zs.service.BYLBService;

public class BYLBServiceImpl implements BYLBService {
    private CommonDao commonDao;

    public void setCommonDao(CommonDao commonDao) {
	this.commonDao = commonDao;
    }

    @SuppressWarnings("unchecked")
    public List<BYLB> getAll() throws ProjectException {
	return commonDao.findList("from BYLB");
    }

	public BYLB find(int id) throws ProjectException {
		return (BYLB) commonDao.load(BYLB.class, id);
	}

}
