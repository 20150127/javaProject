package cn.xyurp.zs.service.impl;

import java.util.List;

import cn.xyurp.system.dao.CommonDao;
import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.ZZMM;
import cn.xyurp.zs.service.ZZMMService;

public class ZZMMServiceImpl implements ZZMMService {
    private CommonDao commonDao;

    public void setCommonDao(CommonDao commonDao) {
	this.commonDao = commonDao;
    }
    @SuppressWarnings ("unchecked")
    public List<ZZMM> getAll() throws ProjectException {
	return commonDao.findList("from ZZMM");
    }
	public ZZMM find(int id) throws ProjectException {
		return (ZZMM) commonDao.load(ZZMM.class, id);
	}

}
