package cn.xyurp.system.util;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

/**
 * 
 * @author lichao
 * @time Oct 28, 2009 5:35:52 PM
 * @description
 */
public class ExcelTemplate {
	private static Log logger = LogFactory.getLog(ExcelTemplate.class);
	private static final String DATAS = "datas";
	
	private HSSFWorkbook workbook;
	private HSSFSheet sheet;
	private HSSFRow currentRow;
	private Map styles = new HashMap(); 
	private Map confStyles = new HashMap(); 
	private int initrow; 
	private int initcol; 
	private int num; 
	private int currentcol; 
	private int currentRowIndex; 
	private int rowheight = 22; 
	private int lastLowNum = 0;
	private String cellStyle = null;
	
	private ExcelTemplate() {
	}
	
	public static ExcelTemplate newInstance(){
		return newInstance("templates/default.xls");
	}

	public static ExcelTemplate newInstance(String templates){
		try {
			ExcelTemplate excel = new ExcelTemplate();
			POIFSFileSystem fs = new POIFSFileSystem(
					Thread.currentThread().getContextClassLoader()
					.getResourceAsStream(templates));
			excel.workbook = new HSSFWorkbook(fs);
			excel.sheet = excel.workbook.getSheetAt(0);
			
			excel.initConfig();
			
			excel.readCellStyles();
			
			excel.sheet.removeRow( excel.sheet.getRow(excel.initrow) );
			
			return excel;
		} catch (Exception e) {
			e.printStackTrace();
			logger.trace("创建Excel对象出现异常",e);
			throw new RuntimeException("创建Excel对象出现异常");
		}
	}
	
	
	public void setCellStyle(String style){
		cellStyle = style;
	}
	
	public void setCellDefaultStyle(){
		cellStyle = null;
	}
	
	public void createRow(int index){
		if(lastLowNum > initrow && index > 0){
			sheet.shiftRows(index + initrow ,lastLowNum + index,1,true,true);
		}
		currentRow = sheet.createRow(index + initrow);
		currentRow.setHeight((short)rowheight);
		currentRowIndex = index;
		currentcol = initcol;
	}
	
	public void createCell(String value){
		HSSFCell cell = createCell();
		cell.setCellType(HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue(value);
	}
	
	public void createCell(Date value){
		HSSFCell cell = createCell();
		cell.setCellValue(value);
	}
	
	public void createSerialNumCell(){
		HSSFCell cell = createCell();
		cell.setCellValue(currentRowIndex + num);
	}
	
	private HSSFCell createCell(){
		HSSFCell cell = currentRow.createCell((short)currentcol++);
		cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		HSSFCellStyle style = (HSSFCellStyle)styles.get(new Integer(cell.getCellNum()));
		if(style != null){
			cell.setCellStyle(style);
		}
		
		if(cellStyle != null){
			HSSFCellStyle ts = (HSSFCellStyle)confStyles.get(cellStyle);
			if(ts != null){
				cell.setCellStyle(ts);
			}
		}
		return cell;
	}
	
	public HSSFWorkbook getWorkbook(){
		return workbook;
	}
	
	public HSSFCellStyle getTemplateStyle(String style){
		return (HSSFCellStyle)confStyles.get(style);
	}
	
	public void replaceParameters(Properties props){
		if(props == null || props.size() == 0){
			return;
		}
		Set propsets = props.entrySet();
		Iterator rowit = sheet.rowIterator();
		while(rowit.hasNext()){
			HSSFRow row = (HSSFRow)rowit.next();
			if(row == null)	continue;
			int cellLength = row.getLastCellNum();
			for(int i=0; i<cellLength; i++){
				HSSFCell cell = (HSSFCell)row.getCell((short)i);
				if(cell == null) continue;
				String value = cell.getStringCellValue();
				if(value != null && value.indexOf("#") != -1){
					for (Iterator iter = propsets.iterator(); iter.hasNext();) {
						Map.Entry entry = (Map.Entry) iter.next();
						value = value.replaceAll("#"+entry.getKey(),(String)entry.getValue());
					}
				}
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(value);
			}
		}
	}
	
	private void initConfig(){
		lastLowNum = sheet.getLastRowNum();
		Iterator rowit = sheet.rowIterator();
		boolean configFinish = false;
		while(rowit.hasNext()){
			if(configFinish){
				break;
			}
			HSSFRow row = (HSSFRow)rowit.next();
			if(row == null)	continue;
			int cellLength = row.getLastCellNum();
			int rownum = row.getRowNum();
			for(int i=0; i<cellLength; i++){
				HSSFCell cell = (HSSFCell)row.getCell((short)i);
				if(cell == null) continue;
				String config = cell.getStringCellValue();
				if(DATAS.equalsIgnoreCase(config)){
					initrow = row.getRowNum();
					rowheight = row.getHeight();
					initcol = cell.getCellNum();
					configFinish = true;
				}
				if(configFinish){
					readCellStyle(cell);
				}				
			}
		}
	}
	
	private void readCellStyle(HSSFCell cell){
		HSSFCellStyle style = cell.getCellStyle();
		if(style == null) return;
		styles.put(new Integer(cell.getCellNum()),style);
	}
	
	private void readCellStyles(){
		Iterator rowit = sheet.rowIterator();
		while(rowit.hasNext()){
			HSSFRow row = (HSSFRow)rowit.next();
			if(row == null)	continue;
			int cellLength = row.getLastCellNum();
			for(int i=0; i<cellLength; i++){
				HSSFCell cell = (HSSFCell)row.getCell((short)i);
				if(cell == null) continue;
				String value = cell.getStringCellValue();
				if(value != null && value.indexOf("#STYLE_") != -1){
					HSSFCellStyle style = cell.getCellStyle();
					if(style == null) continue;
					confStyles.put(value.substring(1),style);
					
					//remove it
					row.removeCell(cell);
				}
			}
		}
	}
}
