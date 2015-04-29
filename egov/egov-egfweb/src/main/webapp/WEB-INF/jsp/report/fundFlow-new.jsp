#-------------------------------------------------------------------------------
# eGov suite of products aim to improve the internal efficiency,transparency, 
#      accountability and the service delivery of the government  organizations.
#   
#       Copyright (C) <2015>  eGovernments Foundation
#   
#       The updated version of eGov suite of products as by eGovernments Foundation 
#       is available at http://www.egovernments.org
#   
#       This program is free software: you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation, either version 3 of the License, or
#       any later version.
#   
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#       GNU General Public License for more details.
#   
#       You should have received a copy of the GNU General Public License
#       along with this program. If not, see http://www.gnu.org/licenses/ or 
#       http://www.gnu.org/licenses/gpl.html .
#   
#       In addition to the terms of the GPL license to be adhered to in using this
#       program, the following additional terms are to be complied with:
#   
#   	1) All versions of this program, verbatim or modified must carry this 
#   	   Legal Notice.
#   
#   	2) Any misrepresentation of the origin of the material is prohibited. It 
#   	   is required that all modified versions of this material be marked in 
#   	   reasonable ways as different from the original version.
#   
#   	3) This license does not grant any rights to any user of the program 
#   	   with regards to rights under trademark law for use of the trade names 
#   	   or trademarks of eGovernments Foundation.
#   
#     In case of any queries, you can reach eGovernments Foundation at contact@egovernments.org.
#-------------------------------------------------------------------------------
<%@ taglib prefix="s" uri="/WEB-INF/struts-tags.tld"%>
<%@ taglib prefix="egov" tagdir="/WEB-INF/tags"%>
<%@ page language="java"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib uri="/tags/struts-nested" prefix="nested"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>

<html>  
<head> 
 <script type="text/javascript" src="/EGF/javascript/fundFlow.js"></script>
    <title><s:text name="fundflowreport"/></title>
    
  
    <script type="text/javascript">
    function onloadFundFlow()
    {
    //alert("onload");
	<s:if test="receiptList!=null && receiptList.size()>0">
	var alertMsg='<s:text name="lastReportGenDateAlert"/>'+'  '+'<s:property value="openignBalanceCalculatedDate"/>';    
	alert(alertMsg);
    calculateFunds(document.getElementById('receiptList[0].openingBalance'));
    //alert("onload2");
    </s:if>
    <s:if test="paymentList!=null && paymentList.size()>0">
    calculateFundsForPayment(document.getElementById('paymentList[0].openingBalance'));
    </s:if>
    }
    function validateFundFlow()
    {
    
    /*if(document.getElementById("fund").value=="")
    {
     alert("Select Fund");
     return false;
     }*/
     if(document.getElementById("asOnDate").value=="")
     {
     alert("Select Date");
     return false;
     }
     return true;
    }
function   alertTheMessage()
    {
    var alrtmsg='<s:text name="fundflow.recalculate.alert"/>';
   	return confirm(alrtmsg);
    
 }
   

</script>
    
</head>
<body onload="onloadFundFlow()">  
	<div class="subheadnew">Fund Flow Analysis Report</div>
	<s:form  name="fundFlowReport" action="fundFlow" theme="simple">
	   <s:token />	
	<%@include file="fundFlow-form.jsp" %>	

	<s:if test="(receiptList!=null && receiptList.size()>0) ||( paymentList!=null && paymentList.size()>0) ">


<div class="buttonbottom">
	<s:submit value="Save" method="create" cssClass="buttonsubmit" />
	<s:reset name="button" type="submit" cssClass="button" id="button" value="Cancel"/>
	<s:submit value="Close" onclick="javascript: self.close()" cssClass="button"/>
</div>	
</s:if>	
 	</s:form>                   
 </body>
 </html>
 
      
      
      
