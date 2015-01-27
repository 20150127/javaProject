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
import cn.xyurp.system.util.MyConstants;
import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.BYLB;
import cn.xyurp.zs.bean.DQ;
import cn.xyurp.zs.bean.KSLB;
import cn.xyurp.zs.bean.KSLX;
import cn.xyurp.zs.bean.MZ;
import cn.xyurp.zs.bean.Score;
import cn.xyurp.zs.bean.XB;
import cn.xyurp.zs.bean.ZZMM;
import cn.xyurp.zs.service.BYLBService;
import cn.xyurp.zs.service.DQService;
import cn.xyurp.zs.service.KSLBService;
import cn.xyurp.zs.service.KSLXService;
import cn.xyurp.zs.service.MZService;
import cn.xyurp.zs.service.ScoreService;
import cn.xyurp.zs.service.XBService;
import cn.xyurp.zs.service.ZZMMService;

public class ExportAction extends BaseAction {
	private static final long serialVersionUID = 7933589510692736616L;

	private XBService xbService;
	private DQService dqService;
	private ZZMMService zzmmService;
	private MZService mzService;
	private BYLBService bylbService;
	private KSLBService kslbService;
	private KSLXService kslxService;
	private ScoreService ss;
	private String fileName = "";
	private String condition;
	private String key;
	// 1 全部的 2 发准考证 3 录取的
	private Integer exportFW;

	private String[] properties;

