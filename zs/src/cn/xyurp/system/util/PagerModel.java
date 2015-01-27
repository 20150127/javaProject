package cn.xyurp.system.util;



import java.util.List;

/**
 * @author lichao
 * @time Oct 30, 2009 2:22:52 PM
 * @description 分页实体�?	
 */
public class PagerModel {
	private List<Object> datas;
	private int total;
	private int offset;
	private int pagesize;
	public int getOffset() {
	    return offset;
	}
	public void setOffset(int offset) {
	    this.offset = offset;
	}
	public int getPagesize() {
	    return pagesize;
	}
	public void setPagesize(int pagesize) {
	    this.pagesize = pagesize;
	}
	public List<Object> getDatas() {
		return datas;
	}
	public void setDatas(List<Object> datas) {
		this.datas = datas;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
}
