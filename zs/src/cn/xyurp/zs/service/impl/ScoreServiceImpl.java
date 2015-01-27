package cn.xyurp.zs.service.impl;

import java.util.ArrayList;
import java.util.List;

import cn.xyurp.system.dao.CommonDao;
import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.GuestBook;
import cn.xyurp.zs.bean.Score;
import cn.xyurp.zs.service.ScoreService;

public class ScoreServiceImpl implements ScoreService {
	private CommonDao commonDao;

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	public boolean judge(int id) {
		Score score = (Score) commonDao.load(Score.class, id);
		if (score == null) {
			return true;
		} else {
			return false;
		}
	}

	public Score findById(int id) throws ProjectException {
		Score score = (Score) commonDao.load(Score.class, id);
		return score;
	}

	public void updateBJ(Score score) throws ProjectException {
		if (judge(score.getId())) {
			if (score != null) {
				commonDao.add(score);
			} else {
				throw new ProjectException("添加的分数为空!");
			}
		} else {
			Score s = (Score) commonDao.load(Score.class, score.getId());
			s.setBjyw(score.getBjyw());
			s.setBjsx(score.getBjsx());
			s.setBjyy(score.getBjyy());
			commonDao.update(s);

		}
	}

	public void updateFS(Score score) throws ProjectException {
		if (judge(score.getId())) {
			if (score != null) {
				commonDao.add(score);
			} else {
				throw new ProjectException("添加的分数为空!");
			}
		} else {
			Score s = (Score) commonDao.load(Score.class, score.getId());
			s.setFushicj(score.getFushicj());
			commonDao.update(s);
		}

	}

	public void updateHK(Score score) throws ProjectException {
		if (judge(score.getId())) {
			if (score != null) {
				commonDao.add(score);
			} else {
				throw new ProjectException("添加的分数为空!");
			}
		} else {
			Score s = (Score) commonDao.load(Score.class, score.getId());
			//if ("9".equals(s.getKl())) {
				s.setHkzongfen(score.getHkzongfen());
			//} else {
				s.setYuwen(score.getYuwen());
				s.setShuxu(score.getShuxu());
				s.setYingyu(score.getYingyu());
				s.setLishi(score.getLishi());
				s.setZhengzhi(score.getZhengzhi());
				s.setDili(score.getDili());
				s.setWuli(score.getWuli());
				s.setHuaxue(score.getHuaxue());
				s.setShengwu(score.getShengwu());
				s.setXinxijishu(score.getXinxijishu());
				s.setTongyongjishu(score.getTongyongjishu());
//				s.setHkzongfen(score.getYuwen() + score.getShuxu()
//						+ score.getYingyu() + score.getLishi()
//						+ score.getZhengzhi() + score.getDili()
//						+ score.getWuli() + score.getHuaxue()
//						+ score.getShengwu() + score.getXinxijishu()
//						+ score.getTongyongjishu());
//			}

			commonDao.update(s);
		}
	}

	public void updateTC(Score score) throws ProjectException {
		if (judge(score.getId())) {
			if (score != null) {
				commonDao.add(score);
			} else {
				throw new ProjectException("添加的分数为空!");
			}
		} else {
			Score s = (Score) commonDao.load(Score.class, score.getId());
			s.setTechangcj(score.getTechangcj());
			commonDao.update(s);
		}
	}
	
	public void updateCS(Score score) throws ProjectException{
		if (judge(score.getId())) {
			if (score != null) {
				commonDao.add(score);
			} else {
				throw new ProjectException("添加的分数为空!");
			}
		} else {
			Score s = (Score) commonDao.load(Score.class, score.getId());
			s.setCs(score.getCs());
			commonDao.update(s);
		}
	}