	public String toExportExcel() throws Exception {
		try {
			key = URLDecoder.decode(key,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public InputStream getInputStream() throws Exception {
		StringBuffer hql = new StringBuffer();
		switch (exportFW) {
		case 1:
			hql.append("from Score as s where 1=1");
			break;
		case 2:
			hql.append("from Score as s where s.admissionId != ''");
			break;
		case 3:
			hql.append("from Score as s where s.ifAdmit = 1");
			break;
		case 4:
			hql.append("from Score as s where s.ifRetrial = 1");
			break;
		default:
			throw new ProjectException("导出范围只有：全部考生、 发准考证考生、录取考生、复试考生 四种类型");
		}
		key = key.trim();
		if(key!=null && !"".equals(key)){
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
			    }else if("zy2".equals(condition)){
			    	hql.append(" and s.specialtyId2.code='"+key+"'");
			    }
			}
	    }
		System.out.println(hql.toString());
		List<Score> scores = ss.findByFW(hql.toString());
		HSSFWorkbook wb = exportExcel(scores, properties);
		fileName = "cj.xls";
		File file = new File(fileName);
		OutputStream out = new FileOutputStream(file);
		wb.write(out);
		out.close();
		InputStream in = null;
		in = new FileInputStream(file);
		return in;
	}

	public String getExecl() throws Exception {
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public HSSFWorkbook exportExcel(List dataList, String[] headers)
			throws Exception {
		HSSFWorkbook workbook = null;
		try {
			workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet("CJ");
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
						if ("KSH".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o
											.getExamineeNum());
						} else if ("ZKZH".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o
											.getAdmissionId());
						} else if ("XM".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o.getName());
						} else if ("XBDM".equals(headers[j])) {
							XB xb = xbService.find(MyConstants.StringToInt(o
									.getSex()));
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, xb.getXbdm());
						} else if ("CSNY".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o.getBirthday());
						} else if ("ZZMMDM".equals(headers[j])) {
							ZZMM zzmm = zzmmService.find(MyConstants
									.StringToInt(o.getPolitics()));
							this
									.createCell(row1, j, style2,
											HSSFCell.CELL_TYPE_STRING, zzmm
													.getZzmmdm());
						} else if ("MZDM".equals(headers[j])) {
							MZ mz = mzService.find(MyConstants.StringToInt(o
									.getNationality()));
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, mz.getMzdm());
						} else if ("KSLBDM".equals(headers[j])) {
							KSLB kslb = kslbService.find(MyConstants
									.StringToInt(o.getExamineeType()));
							this
									.createCell(row1, j, style2,
											HSSFCell.CELL_TYPE_STRING, kslb
													.getKslbdm());
						} else if ("BYLBDM".equals(headers[j])) {
							BYLB bylb = bylbService.find(MyConstants
									.StringToInt(o.getGraduationType()));
							this
									.createCell(row1, j, style2,
											HSSFCell.CELL_TYPE_STRING, bylb
													.getBylbdm());
						} else if ("KLDM".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o.getKl());
						} else if ("ZXMC".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o.getSchool());
						} else if ("DQDM".equals(headers[j])) {
								DQ dq = dqService.find(MyConstants.StringToInt(o.getArea()));
								this.createCell(row1, j, style2,
										HSSFCell.CELL_TYPE_STRING, dq.getDqdm());
						} else if ("SFZH".equals(headers[j])) {
							this
									.createCell(row1, j, style2,
											HSSFCell.CELL_TYPE_STRING, o
													.getIDCardNum());
						} else if ("JTDZ".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o.getAddress());
						} else if ("YZBM".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o.getPostCode());
						} else if ("LXDH".equals(headers[j])) {
							this
									.createCell(row1, j, style2,
											HSSFCell.CELL_TYPE_STRING, o
													.getLinkPhone());
						} else if ("HKKH".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o.getHkkh());
						} else if ("KSTC".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o.getHobby());
						} else if ("KSJLHCF".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o.getRewards()
											+ "  " + o.getDisposal());
						} else if ("ZSYJ".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o.getZwjd());
						} else if ("KSLX".equals(headers[j])) {
								KSLX kslx = kslxService.find(MyConstants
										.StringToInt(o.getKslx()));
								this
										.createCell(row1, j, style2,
												HSSFCell.CELL_TYPE_STRING, kslx
														.getKslxdm());
						} else if ("CJR".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o
											.getLetterName());
						} else if ("CJ".equals(headers[j])) {
							Double cj = (o.getBjyw() + o.getBjsx() + o.getBjyy())+ (o.getHkzongfen()+ (o.getTechangcj() + o.getZonghecj())+ o.getFushicj());
							String fenshu = String.valueOf(cj);
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, fenshu);
						} else if ("LQZY".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o
											.getSpecialtyId().getName());
						} else if ("ZYDH1".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o
											.getSpecialtyId().getCode());
						} else if ("YUWEN".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o.getBjyw());
						} else if ("SHUXUE".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o.getBjsx());
						} else if ("YINGYU".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o.getBjyy());
						} else if ("HKCJ".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o.getHkzongfen());
						} else if ("ZHCJ".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o.getZonghecj());
						} else if ("TCCJ".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o.getTechangcj());
						} else if ("CSCJ".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o.getCs());
						} else if ("FSCJ".equals(headers[j])) {
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, o.getFushicj());
						} else if ("CSCJHZ".equals(headers[j])) {
							Double cscj = (o.getBjyw()+o.getBjsx()+o.getBjyy()+o.getHkzongfen()+o.getZonghecj()+o.getTechangcj()+o.getCs());
							String csfenshu = String.valueOf(cscj);
							this.createCell(row1, j, style2,
									HSSFCell.CELL_TYPE_STRING, csfenshu);
						}else {

						}
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

	public String[] getProperties() {
		return properties;
	}

	public void setProperties(String[] properties) {
		this.properties = properties;
	}

	public Integer getExportFW() {
		return exportFW;
	}

	public void setExportFW(Integer exportFW) {
		this.exportFW = exportFW;
	}

	public void setSs(ScoreService ss) {
		this.ss = ss;
	}

	public void setXbService(XBService xbService) {
		this.xbService = xbService;
	}

	public void setDqService(DQService dqService) {
		this.dqService = dqService;
	}

	public void setZzmmService(ZZMMService zzmmService) {
		this.zzmmService = zzmmService;
	}

	public void setMzService(MZService mzService) {
		this.mzService = mzService;
	}

	public void setBylbService(BYLBService bylbService) {
		this.bylbService = bylbService;
	}

	public void setKslbService(KSLBService kslbService) {
		this.kslbService = kslbService;
	}

	public void setKslxService(KSLXService kslxService) {
		this.kslxService = kslxService;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

}
