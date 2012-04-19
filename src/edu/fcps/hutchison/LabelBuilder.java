/**
 *  Copyright 2009 Jeffrey C. Hoyt. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


package edu.fcps.hutchison;

import java.io.*;

import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;



public class LabelBuilder
{

    private final int COLUMNS = 9;
    private final int COPIES_COLUMN = 5;  //0 based counting
	protected HSSFWorkbook _excelWorkbook;
    protected HSSFWorkbook newWorkbook;
	private URI _excelURI;

	public LabelBuilder() {
        newWorkbook = new HSSFWorkbook();

	}


	protected String getCellValStr(HSSFCell cell) {
	    if( cell == null ) {
            return "";
        } else if (cell.getCellType() == HSSFCell.CELL_TYPE_BOOLEAN) {
			return Boolean.toString(cell.getBooleanCellValue());
		} else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
			return Double.toString(cell.getNumericCellValue());
		} else if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
			return cell.getRichStringCellValue().toString();
		} else if (cell.getCellType() == HSSFCell.CELL_TYPE_BLANK) {
			return "";
		} else if (cell.getCellType() == HSSFCell.CELL_TYPE_FORMULA) {
			return cell.getCellFormula();
		} else if (cell.getCellType() == HSSFCell.CELL_TYPE_ERROR) {
			return String.valueOf(cell.getErrorCellValue());
		} else {
			return "";
		}
	}


	/**
	 * Derive the schema from the contents of an Excel workbook
	 */
	protected void generate() throws Exception{
        //start at the second row of the first sheet  -the first row has the column names
        HSSFSheet sheet = _excelWorkbook.getSheetAt(0);
        HSSFSheet outSheet = newWorkbook.createSheet();
        int rowct = 1;
        int newRows = 1;
        while(true)
        {
            HSSFRow row = sheet.getRow(rowct);
            if( row == null )
            {
                break;
            }
            HSSFCell cell = row.getCell(COPIES_COLUMN);
            if( cell == null )
            {
                break;
            }
            String copies = getCellValStr(cell);
            if( copies.equals("") || copies==null )
            {
                //last row is blank...return
                break;
            }
            int numCopies;
            try
            {
                numCopies = (int)cell.getNumericCellValue();  //gives 0 for empty cells
            }
            catch (java.lang.IllegalStateException e)
            {
                continue;
            }
            for(int j = 0; j <numCopies; j++)
            {
                HSSFRow outRow = outSheet.createRow(newRows);
                for (int i = 0; i < COLUMNS; i++)
                {
                    System.out.println(row.getCell(i));
                    //TODO write to the new workbook
                    outRow.createCell(i).setCellValue(getCellValStr(row.getCell(i)));
                }
                newRows++;
            }
            rowct++;
        }
        OutputStream os = new FileOutputStream("test.xls");
        newWorkbook.write( os );
        os.close();
	}


	public static void main(String[] args) throws Exception {
        LabelBuilder builder = new LabelBuilder(args[0]);
        builder.generate();
    }


    public LabelBuilder(String filename) throws Exception
    {
        _excelURI = new URI(filename);
        InputStream excelStream = _excelURI.toURL().openStream();
        _excelWorkbook = new HSSFWorkbook(excelStream);
        excelStream.close();
        newWorkbook = new HSSFWorkbook();
    }

}


	// /**
	//  * sets the cellTypes array. The rule is: once it's a String, it stays a String
	//  */
	// protected void determineColumnTypes(HSSFSheet sheet, int colCount) {
	// 	// iterate through rows and create table/attribute nodes
	// 	// the first row has the attribute names in them
	// 	for (int i = 1; i <= sheet.getLastRowNum(); i++) {
	// 		HSSFRow row = sheet.getRow(i);
	// 		if (row == null) continue;

	// 		int currentCellType;
	// 		for (int j = 0; j < colCount; j++) {
	// 			if (cellTypes[j] == HSSFCell.CELL_TYPE_STRING) {
	// 				continue;
	// 			}
	// 			currentCellType = getCellDataType(row.getCell(j));
	// 			if (cellTypes[j] == -1
	// 					|| (cellTypes[j] == HSSFCell.CELL_TYPE_BLANK && cellTypes[j] != currentCellType)) {
	// 				cellTypes[j] = currentCellType;
	// 			} else if (cellTypes[j] != currentCellType
	// 					&& currentCellType != HSSFCell.CELL_TYPE_BLANK) {
	// 				//they don't match to default to String
	// 				cellTypes[j] = HSSFCell.CELL_TYPE_STRING;
	// 			}
	// 		}
	// 	}
	// }
