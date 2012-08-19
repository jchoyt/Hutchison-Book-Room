<%@include file='header.jsp'%>
        <div class="floating-text" style="width:600px;margin:auto;">This form allows you to enter a new book into the library database. You can try to retrieve information automatically from the internet or manually enter the data by hand. Choose below:
            <form name="form" method="POST" action="isbndbSearch.jsp" enctype="application/x-www-form-urlencoded">Search for books based on:
                <br />
                <input type="radio" name="searchType" value="isbn" checked="checked" />ISBN
                <input name="isbn" type="text" size="10"  value=""/>
                <br />
                <input type="radio" name="searchType" value="combined" />Title, authors, and/or publisher
                <input name="combined" type="text" size="25" value=""/>
                <br />
                <input type="radio" name="searchType" value="none" />
                <input type="hidden" name="none" value="this is just to keep the jsp happy - I use \"getRequiredParameter\""/>No search - I will enter everything by hand
                <br />
                <br />
                <div style="text-align: center">
                    <input type="submit" value="Submit" />
                    <br />
                    <br />
                    <input type="reset" value="Reset Form" />
                </div>
            </form>
            <br/>
        </div>
<%@include file='footer.html'%>

