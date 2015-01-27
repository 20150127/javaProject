package cn.xyurp.zs.service.impl;

import java.util.List;

import cn.xyurp.system.dao.CommonDao;
import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.DQ;
import cn.xyurp.zs.service.DQService;

public class DQServiceImpl implements DQService {
    private CommonDao commonDao;

    public void setCommonDao(CommonDao commonDao) {
	this.commonDao = commonDao;
    }
    @SuppressWarnings ("unchecked")
    public List<DQ> getAll() throws ProjectException {
	return commonDao.findList("from DQ");
    }
	public DQ find(int id) throws ProjectException {
		return (DQ) commonDao.load(DQ.class, id);
	}

}
