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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/WEB-INF/struts-tags.tld"%>
	<div align="center">
	<c:set var="tdclass" value="bluebox" scope="request" />
	<table border="0" width="100%" cellspacing="0">
		<tr>
		<s:if test="%{shouldShowHeaderField('fund')}">
			<td width="25%"  class="<c:out value='${tdclass}' />">Fund</td>
			<td width="25%"  class="<c:out value='${tdclass}' />"><s:property value="%{getMasterName('fund')}"/></td>
			
		</s:if>
		<s:if test="%{shouldShowHeaderField('scheme')}">
			<td width="25%" class="<c:out value='${tdclass}' />">Scheme &nbsp;</td>
			<td width="25%" class="<c:out value='${tdclass}' />"><s:property value="%{getMasterName('scheme')}"/></td>
		</s:if>
		<s:if test="%{shouldShowHeaderField('fund') && shouldShowHeaderField('scheme')}"/>
		<s:elseif test="%{!shouldShowHeaderField('fund') && !shouldShowHeaderField('scheme')}"/>
		<s:else >
			<td width="25%"  class="<c:out value='${tdclass}' />"></td>
			<td width="25%" class="<c:out value='${tdclass}' />"></td>
		</s:else>
		<s:if test="%{shouldShowHeaderField('fund') || shouldShowHeaderField('scheme')}">
			<c:choose>
				<c:when test="${tdclass == 'bluebox'}">
					<c:set var="tdclass" value="greybox" scope="request" />
				</c:when>
				<c:otherwise>
					<c:set var="tdclass" value="bluebox" scope="request" />
				</c:otherwise>
			</c:choose>
		</s:if>
		</tr>
		<tr>
		<s:if test="%{shouldShowHeaderField('subscheme')}">
			<td width="25%" class="<c:out value='${tdclass}' />">Sub Scheme &nbsp;</td>
			<td width="25%" class="<c:out value='${tdclass}' />"><s:property value="%{getMasterName('subscheme')}"/></td>
		</s:if>
		<s:if test="%{shouldShowHeaderField('fundsource')}">
			<td width="25%"  class="<c:out value='${tdclass}' />">Financing Source &nbsp; </td>
			<td width="25%"  class="<c:out value='${tdclass}' />"><s:property value="%{getMasterName('fundsource')}"/></td>
			
		</s:if>
		<s:if test="%{shouldShowHeaderField('fundsource') && shouldShowHeaderField('subscheme')}"/>
		<s:elseif test="%{!shouldShowHeaderField('fundsource') && !shouldShowHeaderField('subscheme')}"/>
		<s:else >
			<td width="25%"  class="<c:out value='${tdclass}' />"></td>
			<td width="25%" class="<c:out value='${tdclass}' />"></td>
		</s:else>
		<s:if test="%{shouldShowHeaderField('fundsource') || shouldShowHeaderField('subscheme')}">
			<c:choose>
				<c:when test="${tdclass == 'bluebox'}">
					<c:set var="tdclass" value="greybox" scope="request" />
				</c:when>
				<c:otherwise>
					<c:set var="tdclass" value="bluebox" scope="request" />
				</c:otherwise>
			</c:choose>
		</s:if>
		</tr>
		<tr>
		<s:if test="%{shouldShowHeaderField('department')}">
			<td width="25%"  class="<c:out value='${tdclass}' />">Department</td>
			<td width="25%"   class="<c:out value='${tdclass}' />"><s:property value="%{getMasterName('department')}"/></td>
		</s:if>
		<s:if test="%{shouldShowHeaderField('functionary')}">
			<td width="25%"  class="<c:out value='${tdclass}' />">Functionary &nbsp; </td>
			<td width="25%" class="<c:out value='${tdclass}' />"><s:property value="%{getMasterName('functionary')}"/></td>
		</s:if>
		<s:if test="%{shouldShowHeaderField('department') && shouldShowHeaderField('functionary')}"/>
		<s:elseif test="%{!shouldShowHeaderField('department') && !shouldShowHeaderField('functionary')}"/>
		<s:else >
			<td width="25%"  class="<c:out value='${tdclass}' />"></td>
			<td width="25%" class="<c:out value='${tdclass}' />"></td>
		</s:else>
		<s:if test="%{shouldShowHeaderField('department') || shouldShowHeaderField('functionary')}">
			<c:choose>
				<c:when test="${tdclass == 'bluebox'}">
					<c:set var="tdclass" value="greybox" scope="request" />
				</c:when>
				<c:otherwise>
					<c:set var="tdclass" value="bluebox" scope="request" />
				</c:otherwise>
			</c:choose>
		</s:if>
		</tr>
		
		<tr>
		<s:if test="%{shouldShowHeaderField('field')}">
			<td width="25%"  class="<c:out value='${tdclass}' />">Field &nbsp;</td>
			<td width="25%"  class="<c:out value='${tdclass}' />"><s:property value="%{getMasterName('field')}"/></td>
			<td width="25%"  class="<c:out value='${tdclass}' />"></td>
			<td width="25%" class="<c:out value='${tdclass}' />"></td>
			<c:choose>
				<c:when test="${tdclass == 'bluebox'}">
					<c:set var="tdclass" value="greybox" scope="request" />
				</c:when>
				<c:otherwise>
					<c:set var="tdclass" value="bluebox" scope="request" />
				</c:otherwise>
			</c:choose>
		</s:if>
		</tr>
		
		<tr>
			<td width="25%"  class="<c:out value='${tdclass}' />">Narration &nbsp;</td>
			<td colspan="3"  class="<c:out value='${tdclass}' />"><s:property value="%{getMasterName('narration')}"/></td>
			<c:choose>
				<c:when test="${tdclass == 'bluebox'}">
					<c:set var="tdclass" value="greybox" scope="request" />
				</c:when>
				<c:otherwise>
					<c:set var="tdclass" value="bluebox" scope="request" />
				</c:otherwise>
			</c:choose>
			
		</tr>
	</table>
	</div>
