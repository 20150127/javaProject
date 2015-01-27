package cn.xyurp.system.service.impl;

import java.util.List;

import cn.xyurp.system.bean.SysModule;
import cn.xyurp.system.dao.SysModuleDao;
import cn.xyurp.system.service.SysModuleService;
import cn.xyurp.system.util.ProjectException;

/**
 * @author lichao
 * @time Nov 2, 2009 11:12:03 AM
 * @description 模块管理业务逻辑层实
 * 
 */
public class SysModuleServiceImpl implements SysModuleService {
    private SysModuleDao sysModuleDao;

    public void setSysModuleDao(SysModuleDao sysModuleDao) {
	this.sysModuleDao = sysModuleDao;
    }

    public void addModule(SysModule sysModule, int parentId) {

	if (sysModule != null) {
	    SysModule other = this.findSysModuleBySnAndPid(sysModule.getSn(),
		    Integer.toString(parentId));
	    if (other == null) {
		sysModuleDao.addSysModule(sysModule, parentId);
	    } else {
		throw new ProjectException("模块唯一标识重复，在同一父模块下不能存在相同标识的子模块!");
	    }
	} else {
	    throw new ProjectException("您试图保存一个不存在的模块！");
	}
    }

    public void addModule(SysModule sysModule) {
	if (sysModule != null) {
	    sysModuleDao.addSysModule(sysModule);
	} else {
	    throw new ProjectException("您试图保存一个不存在的模块！");
	}
    }

    public void delModule(String[] ids) {
	StringBuffer sb = new StringBuffer();
	if (ids != null) {
	    for (String string : ids) {
		SysModule sys = (SysModule) sysModuleDao.findSysModule(Integer
			.parseInt(string));
		if (sys != null) {
		    if (sys.getChildModules().size() > 0) {
			sb.append("操作错误:模块【" + sys.getSysModuleName()
				+ "】下存在子模块，不能删除!");
		    }
		} else {
		    throw new ProjectException("操作错误：试图删除不存在的模块！");
		}
	    }

	    if (sb.length() > 0) {
		throw new ProjectException(sb.toString());
	    } else {
		for (String string : ids) {
		    SysModule module = (SysModule) sysModuleDao
			    .findSysModule(Integer.parseInt(string));
		    SysModule pModule = module.getParentModule();
		    if (pModule != null) {
			List<SysModule> list = sysModuleDao
				.findChildModule(pModule.getId());
			if (list.size() == 1) {
			    pModule.setIsLeaf(0);
			    sysModuleDao.updateModule(pModule, 0);
			}
		    }
		    sysModuleDao.delPermission(module);
		    sysModuleDao.delSysModule(module);
		}
	    }
	}
    }

    public SysModule findModule(int moduleId) {
	return sysModuleDao.findSysModule(moduleId);
    }

    public void updateModule(SysModule sysModule, int parentId) {
	if (parentId != 0) {
	    sysModule.setParentModule(sysModuleDao.findSysModule(parentId));
	}
	sysModuleDao.updateModule(sysModule, parentId);
    }

    public void updateModule(SysModule sysModule) {
	if (sysModule != null) {
	    sysModuleDao.addSysModule(sysModule);
	} else {
	    throw new ProjectException("您试图保存一个不存在的模块！");
	}

    }

    public SysModule findSysModuleBySn(String sn) {
	SysModule sys = new SysModule();
	if (!"".equals(sn) && null != sn) {
	    sys = sysModuleDao.findSysModuleBySn(sn);
	} else {
	    throw new ProjectException("您试图访问一个不存在的模块！");
	}
	return sys;
    }

    public SysModule findSysModuleBySnAndPid(String sn, String pid) {
	SysModule tmp = null;
	if (pid != null && !"".equals(pid)) {
	    tmp = sysModuleDao.findSysModuleBySnAndPid(sn, Integer
		    .parseInt(pid));
	} else {
	    tmp = sysModuleDao.findSysModuleBySn(sn);
	}
	return tmp;
    }

}
