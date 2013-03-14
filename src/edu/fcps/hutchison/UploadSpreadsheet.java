/*
 *  Copyright 2013 Jeffrey Hoyt. All Rights Reserved.
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

import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@javax.servlet.annotation.WebServlet(urlPatterns={"/upload"})
public class UploadSpreadsheet extends javax.servlet.http.HttpServlet
{
  public void doPost(javax.servlet.http.HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException
  {
    PrintWriter out = response.getWriter();
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    System.out.println("request: " + request);
    if (!isMultipart) {
      System.out.println("File Not Uploaded");
    } else {
      org.apache.commons.fileupload.FileItemFactory factory = new org.apache.commons.fileupload.disk.DiskFileItemFactory();
      ServletFileUpload upload = new ServletFileUpload(factory);
      java.util.List items = null;
      try
      {
        items = upload.parseRequest(request);
        System.out.println("items: " + items);
      } catch (FileUploadException e) {
        e.printStackTrace();
      }
      Iterator itr = items.iterator();
      while (itr.hasNext()) {
        FileItem item = (FileItem)itr.next();
        if (item.isFormField()) {
          String name = item.getFieldName();
          System.out.println("name: " + name);
          String value = item.getString();
          System.out.println("value: " + value);
        } else {
          try {
            String itemName = item.getName();
            Random generator = new Random();
            int r = Math.abs(generator.nextInt());

            String reg = "[.*]";
            String replacingtext = "";
            System.out.println("Text before replacing is:-" + itemName);
            Pattern pattern = Pattern.compile(reg);
            Matcher matcher = pattern.matcher(itemName);
            StringBuffer buffer = new StringBuffer();

            while (matcher.find()) {
              matcher.appendReplacement(buffer, replacingtext);
            }
            int IndexOf = itemName.indexOf(".");
            String domainName = itemName.substring(IndexOf);
            System.out.println("domainName: " + domainName);

            String finalimage = buffer.toString() + "_" + r + domainName;
            System.out.println("Final Image===" + finalimage);

            java.io.File savedFile = new java.io.File("/tmp/" + finalimage);
            item.write(savedFile);


            LabelBuilder builder = new LabelBuilder(savedFile);
            builder.generate();


            out.write("<html><body>You can download your file by clicking <a href=\"test.xls\">here</a>.  You are responsible for checking to ensure it is correct and not an old version, or that word count was inadvertently used as the copy count.</body></html>");
          }
          catch (Exception e) {
            e.printStackTrace();
          }
        }
      }
    }
  }
}