	public void updateZH(Score score) throws ProjectException {
		if (judge(score.getId())) {
			if (score != null) {
				commonDao.add(score);
			} else {
				throw new ProjectException("添加的分数为空!");
			}
		} else {
			Score s = (Score) commonDao.load(Score.class, score.getId());
			s.setZonghecj(score.getZonghecj());
			commonDao.update(s);
		}
	}

	public void save(Score score) throws ProjectException {
		if (score != null) {
			score.setIfAdmit(0);
			score.setRoomId(0);
			score.setIfRetrial(0);
			score.setAdmissionId("");
			commonDao.add(score);
		} else {
			throw new ProjectException("保存考生对象出错！");
		}
	}

	public void lq(Score score) throws ProjectException {
		if (score != null) {
			Score s = (Score) commonDao.load(Score.class, score.getId());
			s.setIfAdmit(1);
			commonDao.update(s);
		} else {
			throw new ProjectException("录取考生出错！");
		}
	}
	public void pllq(String[] ids) throws ProjectException {
	    if(ids!=null){
		for (String string : ids) {
		    Score s = (Score) commonDao.load(Score.class,Integer.parseInt(string));
		    s.setIfAdmit(1);
		    commonDao.update(s);
    	    	}
	    }else{
		throw new ProjectException("批量录取考生出错！");
	    }
	}
	public void plfs(String[] ids) throws ProjectException {
	    if(ids!=null){
		for (String string : ids) {
		    Score s = (Score) commonDao.load(Score.class,Integer.parseInt(string));
		    s.setIfRetrial(1);
		    commonDao.update(s);
		}
	    }else{
		throw new ProjectException("批量考生进入复试出错！");
	    }
	}
	public void qx(Score score) throws ProjectException {
		if (score != null) {
			Score s = (Score) commonDao.load(Score.class, score.getId());
			s.setIfAdmit(0);
			commonDao.update(s);
		} else {
			throw new ProjectException("取消录取考生出错！");
		}
	}

	public Score findByExamNum(String examineeNum) throws ProjectException {
		return (Score) commonDao
				.findObject("from Score o where o.examineeNum ='" + examineeNum
						+ "'");
	}

	public Score findByIDCard(String IDCardNum) throws ProjectException {
		return (Score) commonDao.findObject("from Score o where o.IDCardNum ='"
				+ IDCardNum + "'");
	}

	public Score findByKH(String kh) throws ProjectException {
		return (Score) commonDao
				.findObject("from Score o where o.examineeNum ='" + kh + "'");
	}

	public void updateHKForImport(Score score) throws ProjectException {
		if (judge(score.getId())) {
			if (score != null) {
				commonDao.add(score);
			} else {
				throw new ProjectException("添加的分数为空!");
			}
		} else {
			Score s = (Score) commonDao.load(Score.class, score.getId());
			s.setYuwen(score.getYuwen());
			s.setShuxu(score.getShuxu());
			s.setYingyu(score.getYingyu());
			s.setLishi(score.getLishi());
			s.setZhengzhi(score.getZhengzhi());
			s.setDili(score.getDili());
			s.setWuli(score.getWuli());
			s.setHuaxue(score.getHuaxue());
			s.setShengwu(score.getShengwu());
			s.setXinxijishu(score.getXinxijishu());
			s.setTongyongjishu(score.getTongyongjishu());
			s.setHkzongfen(score.getYuwen() + score.getShuxu()
					+ score.getYingyu() + score.getLishi()
					+ score.getZhengzhi() + score.getDili() + score.getWuli()
					+ score.getHuaxue() + score.getShengwu()
					+ score.getXinxijishu() + score.getTongyongjishu());
			commonDao.update(s);
		}
	}

