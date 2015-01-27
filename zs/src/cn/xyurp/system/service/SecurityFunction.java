package cn.xyurp.system.service;






public class SecurityFunction {
	
	private static SysACLService sysACLService;
	
	public static boolean hasPermission(int userId,String moduleSn,int permission){
	    System.out.println(userId);
	    System.out.println(moduleSn);
	    System.out.println(permission);
		return sysACLService.hasPermissionBySn(userId, moduleSn, permission);
	}

	public  void setSysACLService(SysACLService sysACLService) {
	    SecurityFunction.sysACLService = sysACLService;
	}

}
