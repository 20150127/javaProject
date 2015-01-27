package cn.xyurp.system.util;

import cn.xyurp.system.dao.CommonDao;
import cn.xyurp.zs.bean.KSLB;
import cn.xyurp.zs.bean.MZ;
import cn.xyurp.zs.bean.SysVariable;
import cn.xyurp.zs.bean.XB;
import cn.xyurp.zs.bean.ZZMM;

public class FinalConstant {

	private static CommonDao commonDao;

	public void setCommonDao(CommonDao commonDao) {
		FinalConstant.commonDao = commonDao;
	}
	
	public static String sex(String sexId){
		XB xb = (XB) commonDao.get(XB.class, MyConstants.StringToInt(sexId));
		return  xb.getXbmc();
	}
	
	
	public static String mz(String mzId){
		MZ mz = (MZ) commonDao.get(MZ.class, MyConstants.StringToInt(mzId));
		return mz.getMzmc();
	}
	
	
	public static String zzmm(String zzmmId){
		ZZMM zzmm = (ZZMM) commonDao.get(ZZMM.class, MyConstants.StringToInt(zzmmId));
		return zzmm.getZzmmmc();
	}
	
	
	public static String kslb(String kslbId){
		KSLB kslb = (KSLB) commonDao.get(KSLB.class, MyConstants.StringToInt(kslbId));
		return kslb.getKslbmc();
	}
	public static String zkzbt(int i){
	    SysVariable sysVariable = (SysVariable) commonDao.get(SysVariable.class,i);
	    return sysVariable.getAdmissionTitle() ;
	}
	public static String bjsj(int i){
	    SysVariable sysVariable = (SysVariable) commonDao.get(SysVariable.class,i);
	    return sysVariable.getExamDate() ;
	}
	public static String fjsj(int i){
	    SysVariable sysVariable = (SysVariable) commonDao.get(SysVariable.class,i);
	    return sysVariable.getRetestsDate();
	}
	public static String ksdd(int i){
	    SysVariable sysVariable = (SysVariable) commonDao.get(SysVariable.class,i);
	    return sysVariable.getRetestsAddress();
	}
	public static String fzsj(int i){
	    SysVariable sysVariable = (SysVariable) commonDao.get(SysVariable.class,i);
	    return sysVariable.getIssueDate();
	}
	public static String bdsj(int i){
	    SysVariable sysVariable = (SysVariable) commonDao.get(SysVariable.class,i);
	    return sysVariable.getRegisterDate();
	}
	public static int kcrs(int i){
	    SysVariable sysVariable = (SysVariable) commonDao.get(SysVariable.class,i);
	    return sysVariable.getPcount();
	}
}
