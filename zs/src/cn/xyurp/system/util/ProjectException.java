package cn.xyurp.system.util;

/**
 * @author wangjian
 * @time 2009-10-21 下午05:22:38
 * @description 
 */
public class ProjectException  extends RuntimeException {
    private static final long serialVersionUID = -6679321803608120405L;

    @SuppressWarnings("unused")
	private String msg;
    
    public ProjectException(String msg) {
    	super(msg);
    	this.msg = msg;
    }
}
