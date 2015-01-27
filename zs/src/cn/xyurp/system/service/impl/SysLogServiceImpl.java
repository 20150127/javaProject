package cn.xyurp.system.service.impl;

import cn.xyurp.system.bean.SysLog;
import cn.xyurp.system.dao.CommonDao;
import cn.xyurp.system.service.SysLogService;
import cn.xyurp.system.util.ProjectException;



public class SysLogServiceImpl implements SysLogService {
    private CommonDao commonDao;

    public void setCommonDao(CommonDao commonDao) {
	this.commonDao = commonDao;
    }

    public void add(SysLog sysLog) throws ProjectException {
	commonDao.add(sysLog);
    }

    public void del(String[] ids) throws ProjectException {
	if (ids != null) {
	    for (String string : ids) {
		commonDao.del(commonDao.load(SysLog.class, Long
			.parseLong(string)));
	    }
	}
    }

}
