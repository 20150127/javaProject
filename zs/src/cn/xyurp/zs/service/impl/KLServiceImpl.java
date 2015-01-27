package cn.xyurp.zs.service.impl;

import java.util.List;

import cn.xyurp.system.dao.CommonDao;
import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.KL;
import cn.xyurp.zs.service.KLService;

public class KLServiceImpl implements KLService {
    private CommonDao commonDao;

    public void setCommonDao(CommonDao commonDao) {
	this.commonDao = commonDao;
    }
    @SuppressWarnings ("unchecked")
    public List<KL> getAll() throws ProjectException {
	return commonDao.findList("from KL");
    }
	public KL find(int id) throws ProjectException {
		return (KL) commonDao.load(KL.class, id);
	}

}