	public void updateRegisterInfo(Score score) throws ProjectException {
		Score tmp = (Score) commonDao.load(Score.class, score.getId());
		if (tmp != null) {
			tmp.setName(score.getName());
			tmp.setSex(score.getSex());
			tmp.setBirthday(score.getBirthday());
			tmp.setArea(score.getArea());
			tmp.setPolitics(score.getPolitics());
			tmp.setNationality(score.getNationality());
			// tmp.setIDCardNum(score.getIDCardNum()); 考生身份证号不允许修改!
			tmp.setExamineeNum(score.getExamineeNum());
			tmp.setExamineeType(score.getExamineeType());
			tmp.setHkkh(score.getHkkh());
			tmp.setKslx(score.getKslx());
			tmp.setExamineePhoto(score.getExamineePhoto());
			tmp.setSchool(score.getSchool());
			tmp.setGraduationDate(score.getGraduationDate());
			tmp.setGraduationType(score.getGraduationType());

			tmp.setWorks(score.getWorks());
			tmp.setDisposal(score.getDisposal());
			tmp.setRewards(score.getRewards());
			tmp.setCerificate(score.getCerificate());
			tmp.setHobby(score.getHobby());
			tmp.setZwjd(score.getZwjd());
			
			tmp.setAddress(score.getAddress());
			tmp.setStreet(score.getStreet());
			tmp.setHomePhone(score.getHomePhone());
			tmp.setMobilePhone(score.getMobilePhone());
			tmp.setLetterAddress(score.getLetterAddress());
			tmp.setLetterName(score.getLetterName());
			tmp.setLinkPhone(score.getLinkPhone());
			tmp.setPostCode(score.getPostCode());
			tmp.setSpecialtyId(score.getSpecialtyId());
			// 专业一经选择不能修改
			tmp.setSpecialtyId2(score.getSpecialtyId2());
			// 专业一经选择不能修改
			tmp.setIfAdjust(score.getIfAdjust());
			commonDao.update(tmp);

		} else {

			throw new ProjectException("您修改的记录在数据库中不存在，检查是否出错，否则请联系管理员!");
		}

	}

	public void updatePwd(Integer id, String newpwd) throws ProjectException {
		Score tmp = (Score) commonDao.load(Score.class, id);
		if(tmp != null) {
			tmp.setPassword(newpwd);
			commonDao.update(tmp);
		}else{
			throw new ProjectException("当前用户不存在！无法修改!");
		}
	}

	@SuppressWarnings("unchecked")
	public List<Score> findByFW(String hql) throws ProjectException {
		return commonDao.findList(hql);
	}

	public void retrial(int id) throws ProjectException {
	    Score tmp = (Score) commonDao.load(Score.class, id);
	    if(tmp != null) {
		if(tmp.getIfRetrial()==0){
		    tmp.setIfRetrial(1);
		}else{
		    tmp.setIfRetrial(0); 
		}
		commonDao.update(tmp);
	}else{
		throw new ProjectException("修改该考生信息出错!");
	}
	}
	@SuppressWarnings ("unchecked")
	public void del(Integer id) throws ProjectException {
		Score o = (Score) commonDao.load(Score.class, id);
		List<GuestBook> glist = commonDao.findList("from GuestBook g where g.asker.id="+o.getId());
		if(glist.size()>0){
			for (GuestBook guestBook : glist) {
				GuestBook tmp = (GuestBook)commonDao.load(GuestBook.class, guestBook.getId());
				if(tmp!=null){
					commonDao.del(tmp);
				}else{
					throw new ProjectException("操作错误：试图删除不存在的留言板对象！");
				}
			}
		}
		commonDao.del(o);
	}

	public void upPwd(String idcard) throws ProjectException {
		Score s  = this.findByIDCard(idcard);
		s.setPassword("123456");
		commonDao.update(s);
	}

	public List<Score> pldy(String[] ids) throws ProjectException {
	    List<Score> slist=new ArrayList<Score>();
	    if(ids!=null){
		for (String string : ids) {
		    Score s = (Score) commonDao.load(Score.class,Integer.parseInt(string));
		    slist.add(s);
		}
	    }else{
		throw new ProjectException("批量打印录取通知书出错！");
	    }
	    return slist;
	}

	
}
