package cn.xyurp.system.util;

import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFComment;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;




/**
 * @author wangjian
 * @time 2009-10-23 涓嬪�?04:20:43
 * @description 瀵煎嚭Excel
 */
public class ExportExcel<T> {
	
	public void exportExcel(String title,String[] headers,Collection<T> dataset,OutputStream out,String pattern) {
		// 鍒涘缓宸ヤ綔钖�

		HSSFWorkbook workbook = new HSSFWorkbook();
		//鍒涘缓sheet
		HSSFSheet sheet = workbook.createSheet();
		// 榛樿琛ㄦ牸鍒楃殑�?�藉�?

		sheet.setDefaultColumnWidth((short) 15);
		// 鏍峰紡涓�?

		HSSFCellStyle style = workbook.createCellStyle();
		// 瀹氫箟鏍峰紡涓�寰楀睘鎬�?

		style.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		//涓烘牱寮忎竴瀹氫箟�?�椾�?

		HSSFFont font = workbook.createFont();
		font.setColor(HSSFColor.VIOLET.index);
		font.setFontHeightInPoints((short) 12);
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		// 瀛椾綋涓��?�氫箟鍒版牱寮忎竴涓�?

		style.setFont(font);
		
		
		//銆傘��

		HSSFCellStyle style2 = workbook.createCellStyle();
		style2.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
		style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		//銆傘��

		HSSFFont font2 = workbook.createFont();
		font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
		style2.setFont(font2);
		
		// 銆傘��

		HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
		//瀹氫箟娉ㄩ噴
		HSSFComment comment = patriarch.createComment(new HSSFClientAnchor(0,0,0,0,(short) 4,2,(short) 6,5));
		// 
		comment.setString(new HSSFRichTextString("..."));
		// 锟斤拷锟斤拷锟斤拷锟斤拷
		comment.setAuthor("wangjian");
		
		
		/****************琛ㄦ牸鐨勬爣棰�*********************/
		HSSFRow row = sheet.createRow(0);
		for(short i=0;i<headers.length;i++){
			HSSFCell cell = row.createCell(i);
			cell.setCellStyle(style);
			HSSFRichTextString text = new HSSFRichTextString(headers[i]);
			cell.setCellValue(text);
		}
		
		/****************閬嶅巻闆嗗悎鏁版嵁锛屼骇鐢熸暟鎹********************/
		Iterator<T> it = dataset.iterator();
		int index = 0;
		while(it.hasNext()){
			index++;
			row = sheet.createRow(index);
			T t = (T)it.next();
			//鍒╃敤鍙嶅皠锛屾牴鎹甹avabea灞炴�х殑鍏堝悗椤哄簭锛屽姩鎬佽皟鐢╣etXXX()鏂规硶寰�?埌灞炴�у�笺��

			Field[] fields = t.getClass().getDeclaredFields();
			for(short i=0;i<fields.length;i++){
				HSSFCell cell = row.createCell(i);
				cell.setCellStyle(style2);
				Field field = fields[i];
				String fieldName = field.getName();
				String getMethodName = "get"+fieldName.substring(0, 1).toUpperCase()+fieldName.substring(1);
				try {
					Class tCls = t.getClass();
					Method getMethod = tCls.getMethod(getMethodName, new Class[]{});
					Object value = getMethod.invoke(t, new Object[]{});
					//鍒ゆ柇鍊肩殑绫诲瀷鍚庤繘琛屽己鍒剁被鍨嬭浆鎹�?

					String textValue = null;
					if(value instanceof Boolean){
						boolean bvalue = (Boolean)value;
						textValue = "鏄�";
						if(!bvalue){
							textValue = "鍚�";
						}
					} else if(value instanceof Date) {
						Date date = (Date)value;
						SimpleDateFormat sdf = new SimpleDateFormat(pattern);
						textValue = sdf.format(date);
					}else {
						textValue = value.toString();
					}
					if(textValue != null){
						Pattern p = Pattern.compile("^[-+]?(\\d+(\\.\\d*)?|\\.\\d+)([eE]([-+]?([012]?\\d{1,2}|30[0-7])|-3([01]?[4-9]|[012]?[0-3])))?[dD]?$");
						Matcher matcher = p.matcher(textValue);
						if(matcher.matches()){
							//鍖归厤鏁板瓧
							cell.setCellValue(Double.parseDouble(textValue));
						} else {
							HSSFRichTextString richString = new HSSFRichTextString(textValue);
							HSSFFont font3 = workbook.createFont();
							font3.setColor(HSSFColor.BLUE.index);
							richString.applyFont(font3);
							cell.setCellValue(richString);
						}
						
					}	
					
				} catch (SecurityException e) {
	                e.printStackTrace();
	            } catch (NoSuchMethodException e) {
	                e.printStackTrace();
	            } catch (IllegalArgumentException e) {
	                e.printStackTrace();
	            } catch (IllegalAccessException e) {
	                e.printStackTrace();
	            } catch (InvocationTargetException e) {
	                e.printStackTrace();
	            } finally {
	            	
	            }
			}
			
		}
		
		try {
			workbook.write(out);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
	}
}
