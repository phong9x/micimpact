package com.app.micimpact.web.view;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

public class ExcelExportView extends AbstractExcelView{
	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("buildExcelDocument");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String today = formatter.format(new Date());
		response.setHeader("Content-Disposition", "attachment; filename=\"" + today + ".xls" + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");

		@SuppressWarnings("unchecked")
		List<String> columnNames = (List<String>) model.get("columnNames");
		@SuppressWarnings("unchecked")
		List<Object> rows = (List<Object>) model.get("rows");

		HSSFSheet sheet = workbook.createSheet();
		HSSFRow header = sheet.createRow(0);
		int columnIndex = 0;
		int rowIndex = 1;
		for (String column : columnNames) {
			System.out.println(column);
			header.createCell(columnIndex).setCellValue(column);
			columnIndex++;
		}

		for (Object rowItemsObject : rows) {
			HSSFRow row = sheet.createRow(rowIndex);
			columnIndex = 0;
			String[] rowItems = rowItemsObject.toString().split("\\|");
			System.out.println(rowItemsObject.toString());
			for (String rowItem : rowItems) {
				System.out.println(rowItem);
				row.createCell(columnIndex).setCellValue(rowItem);
				columnIndex++;
			}
			rowIndex++;
		}
	}
}
