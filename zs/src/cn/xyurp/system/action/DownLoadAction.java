package cn.xyurp.system.action;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import org.apache.struts2.ServletActionContext;

import cn.xyurp.system.service.AbstractDao;
import cn.xyurp.system.util.FileOperation;
import cn.xyurp.zs.bean.Notice;

/**
 * @author mazhe
 * @time 2010-1-22 上午10:36:24
 * @description 移植王剑在设备管理中的下载功能
 */
public class DownLoadAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private String obj;
	private int objId;
	private int order;
	private AbstractDao abstractDao;
	public String getObj() {
		return obj;
	}
	public void setObj(String obj) {
		this.obj = obj;
	}
	public int getObjId() {
		return objId;
	}
	public void setObjId(int objId) {
		this.objId = objId;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	public void setAbstractDao(AbstractDao abstractDao) {
		this.abstractDao = abstractDao;
	}
	public InputStream getDownloadFile()throws Exception
	{
	   String realpath = getResult();
	   return ServletActionContext.getServletContext().getResourceAsStream(realpath);
	}
	
	/**
	 * @author mazhe 
	 * @time 2009-11-20 下午04:23:52
	 * @description
	 * @return
	 */
	private String getResult(){
		String hql = "from "+obj+" as o where o.id="+objId;
		Object obj = abstractDao.findObject(hql);
		String path ="";
		if(obj instanceof Notice){
			Notice o = (Notice)obj;
			path = o.getUploadResource();
		}
		else {}
		String[] files = path.split(";");
		return files[order-1];
	} 
	
	private String getDelResult(){
		String hql = "from "+obj+" as o where o.id="+objId;
		Object obj = abstractDao.findObject(hql);
		String path ="";
		String result ="";
		if(obj instanceof Notice){
			Notice o = (Notice)obj;
			path = o.getUploadResource();
			String[] files = path.split(";");
			result = files[order-1];
			path = path.replaceAll(result+";", "");
			o.setUploadResource(path);
			abstractDao.update(o);
		}
		else {}
		return result;
	}
	public String getDownloadFileName()throws Exception { 
	   String path = getResult();
	   String downFileName = path.substring(path.lastIndexOf("/")+1);
	   try {
		    downFileName = new String(downFileName.getBytes(), "iso-8859-1");
		   } catch (UnsupportedEncodingException e) {
		    e.printStackTrace();
		   }
		   //System.out.println("!!!!!!!!!!!!!"+downFileName);
	   return downFileName; 
	}
	
	public String down() throws Exception {
		return SUCCESS;
	}
	
	public String del() throws Exception{
		FileOperation.delFile(getRequest().getSession().getServletContext().getRealPath(getDelResult()));
		return SUCCESS;
	}
}

