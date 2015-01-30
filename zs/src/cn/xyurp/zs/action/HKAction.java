package cn.xyurp.zs.action;

import cn.xyurp.system.action.BaseAction;
import cn.xyurp.system.bean.SysUser;
import cn.xyurp.system.service.AbstractDao;
import cn.xyurp.system.util.MyConstants;
import cn.xyurp.system.util.PagerModel;
import cn.xyurp.zs.bean.Score;
import cn.xyurp.zs.service.ScoreService;
import cn.xyurp.zs.service.SpecialtyService;

public class HKAction extends BaseAction {
	private static final long serialVersionUID = 2719499357751254596L;
	private AbstractDao abstractDao;
	private ScoreService scoreService;
	private Score score;
	private String condition;
	private String key;
	private String key1;
	private String key2;
//	private String key3;
	private SpecialtyService specialtyService;
 
	public String getKey2() {
	    return key2;
	}

	public void setKey2(String key2) {
	    this.key2 = key2;
	}
	/*public String getKey3() {
		return key3;
	}
	
	public void setKey3(String key3) {
		this.key3 = key3;
	}*/

	public void setSpecialtyService(SpecialtyService specialtyService) {
	    this.specialtyService = specialtyService;
	}

	public String getKey() {
	    return key;
	}

	public void setKey(String key) {
	    this.key = key;
	}

	public String getCondition() {
	    return condition;
	}

	public void setCondition(String condition) {
	    this.condition = condition;
	}

	public Score getScore() {
	    return score;
	}

	public void setScore(Score score) {
	    this.score = score;
	}

	public void setAbstractDao(AbstractDao abstractDao) {
		this.abstractDao = abstractDao;
	}
	
	public void setScoreService(ScoreService scoreService) {
	    this.scoreService = scoreService;
	}

	public String toUpdate(){
	    Score s=scoreService.findById(score.getId());
	    if(s!=null){
		getRequest().setAttribute("score", s);
	    }
	    return SUCCESS;
	}
	
	public String update(){
	    scoreService.updateHK(score);
	    return SUCCESS;
	}
	
	public String list(){
	    StringBuffer hql = new StringBuffer();
	    SysUser user=(SysUser)getRequest().getSession().getAttribute("user");
	    hql.append("from Score s where (s.admissionId is not null and s.admissionId <>' ')");
	    if(user!=null && user.getSpecialty()!=null){
		hql.append(" and s.specialtyId.id="+user.getSpecialty().getId());
	    }else if(key2!=null && !"0".equals(key2)){
		hql.append(" and s.specialtyId.code='"+key2+"'");
	    }
//	    else if(key3!=null && !"0".equals(key3)){
//			hql.append(" and s.specialtyId2.code='"+key3+"'");
//	    }
	    if(key!=null && !"".equals(key.trim()) || !"0".equals(key1) ){
		if(condition!=null && !"".equals(condition.trim())){
		    if("0".equals(key1)){
			key=MyConstants.vd(key.trim());
		    }
		    if("name".equals(condition)){
			hql.append(" and s.name like '%"+key+"%'");
		    }else if("IDCardNum".equals(condition)){
			hql.append(" and s.IDCardNum like '%"+key+"%'");
		    }else if("examineeNum".equals(condition)){
			hql.append(" and s.examineeNum like '%"+key+"%'");
		    }else if("admissionId".equals(condition)){
			hql.append(" and s.admissionId like '%"+key+"%'");
		    }else{
			hql.append(" and s.kl='" + key1 + "'");
			getRequest().setAttribute("key1", key1);
		    }
		}
	    }
	    hql.append(" order by s.specialtyId.id asc, s.hkzongfen desc");
	    String hqlStatement = hql.toString();
	    PagerModel page = abstractDao.searchPaginated(hqlStatement);
	    getRequest().setAttribute("page", page);
	    getRequest().setAttribute("key", key);
	    if(key1!=null){
		getRequest().setAttribute("key1", key1);
	    }else{
		getRequest().setAttribute("key1", 0);
	    }
	    if(key2!=null){
		getRequest().setAttribute("key2", key2);
	    }else{
		getRequest().setAttribute("key2", 0);
	    }
//	    if(key3!=null){
//		getRequest().setAttribute("key3", key3);
//	    }else{
//		getRequest().setAttribute("key3", 0);
//	    }
	    getRequest().setAttribute("condition", condition);
	    getRequest().setAttribute("specialtys",specialtyService.findAll());
	    return SUCCESS;
	}

	public String getKey1() {
	    return key1;
	}

	public void setKey1(String key1) {
	    this.key1 = key1;
	}

	public String toImport(){
	    return SUCCESS;
	}
	
	
	
	
}
