


<input type="text" name="Allocation" size="75" id="Allocation" value="" readonly="readonly">
<input type="Submit" value="Allocate" id="Send" onClick="move();"/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<input type="text" id="tgt1" name="tgt1" size="100">//Second textbox
            <%session.setAttribute("abc", request.getParameter("tgt1"));%>

<input type="text" name="Comp_Text" id="Comp_Text" value="<%=session.getAttribute("abc")%>"/>
