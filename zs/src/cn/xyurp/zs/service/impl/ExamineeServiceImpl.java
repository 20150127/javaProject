package cn.xyurp.zs.service.impl;

import java.util.List;

import cn.xyurp.system.dao.CommonDao;
import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.Examinee;
import cn.xyurp.zs.bean.GuestBook;
import cn.xyurp.zs.bean.Score;
import cn.xyurp.zs.bean.SysVariable;
import cn.xyurp.zs.service.ExamineeService;

public class ExamineeServiceImpl implements ExamineeService {

    private CommonDao commonDao;

    public void setCommonDao(CommonDao commonDao) {
	this.commonDao = commonDao;
    }

    /*
     * (non-Javadoc)
     * 
     * @see cn.xyurp.zs.service.impl.ExamineeService#save(cn.xyurp.zs.bean.Examinee)
     */
    public void save(Examinee o) throws ProjectException {
	commonDao.add(o);
    }

    /*
     * (non-Javadoc)
     * 
     * @see cn.xyurp.zs.service.impl.ExamineeService#del(java.lang.Integer)
     */

    @SuppressWarnings("unchecked")
	public void del(Integer id) throws ProjectException {
	Examinee o = (Examinee) commonDao.load(Examinee.class, id);
	if (o != null) {
	    commonDao.del(o);
	} else {
	    throw new ProjectException("您要删除的考生不存在！");
	}
    }

    /*
     * (non-Javadoc)
     * 
     * @see cn.xyurp.zs.service.impl.ExamineeService#find(java.lang.Integer)
     */
    public Examinee find(Integer id) throws ProjectException {
	return (Examinee) commonDao.get(Examinee.class, id);
    }

    /*
     * (non-Javadoc)
     * 
     * @see cn.xyurp.zs.service.impl.ExamineeService#update(cn.xyurp.zs.bean.Examinee)
     */
    public void update(Examinee o) throws ProjectException {
	Examinee tmp = (Examinee) commonDao.load(Examinee.class, o.getId());
	if (o != null) {

	} else {
	    throw new ProjectException("您要修改的考生不存在！");
	}
    }

    public synchronized void  sc(int id) throws ProjectException {
	Examinee tmp = (Examinee) commonDao.load(Examinee.class, id);
	if(tmp!=null){
	    if(tmp.getAdmissionId()==null || "".equals(tmp.getAdmissionId())){
	SysVariable sysVariable = (SysVariable) commonDao.load(
		SysVariable.class, 1);
	String str1 = sysVariable.getAdmissionHead();
	int int2 = sysVariable.getRoomNum();
	int int3 = sysVariable.getRoomId();
	int int4 = sysVariable.getPcount();
	String str2 = "";
	String str3 = "";
	if (int2 < 10) {
	    str2 = "0" + String.valueOf(int2);
	}else{
	    str2 =String.valueOf(int2);
	    
	}
	if (int3 < 10) {
	    str3 = "0" + String.valueOf(int3);
	}else{
	    str3 =String.valueOf(int3);
	    
	}
	if (int3 == int4) {
	    sysVariable.setRoomNum(int2 + 1);
	    sysVariable.setRoomId(1);
	} else if (int3 < int4) {
	    sysVariable.setRoomId(int3 + 1);
	} else {
	    throw new ProjectException("座号已经大于考场人数！");
	}

	String str = str1 + str2 + str3;
		tmp.setAdmissionId(str);
		tmp.setRoomId(int2);
		commonDao.update(tmp);
		commonDao.update(sysVariable);
	    }else{
		return;
	    }
	}else{
	    throw new ProjectException("生成准考证出现错误！");
	}

    }
    @SuppressWarnings ("unchecked")
    public List<Examinee> zt(int kch) throws ProjectException {
	String hql="";
	if(kch==0){
	    hql="from Examinee e where e.roomId is NOT NULL and e.roomId<>'' order by e.admissionId";
	}else{
	    hql="from Examinee e where e.roomId="+kch+" order by e.admissionId ";
	}
	
	List<Examinee> list =(List<Examinee>)commonDao.findList(hql);
	return list;
    }
    
    @SuppressWarnings ("unchecked")
    public List<Integer> kc() throws ProjectException {
	List<Integer> list=(List<Integer>)commonDao.findList("select distinct e.roomId from Examinee e where e.roomId is not null");
	return list;
    }

    public long fzrs(int id) throws ProjectException {
	long i=0;
	if(id!=0){
	   i = (Long)commonDao.findObject("select count(*) from Examinee e where (e.admissionId is not null and e.admissionId <> '') and e.specialtyId.id="+id);
	}else{
	    i = (Long)commonDao.findObject("select count(*) from Examinee e where e.admissionId is not null and e.admissionId <> ''");
	}
	return i;
    }

    public long lqrs(int id) throws ProjectException {
	long i=0;
	if(id!=0){
	    i=(Long)commonDao.findObject("select count(*) from Examinee e where e.ifAdmit=1 and e.specialtyId.id="+id);	    
	}else{
	    i=(Long)commonDao.findObject("select count(*) from Examinee e where e.ifAdmit=1");
	}
	return i;
    }

    public long bkrs(int id) throws ProjectException {
	long i=0;
	if(id!=0){
	    i=(Long)commonDao.findObject("select count(*) from Examinee e where e.specialtyId.id="+id);
	}else{
	    i=(Long)commonDao.findObject("select count(*) from Examinee e ");
	}
	return i;
    }

}
