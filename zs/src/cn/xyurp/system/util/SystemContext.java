package cn.xyurp.system.util;
/**
 * @author lichao
 * @time Oct 30, 2009 2:25:50 PM
 * @description 用ThreadLocal控制分页参数
 */
public class SystemContext {
	private static ThreadLocal<Integer> offset = new ThreadLocal<Integer>();
	private static ThreadLocal<Integer> pagesize = new ThreadLocal<Integer>();
	
	public static void setOffset(int _offset){
		offset.set(_offset);
	}
	
	public static int getOffset(){
		Integer os = (Integer)offset.get();
		if(os == null){
			return 0;
		}
		return os;
	}
	
	public static void removeOffset(){
		offset.remove();
	}
	
	public static void setPagesize(int _pagesize){
		pagesize.set(_pagesize);
	}
	
	public static int getPagesize(){
		Integer ps = (Integer)pagesize.get();
		if(ps == null){
			return Integer.MAX_VALUE;
		}
		return ps;
	}
	
	public static void removePagesize(){
		pagesize.remove();
	}
}
