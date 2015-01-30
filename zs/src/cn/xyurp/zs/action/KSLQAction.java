package cn.xyurp.zs.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

import cn.xyurp.system.action.BaseAction;
import cn.xyurp.system.bean.SysUser;
import cn.xyurp.system.service.AbstractDao;
import cn.xyurp.system.util.MyConstants;
import cn.xyurp.system.util.PagerModel;
import cn.xyurp.zs.bean.Score;
import cn.xyurp.zs.service.ScoreService;
import cn.xyurp.zs.service.SpecialtyService;

public class KSLQAction extends BaseAction {
	private static final long serialVersionUID = 2719499357751254596L;
	private AbstractDao abstractDao;
	private Score score;
	private String condition;
	private String key;
	private String key1;
	private String key2;
	private String key3;
	private String key4;
	private String key5;
	private ScoreService scoreService;
	private SpecialtyService specialtyService;
	private String fileName = "";
	private String[] properties;
	public void setSpecialtyService(SpecialtyService specialtyService) {
	    this.specialtyService = specialtyService;
	}

	public void setScoreService(ScoreService scoreService) {
	    this.scoreService = scoreService;
	}

	public String getKey() {
	    return key;
	}

	public void setKey(String key) {
	    this.key = key;
	}
	public String getKey4() {
		return key4;
	}
	
	public void setKey4(String key4) {
		this.key4 = key4;
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
	
	
	public String list(){
	    StringBuffer hql = new StringBuffer();
	    SysUser user=(SysUser)getRequest().getSession().getAttribute("user");
	    hql.append("from Score s where s.ifRetrial=1");
	    if(user!=null && user.getSpecialty()!=null){
		hql.append(" and s.specialtyId.id="+user.getSpecialty().getId());
	    }else if(key2!=null && !"0".equals(key2)){
		hql.append(" and s.specialtyId.code='"+key2+"'");
	    }else if(key4!=null&&!"0".equals(key4)){
	    	hql.append(" and s.specialtyId2.code='"+key4+"'");
	    }
	    
	    if(key3!=null){
		if("1".equals(key3)){
		    hql.append(" and s.ifAdmit=1");
		}else if("2".equals(key3)){
		    hql.append(" and s.ifAdmit=0");
		}
		getRequest().setAttribute("key3", key3);
	    }
	    if(key!=null && !"".equals(key.trim()) || !"0".equals(key1) || !"0".equals(key5) ){
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
		    }else if("studentGroup".equals(condition)){
		    	hql.append("and s.examineeType='"+key5+"'");
		    }else{
			hql.append(" and s.kl='" + key1 + "'");
		    }
		}
	    }
	    hql.append(" order by s.specialtyId.id asc ,(s.bjyw+s.bjsx+s.bjyy+s.hkzongfen+s.zonghecj+s.techangcj+s.fushicj+s.cs) desc");
	    
