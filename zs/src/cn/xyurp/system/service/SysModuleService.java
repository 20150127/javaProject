package cn.xyurp.system.service;

import cn.xyurp.system.bean.SysModule;

/**
 * @author lichao
 * @time Nov 2, 2009 11:09:36 AM
 * @description 模块管理模块业务逻辑层接口
 */
public interface SysModuleService {
    public void addModule(SysModule sysModule,int parentId);
    public void addModule(SysModule sysModule);

    public void delModule(String[] ids);

    public void updateModule(SysModule sysModule,int parentId);
    public void updateModule(SysModule sysModule);

    public SysModule findModule(int moduleId);
    public SysModule findSysModuleBySn(String sn);
    public SysModule findSysModuleBySnAndPid(String sn,String pid);
    
}
