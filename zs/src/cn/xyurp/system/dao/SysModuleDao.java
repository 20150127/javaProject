package cn.xyurp.system.dao;

import java.util.List;

import cn.xyurp.system.bean.SysModule;

public interface SysModuleDao {
    public void addSysModule(SysModule sysModule, int parentId);

    public void addSysModule(SysModule sysModule);

    public void delSysModule(SysModule sysModule);

    public void updateModule(SysModule sysModule, int parentId);

    public SysModule findSysModule(int sysModuleId);

    public List<SysModule> findChildModule(int sysModuleId);

    public SysModule findSysModuleBySn(String sn);

    public SysModule findSysModuleBySnAndPid(String sn, int pid);

    public void delPermission(SysModule sysModule);
}