	    String hqlStatement = hql.toString();
	    PagerModel page = abstractDao.searchPaginated(hqlStatement);
	    getRequest().setAttribute("page", page);
	    getRequest().setAttribute("key", key);
	    if(key1!=null){
		getRequest().setAttribute("key1", key1);
	    }else{
		getRequest().setAttribute("key1", "0");
	    }
	    if(key2!=null){
		getRequest().setAttribute("key2", key2);
	    }else{
		getRequest().setAttribute("key2", "0");
	    }
	    if(key4!=null){
	    	getRequest().setAttribute("key4", key4);
	    }else{
	    	getRequest().setAttribute("key4", "0");
	    }
	    if(key5!=null){
	    	getRequest().setAttribute("key5", key5);
	    }else{
	    	getRequest().setAttribute("key5", "0");
	    }
	    getRequest().setAttribute("condition", condition);
	    getRequest().setAttribute("specialtys",specialtyService.findAll());
	    return SUCCESS;
	}

	public String lq(){
	    scoreService.lq(score);
	    return SUCCESS;
	}
	public String tz(){
	    Score obj=scoreService.findById(score.getId());
	    getRequest().setAttribute("obj", obj);
	    return SUCCESS;
	}
	public String pldy(){
	    List<Score> s=scoreService.pldy(getRequest().getParameterValues("ids"));
	    getRequest().setAttribute("list", s);
	    return SUCCESS;
	}
	public String qx(){
	    scoreService.qx(score);
	    return SUCCESS;
	}

	public String getKey1() {
	    return key1;
	}

	public void setKey1(String key1) {
	    this.key1 = key1;
	}

	public String getKey2() {
	    return key2;
	}

	public void setKey2(String key2) {
	    this.key2 = key2;
	}

	public String getKey3() {
	    return key3;
	}

	public void setKey3(String key3) {
	    this.key3 = key3;
	}
	public String toExport(){
		try {
			key = URLDecoder.decode(key,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public InputStream getInputStream() throws Exception {
		SysUser user=(SysUser)getRequest().getSession().getAttribute("user");
		StringBuffer hql = new StringBuffer();
		hql.append("from Score s where s.ifRetrial=1");
	    if(user!=null && user.getSpecialty()!=null){
	    	hql.append(" and s.specialtyId.id="+user.getSpecialty().getId());
	    }
	    
	    if(key!=null && !"".equals(key.trim())){
			if(condition!=null && !"".equals(condition.trim())){
			    if("name".equals(condition)){
			    	hql.append(" and s.name like '%"+key+"%'");
			    }else if("IDCardNum".equals(condition)){
			    	hql.append(" and s.IDCardNum like '%"+key+"%'");
			    }else if("examineeNum".equals(condition)){
			    	hql.append(" and s.examineeNum like '%"+key+"%'");
			    }else if("admissionId".equals(condition)){
			    	hql.append(" and s.admissionId like '%"+key+"%'");
			    }else if("kl".equals(condition)){
			    	hql.append(" and s.kl='"+key+"'");
			    }else if("zy".equals(condition)){
			    	hql.append(" and s.specialtyId.code='"+key+"'");
			    }else if("lq".equals(condition)){
			    	if("1".equals(key)){
					    hql.append(" and s.ifAdmit=1");
					}else if("2".equals(key)){
					    hql.append(" and s.ifAdmit=0");
					}
			    }
			}
	    }
	   hql.append(" order by s.specialtyId.id asc ,(s.bjyw+s.bjsx+s.bjyy+s.hkzongfen+s.zonghecj+s.techangcj+s.fushicj+s.cs) desc");
	   List<Score> scores = scoreService.findByFW(hql.toString());
	   HSSFWorkbook wb = exportExcel(scores, properties);
	   fileName = "kslq.xls";
	   File file = new File(fileName);
	   OutputStream out = new FileOutputStream(file);
	   wb.write(out);
	   out.close();
	   InputStream in = null;
	   in = new FileInputStream(file);
	   return in;
	}
	
	public String export(){
		return SUCCESS;
	}
	
	
	@SuppressWarnings("unchecked")
	public HSSFWorkbook exportExcel(List dataList, String[] headers)
			throws Exception {
		HSSFWorkbook workbook = null;
		try {
			workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet("KSLQ");
			this.setSheetColumnWidth(sheet, headers);
			HSSFCellStyle style = this.createTitleStyle(workbook);
			style.setFillForegroundColor(HSSFColor.LIGHT_GREEN.index);
			style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			style.setBorderRight(HSSFCellStyle.BORDER_THIN);
			style.setBorderTop(HSSFCellStyle.BORDER_THIN);
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			HSSFFont font = workbook.createFont();
			font.setColor(HSSFColor.VIOLET.index);
			font.setFontHeightInPoints((short) 12);
			font.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
			style.setFont(font);
			HSSFCellStyle style2 = workbook.createCellStyle();
			style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);

			HSSFRow row = sheet.createRow((short) 0);// 建立新行
			for (int i = 0; i < headers.length; i++) {
				this.createCell(row, i, style, HSSFCell.CELL_TYPE_STRING,
						headers[i]);
			}
			if (dataList != null && dataList.size() > 0) {
				for (int i = 0; i < dataList.size(); i++) {
					Score o = (Score) dataList.get(i);
					HSSFRow row1 = sheet.createRow((short) (i + 1));// 建立新行
					for (int j = 0; j < headers.length; j++) {
						if ("姓名".equals(headers[j])) {
							this.createCell(row1, j, style2,HSSFCell.CELL_TYPE_STRING, o.getName());
						}else if("考生号".equals(headers[j])){
							this.createCell(row1, j, style2,HSSFCell.CELL_TYPE_STRING, o.getExamineeNum());
						}else if("准考证号".equals(headers[j])){
							this.createCell(row1, j, style2,HSSFCell.CELL_TYPE_STRING, o.getAdmissionId());
						}else if("身份证号".equals(headers[j])){
							this.createCell(row1, j, style2,HSSFCell.CELL_TYPE_STRING, o.getIDCardNum());
						}else if("报考专业".equals(headers[j])){
							this.createCell(row1, j, style2,HSSFCell.CELL_TYPE_STRING, o.getSpecialtyId().getName());
						}else if("笔试成绩".equals(headers[j])){
							this.createCell(row1, j, style2,HSSFCell.CELL_TYPE_STRING, (o.getBjyw()+o.getBjsx()+o.getBjyy()));
						}else if("会考成绩".equals(headers[j])){
							this.createCell(row1, j, style2,HSSFCell.CELL_TYPE_STRING, o.getHkzongfen());
						}else if("评定成绩".equals(headers[j])){
							this.createCell(row1, j, style2,HSSFCell.CELL_TYPE_STRING, o.getZonghecj());
						}else if("特长成绩".equals(headers[j])){
							this.createCell(row1, j, style2,HSSFCell.CELL_TYPE_STRING, o.getTechangcj());
						}else if("测试成绩".equals(headers[j])){
							this.createCell(row1, j, style2,HSSFCell.CELL_TYPE_STRING, o.getCs());
						}else if("复试成绩".equals(headers[j])){
							this.createCell(row1, j, style2,HSSFCell.CELL_TYPE_STRING, o.getFushicj());
						}else if("总分".equals(headers[j])){
							this.createCell(row1, j, style2,HSSFCell.CELL_TYPE_STRING, (o.getBjyw()+o.getBjsx()+o.getBjyy()+o.getHkzongfen()+o.getZonghecj()+o.getTechangcj()+o.getCs()+o.getFushicj()));
						}else{}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return workbook;
	}

	private void setSheetColumnWidth(HSSFSheet sheet, String[] fileds) {
		// 根据你数据里面的记录有多少列，就设置多少列
		for (int i = 0; i < fileds.length; i++) {
			sheet.setColumnWidth((short) i, (short) 3000);
		}
	}

	// 设置excel的title样式
	private HSSFCellStyle createTitleStyle(HSSFWorkbook wb) {
		HSSFFont boldFont = wb.createFont();
		boldFont.setFontHeight((short) 200);
		HSSFCellStyle style = wb.createCellStyle();
		style.setFont(boldFont);
		style.setDataFormat(HSSFDataFormat.getBuiltinFormat("###,##0.00"));
		return style;
	}

	// 创建Excel单元格

	@SuppressWarnings("deprecation")
	private void createCell(HSSFRow row, int column, HSSFCellStyle style,
			int cellType, Object value) {
		HSSFCell cell = row.createCell((short) column);
		cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		if (style != null) {
			cell.setCellStyle(style);
		}
		cell.setCellType(cellType);
		switch (cellType) {
		case HSSFCell.CELL_TYPE_BLANK: {
		}
			break;
		case HSSFCell.CELL_TYPE_STRING: {
			cell.setCellValue(value.toString());
		}
			break;
		case HSSFCell.CELL_TYPE_NUMERIC: {
			cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
			cell.setCellValue(Double.parseDouble(value.toString()));
		}
			break;
		default:
			break;
		}
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String[] getProperties() {
		return properties;
	}

	public void setProperties(String[] properties) {
		this.properties = properties;
	}

	public String getKey5() {
		return key5;
	}

	public void setKey5(String key5) {
		this.key5 = key5;
	}
	
	
}
